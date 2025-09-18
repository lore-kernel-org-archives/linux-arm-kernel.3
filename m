Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD37CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kk2Hrw+IHUis21BiwjLiEv7+4Iu+IibQiFHb8JNRLIM=; b=x6bkdVnciWfvid5dGRnWr0SmfU
	JzANuKJdcNG22Q2yYKHUJPZbbraKFgHad6+3fD6s1kZ/lesFjB22ohUZSedh0bFsKQ2ooNdinWk3X
	+SVIpn3qkHbEqlVF09NXUnwxfjf7CPg3jjWGNUu6qg2NXV60Fs27bibicqB9lUEfGuDb4LjnBVoI7
	18vbmOeI72CAVRlt75M0Ktb/pvXWernpW0fA95yZNEwXfGmyyYMRRFCAkXGxCajgsT2ZqF8y+uxrf
	xf5NMg1KY365tRAGhIEGTy8I0I+DJYSH+q5Ge0YL6C0izkBUUmBSjWDro5VFnoI4S90E5fnGwHJJc
	s93c0cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBB4-0000000Gubs-150E;
	Thu, 18 Sep 2025 09:43:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBB2-0000000GubT-189E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:43:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-329b760080fso583598a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758188623; x=1758793423; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kk2Hrw+IHUis21BiwjLiEv7+4Iu+IibQiFHb8JNRLIM=;
        b=WwdJ7OyPY1cc6DqhWg4gPrfUE2G7kQQ2D49FtVz6Cd2qJYgoW0wf02NgV7i9h2qPHw
         u809sb39X/PrR2g6eVvLbqEVmSL0VcaPJULf2fJVUELC0GlEfkE1atn+/P1yTMIzLg9G
         cV8maYA0zPldCJ1m1HLRRCWq4qJblDAJG5g0i2sWkBZ9pO/+zs4ROAO2dwc7v1s4dBKR
         PZUwE8Js3llgUVAvDlkhKnRCWcRCUpyuZk8AZOHs783aPvIz8riUuEb2rDczqt+Ro1A4
         A+pW8zOmMzkBvwUBPevv+hoHzRguWZ27h+JLonT5y8MlxNfUOymqfs2uurTCZf/hCO1U
         p08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188623; x=1758793423;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kk2Hrw+IHUis21BiwjLiEv7+4Iu+IibQiFHb8JNRLIM=;
        b=TcDJ2GzijwTQLshux7+7sjWnzbuRy7kn/mUZbwTdHXX7OxIdo51AZuES3CTWzpNg0d
         R4MbKiz9HOwAwEqLDVs+vsEEpMWsfgPMyN5tP/o54uMA+TyJ9Ml8RUzVgBIIqARYEcFV
         HuZR3x1Gc1m8kY5Q07iKztAusZLS4xfXOPdvmVGoRz94jZYH+sDNXWV6J8GTFJ+9lOBG
         YrGtJ2N12UVUY5zPp2Y4zoQKmrca8cid2jmKLNFFaaT8SX/BgAURd2BRx+0El6LwgnFy
         KtY9PoqERjSJKLNTzvG8dQB/i4dVsc/XRfp/aOC/NrksNwszYjY7VcgCqQ81JAN19+HO
         4ZUw==
X-Forwarded-Encrypted: i=1; AJvYcCWJMVvhUN8hnTMMfs5tBTLhDpGRsvpSZXkkl4N8xYJ1wsFoL9NQnWEXSRisnCKSzwVy5VzmKl3Uy6fz9xbHFWVT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6i3+i8S0X0muXvluInA/UGaQbp8i48VWHWSgVcsp7//sHsXK
	3JoIu3J4x8E7yeb1nPWXDInbnXmJ/UhzQA6/XaUhedK8sKZNWnhHsJgIL/Y+sQ==
