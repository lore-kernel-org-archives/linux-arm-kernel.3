Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C42C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=; b=rHD7HbIThrD97KBjJcka4WIvHo
	xEa//R7tKWhKQD8SrYOaNWG33PFeYsXaGDDxwq6Tfh3jP1HNf7AhqELL1OHLaBU2PMdOWIfcUKQQh
	kLcVluOkxslvYVpqr+47gXY8mki9kxWOPOiTPqzFVrz8iEg5mocR4//R0v0T7jdEsbDCxB0Lbyaqd
	ixiMr6yoVggV5obkXruXO+PorJrvUroP1vsDh1h3tobA5kO5o9lChgaa9v74dp0vrq/ws6BzLWJiz
	FaHBJjGEgmwp6109cF43NXDK2sQTFFT5RnUVvhTnSBItdB7qopOLAke//B2JATdLyMykiFcvkln2r
	Ybkrf2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4MZ-000000086UN-0Un4;
	Wed, 29 Jul 2026 13:30:23 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4MT-000000086Q9-0hQX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:30:18 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7eb68bdf53aso416720a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331816; x=1785936616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=;
        b=K240V/6ihX4MnoTPIqIZiqvBDnqqgECeA52/kGLfT44xzLorZZdQFHfvjoBb6MMWGZ
         FEuWcTXxtHhrZ9a2vXoNib53bAxv4hVf0IRUxAfUAkmN38nj/BqkL2+0eGq8/u5nqh0m
         +5Jne/RSFTZGnoKW3x+zhoUzzQRku8P5okUWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331816; x=1785936616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=;
        b=lRDO2ekkzfUmjJBz4Fnh40zoHwalUV4uJah5w35ZAsoyuFkB0mqesWwG+6pmg7Sn7v
         1xFD4B2XbwVzMZLQMZDLeosXFs5oOumSowtnEe8czuM5lVGuXQbva4D/1zk9rJCCByCu
         6ohmnpJE054806dJTG8DQuCV1840/ESUIAFTyELUdOBFtb70X2r3NTT1DrPaVBCvSymO
         OWSo52FVVpwn8beFqz/nzYsmoBeV5wfTj5BNvSEXq3/oAWSp4qMrdmpusgWpgyIuvVIl
         bz2eV2NI7ZNP874pbOVe0hmni91Q14pzggPwsunSU/A+br1KuiIScXTgLkUi47tqStc1
         CcTA==
X-Forwarded-Encrypted: i=1; AHgh+RqQj9YYidiRRUXoXbpEAOOImo3pfveoGInavV9CBUjJQLkAlvUk1IIz5V7L2/p7664rnJVakKIkdpeN9rnb9u5X@lists.infradead.org
X-Gm-Message-State: AOJu0YyaX2gyYa7oZ7XYG1UGg1sNpytGLrJxa+g+UbPpwsQaMix1LvPS
	SQ0PsQ7BD5Dzx9URm4HOYUrVzNQFVuARuxTzcnTK5mn6+LvKWH8MxeVlHWR+wceouw==
X-Gm-Gg: AR+sD11SvHNn4quG6oS9JsFz7cykayI4EdluOWnuKwKy6W3OUsF2UHVIK70kQZfiGzH
	W86UcgDEsHLj+9LZi1YEsICIowI0fuau/1wBm3N7S6/pdY//6v5/VW3k7vlWNDOiI/uAtZtIlaQ
	APONdPAUXwVlNPkrgUdZh2iklqCUDh3J6H4So7TqX9ZaXwambdU1XB6BtfgPcH2tVKqI1WQPwjv
	lewhg6V2ZUnqNKQhFe9Fz+y32cIJAqCrOCXdTGHAxIctYahaMJIV6ETRO0ylEFo2vak5C5iiRil
	Lh5IRvJZY5pCHtaFzCeMoq1kC6Ux5XY//mfXOZnUunHByCDGZ4ciUyxkLT5Sgd4VtreNm1zebXO
	9j97fbmTzXM9IoDzQ5DRBl4OtwXLWQ6WosqYFerDH42nLZEcQBXTZpamKUuOKyFkYQm1dEi8yqa
	TLqesT74wTpQBg5UElpgi7X/ai7nBRxwgo1R71qqDJxS+Go82tQXf/EV8=
X-Received: by 2002:a05:6808:ec9:b0:494:9c17:c336 with SMTP id 5614622812f47-4ad5bd54593mr3466258b6e.34.1785331816049;
        Wed, 29 Jul 2026 06:30:16 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:14 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Ye Zhang <ye.zhang@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the get function
Date: Wed, 29 Jul 2026 07:27:25 -0600
Message-ID: <20260729132736.3807082-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063017_218288_436C4AEB 
X-CRM114-Status: GOOD (  15.43  )
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

The decoding of the 2-bit and 8-bit level drive-strength values sits in
rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
banks declare these drive types (RK3506 and RV1103B) take the early
ctrl->type branch in the set path, and the read-and-decode logic in a
set function has no purpose. Meanwhile rockchip_get_drive_perpin()
lacks the decoding, so pin_config_get() and the debugfs output report
-EINVAL for these SoCs.

Move the two cases to rockchip_get_drive_perpin(), where they belong.

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add new patch moving the drive-strength decoding to the get function

 drivers/pinctrl/pinctrl-rockchip.c | 38 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..08a46a04a815 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3267,6 +3267,25 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
+	case DRV_TYPE_IO_LEVEL_2_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+
+		return data & 0x3;
+	case DRV_TYPE_IO_LEVEL_8_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+		data &= (1 << 8) - 1;
+
+		ret = hweight8(data);
+		if (ret > 0)
+			return ret - 1;
+		else
+			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
@@ -3390,25 +3409,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
-	case DRV_TYPE_IO_LEVEL_2_BIT:
-		ret = regmap_read(regmap, reg, &data);
-		if (ret)
-			return ret;
-		data >>= bit;
-
-		return data & 0x3;
-	case DRV_TYPE_IO_LEVEL_8_BIT:
-		ret = regmap_read(regmap, reg, &data);
-		if (ret)
-			return ret;
-		data >>= bit;
-		data &= (1 << 8) - 1;
-
-		ret = hweight8(data);
-		if (ret > 0)
-			return ret - 1;
-		else
-			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
-- 
2.43.0


