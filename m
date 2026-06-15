Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E942BCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg7focpzst9R2YnOiFzthOKdkMIOtJaoIL+QyQMWpjc=; b=qWuh0j6OcTHVup3Iym7DJSjwgS
	tAp4YwC8mxyGGxbWFoHmFTsbof0QLgPPKqqw8CZeafaIuLq8YrqgUNyfViRPO5VuThEJkZA8kuaWm
	+WgHD7ec+N00W3Q65zFW4eMj8ZA7RfzFn7ZpBEKqqALFsY0MQoxaMmg7icIMrD3IxXdrj0/PF0p8Q
	edIYiQqRl8y9D62TXaalkzaLJCr5T7wqfg8XwR/Wke9SblbWSBAGRXLVj0KCT3Apchbp1rwcVYo2T
	y365/e3Kii7jMcGwyJfVEyVqT3inbstnqoFJ+/g/uOiDJZ8h4/CsWQaosYJx2/RHScCXLiWXX+iyh
	jafewQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ23y-0000000DoXY-3qPt;
	Mon, 15 Jun 2026 07:48:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ23x-0000000DoXB-0W9A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:48:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A648B1BB0;
	Mon, 15 Jun 2026 00:48:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E8FB3F915;
	Mon, 15 Jun 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781509732; bh=130tyfKNAu8zFNvpSe774fd5eUuTFedAwCdY4KRvrSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyiydL8atDQFxvv44Y2T47BtPwkChp6i8KbAY2qG3IiXhk81dgtB+wRbDrRfONhLs
	 3DZ+wt7i+EIKKU+wNfEzriO1S+/acmyKG8r4OfnRoWfqMxSxMQHaNUs6Id9cvTKEbC
	 y2qZs4mvkZEN4l81i7dTAzMS42Ud3bVtt/+bKfkg=
Date: Mon, 15 Jun 2026 08:48:35 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com,
	jonathan.cameron@huawei.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v3 02/24] firmware: arm_scmi: Reduce the scope of
 protocols mutex
Message-ID: <ai-uQZasZR_MCgSn@pluto>
References: <20260329163337.637393-3-cristian.marussi@arm.com>
 <20260612101525.340337-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612101525.340337-1-usama.arif@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_004853_199358_DD0581B3 
X-CRM114-Status: GOOD (  13.24  )
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

On Fri, Jun 12, 2026 at 03:15:24AM -0700, Usama Arif wrote:
> On Sun, 29 Mar 2026 17:33:13 +0100 Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Currently the mutex dedicated to the protection of the list of registered
> > protocols is held during all the protocol initialization phase.
> > 
> > Such a wide locking region is not needed and causes problem when trying to
> > initialize notifications from within a protocol initialization routine.
> > 
> > Reduce the scope of the protocol mutex.
> 
> I think this changes more than the mutex scope. scmi_get_protocol_instance()
> can now drop protocols_mtx after idr_find() while scmi_protocol_release()
> can concurrently drop the final reference, remove the IDR entry, and release
> the devres group. Does that leaves a use-after-free window around the returned
> pi?
> 

I have to review this mechanism in general in V5 so I will get back to
you on this once I have refreshed my memory on this own code of mine :P

Thanks,
Cristian

