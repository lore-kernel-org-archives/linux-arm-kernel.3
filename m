Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69856CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=; b=bHUUzsMeghF+FfirQVLXEaTYDl
	B0Pe54ARK3sdZLlLqXKiRS7Jh3/KhmjLaOGSj56k5BDZGeu6hlS9ZGjRY6Urk5m8LATl0rTyuzf0y
	Lle3DtgvkJYJk0yVUsRRz6gls+qIxrN6jiz78wBHraPxyjHV2UMpEODNarn9wo6CQuauRk0Cs8+Hb
	9meAKajJxZTmNDr3PBiMNTKztdlcqql7I5N9sA/JzvELevwEUBK8mJ3KVAh7iZicrI1ywxPlNY36e
	2Ln4Oybk3GAt+8OdDgs8Bb3jAGmpsFRbGZqovoygw+LtW23rjEg1n77ltEAnKqxKeGgDx1R+N7OAd
	N4McLyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86K-00000008Z8C-26lY;
	Wed, 12 Nov 2025 10:29:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86E-00000008Yyf-2DUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775c4197e1so173975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943353; x=1763548153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=;
        b=NsLXBjzQywn7SUG5ke/GktyC5NwximRV9720ZII/PzgBt1gzr+a3oagKT93J8WV0Rz
         qildrcJcvazmm92MkTC3xbEgJPI52/4aaTc5oLimnWnnD9nESIKoKQY5VAUyuOax7q4j
         zTS6z8HQAZhdS8+PL696OMWmJePGcdAlQb7CMKeaqzNRYzcKyHAZ8PJiU/lB8tEhX5XB
         k7BweQTE71j5kBl/+W0nSeph2C/RwdYT6OslozUP18sfUQzieUHhqTWV3e4s0vfIKgJf
         7j0OLuaibkZepLdgHCxRG6oJ/DnMUR0s2bCleJxRXfNn7D+yETmMj8ZCqEG2+ESO8PHX
         ktmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943353; x=1763548153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=;
        b=Psfq8WPb6RyNOw15nCxjsm9HV7Ln5Ic/9PKj07aOQlOUhlGzqomloHOGv2TxROQ/1k
         YDcbK1SjcbjsDB1s/9xtYb6rYU1kZzF3VUF4vwfws8ZA9f4RAvvo7YIUX1r6pBWp7CY8
         DEFHkkS97mWiD3BiR8PcPqb6Q+TmzHpYONrIGS55ctQ4HHaeY0Xe+L5O45axJxuMCBdH
         91/y8NyVcanHFi4cxmc/UQQyBL9ZfHuJourqoN44xIgVpETgUF/UAGI2RDN2MLv6zIC7
         FRc0W70IwFpeAFDNuT99OpfNTRK/EBUVvedFQIicCLJoi3zGMQ3SneVCNPAbMUKP263d
         COAg==
X-Forwarded-Encrypted: i=1; AJvYcCXzFdv26QiY3U1jTy4krpIbIF+jzi0DdTp9pxLnt0XhMSJc+A1n8GtvNQNfGwYNjucGg6YpWG+IkAl2Sp2NTmPk@lists.infradead.org
X-Gm-Message-State: AOJu0YwjJxPgKEuSNicAE0HfngKAnS7mk10YCLeQ7GeSGgemVR/tE2Zy
	YnkmfKMGRh3jPBxcOngkvJUj0jKEnSdrjvd1yiQ4yOYpFBy35noNkCMQ3wYN6z0XLuI=
X-Gm-Gg: ASbGncsBHb8XGC2TIFw8usIWprWkw3pYi+SMeF+VZ3KeYigKGDuixr6HhZN9KGlXdIc
	lKVTIFW8IlMpBH+2Meizin/3PtJZ/1NYTFwNKqiYVrSc1PI3M0FdIrCNrzkIoPIwbe88Coo/tE0
	rpUEY2kThB5xtF4XmFYYPv7Y7QfkTlGwKEwc+525jLLT+66hbNNynBaUxz2p5fstmcVYtCmZ/ig
	q/ALhNbZv4S9AEpDv4xF7RPiVY0bKarqER9E0lL/LWE+Hy0bsCsTMQRtN/lko0+aAMx8PCdw+Pm
	DbHRF71zh4kR5YO4ckpIwAlWNIO7wHYUtNgOawnUnDk6enZWFr14xmpGvsyN5DZ2+dBDnL8ARjl
	yJdy2OZptpr5AuioucXaW0rhOmRvAnNcqVkbj5Z5rw2S/2OnLj9/3J6wBQCk/Zf98HvOYjbh7dW
	v2tRie42mTWd+DODiQ
X-Google-Smtp-Source: AGHT+IEZxhWPWikCbrAnGfoelUubQn+zumXi8NTKXDPb/rrgk5SQKq+1ZC5MQQVGOw/Dnv2a3nat5w==
X-Received: by 2002:a05:600c:4fd2:b0:477:7ae0:cd93 with SMTP id 5b1f17b1804b1-477870b44b1mr12471145e9.5.1762943352640;
        Wed, 12 Nov 2025 02:29:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:49 +0100
Subject: [PATCH v2 04/11] cpufreq: sun50i: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-4-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NtaVRn5fOdSnDL05sWEjwQYKJh+onKYC0wteYH9Ybhg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFn6/m9j+vXfhwgQcvMShnjjZfSHkT4opZZX
 DHqGi3TBpSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 1/86D/9xLSU8geMKbGZqQqq+gpYJEvoD+GGEeh6cjW5htbTvlWOfvwgeOsv7EMHmjZb4EAEHORs
 AFvbHIO29KrO50mOR6LWzHeEtoMbjKRxpPpeFHL0WAJ0zeaGgYFQkVDLFTHb+tcJKZNzaQcfTOr
 A/gX0qt9wWyZUy483xKQSHzNencn4A5qm2KeTLjezWyjKRMqOxNcCqFmbGX38K43Am3QmMZ3AL7
 YVFre1EJbT91zoN7MCGE2vUscm7rpE/mljuHR5i/gJ7Uj7Q23emhpxMeTD7QmdYvYP7F83LsCQ3
 unLQR73BO8Pgm/+aNS4AhAvH7IWEn7REYkZFdGDYLzeC/G/Vg42R0QVo8NUdZTWL7mXelmpdG9Z
 DjmAXvVA1Ymxjfo8gNJ6YeKeB2voZyM98mtlwcgr354wN8V9DFoAwZeRx3p6bzqQhucTooTlrrD
 vuLisnyvxIeghESp180iNmZsCzRaiVM1DxQhnA40Tqs88QUKVirgWolnf+3SF0XEwMmOieEsmRk
 XbUoyC0vCzl6+Niz43jJgm1/yNSkFfgG1QJySFurCg0aI7Xrc8Jmbn46/FHPTNSkiwFP7sqbyX1
 uqHFTQ1d+BsJkhEW5yJDhqAYf8W0lvrmTtejmDepIdVQovzVNtHxSFWyrfn2LltV3ysYc0VIw33
 YpwPc5aDBmI/CNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022914_601055_533FC022 
X-CRM114-Status: GOOD (  13.46  )
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

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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


