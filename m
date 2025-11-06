Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DAECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=; b=ln5iQ2uQRGM7Wqf4eP5nwSWzfL
	TApgJoPtWknNdJlWdjdySqKSbbt5wC/pOS9EIKUxcnl8tzC7N6m9zG+LDTB4X6TxFdCKSrGApwj6M
	3827ZGa7IBYXM2lfIB9jxHFl+/MPLODfR3ODMaRa7lerzQ0eeUy2MHturetup0JUrtxtBiaBMqeLn
	Zm3Wb0kzKi6usanO5wIXWpxKkZvSxBRsJpNwMo1Y1QWQA6pFZFTW5TPpB2Lsk5bCGm4p1YoJMuZVj
	bvry98Z1csLH6zj/mRFiLfyPZVpaVnP9Q5atgaxEyb39vPfURhpInq2y3KHUIP91M1jGfriULxW5S
	Fv5p8tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Lc-0000000G8VC-2s0y;
	Thu, 06 Nov 2025 19:08:41 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LV-0000000G8Iv-2i5Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:38 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-640ef45546cso232207a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456111; x=1763060911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=DbD3jmqyhoEFtmZ7egRPZc8YiOuL4LEYozYhHpqPxnhDbO3R91bWQxeLpfE857ICNP
         b070j9S6eD1tmHB9FaqEqFZ3yN50XMTMGVKYXFgox1JCv4dcFfHzmJFZUdI7fArdb4I9
         +u35WJq4pL1AtQvrHQqEY4jfBYNGkDQDXWMxevqBg5YKV22H3H5Wx9xnBRY1tGf1gjaU
         6hnqPz3GaZA+zOG+O+MUxoF5sdklxdDHCSKv62mQGcvRO+50IyRy10xnhWyaFaHURtNo
         45/FrIIZ5S7P54TuqgyTFut/xu9O964X7hFQcMccDNlLdOohmdRhf8BqaF8SE/rJV1sH
         M/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456111; x=1763060911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=cuU1Xyxd/+ErHSBBAevqmE4REwtRgz7SCZKc3oEMYHZ3DcsLzgKAt6Kccrlk/wAZMQ
         LumdH1wnzoTrCJCKWN+nfc6xMZAkXV5lriJ7QGTiQcZgEOSJcaxCdccSXzPaLqJL0aWv
         95yfRC8YIX0dGxE7bqGHONBhRWLDFIWUM5Sej9yQPrz1fvDQd8UVMbo75LvKjpl6t2jz
         dmS/dngrta4SxkoYKth7FysSzqQ58g/FNLHx3OjqT2HOK/A7wVSOY+GlsCPSakbOBgSw
         GMEb2EQHRWOdU5jpbAJTvGR2wGnF0vJkgbqny6DDMWX1w2oBWjEtQ67clijSxguBrSI8
         vY1w==
X-Forwarded-Encrypted: i=1; AJvYcCVk5jywNr4fDBR1UR6z3NbSV87ZyeUjF6HaDnz/qUwhVUetvTHMCjZA3IdfAcRF1SVL2dljPYHRTWNzDDSftWu+@lists.infradead.org
X-Gm-Message-State: AOJu0YxSAC/yodzX50/9jjleratR27o1qCIJZw5KEAtX7HL5I84kOgbG
	98hW8v/hETkZDHGVZ+f6UjhMkMOymbbVB6osWkT7vEHbC9L64Bml+sNOSUt6u6ZYZ9k=
