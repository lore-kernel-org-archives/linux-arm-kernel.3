Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C43E74ACF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZKcUXU+2AOUg6QNTCMofP8uzOqzKgrO59wIKpeJpBe8=; b=XHF7i/Kz1/Nj4XJ0DhCYIMdvjI
	y7AO83FwdumCLZNzI9EVH1PU4pcxIUdvL4Q4lQ9s8GJV2MLrAK7jsLpLy+Y/f+uKps5Lr0T0QiOCA
	KZeaTvPGmQlpkrBYr5jNoJyUgq0hVx5A0IU1MjG9XR+a67iJ+wS+mbzk/OyUAGuI47FVPeL7uJKJ/
	9gsHWfmKQFTr3leo7o7q2suma37Q0n9oRp9Ug+lqPGF0k+Qt1qXhFGWlCXLyMi7AoNPfViu5xr26x
	TOQDaQCqz9FDvdtocsAIAxcdbAsCbzfhs8OTSNd/T94/RDWCTwoN36FE4E5xsGx6MkNcqVlZHDheD
	j4Xa/nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZgZ-0000000AfEU-2ryE;
	Tue, 03 Dec 2024 20:39:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZfW-0000000Af4E-12Lx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 20:38:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so55661205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 12:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733258328; x=1733863128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKcUXU+2AOUg6QNTCMofP8uzOqzKgrO59wIKpeJpBe8=;
        b=grIGg+LWkAnMDkHUghAWWgYXxYaTzdXEbl8qehLewfD1vq4hiNAggd/NryPev6BKwq
         rPtUE603jpMneaFe9e2hounzf7ojFQZ0NSh2a9fSwe2/0avZ484RsL5bgbO8X+USAQCh
         oXdnEdCaTIIwG+Y0Gf3jocDpSzt+zOG86aBC+tVAUZ9Xyps6YJR9PrBKgTFWseaS5dMG
         kRKRpLAAMX2dMp5pjS3t9uPMR00S7V/A+e3f/WOLrh6K8Oe+5bzfpT/TbJ6zc2cu4vkW
         p/1ZIC/w4f0AWwp1oyK+YT6k9Yix97M1ujvdyLRlDVBOAyN2L4Wng9QSHk9vcDxcNbu0
         TCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258328; x=1733863128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKcUXU+2AOUg6QNTCMofP8uzOqzKgrO59wIKpeJpBe8=;
        b=WEaEEgaH7QBz0lc5RFy0IMWBp/jwCapASZP/VhycHYQ1JJC+CE7QDIioEwiAHTQBwR
         SnYgGP+8b0K6lekYBTP4G48ogq/91PQ6Acx57J+kz+HFrDwwxYjQVhQP5MUmVl/Ioifp
         /l+VToS6ERVz20iARKLFKix6YufEXQJQmamHyzAATjcbJ+TF6yei2zyj1nVwFaIgUtnK
         1LUAgZStPYzHUiOy2qWicsQH9BZyD/pN7+9RSaBbLBu40VbqmpRaLhbMl0SoEnIiPFTg
         Gp28UKnZxYlcnY3vZEnD67aCfJGL1FVJlUEN3v3hKu9qwoJhd7bR3cqpFsWe6WaVEMIb
         EEFA==
X-Forwarded-Encrypted: i=1; AJvYcCWuboQFkyHTWglMFe24jBkdyMaL4S2fBTNjIRTEJ8NVtWRx8vJPiBn46i/xYzxNPeQfSWtn17ZAi5T3vc8/4nTd@lists.infradead.org
X-Gm-Message-State: AOJu0YzM0BhYvkrzzJ3In9Y/D7zYIfokmUnccpBEcjVCLQZYJDfs6xOh
	ONOPdVF7n2Dznfc8m+AFHaKySnsXYFIkZp1/gGjDodHqu3xEndFv
X-Gm-Gg: ASbGncuX7T+KexQA8SFUS6t48YCe7ZBKvcGlXgHOPGtNhFYd+oLaPjbZKNeArR3TYVl
	KzlCd3sfvAf5u+Yrge/IzqwS8dSSLXEsUaqVo08JbtqHiZhkuTNpNanCBEkYoluyFsy6qfOs2PZ
	q8neyoiMSHimyHMRkZyvMegV9e+prTee4Q4vewdtszjH7rDEckk627ac5kBdlLqx12kviDX5aVu
	RJGkZ6SujXy8JFvCg/h9o1LysVZ5h+Q8Y9xh/RzI1EIG513iUkDJhbmWVYtc1rr8eqH5P8uDXAJ
	UEtyQBT8PQ5nNqCEsLuR5rMr9Gjo7VtsSnrmAFA=
X-Google-Smtp-Source: AGHT+IH9uBgSdnHGS6bnhvmeoiLM3AKdhhwAPsU89GFG9+bxT2CRResLtnMTRB1w5ZTJPgDgULimXA==
X-Received: by 2002:a05:600c:19cc:b0:434:9f0d:3823 with SMTP id 5b1f17b1804b1-434d09b65cdmr36523055e9.9.1733258328079;
        Tue, 03 Dec 2024 12:38:48 -0800 (PST)
Received: from localhost.localdomain (229.140-242-81.adsl-dyn.isp.belgacom.be. [81.242.140.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763c50sm231266915e9.12.2024.12.03.12.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 12:38:47 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
Date: Tue,  3 Dec 2024 21:38:23 +0100
Message-ID: <20241203203824.23306-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_123850_284261_E496045B 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

AXP datasheet says that ramp delay is 15.625 us/step,
which is 10mV in our case.

add missing regulator-ramp-delay to dcdc regulators accordingly

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 80ccab7b5..b6e76a804 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
 				regulator-always-on;
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1160000>;
+				regulator-ramp-delay = <640>;
 				regulator-name = "vdd-cpu";
 			};
 
@@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
 				regulator-always-on;
 				regulator-min-microvolt = <940000>;
 				regulator-max-microvolt = <940000>;
+				regulator-ramp-delay = <640>;
 				regulator-name = "vdd-gpu-sys";
 			};
 
@@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
 				regulator-always-on;
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
+				regulator-ramp-delay = <640>;
 				regulator-name = "vdd-dram";
 			};
 
-- 
2.47.1


