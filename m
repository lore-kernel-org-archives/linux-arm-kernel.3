Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B408E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z+OFIo6oYvRs30dPwtO+gLECAhFDSFhyF+Jm1Y9wnQ=; b=rX60J8ZtNkTTOTjAOFOCaosnQw
	kPhOKa2lBt6SeSgcLSWJbcGtKpDwHZOmoKHKdP1bcRRjyLvPEY/PceyZbLtFBTXvO2zvQN4R7kCbb
	hy5iDbSfDnwGWjWKvVBZ+hVrC/r60mK5cX6A0swvndWED6lFp/71+mcwLUOTkmrhXVPXxh3j1e/03
	+n2hOBtRrvJK6sgmSbcWH5H9OlFFCGIjYRYqFO8a3eLe8vaxyr66RerESedV6ShidVGG4H7VjZyMB
	EVfVK76OFviq3REDazJHmYQrznZ6MwcLT0PReZCj+OLhyRrcYTX2EIaDcmHqR3DtBGeC+v67fCtT5
	BzzKF5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMwq-000000030CW-1aAM;
	Thu, 19 Dec 2024 20:16:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMn4-00000002y64-1Jce
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:06:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-540201cfedbso1061277e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638792; x=1735243592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z+OFIo6oYvRs30dPwtO+gLECAhFDSFhyF+Jm1Y9wnQ=;
        b=MQu5Wr7Gy+Aq5TjXAAxLgyZpSvFWYriTVz5JnMFzZAAo6JkoramEdOj8gazkG059D9
         6RXulAXDkL7mQoojnnQPynqq27l1QZmozdOFeRhFXkz8VZPp1WEPoOV8rOQWbTnGSuI6
         Z6qzVMO1Knqj9GFDT47tyY4ZQqrbZYbR24WBYPEhx7qqeaPMVIpv82KRiLlgGphxyi0O
         qwoLSt1ZFd1/pYK+UhlTuE4KViaVAytGuX8WouyDYDKKamr6uwrXmmZR3C6PUa5uHPgK
         UQremma2S9O6MsEhwfMQtFuaLORLAyPPJoRBuzKEzc8sotmPNo/vqMTrF8f60Kosm0Bi
         TpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638792; x=1735243592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z+OFIo6oYvRs30dPwtO+gLECAhFDSFhyF+Jm1Y9wnQ=;
        b=W8iauzAM7pJ6hzI4phMHtAqdxKt1A2t98POrd1N18TJL19wnebIAmgy58DSPiPQrpa
         Z/1KQx7enjPAfOHObtWMJjpoOo54OxghCH8Zjzs2iP0Vsk5RQRssi+F5l0xJWhu0+PQd
         rUSLiJTP0Awmsyace7z11sdoOeGsHscj2upD2upKgJ8re0DHkuLWspUq2ft7la+11tnv
         Cme9YRvelkaXkKqvfD0/qZGN5aHtamoF8Woh6hEW6SL5Hc5o0UwweJHC9EfrJopz77uu
         5XP7webfBXxB7Aiz7YgO2G9o95oArvCGx9q7gXJ00CqZRC1Kk0i9zXwUVQ/Nhk2VEer1
         63tA==
X-Forwarded-Encrypted: i=1; AJvYcCVWVG9cNyztCeXh/WK/IAXM9KtpHz/fzPzM0mkUZxCKkPOmP2G3FHKaE4wn414QRWMG/OuwiqNFTiKwTVABisQE@lists.infradead.org
X-Gm-Message-State: AOJu0YxC0xVUpEhus6ylcUXLDT/7AVnem619n25sUdL3ozAnpU3V1LVr
	2DPrq27m5T2erqEkRTOamL8aQgjotjrcuSq66kVNf5IWr3x41edPh1Vv16B7W4iY0QM/ZOcsHrc
	C
X-Gm-Gg: ASbGnctE9kj7EzGtxADLhiVFhBbUbXDhPudWjX+URVK3rJB48ba28rT1h2jFmekabSh
	Czk3V1/YhAd3q7OOc89G8iNOrVCVB7pDIiurtudhBHATlzXBacGDJOVMr1nM1PRrRFN2oCCOpK5
	BaZ+00MOIGRORj0TSRriMy3YGp0TUGhuvVsUdT7uvtHBCiYFqoBHKdbAWGJZ+B4CRG3kyn+dYgz
	773WjvTRrn8klYiV3S8WToZGgj88/GsfPcG5iN5cNy69SY0LA==
X-Google-Smtp-Source: AGHT+IF4QehdfOuEvDMqzB9MY4lPolUTGRMgbZDTTZ30MZlE7/TjNW2+5MWxblm0XOXTHJASMqJcPw==
X-Received: by 2002:a17:907:6d17:b0:aa6:8211:ff85 with SMTP id a640c23a62f3a-aac2d479750mr6446266b.35.1734638350970;
        Thu, 19 Dec 2024 11:59:10 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894781sm97668366b.44.2024.12.19.11.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:10 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:57 +0100
Subject: [PATCH v6 6/7] arm64: dts: ti: k3-am62a-mcu: Mark mcu_mcan0/1 as
 wakeup-source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-6-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=msp@baylibre.com;
 h=from:subject:message-id; bh=QvPC9XT2nTzuBVKU8Y0OkYtXeaFjH0JRpNZRrR05gzg=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqn6Hqj1OYj4hs2fjkpBZl9sNVrwPbMm60vH0xXVTv
 onsrKedO0pZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJFB5k+B/sFhC+ul/0kEPe
 742zNtvt/yYQbtX24KrUqrP8c+1bpTYzMrQeOJiUdmw+t6m6tPe1CfzCWh8FzRY9ySycxqF5sCf
 0Ci8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120634_360160_AB316819 
X-CRM114-Status: GOOD (  10.76  )
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

mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
accordingly in the devicetree.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 0469c766b769e46068f23e0073f951aa094c456f..7f88f284ea5daeba189976d03dbd048626104b77 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -161,6 +161,7 @@ mcu_mcan0: can@4e08000 {
 		clocks = <&k3_clks 188 6>, <&k3_clks 188 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source = "suspend", "poweroff";
 		status = "disabled";
 	};
 
@@ -173,6 +174,7 @@ mcu_mcan1: can@4e18000 {
 		clocks = <&k3_clks 189 6>, <&k3_clks 189 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source = "suspend", "poweroff";
 		status = "disabled";
 	};
 };

-- 
2.45.2


