Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE7C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5XVqIJKmTdNg//3T8VtD062hEHwYD3wbewTGcUQHww=; b=Btjnf8fLm59b0RbIGNroQfAnQN
	NW0bMeJ/maOjQio72ryVbk+YOq4OX2VL0ZpeG8MvL5KrabCSqkOIi37eoE/CfImLeP7ba6pSnCj31
	+/5/Nh6TKm958pKjux7dNeW8zp/sWCKASW/92DEHZG1Ly1VH3Uf7oiaRbXTPym7onUHF89xKwpW2e
	ZCWyjNKIhRu1dK9mqXN/HroyVv7wbxx6FjheWytbBh8Vj6/DfuFwY7X+0B9ByLQn/jOGXpCbc3tTN
	9yv1HOGxv+QrEUezGmXqxdVHk+OyLrIlwerQVzojbTgTkSkzOqS3NiRepKOXvhaQ29TlsKExVMiLC
	VrRozuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicj3-00000005uXM-3143;
	Wed, 21 Jan 2026 18:14:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicj1-00000005uWh-2gDQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 18:14:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47ee730612dso3935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 10:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769019276; cv=none;
        d=google.com; s=arc-20240605;
        b=aFZTs4udM2ykukYeVr3q29IqmSRa8o75vcBjnoGANP9WmhnA9eFl0pQyt56lDfOg3i
         l/T4MKrvvvLRBgYpLlHdMKIIjR6+sekPLqgOkGoR8taLQ6EV8VeWFMlSeCxkTBDI/xGh
         OjZGy9MQlXvhH+XBvn7EsSEXpCe3STzU/HQoe4tXzrAoHnjt3/B2OBjGmL7v1oTg3lAO
         /1EEfHZH6opKUZFwRDkgM8IgiyIfXiZiLQ9+oM25j1Zu9Z6SaK9+XYwGK63is1yB5Y7n
         KrmAftAcmQDFPoPd4G2VsiIpMSt9txVZuwCgaDhZhZFrtmL4X8vuPSm0q0AffimRHHPn
         emKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p5XVqIJKmTdNg//3T8VtD062hEHwYD3wbewTGcUQHww=;
        fh=BMDngvLyZ8R4bHSsqQu26/NU4cRmcM580OwyBoV0Zts=;
        b=CeLqij5e+jmfTi0vJQjKPrBmuNWL4xlv/RRss4X55fS1Akp9DdaRJ1hvs4VJ67K4/3
         KGmJi9UMF0xiVYKUAGhfxJnUzt0oXeMT8+lEbaE9pDHK9v/zuAHM0BUhp0tPkJ2fOR4D
         Uk/xZ0/J779l3Ui8cz7wM/kbKWVaYIWdrskhxVuJUlTQNzbvlFX3zR+i6KA9qitjj5iu
         5Yu2bvkm4EPbEZwztIIyrCSLNfzgR5oOzHlTlF6SEZA1dd09JXl0fVJrCuJr4OyeURp/
         MMnZOg7fGKFDrrE4+3pp6j1nQh2AowzwStIbfd+CHO5RZYD2ICN9ScAIjfto49zp5WWS
         Ymdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769019276; x=1769624076; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5XVqIJKmTdNg//3T8VtD062hEHwYD3wbewTGcUQHww=;
        b=EAqT1eaNe4AA6x7nFWFcbueBHPV1Ay8sbGgwGf4n0P5UZkgDV3lnq7pbVt9TdoC3CQ
         4N2Qxl7f4l2iozjG50KUJVGwomTTe9x0z3pRg4vO+caRDz517UCXjbR0n9y9nIdjTin4
         feuuSLpE6CJ2r0F5EciFprLAMdZ0FFYTNqRl8+ipYx1/jtzzv1OdzX+GBp7y1OKU8Lxi
         gZjuSGwpVKgJ0O7FTSilP9y572D+J7lQfkiPHWUCRky4DVHmVvSZIzmJ/7dMDP8XFA+S
         CiUN6IpHBzvmqHnDtHy+ETaxx1FXSdieCtttDDXAOno49uaw18ZOUaiwD4pg/SGz80e0
         wDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019276; x=1769624076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5XVqIJKmTdNg//3T8VtD062hEHwYD3wbewTGcUQHww=;
        b=AY8FG5BBpifUMrvpgW+bHadiNnR36PAS0vvsHisLx9v+vkBJtY1DGR17GashRCSsc0
         6xqn3aB4Q02te7wdgJkxzwgeDS9KQby5fAc0UmUcUPUYXa8WkIWcud7hSE9eG4T+k/Wv
         grVdvOmCpywzpAannPNo9vbTN+f21XwNNAFxCZMOKd81EXzkXlwd5/k42Cbkex9UgEab
         bZWB3d/HlEH3HnDRjfwJt3c7f481QT5kiL6aRAJ2yXKVQyutn2EB2jrJf9tOCHcSg/w6
         GiSIEjVQAFVMTDRny16KAKRafwK6Wg48FtxbvC/KysVpjwyzTQ+/uGLcdvZIM4idgGmB
         KYew==
