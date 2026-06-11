Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72853CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzOuKfVhDygfmrADr+dIOSj+zx2ddb5UDEjMO/pqa5w=; b=HA0uJUr8IAPN8DtWftZ0xpxb1i
	Hpg2nVJpKZkhpoIYNX86x0x63C9GRld3wMgXcy8iCcAffUIp4UVJTIJU2Q+yXOW492D0FgO8r/FKR
	lbEEU5UVVrSZawzN+txIiomDgYQTj9PP52fa3bOyhxVkUj+xqgPhQJBqnHomukX/ZUUiTqtbjDeKf
	d6nTvg054UoEMfdy7Rp+vhHloRtn3Ujuq4BttNLaVW04Rf4fpcykXhazyMG5dDLOz7fG4tHAJZjIJ
	Lr0Upz1khrAdUVtR2mJw7ICrTg4uSvjYJje+ApxwBJ+HDbk+gWZ+6+LmREoSlOE8/io57tpWt8qGT
	ZaKaQCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdSu-00000009IXZ-0fGY;
	Thu, 11 Jun 2026 11:20:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdSs-00000009IXC-0KXc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:20:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB2E1E2F;
	Thu, 11 Jun 2026 04:20:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E013F99C;
	Thu, 11 Jun 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781176846; bh=OFh1/b1LnIhEhCvfR3RACSxZDLRFac2VAuOc7+DAECk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHNKcILqIFkwUeM49WMED3f412FnavaaFcuc6S4n/B3nBaxYKbfPjGfPdFeFd3vY9
	 tzKsWYTHy1CE/C5YGoqWO3ZcCYqK0wEkjpd9MrmgnygBJ50Zmc8W7EZG0snbe0Zbfb
	 88u1V3NDF8+B+sxd4Gv0DQ0+WQ33JRE7IckMj7S4=
Date: Thu, 11 Jun 2026 12:20:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Use common error handling code in
 __scmi_device_create()
Message-ID: <aiqZiv995sbvcBjq@pluto>
References: <545ffb86-55f5-46b2-83ca-285cd8d540d7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <545ffb86-55f5-46b2-83ca-285cd8d540d7@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_042050_157752_B0EE5737 
X-CRM114-Status: GOOD (  19.70  )
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

On Thu, Jun 11, 2026 at 10:34:52AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Jun 2026 10:27:45 +0200
> 
> Use an additional label so that a bit of exception handling can be better
> reused at the end of an if branch.
> 

Hi,

> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/firmware/arm_scmi/bus.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 793be9eabaed..8c20ed1a8243 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -450,14 +450,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  		return NULL;
>  
>  	scmi_dev->name = kstrdup_const(name ?: "unknown", GFP_KERNEL);
> -	if (!scmi_dev->name) {
> -		kfree(scmi_dev);
> -		return NULL;
> -	}
> +	if (!scmi_dev->name)
> +		goto free_scmi_dev;
>  
>  	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
>  	if (id < 0) {
>  		kfree_const(scmi_dev->name);
> +free_scmi_dev:
>  		kfree(scmi_dev);

I can understand the aim, but jumping in the middle of another block
just to reuse the cleanup statement is far less readable (and ugly)

Cleanup handlers probably a better solution here...but I have NOT looked
at all the sorrounding code here recently...so I maybe wrong and keeping
the current code could be even bette.

Thanks,
Cristian

