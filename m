Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A39CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiOb+44+abYoeDQ7m5UxjJUCp2UOVKxX0zLt82/lfMA=; b=2aMO29KcpUSEbcDyKrQHR66IUX
	YAowecoSvDFC0JnLDsB05UKR/4xORkLvqkr29Du00sduiBbmdBEQ0QS55jtETdoYfZgP1kCSW0XP9
	yZI6R3BYLULohmsPWm6i2fuNeKvEMk5nzFIFm2Yr4QNd8gJjTmAoV+mjUmhs4VEbvGQLol1149TGD
	epoYWvstgKL+CpZdwtnTN5ETKObzqcX+ZrLxu62ZbWS1Bqy1rcjvBI3JpgNMB7YdontH0Wx10GmSf
	y2bPzkZ6t8ObyKESd55q6UUbvFY0esL8Z0BOWrHIGLsbGU2C8dHJ3kaMqAwpoHg7G6/ucmdTA1r7C
	sHYk6Y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYQ-00000001ToI-3hne;
	Sun, 14 Sep 2025 14:18:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYI-00000001Ted-3buC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:18:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso8712695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859481; x=1758464281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiOb+44+abYoeDQ7m5UxjJUCp2UOVKxX0zLt82/lfMA=;
        b=K0qnCkjkgWVXslscy5wYUtLlCJq/6/jEc5jWPYFKAWQX7JlQDNhvpLO8OAyXUVWc57
         70BIWfleBZbYbwPQvB6M1Sha/41iMltM8Yke9NtEfK0EDcNNtQVmmMJ6cYgFjmkSPQuV
         o8cfTRw0JCkE1kbHxzspOyCQNFXb1FCQl6+Nikmva52wBfNPXJeTnBNpZMfwBdGNmXlm
         uHHd/Os1PaxbPUDNxaMO8zRd4CxqJw3/iw4zp2OUeH9U2ZMCbKlZgdf0pd5BYs0g+q5n
         2WLQjfvtBjzLInREbfImK5aYyuBVtVpWtUC/mgENoWkrkjCZh0r8s/k9zERbMfuFWs2x
         nubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859481; x=1758464281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiOb+44+abYoeDQ7m5UxjJUCp2UOVKxX0zLt82/lfMA=;
        b=ab+fYW9EnveFfFkCPvq++rIWSAFtA+hOddFxsMWfbS55Mw3COgxF0w1ClJPIUErU8J
         ZHoGEGMQgB5M1V60ZsTPTc8eMHU6qvKJh9QABonyxjdqdoudaTitUnYQJXuIRmkkHcGN
         clSbgpANd4PKEO6y143eOpJk2dxb1maMKR5RQsddum1QWavGuxTvXKFK4H0zNYBAXjeU
         Twxv+xl6aOrkCHWJc5CtYG++2K5MOC3u7vRSmgKc2mVOpFXHBmkAdBtZ9vA+YsKmcL6l
         BSEX9Lv+zWY6JwJNJJ+5drbG9PVFqST5Q8r0w7rtGKDPbzHAZP8vvx4hsv2rx0sFa/2u
         ua1g==
X-Forwarded-Encrypted: i=1; AJvYcCUt0wqENysK2lv98x0bj/nQRocdVydmYjHEB2xeGYxFkksC//ihCezAtt8g/zpQZ7+SziNNSfefuY93MIm2oVg2@lists.infradead.org
X-Gm-Message-State: AOJu0YzBJZ/Nm+rJ1jTAG9SDIB9vATIfZAW4Dm6jMGKQEnNVrxsA9UVt
	KCXXFcwJFGTIcwAyPni7ttuddt1oTspR6y2T+o3339Skh8cNZj4OwGLxwBlvOw==
