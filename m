Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8212C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvuVbyENZ4auhSLsZXmdZPBYLBDDdSjtrpm9K0VajbE=; b=apUVwhDhNGwoJU8J/NFSXVGpbk
	EXomjB+mvjgRTZb8Lltxz+lud0GOEJ7W27ffq0CudfzdpMOIyW6BOb5NQWgkXU7nnVhhivoJGaCDU
	mN92aYYC/IwphXFkwU9UuY4LAVuNdkJv90tPzvkX8PW0e1gNFAW9EovE8vx3IhOUV+wXf/Ypxm+J9
	UFTg2ZxDHUu4Zn/t4rYsEZ4QIZAuLZsTm/TZgPMX92Ck1OGEDIE+SDMaYv1CtWIYQ5tJ0xMwA5oTL
	fNZ0xMiFBsr0ub2XQw6u0S1onBw6znR0LPsc0qXpyoG+wR/ckwwVL4Zznd70ABH1hYNd6aShvw+1G
	b5kydDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKPc-00000000k6F-2uj6;
	Tue, 04 Feb 2025 15:00:28 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKOH-00000000jdz-1TZh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:59:06 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6e41e17645dso12696296d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 06:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738681143; x=1739285943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvuVbyENZ4auhSLsZXmdZPBYLBDDdSjtrpm9K0VajbE=;
        b=CPHFz0g15FoJ2Edgb26vpNx3oA97QxSlGlAtl4CRKfbcjuWKWY3w3ie7vGIYVpJCQo
         gkyovN89Uc4B9Ga8c0WzmQwp+NEglI+EbtKvngaXGyX7eP8aG6311f5cRqAgDYVhhnMb
         8niO5KbBdfmU6XTaS0gwqpPKqab2EUj4xkQ073bjFMrnKnJNJwxvipCMFTf5bezy1ldC
         E7PaRZcDEaeWANpoGxRHjdXi25YDnd2qfZ+vciIo0FxjZcGjBnYKNiaVWT+14K/FoqC5
         JcjtzENRaePKzYS4an70XqaQfaQ+3lPquLZz+z/OZl3986bqA79FP/GLq6dULPfR1cIg
         VrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681143; x=1739285943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvuVbyENZ4auhSLsZXmdZPBYLBDDdSjtrpm9K0VajbE=;
        b=peAEAySKmr9CAwjGgppVqGSaiZYHzz4aqc1vnJwIPwRPv5Fizq1O4xShxstdYI7UoJ
         YJV4E5CyGIGYuLnHgLmLlPH5fTPcCo/A7up/9MEqS0HELiTeB+VZd3z3TOet6RMlLCGo
         ReY5qMd6FeUQ4HF0qjxJNcdVlxPPnzyK4CcyJzAqCHcblMicWvW/m9XQ+YCl8rQP3IDW
         Msvsd9j0lsKQc2+ASSyWcy4azRc7VBdNFooUywO9guT/aWMgScJ3fFGSToF+iG8rXaZz
         ymu1pav8cNjLQig5ITvt91Vr2LRwCuCtjn6rJ6bhjEygbieWjx+HpIR02yDLM1e96EpQ
         pfOg==
X-Forwarded-Encrypted: i=1; AJvYcCUMzFkokmw+eAcAkGOJp/I17jOdU4SkYCfQ32+C+AqlGjDEhybcrdgiJ4tGHTs/+pUfLR1QPsUs7vm8VJ5cnBYy@lists.infradead.org
X-Gm-Message-State: AOJu0YwxoNjeDy8nNqcrRmo55y6QplicN8N/xhGAOCX32d5nMLRr/Su0
	RA0ny30OKvq/1o8x0zDz9aV3rwUzlVncQfkaslIV8SnYCn9e60+9WVK0DzE45JZzW64/je42iIv
	iJGIe963aPH67AUQC5TxndLVruh79k9TmCd4g
X-Gm-Gg: ASbGncu4Ld+wT+xhbJEx0JIPW0NE+HHbbA4AG9smRLIkBQij9XyOys7uKVPfuwsLS7M
	3ua6S1x9j4cJA0ZKZpvowo8lSa5pcD3LTrhL11WVvwfKXXN5TkQyGL8wYVqA9g3OvimEZEFQrsP
	jSVuC/FpnGu/Qwhl1wSgjz1d4cqQ==
X-Google-Smtp-Source: AGHT+IFAhabLVqsirEZQFdf7e3ceBagVlafz436gImWiXVQGRtoLiOgMD/iOF0PfOb3rV65x0lqUxFOlRvQqftx8+IQ=
X-Received: by 2002:ad4:5c61:0:b0:6e2:3591:7681 with SMTP id
 6a1803df08f44-6e243b98b34mr367364176d6.9.1738681143177; Tue, 04 Feb 2025
 06:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20250204145554.774427-1-maz@kernel.org>
In-Reply-To: <20250204145554.774427-1-maz@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 4 Feb 2025 15:58:26 +0100
X-Gm-Features: AWEUYZnrGwt3ZpWNwPxhZyqhgOTVIxqgbyE89lIt7Pj4mLTXRn01AniRNLX4-Yw
Message-ID: <CAG_fn=U4jKE_D-YAyGOxAnYVudwU1s_qQeR29MZ6uZR_voPJZw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix nested S2 MMU structures reallocation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065905_386446_C5F9EDDA 
X-CRM114-Status: GOOD (  13.19  )
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

On Tue, Feb 4, 2025 at 3:56=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> For each vcpu that userspace creates, we allocate a number of
> s2_mmu structures that will eventually contain our shadow S2
> page tables.
>
> Since this is a dynamically allocated array, we reallocate
> the array and initialise the newly allocated elements. Once
> everything is correctly initialised, we adjust pointer and size
> in the kvm structure, and move on.
>
> But should that initialisation fail *and* the reallocation triggered
> a copy to another location, we end-up returning early, with the
> kvm structure still containing the (now stale) old pointer. Weeee!
>
> Cure it by assigning the pointer early, and use this to perform
> the initialisation. If everything succeeds, we adjust the size.
> Otherwise, we just leave the size as it was, no harm done, and the
> new memory is as good as the ol' one (we hope...).
>
> Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mm=
u structures")
> Reported-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Tested-by: Alexander Potapenko <glider@google.com>

