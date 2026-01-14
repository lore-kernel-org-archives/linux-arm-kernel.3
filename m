Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97044D38FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVTJms2ugVSwB4TUdsv5u4am5qhw9xa03tN0c+1spsY=; b=4F/KMMPE4/7u8SEZBXv+0BByvx
	Hzx5dUakPpYF7R7LGED6g/jsr6E+9T3H5fefmbAKFRJGavPnu/kzYXFZmQa+jBPWwIXd/9gqJB7tB
	63S1vrhUiqlpNrH4kkyWm8NCU7r6k1OLFKekdwXFdDyIqVFKrjFJw+4+DjsowXiot4c4JnT3iaY3l
	bgS2wydYq0VwYSL/lrzsw4rC/JYlAdImGupk2YpJrvqnfNZDGl2BxerMMZtbzp3QDczilLwD3oSh5
	VFQ9NkxrPt9uzPij92JUmThPhiHEJrIJRVH0ix3MfWkxztwhYmH5xYs9AIgfFgvlYr1bESsaiJ272
	VKSyBP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4NM-0000000A3fs-0dgO;
	Wed, 14 Jan 2026 17:09:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N7-0000000A3Rx-3ABd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso7517295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410568; x=1769015368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVTJms2ugVSwB4TUdsv5u4am5qhw9xa03tN0c+1spsY=;
        b=TGd8yaYawP6oppiqhcaG3/npVJIfEZQOnoqvYd4Rd03u1XYqJN8i73DLLvvrNduXC7
         xyM8++hANWkQj9gTvzxULXZ7m0TS+y6X5v44ug7C96fT4dx9FFtred8gT3D4Bznbz0YH
         IN5SOFmV3/opzvHcmoEtgEQuoLqoWD55YBYjnTVzMgzYg1ZH1mAlj5pZPXpUhXWvQs2r
         tfwllSZi9B2zi4hBNO7O7/nSsB8SzGgaRHvEAKuGKiHkwDhFMIueZGnJxMb/xyvero3c
         fk3MXnqVl+Mzsw/1xYX0OebL+vggo+dr5vngI0xhWKrMEhp+JRZu5olXOWURMTXSXjNF
         JU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410568; x=1769015368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nVTJms2ugVSwB4TUdsv5u4am5qhw9xa03tN0c+1spsY=;
        b=krxDw6LkS1NXfRICyF53AZNrgwaCCksSU/yLvyvkgM9oZKECs/dID5ttRbvfGFXqpO
         mVR9LtB7Kv3qqbCqldkor7YzhJe5yZRsdKfDp+m4EZi5ACnXZ5SWnZyK9ebezFPp3QSF
         STa0NRP68cfuZtsGAwGdvH0Axux4k17cW71xIu0DFBHH8gxfDW88tEkCjbE8EqpQzAib
         0hGcqCeSRtgP5mPv2t1zMjnKBUP/srmacIDVJ1ol6CYj05ry+vDwaB7glt9WMx7EhIHh
         Z6fBSKNRYBZpHY/7CLjGGEwAu6NCcN0/7KkNpjvMaXClzOB6Vd1/zG/YwNME/eA/+0vM
         1OwQ==
X-Gm-Message-State: AOJu0YwmaJUOJ8N3YYqvHdx82Qc5owg+1n2fl+3SL1z5pUl7Bp64m/v6
	QhKj/K0OhT2d85t4yhAxqsCgkDYhX21JVqIX2DLKHm2sT31wukZ3FGFmC+bL7QKDmJc=
