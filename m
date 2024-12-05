Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC9FE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C2qCz2oyAWXcySnvC/YTGdboyjGwCf8uvEh34M5NQ1w=; b=XwbKiYby8niCaBpYlthbJtJhQa
	blnu3leOjNiOQw7FAlrNXETxou2N+uZryHli8jxSiQgXMDc6BPbefLwEWrksmn/ZYotB+rDHIzRV7
	SUR2IowIKD+gtuz8w2RZnIMcztRQCXCwU6++xZ9WS+A21go7qZxP5b7hHSvG0+C9j9IfZr3XF9Q5s
	4SuPClcLv4XtQ37jdTk0Vj8CoNKoU/WsffbaWCw+CI6xdgHWlSEhY7/tk5liTo7+lSvcgDVbdrDdG
	2P595fCt1Q1mQc7dN34iCUnTFDBWCLYtrPYqedPanIVn4cjcAcnitnmudA96iUOX9sakTWl63zJhU
	mDR6QRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ90k-0000000FUqH-2MNy;
	Thu, 05 Dec 2024 10:23:06 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8zi-0000000FUeS-2NKf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:22:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa549f2fa32so142597966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 02:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733394121; x=1733998921; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2qCz2oyAWXcySnvC/YTGdboyjGwCf8uvEh34M5NQ1w=;
        b=wF17t4K4IftoUAXPknb5x8rNCjdBBerbbAuNenYo5VxXXsDpy7sJT6WCl4vnbh7VGj
         mYHOfBx9AR5kPs61CjA75Mk0JAMjvRXPG0ZGpWmnLYHUeHgk1vt+gwqyPKtUZeNYOOJ3
         IpHcuQ+HJTnfPrkw2b3rdJNwb98ME/YSSZwrZjSGlI3e0LkNdWtQ2EBKbu4lvnuA0UHA
         2uVMpdV/u5bt/YqcY/cfct8EJ6lvmEA10Weel5Xc7Psaqs0NEPvMo1hZK6hi6Fh5WlUp
         /+HT+KFkEhGSFy3mpgEu3hbCzQ/V8WTTJONJqWEwOlJeAv2ulHiQaG9Vs6OollyC4wHf
         c3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733394121; x=1733998921;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2qCz2oyAWXcySnvC/YTGdboyjGwCf8uvEh34M5NQ1w=;
        b=NzIt5ApjqB/v7k80WTLZ/xHZm34L+NXxiY2DihjfFKdGloqrRHEKISsrcMZLkVltn5
         L+qR35A1B1GhYHmyqWM6muMCa59z/HkhEvjxvNhlSfqhRSktVX/TtUW8gzhN+9YKI1XG
         ONu3oJSnWQJnOXsFExM4g4zlwW23Mpjzvj6of9YuF0mJLqOrBEjbJRt7qJ6btcE4vqyn
         whq2c6VTawWsKBOpYYTFAyczAycRLqsiVoAy77otafCJImsKkWB3r8e4KovgT0b72jZD
         Z3GwMz7QXbTOmPHV0wkEnUW6HW4ZaowJxA2u9PK1ZAu2cMUYw8QR3Pmj9tJCWdJNWCVp
         kllA==
X-Forwarded-Encrypted: i=1; AJvYcCVQU+GaDPZOTBiaO33lONL3KAzIHW5uXCUy3sR6rfRlYyhbLC9OsSXSGnkc/QxYjuob9lzfQ8t6DzE6e/X6iBRt@lists.infradead.org
X-Gm-Message-State: AOJu0YxaAoAuxumwvzzCVoMsNfWqfaiO1eNSOgEZUPtTErrb5OIiAkMD
	qfP0anyGf21CtunmuJtaZks/OmWxwydYQddQHOkzvThIiX9aNmWYPvq8xI/9n2Y=
X-Gm-Gg: ASbGnct0D8/byhan8Mj1g0LRzAHRt17FBWFNFc9rIYHe5Ewy70RcIGUySQ8Rl2cX9Bq
	CwumuUCDVgLBw+Ds2X8TG5ARKLX9Q1Ur/OqWTa/febBNcLaaLcm/PXgTw0ZYHWO4wklnQd2aMUs
	KiX+Kqlk67lw0TAPNPoaENMigRmSuqkWZys00DWJGT2RHDXhP+W321LIzleCE8otw+UewnJ3IkH
	Y5SOioXNNSiyn+MShABb5Ct37ACK/UZWgDUkzhyAQQ0qIgY9Zym+MxWDU3j3OIAiIyzY+vqn8Qg
	mQQ2laOw+8w7Ws4HmOf/sTueSs2Nz4aWjg==
X-Google-Smtp-Source: AGHT+IGIzS6w8nmzLwTehZGRCWLb5o+CLPa7VmxDEuLmOqo4b1mzG0cAAJu2wok4wnlPx8fiTWLtkA==
X-Received: by 2002:a17:906:3d31:b0:aa5:41b2:e23e with SMTP id a640c23a62f3a-aa5f7da9717mr766598566b.30.1733394120780;
        Thu, 05 Dec 2024 02:22:00 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608f57fsm71606166b.146.2024.12.05.02.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:22:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 10:22:00 +0000
Subject: [PATCH v4] phy: exynos5-usbdrd: gs101: ensure power is gated to SS
 phy in phy_exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMd+UWcC/x2MQQqAMAzAviI9W9iqA/Ur4mFq3XpRWVEU8e8Oj
 wkkDygnYYWueCDxKSrbmqEuC5iiXwOjzJmBDNWWjMOg1lg8dMQ93rjIhTQ513hvqpY85G5PnPX
 /7If3/QBAd16DYwAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_022202_597911_16BFB857 
X-CRM114-Status: GOOD (  12.72  )
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

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
CC: stable@vger.kernel.org # 6.11+
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- separate this patch out from original series
- Link to v3: https://lore.kernel.org/all/20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org/

Changes in v3:
- none
- Link to v2: https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-5-40dcf1b7670d@linaro.org/

Changes in v2:
- add cc-stable and fixes tags to power gating patch (Krzysztof)
- Link to v1: https://lore.kernel.org/all/20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org/
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index c421b495eb0f..e4699d4e8075 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241205-gs101-usb-phy-fix-2c558aa0392a

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


