Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA329E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=; b=QsDPhwNX2LVyY4e82z6bDUPW4p
	7swAzIwtT48AdHwcykV8aibRkTquOudr0OUGyKRWusE/4pVipecyEc57n/aT4Pmj/zn0IQyh8tXlc
	KRJZesHf4HomWVPjIqJ04C7bw006tIFjqU407NtmhQdltpLLcDMXjLv1Hh3b2JFiVRtGKCrxv8WzY
	0dQUHFkbeZ9Vp7Hb1KZUEaDK2JIsRsQSKJao44PQ662R5k4jKngjdfHuipbSLrToNzuT7XgvLbrDz
	62FNFnjtUamOOwGpHdYAUm2GOU6jmYkA7vzk10MTUO6R4pm4gm+Y0Kgi/Q0OcaL9ytUye/PGiHzg3
	/RwE4cXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3k-0000000DbzI-18jR;
	Mon, 22 Dec 2025 10:22:36 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3d-0000000DbvK-19oD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:22:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso37536535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398947; x=1767003747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=;
        b=prwo8HQ5J2t/PHU9VZ9NIFTtVaXge/MsqAByDvaK1XLpkqQyy5myJx6rYgnAgk54Uz
         1r31AMsLN9cIxeFrqZr6zeFaHqoXHCcC5e6lXHS33Zl0Q/JPv1q8ia5brJXNGZAYcwEG
         ON6peu6uSSe/KILBXWFc2o7bK/QKM5rmdZb3zFm124BRWa15t7g5/u1GA81fzRo8ZwOI
         Q9Uu7E+Qs+FWBxIybMVDwCd6rSPXS5A55usCBRYjib51tgBJdLzlKI0lSg0psZz1Ro9Z
         Vm9+EAV+YnIA2K7WGQeFkViCAQWxislWe+CKSS3sXOKVAvfgyyeUElJaqb4eiBAW6rFa
         u/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398947; x=1767003747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=;
        b=NObCxrC6DFgI0N5Jpd66V/2lZOzQqBjNtFvzl/3LRzqqyQHWQrcxkUD5nGkQm+DZZO
         nFTNrixJQxjKFuZ0Qsysyy/nAyqrM5pmHrsBuSn4bHynQkvBVswotjl6AIntLhD6tl37
         IE6kVEkoCjuAHKWbhY9blpGxeeoPpnk71xpBzUoemV82V4adRcgR1UdLy5kVMLVH7+p9
         zPxQ7zWMwkwwcH/C0wv+8dK139geBH3LIkcOsA9K0JfsIm0lhFtiYYMvd25jD9rpdGfO
         VKmh6QG5XyIA1O1R168xvNLEvgkyktkeD9wxYH0teOk2Mz2O/FZpC3QyPKoCMoz6+HhG
         e78g==
X-Forwarded-Encrypted: i=1; AJvYcCUzz1LHOW9Yif1e8qQq8Pm+cu/olDgxyN27Ropisc6lEQIelueshT7PpIQw7JlvKj+p2MKDbqm0ShChfVrkYCYS@lists.infradead.org
X-Gm-Message-State: AOJu0YzEWhxo+R0kuNyubvLxY33kONJ5AVCe+Y5eSPvAxg8rv2PxZ+Jd
	XD5sLQ433NbXSOGZOzCNE0Ms4jV2LW9njZGfqJUVIi++TyuobvAI5avg7VDFYuQtngE=
