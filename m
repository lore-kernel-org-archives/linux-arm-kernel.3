Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376A9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KGnOL6zOW5X0ya7fBxl7f8BKxT9nw74oMzFAvnhYmo=; b=QJr4tU7ZBYoHi4N7H8kTHj7SdE
	002tgSH8CMRMcs2OiwCntBCGe3ShystLawrK+3soJRRTt+rVdxdVpXCpEoMzsVXbCjggX+4XMv5wE
	MM7gsGfTSFrAkHJyyiVzdJIYDwshuuiMNYhb2TtoWh640pcS15vYB1q6l2bSBUJsWlyvIJdpJS8Hv
	mde37OQscOrRyeAULPnpLY8wlDH2TLW9vqXLL6Tl1kM6vOB2jP4sL6S9ZKutsGcaxhDZsePpdDzRL
	g3Y4jbf44lqCx00ZAdN8zK5wedonUrJRJMYHMHLX5ik5o+KrTJ/TPbLd4Yc9d4KWh8Pt767qTW1/Q
	n871Vp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hqQ-0000000GRnm-2E8C;
	Sat, 12 Apr 2025 20:52:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hXX-0000000GQ3g-0tff
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 20:33:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39ac56756f6so2605200f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744490001; x=1745094801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KGnOL6zOW5X0ya7fBxl7f8BKxT9nw74oMzFAvnhYmo=;
        b=KRBzm2k6vSzYw2rGfk7uXUuXqZ1yM5H2Crkl0pxVoXrqmuY+qIiaTQGpuFuK2K1n/s
         Hf6AMQ1QzoUbhp2uUnZKuinXCegcAXhCid7aHt6RH9NLYaGEzC06VMPGU6K4hbGQ3W/G
         AVq0bGFIWxK3XdBpB+tIRyvUs8vqoYCgmpa0RLtVcssSl5Rr8mixJHS1RV3E35LDdkfH
         sCEzlNiAFphNPAWNpqgMPrCtkhoElKqX1oOEgR1B+X5b4p6jLccCXK4NwBTUlrFsmhs/
         LsSE7yfV4ZfxHppTJHML5KQuiBO6Y4NToFbxTbJ5w75DSVUdF2Rd4MjS+YypzUenCunH
         cuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744490001; x=1745094801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KGnOL6zOW5X0ya7fBxl7f8BKxT9nw74oMzFAvnhYmo=;
        b=Wnmy83FY/903Uak4hXWCzRbXEAdmTvCVSbujJGDI8G8L+9UnySS5fqfBrYZnedR7Wv
         EY0D6bWxSc29klQrj5G3/P+G7+3rwIHJpZkWgDo9D01NQdHNkPTO88XjUBVlaQxf3Fgr
         2+zQ1mxuiFnldE0VHiOycvxaxod0yGR6KYZIc9zsSqtfFi0maoTWrI5u4Sxd+k9UgVOC
         9ZznEdACKtvGToBpEqEt1c+TesgcXuAhdbqVzgh3S2HdR7gVADZFYxos0hvhzIfQMDB7
         mK9luBOxI0kZBUt4eNLb1ScTh8z8GBRTjTmuEg0//ue2XCyXFEBJzsOwS8lEyr5Z9qq8
         RPSg==
X-Forwarded-Encrypted: i=1; AJvYcCWotlIWv8pyIyYx9XuN0CCo0yupvTRYhevrTDke2raJSg9QthCPfTSl2ab5EYFQSa2PhcJNelGn3O4GWxqnSQrD@lists.infradead.org
X-Gm-Message-State: AOJu0YydtbTidDdqRCEdbnNk4QdW6uZ8JfyvAxIhj0f5MNsCsABdfb99
	NKETYwqh0Tn8UYCX5k3WINttwbYItVfDREUQHiztxJ+s9VblqRen
X-Gm-Gg: ASbGncvMZKfm5aK77mV1Hb2CwMpRiRIaoKBpCQoSb+RdUsUgczndx7Kqdgis73EeJjN
	x8b6DswS/qOQSURS85OdfUouAhjXWZgIPtK75eDTq1lSDUJFtSdQ4hRZbLQjKxK2UcgYpg/l7rI
	dLsavjin6iUqGcnmdTFkwko/8O5KhCH6NJJud96LhYUuzTj+yM4TFU8KE1i8hFAvn++FWG2CTwg
	FWrqop2dA/3ePL9AKSoxjFrbbu25b7scFDJIsFynAQp+CydUjA5GJp4m/WzhzUrFT6fSL5/gVSs
	u+S29SkpJqp0CHAF5SFig8YH9MCvSO9olR5To/xJF1YxmISZwPw3enwF6sZgBpmKRq7N7ZdVLC7
	RRhJJz64y1IEIZAvA
X-Google-Smtp-Source: AGHT+IG5LOI1pesFPQmRAVlPiYfeXozU198XAF8Q6TGdiddjdZMVjob+wqLzV6mTW9QqbhDA2VY/iA==
X-Received: by 2002:a5d:5f53:0:b0:390:e7c1:59c4 with SMTP id ffacd0b85a97d-39ea5206aeemr5751863f8f.13.1744490001327;
        Sat, 12 Apr 2025 13:33:21 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm5941896f8f.76.2025.04.12.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:33:20 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 12 Apr 2025 23:33:13 +0300
Message-ID: <20250412203313.738429-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_133323_256639_4B01F83F 
X-CRM114-Status: GOOD (  12.12  )
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

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index de686b9e6..20abc6a4e 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -183,6 +189,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0


