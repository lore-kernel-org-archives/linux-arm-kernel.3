Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC7C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWz7OuqsDy/FzjRS0OiNSUvLi8xeYgzLLggshpzDzkE=; b=EObRLuePHKzaqefmOQkMWusYy4
	VaFTGXe1SOpthmpYsy2caV5WQSZ1lAhD05RO2Ni1kpjlYZIwn1rCkd/uC6QwrJ8K+S+b3e2RJcb4G
	KXHPAGYOr3QZHyl9CazROKqC0cTk4HYf+zCz2KOt2A/Q+bPujEAt2LTsWHhfOlGx2S5j1YZqIf87e
	BrPE4gvmL9ZX24f/GjARLYNNsjUI2jgqJ/UYuqOJGcWUNuJacg3mKFFZ5wxkse+w14wnd75MaJKGj
	7uUjM+qyTx25j9vJmg46rODEt1DpvBiG/IcVVQHy24lgAoD2owcaEoY9BSAs3mAy0tG1PQCDURpCx
	/bHxynOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzi3-0000000BKPO-23A7;
	Thu, 20 Aug 2026 10:09:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzhz-0000000BKOp-491J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787220552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWz7OuqsDy/FzjRS0OiNSUvLi8xeYgzLLggshpzDzkE=;
	b=AuUhz64+qdoyazBhe9QlMf0nIP4yBguG5KB5J49b9NxsgT9XmZXYAJoCQm2V4M8atj1s3t
	/zy+PgSWR8M66caSFQwEiGQJdgJGe5Uc4k/+slJm8F3GcNZxWBU1c1iaIgSuoW00sjfuhj
	VoDxGJGfsFHZr2QnH629i25pGR4TgMw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-IqxXsmc4MASBRkWX2kIbGA-1; Thu, 20 Aug 2026 06:09:10 -0400
X-MC-Unique: IqxXsmc4MASBRkWX2kIbGA-1
X-Mimecast-MFC-AGG-ID: IqxXsmc4MASBRkWX2kIbGA_1787220549
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49571407d1dso14074435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 03:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220549; x=1787825349;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWz7OuqsDy/FzjRS0OiNSUvLi8xeYgzLLggshpzDzkE=;
        b=lRf3IGPThdoUwALmujVqIjJ0wUFS9F+kisZt/Yw3ptsbemnNb68G2ZULbAri5nqK0g
         Z0N62Zw7HZhZCRvZFYtBcVjlvMhXRZuBDm7xBbmpRBrFtXt2TErX/L0s0AX1c8Jk3UdQ
         OIMeDgqknIfNgZuAdHwqw0abjcNLw4NnmO8O0MYGEkMFL2JWPqz8wh4h3Oie2S6zmz+Y
         2qZDNWVoq98QFsSxOXfjfHZrsQY3RwVZ3jDNelErf6jVD6vJ2CrAxgsluGubvN2B2E3I
         1b2GT8/6xi9Er/r1frbRRL2MxW4LUnDkZOKmD01byF+wBT4VMzuDmnf4xy/hj4LYFMPb
         N2Sg==
X-Forwarded-Encrypted: i=1; AHgh+RrQxipCPUADJavTUyrHt/OHn1UF2ceSzaBwMwHf33tGZp7zeGRLg9SmfQZKB3qr35LYXiMEtvqB7Nvs1/5BRc37@lists.infradead.org
X-Gm-Message-State: AOJu0YznXVaYtj2H50JmrZZFrWMCgZWV6w2BN2J0/Cmv61kFO6donbGF
	UKih5I4K1sCQ+MdSdrszuFwPCSIlvIarAagLid02DH/GVuMpoLQ3nrQ5QxD/u8NZCK/jNwzCoNE
	6I0lyB+DB5Ibb22DwUFG9g7AckIYXr0PgSMzyTvSU9/WqtxfG5k2E7jUqvtTfapNdjFMbCeMjHI
	UZ
