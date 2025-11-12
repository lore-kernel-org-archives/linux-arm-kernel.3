Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B6ECCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=; b=rqsiv87U2bgx5IuLYTWqweL7Mm
	3yuQAtoes+zavi+Qgx/ryJKgEFK0QSeI9yzQjtSuYl56sheebOva7CFIpX0znIs2KdwrdWzffB++o
	N7HP6LX3jTBuhdKK73VYwHGKw9dzT+kkUQBFVLWWLnIz/iZEOcHcs+TiozupwsMXr7GzQJkq0SnHV
	LM6a/WHqr4Cw5+vnwejx12hIcvQJd168a/5ElASODmLKO5+zf1JR7n3wn722dB+Fd7HKhZq40CiWl
	mu8IVl71LmyIQuo1aZwJgiuemltWAgsMFfWBh+VNhj/b5i5fWyoNDoifhIONuUjm3i/PHT8PS0msS
	args7wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86X-00000008ZPb-2i2D;
	Wed, 12 Nov 2025 10:29:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86O-00000008ZCt-3yNX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4775c4197e1so174235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943363; x=1763548163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=p1ZJZpeQrHBEcTI/tiSVzXtdWZsvKEFYnrrSSTFT72B+5bzDIXzONqikjb3jgeJNdt
         fqK2AqMm9CHs/Sfk4RhQ7JtF8pDRruHaFRjGWycW0DepY4gEr/KuYz4TPXB/UvXq+HoH
         iivqLAC6ft7QOa/0KJwLK+ZOdYtOGNwTVR6j77C9KOC8l+5YryCipA0SFcRF+6UTxz0z
         bTUiHV+spO6IRyO1HQ+/HvD/+r0TQAkGeNpkQ2BiEH5KAh6mcocpv4YpDSehD1XLgZXF
         oBOKUhDI8uKDaKYVGcXxZxUaXFcmJWRyM+whLcK1ts5PV53aFRYIEq+RanIq6vYmlbyA
         qS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943363; x=1763548163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=ULW14KwDI1tRw+/rutPC5BOld1b3MnwXYIMAs7jQAO7Hwz4/gfHxNY3X1aVv+8HeFe
         BIvdk40D0tz5kwD0vm8WGLaiu3w821uervgOgV3rT9g5pzGlvMonX5B7qqb/pJEE6xJb
         UD2DBqXeR/OCpJMPfwqL9hXpVOKjn0QAj7LtycEtLX7yaklYTqMgqaZtcP+Ja/seL78i
         2eNenpkQJV06ew18sVaM7UBZn1Fe8sK04rMFyj/arFvBa1x9PZ+62IGRWTTYWclqZbIP
         IOxOGnEEYDltRy5rPoIN9GxX9WtvV9YPG18nj/zk8xbn37omGNAi7jrLo87CKdqKn+11
         fPlA==
X-Forwarded-Encrypted: i=1; AJvYcCVoLWqhAYfr2cFz0rb+xmV1E/WtKDMsqi+rLb+u2ZyAgt0WXVhqROo+h60ucLtSOJ5QXvHSYO7WJd9yB0CFy2rc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4/0qAnGHRoCrEpIWbGNQZ9FuVQkLcL1GEWiYtrzcRzJXDdvqT
	jinWEzQ9rXitaF065u4ax3HfEtB5FksULF2FrgIrCVw9TwzVr7AqBuCjE9ekSwzEICU=
X-Gm-Gg: ASbGncuh4EskmnjwD02d1WbVbnaBYmfe1Yrge87KMsrLbbcT+8hijTgTlC6Re6DfDLy
	K6KxHJUhLLEgcv1Q5SpciC6vc+QglK0Sj3WruUv98vpNRVY7vpeudKaMeJssufr0Qvh8ad93yO7
	rjyTU3nDyyoEEHaUQ6FqEoNqTJCLD2LsICU0dhD6yiBv6f3LowY6UGVi0yFvOsTFgtixBrQV41C
	BugeD7JOUkDdFjqa6x6ZYi59cXJSHqgmjT+wJ7eZte2+QVrKXOqzA6mfgB9Q4eOpA7JklIlcqhU
	fz76g6nI/P7zRMn9ypeV91Zev/UyVxUTPb5aiHLdOY77omOlwp5zhLcA5wU+Bu3Vq5qEKRk1Zy0
	U+bXK+coLXh+dwBlQUGSkg18gv7LhA1zHZ/R90kbiixhGZqd2WYrDkfojwQDG3kR3K8h2o55H8R
	q3kkpbpAYOKv/Gq6P/2lae8qU83lU=
X-Google-Smtp-Source: AGHT+IG4PYkMnNw0ODvtXOUL94VjBv1SVm7gv9pdwxJVf+TJ17wVy2egXepWnzI6OYpTuU2LqPLsAQ==
X-Received: by 2002:a05:600c:3b99:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-47786ffa240mr13184865e9.0.1762943362906;
        Wed, 12 Nov 2025 02:29:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:54 +0100
Subject: [PATCH v2 09/11] powercap: dtpm: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-9-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFr1tYOKM8LvWVApmUF795FPE3v7DdzNxeRs
 sD8X/1CFaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhawAKCRDBN2bmhouD
 17C6D/9Gk7S57LO4NXNBYYNtibDL8ljONOe8Ig0TRx0qtjvLyrRWtyTVEodm+FhIyH5crFSibku
 khWIr85eaZnyI7DZmi9EEFVE4TwF2EuzXUHW8BfsvL7GRGYpX14S1sHSR8EleDgvDqMR9NTL6V0
 jNIwfovhLn7VP+62qwBkcAlM/2T+zgdVrn1DzN5L7mfWJoxKIEyDNH6m/+NJZXFUpV8HAOSggLF
 aFaSy/KjIdyDDmdGdCwFyzya7/r4WobRUj2kgaeARLZL89D8+WH9h28f/7hCc/hAfW4Ii4hbv91
 ImiE/Pyo//QGhxgZOOxCC7SdAgA3h0gKzFE0Mgg0fENxJH3ErQLNax2+sn8jNbPg4xi/IW20mCb
 2t3DHlPLJLbhonIQc/3zosje4H2HU5cCZ8aqRjTNCRsbwSOVm0Szz99U91i8FgFfFR/laV42FcG
 Nei3Qs4ZfN50R0C9Dh4TaDOeeBx8nKNoE3EzI2l5AY7zjvVe8CkMAl7LjCpfWFxFj9v9bhYmsoV
 L/k42dG7HJvL4TkMRdbp6cOYV+0MPV7QY9nt7Fb1vu14PeCkZlFCr9Px35eZypnM018TUFkKaCU
 8PQcNvW9cis67Ie9IKba4R0f1wkpZVuHgWxJeR4dLwWs8Upggvlxq5bhVrL2wWCvymS1SWwmlnp
 ZVHhvRQqrTykRYA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022925_138472_3CE17E85 
X-CRM114-Status: GOOD (  12.79  )
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


