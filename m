Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC1AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NU20LOmEcJq1+DNP0ilpaHhdHSr1lBHqjsJHqUFrso=; b=4wMEciEIPcM+OXujsGDF/7bEBT
	23+XomCiijtUtrgRsIsIRLIq6QUldvGeCk83I7pmZ+CMjfcjW5pYe5BZgFQUvPnaiDYOM0aekA/cF
	+9AecpiVJ/01jBnNM8IC6+/xb1QLLYGF72O32uV32IcaYQeBFs43POGSpD4w/RubrSWGq6wha1s4N
	6cYu0SCB1hyEW+j11wng4gvQmp4lAXsqzeBVzxtg+jEsDrD3WZsRq3BrL23AlRUbTo2Z+7U0czTME
	D1TLDnGzGAfb7QavDLENWkt2XuyotIXxt3YEyk8JdjqxLSYvtTJ63RnKDl9EKQF4NoOz67abU1tl2
	yq9M3ATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAXb-000000076A6-3QGd;
	Wed, 12 Feb 2025 11:04:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAQn-000000074zJ-3ACE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4606812FC;
	Wed, 12 Feb 2025 02:57:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75AE63F6A8;
	Wed, 12 Feb 2025 02:57:24 -0800 (PST)
Date: Wed, 12 Feb 2025 10:57:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/18] firmware: arm_ffa: Add support for handling
 framework notifications
Message-ID: <Z6x-kXUb9bvFOUco@bogus>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>
 <20250210101743.aqbhqqkdbvka2i46@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210101743.aqbhqqkdbvka2i46@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_025725_850643_3F4E61B5 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 03:47:43PM +0530, Viresh Kumar wrote:
> On 31-01-25, 11:24, Sudeep Holla wrote:
> > +static void handle_fwk_notif_callbacks(u32 bitmap)
> > +{
> > +	void *buf;
> > +	uuid_t uuid;
> > +	int notify_id = 0, target;
> > +	struct ffa_indirect_msg_hdr *msg;
> > +	struct notifier_cb_info *cb_info = NULL;
> > +
> > +	/* Only one framework notification defined and supported for now */
> > +	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
> > +		return;
> > +
> > +	mutex_lock(&drv_info->rx_lock);
> > +
> > +	msg = drv_info->rx_buffer;
> > +	buf = kmalloc(msg->size, GFP_KERNEL);
> > +	if (!buf) {
> > +		mutex_unlock(&drv_info->rx_lock);
> > +		return;
> > +	}
> > +	memcpy(buf, (void *)msg + msg->offset, msg->size);
> 
> Can use kmemdup() here instead.
> 

Thanks for the suggestion. I have fixed locally. I will not respin the
series if there are no other major changes needed, will apply with this
suggestion included directly.

-- 
Regards,
Sudeep

