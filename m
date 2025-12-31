Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61354EE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKI/wJuJbYrNWoYaIKsSOJ2GpyQ/Qm2LNLTXuOKcAbY=; b=mDezg6opHE41LJ11YT4a2lsENS
	65GOPN2y7qKDqmpDNVlqG5ioQllZYTYj8CNezDhYBzqvEL2Mkko8A3EKhNKvaIxe7Ja+Puq54zj8K
	X9jl6FC/vLyKnVs7FUcP5J6FCkbJW6uGf2y3eLCGfTE6+ZeQoTBfmKAYiSffZuiLg4WbbeApDK12U
	L6uVlX+xOS2oYC5UWGzEmnlppjmL5nujG5N8s79D9SsUCzJ+H8OFEPqHL0L3fwV3PQj47eF2NSrec
	6uTEbnilkEW9KfESP9WpaxwmA6B0kW8EB2Ay0cDV+cUO9w8agoj+WG11zVNf+F+IPgj9rPwOxgyPq
	4xA59OCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN9-00000005bQT-1PeG;
	Wed, 31 Dec 2025 02:55:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN5-00000005bOk-0HU8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:55:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a12ebe4b74so186893755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767149734; x=1767754534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKI/wJuJbYrNWoYaIKsSOJ2GpyQ/Qm2LNLTXuOKcAbY=;
        b=CrvgFs9utp09dG7B5xRHYeBq/UYZAhzvDmdIlU9RYqEflsGKMq3gTZPVbDgXlERbJo
         0hH2PiUiiEOMfyhUAxLuL5LdyIKECCBBiBKjuV20xpxvzXbvVYsigTeFSExlQOjV6gqW
         WeuJihf2s089zFFlAwnZ6GkaAKxL3442ri6kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149734; x=1767754534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKI/wJuJbYrNWoYaIKsSOJ2GpyQ/Qm2LNLTXuOKcAbY=;
        b=oJeTPDhX2AbV+nBtMim4jDe3riHObDDP2PYeSUBWltWKa1Jfyr+7gNlaj5K1SVZ5b2
         efGppBqfopOsuVG6pUQZnuziteloHJHLaZsvgfjlKeB+U3Sip0FQDEnm+7tobCY3AsXr
         D1Iwx5KNPg0qX38+JgOfyTsJN5OLMTVtyZkB/3GPexshUc0dqoxnRJ9TzDW1WiQXuVO/
         g1iGUBednn/RAEL+ry9wbFTLHO7d121NyA2ZEjXzF2Bqu+jNQE0XF59FEkfWdOZ+Tbos
         4/8AMLNex0dnBjzany9l16lGs8mI/WD8ENlrv+dG3auYZxki5NKRfS6MOq5ud7/sry/n
         OCYw==
X-Forwarded-Encrypted: i=1; AJvYcCUfjxUmTuRj7edRFtQLWkIomCEfnNjpk9AVx79ybmWvcf+0UZ43+MMikeeOxx4psYfWRfUYhIEayyVcEO2a7iyJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyCjLjKz9/zuAupfY9+6VgAS9VCZ6XYA6tdAyNeBQ/a0KXGQfOk
	RCpRCQ4oj4pQGnlmw38c2nZW9ChWJu8LoKOOaelmTMLANJl2SjpGAjs0OfQj297QMxw=
X-Gm-Gg: AY/fxX5/G2TZQBW6dZKG9Wx+CkceYaSKmRrTRDXmHfryU1ZuZnsYBZ42UVTfRPLoAzT
	YG8tKn0X+V3s5wcZaokURTcV9Y+bgW/YDQED42PO0UpptMJBjbQ9xTD7zXLU+R3U/jKmuFwc46Z
	3W7Q9qQ8t8rG28GIcwi8hZsrcieD5PRtyCXdUUmK4lQ4kxXNOH60TyQVG8giNuRBrdntkeOAPQ5
	IHcSn7A9pxO8vAp2N5qIJedf8MrqhVrDU7PgI7bms06SRIAudoAOsKWD7rPjjhiETy81Gwv/VR2
	hiUBP192TmBDm5N511RRFIx/k2vTXZWK4tmIrDJQk/DJfQ/2hncQwF1ePM3IUYNVIbnzV8JBekX
	KpZ5FG4kRhKRpibO+L7oILVpBprp8yoL47sRNAohe3kpXTAFABOXms6tgt3wg6bdFOZKRoZNDog
	4yO072P3kHyxnB6Miz5zDNNiHhBaHt5tjfO9feDw7Ajta8f2lWmM+R
X-Google-Smtp-Source: AGHT+IH91W43OdQefIGFtlnWAykgP1FMU8GvT4UyP2ij91/4qjmpK3jHr/9EepXJtOqq1m8MYatVew==
X-Received: by 2002:a17:903:2345:b0:2a0:d43f:c934 with SMTP id d9443c01a7336-2a2f220a644mr267418585ad.8.1767149734322;
        Tue, 30 Dec 2025 18:55:34 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm307762945ad.76.2025.12.30.18.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:55:34 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/5] arm: dts: mstar: breadbee: Correct LED names
Date: Wed, 31 Dec 2025 11:54:59 +0900
Message-ID: <20251231025502.1139168-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231025502.1139168-1-daniel@0x0f.com>
References: <20251231025502.1139168-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185535_110212_5DEF81FB 
X-CRM114-Status: GOOD (  11.24  )
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

The dt validation stuff whats the names of the leds to match
a regexp.

Prefix the names with "led-" to make the validation happy.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
index aedea0fbbce6..3826436a80d0 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
@@ -33,11 +33,11 @@ vcc_io: reg-io {
 
 	leds {
 		compatible = "gpio-leds";
-		red {
+		led-red {
 			gpios = <&gpio MSC313_GPIO_SR_IO16 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "activity";
 		};
-		yellow {
+		led-yellow {
 			gpios = <&gpio MSC313_GPIO_SR_IO17 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
-- 
2.51.0


