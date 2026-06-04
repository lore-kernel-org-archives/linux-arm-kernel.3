Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF0CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zTkYHigKQy3WkeWXyJsWd48o8A6LM0P0gm1ZhPIld0=; b=qMBfxYod/2ZpujJVM6ATln9Gp9
	z1KiLTQdzB2YKOYsCujBxwqDmRYm/HA3HMGF3GVwQ76fBNEGxvXkIKi0C6QsfCPX3NYhCgEajEb/N
	XxZ1DuKXdYAtrZmAsIweIcwxXGRJRpHaub/44An8bW+SP/sH1ZXlae7oEomU7CtsYKj5uQiSIR2PM
	e1wWYsSluFMysM/SstNQi7vMvpaGN0EcgN/nVIWp6TuWZ+48qWRZiHxq7UWVfbN7chunkGeH4FuMp
	MD8N0Rq7RyMZ5A5rbmpxS6Jw3HFHELQ/Ub46VkE0Y6M7HLs6J+LryJ1e9LXLNyKaDEK+dS/zdSjQj
	0ORarBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VS-0000000GpuC-0wic;
	Thu, 04 Jun 2026 13:53:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VP-0000000Gpmx-1K0s
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 13:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7zTkYHigKQy3WkeWXyJsWd48o8A6LM0P0gm1ZhPIld0=; b=g4jznLxKBErpok38F7qmztdi40
	dWJVjafh6M1eo1jfUQKidp6V7f+NxvkWF7Fq9wmWwmfMxAR8dtSlWULtu+KP8ViORbEoqU0Gokiax
	1ohWEoce6gnf6Mw6TPHx/YlRpKG0dZkSBPufwW6SAqOIfHDoLHo+chldpqRtf+dHcvmsVzZp6b+kL
	v+FG2y92JSRsshIBs6h+zWAoTScGCV+BZZNqVeqnE4pEwHwecRRMO+1zICXtKPnmM0RyQVPnwBY1R
	KJSpNErc/1NB9kJ2NBgOWLlYU+mvtcVYowCdrlgptzRIjlEhmCS2PnxJ7RsAQStiODp0+A/rU1XjH
	j4Ad/bbg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV8VL-0000000EOse-3lId
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45eec22fab7so412913f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581182; x=1781185982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zTkYHigKQy3WkeWXyJsWd48o8A6LM0P0gm1ZhPIld0=;
        b=f+y2PzK+8FJpj1XF7R/WEwD8UJ0ARuCSe47N3XI9R0DOViLEGAHFlygb/BrgLKMXEt
         L9JrEK8U0ChlCVmqUmwealnC5Qm09sAW8IzZZ14kxuZTx5hgWGw43eA/fm15oxZjvgCO
         eCW6SPaymXRyhH7fZn3jZRMxmspyXxbh+44JmFoUmLLwJEkrfdPjcJ65kDJ8lAgbPP91
         gvay79QCUIpwTXPvNgOxp1gO9uaqwJCgGjZSyw6jmvBY3zCuG1CI/iWQa708RNjwywYb
         GBi9j5ETyhzD/BX5v7lYNMLSNaD2Cw8JJeuqWm9ho23jHSGtx7aX4jeBgoowErx1pnUM
         hKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581182; x=1781185982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zTkYHigKQy3WkeWXyJsWd48o8A6LM0P0gm1ZhPIld0=;
        b=MY5mqnqCiuafEYbgAQxAZ491br9cbvs7YMI944g+eMOJzSvvXgKoOStGaQgJp0ah5U
         GDeRLfWvVluaVQE5mzb+RJUpgryCwhHOqY7j/mvs3QRvFXcXeKWEBncXTlg+47+NGtkX
         s9/x/sIpeaVQzRmuJtEse1RsKAwC1cOvYXteBykYr3euylYwc7d+xC58I9yABf4RD2GA
         i5pYG13oDIs9m656qEzGX9IuVT9wx3hYuY/UGAqmJeYn391gEY+tiES4OnPLGPgs5KgN
         S4Q0YVygMR0fNWtpDkrqOyrptyie5cESntNLfDyS6rzbeLp8/JTNwLUa2YS5ZsbVYeso
         cLTw==
