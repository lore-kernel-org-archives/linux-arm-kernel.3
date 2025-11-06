Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244AFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4JMGsObTs14isSyw/2HDk5qr9bB4dzim7Xxg/79G90=; b=Zh+cJOWd2M5q4CWcGBCRJyCXAf
	l7pgbhRsFc0WBdAVhF6RclI7lWYwhCLMeuSRfEd72GISIK7b+T/Q86jwI7lTJFhR1rOVtoTUck+yC
	lfVzdgPLGi6q1NQazVM+p94uZG6/vhi0Gzv4yWeyHM8ZLwyqDnkA8jgU2CdTTp1D6VrCNRWiDqHd5
	sKLR1KsNHlk5VKZJrSn/ZVAGTDnwk0AfMLd3RcW/S1aUgFq/raJS8Zt0bEoDfFbY6tOCxfCbelRci
	Y8iL7Wx+fbXi0S7gE0wHbQlTxpV0+3rkpNapmTD9VCH0OXgVcvlSDytNKuUkuLC/sHmawbPBU2zBi
	kqP1THUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LK-0000000G84t-1rDE;
	Thu, 06 Nov 2025 19:08:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LG-0000000G7zA-42RX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b7273abc418so16703866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456097; x=1763060897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4JMGsObTs14isSyw/2HDk5qr9bB4dzim7Xxg/79G90=;
        b=U6NTGbNwtqAtVdAeeopvAgJtgcgKjbKENiv9xdWNpABDnxzYBHF5gPouASIpmSL6Fm
         /oU1kbj47OMhG7MgOUKM5o5yLcLFXJuTyTYHGYljbBPfcReIjmJflJUHH7u+I0b+h3Y/
         JCVUtPOIauTf/3TL19aEvs1Yka2vxJ8Z2aA+Jxx8XNp3Nw93fNHRZKy/rJy3ekEUdPx6
         EvDj9uElHA36L9Dpxob+njtsJEPJM/uqCKb9RY6DiVHjHhbwTq34cluubp1yQ9YyWMe1
         vMeMhV68xD9fbvBdXcGYXlr9k5Ab6mypUaeqXnvGjOyRR9jZDQ4b9ZHvGDGBYxWzOKaH
         HRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456097; x=1763060897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4JMGsObTs14isSyw/2HDk5qr9bB4dzim7Xxg/79G90=;
        b=YxFpUMUQgd7j3guS4XaBoFbqXt05864Px+slEH9xA4ppS7itNuIEV1Y8Jv6J6aUoTA
         ZFssWOqG+UlPoS12zUuUWowKCq54MNEhdyhEhOepj/5ATICWZq9gha64/BTDdOAVJR2c
         VVDZVKi3+12SpziQbeUejfRFo8MU+gMRyWN2wR4Gqug/TBWLXeXDcpGTop6UJ1MLja6N
         06BqHscN5k7506j57EbCz0p2SD9PZHHj3RGfRwQ6YoirloaTItw8miTf2wNKEy+M1hkm
         rB9PtTLSsdBErSrFoBvA5EshLHtuMeGHBYmNnqGsMs0vgElkz9R+40c/k34zzH2WKb+z
         /9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1KzYdAaAY1eTm0D2KRHhNgQSrueWmACcrBxipdcJlEtKDI6LOXq8wBDzTzoz5XvXb7Cm5ob6jTxXXLJH9DO4f@lists.infradead.org
X-Gm-Message-State: AOJu0Yzec10lq+NuOyYbnSxJ3bRsrVUdkdtS4bI4yEI45DqCgMRsT5ym
	WvDmBF4enBGKxWj1Gw38zMqxlhMOPOmMGshEprK/9qZsir3wZL5JXGx08fKZ3WXmKf4=
