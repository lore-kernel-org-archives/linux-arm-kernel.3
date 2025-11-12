Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=; b=egHYElm/FOgIaTFMZXJGaYOkLM
	hyoVZBknQjtbslgZUuEncWcjatkBXiJo3MKVwzyei71VMQ/1iaQQ+MC8NyQzHo/9fhWacVrEPF3jf
	XtKvb09U9/8KDvld9oPblay/dED9EEyKGOyglR5HoMBAWuN0stCQpvRQytTXtP4jcm4hry9+0hu10
	tkmZxCMdGxImHWno/Nho124/XnpopIWbkgY8A4GvFBy0HXH7HrjYwzlHBlfUw0xy5u8aueh+pG3T6
	gC7gwOlGWmmcuYAz/BUw6ve0JOOVWbr69PcmdMv+SB/QZCDs/5F0EIaHNPhgFaas4vmgj2oN/8Abl
	KEUpFK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86f-00000008Zaa-1hfK;
	Wed, 12 Nov 2025 10:29:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86T-00000008ZIh-1Cgz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-429c8d1be2eso81288f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943367; x=1763548167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=;
        b=j0jxivkKFhMcz1cP0v/gJVMo520356TF1b4IXj5Iqy/2Vy0zSQihDrFYyfSixd0o7p
         olp0oUaRXbugyF/Oq23UrZfBgiiX5gBhNmL0mYY6ZLEHxYC5R1Qe4aOk/GkAvk//QOBm
         jgnjEg4q24hBeAr1nLLXnsLGq+tSZj7X7DE4rBBOuFgV+Ox73v3ZzE4+NC0ErYb+JRBq
         3feobfTkpcg1iPtuXJRqjo5/S1V9Bz504I0WeVckaRESZjKvA5okfvZcYhq5kxIDXvj1
         racdc+RZ+d5pegY/jbyRYW5B/55XkmKA2SnBjSgm0hpvGtm7RSfWD25JJFAiMyITRVnD
         E0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943367; x=1763548167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=;
        b=AB9BfxTM9Fc2pTU8riTwceJcU/ohtA8XJzmxTM3L3X770hn0xerGVea1aFQJlePTkg
         PtJMKqUugAv1wsZJ8G5951p7w3S7lAO7yytqwpNAdgtRpW/K97E9fqNVRQ8o62ZLw4ie
         jsXBGwPZzjWFXBPRbqAOYhHT/LlI3FDVOQlJYGxvoga+o1cRQm3FmHKYA5bBYcKwsC8b
         8diixxjW+RY/21vufaq2f8r+FN3nJ1UK+XwfaCtX3fz9/Pc5odVAbu2SZakptaYDpOjb
         mQ9kj/HnwS6br2FeFwe9/2C7euXryPfecf6dSMdTg4qJMdSpcSBIb7WsohTzlMuJv4O8
         jjWA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Z1NYd20aAqFTeo5OYvA+cHl9XkjNdAy1g2vMl9p3ynFPHoH7EC8P2a7f08AFdAG+5Kk2tWfpM/OCGJ2Q9ZY3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7IpOsFeRO2/Djw/FiOgzWUaBcPyr8Gv88v2LfQNPL9zoz7Nzp
	/eNBVOVKMi1g0FmhSIAdttoTGJEKy5ej7kWTXmXbGAprIGOkafjGW8qSGCxV52AXXAQ=
X-Gm-Gg: ASbGncthpd3F2YlKHgWn+LmKBeAwlp8yi3AnsPrxOmO7QeRCdYvrSCeWiwzZAJnByBe
	lFq7+yfv/LoI4hqwzBE2fUSMT2mcaT/C5vEioAOIxEiNH/NsIqeG3oZDK84vpmpo340vgH5UUq+
	NL6WDmmM7Bs2nh1eJrAZ3H178rpFRTcwcaGWrroHnQB54256bmtiIFwrZ/hY9aeADGllseIIWcG
	6KO1IcEFuJf4/8sfHbuM/aBZdZUyozbzHUCMEpINZ6ghgxjIb+VZDwroowukD511z9mUajLoKxp
	xjhaORKB6pVQcr3oJmppzUVB2yXe+mbBnnkZKFeciU0p2QVk0gYQWUbelz7S8sq/LJOQJFkvuk5
	8NKz8OBtH+qaBxln3VZRnpUSbI+DOVaPlOg2odDgifaujTpFu5oE9izc/oYVmyXZjY+dkp/sGcr
	hQtdNOwo7pWWUaSg7o
X-Google-Smtp-Source: AGHT+IGy7b4A4+u/uGsBiLyOXS7Gsk6nxN9fGfA8X4fo9GU6bM3+pQFL29gZ0wTZR8WKoFNMAnOUPg==
X-Received: by 2002:a05:6000:2888:b0:429:ed57:d17f with SMTP id ffacd0b85a97d-42b4bdaf0ffmr1104643f8f.6.1762943366954;
        Wed, 12 Nov 2025 02:29:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:56 +0100
Subject: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GB94KyWxhTOTJwckGHT/UMyyYTBhNHxn8zgXA+NUlbM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFtg/s4nNx0uYgFz0GOtpfIGABdMtbdQMANV
 +JRa/rp5UaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhbQAKCRDBN2bmhouD
 1w/fEACKMeFrgy5574qcsFru9xUr0YzMLGL2fJ86eoBrcMob9jAASCEdZ4D1Ej7bxnGW90YnM8p
 kQTuDSm0k1uWwm9FiVqJrUcnQf+MzR+X7U/gz94Kt90nLdBQV5YnPGcIsm3iHmIP4oVXHOpXokP
 x2OCQWPmfvbyFBjPZBy/1jGg6gNsMuRrWRfRLgz8jGcpoJMIafCEYZfKGZHHy3oWdOtwum/ndpN
 lJWa/sWwNglSxmB4Nu9YPiMgt1dJKy/7Tv6q+BiTDc81aEuRjfamh5IFFc9Urmb7O3UHiKtdokW
 b1zy3QDFK7/HNrHvi3T+16GKEVsHfU1sSG6d5jbbhEGoCC9GzPoirQLGKCjP2yaONa2vevaXN2G
 eCDpQZj58sVFngMltyb2r24bL9TAKWfw4nb7Z3kkOHAoRHS3yYZ9Jukr2BH4hKPGGItXAk845US
 AqAxHGs1G+QmXZZE0T6JjmUDUuPP8GFF0/gXiPr8oQLTQn/qjJCF2+svvkeWcT5zGvadb1pZvRz
 sS70yht/Xs4f0SAUjiukfj1ZmpBioU08dGxd6BUYbPY3gEBd6rQAqXDRnOfk62c+DVnksvKFMWc
 jrZSlC+mX8Y6PtbObKFPeYpzQQgx1xpwIgMl1zj9pilDXpDo8QxzUh4CwjnjvF+KeaSAVtnx/8E
 ZrNgwAuRB6iES6w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022929_445749_6D978529 
X-CRM114-Status: GOOD (  12.27  )
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

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/soc/tegra/common.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index dff6d5ef4e46..d82b7670abb7 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -27,17 +27,7 @@ static const struct of_device_id tegra_machine_match[] = {
 
 bool soc_is_tegra(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return false;
-
-	match = of_match_node(tegra_machine_match, root);
-	of_node_put(root);
-
-	return match != NULL;
+	return of_machine_device_match(tegra_machine_match);
 }
 
 static int tegra_core_dev_init_opp_state(struct device *dev)

-- 
2.48.1


