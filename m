Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2424E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AhTF16+4GHJDcmn7BNcQctD3GIASyb4i+W0iJLxljo=; b=zZXvLxTo0dSmY3ENKdYqKn0Q4u
	DdT+jiDyG6zG4qAOEUM4kkkbJxuNrFBJ+5dJR5jhYSqj8IuZK7by7g7KrnzAYHaNawGJ+VT7abIrI
	hFLnMqddrcRucKP5+Y3nWkuMHXOvyCENgL0PsfL8rjsrRkrnXmoty+bcx/xfI5mAGCjraMvnHnYIc
	HuHrp5DE74s3bwsvSW9xl2xw9YLdOtplYTxdkE8glIiL9PTWc011urUYhrJPJaDqEDsa6zikGUw4/
	bZiw4QxokZN0xpPg5DAvx6zNouLOqfN5QmSOMZBXVZoS75u/YYTigzd9YMiHTaluTkFQ28C6QEImi
	cLf3Y4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAjU-0000000Cg5Q-0FNv;
	Tue, 24 Dec 2024 19:38:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAiH-0000000Cfur-1P4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 19:37:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2550429f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 11:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735069023; x=1735673823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AhTF16+4GHJDcmn7BNcQctD3GIASyb4i+W0iJLxljo=;
        b=Z49O2XUURnErs2dEhRsgmhdKUQaFGwQmgKbKK0Sf3/VkCd5PbNfzG0NDnVV/s/7adJ
         0nRVtuT+uWZ5NIaskP+YEvvrauUC1fPWZk4juUYFMx+MCejP0stKJt00e8G+nfQiaqpj
         8bEFIdp8cAAC04gOx+a+AmYT5ZEIVjO2JwpIPQSHBPORwU3VZP70guCVf4m89qXFcIjX
         dp3fftNIEJoy10R/BMWqrb6g/YruoimGX6bGac8pJypL+sQ4U0v7nCJHura6WTQ+QHbS
         j1KLZW/BxjJffpvGgDwM1bP6CTzg7sghPYoundRugyg81egwA4WGjhEmWDxtQ9F5AdXh
         D4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735069023; x=1735673823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AhTF16+4GHJDcmn7BNcQctD3GIASyb4i+W0iJLxljo=;
        b=uqzoRMfg44JljT+NDUAiibLwoWYRP8k+OntIVhRzfVVFX1yINpBF04EHpNR99ERuDh
         ewhDXY3MSlzIvU16A4HHnSrrfd3ajDusbV/CGHHzyx07ad+xxQ8zD0zdxDdfREUSKl9s
         +jIyFnl7aLpTfSq9XbhU/kBqX8dnB2yHSAtE95/fz+e4hSSKDvtpqtuLbfHEmRHcgD4+
         ptMsF7Cgrggub5j87RmSuRvcQ1PHt2fb/t30pBIocpXlPodHYILUa8LbNAsTkaif6TwI
         RGpr2gAw7/kxkBcPgUb6T+QsHdfgvfy3DUftXaA4zzSml0I3ZVuNFqjRILOJV5L8O7n/
         /mnw==
X-Gm-Message-State: AOJu0Yzv7weuXONzKBH1oVOIWCJiQVpxHjAMJgbIr3Qo+oHmydKU/fgG
	Kq6vPVzhvE1gxgPCTOuwDqxS1TibnrX+fyCw7Cterz/8v7RZh/WQj3VF7JzMTUc=
X-Gm-Gg: ASbGnctLx3YeBX27fmaYAfkaU23+gYPdvCebVcsl2HMd4FCrjnBHA91wYwzHTh4ti5Y
	n5vpU6kTF5t7IsUHT+mJNweBKaR2H9Hps/WtdebUxtfhVdDS62ZK+k805jAy6izEgtMP2Tdu0Pi
	2HO5z+MhjTGAjXKiAAIMbTNhwVn0q/oO73vxjaMj1njJgs6EeHlZUvLUd1Qhps9BVnopOltUizH
	5Bhaaf8oPowwExSdjN4Dr3Ef2Hd5VmDctZW0qsICHUK6+xrCaiVygu4nvj3
X-Google-Smtp-Source: AGHT+IEt0LJOQXRwGbvhcle4dDMlKJ6orsA2KJRSaLZN9Bii2DRSRLvn0wQ3gl/SeJ8Wdz74pHSfKQ==
X-Received: by 2002:a05:6000:1fad:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38a222001b1mr12297303f8f.32.1735069023273;
        Tue, 24 Dec 2024 11:37:03 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:d40:ed60:c48a:f4b0:6773:1823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea4a7sm175691355e9.3.2024.12.24.11.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:37:02 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Tue, 24 Dec 2024 20:36:42 +0100
Subject: [PATCH v4 1/2] irqchip/ti-sci-intr: add module build support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-timodules-v4-1-c5e010f58e2c@baylibre.com>
References: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
In-Reply-To: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 vishalm@ti.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Nicolas Frayer <nfrayer@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_113705_384701_B4C518F3 
X-CRM114-Status: GOOD (  13.08  )
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

From: Nicolas Frayer <nfrayer@baylibre.com>

Add module build support in Kconfig for the TI SCI interrupt router
driver.This driver depends on TI sci firmware driver which are aready
support module build.

Add MODULE_LICENSE which is mandatory to support module build.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/Kconfig.platforms      | 1 -
 drivers/irqchip/Kconfig           | 3 ++-
 drivers/irqchip/irq-ti-sci-intr.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 370a9d2b6919..eda592ac9c8d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -135,7 +135,6 @@ config ARCH_K3
 	select SOC_TI
 	select TI_MESSAGE_MANAGER
 	select TI_SCI_PROTOCOL
-	select TI_SCI_INTR_IRQCHIP
 	select TI_SCI_INTA_IRQCHIP
 	select TI_K3_SOCINFO
 	help
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 9bee02db1643..1099691c45d5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -534,8 +534,9 @@ config LS1X_IRQ
 	  Support for the Loongson-1 platform Interrupt Controller.
 
 config TI_SCI_INTR_IRQCHIP
-	bool
+	tristate "TI SCI INTR Interrupt Controller"
 	depends on TI_SCI_PROTOCOL
+	depends on ARCH_K3 || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  This enables the irqchip driver support for K3 Interrupt router
diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index c027cd9e4a69..b49a73106c69 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -303,3 +303,4 @@ module_platform_driver(ti_sci_intr_irq_domain_driver);
 
 MODULE_AUTHOR("Lokesh Vutla <lokeshvutla@ticom>");
 MODULE_DESCRIPTION("K3 Interrupt Router driver over TI SCI protocol");
+MODULE_LICENSE("GPL");

-- 
2.34.1