X-Gm-Gg: ASbGncsO+Zwum1rCAWIxIj70u8raoPHiS/dDWc9rNu4rtd7ntCrvlPsPEDa0JkedS4M
	+zL2ONy4vppUU05j69+MACtFBJ4H8W/MPalpBgXjG6SbJRqpeanCyyvGOgnwWib3XAGxAc9BMUF
	rP5hdnsI4160PB+aVH0vrOsz3dFMgDJCuRXL3D1WigpLYXG3kXE9q4FMkFAHmKxnQpiDQ5JIzNx
	ula6Xu8ACd7aC5F3Tq14VqCazxFR7q5SRZq9+0J2SujZjtarpmWHmxC85uiP+NLC4hOY/dFPvhS
	8KCicA3sKYtQrZBL6/9v1hNd3PWzHnhZzOL+EQZN/rmbvwgC5FhIlkteKYGUC2U45KiW7IJHcxD
	vQ6eIHiHs2pAK42IKa1rJM4uLlHo1bMTPyMJxZzKPXIHz01+k273p37vBf4dferwkWo8d5+2Ur1
	wb4z0WiFMHa/X7fGDr
X-Google-Smtp-Source: AGHT+IEGmqq9cm1Rvzfb24khZSYsFQ/PTegAXxlroACoBA1TR3Jjri85Sv8tMmwxWc3nu0kMo6BtTg==
X-Received: by 2002:a05:6402:3586:b0:640:be87:a86b with SMTP id 4fb4d7f45d1cf-6413f20751dmr291297a12.5.1762456111545;
        Thu, 06 Nov 2025 11:08:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:17 +0100
Subject: [PATCH 10/13] powercap: dtpm: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-10-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIRDZSYvV0FBFCASolVOhNlK7njoQDy3PwX0
 i7RMv6QCVOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEQAKCRDBN2bmhouD
 1wd5EACGaqsvVT3xObFDDX807YvuxJRMQZS0dyrF8dltJn/jHXr9MltK8ElySvuXxUPZVbULgd0
 le0nPfD5i+yDCZwLJWBEAZq8oTf6EHNCE3WgynJjTo4kFUGMXzSETGrx/kmGFxkBzQv1Dn39yxb
 vUWKEup8cvAG18aKjCULWPJ7aNkhz6kU0nHgpW66/doZbnzb6CqiEueH27bTlRCitUr3ep1Kuq5
 SuDr6N94nufPMfsdLhwTd12vj3PdSThfGyhNgaKf9HLXQn05wbhCI3BD7PoA0K89LaVpaOKa2rn
 DZxbnalo2fZ8Oeos8raJNEBXaIbomLAyUdLv4PNNcFRy2eScnYQ8W8RuChNnG/zq8i+qI5cFQaP
 6X3kIJ6Px5Emth9Y+nirUwVywykg7EijzEb2b5GTNElBqh1LyEz720BQvwNlJ7Wc09JThLyN+KT
 EpvtiQ/eUGsgDiS+iXiZ1Yv/bLr4x9nMh0SgD6IUrlAT3mrTozJV+Eibc2x/RSg9qpdQy0Cz2cb
 A/VqfFcyYGpOANT8Fz/xAH8Og2Qg7+WtHSgi4sTC07vITCQ5A/jtvoYERkc7BKZr6xmk4CRHmJm
 n4/r1xT3V8o33Zg5qyS5iv71pA04d89pkTmBVszpfDNqJgwVj9nH4c5hEyjkB4B2cxUd4vfgw1M
 WFbv0ljiRR0CwPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110833_897938_94A37481 
X-CRM114-Status: GOOD (  12.59  )
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
 drivers/powercap/dtpm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index f390665743c4..129d55bc705c 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -548,9 +548,7 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
  */
 int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 {
-	const struct of_device_id *match;
 	const struct dtpm_node *hierarchy;
-	struct device_node *np;
 	int i, ret;
 
 	mutex_lock(&dtpm_lock);
@@ -567,19 +565,7 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 		goto out_pct;
 	}
 
-	ret = -ENODEV;
-	np = of_find_node_by_path("/");
-	if (!np)
-		goto out_err;
-
-	match = of_match_node(dtpm_match_table, np);
-
-	of_node_put(np);
-
-	if (!match)
-		goto out_err;
-
-	hierarchy = match->data;
+	hierarchy = of_machine_get_match_data(dtpm_match_table);
 	if (!hierarchy) {
 		ret = -EFAULT;
 		goto out_err;

-- 
2.48.1


