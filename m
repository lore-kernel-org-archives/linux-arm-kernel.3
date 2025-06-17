Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BBAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=snpa4M8wvjI3Jt75dD0dm1cl3ZvZlE8jLqCZvwug+5E=; b=3p7YFyvhvytJqoYKfoLlfxXBo0
	RSOmwJKxRTb2k0ugZmse/IDZX289QoK12myIwb1DPDl4d4zHNukGzVzme0GXevTeQfOlvXZ2QjpDj
	UKexabz2D19SV4ulsC5glJd2UWbBNuuzo5jJYCSxs/82nJnpDU0HSUZivJqmDKeQdvXVI3YpPkNbw
	DDcw8jceSidEwKa5WVGk2n+p+LZIU3ECu10uTFo1GEfO0m1Y7Fi8K2FzLxfbMKwrPdXHClKwoJSe5
	2BJpc7+CqzCH0WHN+pg48wtkJ/5r4YWDejL1rJUCBvIubCi9Gl8CkObktIjf5PfJr8i9ErFgnxJFe
	qdnNe7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRBx-00000006W5N-0lK3;
	Tue, 17 Jun 2025 07:57:13 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRR9e-00000006VqL-1Ts8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 07:54:51 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ade750971f2so695110366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750146888; x=1750751688; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=snpa4M8wvjI3Jt75dD0dm1cl3ZvZlE8jLqCZvwug+5E=;
        b=lfVKLiI+blf20Yt/Yf1vsm68xUNT9nMP1KRPY5c6hJAAjfOxO1M3J0KfwMOTRBA7zw
         RpwaLewcfG6AC8BecVt5Eg1t7ANTAIYUjlGU90vxQlHk8iOxju/iv33+ofHsmxdlKDmt
         uQYvJ2s2hMdwe+vRYRM4koWbCdq0NEpJwWngE+gv7KqHXEb1tQXablXheIi7duLZFbwu
         0+RiCyvHmf4OyZ0m9Bpv2ziq+EMsDTfPpVtqc3fDygGo5w+3C/R8kBty/d66IT43MtFX
         5oXO2GLmFZTAYgGdkFghLQFCgzFDRK6TeLD/BZR1L9aDv0RQfk7I15l+eQlnRGuPqhXI
         tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146888; x=1750751688;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snpa4M8wvjI3Jt75dD0dm1cl3ZvZlE8jLqCZvwug+5E=;
        b=r+EeSxc4vSc7bc0+cmUhRt2njUO/nLQH5HPbSumQ2knQw+8oMNVaEF5zb/T7uV4Kip
         HTqZtrAuxLcUMWamHPhaK5hKe68uP4fFjSgVaOp0Q90Zk8QAbBPAa33r3cuTI5Tt5A4u
         5nAJeAPociVagn12YJ9nuiFMsRiAdNwcHlub6woG2lHtTFsNbgzoJUg5I+sg7beh/qBu
         2qid/0oSp/yo+tvAeaTnkx6KqXVpqLcJAHrIMoyu5i32ATHubb9LsltKZWT/IMav03RH
         W8cH6STAmbw1n9dcTBx1lBKqpCSiMbEeHVycgzOyrm7mx/nNKUhzRCicZ94WdKX3fJY0
         /ZMA==
X-Gm-Message-State: AOJu0YwGcqFtmRoSYxUROy2AP6+HGXTWWyA5Cl2kbQJXFhxVBiDz6vyE
	D+JMYiX+fYsn4QRJ6VzUG3aFZ6a09EzLBbv3rbibqauSo9+V4yySHWPIEavvpFSO
X-Gm-Gg: ASbGnctkULJ1JY3wX2QVSzCq2HoG/fBLP8RHHe5RATEFFdTcNU69cC7Ri5LSGoDSNLi
	fNvtwikljoRIkbR2G9QEV9O0FpEg2arqof/9s3pqhFV6P47je1d1/kIQ0QPmYTOsd1S6l77s/z9
	O0wEG8TQG76EYCrFH5zLFCKN9WK8/pY+5/7qDZzoKJw5ybdxEO4neDaG9voYLlMt/UvyQsvFBtg
	r6sazPuSScgXf5UbTwnm8afDDZnaUXtUKDkKG9U834lgg2V4eY/GSrhiX0PWGoekQD8aeScIt1R
	Wjf/KauAAYwk0lp41LJwbqQq5Sp5nvgZDT7Tac9a9INmDueBpAoP7O+hpQh3RUIwONKIvJ0=
X-Google-Smtp-Source: AGHT+IF0cbDvyG9t5QpTq27y/7w+0VC3HoZnhZqn97hCN4lYvqiTDzZEXF27gVaRsT2gnTXMxW0ZoA==
X-Received: by 2002:a17:907:2da9:b0:ade:4121:8d3f with SMTP id a640c23a62f3a-adfad29dd50mr988779666b.8.1750146887636;
        Tue, 17 Jun 2025 00:54:47 -0700 (PDT)
Received: from [10.3.15.29] ([217.19.38.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81bb9cesm807842966b.49.2025.06.17.00.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:54:47 -0700 (PDT)
Message-ID: <43a834c8f871f8719368b3f3239f27ee4f6c6286.camel@gmail.com>
Subject: [PATCH] ARM/dma-mapping: invalidate caches on arch_dma_prep_coherent
From: Christian Meissl <meissl.christian@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@lst.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Tue, 17 Jun 2025 09:54:46 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_005450_393072_AC250C39 
X-CRM114-Status: GOOD (  11.80  )
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

since switching to dma-direct, memory using DMA_ATTR_NO_KERNEL_MAPPING
is no longer allocated using the arch specific handlers and instead
will use dma_direct_alloc_no_mapping. While the arm specific allocation
handlers implicitly clear the allocated dma buffers and will flush any cach=
es
dma-direct relies on ARCH_HAS_DMA_PREP_COHERENT to flush the caches.

Without this flush video frame corruption can occur in drivers
like the coda v4l2 driver which explicitly sets the DMA_ATTR_NO_KERNEL_MAPP=
ING flag.

Fixes: ae626eb97376 ("ARM/dma-mapping: use dma-direct unconditionally")
Signed-off-by: Christian Meissl <meissl.christian@gmail.com>
---
 arch/arm/Kconfig          | 1 +
 arch/arm/mm/dma-mapping.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c..7a3aaf3a490b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM
        select ARCH_HAS_DEBUG_VIRTUAL if MMU
        select ARCH_HAS_DMA_ALLOC if MMU
        select ARCH_HAS_DMA_OPS
+       select ARCH_HAS_DMA_PREP_COHERENT
        select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
        select ARCH_HAS_ELF_RANDOMIZE
        select ARCH_HAS_FORTIFY_SOURCE
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 88c2d68a69c9..bde7ae4ba31a 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1821,3 +1821,11 @@ void arch_dma_free(struct device *dev, size_t size, =
void *cpu_addr,
 {
        __arm_dma_free(dev, size, cpu_addr, dma_handle, attrs, false);
 }
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+       void *ptr =3D page_address(page);
+
+       dmac_flush_range(ptr, ptr + size);
+       outer_flush_range(__pa(ptr), __pa(ptr) + size);
+}
--=20
2.49.0

