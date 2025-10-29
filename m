Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00EFCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=; b=aZkSdRYfuBINt/nZNoPPCZv0/r
	VPQqP/q24pUPTFquBRq6OLJ4AjQTSQrXzitHAB+9PdAWmGgYEma3TAepPl0BRAK5NOXOs+7JmIkPN
	d2ROxolWfTmxKidFNsRrzDwu2wNODzwi8BhWmKAL9Mof8FpFh2jXEBe+5r393VRAafR1ooKfTgydI
	i2G1QGd0J8HsBAurQb91QKKlQhZPZSbLH/wB+LHV/8h9gjJqvXnWgt/BG0HGqOWfWRoCeCQM+Hq/S
	yn2ElBgkGWRxBqrVQVeebv1bWxVOxFd3U9Cj19z4dlhw22vBnmhKFhfXluASVKsj2tWQIq1QKT6mB
	DyEt64KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97p-000000021s7-2It1;
	Wed, 29 Oct 2025 16:34:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97Z-000000021Y8-2wS2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=; b=m7fFwIFzT7NGS+PSabzABo83Rs
	5zMoDKnw0nkCpZGHLqPG0DGloCwL7Tb7c0hI2Q/VVjZqZ8mxcFW1vvpKRNZ1BE5x7Z5+Wao5A1ibQ
	OFfxIm1HKgphji8xSNcXGBJmXibvZqkRb4BBNpqHQItL52PsCHWDBr03QTxA7euUAPqTRk7JbqiDE
	DV2NmH8SoVZ8oQ9cXW3dX/tWlLW2N9LK64PdJiyf03lB/p6ofoNlO/yJjyBowNr3ZuA04a5wmrU9s
	HrJcS+83spp7K6YfOyGv420m+rNdDszq1GqXM+Eomk7V35+wsx6dFQCZI3btT4z2Kawcp/fMcNbLM
	g6boOGhQ==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Fm-00000007Jf9-2PNK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:28 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so4799796a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755636; x=1762360436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=J9PHRKQx20ZLK6/NgN2ZZvMQRPVlUI/zmsLLiojgnoDdbHEU5rJ9fpeyoES2jb39P7
         fYya4x6iKsNgSaCRfmV9ZPSrvzyFasNe04UdZRQR+X18sRBPGEkWDJEGGptnacYC9m7S
         SZNLYPFXSLDOpC2ps21hdU45coMYZTwf1J95nLapsA+BP4GclZ0WrAzfuhuJp6ZhDs63
         KHebPrwMRLfFOS/vZNeZrb/4ugFslPwxHRbHgVcpNZeaY27TLgudEouC9oIe1UV85/+o
         qCobiLxKGTjRX+JicVbjBy7AulXEZv3k/39d/vGvp+gbR+swnHuiRibZ+GoXtzC5C2ax
         Y7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755636; x=1762360436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=LjgeH2hfXsVHP/61UgUzVgZJVVGIu/9bUwfhPf0dLEZ50pKX3AKsxfRnukI+NgD+4Q
         jPSm36uqRrQbyS0efNYQhFFwfnWma4mBT3ec4PhhrdxRrcOlzYZmO4njbGV8eJXc5dlh
         20dAiFfqF/9m/5nyFKXooc671rOwnqCxKscUiDgrKCJnpwXFQzmMsRq168VTOeWyiZu4
         /TCa8eyfl+szmRlYxrFYw8uu9UdGZtqBO5lvtJbILRcyJU+FymCtJ+JPa3E7zC2pdetK
         8RlJYh2A5dnErcaqoX8gWuVSfAmMvyJu7yAEFpI56XYlW3TT5nTJSsjZKn20ZVZzLkqp
         c3hw==
X-Forwarded-Encrypted: i=1; AJvYcCUyVgXD8EIF0yXwRhBBsHgu94kcEIOxuL2qlJJVCEicQSxRtsTA9npJLJzkwsKTqNKmxUgE4LoPlkY4Mji285UG@lists.infradead.org
X-Gm-Message-State: AOJu0YxIGi8mo8emtTXAJu3w/ww+wpFgWuCfrqmGj/6llb+gbGalg4Kf
	FZuEydgSGax/+qtfKYSPBqoUFDRW9x5IYqxF5rVXN5dGTsj5qlHq2jnD
X-Gm-Gg: ASbGncuYU5zcMGkkb7U6GrBZrIfbhsR6CDSxZIvJiCpZngWTe7OD3CWfFF1pACb1cCx
	Uj+EINHMSJAWI6fi/3ks4PdY75MGNAN8/oRtkLU2J4cJMf8PXM+HcnX7rUJ+rWtZaS3w6bZwfJS
	HKuYg+zmF0D16+QNRagJ6l42zb7QdUNWmnsT4Gp7YkkKvljxpOU2de6SqDiPDQ911GMgGhwMdc3
	iwwEqxA2uRpfUGGknsWKCmjq2MCrk3c+nVLqzN1xbMFmJ87Y0oqb4GfLv94dzabnUdvGywirbRC
	TtMGxi5ZFWvtxSVVwVFAqyBlT2tEIyb0tG1eVhdWZ5uS4o6i0QqO4wXp4TgIivaJB7+Rsx1Q/J9
	atYuddU3A/k+8/mCq2HDg01okcxUbx1I7eXLkgwwpHPgIep3LVr1UygSMdEyyChPNJ8AFfgJcTr
	Q425YXFhByc1yokGLQoZi8PBYgHJg4UUO82GjqyMz2ERUvcFfYPyexbmayqp08MnUw4mmJ
X-Google-Smtp-Source: AGHT+IEBhKyqSuQzRg5+jPbNr1lJJJfXBtMjYTViFyDgVE4pc7ia4Gu9caVkoUUyuihmK5MM+ILYDA==
X-Received: by 2002:a05:6402:5c9:b0:62f:50ff:b675 with SMTP id 4fb4d7f45d1cf-6404437f5a7mr2656312a12.33.1761755636037;
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6404de640fcsm1695354a12.8.2025.10.29.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 6/7] irqchip/irq-imx-gpcv2: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:35 +0100
Message-ID: <20251029163336.2785270-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153826_675533_8B5D4CD3 
X-CRM114-Status: GOOD (  18.28  )
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

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message
- remove unused global variable

 drivers/irqchip/irq-imx-gpcv2.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 04f7ba0657be..ebfc659af385 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore		syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,8 +27,6 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
-
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
 	return cd->gpc_base + cd->cpu2wakeup + i * 4;
@@ -35,14 +34,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,13 +49,9 @@ static int gpcv2_wakeup_source_save(void *data)
 
 static void gpcv2_wakeup_source_restore(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
@@ -70,10 +61,6 @@ static const struct syscore_ops gpcv2_syscore_ops = {
 	.resume = gpcv2_wakeup_source_restore,
 };
 
-static struct syscore gpcv2_syscore = {
-	.ops = &gpcv2_syscore_ops,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -279,8 +266,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore(&gpcv2_syscore);
+	cd->syscore.ops = &gpcv2_syscore_ops;
+	cd->syscore.data = cd;
+	register_syscore(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.51.0


