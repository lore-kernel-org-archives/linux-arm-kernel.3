Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE37CD74956
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Seqw1pj+s32EzkTxSRr1lPFhSWcfs+qzm8EZKw7fxvk=; b=wroP+JxBsqWSWn
	GL2Q0ULo+S84Xza48mOzwcSC1anGGO8VsZivTWhuoRWY0+H/mGKUZ2BcALq68t71gY6KnuA+oeZX/
	1C3IVeu8QnsYcMJ+yIWbiHZd3OCNFN3k4+QYaKEmhaWtmBHLUacfpO2B/C7MAjCGs82R/r2LFQsUp
	GutURsEpjzM5GkOHYO4ztVXW39dVERX94wwYeS9P0c9dE/lb8pJ21aVXjrDrMzz2e66fDT9XKvO0o
	oCAeSdmQMI0ARSrjNuOkybKAr5ltvrJteY8nOz6QrWQr0xjQM1i22o6T/U+b9vRp7JOd7EnB5wKXa
	GRvyOC9644qNJ8p03ndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTjI-00000009hGm-17ZI;
	Fri, 19 Dec 2025 06:12:44 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTjF-00000009hGN-3JJv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:12:43 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so396387241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766124760; x=1766729560; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Seqw1pj+s32EzkTxSRr1lPFhSWcfs+qzm8EZKw7fxvk=;
        b=SjP/5uFNXiZSR1v/Z5WtiJAkC3qvvawPK0nTBY422tW+usjtGtJi15xQntpbNm3q+L
         MYqtPdclgl21ornIw/p9GLcuRkk5Wwzbw3NoyYx1VwqGbYDiilvzMjuFE3LXMYKYZAeM
         AQo6rmQ/F5ItOcBHJbq2hmAxbPFiOCa6xAn7hE04RkWFMxTdNEAgW6CJp+bzc2jRc+sz
         YzSKl0gMqjHxc6IuhLzPScPUnzEAOREyz9KnYfixsgcpmySHLYeZGY6KhE/lV31sVi1T
         H37uyC2GCWJYqkdgv1rXvHLnEkKEMJBVOrY6Jon53vNs5q1pDKiLy/3HEXoomM03wRs3
         QTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766124760; x=1766729560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Seqw1pj+s32EzkTxSRr1lPFhSWcfs+qzm8EZKw7fxvk=;
        b=T1CPSuSH9iyy89g0WUYGgjHCX43XPlPj9NfNgk//bjGzcMCI8Xw7NLlbU/w8t5t9IC
         ++rIA4nbXF0dDWNMcjZzGCikb9MTiryrnTS1bJG52djozW8m0XogMpkzVj3rdy3ayjFj
         5yubJ9K+9+brFEjNdFbFukR1SqRV2fdtuAdynmnH9IlnX8W2DFwAFDguEbfdfhN6/WaO
         UWzRmIM/+gcDkN/yifGsHriiH0OknTX+AZVx72jI+dIH2OwQzXTqZuVUjv1MdQUfM8/a
         iW9mQ0VaZNtEaSIXH76b2czBtP8mlmT6+zDaO6+4To5Id/rT8GomUDQJbkvYN10VMT3T
         zWgw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ47j7tGpfApvsBjVNn6Xf4BfRWqfCBHMWzCwjf1utjsvI2uP18iqwjAvcYqPSlNZF18X+IrOMhh9uSPo2GuOR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv/DpZtrP9AoPVEFENfjh+Xn8+cVScaYUbWIKtXhIa7RWctJlk
	D2Ri8lamYusIbCADh7O50onQNUAk1sjNhoD6C5EMUqY521jDogG2H4Y79rGxfTXhHmoO51Xtnl9
	UcIg0+7igXKLHnV/TjwQD+j9MMF7KUYM=
X-Gm-Gg: AY/fxX4zRMQ77tEt+dsxD9RJjm2UEhH6xtJ2yYpm9DIHZQ9TrNJIZpI8fY7XEow/XYp
	jU5hAnyUYi5TAsakd5ACWNRR0a2ZYCA+aYWgnB+BUL4E7JO0e8KeQRiQoioNDgbyxJ3/1RTrLOj
	DZNObRXaxxNxm9OkcRdolzRLOjy/Bpq7wPY7WP7ktAAsR0Li/fp5IYdsX7aHF5a88e9E+IyDy/j
	FWya1t29FGjYLxFq1pX3fgNfYtEcZpPo5dPXzUxhN6WUqk8v+4+CIuHLKKBocp+0wwsUQ==
