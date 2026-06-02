Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DD6CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze0kNDk6g2fIlh+GS7Z/yQ6VYddrJB+PKpzcEjeF1PU=; b=1gVEFXHyDTc8x4InzDg1xv3YxQ
	RLnRgb9Ut72pT2sbedtyh1OLOYPIJpaJAM97AHd6yCjmllpzFAGhkpgGmqRhrCSH6cVgezFkDNOL3
	VxLWXFIYO1xefhZBypv3ItOHvDU2SvmQILW+iJ7HhmOU8c/G6niheB9z6KL9JBDgCeV9p4IKVSJtk
	YJPAhJHhGw7tPPVNpYPqzPzHN2Mi5CaJwKtmKq5Z9Y0nvwFaNC+8+Ijjh2IVISaISKXusWgAJxmgF
	toDPwxK2eDmLdVSu1zQ9JzdTJ+TlEE10C/kiNsw4rTFz7Jy1CjsrI3E2tAMnCyPufiGMU444XgPlO
	3tyKrBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWdM-0000000Dowd-39Bb;
	Tue, 02 Jun 2026 21:26:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWdK-0000000Dovy-489K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16A01601FD;
	Tue,  2 Jun 2026 21:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6DD1F0089B;
	Tue,  2 Jun 2026 21:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780435605;
	bh=ze0kNDk6g2fIlh+GS7Z/yQ6VYddrJB+PKpzcEjeF1PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KFwHDOgFvIhGuQcI+ESC5fZw6qjE8ld7genCRd/zpNjBooCmQS5a0A/NAntHb9aNl
	 7HPL4It0xnAM9X5Rn2oeMnoTHUWVDv3/pxh0qCql2xq1tS/eQDES3Hss0tsZqlrL4r
	 iCmxBdnQwfk/uVoIei8Iuz5ghvmKZ+vTQ3JVEkq0Lf3UErTx6YwGhhV3Wm6JcPSXZz
	 bUW5/pTfsD7XocB2uKoZYFTnPX6z8YN9Cz7iJVD0dy8I+IinFopnCMZSj2hkoSCDt9
	 PiG4pFn4T+tcX21l20/ursTZXm6L8pULwJSI5i3+ZMQhQXvq7+xvXV5RxYkN7IuCY0
	 6I289whe+O/XA==
Date: Tue, 2 Jun 2026 14:26:44 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic-its: Drop the translation cache
 reference only for the erased entry
Message-ID: <ah9KlG9agyde6Ipf@kernel.org>
References: <ah2c5lu4JbUg7dj-@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2c5lu4JbUg7dj-@v4bel>
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

On Mon, Jun 01, 2026 at 11:53:26PM +0900, Hyunwoo Kim wrote:
> vgic_its_invalidate_cache() walks the per-ITS translation cache with
> xa_for_each() and drops the cache's reference on each entry with
> vgic_put_irq(). It puts the iterated pointer, though, rather than the
> value returned by xa_erase().
> 
> The function is called from contexts that do not exclude one another: the
> ITS command handlers hold its_lock, the GITS_CTLR write path holds
> cmd_lock, and the path that clears EnableLPIs in a redistributor's
> GICR_CTLR holds neither. Two or more of them can drain the same cache
> concurrently, and if each one observes the same entry, erases it and then
> puts it, the single reference the cache holds on that entry is dropped
> more than once. The entry can then be freed while an ITE still maps it.
> 
> xa_erase() is atomic and returns the previous entry, so put only the entry
> that this context actually removed. The cache reference is then dropped
> exactly once per entry even when the invalidations run concurrently, and
> the behavior is unchanged when only one context runs.
> 
> Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 1d7e5d560af4..1e3706ac3b8e 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -597,8 +597,10 @@ static void vgic_its_invalidate_cache(struct vgic_its *its)
>  	unsigned long idx;
>  
>  	xa_for_each(&its->translation_cache, idx, irq) {
> -		xa_erase(&its->translation_cache, idx);
> -		vgic_put_irq(kvm, irq);
> +		/* Only the context that erases the entry drops its cache ref. */
> +		irq = xa_erase(&its->translation_cache, idx);
> +		if (irq)
> +			vgic_put_irq(kvm, irq);
>  	}
>  }
>  
> -- 
> 2.43.0
> 