X-Gm-Gg: ASbGnctL7nJb9PeEFOKLINcdLVAq+YW0jUD06CrWvs3BlTSvxHboE4bL8lnwKz+Msjg
	ojOoyyC/vQVB+Pg0SVPaL/VZCNJfbQVcsjESIbgBfbSeqQbZSgc8qK9hINev4jDKlMYhy5KpjQ3
	go6nOqUD0tugTvB1yTYLf6MTEGHz158Xm+TPbid1CafUDKDLpb5/z5Vz+GTQBM1V1mSIhZI7Iir
	ZEz/Sit90zUAyLcQjB+hWkN6j1CKn5grFOCd/ciqwf0qTrva2DjmYyDuU2+59GPjIFAWRsgI24s
	bk8dZyu3s8JATiEON1KgQZGAL1Ey80zwp564zwWHiR0T4yD6xKGY96IReZEnJ1N2UAPu3xhyIc2
	/1y2DETHUqTP4B1AXjDEKJ/wq9wqDO83BrcN6oXTRcdMgE3/QkiPD7ayf7h0pSrpIewvz1PVPiQ
	==
X-Google-Smtp-Source: AGHT+IHcNtfp4F0gd8EyXRgkVvR2EHNAWoXevw2JJmW1HkNfx+wowWJuPHqwAwEdICB/zzepQga2OA==
X-Received: by 2002:a05:600c:630e:b0:45d:d197:fecf with SMTP id 5b1f17b1804b1-45f2117b46cmr81883255e9.0.1757859480854;
        Sun, 14 Sep 2025 07:18:00 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:18:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] phy: exynos5-usbdrd: support the exynos8890 USBDRD controller
Date: Sun, 14 Sep 2025 17:17:45 +0300
Message-ID: <20250914141745.2627756-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_071802_972981_81CD7A78 
X-CRM114-Status: GOOD (  19.07  )
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

The exynos8890 USBDRD controller integrates a combined usb phy that
supports UTMI and PIPE3 interfaces. Add the required changes for USB HS
to work. USB SS is out of the scope, as the Samsung Galaxy S7 only has
a microusb 2.0 port.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 210 +++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index dd660ebe8..546c69442 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -145,6 +145,7 @@
 #define PHYUTMICLKSEL_UTMI_CLKSEL		BIT(2)
 
 #define EXYNOS5_DRD_PHYRESUME			0x34
+#define PHYRESUME_FORCE_QACT			BIT(9)
 
 #define EXYNOS5_DRD_LINKPORT			0x44
 #define LINKPORT_HOST_U3_PORT_DISABLE		BIT(8)
