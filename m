Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A757EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSUESSRGCpyu+rpBjRVqzqkxBgsZWzSlb7G5QVFU3YA=; b=z8JctWBAbWQUy17tfKo58sn3dw
	/QpdkT5zqwuH8+00K1OOUx0d29AiKocIOfD+2CQJFAAjH2/4ONRAnD6CoaPJbjrL7ArLclDpvbpom
	FXfi7cUb81kl8taqDVJ542un0dMlRdWPYj/Zqtz0Nw79VwVjVVOXvsr5ph07dS6n7JQihfKjqyxv8
	2uZTxFJ5HxzOERYyRtfGUiBBMrB+ZPfAQDiUMD/oWE54jH5V69gQFKmWsViuaGUxiHgnbFcASaYm2
	R0oBDuRyFxHQJ4B4DP13AQ432iL0dUMdJgqzhUmE6pGFb76iCpa3wEQ9bwxrwTdPG0FWRu8FDRLZL
	tgzqK1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7f5u-0000000Bcv6-2OWK;
	Wed, 23 Apr 2025 18:45:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dm7-0000000BFYy-1J67
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:20:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf680d351so8205865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428842; x=1746033642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSUESSRGCpyu+rpBjRVqzqkxBgsZWzSlb7G5QVFU3YA=;
        b=NGIzS5exhxj3FteBVQb43VyItXrw+gzi3mW6my/apGi/C5nFrhb2T5cF91NR56Ukfr
         6sCKHmOrvQ4O0lpBLHVVp628uImjJMIHJshn7/gV8HqpAj+2KNXH29UcdUUQEij6UUOS
         QQQN964l6glO1I1rOuo0Rq6/O9paBILLV+gyKdXiFPJ2g/WEoe0TDKdEkTpm8OsQNFdS
         0fbEJhfqaRYIUMjr81pg9nQhZCKkHasnsW1cuE23juLojLT+6E/wr5tu1Sn9Idhm3Zcr
         3zMDnG+o3DFEmr6hyku0/DkZ7rYDaKk2JswebseuaviblSWhBY3ZX+3lKvqIqHzBt66f
         6qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428842; x=1746033642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSUESSRGCpyu+rpBjRVqzqkxBgsZWzSlb7G5QVFU3YA=;
        b=cwiiHjAL8UYDG/cN9w2NuixrBVoIia7IIAoQoTH5xhdZ9v8w5da8yTlNdWn4RHjas+
         3+NNNk6nJRHmb34xe5hlwi+gZV3E6ieSFaBnnbfXewo7gXNYPzA5Od1z0LLyGyp5gAkU
         TBsnI8h8JGeRLIZFCHjvzIUYOltWeqBb+RqSOfeeSLYrsoKK9P+Ls5F/p9Fjf6H1Tvhk
         K4oSpBPZc40+xvCwel6TwRXSvqXofMnoMxTb0Tfn0/ejzlQEuOIsOZBrwW/O1+xxWLnN
         dC/hg8ddFPlnE5nJ3pXVT9yG3NKxvMsEe4+HDZ3HEftonJxtQRma72KKf86tEVLO0nhp
         acJg==
X-Forwarded-Encrypted: i=1; AJvYcCW2b6trVeGFyAS6wvN4xb0IWLeExpbiuMPjgEJbTta670Wf4oM3UYQdylPPBS8cOqbiGyL7DrdyVybF7Lehsy5v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1/N2itSeayhY0B6YUKP9rIpnTMHDYuPxGxpOFYA7BjrAyH6Hv
	4xkV/Q2R+sl6OPL+Zzc045JFCo1sA+YbH6yY+VRbXYYrCbNAKIo9mfA0cDojfbg=
X-Gm-Gg: ASbGncumugmHZIcftkLXnASGfNIiJlkHh6GlSUrVd1PbmDItk+mJttPXcoFIRzRPArR
	ZjWB+RQLmU2xJH6/ZujybZ5KbHNWsTCh7DAi7KKQZradUCuZVtXIcu25Kw5MlmS6C3OvncZXgX8
	hVOharcMzbv1/2Xw6kc3wFUn7Rt1q6b2Qx7SkTXMgW6E8+GMbID2p02kmuJksXK+q/YQfIbfDBW
	gPsB/ux96lyvxVoV7sDJ8UKaR5T0Av6HBjic0yOezeTbBUtnqR2sePTK5Q4rq/c0344oHzivvrz
	fwlla9wP+4bVOk4BkUTW4X9zv+32822/CXtIkNAywiA=
X-Google-Smtp-Source: AGHT+IGNrzHW1MMexsfwjLATKMrNMWSsxOAcs/cvthyNt3eB10C309nqJDj5AYKSBQ4rWCj+bv6jEg==
X-Received: by 2002:a05:6000:250a:b0:39d:8e61:b6eb with SMTP id ffacd0b85a97d-3a06c6baee3mr18451f8f.1.1745428841842;
        Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:22 +0100
Subject: [PATCH v3 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-5-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_102044_530783_4200FCDC 
X-CRM114-Status: GOOD (  10.37  )
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

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index c78ed064d166..7984caa861e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -68,6 +68,10 @@ &hdmi1 {
 	wifi-2.4ghz-coexistence;
 };
 
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index c06d9f5e53c8..bdb80f3611ca 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -617,6 +617,15 @@ xhci: usb@7e9c0000 {
 			status = "disabled";
 		};
 
+		hevc_dec: codec@7eb10000 {
+			compatible = "brcm,bcm2711-hevc-dec", "raspberrypi,hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>, /* HEVC */
+			      <0x0 0x7eb10000  0x1000>;  /* INTC */
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible = "brcm,2711-v3d";
 			reg = <0x0 0x7ec00000 0x4000>,

-- 
2.34.1