X-Gm-Gg: AY/fxX7rqQcWejZZOEH4Gli+22Ab8TAZKt3VRScl28GSMB20w9nvYwSMjgWDmfLfT+t
	dVL5kp44L3qSxr8y/1TJoZrUQv3NxvXrhR6rjBLUCkElJGGBAyeo1s9NsyNY+Ib9yXKzihyVZok
	YgIRZDzaMwut0TMLmT49r5N7U5Cd+PQEQ1jT8+cubA+00bfZ0RVteAMlU/9S36y53BTt3TfmTuw
	kUB7fiHtIQ871LMHVs0VL/NXRtJhUdzktYF61g1IWwqTzeVxGhQ2GrwocXoJ508g2t6L+Ynb9zl
	xwPEv6f/BgGIK6nWJBK/w4gDJokOcoIl0uOGf6aU5uFkip0MqXt/sXL7MH4tuYnvp1qFnuYUvvI
	K3txS6CKcErNS8DqtO0kgbfFB5u/UoYdPwz2/JcN+UedNcBy51T6vIPUqcD/miNs63IVW9liwm4
	pTEuvPBt/8S4h9zdxcAyvludUnVouhuEq8jOiRL54=
X-Google-Smtp-Source: AGHT+IGBxQCC0mhYfZCgatlSYEwZuZIabwAahMk3vvXTWTdnnwMS9fmadg7QIbWO/xNvrGz/StfC2g==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr105896795e9.1.1766398947266;
        Mon, 22 Dec 2025 02:22:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:22:13 +0000
Subject: [PATCH v7 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-automatic-clocks-v7-2-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=h92o4zwYNSX6815UCmoJUrl3OjU4KjoLxMi/xiWmdfY=;
 b=owEBbAKT/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRvdNO3GTfrxdRIea1vh38XYzq9WEqdQZckeb
 4xI+2khpGKJAjIEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb3QAKCRDO6LjWAjRy
 uo3oD/jFBjbVbdVJydY7tkVyN9ygLHX3QF9rpzd4UmrLTUYFD1RJwAoeMMQnlvrkfbTPIvp/GSz
 XYCj3/HVMkmuk2FkhYnHnlptQaeJoZ8TDu1jlM+s4JpfXTpw86u0+EmKxkyjNIJDTYToIcWMdy7
 u4Qu2ulI6UdWSXz/5eLU8WH4vBHRVbh9bpsS0bO7fOjyl4mrUBDf4V1WcEFDjHDpGZFjwh5DUgn
 yUMM2RoKkqMSGMKMfllmg0rvTrcGr78IPmLBWvCLHBTGiVANACDt8eL28rlTC3ni+s6tIr4Al0d
 JeckRSnvrDFtNuZi6XS8BWnvoT9vB25nhH4I0mwWpMCZrZgRZxWDAnBIDYdJ+5dh6S9KARYVBzl
 mbyC4IpNvktltXeh12U0ParJEUuyckbPWm5sLr9yN/Ira31hqc40QXfWqhoNYN+03AZ6Stq+bIn
 XUMPiedabopU2I4zh3Fb8rAbGqpLKORm6OZEseO4Za3iuyvgVoupINFc6tIOV+ITyytUZT9QaZK
 I0Tq8Tzo5IcgffLEw27BFETG6N8xZ/4n1XpOrUnVx03fOElYVm/iTb0GFWdqG5B3s2oPAcC1hei
 2r98BF0PCj59lIAnHQa0y+DM+Y3RQ/lbfVDGAzTUYv5WLfZyx5d47+xIt5+s1UNQBRqCXwYBrE+
 /+tVrlBnP3c4/
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022229_372251_122902B0 
X-CRM114-Status: GOOD (  11.46  )
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

With the exception of cmu_top, each CMU has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, provide the
samsung,sysreg property so the driver can enable dynamic root clock
gating of bus components and gate sram clock.

Note without the property specified the driver simply falls back to
previous behaviour of not configuring these registers so it is not an ABI
break.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Update commit message (Peter)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9b38c2248016aa65293c0abf9ccaf20857d89693..2e25eeb0c2590b99ef98c7bdac3caa0c34161706 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -671,6 +672,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1217,6 +1219,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1575,6 +1578,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1646,6 +1650,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1706,6 +1711,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.52.0.351.gbe84eed79e-goog