X-Gm-Gg: ASbGnctbwKoKa0jSnicpY2p8HABGKcwwqTpVSfXXf/VAqPm0+OqMnxMAov+pVLAuGJl
	JA5Z2oqylUyPg2GD1WWLCwqy6SM1i+zekt/LR4CEP0CnIWRGNG9/dj5iakAqgVJn3rVMHmpn2US
	ajJGzlN7HbMTQwz653hSXVySKJH/HYzEwzoplmWu7fQUhdFhtKRCGxDRxaL56gZVtTn9dhYGJ2H
	WHLZrh2szv1zANIvra1R//4MuKx0WozS+EuSel7dICWpYSJtkuHfDiqED9scdPq06VACli9HmOM
	Rb3Azlthpgh9MBo68IDUoWl2zUYpIWHK0f4YAZek9lc09fJWq3cABK8H2jvopHOs+eHEfKe5+zs
	K5wffpiZfZ4hoVR+7zMBMDEdfYY227RYpqj/r6YMJZTyoG34gPlUFb/2PBOzChBeRX7BsUgPNoo
	hC+sHuqIq/sRHCzMIt
X-Google-Smtp-Source: AGHT+IFk+bNY3frZKV9s/ojuNfqyzPuYp51TMnp260XUevSmM92K38NtOvI6xgFcbZ7/Qd6kA8xBlA==
X-Received: by 2002:a17:907:7b8f:b0:b5f:d4db:731 with SMTP id a640c23a62f3a-b72c04ee049mr25494066b.0.1762456097132;
        Thu, 06 Nov 2025 11:08:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:11 +0100
Subject: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJX4q1mmI2ou2O4fS/+roMRPBdhrTr0mfp9hVrUEt3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIMHFyxNlu4T2drLcnz2sjdbxNslTCnq8MD7
 ICJBBochkeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDAAKCRDBN2bmhouD
 12JLD/9wxXcPWvHWK1TxOFBiNFBChyh3nSefla4W1FxvqtSjyYx7Ic6ZAWJQq0liz3u1ImNOUdW
 RKYq8vLm8PFRV/zuG8GhaamOHTAWvffbvpspD6tSO1JtKEBAbU+Y0mfF2l0okz/5XURUV/Azqoh
 IOKkU4s8fPs+1SeHX3dmJNLMD6iW7SredyCcNbRemCu2s692b7Z4Jjx8HsCIkSqsBYFEHDf3jA9
 Vt7uKrTHEExDkXxgTy6tCEIyYLknTaHZt0p//RhYPbOWa0Mkt1SUPC4TxwzZ8D4Sq1VcNmncG4t
 o6ZjpoF2Ina0n0SZ1iXnJwtgr/L51tqs3iDrxvgy9MOj/OYA3efvHNhODve5eNJYdvOwEhw82pT
 wYLVt2p7e/E+JSrkn4fzwQchUWkcVUqKs+NVqHiMMmR24G5PrP1PoWDUKivHZaqmla1XplHxF+H
 YjavMrtr0DiOkMnh7lQYhVSzQgQuGKY6qRZnLxIMh2ygHZx/MxcQkDtNOS1Xd8yowtDli1z5P5R
 SoRdK0Yb0Rnj4Ey/uypxoBDFFBeGBYfaszQAimrcw5t7lgmV6RRU19VFs47jOLkmj/o9g2Uiuf5
 XN6FX0JUwwkVHnhIr3f5NuPFaWZrkoYtGJsGbAj46rhCogv/a3exsmBhboYP4WWG/zB8RU+0ppz
 cKXKSifLH8r8STw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110819_065015_1306C63D 
X-CRM114-Status: GOOD (  13.26  )
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

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 744312a44279..4fffc8e83692 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -332,13 +332,6 @@ static const struct of_device_id sun50i_cpufreq_match_list[] = {
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
 
-static const struct of_device_id *sun50i_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-
-	return of_match_node(sun50i_cpufreq_match_list, np);
-}
-
 /*
  * Since the driver depends on nvmem drivers, which may return EPROBE_DEFER,
  * all the real activity is done in the probe, which may be defered as well.
@@ -346,11 +339,9 @@ static const struct of_device_id *sun50i_cpufreq_match_node(void)
  */
 static int __init sun50i_cpufreq_init(void)
 {
-	const struct of_device_id *match;
 	int ret;
 
-	match = sun50i_cpufreq_match_node();
-	if (!match)
+	if (!of_machine_device_match(sun50i_cpufreq_match_list))
 		return -ENODEV;
 
 	ret = platform_driver_register(&sun50i_cpufreq_driver);

-- 
2.48.1


