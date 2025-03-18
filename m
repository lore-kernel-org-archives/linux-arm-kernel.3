Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE56BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmCr9y/zny2ubL+q+EvXUgJdImEUCfchERMe1C0cWbE=; b=bQcIz5zDEtwRI2+TgPzRiNXgua
	mex7O5J0oTifZDk/VzN/AxoxWd1zM2yXifwk1RHk9/yU7pYob2ml2B3BG5fSGz8tB8pbsMurn4V+S
	GJzaSvgvIyp+MSpgCdry8AkCU1kdspaAdceF30ADg6GyJ11jxOUiagACMUdqAFuxUGTLpcSWjNj4Z
	aXign30O1a3hrzOCuU4My7Kf1VW6pD5zJzmcBwG+BW+RxPwxedHFPq3nK7ocZvNXUIxU7vgJOdSyE
	bDFJTGWKJj7hf17eFNn2cJT++N4UdW2uPBKvlucp63C6qWraG3g5vlLbt1SXea/+5gphM+B62IkJr
	aiZQNlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tug3d-00000007Kif-2cm9;
	Tue, 18 Mar 2025 23:09:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufvg-00000007J78-3ZsJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:01:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22409077c06so156875215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 16:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338860; x=1742943660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmCr9y/zny2ubL+q+EvXUgJdImEUCfchERMe1C0cWbE=;
        b=pW3633zksDIbiuEf/YgTkH+GGabHlUHH9C7KdIIn8bgN+f78swWnuHtQbnwI7agyAa
         qEOi1RYbwWw1uBrOf+2NW68tewEA30BMBspK2tlK8YUJt/DNz0KEVLcaBIhfzRRbo2D6
         eiX+kzFNUw1xma6MgNORSz4ZqSrpn71JK5NaclsWiAcQeNeRe1LVpHxkBeKINSQEoSyA
         grl8OMk0TCnb/dBh14jTTG/BS74diXAsIZXpycmXEsHX2GlRpiXBWDw+wb6HvoJdv9eG
         hhm22IpnZyn58Oxx/I6nNM4/Ek/wY449kmrfBXuKPCrC+NrM5saYG6jJELwX1kLnReyk
         6l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338860; x=1742943660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmCr9y/zny2ubL+q+EvXUgJdImEUCfchERMe1C0cWbE=;
        b=bU7cHazF4xu4m9s+YMeKRjF7Tt+IEUjb+I6Df99L3cdd5+O/FcDxfMsgwUWo+I7URt
         ulbJm1RzfTXpU7tZ5XEy1rTs2YvH8rQ2HRDb7MXqn12ehWSFl1FfXTKAxC53ccb9ZmZY
         m12SG+84TZZ3DZpjq+VjGO5HjoxUjg6LRFFqI/NSN2lOXIWkP1lbXG3NHHuiAbjQ6VRi
         qA2B5RlFKNKbB1h+cXDlY9wJcZMYrAgttYkqnZML/TNltg6NMliAZ84ndq3McPb2OtlG
         HHgcNBLk6U+61+AQIx4L9spe+UeAThbYmzlaJLNNmRzQGpsvZs++VZvoLoidkqEJ7Tfr
         Pm8g==
X-Forwarded-Encrypted: i=1; AJvYcCVbeMVrOMBWgFC0QOztnpn1PY1ZrEtDcQgl8GEt5EDm5ziGi800EfV21dBrYmv0+3PNX5GUVUko3f7p5st9HgTP@lists.infradead.org
X-Gm-Message-State: AOJu0YzbXSKVG3ytXvAxCHzPF+TZhfnMihabS5zCXYXK7tzZH0/LU6uj
	cJwfvoOvAtOWV2483olzY5gGHaKe8Rlys19Ce+oHBqn4E8m1waKzZRvynsh8gl4=
X-Gm-Gg: ASbGncvMM5QXhZWCcdK0U9GY/yEihb1NGEpX6B9xoxO98JsdNG+3s1oDkTNNrJA9o1c
	lRPpKogCnsccQd6jKf0/C/RhW+uj2PmVwewu1fAJCJ0s5zLYkDK5rB4eiN3iMu0MMcIU+tAGf3n
	DAh72KPM/grVuCGqqj9vaqt8vcD/4VW0W6R1YrQeb52ZV6IhRS0aVmfSEes49GePApfeR75Hzvl
	fgJMJY735cKPRmOr2BMGpVp1mIIzlM8PNn30ezX3fOKJpMaoIJQ42gU3V+5bE+mxX3QvCErB52y
	ygROCzKXJ8uHz5mHWpQzy60951NwUGAxLfWal78QCYFp4PSwXvzKFEAhPFFJhn9/XESbz9IwGpy
	3Di6llbVy+fq4oQAHfw==
X-Google-Smtp-Source: AGHT+IHoN+lflWvy8IsxGNjvVcOT3P03WGhfooUosnPSGHOlgyWeNcf/Uk7lY1kmD1/bWRv0OH1Aeg==
X-Received: by 2002:a17:902:f647:b0:224:f12:3734 with SMTP id d9443c01a7336-22649a43b2amr6644945ad.30.1742338860084;
        Tue, 18 Mar 2025 16:01:00 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:00:59 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: am335x: Set wakeup-source for UART0
Date: Tue, 18 Mar 2025 16:00:41 -0700
Message-Id: <20250318230042.3138542-4-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160100_894488_3E5D25C4 
X-CRM114-Status: GOOD (  13.93  )
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

On am335x evm[1], UART0(UART1-HW) has a wakeup capability.
Set wakeup-source, which will be used in the omap serial driver to enable
the device wakeup capability.

[1] https://www.ti.com/tool/TMDXEVM3358
[2] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 arch/arm/boot/dts/ti/omap/am335x-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-evm.dts b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
index 61bf8bcd4c4e..20222f82f21b 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
@@ -388,7 +388,7 @@ AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLDOWN, MUX_MODE2) /* uart0_rt
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.34.1