X-Gm-Gg: AY/fxX4uZ0RnLxSryJnmaZ2u++vp73Pk9uCeLKgZM11rxeoXl/mheK6djmqhTnEnh4y
	VgQtTWuwxAtN36LZWUNRjpvIF9YTWtfReT2d7R0difv+ZaBzMn7uC5xhkYIWiu2ncz8r3m8ylda
	5zgVPphqQMlJrkpC/EBcpIokyZthp6qYSmB02SamEEZW8gLbvctNMJoZ80kfEorTw+dgrkH9Gnb
	+oKWq3Y6fGe9s64/P99/qLFp2/aUu9dApNfe9Q2ponHWashd/Dmq/NLo8gJ2S4rWLql1KOvJJC3
	3QytqnMyvVkkUILcszymRDG87517/0ihC27Ec/Rs3VATyuMS+qbfq8tXfb8vuV0aMyuKyKfeCYT
	Kg/+Uk5mTAf5wVAZpAqtg+Rage/EGV3K6emqA5y1FPRkh/Akd7du2NiQubLkdxu79rHAzElYyWs
	FIktekTDVm5Q==
X-Received: by 2002:a05:6000:18c9:b0:430:fdc8:8bd6 with SMTP id ffacd0b85a97d-434d75be281mr140960f8f.31.1768410567832;
        Wed, 14 Jan 2026 09:09:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-434af64a778sm434244f8f.3.2026.01.14.09.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:52 +0100
Subject: [PATCH 5/6] arm64: dts: amlogic: g12: assign the MMC B and C
 signal clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-5-a999fafbe0aa@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6VYRsSlr+k3OtpRissBvC6EiliXJvLY5cMYIo4c8bpg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ826pKxtzMYX2hRhOSi+COd2s6Q7mxDZi9skR
 j0dbAR/fPGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNugAKCRDm/A8cN/La
 he+tD/0aw/vBvgqUMtpCqI5tRIgqz2YnwmpvwR8eyb3iwcXXyT/A7VwGUoVwwXXA9ekryGEAIjA
 3syJdJPHjO2J4xbtU4ipSLSncT5RZWsbYZHKg3Q8vWyYBNF7Te9kYJHGWOo5W6p1lX0zTMY4Atd
 T8oLI0O8pvKnoT7JS0Sav7JLTTMVKyqnf5PaEJUjc1upbaCDENsGoZaHcjEAuzx33DQfzg2/TeS
 ZYYbF66Ine4lwb1k4Du8xWE1eNRIH7cU9EeCBoRPj25/Bj0/hH5UUD1/nC6b0grAnDauEexnTSe
 RXIT1dSuAjAOa2D24qxpsoR6N+sXv9Une7lckZ33wkMD6dpsNchoGbyaYRr5qlVdLF+AawbO9lh
 i76T9uSWg/+XGI0rYTGVEo4zm1v6kqh5FDqTbsDmaeKaTri95GMOXA0lMm0neLs9Il6EuPGDO6v
 kbLST4S/OG/T1aj1YZ680WRWAliAwrTC7tPmb212VKOQwMn4rbINb5CeDsJKvPrZVKJTcI7B8EO
 W/RayeOd1hBCZ/8Z3zC3cAu9jDhbV0gZow76+T2/ThXxAbpkEAMlZK07py7bT38SKUePb5ADKVU
 ONznBg5SIKrwyoxr0Hk+5MjYtDAi+umj9t1TZn7D99KraBVlAXpJvQBTYgpFdxV6xIM1Uhc8hfK
 kQZ2w2qmG7lSGjA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090929_866836_59BECF0B 
X-CRM114-Status: UNSURE (   9.43  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

Fixes: 4759fd87b928 ("arm64: dts: meson: g12a: add mmc nodes")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ca455f634834..0085612cf735 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2443,6 +2443,9 @@ sd_emmc_b: mmc@ffe05000 {
 				 <&clkc CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
+
+			assigned-clocks = <&clkc CLKID_SD_EMMC_B_CLK0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd_emmc_c: mmc@ffe07000 {
@@ -2455,6 +2458,9 @@ sd_emmc_c: mmc@ffe07000 {
 				 <&clkc CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_C>;
+
+			assigned-clocks = <&clkc CLKID_SD_EMMC_C_CLK0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		usb: usb@ffe09000 {

-- 
2.47.3


