Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A42DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=; b=Ngb9+pOhWL7fpkoKN/YQ21DC2/
	/Gv3PCDRMw6DCED8+eq3lsBuPc0vxhz79wn8580DeJN76QTUirR1plrajk+d7RHBdZTLaLYzuLnfL
	/pJasxREOo4DtTJ467ZZJnRwZEYuUEzDa+qetbFvJshc8+O5utbQyriQlcp0RLaLJ+vbs5DpV4wM6
	CtU0coFVUTw+Y4Ba+amGvAxkLpHsn4TVq+w38DjlWrW1cluXecv6gSOYtOPyhhYvJ0sz4omgpcJ8v
	7EZNPfTyMiuNdg5DRMcyE2p/k1VqwvI4dO9GDzjcUmMDUnmi7upbbQavkuclOzT2zzmJBy87QhDxK
	FAPJ7CXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LG-0000000G7zf-2hg7;
	Thu, 06 Nov 2025 19:08:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LC-0000000G7uO-1C0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7128683174so19875466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456092; x=1763060892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=;
        b=xz0d5cE3/WyNZObswFIITI9M4pDYyc1hBCR5IIEoW911kvPYuxKHAFZ10Hd36Wqyph
         7XkC8dZtidHpASiFFEa8SXHXGhoXkfEgfZpNroE3LxfpIYtbaqnZWS9X0E+ygw5Wm0un
         EWmHbAD3QfKBJm/KDxqC+tkzyGciQGLyUI9LqNy/xKE9lm36eq0aYlCcjgX6958XIA+P
         Xf3toaVfkhvIPhxez5+5SI4qt5hlwo8UDkCJIXhCNc/iXimZ9ISzfrCk3ZKVWPN8Nwqh
         KfehljauH0Q3biAl30Z9bZ7wBeFPzn+draBTSXvK6phgti9bni9i5cKHmgB32GhZjXz8
         wRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456092; x=1763060892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=;
        b=qjgic2gLBsCEBizDmzJef7z7MGddzqjRZEL3OIDJRt/vYReISlkxmHpJWPTd2li9LK
         Tw+qsufrgWVdlH/QJkfvKHY34ytOHIja2LFefN+IVh1dZhHUIhBexLFFgn7gizQXbuFC
         rM04/KDZoXUaqlAXpQKq8XH2vgxKkyrOTTYd+VVjqV8arW39P2uxmCDNEP+8leCKoy2E
         1Rdonfkkqxf7jQGeJnDcdDRsLieNWKRdCHwCjzbgM27hgwi1C5Z/CLPggWpEZQc99zDa
         jH4QyQHhAX6zFBa/HTgDDKuWXX8PmrgpRubK85Du1ENR4ljsZ9+aSB/dTx1RcGb+lXIm
         hdog==
X-Forwarded-Encrypted: i=1; AJvYcCVIWcWFykZL6rTcbcuqnEcTj/j7u44facF/Ix1Kl6yE0PvPTMJu8haKUSIBXM/owzlFgbNibC9Lw58Pt+lJ7mNe@lists.infradead.org
X-Gm-Message-State: AOJu0YzH2bf4bVzCmELyNSFxHYqHx3R6Vvpaz+Swv4XwF0FnJVgcw/xn
	5x4lQP4ChHr+BrXApkjYdHwRuxLIeeA1MbFAOfavaby+1kB1X+gXI6ONKiLVSGwQQ1k=
X-Gm-Gg: ASbGncsq7+u/FvIvpOwHbkwhlwyQMWE6p5kriBdbmm2xusEn4lDfruuoybS5Z5MrVgb
	sWYQiQ4VuNf1fcoeEspRwTYhg1v9Kt35oXNG/BuVkM3YfZGz37F4aFcAC0hmT2pTk+OaeGPV421
	wwDIN8O+0fF94O6KYAgurwD1etjXwaKitKEonnrqzCrgrBuYv50sOPQEHqOy+Bb//QHyNhz/Co7
	JudrSDzB93/EomJHFYI8S2V7U3A+Qu9QLuss7f7/dZyMi3/cwe3ufS5Som0YzSTPWfGE/Prs2V8
	37aDwYOjuNkxl5ZiZ7VgGqvrBUul6aRGmWjmkNwdCQhOLDrHdmXrFyrtmaSxu95LHyfugaoKPVr
	wKcnqv53Wh+gfbsrl/b2wvjRAZzhoEPDwg9eTpbOOrDOhXLXEcaL9E+Z3Uw5pXV0x0JXRgmwpa0
	EHixWER56jS1N/mhWQ
X-Google-Smtp-Source: AGHT+IHEirr3Jun5greVbFzCCT3Fh3wTZA5ZwGfVN2ya/txpM9j9JLnmbgtXU2cagXUpIzPh9ex10A==
X-Received: by 2002:a17:907:3fa5:b0:b70:b45d:d9c2 with SMTP id a640c23a62f3a-b72c0d9ea7emr14466166b.9.1762456092426;
        Thu, 06 Nov 2025 11:08:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:09 +0100
Subject: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JUijnBRGu0gt5BmJL1AM+Ht/YwmL8eWcsQcfAW02eOY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIKQkvxWPYTlG0/11v2qnF+WGB4lyWocQIsb
 E+BCX699yWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyCgAKCRDBN2bmhouD
 13ftD/0Sb2L3Qr4nwf5h7Cly6LwsxSlZoJjp/W9v0WGxNdDeNrrC98D1uHWpz8WejUoTpe8FhvD
 /TvAuRvEANS+J/AyAE1J0evzHcegvDXb3QfmrpU6rIDNmDvMJ1MFHJVoJI/oBoh3Uf7RTWJsuSE
 v6xr6ScHY74ZSWqNtd/LlAeGoPXSLptXE1kVtWdhrxCgJ2SLG8wix8wA+g+yJz2ieJq+n0DbkmA
 eyMuFIi/0hL+W2kOFEYsO6kaIbHZOKlCWwGKnIes+8VxOLq5MTJDwwjgBNutCffRlu5f2WDSkcY
 6aifYmVkyUO/xmUTHb6aVpoa+m8plHAADVnWf6x3xFsKrZY6kb4DJZXBRHm4nfsaLeRhO0bSNca
 6vyTRvy3Ccsafdfrt3/olOOgGzUUE0UvQUHeyDAUROoTBo1IgN+in6qEA/GVNMqirxajkfNyrru
 yk0S0U+rvDq/GJDbvDTKlTvsD3RmL9oAb8PJ7FqRQSfehpAQ2KBxRy9skz0z9keE48KRKWjgEoT
 6+/QF5WcZZgZmi80F7k/Pb0doeBjTMKJ8o0mqJXKJmZWN7aUfUL9DtGtG8+uE5ef/FjgLfzC41X
 dUDk/Ndr1cvlzd5G+twl5YJdjGEbL0Ub98gORPtqCbpk9Fvb+BTyoQGLhNcLC0NrbZ9lH56bFRX
 pFHmzOtqHLnAOdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110814_364922_AEE13A79 
X-CRM114-Status: GOOD (  14.05  )
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