@@ -1302,6 +1303,158 @@ static const struct phy_ops exynos7870_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static unsigned int
+exynos8890_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
+{
+	u32 reg;
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	/* restore any previous reference clock settings */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	reg &= ~PHYCLKRST_REFCLKSEL;
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_PAD_REFCLK);
+
+	reg &= ~(PHYCLKRST_FSEL_UTMI |
+		 PHYCLKRST_FSEL_PIPE |
+		 PHYCLKRST_MPLL_MULTIPLIER |
+		 PHYCLKRST_SSC_REFCLKSEL);
+	reg |= FIELD_PREP(PHYCLKRST_FSEL_UTMI, phy_drd->extrefclk);
+
+	if (phy_drd->extrefclk == EXYNOS5_FSEL_26MHZ)
+		reg |= FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER, 0x60);
+
+	return reg;
+}
+
+static void exynos8890_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 reg;
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+	reg |= PHYCLKRST_EN_UTMISUSPEND;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* UTMI Power Control */
+	writel(PHYUTMI_OTGDISABLE, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+	reg &= ~PHYTEST_POWERDOWN_HSP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+}
+
+static int exynos8890_usbdrd_phy_init(struct phy *phy)
+{
+	int ret;
+	u32 reg;
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* Reset USB 3.0 PHY */
+	writel(0x0, phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
+	writel(0x0, phy_drd->reg_phy + EXYNOS5_DRD_PHYRESUME);
+
+	/*
+	 * Setting the Frame length Adj value[6:1] to default 0x20
+	 * See xHCI 1.0 spec, 5.2.4
+	 */
+	reg =	LINKSYSTEM_XHCI_VERSION_CONTROL |
+		FIELD_PREP(LINKSYSTEM_FLADJ, 0x20);
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYRESUME);
+	reg |= PHYRESUME_FORCE_QACT;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYRESUME);
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
+	/* Select PHY CLK source */
+	reg &= ~PHYPARAM0_REF_USE_PAD;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	/* reference clock settings */
+	reg = inst->phy_cfg->set_refclk(inst);
+
+		/* Digital power supply in normal operating mode */
+	reg |=	PHYCLKRST_RETENABLEN |
+		/* Enable ref clock for SS function */
+		PHYCLKRST_REF_SSP_EN |
+		/* Enable spread spectrum */
+		PHYCLKRST_SSC_EN |
+		/* Power down HS Bias and PLL blocks in suspend mode */
+		PHYCLKRST_COMMONONN |
+		/* Reset the port */
+		PHYCLKRST_PORTRESET;
+
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	fsleep(10);
+
+	reg &= ~PHYCLKRST_PORTRESET;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* Configure OVC IO usage */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKPORT);
+	reg |= LINKPORT_HOST_PORT_OVCR_U3_SEL | LINKPORT_HOST_PORT_OVCR_U2_SEL;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKPORT);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynos8890_usbdrd_phy_exit(struct phy *phy)
+{
+	int ret;
+	u32 reg;
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	reg =	PHYUTMI_OTGDISABLE |
+		PHYUTMI_FORCESUSPEND |
+		PHYUTMI_FORCESLEEP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
+	/* Resetting the PHYCLKRST enable bits to reduce leakage current */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+	reg &= ~(PHYCLKRST_REF_SSP_EN |
+		 PHYCLKRST_SSC_EN |
+		 PHYCLKRST_COMMONONN);
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* Control PHYTEST to remove leakage current */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+	reg |= PHYTEST_POWERDOWN_SSP | PHYTEST_POWERDOWN_HSP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static const struct phy_ops exynos8890_usbdrd_phy_ops = {
+	.init		= exynos8890_usbdrd_phy_init,
+	.exit		= exynos8890_usbdrd_phy_exit,
+	.power_on	= exynos5_usbdrd_phy_power_on,
+	.power_off	= exynos5_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static void exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	/* Configure non-Samsung IP PHY, responsible for UTMI */
@@ -1897,6 +2050,15 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos850[] = {
 	},
 };
 
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynos8890[] = {
+	{
+		.id = EXYNOS5_DRDPHY_UTMI,
+		.phy_isol = exynos5_usbdrd_phy_isol,
+		.phy_init = exynos8890_usbdrd_utmi_init,
+		.set_refclk = exynos8890_usbdrd_utmi_set_refclk,
+	},
+};
+
 static
 const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
 	PHY_TUNING_ENTRY_PHY(EXYNOS5_DRD_PHYPARAM0,
@@ -2025,6 +2187,51 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const char * const exynos8890_core_clk_names[] = {
+	"ref",
+};
+
+static const char * const exynos8890_clk_names[] = {
+	"phy", "pipe",
+};
+
+static
+const struct exynos5_usbdrd_phy_tuning exynos8890_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS5_DRD_PHYPARAM0,
+			     (PHYPARAM0_TXVREFTUNE | PHYPARAM0_TXRISETUNE |
+			      PHYPARAM0_TXRESTUNE | PHYPARAM0_TXPREEMPPULSETUNE |
+			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
+			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
+			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 11) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 7) |
+			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 4) |
+			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 0))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *exynos8890_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = exynos8890_tunes_utmi_postinit,
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynos8890_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos8890,
+	.phy_tunes		= exynos8890_tunes,
+	.phy_ops		= &exynos8890_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.clk_names		= exynos8890_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos8890_clk_names),
+	.core_clk_names		= exynos8890_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos8890_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+};
+
 static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
 	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
 			     (HSPPARACON_TXVREF |
@@ -2257,6 +2464,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos8890-usbdrd-phy",
+		.data = &exynos8890_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
-- 
2.43.0


