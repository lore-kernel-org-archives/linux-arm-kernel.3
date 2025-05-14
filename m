Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7CBC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=; b=Myv1OVw+Dgy1OYsORd3M/Zc2Te
	63Qp2En1hGNzJv6kemkFIxLy+EvDjhd14RpRRkUvDI1kYf4rvdEGhLZB0yxQfxYLuJ/Y9sV/1Pg5C
	Jq6ZH2zHmZHfgGShETR55WZGnXzYc+A+serQkalbiAFmeJZ/XUe1tm/EcfBcQymVnQ68iJvD0p4av
	bEVnRiq8Hgr1zQiVZ4ycK9YJvvcfI5iX9H/pp6dkXcMxqjatD24Zr8GbNKTmpT0B1GlyIrVkWYAKw
	wwuqn50CxsO7jBnRiBAGf7a0ydVjPlWRY0n94MtL8CWmRcfaCSNUxNIQuB5oBblMWcwwA5HowETN4
	nya4deBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8LH-0000000Eemm-1R6K;
	Wed, 14 May 2025 09:23:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Qb-0000000EUg7-23nl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43edb40f357so46090335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211124; x=1747815924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=;
        b=Tv0iyvSO5zCC5W/3yCasTlQrt21PhhthKIh4mG7Suv2QuyCjW+LXHha+NDP6662atE
         dlZWdxmVfQlnHf8wNFU6XG/PORsyQWi961Dza6KyI84qH6zOmhPD6d/Q90LabUmAV5j+
         fwFyU7RA7oUa5nyzQOC7gtEF/0knxWQijt+5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211124; x=1747815924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=;
        b=L2xZFcb1oGDpelivq7Jq36l/wLrmCkLG2i5gioceIW5sQyrT+6tj4Kb67mIayRyfnH
         4jwOCLFIPzjs6H3WlAVKwUv6o/45n4E/Zr2w5twZS1E33U5FoBIJTl2KggS6pw33C2Tr
         3FingZF7HAC7ueL/UeVd3URxUbTfdjatRJz+vWqDdYFI29A7tkm6w0IheMwBmF3RkTxj
         5x0UeB5+9ipd+wLpKavKqZlJQgX83sBvQkK/8hz2gJMQCElx/PJzncApNeIoWDJtkTtU
         SZ331LerXImZqO4XuOBh4RV959cvBtNypokEhhImPq/4lTIXXOhZFqgpAYtCfBor573i
         FycA==
X-Forwarded-Encrypted: i=1; AJvYcCVU54TkNwCCEBqpbM0BczLoczg76SzK09Idv3RIVpug7+hW9+cXujmxLc2FnxzrpQpARDRddx629FuccTIUDoDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1O9fOGDOD7gLKFrpCq5l/OGwubUU6TCu8NyQhHETvI/akeA/G
	dZXMMze3qiR+83Th5CDG6HysVKOyMm2EedZFrp7TuU6+CFf3KBUtZmOaKP2qolA=
X-Gm-Gg: ASbGncs3OMmdbHP5AE8DtDCyqoj2rCatb9raQ/LrGXAHRClxkLEzXi+Mw4oqq8Gbk1u
	U2J57iVr3zdGafeKcJA/VbMt+njd2ox2j1yChUZvnNUYYS5owqPEZkpokgqLOzqWxZiW19OiJXR
	d0HqV7rFaF8SnH9TL83zlftvRtjKcMczxB67sVQtMIiXH7DS7FJpzVa/Fy05qeCY85B0mkICGrb
	zx5hg9VKmuB/QSu5CBnzdDBw1Iiht+bpdjNTYKJE5CHpoZkhA8zHivKhYNHTc19rFdMpobFOHuD
	EIw+bOs2/J1Y9SB+qnxklg3rAHZ6qefTGtdjS/FuLxWhSgy8imO/xkiVfw1KRm+dSjnsrkhIdly
	NhNfdT3uVFYJkmGu4eZW0vDvZcuz5/Cp6jMj6AbOeOUs=
X-Google-Smtp-Source: AGHT+IGAQQ9NlUKuvedZ7pLG0Sc9I8RQwhVN2gN0j3XvRSIGwZgxGrZPudb3M0+2G9JZsIqwK0mXVQ==
X-Received: by 2002:a05:600d:d:b0:442:f44f:65b with SMTP id 5b1f17b1804b1-442f44f09a9mr11192865e9.32.1747211124008;
        Wed, 14 May 2025 01:25:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 9/9] arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC SNVS reset target state
Date: Wed, 14 May 2025 10:25:03 +0200
Message-ID: <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012525_528379_1EC1C4A2 
X-CRM114-Status: GOOD (  11.36  )
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

VDD_DRAM was disabled on standby, therefore the reference hardware did not
wake up reliable. Use PMIC reset target state READY instead of SNVS, to
keep VDD_DRAM active during standby.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index ea8d741c6904..633874b3bf66 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -94,7 +94,6 @@ bd71847: pmic@4b {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		rohm,reset-snvs-powered;
 
 		#clock-cells = <0>;
 		clocks = <&osc_32k>;
-- 
2.43.0


