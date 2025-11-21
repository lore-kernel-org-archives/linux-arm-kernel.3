Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC36CFC512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 23:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxtDpSmTs7mL/tjhVCGhuXCnOSYOMYknzMq2xwvzpN0=; b=zZTG/zDCcd7tQ8
	thoaljh6T+KGMmN54ma+dNMIg9sQKGdpiL3ycc0o03uNcszcG8rmsI72o3pvh5yIH1Dx+OMSMfdDN
	HrdW07hhIup1mmRPGvWPoTTe/TNzA4dttgT6ayP+/7ibe3pL7u4Rsg6oepdsfpRd+/7UdeoqJ3f3U
	jXm+KTjt1P5P0K1f0pXeYetQdZaLGrE9leSISotqpxFt76xl02yTPGUIaaVHg7r+wfsFEsFDnNsTb
	IjHXsyF8CTV1pKd+x9hOZS4DwbY6QNwrxH2wNkQNRbfNekD34RqFz4IkZ6Ev+d0WpILei5yg5jTD7
	On4Ro7C4OY9wkhaZWftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMaY9-000000094AP-2CWK;
	Fri, 21 Nov 2025 23:28:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMaY6-000000094A1-1wRK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 23:28:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso2803057b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 15:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763767697; x=1764372497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxtDpSmTs7mL/tjhVCGhuXCnOSYOMYknzMq2xwvzpN0=;
        b=f7cTVIiW5waqKx99VLZ7xqa4FBaqtvktVFVujnzzsbdmtLBTbtVH4/vH0FNaOU8xEJ
         QD06VQVJUpj7L1GSY2LNYiaEes1a83+AKsiFTK2IYbky3+kv6tI7cLZGbpg//aWd6r/5
         IWGNr2l5HiXmgK4rHw8Koa9IvE8FL3pLSQo9dYWHihuKQq25SeUbBcvF4TSLXUi87xV2
         BRgZVPgEVk/T9QW13DXAcOkQ4TSMqRg+bD7snn3MjG81b8YxTO2qDinNMy5XSJe+7GXd
         eHkM6wrLwSKI2hf7VjnJvFH9omknvMR3lOeihgoa0D1A3oyaewVfIr6tf7Y37lHWE1Z+
         yJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763767697; x=1764372497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxtDpSmTs7mL/tjhVCGhuXCnOSYOMYknzMq2xwvzpN0=;
        b=PSVXgkujBgSIgRaGMdp1Ex4kzE8jNo+SHjrtT78cVd2xIvp24rjsYrDf/J5l6ksWj8
         Vubow+6TCHTfCpdHVEbSJdRUftBwbj1nFzEYYuaQbMQoXWijWhZ5xrXIlnX0lSNebXiq
         UmLIjQL5nNa0kQI3l2gVTwd3mNZAmPxfeUTeNbntcdNCTWNcYfRxzrxcNtunr3M/cPZH
         i4MCzJPBOlw6f2KQNI8IoRPFawekHtsRWLdjvN8PgLGOfUhv1f/n/5DuivTfLQOo3cXg
         tBzzLCL7CpujbsNkWyKD4EfCEsxqU+S4Q5GzDGxoYqznI0de+pY7lukn3EkS/Np1N5WX
         agTw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Yymhic7oOnueSGNmlHwofkG2e2m6KTSurLX0AWlNHGEID6LciVPg43DaXZpcM+lnpQHjHUG+vHWud/tUf76s@lists.infradead.org
X-Gm-Message-State: AOJu0YzgF3KYdMQAoVpBaPEwpd06VHVDoz/4JjLH4I8L31tEtklUVNQ+
	KSyaCx/jW4fQEHxnzLPhI14a8/gi6HkHYA8vx5fYBRYiXsuUCDCavqXA
X-Gm-Gg: ASbGncvbx24d9w/MyOa5TnuB1h4xANERuE9t9y05ZffvmhSeFoKwpKfqFqxqYRDXWjc
	6S/BNZLVCADINy4bGVfTirW+hWG09eLLc/43eNNqYadAaL+7ok9aTYD7a+rigaVMAX1sjFz2LYc
	ehY3j+I0diKRLGFaETNYOPWMYaqm1k7Xo2BFuaL07JxIZpvEdpPBeYqyu1orUnGgBSu0pCJwjzz
	rUynNjYa7rRXyGMvSy5IB4GDrZzBNryRng6vR9Hb94BlDhfIHIH09ljf4ih53IPegNDB7ewfWGJ
	/89fJU7pJYc5WzYKXUBw2yJ04UiiJA46ToOlN84qEC7GqqmjtdlYtcsulcuQI8Noil8wZoncfX8
	19ESM7sT0UcfRg5cCIRpra8Ud6QHZaRHGilYVeC1kjp9sMXxbnwj9I2TMGZ9O22XNBeik/DEvLg
	+OFgfT2GKfpNHi/ctCG0tigGk2
X-Google-Smtp-Source: AGHT+IHQzwceccuSE+ynV0dbTPoBKwMThY8XryTam2V+oxreq4oB+F/urlJ+SII61jfTJsuQO/UmrQ==
X-Received: by 2002:a05:6a20:729a:b0:35e:d74:e4b6 with SMTP id adf61e73a8af0-36150e2be9amr4501844637.7.1763767696784;
        Fri, 21 Nov 2025 15:28:16 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f095c237sm7226947b3a.45.2025.11.21.15.28.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Nov 2025 15:28:16 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: m.szyprowski@samsung.com
Subject: Re: [RFC PATCH 5/5] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Sat, 22 Nov 2025 07:28:07 +0800
Message-Id: <20251121232807.40491-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <253c870f-770b-4102-be47-f8c06e9e6c31@samsung.com>
References: <253c870f-770b-4102-be47-f8c06e9e6c31@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_152818_529235_6E54999E 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, 21cnbao@gmail.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 22, 2025 at 12:09 AM Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Barry,
>
[...]
> This version looks a bit better to me. Similar batching could be added
> also to dma_iova_link()/dma_iova_sync() paths.

Thanks, Marek. I will respin a new version. For dma_iova, I assume you meant
something like the following?

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7944a3af4545..7bb6ed663236 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1837,7 +1837,7 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 
 	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
 			prot, GFP_ATOMIC);
@@ -1980,6 +1980,8 @@ int dma_iova_sync(struct device *dev, struct dma_iova_state *state,
 	dma_addr_t addr = state->addr + offset;
 	size_t iova_start_pad = iova_offset(iovad, addr);
 
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
 	return iommu_sync_map(domain, addr - iova_start_pad,
 		      iova_align(iovad, size + iova_start_pad));
 }

If so, I don't really have such hardware to test. I wonder if I can make it as
patch 6/6 when respinning, and still mark it as RFC v2. Or should I leave it as
is and expect someone with the hardware to test and send it?

Thanks
Barry

