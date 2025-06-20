Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDB9C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=; b=EIbQTzQuJ2l7uu6/1+BxAHXX7R
	mN4tB4eV/LFTWUlVa5b0VCYfnvw7TjKxLktNhvBCKnJYTV5PnBXHHGGvs9vVbKMkYYiFPGSeXufKH
	eq7et3yHg31WJbWzRL9IVXwNA6EuvzLSPxfGITnmpmXbQhesqDGGeAqDK21EwMgAvcaBAvpt/tP/B
	uhTw1mm5OxQ48Myi4D/NpNerp7wEc2Qt+HXHG/5UASvDo6tH5waHlBiBIkyMJv4wxMJ8G+nGaH6XD
	UAPuYu4bRhOeVzEZFsguzonOayXuMo5yYxTwyaR/USnqeqskaH0Sl2HKAE+jtJVIMe7UAjISxaEQU
	RYmPw0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWvI-0000000F1xt-0Ih1;
	Fri, 20 Jun 2025 08:16:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWld-0000000F0BW-3xoc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:06:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453398e90e9so10642825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406792; x=1751011592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=;
        b=iGsEUde5+r8TG9FqiNgWxvVerhI9mVqJIYqG0xJO2/gbEmBCoo5Gtcmic/InJHrOV9
         2SbDXAjUmAbTkBM6vWn5R/w6kofBFd9tsGrpKK4eZ0EkrRFjpYQAmCbJ/dT+yTT23xXo
         dJhikhCytm9dE9q/vjHQ7bE+dyFi6KNj0z/QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406792; x=1751011592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=;
        b=Ahrz+N9Hg90eWgqlMIJ00IKi9evg6SNVvC7G/CNd0x9KfqnoIu+cDzb0pqGpJrmR+5
         fHEbFv+4aYAFrHFxTamoo/U152HlPz0zL/coO64yozdqzF9+utN3cKWtQlCuAJd0fFlo
         F8GfMEf5k6t8jiZfITGUp86yOkwy1ABgGEAdEuoeoJC4cEJ/35+Vzjk2b4b0kReot9uu
         AlaYcuJPx8V1RQQ8vQUSOOUUm9YKF4uFdJstHuKjIwj+nbihI2uZzbQ/Yoyv0PdHnP9A
         huMRNQbkAoD9JCA9lnu56r3Df6QL1nptQQsA/+iZpOMzosAKi7uY5Jw8rw7ttbCZYk13
         PQNA==
X-Forwarded-Encrypted: i=1; AJvYcCVLZLtNXTC9pevUfc24oliA4JMEndzEJe1fIfV+g5PnID2VY5mFqXEPD98RDd5G6iy9ABYpNDfVQqYINjBF5bTM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2igXE7lIk63ei3sR+aYCZ9YeO5WlycMpWqtCJzJ7v0b6pNEvI
	1n4tEoqg+Y6yAnxuTjAl1SIka+1Sjokm+hWWTo29FawXtjATOEgc2bBHqRSKaLek7kY=
X-Gm-Gg: ASbGncvDlzirWYcO99g+SbEo+cmXu6zVX0y2FOSS5sfjSJheWF4YaPeo1BuJsWkDktx
	dvw1Sc8s1Hb5RK3Bl5Fq4N2ozX0HDjBXht6jXSnTzoG3vpquaEGveOZGSccIkuKTCRku45CXL9e
	wGtOxqHX/ZL90qKOBd0yqSP9ejQbxudBLXVdwM4Gr+v+Od//wpNqIHAxMQG33CjfmFZ07GsJ+cu
	Yyw8jB92miKMMA/OQZ5qo/loHt5jDT/x+c8EP+jeO+gwVqrjv8qtqNGr5ozyZkUuAQZS2iv8ULX
	R/LpGO1djvBNWsRVubffIu6H1kKs4XlOzuyADZvxV38JJmJG6RuFJey/EGQ6VBlls9cgZx84rKJ
	BHkS3JvBkfeUYZSzUFTYbQyw0YM7DDvho+TFhWlPv9jV0jygf2l+5D7GReNEk+NM=
X-Google-Smtp-Source: AGHT+IEvnp0x9nPi4w5DLvc1NncQW3DwrucsQPHAIzJHhVTF2FdHwkuDd/b3JKHhFP9x5StRdmgfuA==
X-Received: by 2002:a05:600c:5494:b0:450:cd50:3c64 with SMTP id 5b1f17b1804b1-45365a00582mr15702545e9.31.1750406792385;
        Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/5] ARM: dts: imx28: add pwm7 muxing options
Date: Fri, 20 Jun 2025 10:06:17 +0200
Message-ID: <20250620080626.3580397-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_010633_985693_1964FD62 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v5)

Changes in v5:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0


