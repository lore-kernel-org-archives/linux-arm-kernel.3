Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B2CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6naE3xvBLUOEj7qpWoYnnhA5sncyoH35f6mKe7kp0E=; b=zZ3sjXl4iMG/RtsDULBPPA41tN
	ha6rNjx1oNZEji9AvnfU7YHbH71P8kSf6ai0UCuQGCguKCVtQai2q2sG29ydgSTAnooR5asHLG3ZY
	xJYmjiTbs3qZyDYzcib6kugjzI6lj0meTF2BnwEQg7O1E4rUwkOT64HYr5T0jJzq35AWdUauc5qXF
	kM8lqk43NbpMwRst3VqnxybvUxQGTYSe2bLMH5+Grl38vke4IKz42IRFjJ+bCXj17mNu3ZcHc2Q/a
	uq4pfHJy83MfMnQJ0JuAn38k0BKrOm5LSF6RYtT+iyxrakNoCk5ejqiQwEm3TNkloZCORGeWLJR4v
	6HZojMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LG-0000000G802-42ZA;
	Thu, 06 Nov 2025 19:08:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LE-0000000G7wQ-20Gt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7273abc418so16703066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456095; x=1763060895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6naE3xvBLUOEj7qpWoYnnhA5sncyoH35f6mKe7kp0E=;
        b=FgUEBND3McLBPVoNZx0cLW5vLXbbvJHMzm+NQouFh6m3AwjCZQVfdzT/xLVE/VLl0V
         ldXRMJhUOVqHoRyb5YpQSyElzLp83FpaeXGPerXFIfFkLr8iFZGVYDnssqQYPkobcuAB
         pzQ3gjbCUggOrDAP8Uewe1+3WZG66P9TzXWw9/5836Lb8BE1fLTgEyMpSldOhmd9RlL6
         QuR26B0yuC/HR4TNZBgt88vAYKf5HikjBMGorhNP8mYQ6wFJhYYUPqVrgtp+/2KAjIba
         RkCPvCnoCVm6jYXDLL3McVVJdYEe+o5aWEmlusSf9EWoM5LyW9mM0e0/cK4IORb360Ms
         VDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456095; x=1763060895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6naE3xvBLUOEj7qpWoYnnhA5sncyoH35f6mKe7kp0E=;
        b=cJLx+rZKL8wxzuE9Bwc2xdeSrqghK1dPW/44e9BHmOzsxIGprHISG1fSNF5rtYNFp2
         IrsyUcvk98aJRcVKP4VkQcfFktS5F2BVIXTJBJc8LkAwbgwTQwg+grw2rRvmNU1R6Yuq
         DXaLxSbpWu5SorhIDVkmuOVIb6rBxTlyppd3uxFYw+fBR0BaQu3oS06D6LFWFD8dWj/8
         3VTakzJrE7PaA66rn55I2jGw64DpBvdLfO9EyhrovURyQX/VSaAxrFN7Om0Va0gcvO+E
         nXfmlO11p4R3RgW4VqoV9zr5MiqGy8X6m7Cl+HwvGcKRekDZIIMB8YD6X0QM8iGjP5og
         45IA==
X-Forwarded-Encrypted: i=1; AJvYcCXSBwU9nrGKHkOY1NKq+Vb4uke+QNN1Cf/ranv2yT1H1HucLDr0cyyRfxJWQRVVzgzXZRd83rUcKMRZIaCY3Nh6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+2BJG+w9mSebVBfoLrV0ODU/LA9WlX1Sa/EaH3SPTbioSVHSk
	5mE4AdT1Vjzo3DqLR5qBna2gqm84u7OWAc5CwvDnRvIr+sqb2zEwvlQ35rFGM+O2fKM=