X-Forwarded-Encrypted: i=1; AJvYcCVXDyfCQu5Ml52V4KwFpFdFLk7nbkdZVE0wd0Enf6VF75KEfZulr/p5mVHZ0nVv50alP9Clvo/5wirZd8+0Gd/y@lists.infradead.org
X-Gm-Message-State: AOJu0YzJYFqDEYJd2GfQYTuv5WnSrNQklDScqhyySC2KODyv0xPSKF08
	yqUwt1ptu5kAilhIuthhWH9lxauf5ooJbPrgKhF6H2xhodsYpNlklVt/Z3kjs64/TNa2ZrUgEcc
	pScwuVgXD0IIpD10MtZNqg2LdgU08sRoRjTRtjZJ5
X-Gm-Gg: AZuq6aIYy2CYb3D0WPi1KXDcsoH559opTGD0oQw7uWWDPGLL3WuhiQv/pnEhmKkHRw+
	TRoOnUHYL4dg6aprZP7HCThUxxy9eCGARjukXctOxjQiZEhHNcoq4wT+SbzDKoHXrsOiAgpLCWa
	lwMQ/BEOeoW1bSYJjpy8EVX3VhgoC8RV9Sd8LWZ9uWWM5r3d1qLxDSU9pNhM0hnQ2A3CbFShtxi
	DcD3uA4fL+yBoMiJ61lFCfvZnpGurmDUNCKqLO10vl72kiRGP+m7swqopsR9sgeYAJtTvHv
X-Received: by 2002:a05:600c:6384:b0:477:563a:135c with SMTP id
 5b1f17b1804b1-480477b51a1mr26765e9.0.1769019275979; Wed, 21 Jan 2026 10:14:35
 -0800 (PST)
MIME-Version: 1.0
References: <20260119105651.255693-1-maz@kernel.org>
In-Reply-To: <20260119105651.255693-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 Jan 2026 18:13:00 +0000
X-Gm-Features: AZwV_Qh_YeP54R4FLco28FynJf9u8bOykNrY9GWkuwWxdnhQ-4o8kYRPJgfG68U
Message-ID: <CA+EHjTzN1hUZCW_muHwapRQopFaju-zRPZygxKoyfYS1XSYNSg@mail.gmail.com>
Subject: Re: [PATCH 0/6] KVM: arm64: ... and FWB for all
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_101439_702779_B56C454C 
X-CRM114-Status: GOOD (  23.87  )
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

Hi Marc,

On Mon, 19 Jan 2026 at 10:56, Marc Zyngier <maz@kernel.org> wrote:
>
> [Yes, you can tell what I was listening to]
>
> Today, running in protected mode puts the host under it's own S2 with
> FWB=0, even if the rest of the guests are running with FWB=1. The
> rationale for this special-casing of the host is that we want the
> combined attributes to actually reflect the ones exposed by S1.
>
> We therefore use NormalCacheable (which is the weakest memory type) as
> the default attributes at S2 so that S1 can only strengthen the final
> memory type.
>
> But there is no reason why we cannot achieve the same effect with
> FWB. We normally use FWB to enforce cacheable memory from S2,
> irrespective of S1. But it is possible to configure the S2 attributes
> as "pass-through", so that the S1 attributes are always used.
>
> This small series implements that change, adding a flag that actually
> describes what we are trying to do (instead of the NOFWB flag which is
> pretty obscure), and fixes an interesting gotcha with CMOs.
> Interestingly, CMOs never actually worked with NOFWB on an FWB-aware
> platform...
>
> Patches on top of 6.19-rc5.
>
> Marc Zyngier (6):
>   arm64: Add MT_S2{,_FWB}_AS_S1 encodings
>   KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
>   KVM: arm64: Make stage2_pte_cacheable() return false when S2_AS_S1 is
>     set
>   KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
>   KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
>   KVM: arm64: Simplify PAGE_S2_MEMATTR

Glad to see the host is no longer pulling the shortest straw on memory
attributes. ;)

I've applied these patches on top of the pKVM Android branch (with one
small fix to the Android pKVM code), and tested it with qemu on cpu
max (fwb) neoverse-n1 and cortex-a72 (no fwb).

Tested-by: Fuad Tabba <tabba@google.com>

Stay tuned for the reviews...

Cheers,
/fuad






>  arch/arm64/include/asm/kvm_pgtable.h  |  7 +++---
>  arch/arm64/include/asm/memory.h       | 11 ++++++---
>  arch/arm64/include/asm/pgtable-prot.h |  4 ++--
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c |  4 +++-
>  arch/arm64/kvm/hyp/pgtable.c          | 32 +++++++++++++++++++--------
>  5 files changed, 39 insertions(+), 19 deletions(-)
>
> --
> 2.47.3
>

