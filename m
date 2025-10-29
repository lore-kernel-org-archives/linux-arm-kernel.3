Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCCFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=; b=Ey8q4dNj6T3htHGY1sGNpnL49y
	lj2rSI8sXoc7zYMCH0ixhmMiT3pPPp6pY+andgkyuFx+aLJClrHJChTL0uyCpHgBNRG02y158mIGq
	2SiJlCyZY2+SWfjLT2mM9eCpCsFLeS0LG+GmyEJYd4or1utSE6KMkludZS9gLRY4FJAKIa11yE6J3
	eKeOkAVV4MFg8p0IInnUI4kkKiNg4ta611wOkzpySA5aYVvlRz90yoUV3q9nMzkZ/iE5IWAUPJfim
	DAPe3lU9h3UMzhkNZzgL1DrOf5xLfCqzHPWq0tYNL9jwCr5M+zkfnQiE9zYbDHH47gQdUfT6hkw7/
	wZqY17Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97T-000000021Rr-2kEx;
	Wed, 29 Oct 2025 16:33:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97Q-000000021Py-3yJY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=; b=pv50RDclHF7qpF0tBuvgsf7G9m
	mIDWgCXtp/wfJFQBEctV0xmgZQBAylM3kgyGFUBnKpo17G1MMxGsFSGFXTSe0/rV1fGYNpVsKHdAO
	XtSqLLwMeYAVLEXKrqdVw6MEWlOfnEMitzTPfC1US6ad09RwM55qpIw86dOWAOGZ2gYj5Fwjvw4P7
	m/M8nJp1ZJyMwUWU5bDT4o/KSNf1qdgzQILyv6AvF0YMKkVH9+/teSMziDjLqt/j3bSbWjZAs+8iv
	lw2cMxMeBH3u8DKI/V2GAmz9k0ybmGGpd/E/vTioNcy8v8h/bt938zqEp1nwSqFgoMdhOJKcnwxzq
	Dgd+mIlQ==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Fe-00000007JcL-2uq1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b6dbb4a209aso13355066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755627; x=1762360427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=NfFM/KjfoX+oeXiBa5P3qYy+DvtJ9Y30bCATqF896EEdlRKfpwE1Iw5hGSDA5btsvc
         ajMNJ33YulPWSPiwti3lK9mXvMnNpCqcg/sqF8FzYIu3JNS4pz81gxo3+uucpFOhTXJQ
         iLldBJ6/fhktfUtqHNG0iUwk6TbuxuBcB7zGfG4qf6qbvxUI/MPVBKJIRho9xGHUb13H
         3qBpb1XtESkPj83+eFFA5l+soKF0vgbHcWNVcTgEQ+KL2CYVRuGKaLleKG/0fgUFuS6q
         38J3UmNP/QLXWInvGOgfrezfmt7bXg95d20RFTyGx7lznsK51Nb05U+6iPTxntvHRY+k
         5zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755628; x=1762360428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=F8zETkLv7umkwKgT+ieWVWYsn3QtWOFbkUZnu5xlfJCO2P/1W8w0EfWsjP2Lm5n3TX
         vmgeFmy9Lqm5DJLUCLPgqsB7QY8a/e6rJPkixAgdx2KxPhVcZelmULMLeF2e/CyrUCfC
         QZs4GwolW+pTqkpBlm11Gx7FI9mPQE+J4CkuDCuBy2iI694qWUJBd0wKeZhERliZ6ea1
         So3FSaaZR7IZRbmxc2sptTJGmxa3U8Oa63goVDV39Ikraai69EKkBM3b+Uu/jDyloeOb
         TDs/CoIp99TPL9fjmYMFuGYTS59OFjEGZMbvBBQCPVR8f1/YLGjfQkWYoWlbDDwf+OYb
         ak0A==
X-Forwarded-Encrypted: i=1; AJvYcCXsdva8SdOOk/wwbKawa6VNTqriLixfH+3NEXBLl1PpMhPmI7EchkM48niMGrfsZHEAzvgg53rXlgdVsu4zHOET@lists.infradead.org
X-Gm-Message-State: AOJu0Yz23SK+ePHaFHD8ZPkof71AgsI8VCvdUbVx0ulE2yi//rWHHgHp
	L9DsEhYXl3h5cOxM7qyKiem7pXlRa5M4cjU9wowFsuUWPTTOf9/oGMoO
X-Gm-Gg: ASbGncu2/zLPuFfw0KzuvquueI8e/yKs8LrPqoO/xKOdU8NtyD4ef8g2DL+/CVrHbTS
	uDZiUEpc6i4dFKPrtt7QewF6qFekk0LmBcU3rgriMhs1EYXv8Kw4TirdRyirNYmsskNy+BSFhge
	J8R27PEoQ+HSWi5HAMvptZ3bRhq8CtBUJ0v1yANfSeM0kkggFefPOOmxa6X3gdi/ebjY/Aejklt
	aYrIy6jcoyh2zqzNo4w4zd+fMqIohe6vgDtpWb6bAelD8K5o0R7zVX172KcO54sDeRa+BE9JlCM
	b2sAyhk+AtGh4MV1+oOgvR8AYQv5S7y99YV2VQH3gZR5tBe1q+t949IS2JnkRXL6U+cIdr5R9cf
	sDpyYUsBsdlBtCJQCCLC7T6Y6wsxM+9R0rGk+hiuz/zUyOdOgUc8yLvY/JeT1kOSQrmF60jPqYQ
	tUTzdZmOeCq2MISx5dUi3cBYB2cIORXSl6I8Cto9PZSWs9fYuBbjeAiw==
X-Google-Smtp-Source: AGHT+IFucoSpcC/sMHQ4BHPU2Sj/4WR5SsWuPVRxpOY+Rb83Lsjw7eIU5fItk/Z3WAxH0T7dO6D6kQ==
X-Received: by 2002:a17:906:ee81:b0:b6d:7e01:cbc5 with SMTP id a640c23a62f3a-b703d55289bmr367879066b.53.1761755627345;
        Wed, 29 Oct 2025 09:33:47 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853e5138sm1485764866b.44.2025.10.29.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:46 -0700 (PDT)
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
Subject: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:31 +0100
Message-ID: <20251029163336.2785270-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153818_847176_54866CC7 
X-CRM114-Status: GOOD (  17.34  )
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

Changes in v2:
- remove unused global variable

 arch/mips/pci/pci-alchemy.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 6bfee0f71803..f73bf60bd069 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore syscore;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,12 +47,6 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
-/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
- * should suffice for now.
- */
-static struct alchemy_pci_context *__alchemy_pci_ctx;
-
-
 /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
@@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = data;
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
 
 static void alchemy_pci_resume(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = data;
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
 	.resume = alchemy_pci_resume,
 };
 
-static struct syscore alchemy_pci_syscore = {
-	.ops = &alchemy_pci_syscore_ops,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
 	wmb();
 
-	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore(&alchemy_pci_syscore);
+	ctx->syscore.ops = &alchemy_pci_syscore_ops;
+	ctx->syscore.data = ctx;
+	register_syscore(&ctx->syscore);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.51.0


