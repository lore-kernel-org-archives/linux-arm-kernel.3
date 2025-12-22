Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDBBE67482
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YPgDvOrc6Z6FI66bGWH7nZrKKPg18xmDLr/yqLIfNcs=; b=JgqhP4m/xpL7ym9lqgNXrnMz1e
	2j8wqqQHhRjNoPnC8Q8IQRtHUIWPn1ROq+KRvvQH1aKkPgRhApfY8Ps8jiaTrV4+wf7hgobwVOPy1
	13PODvnXQUySEtxHREynvzd7eN/cl9G3naZYYbdSpJLVuNB2ZXIpT8GCEK6j1usoD0hRsDL32D2tC
	oeS9qgKHtVydVa4Fc6IdiiIqWRhNSttr1lYlZ5Z5uusjK2EhZ6vzISAf/L4m236QBOdBeWuNh6vWx
	p02ZELVSebS9fJyys9HOdNNzzkP/upbs5Ef64XK6yIXIaVT0U7lTtOo+SXyOFS9i530Y/QOzyvW2y
	I+KLDlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXe3H-0000000Dfei-0Ro9;
	Mon, 22 Dec 2025 11:26:11 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXe3E-0000000DfeJ-0Eeg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:26:09 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a0fe77d141so41294835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 03:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766402766; x=1767007566; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPgDvOrc6Z6FI66bGWH7nZrKKPg18xmDLr/yqLIfNcs=;
        b=RINXNowPQqZZXg9SDG5hwmysGJkQ6egMnu+CHJaeekU6NqfnMkst0RE5CAhjxub6sn
         i3jH5XcUJ7gtDAo4mnGoA5KzobBttnV52ZpyG+cVE7WK5OVgDCoOBre93aH3W19s0XuK
         ylsFhVqQmM3g2Sg10OgKk884IEAQQL0BGGurZDvUnsQ2IcfwA5ZxDN80Gon2GBhZq+5p
         jOiobJL1/dOjMYg1uGFDgGJ1CMJxB6rkKIw0LLRO0wfXwXukLzE7/l2NGdPDq+r5U+em
         kKSyDYW414WcvHv/sDqEvDrrLcgH6WlbkRO/ztrMNigePuNwSrnAHwPWEU/j4mESb6kY
         SlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766402766; x=1767007566;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPgDvOrc6Z6FI66bGWH7nZrKKPg18xmDLr/yqLIfNcs=;
        b=G07/tqcrvcXJCoDVY47Kh20zyrp7VnYmoWoMccsAlUev41tCIZ3VYFjZkiSiLgexan
         NgKpa6qWdaLtAL0FssYe9lQ08qZ5vgk6QFtCmpDYH8KXZweNOXtfmYl5g1KHMtWO0hRL
         7ObI+pKZheZAofarqMZzUYDROyASEs5sbTAxxwFDulO4XsDr5bAQRQNBvFwdFcxiGvPN
         /hJhFA6M0GL9rO6BDwWqyimJACzRNMLxo2mKdSnRPceGINPL+TRTL/fdxuQYTZPTbGxX
         D/fWUluT2EKAaz9JnkP5z5vq0b9/PeJQ7FhhR14AYRqR5IiP0GI+bHFkAxE3EZ1pypyZ
         G6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVe0ofqZvuZkble06nOsAzIE1u0diaFS4xC+r9m9DOPImillERUx7vz63o8mts3XgGv1FAgOO64IgvUuONrbxx5@lists.infradead.org
X-Gm-Message-State: AOJu0YzUrtRE8vfvOCBeNkqRGXTWYySjFlVeVsnFqk/+mF8Qzo72/Hmf
	ri0jh2H0A5DPEzlQ+w+LjBHjALGselkCONGES9uWFNYN6OufrsCV50Rx