X-Forwarded-Encrypted: i=1; AFNElJ+g3UlFZmA7+/sLeXa1fjC0SWiFlwgScZAOqJLZNTSDCCHpDtbd2cVgWvOJswpIau7lvlCPDzoKcTkzeZaM5ADC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk0WvbcKtSFAVrTX4ta48TiYpsNUk7abdJIwuNAHqwxqZ4nUxX
	YM33b8Ws3MjQMpgLQuLIUdloXQmc3DkNptl/BMTcqwD8MtBCPf8T9tkKH9E11GNt7gKCBA==
X-Gm-Gg: Acq92OFz1KDdDvek0/fSsNbEjpo2YQTUX1iXfswqaviEBKLebdT/1uXfcVC3MIXgrbl
	5AK0uG/hNC5jLyWMAfqvbPAwh6KqWqd99IZ6WsZi6/ZSKBReSpYsacbwabqBfgI8PYCwKV3czsI
	CEc7o2nPobiimcs73Gr3SL+FJmHmNEz1h8afD1eXFw9tyglossqOgyUjnBBxT5sxpGdp0tv+Aeb
	uDfiGzSDlI8T/8fNl8JwygXNkb6sjjths+AzZnGF8xUbqgvb84ImGLaZEjDM4kltdGXeLJxvcpx
	MTqBj6CDhXw/0eezLdM7JD7/ZnPQCisqfBMJNkUcpqzC6YRQG5X7QPJuiHcV+YQwrMNroNZ83Br
	2/W/YrWca80Tm2iknktSI4Q5Zv/v5aVdRXX3pp1EPgTBcOMe1fRBMlzDEuDLXoD5qUL4xnu6lp5
	I1ORaiV1XkeyjlUt2aBIGXZigvpo6JsEXQ1b3If+Ki9yHE63BIvBPd+Gz3JpAJyuc=
X-Received: by 2002:adf:e00c:0:10b0:45e:f381:cd7f with SMTP id ffacd0b85a97d-460217831bamr9227520f8f.5.1780581182173;
        Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:01 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the RK356x v1 IOMMU
Date: Thu,  4 Jun 2026 13:52:52 +0000
Message-Id: <20260604135255.62682-7-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_145304_031672_862B3550 
X-CRM114-Status: GOOD (  12.99  )
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

On the RK356x v1 IOMMU, RK_MMU_AUTO_GATING resets to 0x3. Bit 1 enables
auto clock-gating of the page-table walker, so the walker's AXI master
loses its clock between transactions; a TLB-miss page walk then never
completes and the IOMMU is left stuck (PAGING_ENABLED, never IDLE).

Clear bit 1 (keeping bit 0, the slave-port gate) once paging is enabled
so the walker keeps its clock. This is required for the RK3568 NPU MMU.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4da80136933c4..e3d8b6e9ca12b 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -953,6 +953,18 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 
 	ret = rk_iommu_enable_paging(iommu);
 
+	if (!ret) {
+		/*
+		 * RK356x v1 IOMMU: RK_MMU_AUTO_GATING bit 1 enables page-walker
+		 * auto clock-gating; the walker's AXI master then loses its clock
+		 * between transactions and a TLB-miss page walk never completes,
+		 * leaving the IOMMU stuck (PAGING_ENABLED, never IDLE).  Clear
+		 * bit 1 (keep bit 0, the slave-port gate) once paging is enabled.
+		 */
+		for (i = 0; i < iommu->num_mmu; i++)
+			rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING, 0x2);
+	}
+
 out_disable_stall:
 	rk_iommu_disable_stall(iommu);
 out_disable_clocks:
-- 
2.39.5


