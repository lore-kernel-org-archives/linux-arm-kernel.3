Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9840BCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8c0BJ0D8z5gH8AMDVEzCJUaQjDllcdyPshnOBMw13dA=; b=vAUUPRON+FiFHQN324bnEFOnN9
	KUeUX2RpN8pnowD3g7NOFnMDbMM2psfVs4bHcHKp0t187o1rMKsstvcq5fytih8aIsEGbhG1t0BFA
	PbHkGkNcwfZ+JA9nv4U+C+1FpjkgevfxDoDX41OxBf5Z6nNxkULlKJosH9JsesJlrGQsWfRb1TAfc
	D3SB40Osp5A7gvzzol4YXVvDj6pn9QEGgoBWMm1Lx3f9HpZ8A8V4po5uXYU7ECNKvMsitgFjVF4Q1
	JOD2rMuNzcAT7BKZeeKDySePQbjSmnzevjBU6In5SDLM9zsgELgQCsD+p0IOeWmZZHgEN9sm84/RS
	JqBpdiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsiN-00000005uMJ-0aDX;
	Wed, 30 Sep 2026 11:43:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsiL-00000005uLr-38v1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 11:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8c0BJ0D8z5gH8AMDVEzCJUaQjDllcdyPshnOBMw13dA=; b=BFNRsgp7oVxm7Tb4eVapSaoxjq
	BLudkTl9/caJi9n/nFOfQgX5KX59kzRHIOgLbvZgPUhEtRA0prDasRgl7paB4PNF0ueecNo7nmU62
	5IyWyqNAjGiafzMKGtefbkN2nA56MNh4G/gnXGkdBGAObRPMeSTwOH81Z0MjAopk++p5MjeObvWot
	Dp7YlV1oo9sc+3LT2OGOB9v2QJX+9CsLZdD1ION1i6JtveS8dgLf0eL7BtJnAQLE5+/TaDCjiFmcV
	rNGAH9HJWAYNUTWfMBeCtYGqki4IG3jyqWfDmPA5sUQSztUdLNTKF7+whqED2uUVN6KRoCfvyUqDr
	QuqHIyAg==;
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBsiI-00000003jVJ-31RY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:43:08 +0000
Received: by mail-dl2-x0e.google.com with SMTP id a92af1059eb24-144f47a9b57so4742314c88.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768584; x=1791373384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8c0BJ0D8z5gH8AMDVEzCJUaQjDllcdyPshnOBMw13dA=;
        b=owE3U3HH39WX82UYiVL06A0oYXoT/lcl7mgjnul8rCQqIsRAwWIcYUJwdTh+YRAW8V
         CsqjXmHjoxVVz63njr/ZaX5OIfIPe+UAPsQ9DU/Wya4cEJSkru6ekSmtO6ZAsWYK7XBi
         f933Inkv9f7PQh3YXfQFs4xo9Vr+2rF/IQg2iriUkkAgGWdhJfvorwGpnenKSuAU5mdV
         Lzpvd0mV6naJV1KZ8sEWMSTLMo0MBQ3Rh71+RXiQ+AmiKTq75Z2layQiPMG5PM0f61t7
         3AfRGpbgQX9ETucPQUO05+LK2A0qlxRNj7Sisdx7xXcKSMPkZF85urdyfkBQqhSjQnhK
         nBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768584; x=1791373384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8c0BJ0D8z5gH8AMDVEzCJUaQjDllcdyPshnOBMw13dA=;
        b=REcknyMC0yqtNv5Gk21BzoEKGQ9H1fa9MZGr1eurCxNdvys6hxyJ9bUU0OFe5Ht/9b
         onnANXGXaUHnoVd32zPBswjplKReyg1H2vXa9M3qy2Ihj2F6vy0G5FJcyNMDyHesxu8t
         Rj2gy63Ymn0oJXGT2FKWBw2W6fixFs6iAu37mSC4h43+RYQNo//ekNuxRV+jcLlSspF8
         LPL3VwU/n9mQEGUG+IgKqNek8DhZ0l5twQlGArbnvZq9SSE0ibuDqVHuASIeIYf35e4u
         ck+5gGBE5vVPgIc7n9Gxu6zB8mUZdGmZxi2DViiXI2Psr5QPCcbiLQwRZ3mJLDOMHEDM
         4fzg==
