Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4632EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=; b=n5V9ME34lCctd+rOtLXxBoaWWy
	ivs7WYtVs3Do/yBtHhLFXCI6AJ+5dHRaEA6PhNGZ16IaBhMSh4wCh7HrRLQoUrRqIlnSfxZNMLMKv
	3Fcn+Mfm7G5zlyGbumder1EFVE/w7tYUPla0ZO3id7YH50pdCdZBhFQrbkBQxiaY+fBGLScKqMQD5
	G07HKINFPzxBI+eyB4TEm4bQY3qccwZ9MYEhyTy3IwqWQdoGEy3aFTsGScyJW8R9r4rXQhiEvxWba
	SiQHzZYkuHoEqwIb1LyqhMJJAS/yoP2E0moIpf/nhlNmLUF7O9Tt28CLSHpgXkZE90yr9XDatViUZ
	VILiE65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucN9d-0000000A1Hw-2rn2;
	Thu, 17 Jul 2025 11:52:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvG-00000009qcL-1J1n;
	Thu, 17 Jul 2025 10:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=; b=EkrzFmWFGywOOwVPWJ9AkxAZRX
	qvHUt5heLYh+r3XaksG3ikA/yIPaf7C2HcSEiLVADvePAwhhvmRz5FIWpzdWpGoKMuqrUJhvfFEJh
	MGY7IuvJG9AoPnqqfB3Q7LvzDgrUKVdhVlcgtN8+3Deu+qQGcBb6uYI8obDcCggnrA89YkhqItH3U
	IAoqkJor3FiHt0kv/kB2Y2qFz9azvKsftRGk/uGSjY35M0dnGitlkQklc51ZWYyGHjqs/65zyegzl
	u4iUwz+DPo4hofSVVHzh3XFsVd01ZXJCFR7ivYuIV+MdWqSUTOlv2JeqVviVGZjfX4h60pEFj9EoN
	1uyx8hdQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvC-0000000AFps-3rT1;
	Thu, 17 Jul 2025 10:33:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-455b00339c8so5482455e9.3;
        Thu, 17 Jul 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748381; x=1753353181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
        b=SnrbhDwYViEAb2PPYXKnBQ18lAx59++TwcVV7wdFx/ndhhVHtevuA8vWn9pVYuKoW0
         YoKHnvJjBGX7XpAfgh48KPzmCKDKh+EHHbBc5Vqv4JGdsSwjWb2QuGvG2TmAD/CCStaq
         UsvHoR8Gg/rTFiCPK1XYz1tyPVCDS3IFlHGAnN22trm1p9BmVQK8vUH+YV0m5CT2cPF4
         Cel7cJq0UiZALBUI71fUBe3Gq8WTIRXLJ8uw0De7Ro76VTgTv+MHXD9u/SOje2T4PMQX
         88SnLT+3clwKEMpQlttI7LLazLr7WbfLswHJv3KEMFblLIaDorgKP495JrXSoD5ypj9b
         iZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748381; x=1753353181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
        b=l9xmySn8nkFJBIpnwbcgCb3zi9eTJQwtcBuHsSFMJif6ZKmKCUvpR8f19wn5X8twpB
         5gJBG5nYHrZb+QlhjLIlKP12NSguN6gTLVo7mXL76bqJm5TZPDobjyhTHqEuPSg8v2rS
         X4uf1VQ076RwOEzzujqBF4otBlLmUvMcvp8ISqMp0KwHI3pmRKDU6gZ0Oo9FqdiS1TDx
         xgPp3/ZawgY9n2iiiabJEasEHhc6VVbYk6+Jq/HZ8enWGhl95PCwKhenAjBvEj3LmE5L
         rhwGFkpHiz9Zmtar4ilnW5PsROB9tK0AhPZOeV6+HdE1cMslNMn9b8Q3v82xWEod8fLB
         d9/g==
X-Forwarded-Encrypted: i=1; AJvYcCVMIpKkeuMQRd2kzy4FKOz3jJvRRKpcraGhbRCMOsKSUWw7WTO/RJgs9slCXBhUcy5m9517Q25Kw//ASC0=@lists.infradead.org, AJvYcCVlESHsRNdrhsSyQDsqdPJkK1CILPrN/QDcT38C1K3uH1jIm4sYs5Juwx7UWd9N6pL8etHCiH6u8puopvxFD4TK@lists.infradead.org
X-Gm-Message-State: AOJu0YyjHJdHBpeUtcQlgzVYod+u8OgA32l2K332LMoSaImkwz/1pzA+
	H4CF36u9rN1IITttDs0dOTw7L+H1WlbRygSi4XvYCNk1rwcTxGEn4vg9
X-Gm-Gg: ASbGnctadkHZAubyrAMg9h+vlQ6oe7wX+7SUFaewNdtou+3tdklsXPQB6PeQxf+cVMo
	i+eLgo8pDL5pekg4N3D4xAbV9pAB6ig3sq5/N1Img7DLOh57tMZ8Fcia3SgtDGmshuPhOAXNvhR
	pq8Up2m8L2eTFD8vmzzIdyyuvCU0rjZPQZmcJb6KRmyq3/sCmMyoU6xma1re+CyiWDozqoMoIaJ
	FL1h72jlvyutVM7OhPVAIFe6b+lrNgk0BmrwOuiWCHgn+fEUJ7sBElNfOtX8PRtFbEO2WAVA9yM
	nmGaGVA9a57ZtiQLjZZpszEjp8tBkliN23TbzVZoW42y1eBcaaobtuxSHas1A8pwEWAORAYW30w
	7wMFdd3nS5NkBbUiEXXD1Wcj4dySOAE7kKILk+iTf7piH5SvKXfv1iy81mia3nGXGwDbsjJeqZd
	Osto6T8y/t7zCygQ==
X-Google-Smtp-Source: AGHT+IEJyseOSQ7/RZYPnww/L9LgeDBNM4g6hD4cUsfsALyidX4LqCToCF9T7Owp+uYfqFCAdatHoQ==
X-Received: by 2002:a05:6000:2901:b0:3b6:1ed:9ad2 with SMTP id ffacd0b85a97d-3b60e51b8bdmr5306916f8f.42.1752748380572;
        Thu, 17 Jul 2025 03:33:00 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1924sm20547938f8f.16.2025.07.17.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
Date: Thu, 17 Jul 2025 12:32:40 +0200
Message-ID: <20250717103241.2806798-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_113303_092034_38950A3C 
X-CRM114-Status: GOOD (  14.43  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the IRQ chip context
without relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index bdee15a327f3..8e606baf3a01 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore_ops	syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,7 +27,11 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
+static inline struct gpcv2_irqchip_data *
+from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct gpcv2_irqchip_data, syscore);
+}
 
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
@@ -35,14 +40,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,22 +55,13 @@ static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 
 static void gpcv2_wakeup_source_restore(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
 
-static struct syscore_ops imx_gpcv2_syscore_ops = {
-	.suspend	= gpcv2_wakeup_source_save,
-	.resume		= gpcv2_wakeup_source_restore,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -275,8 +267,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore_ops(&imx_gpcv2_syscore_ops);
+	cd->syscore.suspend = gpcv2_wakeup_source_save;
+	cd->syscore.resume = gpcv2_wakeup_source_restore;
+	register_syscore_ops(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.50.0


