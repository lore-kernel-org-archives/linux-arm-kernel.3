Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A6AC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QY6qi/R3mC6I0PBGDy1HO7PBzARIBULA1F9iuDzkGGs=; b=Q0W4UEd9wUZjGt4UZwx6unpgie
	pniE5/f/G4XuHiHCdnqgIiLe9VMbJu/2aZwd1IJlSukvVSX0vnDykXIVWg5cGrOj3gVO6AA4DCoHX
	PQRDHYfjZT4tGnS4+AabdAudp3HtZjSxUNBQ0NOgEjCWizSpzrYA+2LGkMnS5IB6cw5GpuYsGMpEI
	yIp7AqBegmxch7FfsCMuHHnG/wiNHefVUsPGTpGCJ3bSjD+tItXQB8VsBa9WUepp4sJRRJ54vNG8+
	uu4fHs/tFNl6o63KzHLExhKIH1SdRC/8sog5D8seEU5ud0d5rfRcOD/WLmu3QZ226onomQSiV0tav
	aarUWXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2mY-00000007dBm-0Olk;
	Tue, 10 Jun 2025 17:29:06 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP024-000000078S8-0n5J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:32:58 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEH4010672;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QY6qi/R3mC6I0PBGDy1HO7PBzARIBULA1F9iuDzkGGs=; b=FTtIne1WwKDShxW6
	qiQ75QMff5a8dSHQnou5WWxhav1a1CpZObjO/GlW35ywTJKm2JaNYiiTpoAurTJ3
	Ol8HWttCSXxp8rjcp6HzykV7MEmhQzh28cZ7E3WvMYfioDZcM0ESVmLXYTvHH/yL
	7jegI0dRQ77ToqyRlJCQHH2FbFvVzXgTjZq8wq/eSWI78aSq6LWEnr3lnG3QV4qo
	3IeWdoGkBlbqLXNNSmFTHYwAJBR0POkO91sO1IgLI1a2MYyGtHzvpgIo1Wohml3X
	brWHJXImgQtDINoMZWEoMCW5nPh5y+ZfyG45NMLQo+JeXWBfGdgtk0kWIAD3+NVg
	o1daxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y0531dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C99F54005C;
	Tue, 10 Jun 2025 16:31:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B855FB37BD5;
	Tue, 10 Jun 2025 16:30:46 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:46 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 1/5] pinctrl: stm32: Declare stm32_pmx_get_mode() as static
Date: Tue, 10 Jun 2025 16:30:38 +0200
Message-ID: <20250610143042.295376-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_073256_725631_42813E41 
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

The commit acaa037970f6 ("pinctrl: stm32: Implement .get_direction
gpio_chip callback") exported the function stm32_pmx_get_mode()
and the struct stm32_gpio_bank, but these were never used outside
the file that defines them.

Declare the function as static, drop it from the include file and
drop also the struct, not anymore visible outside the file.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 +++--
 drivers/pinctrl/stm32/pinctrl-stm32.h | 4 ----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ba49d48c3a1d1..3abf47e31c019 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -122,6 +122,8 @@ struct stm32_pinctrl {
 	spinlock_t irqmux_lock;
 };
 
+static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode, u32 *alt);
+
 static inline int stm32_gpio_pin(int gpio)
 {
 	return gpio % STM32_GPIO_PINS_PER_BANK;
@@ -798,8 +800,7 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	return err;
 }
 
-void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
-			u32 *alt)
+static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode, u32 *alt)
 {
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 5e5de92ddd58c..8790fef2d58a2 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -65,11 +65,7 @@ struct stm32_pinctrl_match_data {
 	bool secure_control;
 };
 
-struct stm32_gpio_bank;
-
 int stm32_pctl_probe(struct platform_device *pdev);
-void stm32_pmx_get_mode(struct stm32_gpio_bank *bank,
-			int pin, u32 *mode, u32 *alt);
 int stm32_pinctrl_suspend(struct device *dev);
 int stm32_pinctrl_resume(struct device *dev);
 
-- 
2.34.1


