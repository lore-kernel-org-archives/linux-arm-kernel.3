Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742F0CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDff7kxeWQf5w68Sqw0Af5Suelz9hF3DYdfqd/EVhpY=; b=va37a49jSOTsyLIDE0WJ9upHZ/
	iFGXqBnwZElVxx3UBkF9r5Il5TlGy12X9PjqlS7AggrdjcGCjP5XAhKE745vIZTF3xiFIhWwWDpRl
	0VyWCCOj/dE0NBjm5oRluOHq6oDyf9xjFkgjuiSOne4r1ES4OVwaSTwv2vdAZ0MKuHjIahWfRXco5
	iHJ800i8B3KNOJQmUN9uRdVoqjPQGrqW7TQk2YenTKIHsb/OiC5LbpY1vPYryCKqcP1NObrMJpujO
	6zSZK83aRgix7abZbR/yxdwSdQR9W0yHsrdFAo0Eub19rlL3rPD/aR5l1OGqtF31zhlAffzeMITHB
	moREKCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRWf-000000079iH-41UY;
	Mon, 25 Aug 2025 07:21:57 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR5R-000000074xD-3W94;
	Mon, 25 Aug 2025 06:53:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e434a0118so4722164b3a.0;
        Sun, 24 Aug 2025 23:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104829; x=1756709629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDff7kxeWQf5w68Sqw0Af5Suelz9hF3DYdfqd/EVhpY=;
        b=ZtDd3FNDiITiC9tTtVRSlhf2hwVfVpkH8BQXFN0118NAi2cCyRHv2JrtbcdIuqx7Gz
         pFyyEn2D24TaaPhWMhUJes/1xHpdniyHTWoiht3kgDNbY2e/cVTg/oPlUCznyNn8PlgI
         V3wP2h4BlLvOLBE907EIICZYmoLq0hVl125HpNtsKyvvLBTHlOTD2OdkW891V0IP9Z0p
         TzqCjMqDa0guGej1mfRuQcI4zpanm0GioyJBbRe7Jr3dSiNYq2IPxkMCSatfVb/qoJKv
         0Eg1Q2mbU8kvAxtrfKI3w6imhqeP1C4LPwQcxjZ8Z20sPmdz2QIyDpoHICW8J4cJLglz
         d/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104829; x=1756709629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDff7kxeWQf5w68Sqw0Af5Suelz9hF3DYdfqd/EVhpY=;
        b=EwRLyvL9js4P1mwMt7gtHId5xv5Ex1Lk3gLcz2pwNIaKu+cmFt6O9yAOW2TqyF2BYX
         dmcxbMqhpe/xvIcJ/SvX8nivXrxciAbuN+MNAARurWmkccVbe1BtTKfL+jy1OiktSkWb
         q5jPG8lOzRyUnVplr0myNiX9Z6RUIUeGgeo4/HGZYuuJd2pLVpQv3UyaJ3fh+4q9wCEF
         eMjrXR8QN8QLly+kCDYcQdsvtD/tvFYZW9tyhKmYfUxbVdArDAlknonQnw95Lt9B9Lv6
         dWwg8O2Y218ENP7ImEKAdnpQNQszv0mntdlE4D2vJCzHDpP8AyZJl3fmPC2LLcx4qBpY
         +A5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmzvLEc+Z1qVnJN8HmrSTwjAXB7VOb01UZ9X/8VYt37wqjFDjwT+TWoSoDHQPG/1je5mDq4izNHX5CfhLL@lists.infradead.org, AJvYcCX8RLlxXvkwKaoZ+zHsO9sMyUcnVjh0eg+kvWugoQ8iPYnkrx9MKRHhp8TAVUqzcvqW/IlMhKOYu/BE6WOQUlH4BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YysBzWoUJj8qavgX4kxZIgYYyycGgC+tfoS6qxvyVRO28H8QNx7
	xw6sEM2ox3qZlUHPGPBTkBLy1mDJSzA+bBs06DqwfKZqASELb/Je42zx
X-Gm-Gg: ASbGncv3Uo4f/Sth8RyvCHt7W6VELTPYAsPoTf5waA+7jsVLcMNNtlsTvinYJ3mQN//
	KZCPJmfEoS/Z3Z3M6zr8+nI9HjN3qmkyr+cC3tEeSibIYDLordD2+Kw70oC6wWr2BkzXnK9q8N3
	0rs5SfJJTI++IwwZQZj992z/hX8xjxdMtbF//mZC8CQf/TIy/nfq/KTZLsiru5DZD53HLYM0bMD
	RRnq5tmpm4NrdTcvs03aaDLDV7RnLcPBVUp+/lS+a+4bUIFqzBxJ8hEaYy0/5E4T2Pl6UWsPIUM
	g4EeBrByJgygqO4WE3SislRPPEwaT/s4xXfCDJhYCY0L7zlgwjDox4tDVyvqMFZTruJDho/eAQ2
	2paD5YMzCdvxTfI5zpSBv
X-Google-Smtp-Source: AGHT+IGuuscwtZ4k2V3iWkVLW0lCKtraVC8ZN8KLi/LF46f4gd15DaExFKpQGwweAHUC3u4yjRYb9A==
X-Received: by 2002:a05:6a00:4c81:b0:770:57c0:1fd5 with SMTP id d2e1a72fcca58-77057c02170mr3851638b3a.11.1756104829057;
        Sun, 24 Aug 2025 23:53:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:48 -0700 (PDT)
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
Subject: [PATCH v2 08/11] arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
Date: Mon, 25 Aug 2025 12:21:48 +0530
Message-ID: <20250825065240.22577-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235349_876267_D128A5B8 
X-CRM114-Status: GOOD (  10.81  )
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

As per C3 datasheet add missing cache information to the Amlogic C3 SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..ee0b1ffa947e 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -23,6 +23,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@1 {
@@ -30,6 +37,22 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x7d000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