X-Google-Smtp-Source: AGHT+IHVAIB9EXt8ze8fpRH7DuJvrst/8Jm6U+PV/YkYRLVhKzfveCY9N+lLA5aRRN4x+/psgM/S/yxWdRr7JEYae2U=
X-Received: by 2002:a05:6102:32d6:b0:5df:c1f6:be44 with SMTP id
 ada2fe7eead31-5eb1a616edfmr463311137.5.1766124759992; Thu, 18 Dec 2025
 22:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20251219053658.84978-1-21cnbao@gmail.com>
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 19 Dec 2025 14:12:28 +0800
X-Gm-Features: AQt7F2ocTD4IJSx97glcMfCOzOn9j6QaEk9Mmx1rXjj179nhPKrWDK_ik_o0Wu0
Message-ID: <CAGsJ_4yKeUHgxRJJHiOcdaVcV1pjeHRjbybvEs5YLm=AJoe-Dw@mail.gmail.com>
Subject: Re: [PATCH 0/6] dma-mapping: arm64: support batched cache sync
To: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_221241_874054_585C09A7 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

It is unclear why, but the cover letter was missed in the
initial posting, even though Gmail shows it as sent. I am
resending it here as a reply to check whether it appears on
the mailing list. Apologies for the inconvenience.

On Fri, Dec 19, 2025 at 1:37=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> Many embedded ARM64 SoCs still lack hardware cache coherency support, whi=
ch
> causes DMA mapping operations to appear as hotspots in on-CPU flame graph=
s.
>
> For an SG list with *nents* entries, the current dma_map/unmap_sg() and D=
MA
> sync APIs perform cache maintenance one entry at a time. After each entry=
,
> the implementation synchronously waits for the corresponding region=E2=80=
=99s
> D-cache operations to complete. On architectures like arm64, efficiency c=
an
> be improved by issuing all entries=E2=80=99 operations first and then per=
forming a
> single batched wait for completion.
>
> Tangquan's results show that batched synchronization can reduce
> dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
> phone platform (MediaTek Dimensity 9500). The tests were performed by
> pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
> running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
> sg entries per buffer) for 200 iterations and then averaging the
> results.
>
> I also ran this patch set on an RK3588 Rock5B+ board and
> observed that millions of DMA sync operations were batched.
>
> diff with RFC:
>  * Dropped lots of #ifdef/#else/#endif according to Catalin and Marek,
>   thanks!
>  * Also add iova link/unlink batches, which is marked as RFC as i lack
>    hardware. This is suggested by Marek, thanks!
>
> RFC link:
>  https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/
>
> Barry Song (6):
>   arm64: Provide dcache_by_myline_op_nosync helper
>   arm64: Provide dcache_clean_poc_nosync helper
>   arm64: Provide dcache_inval_poc_nosync helper
>   arm64: Provide arch_sync_dma_ batched helpers
>   dma-mapping: Allow batched DMA sync operations if supported by the
>     arch
>   dma-iommu: Allow DMA sync batching for IOVA link/unlink
>
>  arch/arm64/Kconfig                  |  1 +
>  arch/arm64/include/asm/assembler.h  | 79 +++++++++++++++++++-------
>  arch/arm64/include/asm/cacheflush.h |  2 +
>  arch/arm64/mm/cache.S               | 58 +++++++++++++++----
>  arch/arm64/mm/dma-mapping.c         | 24 ++++++++
>  drivers/iommu/dma-iommu.c           | 12 +++-
>  include/linux/dma-map-ops.h         | 22 ++++++++
>  kernel/dma/Kconfig                  |  3 +
>  kernel/dma/direct.c                 | 28 +++++++---
>  kernel/dma/direct.h                 | 86 +++++++++++++++++++++++++----
>  10 files changed, 262 insertions(+), 53 deletions(-)
>
> --
> 2.39.3 (Apple Git-146)
>

