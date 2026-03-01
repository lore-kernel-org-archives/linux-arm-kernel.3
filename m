Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF94FD0056
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpLvybH3zP5QwGN8COr44GwrATbMW2vVvdQHuhC0esM=; b=rwM9a5acENGAsw5+ISgyWYalZu
	SYrM6zvw10ni0G5hn4wJcX03Ry8MQrkeMMcdOfsTHnNCmLKipY/2orqc0Iyc3AWOTPwIVXpNYhoP7
	AroLkcd1ovNEpMmtqVwTKijlCfP/QefmyqI5/kYDMGDPEc1EUn6Rz2Z2T0Jd20iThLlfvMp4bJzQq
	VAl2gu+ggTcM7DTHz+lQ5YXY7AXNdoowDtlXSu6ji1i05HwK1qw1FvjuTmibWpONpr7NKfchbYHj0
	JIPQD8oP46qHVGKD1XCgQaR2ibuwLkCGTWJVvYl5si86d6aAyYemgcT/0B3NVBGlJxfd+B1i83/3n
	1BOOiigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwavy-0000000Au2o-1U1A;
	Sun, 01 Mar 2026 07:09:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwavv-0000000Au1W-2zm1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 07:09:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ad2b375e58so5691345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 23:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772348983; x=1772953783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpLvybH3zP5QwGN8COr44GwrATbMW2vVvdQHuhC0esM=;
        b=ku56qKPd7svaj/dfSF0ZqUGSjmldIfR8qG2IEILz0LWwtHUknvVmeaHmLgQDSnnggD
         CJ6kX8HwWdF8fkibtPv6W7m8H9UiaeZs/C7I18ASW45T6jWJwCOZAhyANDRZp6+viHzu
         li7R/4HtYGlsu+iOG7Y0ql/a/FqMREWscJgHo1jkvSt10oUp/IumKWhCGvoUFI4yOBmw
         xKLUSYCYl+xvUicjY84v+RrdRCwRMTXdJ4xA0e8TtIzoWBP38yE/Htcrdn05LUiMfhbh
         X1i9hccueidopFKjlJmm241AZqWs2YQXPMYAwNbIdJBBH9QT7sOp18Ng+QhkgzBzaKqv
         alog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772348983; x=1772953783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GpLvybH3zP5QwGN8COr44GwrATbMW2vVvdQHuhC0esM=;
        b=MhNbQ7X1i1t/JVDUe6GhN8JoHPK8fMoojbPSive/0iaXrEfLP2bhTJGvRgU5ODYVxI
         fQeVmvPoLveqD2vRlruGxkDpj87A6LSt34YPTPUQx38CzQJCCRpwoQyuDRkASl9GKiPM
         dhLNhFvM/dh3D5ORwhjIU4Dns9ksngNnc/M1OTirTk9PFYt0sYhdZAI/W2EGA/kHeY5o
         6IxOOyQcyFXe+S6VDGGKR+aHy+Ti2wYW3Bm6SatGDPDAYYcEfAe58X6bjQCQyuXpIZB5
         BYKE4HtPk8hUWNNjpWumEiztGMIEap7Ix2isB/keZEp2EJF3w8MI+rL9myFlgXePVveK
         ETPA==
X-Forwarded-Encrypted: i=1; AJvYcCWrxRIsSlAOrVsFO56cmRWIRxvW32fXEk1RT+cwGKG4RU7e4qgVYooO9ndI7hIJqV9Khw+5RYIm7wYby2z1YgkU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc/rLEZ+3aroWPSJJA48Ug9+h6W7vxfXNgtmGpgupK8axqrbu2
	4IPcqU+Q7XAGYo9tml9ijS2+OmqiwqV8YX1HoLsOkyCW6yLoHP8ViCa8
X-Gm-Gg: ATEYQzyTqlt/JjN9lP5V6HRO15Aqb3IUM2JQ9hDeNmR03uTr373Vx9LzRVhnagxjuPD
	qQyCK2FqF30rnJyl7AL5ngRQx4I6HSHVMeZMsl0gWS0/zm9458vnfddgXdrmZh3CK3Bftx3H8wP
	1LWFUJzaCnQfNQSRf0xiBpfgnCpEVSFrymKeXT25DVZ6nLKC2Ix2sqPRlEnIu207LrDyiIsiNgj
	UFHDMMkKsMaduNGGHFxSftjcPMuwe/g+0rzAAXRQF6ewflrfEbDW6MVytouzPCqbjbkamBDmBR+
	PnLMmVOQgeMx39ED2zRFXYmU4zlwSautW9cE42y8+xILiGFcsb+slkPLVM3DczDmlfhu4FmSo/S
	hIJ7ibB98pneyABcql2gYDhVivMuIvp3mmQwIhBKjqkfc/JQ+EJZI8TvIaad5ESoqvCgpgWU3DK
	mMGCkG0HWrBSDqNEkL6uznWK7E3FP3jhd7KNY6eAkGsn4A
X-Received: by 2002:a17:90b:528a:b0:356:22ef:57aa with SMTP id 98e67ed59e1d1-35965c2437fmr5250235a91.2.1772348982817;
        Sat, 28 Feb 2026 23:09:42 -0800 (PST)
Received: from localhost.localdomain ([240e:400:9c28:18f2:532a:7136:9478:4b8a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359814e3eb4sm2473463a91.16.2026.02.28.23.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 23:09:42 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: cix: add src syscon nodes for sky1 resets
Date: Sun,  1 Mar 2026 15:09:10 +0800
Message-Id: <20260301070910.6169-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260301070910.6169-1-xueyuan.chen21@gmail.com>
References: <20260301070910.6169-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_230944_107354_B9F6A92C 
X-CRM114-Status: GOOD (  10.92  )
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

Add the SRC blocks for the CIX Sky1 SoC. These blocks
provide reset capabilities to various peripherals across
the S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
[Xueyuan Chen: Refactored to pure syscon nodes to fix v3 review issues]
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index fb8c826bbc97..6ad5dc368a66 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		src_fch: reset-controller@4160000 {
+			compatible = "cix,sky1-src-fch", "syscon";
+			reg = <0x0 0x04160000 0x0 0x90>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +574,12 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		src_s5: reset-controller@16000000 {
+			compatible = "cix,sky1-src-s5", "syscon";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.43.0


