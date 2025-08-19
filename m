Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA4FCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A2jIqckmzmL31HAyK5saMTVF8f6NQtPgJyovhg4/VOc=; b=bBD28YNhdnBsP252DbOpcZoQw6
	0ZiXATyFuJHSGNVTytUn0fpiHEV2BGwLGtFLfT0OXYFfMgN0o4ZKAGlmX38XaDTCnyX8kaZ301f5X
	2tr/r0aohFWqBZDmiASYvWhcxdWFWgrPXxsag2V4BiPPT+7YtBIZKpy3IP/plHMGkoelw0yzedWDV
	IddnyPeMRv+vsCCk67unlnTm1xWW+ejxpzAWfpNVowyI5FzHA3Dt+3mWDQOkckjnO7TjNKLRE8nA0
	gIgApno2a6ccQlTeq3F2mV6Q+9bJRsmAZ/D3WVUQp0hs9W8qoC0acAYrGZ9povzvWhY/+HIGq1U7X
	sjRgJfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpz-0000000BCf0-3Xpj;
	Tue, 19 Aug 2025 18:13:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoME3-0000000AZOr-0WMk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:18:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb731ca55so71927466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609486; x=1756214286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2jIqckmzmL31HAyK5saMTVF8f6NQtPgJyovhg4/VOc=;
        b=pPkpsMrDzseQros6v1w9yTSoHtqiN4xQ7QgaHAQFv8sO3HN4ass9NUWxD8pKMztPkA
         O2q+CyRunm7RCJr6hFiIo6PTRuB1l2wsS9OycGvy2d++kBJk7XjPlmSoUAOBtXcg2D7j
         bcEjYexSAe4wCOuYkLkhlwx5/qOPulEKfpv/xf/0HMYpIzdLXqGOUGp6ZmKGay+FVz9+
         KW0QcnmkEi3fCsOHTU0qZOBnnGGt+1OBVzl2Wn1n4ERr5TheKDz4Zlpw5fN01fO7XMS7
         cpsYLglO/NXA3r2bYlVRDK7lYmAwp78UQjLszlIJgD0k0aj8EPU/KrGJ/AisBSEKA8vQ
         /A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609486; x=1756214286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2jIqckmzmL31HAyK5saMTVF8f6NQtPgJyovhg4/VOc=;
        b=v0IU6RX7IMN998GfkyHMyMNpO85LeBkWO1QaGBV7Eo4sefJUKAmP/J1QJE6NbwyZ7O
         Rr/2fjEiqW65KAgihq37jRp8Miqi0TXp+tw1mIyU9sDtcCK6u2Mk/HFRA7/b9zTPT1qi
         APFNYHEDyYHj9t7qaCjvcKQ3ftPYi8vgi3gp+uoXiJqqNjI2wZSaaOTZtBw95k3YUN61
         mTNG86p+TKvBv1tjLsjf6Mfe32mgMie6S13B3sQNUifms8uPUEA8NuHS5TCT27VMPecm
         oR6WyN1RG7VPjuGuEHmxG30b/cqk7R+rd03SFl11Xn0XJEhl4YDTw+8F1lyj1km/bAdR
         DTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoAvmiWS6yEe8jEWmC3IQ553WFOCjRp/npOp/UQx/aPB373nsUnuJ3khyL5A8lqDw/vyEYAdrYwSTkcpTigtyF@lists.infradead.org
X-Gm-Message-State: AOJu0YxNSeGZ7EAeGGlqFysFlnwrNOKsZwev5bVYL5oiGI3MRXa3VEj1
	TrpJDPfdZIY8RcdLDyeTcps/kJ5c3Qxz5pxwGHjm0fY6g/pUTR7pb8ieo6DyiKgiwvY=
X-Gm-Gg: ASbGncsFC6MVNBMn4tmA5FQ1+qMA17UmNrYXJBX4i8q+W8jtb0TnBHgAHk1WKfShmDU
	CwJbbj9+C6C5AlUPAvDb5P1MpuxNBkcY81a4nSTAs2JeSjqwLk8pJR8KjNuBvR+uX0ujRAUoYcJ
	i4cxarrTdFHibNRpwvrEBuH+I37wXHKWkKItHpzU2QFnyh2aInu3gEWy22vTkox4VGkrjeLuFTA
	FKUcX6Sdu/PpzOgY3CUZOyQw+3HHi52+x6ioemBRmwCer6jhsTnmwdPCWS66XZ5dUg6BdZo8SYJ
	CParf0LkbXwGytFLnMHL1YjwFih7rvjraVXFc8fUZQayXH4+EPY3+sXHB0J6VCFe+zPRKV0m5Qw
	HxdO6FmrnXpdyKGdyoNupSjdIJHrPB3tMWg==
X-Google-Smtp-Source: AGHT+IGyvvSsYmBOqUpNPKJ0n3bvvP0DcDCulcG/syIt2wzsfbzAt0lyKnerC5YPY0kHA2qlG+r2Mw==
X-Received: by 2002:a17:907:7e9d:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-afddd1f8b4bmr100763666b.7.1755609485345;
        Tue, 19 Aug 2025 06:18:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab3fsm1006508966b.102.2025.08.19.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:18:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: nxp: imx6ull: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:18:01 +0200
Message-ID: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=xtnDCv4eFzy5ACNTqpXuFQnkdvi4l046jdxQ272mGQw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHmIdIih5hgjFKYVXkgjYOmgK6x+Rs7p3ybX3
 j/4k1od8vWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5iAAKCRDBN2bmhouD
 15GYEACDpblDVOMuoKN4y9jt8cF4hJgLK9fli2s9chrgNEGKFUVpYq6K4M+iWYmXrBBPvZ2Kw2t
 CCjeHxVNkOM2PcH9C/3h5Xz4Aft/0XIK+EdQugnDfaYQr46cwlJ8C75O9KMtes/hR8llTh3qLIZ
 M26wOApvdXKMkvl4GKfHB6tdyQmW0xhLW+VB6BuY0TKWnsWfAkYr/tslhGE7URwyDbhEo3T43Gz
 ifcSgZeURLeyjrgztlS/HGjOb+Uh5XDBkxi2IWrVe0U+05Gv0TTJEv/HXIMok0oGwInp3JPnAcT
 UweplIcOEfh4A34gX+ZwtQ5RgycMcv+fwFgFNPbV0idAEtIsbljzAid19ikRmgi5vb6W3Sm0xyu
 joCSm4o9dg5PL0aYjcBIfDh6u17YJKhcYqvOrKDcFvTRUAOjEx8P+wJLFoPMOrtsamyxxaJZnTe
 2bmECOATOzSM9afaIO6irt1G7C4ocQUoF+OvFTbunP4XihRxHq1xcYCqJ/z+j8lERvCh9INlttD
 vAcAOl0CnNNL9FTOCQ7UM8xu5ovV/ssTxNXhZOT8RItS0Ze4RJj1jI3mDtZratMYt4qv4rQI4WQ
 Ep+Ez9WVUXvf2YKA4/ivB4fhn0bCLghsu6zIrVmbe7gVPCqrUb5QFlyMIIjgQ4zYNn6Sr36Rosp Q6PdBrAfYq3+2Mg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061807_163123_FAE09562 
X-CRM114-Status: GOOD (  11.90  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
index 5d1cc8a1f555..107b00b9a939 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -129,7 +129,7 @@ &i2c1 {
 	status = "okay";
 
 	touchscreen: touchscreen@38 {
-		compatible ="edt,edt-ft5306";
+		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touchscreen>;
-- 
2.48.1