X-Gm-Gg: ASbGncuL0vCe6R8/AJLihAvXnJVBXp6Iz53cGNr8d37fizzkAbIcJU2Cm6NEoCnqMQT
	omgBswMFevR7jMck+zkqfqtmyVBrg1nHMwSlKrrzqh0ZsFtCFogQKbSMn+t2YCP3obg8Ue0TlPS
	wWTxaSLKDk1ULG/KJVdhaMTupYt453kNgATxh9L9dtP0wkyzhlvsARSWwNxyA+VpOwBmiglhM1v
	dRUrJhJB2fhY7KT5nGHxA2UwQZC2UzRZCFWD7o6/rP7Lb8kYWUCUdujIxu1ltp2K8OcKay+aAMn
	8bgfPkRtDfEpX/viGRfYp3EwU0SdGxF82wfEm++cqGEzRliB6Z3Qc5tNpPsuj5fNWCFNnoEgyeL
	qmzk725IpRwT9smV2SG3aZzJ3pInVLiLhug254YuorxcDY+Np5eSZZjJjXUj1kmEd7Z3tRdUBBH
	ag1ow5nRod/Yxky7uuzlvxHru9tb8=
X-Google-Smtp-Source: AGHT+IEr4RF4E5wCG++3YWlDKZbg9YIivFvXtw4OBS4Iyhln9zaKKk5C0r/mzjc23RBpruUfQanxFA==
X-Received: by 2002:a17:907:1c01:b0:b6a:382a:1516 with SMTP id a640c23a62f3a-b72c0d52bf6mr17966766b.5.1762456094708;
        Thu, 06 Nov 2025 11:08:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:10 +0100
Subject: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CTPERwGR0vMXN1C8guhiuGxeTUnLxrLtg8vK5MEHVnk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPILAuS+lVwfFACNKPjz22AAYwy2bMRt/Q93S
 DnUgdU65maJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyCwAKCRDBN2bmhouD
 1zn6EACV/mnoLciIGb4VTtmzF+e3USbZjuRip476+yuuWtnAhwJj3BwMkKgKezM4jwZiQ1WrGil
 16TT/t9A1kxXb/wtajTcOSOreBQH/r7cTofVbfolf4PEgMwNSA4fR9doVK97Yx18uPTlPdbIR4O
 XOkStiIMqsv4e7klUNKsXhdTjrheH9GCA0oWRbie2Daqxt+11029JL4W6yCgsxSIIyjL8tmnhDc
 devdZzJQJkckT6NdYe6NaCszbAstRhJa/mI3ReNfIxrKRjXZ6xOvbgqvUyjmhV7g6rPrMfrJevl
 biLpFS2mDn1cF0l+Fgz7tY2xFzEF6YzZ8reqiCXSLdysLlawci/V4J5drxnWmrH9TF1/OLXAOXv
 b8ePYzRjo7D7uf+eMEj7WB7edc8DFauttnNvvc2AV5hgAdUJNuQ+BDUgtWlc0kJzjjlhSa/BcKy
 3Jyud64JvwzEc0w5YSP87RP30/FppcGBhmjk1/dwn2LNnHSihOgsXxHgO5GHu0+3BUojGHPcCr5
 6cbRsV7B+esMM+vWK5zpDIgZQBe+MkZyehmRahg7X6c34KQabQVPQSpVS39nvYFTpDldTeumK6W
 PALkPNvM6TQ/kkaMJXNUaNPT9sQnP6tkCgCXvou2jIXiZ0CnulHJgiu40AHRP0m47yn2possioW
 ujbvgdZ1rNqGpAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110816_581852_4251977A 
X-CRM114-Status: GOOD (  12.93  )
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
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/mediatek-cpufreq.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 5d50a231f944..052ca7cd2f4f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -764,22 +764,14 @@ MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
 
 static int __init mtk_cpufreq_driver_init(void)
 {
-	struct device_node *np;
-	const struct of_device_id *match;
 	const struct mtk_cpufreq_platform_data *data;
 	int err;
 
-	np = of_find_node_by_path("/");
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(mtk_cpufreq_machines, np);
-	of_node_put(np);
-	if (!match) {
+	data = of_machine_get_match_data(mtk_cpufreq_machines);
+	if (!data) {
 		pr_debug("Machine is not compatible with mtk-cpufreq\n");
 		return -ENODEV;
 	}
-	data = match->data;
 
 	err = platform_driver_register(&mtk_cpufreq_platdrv);
 	if (err)

-- 
2.48.1


