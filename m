Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E296EC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiRarzZEo+DAOz2DrrPnSsvHOB9lRxkU7v7Hr8mv/b4=; b=ERezBZtTDFthIMVcROd/b6NECo
	4FuQkJW0SK7V2ZlHWgW7zUhH786AQZ75KLYU8cwCtdFRlJu67pDIZzs/W1u18d+nI8SYo4r1ENhuJ
	naBlSFXcnTz04AzGW8LV4OHdHU22ihnDjkTP6W2tvD7bzzNvo/pDxS8b80ZDYvNgzK9npZi3r1VUx
	a24V+MjPnYLe6EHulRrfaBxQGKmVvfr39Hc+l6tWnmrGf+z1G6yInRBVcq6ZNZ+E2bAXDrE50VjIC
	bN5u3AVyLvrW2I2mSYTEysOUS8+h3Z0wedY3EjzSGpNp7oyJ+HRXXAUlYMmuGDzBxHMoa+rDeBTgy
	Sg/iQnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8ml-0000000GFyg-2010;
	Wed, 12 Aug 2026 13:14:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8mj-0000000GFy1-1T2g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:14:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB356153B;
	Wed, 12 Aug 2026 06:14:15 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E993F882;
	Wed, 12 Aug 2026 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786540459; bh=/Mr3bC5Q8kCOVh3qoyQ0+5KAEKLL04lUmM0yK72ZsaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nl/S3OSBZQYuw8kfWWZek0nQBIb6s5Yv1EF1NRuOmse06XTEn/PLthNmNCn3ohugU
	 ohBQvbkJuyUPQHXtOku21faVOi7O4lq5pVAeC3HuhwFbqQviO9DU3sYMWYYrtk/TKJ
	 DBT+XcUuD3e/1W2wJY0IIgW9gmID8rUR/wMHhODQ=
Date: Wed, 12 Aug 2026 14:14:15 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 1/4] KVM: arm64: vgic: Free gic_kvm_info on
 initialization failure
Message-ID: <anxxpxy6JXeyI2X9@e143914.arm.com>
References: <20260811150941.941295-1-sascha.bischoff@arm.com>
 <20260811150941.941295-2-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811150941.941295-2-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_061421_429152_990FC007 
X-CRM114-Status: GOOD (  17.40  )
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

On Tue, Aug 11, 2026 at 03:10:17PM +0000, Sascha Bischoff wrote:
> vgic_set_kvm_info() allocates gic_kvm_info for use by
> kvm_vgic_hyp_init(). When a maintenance interrupt is mandatory but not
> provided, kvm_vgic_hyp_init() returns -ENXIO before reaching the
> common cleanup path, leaking said allocation.
> 
> Route this error through that cleanup path so that gic_kvm_info is
> freed and the global pointer is cleared.
> 
> Fixes: 0e5cb7770684 ("irqchip/gic: Split vGIC probing information from the GIC code")
> Link: https://sashiko.dev/#/patchset/20260724104819.1296803-1-sascha.bischoff@arm.com?part=1
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 907057881b26a..65e203d6a2cf4 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -787,7 +787,8 @@ int kvm_vgic_hyp_init(void)
>  
>  	if (has_mask && !gic_kvm_info->maint_irq) {
>  		kvm_err("No vgic maintenance irq\n");
> -		return -ENXIO;
> +		ret = -ENXIO;
> +		goto out_free;
>  	}
>  
>  	/*
> @@ -820,6 +821,7 @@ int kvm_vgic_hyp_init(void)
>  
>  	kvm_vgic_global_state.maint_irq = gic_kvm_info->maint_irq;
>  
> +out_free:
>  	kfree(gic_kvm_info);
>  	gic_kvm_info = NULL;
>  

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