X-Gm-Gg: ASbGncuqWz7MU+KmCidXVLIoahoamoS6OJXMwhu3+EieILV+wMDvCW/YaWuxZJ90vx/
	oXshc2OwYzuW/CtlacSLijuLDZPwcYB+kwpJhVdrFf4Ba3Oq2ByB0jkpMj9X1FpZwaGL98pbMHi
	g+1OCJYWrIi6Bn5Pi+vh2XTRwFox4lM6aBmi2kw6Rtwo0111U2Gtni5zuJrTSkaW0avvUpLBZMw
	2d3VZyMnMPxb1h0a95Yj79aReQTKHcLWGewZemmuko5/K6UpT9FBVIlrbuYiv3NWWr/KPdeHrtf
	YmKTwr6TNWDlQMdyAt8My0qI9ZXm7txnOD7FXy301+jJbBuTxrHCp6ohibA5B6vNn1e4CWoAZW/
	FbnhvJnJdLsnFkyk2GXPm1r6280mat2U9Tmyz9n6vIhUhgY9VpogLVXQ3qZNFM42f2AwDv+YzR8
	E8KA==
X-Google-Smtp-Source: AGHT+IEgGE0BeH1F+4LDtstgR4GzT3dQ/vnKSyQ7aIVQt/aTAyZb2ZsVJWml9L1MieY7rFzbad5a2A==
X-Received: by 2002:a17:90b:4c12:b0:32e:5b07:15dd with SMTP id 98e67ed59e1d1-32ee3ec22b6mr6516497a91.1.1758188623083;
        Thu, 18 Sep 2025 02:43:43 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed276d2f8sm4886810a91.24.2025.09.18.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:43:42 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
Date: Thu, 18 Sep 2025 17:43:06 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: add MCTP over I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-leo-dts-transceiver-v1-1-3e2580325edc@gmail.com>
X-B4-Tracking: v=1; b=H4sIACnUy2gC/x3MQQqEMAxG4atI1gZsZWD0KuKitL8zAamSiAjSu
 1tcfov3bjKowGhsblKcYrLlCtc2FP8h/8CSqsl3/tMN7ssrNk6H8aEhW4ScUEaKvUMfvQsL1XJ
 XLHK912ku5QHFt0+wZQAAAA==
X-Change-ID: 20250918-leo-dts-transceiver-edc31e3c21af
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758188620; l=2154;
 i=leo.jt.wang@gmail.com; s=20250618; h=from:subject:message-id;
 bh=nVDRdbCkjgVW2Hem9dJFdrSJ8lRD2Z2Fl11Ez5/qXTc=;
 b=gGwy/tJbdh92kaL3iGxdJ0l55f8lVj/pdra8VUU6oBnNsmqeDhiUPxiVekZn/UwIGlSAduWaT
 s65s9f5gLsNBz2gYwdLOzqRJ9FmS9d3xS2QLQLwQXoz1a7on5CCimYt
X-Developer-Key: i=leo.jt.wang@gmail.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_024344_332464_3C93F792 
X-CRM114-Status: GOOD (  12.05  )
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

Enable MCTP communication on the Meta Clemente BMC board:

- Add an MCTP I2C controller node at address 0x10 on I2C0
- Mark selected I2C mux channels as MCTP controllers
- Remove unused "i2c-mux-idle-disconnect" properties

This allows MCTP devices to be discovered and used for
management communication on the Clemente platform.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index a614f947dafc9a6628c3f3d45b62ff3ca9d2b618..a2f0ed6e7bbefbdcec33f7ddebdf2de62adec164 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -269,18 +269,23 @@ &gpio1 {
 
 &i2c0 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 		};
 
 		i2c0mux0ch1: i2c@1 {
@@ -332,6 +337,7 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 		};
 
 		i2c0mux0ch3: i2c@3 {
@@ -457,12 +463,12 @@ i2c-mux@75 {
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 		};
 
 		i2c0mux3ch1: i2c@1 {
@@ -514,6 +520,7 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 		};
 
 		i2c0mux3ch3: i2c@3 {

---
base-commit: c65261717599d419e9c683d85f515d3ca2261549
change-id: 20250918-leo-dts-transceiver-edc31e3c21af

Best regards,
-- 
Leo Wang <leo.jt.wang@gmail.com>


