Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740E0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=; b=w8S/QPlCFzx9rwj8qhI8eyHQ3o
	kpkI2tBH5uL59oWOZ695n9T52lIiINva5YnF7OW4EvDsdvW7Ra79HVWkZBkECIS2VnwsXzEG4Mb06
	1bgGmVi6Rp1wUSaSwa5ctrSfeXYRVZKARBMymJGcocJbaYP5c1WKbwjKeaj460c81MeRitXyC4hUw
	Lpb2F7UKFMXv9MJns9zhOWra5FtGIurVrovdO9zeC5SdypzUHMuyLKuMU1JTFPVEtPIsMJWTkXwH6
	wNtZ6zZ01NFxlvE1UvCpTDUrMsyaKlBXrrUVyZs/36rY/tTwZzyq/3++JOrcFVhlDhltRXNizi9/V
	+2Cchjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua05i-0000000DCOJ-02Tr;
	Thu, 10 Jul 2025 22:50:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZH-0000000CtAO-027V;
	Thu, 10 Jul 2025 20:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=; b=rO3hC9dmmUWSuxPJT7fvWnOPkI
	hv7pjbeSBVkMHU6AepRoaZVtZ6HELctvpQNpq7UXEQYdd0O97PAGJBkfPPrCUZ4EnYQlzOkVUhqU9
	tNPDCX/Kpqjt1/qpqBIEm9kNYCx3feDhiZuGs/uhsbrptZQmb6lmY47OUUU3pII1b4/ot6Bp/I+M9
	nW8QSpzXH6ZWpNS/NEP0EmB62jsLBjUTH6WhSBfuicUK8VbDyxsqE0vQcStTPBlSIATtU42EfNAm/
	tFLePTd/ZNWXWu1f6TSe+EKnSl2Zd8v/5KNpIdGaPncjPjYzAphNiLz43QmSLElEKzqWz9pqcx/ZY
	EladQ3pw==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZD-000000098y3-2xzd;
	Thu, 10 Jul 2025 20:08:29 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1036791b3a.1;
        Thu, 10 Jul 2025 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178106; x=1752782906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=;
        b=hgXQ1ooOlZ6rcExOcK1jb9mymhTS2n6wuzgoffUerkgJZ7KFok/JhswHHxs1X0HXhK
         AbiTQnthVhSEkIiUoUSrSMT/VZSOB8eki1E4df0m2HFt0NAPaaD9ssVgWxZE10nvxuy5
         J8bmi8OF+vOnnxC1ExfLJ0cOVSQ41I2BTvwgb3fEKs5COv8avpC11Aazipu3cdcLZUrR
         WoWcEXY6YQSOWMQtcLM1Nn1pUV69P/ipGv0gFl0J/Yzoo737MwR5ABji62QHshg8ICMl
         JOr396Dy89aLeG9th/g7KhQDtzjnYAcz4Vz9QpPLWeujmwHH0BGBwRbTDZooD5u1aiC9
         AKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178106; x=1752782906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=;
        b=oS7HGhsFDF7UIUo5vK/CVSZapT4ycYsT2VlNU9ZbY1NCT7BiYY2LRtLCEXSHcMNzhG
         f8ZbMlpaLVaUF1uFiizrtmGtCW+ffJap34VtEVnfrPDXHiqOsB4ph1AWxaMUAm/qO1Ku
         Diuig47bgRudTymiq+rBZaj6dbz1j20xi5Qz9TZ+qgaHCRyYHKzJ93Fj9qSlhkTx4Bal
         0eGmG6r0V2SH+ib69ar7GA4cpXarjjydtDrhupgYSZYooKHCdrlDN0cWepJlYfnaNU7/
         aVDzNnUG1tFt9OCzDU/jg61E+kHWryOKAHgYr+lyFKXag8I8b0jKP46oK0IwmZLNk/Ir
         rR4A==
X-Forwarded-Encrypted: i=1; AJvYcCWR0McG+jQyMe2VMM9KEtV2O4sDI4F62fHlzY+xdR/NFiGgTfDIjfFB1YL2vQ2w+5Uxe5Zq6mJsXd9EVkdzZS0=@lists.infradead.org, AJvYcCWmt/xphDwhoHbwBkTgncBKYMN65LPSz2G+JWO6XhMdO53C+ZjEVZAszLjwpoHGzhFqFdYZLAIEz2NA9QpPD4QC@lists.infradead.org
X-Gm-Message-State: AOJu0YxtaKIRTXfOd+rky5qlVNMF1JDR+mV/1UN1FJntUQc0GMJBupd8
	SXYiSKGa2TcB0j54tDE3Ff3rCEZYwWc1WBtn2zjx1jct0WAfJPM/xvkmVr8FWaFR
X-Gm-Gg: ASbGncuExqeaMGKhQzqcg7pGmnrCPVoX2xxWFzVWwSePtrupgJvh/fvsUjpB/QESr4l
	qIv4bG7NVplT59l3N1D489vPxwwUG/iVOW9UPgt+9uUSqyAIfCsaRRDqqwrQrzYx0y+rO8lTqwv
	NATpbMZ1BDho42no4bJ2gn68SO6b/qB5ILYvrbbJLEmPMxmgHanBEo9kS65t+XplK87egZAB9ml
	u8/5EXppduVKqVY211oubbTZapGG/x82v2pc/8eu0HQUCOhWYPSBWBwYglW1NZbOS8bjB6MSMmv
	0gWpPS5cpr2Vt2prS86/EYPu4uUNUg5Y2meY+5nkBCI=
X-Google-Smtp-Source: AGHT+IHfPGQGYb3EmFwhXCalIpBTrUjKXYsMjtYbocmnfGZ8PHyWlghL+KSVZ45IoryDzbeskDxV+Q==
X-Received: by 2002:a05:6a00:cc4:b0:749:156e:f2ff with SMTP id d2e1a72fcca58-74ee109b523mr518595b3a.7.1752178105798;
        Thu, 10 Jul 2025 13:08:25 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from OF
Date: Thu, 10 Jul 2025 13:08:16 -0700
Message-ID: <20250710200820.262295-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210828_021987_9F4CFB76 
X-CRM114-Status: GOOD (  15.57  )
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

Add a single binding to help the already present dts files load the
driver. More are possible but there doesn't seem to be a significant
difference between them to justify this.

Use wifi name per dtschema requirements.

The data field will be used to remove the custom non static probe
function and use of_device_get_match_data.

Added OF dependency to SOC CONFIG as adding of_match_table without OF
being present makes no sense.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index 3a32ceead54f..a0dc9a751234 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
+	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index e73394cf6ea6..db8d01f0cdc3 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static const struct of_device_id rt2880_wmac_match[] = {
+	{ .compatible = "ralink,rt2880-wifi", .data = &rt2800soc_ops },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
+
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
+		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


