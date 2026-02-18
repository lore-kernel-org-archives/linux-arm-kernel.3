Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89402E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=; b=icsD+Dc2663V3Is4I/XL6vSrI9
	s/HhOcWIxRxZ9w+oYoorZ60ZuyVogZbU04V/9qDgINVxjEPGhc6K4+DzaLMWd3xSlK+Bu3NfHYry9
	YmkTP+qqmd96DH7siAcJ8e5VFDU1QkZMv3viPEkap9BKrFJrzK04x2E90LLLsC8Qy9ST0CNwp5DtS
	xcuMmhI9UADt3B9fXZ4MaTOA4xN8rnr11TxdtLV29SUIae2UTTaO18q4GUKZ3C/bPdKLCmV49wCI6
	W7HEUXTLiZCEwiUyb0u4fig+mDwuTZ8WWnDJleXB1GdtcUk2U9qDiqliln8L1P42LcKTkBA4/Qj53
	kjWEZumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsklw-0000000A7J1-32au;
	Wed, 18 Feb 2026 16:51:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsklu-0000000A7IL-1a04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:51:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2aaf43014d0so39793605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771433489; x=1772038289; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=;
        b=IUD202WpZE9h8n1CPvGr4KxoHrrOtPrhhUE3TiLTiEuxQ6vw0/s2DFuYmxTlhzjqRJ
         YnYaxm/IZAE72BAIbCQSO3wCmRqkGBWilPDOR5Z+pRR1dL5yzBadOUnxFYvhmib91vDz
         RHvEnhvclrJXLfftrAKovuoS8m2rfFdxhLD00SSWxYHp99Z3kM2rWCIyrT27+PgSaS/N
         mjrctHQQlMilEzNNb1xdhsBu8UlIEcN1CbIVGAtJFq3AN9aDqcRCFDJWT7K0xJAUBXLH
         S+VHNwlpVbp+fN7O17Fkpcyng2AlPlWdZu/ENzx6xeGZrTqY5UiPUK7UDYMY8Upr1R3P
         jnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771433489; x=1772038289;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=;
        b=X6pIaY2z8dH6qyHKxZfNWkW+gjvliXL974UL27ePDSjuAGM2Tv1q2pLJcQKBQ4TO3u
         IqW12nhKis1P/DA210R3hUqirqWsnsVGiTUWcN8lj2WtrsKicvLr+T8VLkNohAB/dv3A
         bXlyemEeD/nyfKn6RipTG06eNDkpk76069bzi6TDVgisz5UAsy+nc/uKW6RcyiCsBR89
         ugC47U209MgvTgZ4l1m3cmdjx0NB2oIfwFVRQA6r0WvoXJ8CFYs/28SmpcnoUkzB/lZd
         wRMJkNMd5Q5ob0H1mtoO36jU4A02uGvNcDyLD3yWsUbtxUCML9oAzQxNLFD1UmS/ntyX
         XhJA==
X-Forwarded-Encrypted: i=1; AJvYcCXc3jjYVeJm3QFWn9dtapv4a6Gp06m77EZdeMGCUW6dNJQxYnpfGV8GKUxUxRtW7YPynZnZG6612Ngr7X0hZ7af@lists.infradead.org
X-Gm-Message-State: AOJu0YzfVseTK0bBh1K17J2kFBJb2iShEiD32EROzNL6/aNl9l1aZVoB
	VOif6toDxQY0y5SzSnLKkVuuijcep88v88y9x2STn/eShQeKdSwCVaFt
X-Gm-Gg: AZuq6aIY6vbvWtX1KsKxICQ6jv624yfHuZbm5fs7DIUeKZNVw3gVozUlCgq/+Zg3OvL
	h6IKj1A1e84E6PsbTx8QKtBhMV0XPwr9JuaPHEwyOvUvQbIlmfq53uDPB+AMh5xjoRa55znG+oC
	PhVLJjkgqf+4iJQ0XaqVANBR+2i/qOmFP/ZiFbLxT9lsHk3MSB/FaI5PV5ilvhVOL1ThBv2oPy3
	pIkLaRIIQOB6lQKVWnrfI/FjdEJ6IRO+5HHirCjAzYvKqneEQ9xZc1RfvFrE1+fCh2GHesbHrJT
	2GQm3s1szhlzm/E2EUTw3+cUfH+ItrGOMbyAtJAKgJsNMEkA+betmhMLrBmi04D1dKvAIgBDHso
	IXuSbtS2fdrSfLo0OrbHgjr0wV9zk6NCgI8UXIDQzUhMQFF4H/A+2faJF7CJdc5DCoNH2gukUSn
	AAOu4DCiJD7fW1IlIB/ok712ygN6LKM/q/3/w3
X-Received: by 2002:a17:903:244a:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2ab4d06157dmr192384245ad.46.1771433489047;
        Wed, 18 Feb 2026 08:51:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:403:e988:3f54:236b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa5cbsm176996885ad.9.2026.02.18.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:51:28 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 19 Feb 2026 00:51:22 +0800
Subject: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference leak
 in aml_dt_node_to_map_pinmux()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAnulWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ML3UQTXWNzC6MUsyQDS5NkUyWgwoKi1LTMCrAh0bG1tQBDzA8VVAA
 AAA==
X-Change-ID: 20260218-a4-3782d6b094c5
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771433485; l=1449;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=T+ddj9uth8B1FutWkYbruKcbeWNS950unthpcpOU8Mc=;
 b=j/cNO7oUv8KJAFH9hBKE9Q7aZLY1Mc9Wed+OTyOZmsNOTm2f+C274WzqExLijzSUROkMgdDav
 o4mMxRI63ByAnFOh6LcG2J0gZRy7RUaJv0GeXAc9vcUSRSY7hbUR4BM
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_085130_433778_944A3772 
X-CRM114-Status: GOOD (  12.93  )
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

The of_get_parent() function returns a device_node with an incremented
reference count.

Use the __free(device_node) cleanup attribute to ensure of_node_put()
is automatically called when pnode goes out of scope, fixing a
reference leak.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index dfa32b11555c..e2293a872dcb 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -679,7 +679,6 @@ static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
 				     unsigned int *num_maps)
 {
 	struct device *dev = pctldev->dev;
-	struct device_node *pnode;
 	unsigned long *configs = NULL;
 	unsigned int num_configs = 0;
 	struct property *prop;
@@ -693,7 +692,7 @@ static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
 		return -ENOENT;
 	}
 
-	pnode = of_get_parent(np);
+	struct device_node *pnode __free(device_node) = of_get_parent(np);
 	if (!pnode) {
 		dev_info(dev, "Missing function node\n");
 		return -EINVAL;

---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260218-a4-3782d6b094c5

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


