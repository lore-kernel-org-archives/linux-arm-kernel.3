Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAF6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwLm9ZOqkxP5nRd61gUy/JOG5+aVOeMLvrzzIiEulOE=; b=oasHLmK6NzwaMUXCWQs9/o1CxK
	HX6WvFRlSJav8oHrw5Pihycs24+vRLcMH0ui29RdvIVbC/puNi9SR6AP4Kqt9xIJC2aC8ocJPU5Ex
	pBxkEpseMMmXYpjaDnT3kzkK07/dKKRacC51PrW1tB5ZuUmQy+6HiHuJyxX9+crvo+MBWt5nWKbSa
	jf1+nKMAwncfhCTKDWpALkodTGVNF8a51gbQiXlemjcQvP5AXCD/gHjJzsy/HOwL5OoThHc+CnVkj
	3xQ20OBpHhGF8tMs0LAt5qGKC6fepSdNnptr1m1hQtkHzt7JNZZ5+tFkfDONBmX37f55cCiXu79kB
	xyL0fEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHe7-0000000Gr47-15AX;
	Fri, 07 Nov 2025 08:16:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHe2-0000000Gqxx-2XoF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-429cbab5d36so64719f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503389; x=1763108189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwLm9ZOqkxP5nRd61gUy/JOG5+aVOeMLvrzzIiEulOE=;
        b=i5HEcueuftu89Ds+Zy2V04qFwjIT+fy57LqPzqCGBrZTq8G7WJUg/AjpIm6MtqjWew
         nOFRsHc+E6xNejLEfuI1LrWNejZRaOMJLW/H/X9JS0ed7VtjEEqLSHxJe3ugE4EAbzLK
         a23HokktsN1ro1gTd5vtMSTcI8OsbjndjRFKRgMnIHjcG49yUnXiGT5Y/S/Vxg7WfRgj
         9eF3R/gcm/CwwYtt5Mxs/sK8rTWfu0N0/Xz0AE06biisoYx4TfKjlEBHpKlGSPQ17Nfg
         lY7hpsfDerosvgp3HPDslQZDj9YPOCUWlxVKzkhVId7CveimjzrT++Nhksz+rH7CkBc7
         Y/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503389; x=1763108189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwLm9ZOqkxP5nRd61gUy/JOG5+aVOeMLvrzzIiEulOE=;
        b=X7vYi67deQdAR9+7EDX6R1gjS4JM6tgwvSShFf9XiCr4abr1ZlnbWI3H1z8d27u1Lm
         8bdJqWtmBsmvjdydsVwqFjzZ9j0+LzoG+4cEH0bRtlJxs7cLW57QhsN4LtMmYRElAy48
         QZyL0CJXFHJ8FT0ObatWuPpZO1r7Tl0vIMbIU6HJPbOUcYD5mBDcoBaeCrlKDMfjKeOW
         yK8iBnP3cmtOxI97YK4yYcM6t0WZVgq+Joerus2ZbSxyB+UwQMjyvhOv+xIAAkM2xBp1
         VSEWO4E+C4R1J4vijCCAWMtYhYbS39taY4wTOEZB6isL4E2Zqau/aG0m8Uw9x9AzQ65U
         D9WA==
X-Forwarded-Encrypted: i=1; AJvYcCVth5Irm1a9ptekUn0AE5TNDavziDyK+zVkZC0JAb9NKhC7ltFK9dCy9aGaNAemIW3PeGJHIUzSCeOU2E8cS4Se@lists.infradead.org
X-Gm-Message-State: AOJu0YybRJARqSh1L5seArjoLU2v4bCCR4xs6r5DNtXqOH+xZOIrkZGO
	XvQJe62M6sj7Zh74g5j+XOrlrrgETEZjTmLAeINdjBXm19bGbTeMt8DChHNam2HYO08=
X-Gm-Gg: ASbGncvUpNffDEtHLoMPxQH9JgpFgkK7ZGD6POQv9x6mhnYLUmJn1SGo6RuMP+fkrc6
	i7YOfXRE++smgessM9lVYilOqezKAZjCkPNgvN4yu98EM7fMwBXUbQAPDn6orxiKa4HDrqqIPf9
	8Z8cPQ8WeZ+xp67Fy0T9HATUW1RIqazAxau31+ZagscLLPyDWic5hXApvBXyQMCcwcnZ5TdnvHW
	A1tnnKev2/PfFVqQpwTq5p7Y/M7PlfwpHe3V30Ie4pAoDYmS4ceu73nMNWZ7ERzlGXIvOT/OL6y
	TrtVan/yPfr51prYWPd7WI8U+b0LP9yEYRbGYYv83c1AytBwj79mIIsVhqOMoPvtNhwPPVMMTrD
	mvrrhUwD4k+GjTSK7QjU7yyEhE7JH3cuBkRdHSoZuDbhAmBcr68diipvz3OuCUp2C0sG8rPrkmB
	Ch4CqvM2p7M2HcioXoMIe7UeI4O00=
