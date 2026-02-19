Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B76E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYzdCHN+ZDO6pwEpgPPlsnEbhBhJZMjBDcc1b5CMUoQ=; b=aXRhFMtgl2J+W55a0SonezuPcl
	ENKGCUZODllF/6u+iWRAhd9JZFxuvD6pXzSGOpK/v+bmHTIBfjG5AYq59CqzbbkrnDM88R/5sM03A
	wBnwJ/XKJf1tymobN0qfcPVSvZVQaiX61fwqdKsk8hdf930uAqL2Msypf0tGAtcsqqm+ab6xq6Tja
	lsFBoF7wJuLbHXWhHG4y1DdgczhEJjK2MMcBVvoYMQeo7Nui+46SjfjZlHZCy+Y660y//aOdM0KFj
	gP5WLz4Q1J3MhdU5xRAjsSeQZ1m0zB7kvFLTvDGBYKVa1gst+cf4NI9p06nC+O6NQsRl29AtbqhwE
	L4GG8FtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1O2-0000000BEZ9-3rnN;
	Thu, 19 Feb 2026 10:35:59 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1O0-0000000BEYV-1G0m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 10:35:57 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso519391b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 02:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771497355; x=1772102155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYzdCHN+ZDO6pwEpgPPlsnEbhBhJZMjBDcc1b5CMUoQ=;
        b=BRD6vbJFyl28tymsvzYRzwl7dpTN2F7wMP69aCCGgY/Oi6Q1Y5+9wZqv2QFsrPLlZb
         sLv63KgwngKEFdliXs1Vv8c9E5i/0o8DTfGKjB1SKLxJzwgJ81q8RBPfBUz8a6f8sg8E
         ceO0arC/+Sk4kG0dyEYo6J76gL0SkLrfM+sC/QpTdoIUZvMB4NCfUA7RU+QrUz9aXoTJ
         zr95x22k4gQqp0AHLOxUx/Hn8dIKxP68DK5czJKs9fJ5Qs+QfvCAgWvo/0bXRB9uCsR3
         KuG2WAbDQc+crjy83/4yjIfNXxYZ9s2psZXkwL9LhDZvVSdFAAayDPJMNMd81tZA5fvA
         lHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497355; x=1772102155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYzdCHN+ZDO6pwEpgPPlsnEbhBhJZMjBDcc1b5CMUoQ=;
        b=ne/xjNsLenD2Van09acIHiIFCFclQYFsKstEkcR6PAWpAW+AT5fqsw1v4tHvsgZXXo
         Cp7fo4xdim6LPZaagiriE9Aa8XIRRmQLAPMZaGL6nurNWW2IwTdVtAHeOetlRcpG8Cmv
         RdUIRfEQ7+aZuMGqJTB6Ua82I0xtllK1uULG18pdooRkRGwx7ugspPeJ/1/b7BQ3NAMw
         nA5zilzgtwyLG8CgGLk9Pnv6tGbH57uiVFmhJOmZBQVJvAzWyzmKiHHPAlWoG6uMy2ZK
         bNiW6Mcc2JO7tSAt7W/y18mcWWOtshxM5suuhJirmhKsKHuCDwUm4dx0KEbdi0dmE7Ib
         NhiA==
X-Forwarded-Encrypted: i=1; AJvYcCVCNHEDdC87764g0GPzVf6p9Nb7cTf0XzIsLJRs0BESKG6FQdEvjsZ0923ESS9B/RwqhGn6c4CQrNmhM/3XRFlT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2WK3lCEOsO21xLA+PLjN7ALoszko9BnAlPcPGN360VVjppZXv
	1LuMBemYEwQGRxLzHGck1HWT0ZdHuJj8QSiJ72a05OtNl+6hsHorJmhb
X-Gm-Gg: AZuq6aLIPrIS1/qINkCkE18eZ4NEyfaz5III/kB7O6ofWRcJqVPS4XAaiaRpqmoGHkD
	zCTrblyFfP81A+6wU6EKLrljqk8u1NHuV0t5YgiS6ONTpgeHite7oPubygmrSv6Nw5ybgo4E7Tz
	YiqZp7sC6IZYNlLJzYqii20jTs72euIJs3kqteyj6+d/UxTSJTW7pLwUfgSSEnilwWILPvIrSRT
	OUilDx0mva3g1im3ZPVPOs4SlgsPhJlsu7bjSbgtNv8Q0KpyfIcNfDZccx2rKuxCAwjE9pgty3l
	oko6Uu1iuIaFW4yuhKXWU0i+uTOoK69puBYiaYzXDBg3EMx2rdUDAJE6dzCur/Oea5++mSwV3Mi
	zJPl3KfIfyG1ZEZubL/UJIz+B5UeNanJKBVoB6lWmXhI8UaHFJHVhrIoko6Mu+/h6DGPXAZgpZE
	kJZkWX20CHMY1KZ/9TYlU=
X-Received: by 2002:a05:6a00:846:b0:7fc:da5:f85c with SMTP id d2e1a72fcca58-824c95a2037mr18253105b3a.38.1771497355027;
        Thu, 19 Feb 2026 02:35:55 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2c881sm19780678b3a.13.2026.02.19.02.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:35:54 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0
Date: Thu, 19 Feb 2026 16:05:46 +0530
Message-ID: <20260219103548.18392-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_023556_340515_6362D248 
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

Add missing L1 data and instruction cache parameters to the CPU node 0
for the Cortex-A53 caches on the Meson AXG SoC.

Fixes: 3b6ad2a43367 ("arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index cc72491eaf6f..f1f53fd98ae2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -72,6 +72,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
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

base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
-- 
2.50.1


