Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B052E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PSZeHHkCW6wlnu9PsCgTdp/ZEwb0V+NyqcmEQUOdns=; b=zz8Syga96hue8pl4RIlwFSre56
	sAjhm98qPqSZ6y0ExaIDMRMWjyghLJIAR93lLOTinyhID7bJIujkhb0WFGGsg/g6UIhir9lWFJBEY
	JSzN7SvjimO2ryHwujH1pSa0kHevw1Zmt2wokbUwgUKCTnHyn7hOZj0vrEBcezEtHkushSfAY8xpe
	usfKsYQgmYms5yAlOxmyOCJ8kTHOSCI1Rab/UrkO+XNzAAA9k+qoBzjsu+6kKzuC1QelQ4cEH39o4
	goofnHK3+x3F8noqJBo1wueORydp//oHY9XGFWLMnGbxsMZ0Dd10YznpvJir6zEsREMRV2YheoopG
	5H5CWjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObii-00000004qZB-1kgM;
	Fri, 20 Dec 2024 12:03:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObgS-00000004qHP-0iXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:00:45 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1222573f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696042; x=1735300842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PSZeHHkCW6wlnu9PsCgTdp/ZEwb0V+NyqcmEQUOdns=;
        b=kXnj30nzgKltEKrXGQ/ejT3tyw9c03CYACL1seWkvEaLXMiJfqbFdDUMUEX4xHqX0B
         1UpMM/y/jJgXOFNLPV6tRsmT2DnHXjcLbSqp0YSknpn7lKT+q5+hD0KX8PEIP/L2t0DV
         0Ga25YWpUNufV1gxylbL8v1Ub2ANzXoY25yWi/2kohavY8/tOSvswJp8R+mNlhU9bN0P
         9ND0vfY8xzE20gr8H6A3ghEzH+dEdz8HDuV1pLcNWInffjxkcrAJgr92T4eLMzqU7zBy
         KXrT1hMvThCDpsx0leK602Ca3nmahZc6CmgpGrXOyjQIMe5DMb2kfTpJ/KrUBmeKiP8d
         AU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696042; x=1735300842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PSZeHHkCW6wlnu9PsCgTdp/ZEwb0V+NyqcmEQUOdns=;
        b=MoqnaRCkcS14s9ibG9LyPUd29Jah/3kp0JosyWYIs+jT+5gi2NoIg44mNerA+vRc1H
         Y4XpKCixs98DZmuU03ooO70F2Nq9tnBhHzBH+qwbCK4A+k28652UzY5J8qz/jwxJ3tqy
         Q8C05YRvH021n0GyOoeOX4ReXt0t/u16j6Zu2OhQ4FO7rNX1hASi3X9YayK5gmNeNqWM
         CkXyLdrWpsHdOxcuxpCQtctnZ8T+hbcrQgCBBG3iFLrkHu7VsqOPL+ipKqjr3QtoJSsH
         NmbiwNErPqj+rwofBoYYzo3yrfTXOk9tObm6aZARIk8FGIEUtIGxFFcr3EpGQrsbRJZO
         rsoA==
X-Forwarded-Encrypted: i=1; AJvYcCVB/o9wg5+aFqqxPraURzLgJxR+zcEJcZQE9dAPgIRZb1EGraTrHpzH3/Ld4lM6V9tjSS/veK6R5qhfVgoFXKGp@lists.infradead.org
X-Gm-Message-State: AOJu0YzMFt2MQowhBFv+z4el8Ml8GQOsXWIqnewYjM3cZLc6zUpVL48q
	8DeaYw+r6XiKMgV+1RJvBgQocKwWBFawHxCiIJfPX2x0MTD2skwf
X-Gm-Gg: ASbGnctcV/ikfsdKyticZxvGU8q66PKl5gU5f2vWtunasJJZzID16wIpBazT4WUm7xi
	pCYKuLFTQ5sc+b0aqYGOoeSpkMpDnt9/+hKXn3V+ZYd1g2Fk1FWreGP/4rVzi9bc8HNLFl254S4
	4huAVDAvNXQg5+t539sXz49kduteiW0T8oW+UOFI+Pg1tbpnTvkVd+voiuSAA8GSpc4Pi+vXhKD
	En37sh2xwWNy5U4VexcGIGVeYhiMCfRxVUr/ootrnX/xnFknoYB+sY9a8K827OsRVBNALQ/gq0y
	QhaI/orrBeiSTpZjANXxT/2BCfpEE6KO7q7vlHPoS1H5SjQ98iHH0v7UCFEKSQ==
X-Google-Smtp-Source: AGHT+IHmWsMA9nW1lsPiSxNBhMagfaDdRvhKKxRsgc2zMuwWmMdOEPQP3bdm0aS3GFPGO5WQ8QG6Pw==
X-Received: by 2002:a5d:6d84:0:b0:386:45e9:fc8a with SMTP id ffacd0b85a97d-38a221e1dfemr2502314f8f.5.1734696042080;
        Fri, 20 Dec 2024 04:00:42 -0800 (PST)
Received: from cypher.localdomain (e.b.8.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::8be])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm3921038f8f.108.2024.12.20.04.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:00:41 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
Date: Fri, 20 Dec 2024 12:00:30 +0000
Message-ID: <20241220120038.3137248-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220120038.3137248-1-pbrobinson@gmail.com>
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_040044_208897_CBAD72A5 
X-CRM114-Status: GOOD (  11.37  )
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

This adds all the pin mappings on the WiFi/BT header on
the original Pine64. They're disabled by default as the
modules don't ship by default. This includes, where they
haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 09e71fd60785..f04f0f1badc4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+	};
 };
 
 &codec {
@@ -124,6 +129,17 @@ &mmc0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -286,6 +302,7 @@ &uart0 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
-- 
2.47.1


