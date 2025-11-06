Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C874FCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=; b=Ts26qTyH43oeZlCVKBzpRvPfvq
	LWzUbT+2mGwzqcSktMctizt6ghzmEhgUtBLysPMoFqRq7ZJOR7Pcn8E64XB+hkB49vKcLMTOeQ8oX
	hpv7eA0jO62Gsr1pK7WDAPJkgwhvB2wWY3RbjYhIYtk33T5C1ewbB6BmS3SgUeQeUe0EPkaYKlpIs
	zFt/lCEUDRDoT8HD7+j3oCdXk6zFHeUivaQBESA0HQxDdtHRbzUGUrdKX99QyE4cXpMxLW5Q2Xcrr
	n8Lu0h8hv+qs6sWTtI3CpwPy3He0+8Xc//g++SLs9aMpVmUakOvfxmQE9+2pLsLlMAkNs0RJIKtL7
	CVKqzvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LM-0000000G87M-0XAW;
	Thu, 06 Nov 2025 19:08:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LJ-0000000G82B-0Vr1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:22 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b725c6be585so19957066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456099; x=1763060899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=;
        b=fjY9wUg32yRGJO7kFT/fNvyzFmzBPNvYDCNVwDc+QRF2+6v0NPNLmPPxH7DjEmcfxK
         UXOU6M3HIri1iOE4FlY8JBmg/G+iDVQXaU1bnkbwiCRch/PlC9oR1n91rLvM7e2ZDcb8
         qoJ4zBb7/2vXIa+YYXvMF7xxiIr5nBSoTggyJJ9Qr5yk92C/UbW8khlRLNG/hKlqgtuj
         rQBSmn9AO+7dmnSodopAwEwzeqiTHXRJ+zVgOlVu5tlyofQ2sUAQDa6J82nGaCb61O4N
         indRxtwPsMum4k+TpiogyDer8FlUHRhKFjh962CmMBmskPE8XTpSZ/jSLTpa4p7AdQEZ
         62dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456099; x=1763060899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=;
        b=iYDWBoYGauiWnNawusrbNsg1KJ+bF/GLjVAur104ClsxbYA+e4Q6uE+bnqwXwBSuQZ
         +V14qALcJocrzcqDMpCsBaCEj72lgVKyEVrJ2fIyBTD0i9DPxQZ43fPDz/KhGzCsnnqQ
         tVwT2T3aG5ZAfLfP+Jz8aCqlJi24PKEyxQFkzFLAzbffqUpuxyCxvCFgKgTsldxsMDg1
         OXHYHU/p4ZGLz1tc5wksr5c/lwdpGQq9aTyLHDWTIgO5PM2UQjEHi85j7lbfdvC1wBj/
         nT0m/aG0k2xIvfg4h2r/Dfs9eDMusZbVIun5kQnA+rhDDYV43hzSXkZmruASmHJPz8yt
         bq1g==
X-Forwarded-Encrypted: i=1; AJvYcCXyThlDrrzc8798wfHaDEtg3I3YsDkzKWBHcRp1EtW7vPfFmbpPvG/roIn3H8mst73eCfj9c9crlICn3eSKPvpM@lists.infradead.org
X-Gm-Message-State: AOJu0YwoV6+02BMCw6O/CjAB5e8F4syK5c1y+OZ7MoPFeV47XOX/NW0r
	4qNfEsJerHMbSyE3eHpPsamCDepuikh6svhbYxf1aKvCA1p+BzVUUYJ92daDYCQQ7n8=
