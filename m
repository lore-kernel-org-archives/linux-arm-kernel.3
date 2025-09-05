Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C789CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRmno6/jb7y1yMs+Fv+Jcp+7fGHpf1owbaVkni4ePvo=; b=iYwRSghQP/34Jg2D+IcQc1EHlC
	yd/j/WSpUUQkqvSx/dytic3H845HgT2+XWXSSfQ/C4eZjy4ddNDuduLrThdbXdGZ22wYZWtwC9dmd
	QnYeOMECgKB1FsisaRyx3gTRuLVP8ay57vSG8oOjs72n9wYDQ9Xd/R94F/yKbRiDRf616s+xe3+AE
	NbSQ2rLU1q9+lluFLSC6jI3P8FV8Mf/ZZpJwNK15HJPg3g6CYEltl9sZ0cNTOPXrVkeXsZNsKn+CR
	tI017lgy3SLMuqj1tGbIiZbt9aCc3s8dmUqVbgWXo4bBUnukC9C+Hp0vXux8QU2m7+qb+e0msULc6
	iJm7HThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubLf-00000003rOr-1YuM;
	Fri, 05 Sep 2025 18:39:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV5r-00000001WzA-1qab;
	Fri, 05 Sep 2025 11:59:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7722bcb989aso1538224b3a.1;
        Fri, 05 Sep 2025 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073543; x=1757678343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRmno6/jb7y1yMs+Fv+Jcp+7fGHpf1owbaVkni4ePvo=;
        b=RCJ7J7r01EkR6wF6EOO+eq6RibsskSRSmEoY5i//h15FkmBiFMpkdWBGO5l/uGvImY
         skmdp02+vYi0TCwoTRBV2ee0zWCMxtWdMRuOhKSh3eFkoY/nBhzB9LXXxYjwP9Zkbswk
         8AgnwXPOcIDn6iDpibRpV65Lh7Lmwimh4CRJYJkPtWVbgHOhyCO0k3xWrwLijlq1F4Nt
         ASDhzkLkvtvfCvGy1K61sET5bak4+o8ErJLb6BHNGUBRXaB/oObsgUZ2V+AIFAQ+bpzF
         Nbczrihjb7hSnxwa0GmW73YQOwLYsmyI4/xKJwC9ujL6kQ7Z7Xhy58DNFigpFHHw1Yxd
         fCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073543; x=1757678343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRmno6/jb7y1yMs+Fv+Jcp+7fGHpf1owbaVkni4ePvo=;
        b=xJ8YJDlFNExy0UsPu3wNUnbUBwnp2B+fxlO9ZBtBhHepIBIjzRPP6r0vXxQ41xjvuT
         P9RO5ul2826hsKj5AZp4pRjTem8V8vP1MUc+PYut3DW6xXHccRhyJEiGVdrlkyQ80rpc
         8yHt7CjIbKUZPfKj+N/b8ZuXBin7u5tujzgnrm0+hvbeAQQC8G49Bce2bGvdE7kxefrI
         09WsyI6SHdE8FTJ096VXwChyu1utHpciyJnGcEUN/jhNA1Cu21yOg0fJ99MDlSGRCLam
         XAc+JY5+dpL5i1jujqWiZbUQPK0UuhrOM774Yb4n+fPv4FrUqK/LgsuJrVEPt2ajmzqL
         7WqA==
X-Forwarded-Encrypted: i=1; AJvYcCWYRGqMtZTs9/rkyDKa77ThcQ/q1WGe4mSwdSHz+2d0yLQvwz/6zJCCGeps6Q0QBm4bqsLFXaLtTQmMtWosFj1mbw==@lists.infradead.org, AJvYcCXUEx7VUm502XPi3664+r5xhZ+t/rQcdWy+ziv+T/RC5t1dacXSAniKjD+gwlqeKXu4puukchdQf1F4oOxt@lists.infradead.org
X-Gm-Message-State: AOJu0YxdYyrhAJg4i9UgVI1H51/j+XENCUuZgDdq0fm0UPdMGh3Si1hT
	qlXmUaRiNiZXDjZavys7N22zwWcOSRRKnpSwkWpOuby8izPNEfOr0/QR
X-Gm-Gg: ASbGncu1NrVCZ4utZ5/e8IoH0cC9WWgQOEDjPY1c5lP8t49raDBLHtS9HJR5hQ3tV1Z
	W675fRbC1pseuDObMBpgjMua3yY06TWv9RMM2CNd4EZOTBPR41f3L02a82QLKS5rOl03Bze0Mxo
	0ui6bA+XKKLKdxom9G6G0YYEnAv4LkunSSVC3G0sClcOw49Ldqj+/Nq1JlYkfjxHQzqM4g5c1/L
	dnHpIGPS631ho/Xkl3zJhc4TSCQEHHXPW7khgEuijWM6LHNkY6IlVM6H/jNRjcMevAcHhZUg9W6
	ixlBm8lilQcE2UsUvmzicAJ8W9mboVqDqvq0pyAAAXRCjngBln/TTkOI7NcZiiUJVKNUJXXZkXg
	qg8K+lV3i1LkcnQHK3lPW
X-Google-Smtp-Source: AGHT+IEiohm+eHdVQaMGSyliuUO5OP29x4A4piOTh2C9lah+h3yWdGM9HdoexCNaigmM3tpKzwjQcQ==
X-Received: by 2002:a05:6a00:3e15:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7723e342f3bmr32270837b3a.18.1757073542600;
        Fri, 05 Sep 2025 04:59:02 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:01 -0700 (PDT)
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
Subject: [PATCH v3 02/11] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
Date: Fri,  5 Sep 2025 17:27:33 +0530
Message-ID: <20250905115836.7549-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045903_478982_B501F6F1 
X-CRM114-Status: GOOD (  10.73  )
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

As per S905X3 datasheet add missing cache information to the Amlogic
SM1 SoC. ARM Cortex-A55 CPU uses unified L3 cache instead of L2 cache.

- Each Cortex-A55 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 256KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 966ebb19cc55f..e5db8ce940620 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -55,6 +55,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -64,6 +70,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -73,6 +85,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -82,6 +100,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -90,6 +114,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x40000>; /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <256>;
 		};
 	};
 
-- 
2.50.1