X-Gm-Gg: AY/fxX4CJKKYiHrC/0n3FR5IlLQ8RJbHSRoPGJfEsuII7OdGIGbWD/eMrwEeMFP+6PO
	Et2lWuukYdy59h5yauQ0cWYeyjOyfSxk6s26H7RhPHo8TwFvQcRAio5JQTLei6nDsAJp8arZZRV
	y032CfwId5ihf872gxaNET+wdUcj/EEXFh8UQ6pF1suENpRXKptefpM3gAZwSZScQyJQ3h1GI53
	emMluENqEhdZcd2dW4cVfWVyf1I1eoK+rdw9zvOOOkKA0Yu1gNHGYRm2ToE/fwqoK0VYmPxSFFH
	d7Udf5uqWRZagluF8pADhuVQZqGi50zApKKe8gDxiDZklySUMI1aIbhiOlWp+y8jiIAa7YCTXT9
	y2/qQpszQ6AWwWeectBNAsDAO3oMpp/dyDsYrzft/gGLInWHQIjkJYOhtz7N6IhiQfH/Cq92MG+
	8EM09gnsmFkf590eMD+mw2gpneLGgyU/OHFzrrP2HVP7v5qZx90BsXGSGQuXrbRA54cxTdpOYc8
	TCzM2MPmw2DJToWyDAxZQ28qaNaGNcDrblw18TIFEnM36Zn1aSLWqZFUl5GKlOfEAmlpycDyUVX
	ktJvEhsLpatu
X-Google-Smtp-Source: AGHT+IFYHl6Ami/Fr/cAqd6c4FtIqedeodym7KvXuloCEE2tyym65FcGKbybdqQRLNMA5fqUBmjjcw==
X-Received: by 2002:a17:902:dac8:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a2f223177dmr104463525ad.16.1766402766457;
        Mon, 22 Dec 2025 03:26:06 -0800 (PST)
Received: from 2001-b400-e3f4-8350-2c3b-65a6-c562-3201.emome-ip6.hinet.net (2001-b400-e3f4-8350-2c3b-65a6-c562-3201.emome-ip6.hinet.net. [2001:b400:e3f4:8350:2c3b:65a6:c562:3201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74bb0sm93937725ad.88.2025.12.22.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:26:06 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 22 Dec 2025 19:25:29 +0800
Subject: [PATCH] ARM: dts: aspeed: yosemite5: add x4 E1.S expansion board
 I2C mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-yv5_add_dvt_e1s_ioexp-v1-1-25ad202d2681@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKgqSWkC/x3MQQqAIBBA0avIrBN0MqiuEjFETjWbEg0porsnL
 d/i/wcSR+EEvXogcpYkx15gKwXzNu0ra/HFgAYbi4j6zg1N3pPPJ7FNJAdfQVvX1YaNa42robQ
 h8iLX/x3G9/0AXWt1MGcAAAA=
X-Change-ID: 20251222-yv5_add_dvt_e1s_ioexp-14930e048043
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766402763; l=1757;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=AYuzuGSC2KyBdpb8hlYBY4+KTfc8mfuG0hrKUlWN6X0=;
 b=iYN6qeY3wMD3HyqlgwpbWDH1W7gTGl8fAskNUaffziqK0UPHS3mck0rJ2kDDIHYmNBvQUCArK
 vhpDUVX53K3BPZiIFMuykl32cWhjNLAUTP99xQQnePiTvK7hwbhJd8v
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_032608_248027_4EFF6D2C 
X-CRM114-Status: GOOD (  11.40  )
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

The new hardware design adds two additional E1.S devices behind an
I2C mux at address 0x73 on bus 10. Add support for this mux in the
DTS device tree.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Summary:
Revise linux device tree entry related to Meta (Facebook) Yosemite5.

Changes in v1:
- Add x4 E1.S expansion board I2C mux
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..87524892322c1388c146b33ac454018a31dad168 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -31,6 +31,8 @@ aliases {
 		i2c33 = &i2c30mux0ch1;
 		i2c34 = &i2c30mux0ch2;
 		i2c35 = &i2c30mux0ch3;
+		i2c36 = &i2c10mux0ch0;
+		i2c37 = &i2c10mux0ch1;
 		serial0 = &uart1;
 		serial2 = &uart3;
 		serial3 = &uart4;
@@ -702,6 +704,27 @@ eeprom@54 {
 		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
+
+	/* I2C MUX on E1S x4 board */
+	i2c-mux@73 {
+		compatible = "nxp,pca9543";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c10mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c10mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &i2c11 {

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-yv5_add_dvt_e1s_ioexp-14930e048043

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