X-Gm-Gg: ASbGncvQTWjpTdGpmdXxoLrSL00i4bx4eU4PwzkDkY/tvg2QADWQt694XNQk+yWZ1FV
	D9zQsDA8bnR3OArcaSTRIT89pshRiW4nFJPc1otxn9fihLq18z7MmnlHJ4/ol6h/5V5c9GUmOl+
	ntJ8o6ae3iFow6t74VU3arM+yHztG7+coCNDgQUMS+bl7yYKrsagdMBaJLCv2Wb4djTPeoHQB23
	NTjx7mtffYGri00aAhFIn3Pl7a7qPnf7UqYFa4ykKu/vGdgbMWUdqt7iJCr+WL8VIJAaC4Dnxb9
	okN7ldSr6fw2esYsOtbUKvgC3OMsCeN+0aSbyJfgbdRVB3nWIDEjPEFb1dF3dXsCl57vr0JtLTp
	VPC1IFKr9Ug7GnLYHhVf6eIA8elHPINqa0O+M/aj/g/ngdrE3ZFKqc7qIC5AyCPIBsmWdC6Hzxp
	aYcBuGl55gawUsEny8xKc3+WqnM2Y=
X-Google-Smtp-Source: AGHT+IHpy6g/ExB/tXdG9aK+X/w5cAOjpzKRGt7oFbCPlJ5xOgLfDQqFln7LmAaTDVmt8oPYZbetjw==
X-Received: by 2002:a17:906:c142:b0:b71:a627:3da5 with SMTP id a640c23a62f3a-b72c052b1acmr20747066b.0.1762456099430;
        Thu, 06 Nov 2025 11:08:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:12 +0100
Subject: [PATCH 05/13] cpufreq: ti: Simplify with of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TMccTrAY6jfews27rwbvbYNjT+D0HJWoublqLUUZsRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPINB2hcjM8CllrcU/oYMlxMVbOrIG9ZbKt4r
 J6A6ykHWZOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDQAKCRDBN2bmhouD
 18HqD/42Qwhh3/IZCwym1Z2urYA7CwYVB0JU2PVOoJidbH45aheJiAWatbUnTpQFaKg3s6UY/mG
 6YgQWLLLUEM44nIcAqUj1X7y/lJyx5tsfzotB0ZHdFOalzT89gwIBXCVg2sIEwjTV9snZYAfPDT
 1Pd3QZhFbWmTMmmyMFkX5dQGM4lnd0eRqml1TuEdr3MuhBaHqf5McFPM+YDg15hSXu8+hs4OkiT
 KEwlJCETrfYYWbNcQCHObHuiSUKqDazpYiNiiC5ETOrgjctCN0/aknRcm9lYgJIx0xflcJFT7RI
 mcodL8/DSE2FEc2chRC2iYMWb6ulfHrvkPPHZiIMaqLA589bwocGzqGvKin3kil8du8Z7goWk9a
 E4D9PHxlumE2TIwLlciKDQKo5ivphUdDLk6G4r8DdlPf49USQ7QowjNwn9pKh0zCM6c8fm7wmdT
 y/hISSHuivvUxDO7fSRLcA9sWKGCbviaEYXkqiUadw/4cgbM4jOmomFLhQ5NI+ED/Xv/HsrkxcL
 4MsQ8/PPH5X/DZe7hJGMzD/ib7ejn2sBTqeLBRqERrAYwKdlV+iGwk53skesHNPE29+S1daNwZ6
 gyB3Si51e0pvvHjEd/ZJg3rRwBbu+ySMPDMpSi6sxJxgCLs/rHlUkNzMV5SZRV1UVZNRzWmZVjv
 rdRauxzz0zz6+ZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110821_207481_092169D9 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/cpufreq/ti-cpufreq.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 6ee76f5fe9c5..b59c46a3cbd6 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -470,16 +470,6 @@ static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
 	{},
 };
 
-static const struct of_device_id *ti_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-
-	match = of_match_node(ti_cpufreq_of_match, np);
-
-	return match;
-}
-
 static int ti_cpufreq_probe(struct platform_device *pdev)
 {
 	u32 version[VERSION_COUNT];
@@ -564,8 +554,7 @@ static int __init ti_cpufreq_init(void)
 	const struct of_device_id *match;
 
 	/* Check to ensure we are on a compatible platform */
-	match = ti_cpufreq_match_node();
-	if (match)
+	if (of_machine_device_match(ti_cpufreq_of_match))
 		platform_device_register_data(NULL, "ti-cpufreq", -1, match,
 					      sizeof(*match));
 

-- 
2.48.1


