Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B781FC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loOwQqVV6eyMPf1rqSFcRXdY1hq6jUmDE2npYlo+V0Q=; b=YByvqB14LDa8ch8S3lbf9ga2BT
	gfy+BEmn0CSLC8aiLgDJT0ds6mMKKvgttb27BRRZyGenWnSp8seKC4nyAmGINnjsS2iGqdnJr38Kf
	4bgrvno0ixVB6ZND1z4AvI3lPDexad+tGXNhxkgGowcq1db3hzz2OLXPWQHRXv5Z0QcGUKc9uEwf5
	gHi2FyGKN9fwNwV8SFozMyhD9KUzC4v5cDK6UfMsPGZZcczO03hMAjypcDrpjF8hKzzOaa7mxWAb6
	0jPfEEFEi8Yux3ktgcXEqS4rw84MYL27m/0AJad74d8f03yvsEExSQllHiJqBaoKtlnH/zt/oZ6/T
	fKcmBUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mbv-00000003uvY-3lLA;
	Mon, 21 Apr 2025 08:34:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJJ-00000003sD5-1mnm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so5598265a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223324; x=1745828124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loOwQqVV6eyMPf1rqSFcRXdY1hq6jUmDE2npYlo+V0Q=;
        b=NEUFjzqXkbGhAtHXkPjnPdjD9a5eKCX9isblQNjnQwz2hbQDJcvW/giUdUjNZEp/ju
         eyodfdLCJRI5Li4fOYJGsXHOLNgElPhYhFlYg9mlowXrs3IXOnbCWAsQojHCLWci2jNs
         +ZtUw1vulVD2BB7AxyWSTzjhpX2voTe5ugQFEXAynyr7/dSbgKSLnEh/LymRC695/Z+X
         GevVu/SqLTA6IqifYFIXGMlG3pEq1UXN/TCEJx4JyErTSAovS3Hcu5d1uoHk5TezwOuJ
         hWbd0AXd0W26Fqm12aaMSoZSNX8eKSxd9xfI0lup4pbkFF1bFS3qwqUm5OT/EoAwIAZg
         nMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223324; x=1745828124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loOwQqVV6eyMPf1rqSFcRXdY1hq6jUmDE2npYlo+V0Q=;
        b=eIASET/rhNusXT+xChqau/ldovPjKLyIQW846h+/TpoJxwJDYsBvxHlbvGQuYO0wzh
         1GCormZxPOnqO5+ZvPD2UV9Yl8+qwqTyCIFBjPS7sOIpRtm+eu+UPyTIgZ1KqpPDov66
         KwGVOr5oRnAqju8CdD1wEMRaPg90OnXbqC3hzNKT4jfO7Ygja7D497kCX/rMnNz8uL7O
         kj6dkjVnsyj76xmrxwpiK4iJxnh5/8me4d0W+9J523g/q2oBSlTbeYm1h+HOLhaHU3Mx
         BdpfoTW7ztWPvQA2Sdp8JgsOXXKeh88MjcJC5rmgNKAuWkcFHYXhWFIi0KxYai02TQg6
         Se4w==
X-Gm-Message-State: AOJu0YxO1wzgDmARCYbB11Zr55Nim50SXIHmqk+6IOAMF8nizoPM6xFo
	exqnkDV+FCZ2q+uJgMWW/Hm3TnAtzW0MS/l24tRlQBIjZHJhgmST3aJY8md8Sgs=
X-Gm-Gg: ASbGncuSHEvZe87eO86RATnvkaBY25v6z/QDtKPO1aNQ9LQUEKw+2BogCzeo44t7JHj
	pilV+b7PjDBBeul3vvdzdYV2/vyveUvUw+e4IAXX6bELVL5oVUpFMZJ5FnaVbA/2BT/wgIpDJch
	RYvs3fhq8bNbXcD7/Fyvr7g6gE7E4ZUk3Ohtvn46+/DhcaIn8ZXJSkiOFA5rNk2u+cc5diwfvgY
	qUFI6ZaPXEZX2kc7GLa3Tq0T0w9n/ltuYPILJ1F9uWeh0yzp3hig6nHlag7yE/Bq6nK1jKcqXj5
	sdU7KAauB/TwboXFbKDKqG3t7hXYOru54I4=
X-Google-Smtp-Source: AGHT+IHmSv8qE9xsDFDBlcXfW/ys4qY3HMq1ZN2fPCkEkMsGzarXfrZu4d44z5xa+BrV86fjMJz6SQ==
X-Received: by 2002:a05:6402:13ce:b0:5ed:c188:8e7e with SMTP id 4fb4d7f45d1cf-5f6285e621cmr9844397a12.27.1745223324101;
        Mon, 21 Apr 2025 01:15:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f625549cc7sm4407102a12.3.2025.04.21.01.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:23 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:23 +0200
Subject: [PATCH 5/7] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-5-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2946; i=msp@baylibre.com;
 h=from:subject:message-id; bh=jAw0FXPxhOIPZrusHR9ocG5S7nn7Ms5nCJNC9ChkIcI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf43T82PF0hcdf9XDU1yzYsaZy9FrODrdRE8Fe1yUe
 lviqrG1o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyQ5iR4chWkQ+5H88etYp6
 uSgj8f5ZTwu+/2Ev+D9KHpleJGmRysXw3ymqyP28/3ntPffUl/wpjM74vPT/tgXrJ2qfMTLs2lg
 0nwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011525_496036_3FCFA658 
X-CRM114-Status: GOOD (  12.41  )
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

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and IO+DDR and are capable of waking up the
system in these states. Specify the states in which these units can do a
wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO. As
IO+DDR is not supported on am62, the UARTs are not added in this patch.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c7459a360f9e1d6bbb60e68c460ab..f19e53efabf30fc333e3a7d9832296140642fdf3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -232,3 +232,63 @@ &tlv320aic3106 {
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_pmx0 {
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+};

-- 
2.49.0


