Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC743CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=; b=Qr6Pq3uQZ/HlGvB1t5FjtvC2nP
	v+rMKj5StMivimYqHEq2oGgH+cHX9CRJqlrHfJroz9Q9efZkJJ4+TtTgJGmyn/FcqTUCt4VGI1kQs
	36BtQw0epPdZ+bCd1iKxBvVCeXjU82kmhpyvct4NdY79AaSC2aHaBi/2fKwVe13OHGiZn/+R8hYxh
	phjT6EamhzRwobOMoM/gzSD0EYsieHcUqxwb3G7HY77cmAeWwB8CQ1qGlu+7AhZkKPlMgjJSaHqUc
	lVx2zVnOdCXE6a18DbaS/Q7f1I61NtRC+D+NXHhTIAfl6ueVUwA1tL/16AS6G5vB8g2Ale/4qIdBS
	o8ztfvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LO-0000000G8B8-3sdN;
	Thu, 06 Nov 2025 19:08:26 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LL-0000000G84s-2iym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b70b40e0321so16685966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456102; x=1763060902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=XgBgShnrvM19WzmkFNHF7HqCjOyoaZ2txk+SjjMGDUy2urNOwZwhGESQ6xeVXuQqk2
         lfZYz8Jny9wjTQrt4cgzjRe6FdEI5reLeHyzf20qHEDYccxlOFeKo6uBNDk4zcS9heUN
         HBtwglGQILmXja8vDeU6bLnKKporlXJKoCMyVZ/yl7s8USWqovubpwexVFcXarROxvWN
         MHsVs0cE3SAJv/D4HzNj8QS33ybUWo+4WS80F5khlEgmJJLZjA0Q51odkElLBoEDxjtX
         4EjX9Pg5bEy2xNCQ8F19GcDhEPBHpfL+gg+fhUn0qx6y+gg93A7BZXA4DfgYKpifcu8U
         C2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456102; x=1763060902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=ICg2GKtdJzJgmg8fpFBItdkQkAdSFPOMEge1QqxrbjRNLfCvg8ZXJlq/1kxSa/vj01
         u9t9WPjKKACJ0VBlPGLAxf/HVdk1T7/cO9/pb107qc6vgZFgJqCPbtkTu6aU2i9ahS3G
         KIonTr9dvTtfYsnPCrEHseFqcMuBeybcRF9Iz3oggkaJkRk2bYxfUZWF/EV2MO0qyRcc
         C7X0/yJPUYL6hfbCaReFz4BhGLmSMFI2bDHNMeGLBrVW8atEM6VBt3vqgEboltTQoFwb
         eGGkKKboQAuHy5+DpHVqHHZpoh8gV8ToPR/I+1b2Ji16SRJZkKoWtd2vUrJ4Xv6NAo0c
         nR9g==
X-Forwarded-Encrypted: i=1; AJvYcCU0KMa/Ofg2bNOMnwxxUCIfXwQDeYFmrnWIBuJyuBMBZbTx0LXaPyB4KdJUSDVp9Fq2Dp7Zof/BuPOcg0G6fDyG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhb2QjS+0dtPlNDghT/XHGELYwIKxb4e2OlZ1q1zohaLgQdbVN
	6jIbvaERisr/zawbNx1OAQWJzEUqkTr8AFeqaSO5VghM6ecvQ0r/7dV9M8Y1t3q3fpU=
X-Gm-Gg: ASbGncvcF0+VZbv8Ed3nVEWdeT5KeQkbPhw16YDy0Op6zw8HsG0Fasiyatt0OLU1tlX
	3dM5Je9AsdekFaNqXBup65IyhlTZGCYQe9aA1giLwK4HzEFt1qlxb1nC2/5+d+6f77O4bosduyj
	Ugf1vH+qx0jGVRMDb5GClzn/x19aLY8E9LHqhqseVpN5/0YSPGBAz2sdOlQEaiIsZh9BIkQRrxP
	+yC9UTvTQsxtuKNsYhxm/lipwFYU+FrVFR3MEuUfG02WTfSloBv8osflDlyJaebgdDK5EzULZq9
	nJNlT8FokM4RKWZpc3/Pv8tO0kFIOk07lzldyrzlBEL+KYiP/wPLogUBnO1RSqonIwacvrbfuaZ
	ESlI32+4kbS2mVQEdtdfUQwJdzyKBcfPjoDuLv6kgV/CNPXStxBHh4Gj6hcLfmQFdt7lwVFC9Hy
	F3HGVUWiEVnAraqchF
X-Google-Smtp-Source: AGHT+IEf35hi/Mvu2pqQNB6ZUXhOFjK+2PFxyy+sVLCuTD++/QgA8I/C3DT2L72+VZdgncmFcO3C8w==
X-Received: by 2002:a17:907:60d5:b0:b6d:6d44:d255 with SMTP id a640c23a62f3a-b72c085b9ffmr22301066b.1.1762456101774;
        Thu, 06 Nov 2025 11:08:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:13 +0100
Subject: [PATCH 06/13] cpuidle: big_little: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-6-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIOPVy2nJb9/aZGGihJZJb6YzWNYbITaU/JD
 /wAIbe0weqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDgAKCRDBN2bmhouD
 1+/5D/4twhEWhy32a6SbzdPRfB3gSy75fyN8B5lREUBuB3lg+/Q20TtmadU87drCAs82yGBNucd
 GykHkO6pu4SM+UwePyZ6VPEVv6ZgXHrJNtRFG1XlIm8Q/AygPPl4xucn/naHXrWq/XnN4qNsWF+
 iGgGwG1JycizeDM8lsEpLS1ye5J7N4pEAShKgxBG9AsQrGb8cNPu+z3DWBof+lyhu3vH5GYwFtn
 /taEpeXS1kk4gbPvr0LKInH3SS1fTM25K6LO+6Kzi3XpXKh6UecpyRHpCSRf4HXlWEF+UF0uaZw
 dY3a+MdF3zn6XyR/fHaodAF/27kNp1Aljz5kVFWIj9yTeNHgGeDhatQboZaGfFLmuHGj2jOv8H1
 jo1n3AR+1hWN95bLIMnN9g7c+SOivA1B5Vvy6VyEZvPHTxHMFxkgAXobBCeHn9UzjInGlL3A8fF
 QHbTzdUu3RYgvk9eI6qB1FRWjuUcd3KOVQIkZBXZ0nX+uq6xrDyqNtxf3EeigO5HIZwGh0pAg3b
 KDdcUP8N3WzU053nG6pPCIEb4H/hKU4OPtn+SrP9g2R+QnS9X235mO91RycPcBKIBE1kRGwMlTr
 fuLMetgh3RS7x/PKnyAnqE8rGVJZamVvtwkEbRsgJocNyDBnYes1oTn4ozkObw33ys20kFRMJzc
 q3b4Z2KUE6y+epg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110823_711570_4AA41AF3 
X-CRM114-Status: GOOD (  13.05  )
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
 drivers/cpuidle/cpuidle-big_little.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
index 4abba42fcc31..08f6bf2f6409 100644
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -166,20 +166,11 @@ static const struct of_device_id compatible_machine_match[] = {
 static int __init bl_idle_init(void)
 {
 	int ret;
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match_id;
-
-	if (!root)
-		return -ENODEV;
 
 	/*
 	 * Initialize the driver just for a compliant set of machines
 	 */
-	match_id = of_match_node(compatible_machine_match, root);
-
-	of_node_put(root);
-
-	if (!match_id)
+	if (!of_machine_device_match(compatible_machine_match))
 		return -ENODEV;
 
 	if (!mcpm_is_available())

-- 
2.48.1


