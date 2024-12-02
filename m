Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8349ED78327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKxSUej1+l/0VRK8dY/i8qKE5HDYtkSoqmdKS10eGJE=; b=nbwmGSaCnAN+iH++pnAgqHs4FG
	wjA3fjl3wnhGhqLi4SaqhTaSFaJ+IyJARzfyvmldp7yiXiOxLivUdk4mn6Wt9qInJDOlmtuUW/f5s
	M6jlyEYthfmIT4CPazqQFluUnCM7DmUx++tldCIHZmWe0fFvCi6hSY4f1gMstZJHA97b/cxDxrAMl
	avm1V4pLgMyeOiVjbgUk8/qCE4vGowz9ma/+RZzXksIWJm3/qeX3963mKD8j4LqZcNIvS1g+CPIod
	iPKOUPc7WEF6502WHrxatge3iPT7TSznX5eLyejvu8J0FdTmtoyOVWaTWEKHscITQ90d7mYwgftDy
	3DzyI81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI773-00000006Myv-3q4R;
	Mon, 02 Dec 2024 14:09:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI74H-00000006MU9-24ZJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:06:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434a104896cso35115125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733148388; x=1733753188; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKxSUej1+l/0VRK8dY/i8qKE5HDYtkSoqmdKS10eGJE=;
        b=Q8W0KhkEtbUpzSYShNDl8v/iFf51bvpCtl9CPQIv6KRW0o2NBZUadaBucV58BzzHig
         XBJSjKG992+0a1Y0P2TR/lDWF3n5ynvZQmTVbXZqYMLesEJ+7kpUaM2pBpvH+nkR1KtN
         SWTnWTaUfA6CRtW1L+mnKzwoNaXtqf42+WEr/Spew22T82tUnIrDY0alD/4iLnTuryT2
         manRiZ1dbljWk1bft37BusJW2OblI6sJDEu0MQfURkGEjz++fBYJDK2tG2eIA+AwU+Zo
         zHDqflWNE7WygZOCMHmYRI8NFM0yzXlgRtixzZ4ErSfn3H7I1/3LYx0ID8D0KU0r4R4j
         6luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148388; x=1733753188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKxSUej1+l/0VRK8dY/i8qKE5HDYtkSoqmdKS10eGJE=;
        b=H+dtBztZGEAt+ETiiLFOT2WgbCB340niq1rjhkTwu/Ipv8yOvjBTTXtHgW8+KUMFll
         AT+CnWgF+bBhdBsxQ2lPBY9zyZ01wIl4ERw8IdygOUkHEzB05u0GmpP+xLO7E0/tr8sb
         0gkpAWtXkeTyyn0wiGKczlMlAGUzNS0e96EDcaArcVdYqzf6G3avJzccQyZes9pz+42q
         dHSZjqIxSqk7l4GPZ9HjU2nE2jZZDCw5Ang/k+gRByPsR2gUeLz6E5cSl9MPKQ8FdA62
         Xf6Ofkf46f9ozR1c2aKI69nat/lVUhbS7l+TWft0v3AdSYT4Lq+JFE1MKXveoeMTLyG0
         xk8A==
X-Forwarded-Encrypted: i=1; AJvYcCWe4lMg14L0D+6zRQalgi295Lx5BqHtILSMi/4VokfYd9+vg0T0E1Qxq7FhcGcWt8mow3mBfIrIr5d5UJDTMFMy@lists.infradead.org
X-Gm-Message-State: AOJu0YyWamU3StAFBWGluPhKjd753MrzdphbavFs9gUumHgzgclUQq9D
	5aYJxU1ZrBtH/6yV44pnIgdapAlrcclrapST1DpNmBxWnWd3NApBYMTbxbXv15E6svEI3AVsdz4
	7Dj/IzN3XlA==
X-Google-Smtp-Source: AGHT+IGb9GFF+XeRLxQAr2q/gzezFVIRuu1iuJqUMG9tGhoRGftP6XM2BbzyeGE4do1mNb0+j1Ui/wgaLGW65g==
X-Received: from wmqg12.prod.google.com ([2002:a05:600c:4ecc:b0:434:a172:6127])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f56:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-434a9dc1401mr242319915e9.10.1733148388003;
 Mon, 02 Dec 2024 06:06:28 -0800 (PST)
Date: Mon,  2 Dec 2024 14:06:04 +0000
In-Reply-To: <20241202140604.422235-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241202140604.422235-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202140604.422235-3-smostafa@google.com>
Subject: [PATCH v2 2/2] iommu/io-pgtable-arm: Add coverage for different OAS
 in selftest
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_060629_537300_2A398368 
X-CRM114-Status: GOOD (  17.30  )
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

Run selftests with different OAS values intead of hardcoding it to 48
bits.

We always keep OAS >= IAS to make the config valid for stage-2.

This can be further improved, if we split IAS/OAS configuration for
stage-1 and stage-2 (to use input sizes compatible with VA_BITS as
SMMUv3 does, or IAS > OAS which is valid for stage-1).

However, that adds more complexity, and the current change improves
coverage and makes it possible to test all concatenation cases.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0055876b3527..62015fdd6c6a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1385,15 +1385,14 @@ static int __init arm_lpae_do_selftests(void)
 		SZ_64K | SZ_512M,
 	};
 
-	static const unsigned int ias[] __initconst = {
+	static const unsigned int address_size[] __initconst = {
 		32, 36, 40, 42, 44, 48,
 	};
 
-	int i, j, pass = 0, fail = 0;
+	int i, j, k, pass = 0, fail = 0;
 	struct device dev;
 	struct io_pgtable_cfg cfg = {
 		.tlb = &dummy_tlb_ops,
-		.oas = 48,
 		.coherent_walk = true,
 		.iommu_dev = &dev,
 	};
@@ -1402,15 +1401,19 @@ static int __init arm_lpae_do_selftests(void)
 	set_dev_node(&dev, NUMA_NO_NODE);
 
 	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
-		for (j = 0; j < ARRAY_SIZE(ias); ++j) {
-			cfg.pgsize_bitmap = pgsize[i];
-			cfg.ias = ias[j];
-			pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u\n",
-				pgsize[i], ias[j]);
-			if (arm_lpae_run_tests(&cfg))
-				fail++;
-			else
-				pass++;
+		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
+			/* Don't use ias > oas as it is not valid for stage-2. */
+			for (k = 0; k <= j; ++k) {
+				cfg.pgsize_bitmap = pgsize[i];
+				cfg.ias = address_size[k];
+				cfg.oas = address_size[j];
+				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
+					pgsize[i], cfg.ias, cfg.oas);
+				if (arm_lpae_run_tests(&cfg))
+					fail++;
+				else
+					pass++;
+			}
 		}
 	}
 
-- 
2.47.0.338.g60cca15819-goog


