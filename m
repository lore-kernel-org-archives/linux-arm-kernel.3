Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC36EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUBFa0HqKZFEUtNHoOu7BOBMJeyXjh7epErZjbHgIp8=; b=gYte/gQoLfGBxybzKnBcvn5aEO
	zRqyYkpmJYSIeqrI0Ql0Gx2MNZQ7DX3XtFQu8/bfmkLcdc86AgC4UjIWRsmwolnveeL7EmzorDT3p
	5XyYXnaI0vKCASDIBrCQmYPaxYtn3bItBhRRFgisbhmjABAGekgI91MltV70Rx3GelmEsb1OjP+KY
	i/nywh+sBPzw4jed69wPRzourOwyR3IGjvEAUgNmP6u/6oWX8GaIyYqSHJaHP92vNyUA1CzIV4baV
	A8xH/J+GXoTNBXyhzT+NP7H+P8BkPv00w77E9/KB35WVFnl15uffYkFVaLubmIZbjcpgIaISoDuew
	fAYpxerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOq-00000008wqv-1m8a;
	Mon, 13 Jul 2026 11:00:36 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOd-00000008wge-2Egl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:34 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848595b338cso3383751b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940423; x=1784545223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUBFa0HqKZFEUtNHoOu7BOBMJeyXjh7epErZjbHgIp8=;
        b=HyDkVRB2WAf1xJsI5mexyhKkYR6sPWHj29zF0J0dxaoC5SgoOT+vQxbdlh0iqKy0NR
         bPhHqfxuUxU6VQLJYMbg6s5slwaHlB24OafHGxtvcmEm/bWQzZKLwJI7QUb1XAQtaAtK
         qJVKpk+dkKWY1VW+6P3T7cRClkr9w7VZqdR68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940423; x=1784545223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUBFa0HqKZFEUtNHoOu7BOBMJeyXjh7epErZjbHgIp8=;
        b=n85o7fBfxXMwW9Ejmv49Kt3ZXgcW41KoEn2wP+zYcOXUnxOBE+CmwMtBR+LsyljbA+
         HFKo5IC1ktLuNlh6vyPpWFdn9IcgJy+vibR8gL8IZB4bbDTu+kS/6wwbndeqzATIyw7j
         YDrSCGk1Ze1D4UmKoYfvFiEWcwr21wRn6+CJhY4jepPP9yRX6T43Xx0rm32KCIu7ynUL
         il3p4pOB6pqEou/oNvpEdyIUgrslx/EAnyaIJZ1viA3uQh02RuEAuhk3ZBMVuotjBSE9
         xUx2A/AKFcy+gX3pj9O/3QRJXZvmHWe12tG/XiKBJBr73QQONGBrPyNfm+XpG5Y3RkfX
         O2Yw==
X-Gm-Message-State: AOJu0YyTKuYNTbRaU+Ufj97dAo05P/Rwa2F9DotBw/ID2lAHhUZR8Orw
	8faHuJmstqkMYjX878yXTkQY8k3rU9SoNmQ0NA69gw3Fa3fLqbCsrb11i/L9TJw9dk1y2eS/EId
	Lv+6o
X-Gm-Gg: AfdE7cklUevskTzU+yDREA2QLeB1ofi592LZZYV5oFBl30FEaLk0CclVExMKYyPz45/
	nPajgv48iEPlIGY3h3F3NC6pQhzzuXy503+LFVA9vW8cFXsgqY8BXl2roY0Cahhf3lUFPET49u+
	UjRbhYFMlAXldIwPUpDROLcL06jTmByD0HG3PJakVPXO8tyP8h5+inSAAI9dwxxICShfhOwG6h/
	wiVLjhlEdC+qlcWNpbGUmHx47vWYW9Ku5GelgRlJY3sa6SzpU/jOmsF1mVCMd/QhmCNdymBGPzr
	puDcsfCTtvEvaI2/t1LUUG7zDqtFqd6yhBWFAboN+ZDRdWdpsJP1JO9Gl8cVrI+VZKKUT/BKFrh
	j3ghEotoQYNZXYY6euVYDu6q7F5VZGkGwIl/roPPWFzJ+LS9n9RY33Qz44RpvjAZQOLv7qsK+wJ
	//qoeAPMeInDRgENlXCTZ5Bmvobw==
X-Received: by 2002:a05:6a00:4489:b0:848:2f6e:e52e with SMTP id d2e1a72fcca58-84889799f42mr7179723b3a.66.1783940422632;
        Mon, 13 Jul 2026 04:00:22 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:22 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 5/8] ARM: dts: mstar: miyoo-mini: Add vibrator
Date: Mon, 13 Jul 2026 19:59:47 +0900
Message-ID: <20260713105950.1346962-6-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040023_571752_6DF94163 
X-CRM114-Status: GOOD (  10.54  )
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

From: Daniel Palmer <daniel@0x0f.com>

Add the vibration motor, which is driven by a GPIO, on the Miyoo Mini.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
index 1bbbf47132dc..5e927f41fa73 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
@@ -18,6 +18,12 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio SSD20XD_GPIO_UART0_TX GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &pm_uart {
-- 
2.53.0


