Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11952CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH9KVtMgBsrkYXH8nnFecmz5YKaJj3+GxgiEXc+y1YA=; b=3NbS3CjvFZfhAVf5CQBeH8u6U9
	LRRrPKLvVYb+O7T7GNo1xMAxXbK58zuwGO6wUTZ0uNd6MtoUv2mGXbVoGKNX0UAk/uRIACHqFzzeE
	QeGFkaXku2ZWZ0YDgjMIWhLInq8Mfq3xLic8rA/e+b5W3E+a+zVlqKaoWd28ejYy3jnGiObg+g1o4
	ivdBxNbf8e688rTGNR/XkKWLVdXBQRAmnSA0MlP+HsfB6E3nJRX5M+vKP811HcsnB7yYmsjJR6e6g
	GkYvoJHmtGfLFWBchOaT8gFxRgCH7dbph9WcGO/i1tXJ1EPciyZx8fkSJkFBcbnUZmCKe3OiVBT53
	qnTquzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQs-00000001e0f-3m5g;
	Tue, 02 Sep 2025 19:12:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSEl-00000000R8S-46Kv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:43:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso28189205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756824234; x=1757429034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH9KVtMgBsrkYXH8nnFecmz5YKaJj3+GxgiEXc+y1YA=;
        b=P4jdrm8wbK06T5K3hNOQWzcfrvRL9gA4t+kCyoNTObHp2btlFQ/YsXSvh+IFlIN+1f
         YVkY9xJYd2xjXX/QTSJrNdgKjdsDd8qcl24sX7XKyNgQuMDnEhHeBlXxVgw4qA/CVqAV
         NhPc0c+i4Cg0ZqmI0SKoVfjdJB/MuVMYnUjFrMc0QQQFJHZGYLonmYgmQTXNYaa+31M1
         UhmttuKjhluEtKW5Wz0kc45rrQKEki57q9dyIBLRWNLo74IjBF+V1FGRkYA25TGyVmNn
         zjodm430/N3D/9YVdrpuCN0TKFWXSph8LoSRG7J8M7gPzKyMlug2Z2Y3gGRnyXh/39o/
         f1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824234; x=1757429034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH9KVtMgBsrkYXH8nnFecmz5YKaJj3+GxgiEXc+y1YA=;
        b=EWIYf0GOq1yR6vqDPWybPxY6QVw6W2e6T0vGOOwdqotdRsMGokRcxRgjHnsnLW1xWr
         2ByJA3LixdZmhUxWn3l70MOx6tPYeccGfpKdneSFL0EqTeEnCf5JBhB1ff9BBz048Znz
         Kp5gZu4FWNM9UMnaCmQ25ZtPG1pjCAQaLOiAAHqGMBCUeW5t+IFtsuOveZo8r0JYwoMR
         d4vc12PyGHHP2uRDd7Zpl+vDviqwK0/IOOwjY8dxv0ht4vrORUMBL1b2Ki+hIhAt74Zt
         lk5Xmtd6m4SfXZgngfS8pxI7wY3eBTdVLBsQNppNuULmTpG//+wns+Tj2dT1YYLDYFUS
         34Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXU7PeKvGE7bXYJYDY8jOKmnNbWD+rIuVB08FjUmiSwXzof99hu4UG2NMgDd9fP5zGe4WhFhYHe0PZ/2S/nF8oi@lists.infradead.org
X-Gm-Message-State: AOJu0YwxloBSsLktCkPj0yywbHiMEDMMV8WQD4g3kGFeDQNjZ6o26AFI
	acQm2v+wN3N2Wqt6vvwVyYsvdF2B0p26mWD01pkHDo12dmaqRg2ALwIehra9gCKpWRE=
X-Gm-Gg: ASbGncsiXn+etx//OkSvAQA8H0bWb1PFhzepR7A8RufdJKDBjNEPxQG1pqz9v2trSn9
	y6lj/EBeXa/ycsSxAnW/ILQfxQrPWYUUmBeKknJ0OA3jqHhH0gqDPJQn7FzGRiqU+rTaFqQ9K0x
	+BxELmliM2m6HG0YMwCSTxFHjbUQW9P/zKzzkTwOAI3piZgMpbCNpG/fvcFXOekPGyuRdHsWGGY
	YkMcXVs530stTjUVhHjTW6Q5mWAJdCUt941s6BVtGpf/Un82ywjTGYKQO4H6CTuCfztgE0bbP67
	fyL/0jSUeJKASS/2isEgxnzMtM9QBQYn6NyAd5RYu0/eG5Jl3aArN8KpPmqAI/rUT1dP/LaCR4w
	1VNdMZLaPRykQowJtkrswMWVbPkXhyKT/+yVH
X-Google-Smtp-Source: AGHT+IGpupBT6EHFzOMLYCsL7LBAOUDN4k39dYPwyyUTNOojUsQ7qqzMe2eWw9e30BaKnja3qYWcIA==
X-Received: by 2002:a05:600c:1c96:b0:459:e466:1bec with SMTP id 5b1f17b1804b1-45b979f4207mr21840595e9.2.1756824234329;
        Tue, 02 Sep 2025 07:43:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:5982:3242:38ad:8b12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab093sm209604635e9.22.2025.09.02.07.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:43:53 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Tue, 02 Sep 2025 16:43:50 +0200
Subject: [PATCH RESEND v2 2/2] soc: ti: ti_sci_inta_msi: Enable module
 compilation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-timsi-v2-2-a5bf0f32905b@baylibre.com>
References: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
In-Reply-To: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_074356_020054_F59CD371 
X-CRM114-Status: GOOD (  15.11  )
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

Add module support to the TI SCI INTA MSI driver:
- Change Kconfig from bool to tristate to allow module compilation
- Add linux/module.h include for module functionality
- Add MODULE_LICENSE, MODULE_DESCRIPTION, and MODULE_AUTHOR macros

This allows the driver to be compiled as a loadable kernel module
named ti_sci_inta_msi.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/soc/ti/Kconfig           | 5 ++++-
 drivers/soc/ti/ti_sci_inta_msi.c | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 1a93001c9e36..0a9eb5ac264b 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -85,7 +85,10 @@ config TI_PRUSS
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
-	bool
+	tristate "TI SCI INTA MSI Domain driver"
 	select GENERIC_MSI_IRQ
 	help
 	  Driver to enable Interrupt Aggregator specific MSI Domain.
+
+	  Say Y here to compile it into the kernel or M to compile it as a
+	  module. The module will be called ti_sci_inta_msi.
diff --git a/drivers/soc/ti/ti_sci_inta_msi.c b/drivers/soc/ti/ti_sci_inta_msi.c
index 193266f5e3f9..d92cab319d57 100644
--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -8,6 +8,7 @@
 
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -115,3 +116,7 @@ int ti_sci_inta_msi_domain_alloc_irqs(struct device *dev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Texas Instruments K3 Interrupt Aggregator MSI bus");
+MODULE_AUTHOR("Lokesh Vutla <lokeshvutla@ti.com>");

-- 
2.34.1


