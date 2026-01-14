Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AF2D38FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWPhJNVbobU6XSfH2Kesr7hZ+g/ZJF12G4xvyrhHF3c=; b=zz3qnLqsgHXWoum7Muji4XAkb3
	UZBhINCR5sFdkHXQPbHN8d0HCbGvvryT+n5kWazvUQun4sL2V8kz7bBOyBY6vl6E1FVfmIVtEUlmw
	l+jClcSRQFLzcSUCnXVp5jWttTQS/e1UyPRVUakQ4FKnKOtb+eltB2HhK9WQ7ud6hrDMLRv5VvIqS
	pRhijM95jsAGsEJvnLp1X0gOKNkGRjg5NlTkhiPuDm+Gt4MZL18KQMnCN/eOlQyHMPfKVkv65D62P
	6ovOHk26TNbUECozJgnyB6pf0zTjeVrSYPOcJvgRI7w9G2mkHRB0QOX8khRS9TTgcWaR9FgsG47NO
	PALZFVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N9-0000000A3US-0HFn;
	Wed, 14 Jan 2026 17:09:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N1-0000000A3Mx-3SnG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso446965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410562; x=1769015362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWPhJNVbobU6XSfH2Kesr7hZ+g/ZJF12G4xvyrhHF3c=;
        b=wDj0NBgEfsK63jWEdUov1YrKFRVQUuFWEVsRcH/RrqPX8l4pOGgGs6wVecwoy6pGYq
         NmR5KEEXd+WFCji3yvQ9tm8oR2oiaIkl6f2sf5iXzKssmP99JPumYcqt1JdWLjUnBrBZ
         Dg2qF8aOjnKvMvgZVrU+g6U45UwMcpRSo5VA/JQfx3IiFc1WfyLs8jIKBhLgWdrSbMMc
         hqzkw2Zlcx107dW1T4sBh3UH8xHPgWij93X8it6Wu4UOynSutK59VkqnetD0H9vFwrHB
         IQYqPY6IiqItY1yHfPHK1H8n/91fSH+nVOse9fbCjogK/gzz/gWtsbwgcHnwh9jqB0Iq
         gO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410562; x=1769015362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWPhJNVbobU6XSfH2Kesr7hZ+g/ZJF12G4xvyrhHF3c=;
        b=p6AuFg4yrP59P1e+I4mJGCjfwDuCuMsAEIWbiwKQUCvN75cm6UTDCqVzbcNZyM81fc
         nqLahXbsYdyPKxj5g1DnIdjpE4Af9AlIQ94hcFe+8OYJjrmXXGWKiAk9lvfdG6VnYds9
         thqrz36EQDAz+cvVhJj/RMauICwLnLB2H5SZOl6LrlqsBKQNqKyPAFJzo5WO7pOe14Ku
         lPB57bh5j+8qBvWnfAuwYHRh8c5ZuFHdU+1s7qTdAv+KCO2UVnKTAkADKjRJhDHDRvQk
         Ca1FxVTKweQoG3UX71EptIhj3Nb2/YJ090K2sgrfD8FJksYK6spj82HggY3kcVUTYYWP
         ZC+w==
X-Gm-Message-State: AOJu0YywLIVp6R+lV7/aqSc285vRs7T/cDdw/fJdi4M3UEzCe1NKTaJ6
	BMhOes4jUPtWKiEBR31Fv+1pivLQVivYkFsi8lGHdDRghLgnla6cN1iPNHdoa42CZ8w=
X-Gm-Gg: AY/fxX5QgkRE1/TOX4A5J+hF4UWRysh3K7FNXKNKaP1Vhuh4DOV0XA3EzPCpadqtUk0
	BANmzX9WfJ3nAEeq3/bDjzEGAu0+wFaJ3+Twi+FFOoN6j0G+OoO/NzMpSTVl0ITq1GnptAT93cs
	lHgiQmWAwOjq2XMTrXPkOO28b1EzVoFaVruvF9PQE0qL9RxQXDnFdPRIuj+BUCI7klP0NxbeNKj
	te6huZeZCZsV79e9ApMLSUA/ZuH7z7vtRZkrILJitVLXArRpmGbvbqQh6xgUXshCryYazhvaBe+
	UR7OsmuOnZdiLvGK/7FVTod+PNAhckMsugQiD7UzfMN21XDh8IUIv4RCQwG9b+pm6601yVy7m5a
	cteOwkZ15kRw9wD7m/TPP0HoPYs/rp7ELugiOplZdDSk4Kn9Y/M5nyDI9EZu8TXNb+K6EbxOHv7
	nzdRuyurSe0Q==
X-Received: by 2002:a05:600c:6612:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47ee484e6d3mr37626455e9.35.1768410561853;
        Wed, 14 Jan 2026 09:09:21 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee11c64b6sm24952125e9.7.2026.01.14.09.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:49 +0100
Subject: [PATCH 2/6] arm64: dts: amlogic: a1: align the mmc clock setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-2-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/OqmpzZXJV31wCuaWL4zZxA1iGG4vjBprzgfZD+QnSs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ823laBGoAyYB45m7xphCzW8RDiFqXRoJedCi
 vZezmsjY1aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNtwAKCRDm/A8cN/La
 ha6GEACW+UFslpIgSl2ZSJ0YTSFO3huyz+l+EbM/Mo66HPWaFC7/W6xzW5b/FkXTfmkhlHad7M2
 4mrukXJLVO29UzZLx7T5/Ugu5P6xHrNaV11EiH1d0j0NQ61PPg6/WhKaG7fTsviZHdraVoonfxs
 XWorhdNO/0mrctyN/4yegZEqCf2eyMjV7cU6duesOHSUE2k7nfCeN7vuwk2C9qYp3xL8y30Yezn
 YXU91zYrAC2+n4hSKE70fZsINRwzXTjI8+NYVa/uMiRilQuxNbDnlOfbwME0q+4qqXmZWvwZASB
 CnHpT2DI6NI3z2ZgNUBP0N9eFCi9a+RdDhfG2TqzMTfLERKDOOcIzAYzTKKLAVCoJUgxeOjtDIa
 4G0oar/1XlO8nB2iH/sTY5KEuLKRpsRLwAHqreSTJGZP91ed42skyoweRdNvNAZ6kIrx4rLX9Xx
 yUfgUoVlbToTCqgb/VHcHpbcUpPBO27hFMHo7XmVCZK7uaLde7GQzrakdFsYxqVO8o5yjexFX1d
 D6H4y69AYFRpcA7niabcJnQ4NseN4hEaTLbGniKR3jxzr2zCaYRHFhFzEYPXVTaw7hNq1bCAnCt
 jsxfQaeKbOf4bFUO2mz/CjJUaZwxmmjj5sHAfadg+jCxjCFn3+kqBtmfO6YnRzSiJrtZ8/UVIaJ
 Cf4muIfR/grqQ4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090923_889885_3285ED3F 
X-CRM114-Status: GOOD (  12.48  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

A1 is particular in the way that is already has the mmc clock set
to 24MHz by forcing the mux to select the board crystal. It works
too, it is just slightly less readable.

Align with what is being done with the other Amlogic platforms.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 27b68ed85c4c..348411411f3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -674,11 +674,12 @@ sd_emmc: mmc@10000 {
 				clock-names = "core",
 					      "clkin0",
 					      "clkin1";
-				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_SEL2>;
-				assigned-clock-parents = <&xtal>;
 				resets = <&reset RESET_SD_EMMC_A>;
 				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
 				status = "disabled";
+
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
+				assigned-clock-rates = <24000000>;
 			};
 		};
 

-- 
2.47.3


