Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4559C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=; b=dpYdMMpj1SYZMCBTmNhKsHVJmi
	dHSGVEiCmSXLFyqrHw8Mf0RuPGl9NUSsYooUIfHmhzWsoWpgnlUjvNiOIsoXKMZlfFLWdS4ZFvBwj
	nnQqNlxUJ+Qxt/FZ0CN/EQfomHUfDDrDp4gI0P6hUFJY7hY2f9pT85vWT2gMkui6KUBUn5Uo7QeWM
	cmT07rB2XFEO2Ek7uhv5kpf5LAuqGS/hGDpTuoACHgi1/Rk3ytSbaMcQhrpJm9Qh9Bkd+OyhmP/bP
	RviJ+I/b2Cqbi2cL7ope+MKZxLgq1Frzdn4AWdYC3VZCspJ4wYATl/w3rJjMvfzNfo9gyAUNwsSXP
	TnGKWU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PkX-00000000oDO-1uqD;
	Fri, 25 Apr 2025 20:34:17 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Phh-00000000nsh-09zv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 20:31:23 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5e39d1e0eso294108585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1745613080; x=1746217880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=;
        b=FwlwR5m/WwmgNyplais4t5w+swHqiHsI8sNn/vzZMskqx0OY5vKhKHgcRCKtQvDV9z
         YrFgOlwWQYT6Xlap6lnqPkUI15gqnE9I2YbqLne/8qovJM9jYls821mNWm7bW3Y1nMVO
         ZCgiGubdUM1g7PERG3neaYkafNDcKKo16n+Q0ZHW9NtAuVF9d/cH04jhuu5CuWTbG6fZ
         V6gKhUGF5Yo4IhAYTTaCxSDdmiwXHchgSAmBaTWJqO1b4gshJU8RinYvGw0ehySeCJhd
         nfk1euyEv3AWvOP5XB/j3j9bmiN3P5knByLMOxj6q0GFjSkhUks/VUQeQvOWN75hBn61
         kDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745613080; x=1746217880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=;
        b=pAG4itsDl7GtpoR9pVvlXz49BX2+Bca8avcRoX40EEPWudgDK+uDz6emKtY58dyi6D
         eXft5Sx72eKJMfVnGwCmIbqleVZj1M8tZEfpDaE1+zO5ie9Gj8Mw0DeDdq4IyVpvT2Pq
         Bppe7tY0LzGNInCm2HvbAltWNhTL47ojL20L7oQdFIQDhBhyXeyxwrAXTfmMcarvAxG6
         4GmpfIIdSo2lG7bAU1yCrouk6ihVkVr7/6H7XLUpy6TtEOcTwtQTY/lU66OLgumMtv4X
         PqpNDx7+HOIFc6I3OsSAWXtSruy0xU1luUlc3FOX1GAE15+eHdlG2mR53OoCN0Rs9PJ4
         Crow==
X-Forwarded-Encrypted: i=1; AJvYcCUW1wPPQpbweD10ZdbFpvyE2j2r4I+a5nR1nIC7M/qouFXCx3gUFz28haIS862/k7ppch70JaaIfZoB8mOE9FzJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxYRUUTsITfEgHg4koVWdSKCXM6uBeJDyHbrIV+hvBGzxq1swg4
	Zp5OKuAZD5nAPdVQFcjWMsGbtuFPw2mWpv59T+Tx4xLulw0JeealSrCpF7kb1A==
X-Gm-Gg: ASbGnctjN+p7xOAaZva/gv/DrGes5R3JyDy8zTC+urrG2V9sIV52Dq8FCB8ss0iUQP2
	A3BiisyYKnmxEw/0cuoZ/DRYxAYkejksLwjTCa4g2nb1MLgJlTE9A2Q55P82rlTsWrbKuARS2pL
	nq5DhGkROKVlkFf0Gbd7ZZgFgK7iKDGVA3wAleHu3zNIApSfROjo9mzIfob+o1AmxOKDo/jsLgY
	VMEtdjTaaWTkIxoUSlODi/FUgnCKdSgK+K0bpHTVaVJ9/BPeNkeTPTx+1o3ajGtzPn9lreBnpqz
	rMIun4ltm5tsbAVwD1lsNChps/LnMujBTmR6
X-Google-Smtp-Source: AGHT+IExy7byNjnzr61Qn1ql3vlbeCJFkmt8dfGkcDuwiloO0OM0ew357yO9XtgDpkXGc3h67FnjWA==
X-Received: by 2002:a05:620a:27d6:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7c9668634b0mr182306685a.1.1745613079619;
        Fri, 25 Apr 2025 13:31:19 -0700 (PDT)
Received: from localhost ([2607:fb91:bdd9:47ad:b39:2164:cbe2:1695])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ce4e97sm263041685a.65.2025.04.25.13.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 13:31:19 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Date: Fri, 25 Apr 2025 16:31:18 -0400
Message-Id: <20250425203118.1444481-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_133121_197590_D933C249 
X-CRM114-Status: GOOD (  11.20  )
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

GXL I2C pins need internal pull-up enabled to operate if there
is no external resistor. The pull-up is 60kohms per the datasheet.

We should set the bias when i2c pinmux is enabled.

Signed-off-by: Da Xue <da@libre.computer>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 2dc2fdaecf9f..aed8dbfbb64d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -214,7 +214,7 @@ mux {
 				groups = "i2c_sck_ao",
 				       "i2c_sda_ao";
 				function = "i2c_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -576,7 +576,7 @@ mux {
 				groups = "i2c_sck_a",
 				     "i2c_sda_a";
 				function = "i2c_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -585,7 +585,7 @@ mux {
 				groups = "i2c_sck_b",
 				      "i2c_sda_b";
 				function = "i2c_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -594,7 +594,7 @@ mux {
 				groups = "i2c_sck_c",
 				      "i2c_sda_c";
 				function = "i2c_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -603,7 +603,7 @@ mux {
 				groups = "i2c_sck_c_dv19",
 				      "i2c_sda_c_dv18";
 				function = "i2c_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.39.5