X-Forwarded-Encrypted: i=1; AKwUvBxkJecj/AObxrtxgzEFplEeae3bDvRjFehad3NSrMEgFjhIx0CIor7tWvg/jnQwiGI13+NsaYtORMHyF+eX2DCc@lists.infradead.org
X-Gm-Message-State: AFuF++nhknnatTwEzSsr9wjCoTgeTXwSgnp68iLYreisYGj0AUddOIym
	1gZvWxzEiebwrKH+YpC8cw7k/0rwvJX2D6UXjXYXzYQCY1swW/pj27c2
X-Gm-Gg: AYBFou3ZdLGPLX/ECiB8DyuKwbJaf0nNYhgU1FxuGbSe3QVerWXADT9kuxHN/Y4acGd
	xjvQ2Dmi0hqER05BTyMRX7dGF4HTWy7UHIS1c2qZASJkcxfi3L5RYHxwshouYtBe7AICbgQuy+7
	+rIMEDKpcy+sHrZFfYaG5/gkFWQvHIqMeyCkb7RfEbW54ENoRl4Hwqe+Gc/p07ptG/+LNSVGlim
	mVMMxWy6LFQ6FAcK6Py25q/FTBB2n/KpI72Mv9614IAYTIiFgk5hbiQYwaFcWc7iTFFddBo0ILO
	n4x+P69rJ2tZPLo6fqimGPTXu5u+S3Pa+DQj/c2qzzjEGmr+yjugXzLQNeqz52fVqYkaSIJoj6P
	EPJk7OYJwgeDY70IiFpEJFnvNcSPyGWSavYIphV6HxKzW3zt10h+lJ8J+mapN9csk62I9a2Nj4B
	OCGLsy7YaQovKNQGSlIZenoV6nIZkMcB3Ur2SQfr0gTmOoTXd87kxO4HGfQMXgKdFtnC/6FOVHz
	Su+tiOOmcwk6sZ1k7le
X-Received: by 2002:a05:7022:ed02:b0:143:2701:9198 with SMTP id a92af1059eb24-14d33491b4amr1010932c88.36.1790768583379;
        Wed, 30 Sep 2026 04:43:03 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d083fe71dsm4363940c88.4.2026.09.30.04.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:43:02 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C3=85=E2=80=9Eski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v3] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 30 Sep 2026 11:42:18 +0000
Message-ID: <20260930114218.2655-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_124307_229001_E1E8CB86 
X-CRM114-Status: GOOD (  16.74  )
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

resource_size() returns a resource_size_t, which is 64-bit on 64-bit
architectures or 32-bit systems with LPAE/PAE enabled. Passing this
directly to fls(), which accepts an unsigned int, implicitly
truncates the upper 32 bits.

Furthermore, AHB2PCIE_SIZE() uses a 5-bit mask GENMASK(4, 0). If a
resource size exceeds 2 GiB (order > 31), the log2 size order
overflows the 5-bit mask. Clamping the value silently truncates the
hardware window while leaving the OS resource intact, causing bus
errors when accessing BARs in the unmapped upper region.

Fix this by using fls64(size - 1) to accurately calculate log2 size
orders without off-by-one errors and returning -EINVAL if the resource
size exceeds the maximum supported 31-bit window order.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..97d13c9d3369 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -686,6 +687,8 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	const struct mtk_pcie_soc *soc = port->pcie->soc;
 	u32 val;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -753,8 +756,18 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	if (!size)
+		return -EINVAL;
+
+	size_order = fls64(size - 1);
+	if (size_order > 31) {
+		dev_err(port->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -775,6 +788,8 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	struct resource_entry *entry;
 	u32 val, link_mask;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -829,8 +844,18 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	if (!size)
+		return -EINVAL;
+
+	size_order = fls64(size - 1);
+	if (size_order > 31) {
+		dev_err(port->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0


