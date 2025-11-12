Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AAECCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=; b=wGD7beCR+hMI/5GEazxudDMbXG
	wMGH/+0OwE2gQab2ueUyrV5nr70cF/RsmlTztitP/t6R1Oj1ILdY8Q4ciWbBo8DGDwqxdeK/0sPF/
	9x42WgGtKjZv62xAPxLszsDXuipxn/v2ujEfKW6xtanxOr1oy0aRj37LCbIhs9zGlUvd/ZDouRG3n
	+/rOI0i6PERlcmsWH72+tDDyHcaRCQ7hH/yuWU9qKUdhfTJfVQYyFAMh4Ae2VABTy8M+eschBrJaM
	vBts8lzpXCDsEC3E6ncFOf0LzOE7dYa3+2dypxC6Byz0T2OGuzEHLF1oYGDonH0crjaHh+stXtVJh
	5VPH1bVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86F-00000008Z0r-1Nuf;
	Wed, 12 Nov 2025 10:29:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86A-00000008Yum-2dWd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b30bf0feaso75655f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943349; x=1763548149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=;
        b=v4IcRya13p9r90MdOV0pRFknfwWxg7GhlxJay9pLPI0rEsIZsLHgz6jhzfYecEoWSK
         BQkt1ZDTn0Uu6/1o4UBL35A4HDpfO9oLwmhvUTlUCxp88MtowGyLu5uF3kHtAmfqpw3e
         v+DneVGop7Pll6xOa7QPRnW2BVAD+H0krmWaImiIsWZpBdkN9dZnUqAbzkMFmY8Ak0q5
         lcPBUBNscUT0T+2rfsTt137fvDzpQu+0W5rOXlxU9qCsAePCQUMWm8r/h5D+bGBElAiY
         KOmTQnkSzicjA5XMv6c2N0/kUawU55ZE+540vOncN34NK34b7qtamaqwG0K5XGWggc0/
         mbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943349; x=1763548149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=;
        b=i/AnlG+OnVBTRGQK4q/IFkHqnADHfgBVPIdsudFWlR87DfkLyCvuM4/ZUE1uAx2dXr
         ElB5nIE1pioGLdOpCGOEaFVTUoiXH6BrI4HPaojeA3LzTTAPEpbKsHzS5WS+oU/oCWgu
         h4zhrnf6DNANFb67ifMYsFURG0d3VOk/Cfhh+Tw3BNTl2J6OkazXYyLoA3+hMTRJRgCa
         sR/fq+KOTSBfvSqpCLagMn5wDVlO7U6VuQVs6YItQCtChU7FbrBRg5H+0g+xwAPDnkXH
         sfb0QX4SiC8cGSci+Z+NvsNhyA59d2F+86OoWmeg/N1EuTVWSDo/D7nslRMqWYhRv2sc
         2goA==
X-Forwarded-Encrypted: i=1; AJvYcCWExN8kOqpCw3SYYceHhNhqM7QoOTl53WpHZEa334grTd8IG5IJTpBNzBYBumt/UqD0UQYx1/ieWgi0d3m3dNLp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2YMzKDQhJHDv7ESouZC11JypkBNRo0vbsyRvINsFain5FXI43
	mPJyqCK7oU50iKYOrBmi8uTM3u2IMR+phEFcPqe1w+vN9P8aP4F+3XQDgd0xNhVbGFg=
X-Gm-Gg: ASbGncscJZbkKch3GDliqk8BzBkuYYbQF5mWFLFkCFncsGb+gCX+ZYwuQ9IYcDnumbB
	dP57710ErSjG6ckCjjf3h5kSXsvFVfMn85IsxwN2ZzOUu/RxJfjkJIGwtpS4SVFbH+euNHTF0gS
	2bhqfBdLpx/qsb0fxzJCFJ5oBnnH/Iujg+63mmxLp2++v93BG6WiFFZv8e7xT+PrdkMRL31xDDl
	0RBOaiUKy/snb1NvI5krV/2yI94SEqDF344vmK3Ev+ZxXn8kLy/uCNwQhwm6JP+MF72RZ76luNU
	zz2UuTExEIQE+yerYBTCiGyOEdZEEypQXwpMWaiNp8ZT0DfbR5XZ/3+NJ6ILsthrTIGM6SeLRdQ
	ydvcImCJfioEOPRHTYtxCAU7NMsAJFhPvos//w/RVU7X4hyyw7F7AigJFrjBVCKG9EefQAA1t+I
	G5Na97FMcbGQT9KCKX
X-Google-Smtp-Source: AGHT+IEBjmd4u1QNttKmz7L0aw18Am5hrtzSeYwW7S0ncXT+W3NewsEFilmNZtDfK1rOFBgpa6PWwQ==
X-Received: by 2002:a05:6000:230e:b0:42b:3746:3b83 with SMTP id ffacd0b85a97d-42b4bdb73bbmr1049815f8f.8.1762943348777;
        Wed, 12 Nov 2025 02:29:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:47 +0100
Subject: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oH6NNnU6YnXoMLAuucc3pTLRVuvHWITrx+nY03hzLxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFlkwl8YTtZY7iax+Pe/MvWCZAulDzXGghXx
 4BV76H7fmiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZQAKCRDBN2bmhouD
 1xlWD/9VRaAIX3FFAH/ubXfeuDcoGvwYZtXIVY1BLh4qOi4HRkmmln3Jfimzlkz5D5X3+i6NtqQ
 0f1HovNsLqCXe4SoP+d84VxH3XJu+thultJiBSzY5REZBzuYUgw1LNScrMkHOmmQahZUam9U8m2
 tCyfi56sN7E2oJhj58rR3eoCg74pzQq8+1SM45wM2bRKF+JbQA+8ihs1lJ9Dzczj+LWRa5CDrRa
 wVUXEGrbnOAGvs3H2excUOVIcfy1UbP0Q0cvYYj0mlnE//XJc0pocM+tmvS6/NzKmLY1J4cBK14
 1goulVQRxW2dKVVJY9uBnXHXdvRnIPxq/r69ExWCTNuDFZPNWMTTuiQieXZUyWzKobS/U6OP02Q
 /sgBkG6T1lP3+yOyJv4SQXw01BgisEb7o7hi1mJuUSCyfiv0qmTRJU2Iw0WsFReZuPkGbGJzyc0
 BU6tmYiAOsQCNkVb6tap5NvJpjR1Dlptumq88tHldU8JnTQaFLT7aa+GSFDDT6qgVc9z0TONc5n
 CmJnG0Dv6DUot/Tn+V8AMRr74MafVQRL0blRhvffhK2OKLVbekFSoqqV7WcDld8CYYvJcHQjs+Q
 xl7FL0e5VPU/BwYuJhfWXZWQMHkPp3koK8X4Tet2TtzqdIge9u2pMqOsi+SuEoCkUJUMQL/aFoV
 nfJyjKI/mqIUeyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022910_701238_5B5BEB24 
X-CRM114-Status: GOOD (  13.97  )
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

Replace open-coded getting root OF node, matching against it and getting
the match data with two new helpers: of_machine_get_match_data() and
of_machine_device_match().

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index dc11b62399ad..a1d11ecd1ac8 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
 
 static int __init cpufreq_dt_platdev_init(void)
 {
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-	const void *data = NULL;
+	const void *data;
 
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(allowlist, np);
-	if (match) {
-		data = match->data;
+	data = of_machine_get_match_data(allowlist);
+	if (data)
 		goto create_pdev;
-	}
 
-	if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
+	if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
 		goto create_pdev;
 
 	return -ENODEV;

-- 
2.48.1


