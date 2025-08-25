Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8E5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ2N7k0QaRKvwdt8Row2Gwf5GI5DjGkFkVkpFIACCKQ=; b=CCNLTsRHDQFqpdKrxjug4XdhN8
	m8nXurfyHC345qEPFf96S2vDPq2W8doYzA8+9NaF8Rw4jVXKJE/e5gPeHiWz5QfOLuTHZAEcL+8oh
	sUwIWyj3cc5xps0ecZcHBTKwXDEcn2G08T651vH9BBo0hBcyAk6HGRbGygH8Kg7fSQS36SeefDEox
	C/T1m9sh6Rz3MwgOYfgFRuWpZBS8qBtTwaxaBO9pN+6+5Fi6qlUlgU4sM0QdzjAt4CANWwbPqAjv7
	2r4C3RPcFR4I7ATLll3x7fqWhV7XoX+LA+1gRo4bMX/qL9YWGECNMS5fWpjTENY+yPe75Knf3M/CZ
	K0KYYhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRuE-00000007Cgp-3muR;
	Mon, 25 Aug 2025 07:46:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR4y-000000074p1-120y;
	Mon, 25 Aug 2025 06:53:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-770593ba164so566513b3a.3;
        Sun, 24 Aug 2025 23:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104800; x=1756709600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ2N7k0QaRKvwdt8Row2Gwf5GI5DjGkFkVkpFIACCKQ=;
        b=nYoKHIM6EEKtU4C1hsPQMpmfEiuciybrlC1puuUuyx4nHl9gOgaAH9wJq0RKALfCr3
         pXAqvbp8Aq1PgjWwfoJBIDDX90+LFjGLwYagu2HYxn/MfyGK0+gBalr4YVikmTqSK2fq
         0ADU4RwyvtPn2hxzHusa7PEeRnrt9MYGawIai6TDN1rKvpPkPgLeTLwkD9aZ4gb5jovD
         GEICc7TUqAfDd/FiSCrZVDKoB58B2B7syoR24O4wXyR6Etg3cP3lwDaVASlpKlxeIBeq
         Id15P9jMwOo/kpl+OfMq737rfl09y06JonXy1bGP5wtNWhXNfOtsVWEdtrx/z2c9AAj9
         3PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104800; x=1756709600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ2N7k0QaRKvwdt8Row2Gwf5GI5DjGkFkVkpFIACCKQ=;
        b=QvuUfgI3mcAOvUfwDrXmVo2ZlIAfNg4aEcWMoHdF+CkUkCRV1Quxz/AWNxfLzrCSrm
         fe1q6KOjqFhVF3aHaZqcRpAWCwor6oKTKG2curaNokZ8Gb2hDcqc9IlKMp8r/MobfAhu
         xvUBpAm98DAtQpPY+iwpWzqr8EroJLs4whCe8s1eMq24Nj0aanU7q9V5mFN7axMkSnhZ
         M4e4yA/C1WUkA9jxa0sXbmxhohZ0pOovaKjoud4KS/2fBqePakQE+6OfLGzVlJBBLS3g
         n9rntPExpZe/dV/JBX0hh2OsUzGDlokl3oZBd2xVREDxRbZ0FfLo6DgPtmUQ59oC26ZP
         hzOw==
X-Forwarded-Encrypted: i=1; AJvYcCWfZR3IWgCFmLOYkAjdkR5RW3ZrhtEKM4tTgAT0GJx5Q8CbSHK1bXg+hN3GbX/6zv+60pTHINozFilBKaLw@lists.infradead.org, AJvYcCWxWV+A9h9a6+kWiwoKNTg1Krz9xNdPnMEgI15erSSexv4FVNGq14UD0ah1wz3fpUUGF75MRA6GgAeASX2CXAWOIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX6JaN9N/aAR5TlWfAkCeeZJUudpZY1OJiFzkSebkpAD0cKXz2
	ZYu6UNaHdBDVbMyO1FNble1xmF5DHVgdQpHBTD9yCdMwWHlxz1RsqUXm
X-Gm-Gg: ASbGncu68H/lvgoD3L7yryFPBnUK3aGIw8JTylXbI+7Z7Is22flcy6t8rRnam/m2WFf
	4UNkUPR/z6NleQS0/RuxJe0y3OpRQ5TftO0uz9TYDRJCoVJoCyLkYOWgrlyogZTgISnXlvV6zbc
	AWVlTVyaQwrbPI8dvKjP9TzxweNQsveRjUEknV/Q9ESpJM+so6BsfFMHchsk+Obq6ndhHYLVN4f
	jZYHVaxep+FBwCFOPXXfmkmiAhVg4APD/6/ElwN719eKJ8rkv/vtBodLmAFA1HvVPiKcmFXsa5k
	evKyy8WHcgFmq8TanjK4b03c1tNNi7tav7jSmfH9J56ANPVvLIcLUZnwy9JBfhmxm/AzjXAtDy6
	mWcCNGZydUkv7I8Vjg4Lp
X-Google-Smtp-Source: AGHT+IF6BCINg9H6AheHy21bKoLfAApE4pOB1Dn/YBMZfa2bQAaftLXgoyLvL/npG8pEcRdiLKMN3g==
X-Received: by 2002:a05:6a20:6a26:b0:233:b51a:8597 with SMTP id adf61e73a8af0-24340d027b3mr15304899637.35.1756104799667;
        Sun, 24 Aug 2025 23:53:19 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:18 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 04/11] arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
Date: Mon, 25 Aug 2025 12:21:44 +0530
Message-ID: <20250825065240.22577-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235320_282447_6810DD33 
X-CRM114-Status: GOOD (  10.52  )
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

As per the AXG datasheet add missing cache information to the Amlogic AXG
SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 2df143aa77ce..04fb130ac7c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -83,6 +83,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
@@ -94,6 +100,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
@@ -105,6 +117,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;
@@ -115,6 +133,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


