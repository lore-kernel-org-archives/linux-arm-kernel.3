Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6FACCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U6NhcLSDZ3innat6nTRKl9effWp6vv6Zih9DYqhlVo=; b=GtxMCDNZxwPQvgONl09I5PsmTs
	8ApuaqOgGxBAZW7bmcRIMt5Si7dAKEJw2wxyFNewTnCx80HsnYAWngO4aw7xlTHno1BpBZoUfmRL7
	a0efUsd5bWpWsK0w4urSzNYaTjRGRZShtceTBjZsWePuLYZAmd+8QW62amwB0UgY1RYxtlzxR3F1t
	i/bX9jzOjIOwfl7g51tS3SVmG3XwBwD/ft9lLVrbz5aiH70TmFzV4LS+gmPE0+dlQg/yqy1Ya37P6
	rf7otAznrCwXV5NajXvOiiLAQjhf2eWz3239363YpGaEVRok8r0t9ij1vyTJxzM0FDFBoFgQ1opL4
	BFXmZFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwMb-0000000A88V-2W5Z;
	Mon, 03 Nov 2025 15:20:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwMZ-0000000A87p-3rw1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:20:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24F8C1D14;
	Mon,  3 Nov 2025 07:20:47 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F8B63F66E;
	Mon,  3 Nov 2025 07:20:54 -0800 (PST)
Date: Mon, 3 Nov 2025 15:20:52 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 07/11] coresight: etm4x: Properly control filter in
 CPU idle with FEAT_TRF
Message-ID: <20251103152052.GX281971@e132581.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-7-690e69ae6977@arm.com>
 <da93580c-08de-4f0d-a05e-b5e2d34e8602@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da93580c-08de-4f0d-a05e-b5e2d34e8602@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072055_999233_85FFCAAA 
X-CRM114-Status: GOOD (  12.80  )
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

On Mon, Nov 03, 2025 at 02:30:28PM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> > @@ -1882,9 +1882,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
> >   		goto out;
> >   	}
> 
> > +	if (!drvdata->paused)
> > +		etm4_disable_trace_unit(drvdata);
> > +
> > +	/*
> > +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> > +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> > +	 * ISB instruction after programming the trace unit registers.
> > +	 */
> > +	isb();
> > +
> 
> 
> 
> >   	/* Unlock the OS lock to re-enable trace and external debug access */
> >   	etm4_os_unlock(drvdata);
> > +
> > +	if (!drvdata->paused)
> > +		etm4_enable_trace_unit(drvdata);
> > +
> > +	/*
> > +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> > +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> > +	 * ISB instruction after programming the trace unit registers.
> > +	 */
> > +	isb();
> 
> I guess these ISBs are not required according to the comment on the previous
> patch ? Otherwise looks good to me.

Yes, I will drop this in new version.  Thanks for reminding.

Leo