X-Gm-Gg: AR+sD10cjMYZIiSclAi3I3uHQ//7d8nt9Xq9AdwpBeJxyHJmHSbCGDCzCEc7Si5T5dN
	CD/1IzfrahZhzsiCML1HauXos5m6ncmVgWf7lcNrNshna3n8BQc6gDHS285YkjziYaP6J8cVoS4
	qS+DFX08VdCtqtsVIZrkwc7MF36Jgfht0TBTL33URXs+TjLHJZ8DqTNqDQj2gZYy+MLTGzykv/g
	m/F5acZ1NqURgJDzVSQqu1EPEYMZPkTMjtiCgu+WKhfkcFsIAVHHjO8jNCf1Q9B9Hd4ZHep4n7X
	mHVheaOct0serCgJ4tyvJA4yGP8L7nrqJneU6b8EUkMwGn3fjNK59LcOS85WMsbUroZ0jF3oRf6
	mphQxEDx1d7zFhp+t9eGlGH8MJQWFeLS1/SB9jQwip1s=
X-Received: by 2002:a05:600c:3553:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-499aa1b0350mr172531395e9.8.1787220549257;
        Thu, 20 Aug 2026 03:09:09 -0700 (PDT)
X-Received: by 2002:a05:600c:3553:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-499aa1b0350mr172530735e9.8.1787220548689;
        Thu, 20 Aug 2026 03:09:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0dd5fcsm143802935e9.14.2026.08.20.03.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:09:07 -0700 (PDT)
Message-ID: <78d60d96-d0c7-4eaa-b425-ca4f75263b12@redhat.com>
Date: Thu, 20 Aug 2026 12:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] KVM: arm64: vgic-its: Free the caches when GITS_BASER
 changes
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Sebastian Ene <sebastianene@google.com>, Fuad Tabba <tabba@google.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260819102809.310708-1-fuad.tabba@linux.dev>
 <20260819102809.310708-2-fuad.tabba@linux.dev>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260819102809.310708-2-fuad.tabba@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H3HGVmr8wnZHHFhlrsJfboTj97CqaiT8d93PD8a3Xmk_1787220549
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_030916_129389_19D7BE45 
X-CRM114-Status: GOOD (  24.13  )
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

Hi Fuad,

On 8/19/26 12:28 PM, Fuad Tabba wrote:
> A guest that disables the ITS and re-points or shrinks GITS_BASER<n>
> with VALID still set keeps the devices and collections it mapped
> against the old table, as KVM frees them only when VALID is cleared.
> The table format is not architected, so a write with a different value
> is allowed to lose what it describes. Free the list whenever the
I don't really get "a write with a different value is allowed to lose
what it describes". A write at which place, in the collection table?
> stored value changes.
> 
> Test for a change rather than a write: its_restore_enable() rewrites
> GITS_BASER<n> from its probe-time cache on resume, and KVM reports
> GITS_TYPER.HCC as 0, so nothing re-maps the boot CPU's collection
> afterwards.
> 
> Fixes: 36d6961c2b481 ("KVM: arm/arm64: vgic-its: Free caches when GITS_BASER Valid bit is cleared")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index f6538b1976f9b..3339d9977af27 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -1649,7 +1649,7 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
>  				      unsigned long val)
>  {
>  	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
> -	u64 entry_size, table_type;
> +	u64 old, entry_size, table_type;
>  	u64 reg, *regptr, clearbits = 0;
>  
>  	/* When GITS_CTLR.Enable is 1, we ignore write accesses. */
> @@ -1672,7 +1672,9 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
>  		return;
>  	}
>  
> -	reg = update_64bit_reg(*regptr, addr & 7, len, val);
> +	old = *regptr;
> +
> +	reg = update_64bit_reg(old, addr & 7, len, val);
>  	reg &= ~GITS_BASER_RO_MASK;
>  	reg &= ~clearbits;
>  
> @@ -1682,7 +1684,8 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
>  
>  	*regptr = reg;
>  
> -	if (!(reg & GITS_BASER_VALID)) {
> +	/* The ITS driver rewrites an unchanged GITS_BASER<n> on resume. */
> +	if (reg != old) {
>  		/* Take the its_lock to prevent a race with a save/restore */
>  		mutex_lock(&its->its_lock);
>  		switch (table_type) {
One question: There is no vgic_its_invalidate_cache() in the function.
Is it OK?

Besides out of curiosity, why don't we go further and remove ite entries
that refer to removed collections in vgic_its_free_collection()?

Thanks

Eric




