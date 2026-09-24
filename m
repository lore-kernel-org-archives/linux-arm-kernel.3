Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAFDC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Etifw2tqT9ICxDurEfSG4oT+/ppV+8zZ5cdDwv4wIuo=; b=nrPQ3tZh+QMyHnIbM8wcTDMeVN
	xfObZgbugY1NfB7Z+gxyEawkq4qckwn5PkkKvylspteecaGZEf+PG3Vz9MOsBzP8K50CsI9ZYHayh
	6bX9vqBydG/RItGIr+qjv6PjEh8DXihv3qkQGXOioqae1BCeN+nSDkX0QYVcDufpatslrXMFdl3zD
	0YY3TTzYFCrkIkneLSSvzsSBX8ldYskTtqO9JIRAbAGEJPh3d60WIzodbrCgji9GXhQ9ouTMAvn1o
	zvNQ5/GjPXg11M56u9lQKk8oTPVWYwqqVh574HZ82tCCYM/Q147ybaS+JHnTkrwc9MwPRKhLREHI5
	agkaawRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fvc-0000000AbbQ-1pFq;
	Thu, 24 Sep 2026 09:39:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fvN-0000000AbTJ-2p4F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:39:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFA7C600AA;
	Thu, 24 Sep 2026 09:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5351F00899;
	Thu, 24 Sep 2026 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790242768;
	bh=Etifw2tqT9ICxDurEfSG4oT+/ppV+8zZ5cdDwv4wIuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQ0q+lRtq0CPdH6owlPg2DZW74wVwFesKIG7KxJfWYHqNP2rS5HJ1DPH2rV8LHkaN
	 6evRxFExNifGKC9SVWF4Kc6thtJzrg7uQl941MsmS3RZhcryN216cF5GDZUW7GDi9S
	 J9Zk4QXxeWmTU/fmoA5WmIpP07iFuEMtG7uv2JU8YEtqbA+BiznMZBWKbMoHRJ8i91
	 ZrwN6YuKj6yDFl4UvGBsAyFnw0vJx8ZFjZdSve7bKWHRAGeZH/tx7D+FZVZACFGhAn
	 NC9WDUOZhfJGpSNsCdCqwAlXXtsRQiLmKniN5iZPUA2N5hj8brsCteYqrqayfHp67F
	 FE9TOBmjoiteg==
Date: Thu, 24 Sep 2026 10:39:24 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Dat Mach <dmach@nvidia.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ACPI: arm64: FFH Operation Region support for
 FF-A (offset 2)
Message-ID: <20260924-tall-oryx-of-attraction-23ada5@sudeepholla>
References: <20260901192906.133670-1-jamien@nvidia.com>
 <20260922-purring-fennec-of-exercise-bbce5e@sudeepholla>
 <20260922155211.676134-1-jamien@nvidia.com>
 <20260922-exuberant-earwig-of-opportunity-4fecff@sudeepholla>
 <20260923124050.3270801-1-jamien@nvidia.com>
 <20260923-lurking-pony-of-fascination-ac6c49@sudeepholla>
 <20260923173240.3710620-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923173240.3710620-1-jamien@nvidia.com>
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

On Wed, Sep 23, 2026 at 10:32:40AM -0700, Jamie Nguyen wrote:
> On Wed, Sep 23, 2026 at 02:38:28PM +0100, Sudeep Holla wrote:
> > I did try to come up something simpler and independent last evening and
> > this morning, far from completion and I am also thinking of 2 main changes
> > to it yet:
> > 1. Maintain hash for receiver ID list
> > 2. Drop the whole FFA_VERSION fuss as it must be dealt with in UEFI and
> >    that should be sufficient.
> >
> > Of course not tested yet and even not sure this version is compile tested.
> 
> Thanks, this looks much simpler. I can confirm that both patches apply to
> v7.3-rc4 and build W=1 clean with ARM_FFA_TRANSPORT=y, =m and =n. The =n
> vmlinux also links with no transport-driver symbols pulled in.
>

Thanks for giving it a spin.

> On FFA_VERSION: as written, if the transport driver has already mapped
> its RX/TX buffers, I think DEN0077A R0216 has this negotiation return the
> Null version, so offset 2 would report NOT_SUPPORTED for any AML run after
> the driver probes. But if it's dropped, I don't think it's guaranteed that
> a compatible version will have been negotiated by then, right?
> 

Agreed, I need to think it through. I definitely want to avoid any usage of
Rx/Tx buffers here.

> [...]
> > +	memcpy(&args.a4, &buf[4], len - 4 * sizeof(u64));
> 
> This would trip CONFIG_FORTIFY_SOURCE's field-spanning write check
> whenever the region has more than one payload register. I think this would
> cover that case:
> 
> 	memcpy((void *)&args + offsetof(struct arm_smccc_1_2_regs, a4),
> 	       &buf[4], len - 4 * sizeof(u64));
> 

Thanks, will update.

Which version of FF-A is being deployed on your platforms ? Just wondering
if we can set v1.3 as minimum required here and use query negotiated version
feature of FFA_VERSION. It is not a must, just checking if that might simplify
things.

-- 
Regards,
Sudeep