X-Google-Smtp-Source: AGHT+IEW7931OZiZRGfsN4XwbENTbfXf5yTkeG5zUHKOhA4eCYE8JeVUBwhn/sIFVaN+bw8gO6m78g==
X-Received: by 2002:adf:ec41:0:b0:42b:13cb:41bf with SMTP id ffacd0b85a97d-42b13cb4268mr623938f8f.9.1762503388885;
        Fri, 07 Nov 2025 00:16:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Nov 2025 09:15:53 +0100
Subject: [PATCH v2 6/6] crypto: cesa - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-crypto-of-match-v2-6-a0ea93e24d2a@linaro.org>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m3Rw4RghvlJpNqwmX5RdKGrpt4N2kWtJe21s2ySaS+U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarQIPQj/uwSRGyYOhxeW+nG59uNrfsSEqYi2
 oMqO3cMHzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2q0AAKCRDBN2bmhouD
 117lD/44tUDFYEjT0xJr9FfxIcOknzx85sePA1ZDeP3Oavbz5mSDgFRWG3DUqcS8jQOge532MGD
 bQjMZh6FAAXgJGYB+EHXJDe/SQrp4/DIppftDO9LMqt6wzkDR4caV24D59K7WrHRh+Ew4B4eX7H
 Tj0FOrTLAwACR0QCh3NIKEKODka/+oldeK71aizC4jVy+pODsfHA7ItLXF/FXjwrhykAoKx0RfQ
 7ApCmu6gmBUHmOn+BwYj9NFnOpf0yI8MXnRvH0UbvXeJwJK94FXrA3GItVtAfNyY4L4sPIoT4Ej
 Xwk2j55yDLd01zbRWPoxgiw5feUeibT3g9P2T8tzZ0xP9IFFfRKYCufYydLHBkoX2izid4uZG7g
 97WX+Cb3Jr8MH6pqpy9mf7T6qOTXCpGWCbrMWzAWVLTWeHsR9/MIc4uT4HvaHQnjS7j67p1rs7h
 lxsVtbgKHLUwIiuzQf5b93POHRRWwIjjzmagPIZyydUZt5hhIPxsBzfej51KDb8nqbycE8HBBL9
 kLEMB+5pQ5OisidwDx7ofZmxsKG3gL5uT7s4cifHxrkcK9jHQ9Y2NGtY5fkPCKzXbGr4c0mJQ1p
 jkSV2wodegqW3xwn+ba+mQxCItmBQXjlMqdASt7kbtMKHZGScO35Sdv8rl/aJd3U93rd3sMMdvm
 B9F8iTOyyri2UmA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001630_695099_9D722AD8 
X-CRM114-Status: GOOD (  13.87  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/marvell/cesa/cesa.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/marvell/cesa/cesa.c b/drivers/crypto/marvell/cesa/cesa.c
index 9c21f5d835d2..301bdf239e7d 100644
--- a/drivers/crypto/marvell/cesa/cesa.c
+++ b/drivers/crypto/marvell/cesa/cesa.c
@@ -420,7 +420,6 @@ static int mv_cesa_probe(struct platform_device *pdev)
 {
 	const struct mv_cesa_caps *caps = &orion_caps;
 	const struct mbus_dram_target_info *dram;
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct mv_cesa_dev *cesa;
 	struct mv_cesa_engine *engines;
@@ -433,11 +432,9 @@ static int mv_cesa_probe(struct platform_device *pdev)
 	}
 
 	if (dev->of_node) {
-		match = of_match_node(mv_cesa_of_match_table, dev->of_node);
-		if (!match || !match->data)
+		caps = of_device_get_match_data(dev);
+		if (!caps)
 			return -ENOTSUPP;
-
-		caps = match->data;
 	}
 
 	cesa = devm_kzalloc(dev, sizeof(*cesa), GFP_KERNEL);

-- 
2.48.1


