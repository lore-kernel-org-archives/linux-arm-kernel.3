Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF351C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=; b=A1zyzIymvt7Xz6FTqzArykk32s
	Qg7bdGFncZAT2OPdcVnBt38TftyNa7CVHbDBajryTS7j6VfonAxfi2S20L3jO/UOWEpPop/s8buPK
	iIiLwlxbxtItvfQX6Z3tGwc9DG/nH6ag4EPA2o1yFgrIqM+9NdLYiEB0h5gzRoJ9FOh/psaDxe6Hh
	nRkhLkMaxw7YVaAUdY3MCJC9ITWo7+LqlUrzVS/+8hcilgwAq8eTwF1ket/ns7xLOS4rRSbmqALwd
	DuhQ4RzxuURgsF/KTnvyy0tKHMifi6+vSdckJKQR1cauooyf0DrJvPdOpsXnGMsyEj2+NcuoHYczl
	pO5Glq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM9j-00000009tGH-3o8S;
	Thu, 17 Jul 2025 10:48:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLv4-00000009qUF-0NTc;
	Thu, 17 Jul 2025 10:32:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4560d176f97so9038145e9.0;
        Thu, 17 Jul 2025 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748372; x=1753353172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
        b=McWbYrrFPyMnxqcy+aYnZ1e8lOlQOhfvo297yHDqeozVfn67cDFDClvG1/Tkey79Cm
         /Ildmj/5zLqqcjbMEdafeoyJNv1HAhKMsO3hgKcUOw+C13CEku329qnyDiu2cl97T46E
         4kmpm5lPuaQtYyayAjxgHDt9WlpI1UQkHk565v++8qEON3PiqiwRR/LSad0qtPE2FE+Z
         Su9sPWox1VxuGdw4Q17iK6LpXt53pZv1nVVh/jEWvUGa6QPASk+E5CwyZL2cIGGLBavx
         hAfba4nQgpBAjE1zZUjt5RITOTKcaeKvutEKwYzUAptQiYfT73MUdMADE9f7/0SZvxZP
         KwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748372; x=1753353172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
        b=BPxnrg52OvvwEcAzC+5NTreTF0k9jSPJdt1R3HEY4deglA28wFHAtSyjynrnT2oF7E
         Gpk55hKYmYip+/AJ40hr5uL+Vm5E88DdYkkdI3ea+L9bK7mITBSKgY136dAih5LdNeYa
         5ubjYlWp7SJFbYar7jYiMzAbK1R036QEOmbqAGAZLPTGmmx4rwk41Ta830oxDLH30Tm6
         DJA91hiyIk7EhWbZM4b8xj2gM9tjLpieXpKpprVsuw1FhQhhMzNJ7yO8hcc9elVrlqUa
         W/sgD1pMulMgxGq67hVpqfjCNKn/cBTEdjllgbdKqVAOWPLm6/TwG+JT1hCxcPStZuTh
         YA4w==
X-Forwarded-Encrypted: i=1; AJvYcCU37EZ9NIf9fdzAQvbWRSyP7X9LvhHKHUUsWoOqkAHC+jHe/sfg9sKAzf7bIXQn0LLs7oVu5ozV4dBX+eY=@lists.infradead.org, AJvYcCXeTJmml0SoUjj2TaReIAcQCOYYf/uIr9arv6GOUTG9ryLk5z4Ww4IADqlM5Axq77CvtUXFMexbxtpeDiXvi3m8@lists.infradead.org
X-Gm-Message-State: AOJu0YyOJDpBsVQfNXG6JWvcYZYWQJe5u8ZjYgsTFamolzFtjogJke24
	KNmKl+YHRv5mLWL8fZy/5E7NNLvzrWbbXssQSS7+6Zr9JStMOKFms/GD
X-Gm-Gg: ASbGncs0U49vbQOyQmFgvIJKP487bhJTreMw59GenypXyjDdlXfWdk8v647UCBem+2T
	2yVL8S5+X7CGN24NorFQjT6b75cOkBn6crQvaBaTPADtDTGnrViqotTnbERCDN5g21JA71CJjsW
	9O0ulSAOqMvzidgo57Ctb3I+0yqzBJQh8MtYcLIzIaBAqct/Cv/RLZh7f2mYz0hxlHocT1duygX
	E6EeeMJgJ2fw9RfWOrQTpfq5FjguC4MLIBm+ZnfXm+ev0saGLnfMSb5g1c3UB2R6nzqenpHdNkc
	22SHrlOlSF9MBgdJCYsu0AWUya78Jvjpw1mPZRfiltIm2Sivo6AEOWc5WDDD/MAZ8GFSJIWTOgm
	jiHBdW1pGnoWX26lfP0LZTYvqGfDbjvJ13tI7X8BGM7f9jr/OEnok1OaCrCbx039Imjgc5ZzU2W
	k6pl2eeS0bJpFibA==
X-Google-Smtp-Source: AGHT+IHy7PA+ydb4zAWKmtnVkxvp2yVipMuhRsPFmT5ULPVHvkEqwkx5+jJwmnytUHEZv9na/OVQiw==
X-Received: by 2002:a05:600c:1d20:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-4562e36c7a6mr69982365e9.17.1752748372489;
        Thu, 17 Jul 2025 03:32:52 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd15bfsm20610595f8f.19.2025.07.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:50 -0700 (PDT)
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
Subject: [PATCH v2 2/7] MIPS: Embed syscore_ops in PCI context
Date: Thu, 17 Jul 2025 12:32:36 +0200
Message-ID: <20250717103241.2806798-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033254_130694_4EE2593F 
X-CRM114-Status: GOOD (  14.12  )
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

This enables the syscore callbacks to obtain the PCI context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/mips/pci/pci-alchemy.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index a20de7160b6b..02f0616518e1 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore_ops pmops;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,6 +47,12 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
+static inline struct alchemy_pci_context *
+syscore_to_pci_context(struct syscore_ops *ops)
+{
+	return container_of(ops, struct alchemy_pci_context, pmops);
+}
+
 /* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
  * should suffice for now.
  */
@@ -306,9 +313,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +333,7 @@ static int alchemy_pci_suspend(struct syscore_ops *ops)
 
 static void alchemy_pci_resume(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -354,11 +357,6 @@ static void alchemy_pci_resume(struct syscore_ops *ops)
 	alchemy_pci_wired_entry(ctx);	/* install it */
 }
 
-static struct syscore_ops alchemy_pci_pmops = {
-	.suspend	= alchemy_pci_suspend,
-	.resume		= alchemy_pci_resume,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -478,7 +476,9 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 
 	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore_ops(&alchemy_pci_pmops);
+	ctx->pmops.suspend = alchemy_pci_suspend;
+	ctx->pmops.resume = alchemy_pci_resume;
+	register_syscore_ops(&ctx->pmops);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.50.0


