Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54A8CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=; b=AilkYr1t8yCXLEf/ksnf+8zSK7
	Z+35WF/LxeP1E7W6ltuu5cgIF6M0GLW+ZJ1hBT5R7d6VcASW2ExMuqrGt1rTjiuBXpgnGd/dK6Dtp
	7OLIoz+0Xt0Tjcf+hULBOMzNr1ehOH1GOKKmxsY+Gww4eMC30FGFkjNW7CAteJML/KdwXifpChHjT
	U1iFYVf4voY25oGTvRLNrN4rLoFLYHMYtWDbAOuUdUl1XRllutCSKxMJPD36aKeHaUJ791Vs24EgB
	kzTG9jRzIUhq7cGyQt0PlUgF2cJjvJGw0UOTWgmTVRI3kBxnJ9MiuYW2PM3+eVpXROfkd5GiQb13d
	s7WXo6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux00n-00000008FMw-3BFt;
	Fri, 12 Sep 2025 09:24:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux00l-00000008FMm-3qh5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=; b=G9EYw774siQITUXd5rGbqqRgWx
	WXB0Ya/9TpoD/I7o6StCvSwBr6vuETe3GLmB62culvZ69WIhJ3ddHXgTrmt0BIFTafg5w6iBKXrqM
	aR18IOgs9m2L7x+EaKd6dg6DgFmkrLGJcm1yCC1pdMjCoaaIiNax6Y6GT2R6LToA6/4dLIeUV+k1e
	4uVt/hHL/nTwcwY6XtsxLeHOlHK5HSJX/9gyEH8MxBlGzdm1yufYeaGIaBL52Jo5wakSo9/aGUgLS
	YgU7m7bwl1D/q01PAVGhobyQkV5WktfPx2DzCfet3QrQOH7Ac1b9PJT3G8qyjQsqurpH4cCjD258Q
	9FpeDlVQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux00i-00000006I5H-3nWu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:24:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45de5246dc4so2969925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669042; x=1758273842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=;
        b=ZeVbq8IjquC9AwxqQM/WWLa9VeuncaGhN3MXqW2Rv7TxaEP2dJIKZ4HAgI6VSd6n/0
         +yFI/rHOCiuWkaQTYfaqh9GDF+0upCowwbevRCzV+v+dXPA0SWefBzmn6CUkWECPE93f
         9IkvUVg7TGEIG2OKneG4YIniLoepckGui/tnPwvO2y7RYsRoVD7N2gMO2BrSh7yakwOO
         G5mTcOoT5lUzl5MPbrkRyfejeC7Wi9eTnDkQ/ZGVZh8gcBHDPBJC51gzMLVNHaQuF86A
         Ku7uSTIPNSmlewsNRDuut2yCe1ZdTZqGpxeNQh6lfBzmHExHLsLNgYmFsok8vDmGtdpS
         pTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669042; x=1758273842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=;
        b=h2/YhDvEbO7UvJIi7e3Q4NlAvlWnjrYoTn444cozAdGYKW0iZMGbsnO4si8UMyVkSJ
         djkLu17jCoVnaCTH4I7O5WiHP47biheDDdN5LOioTyjCqOKFDd57MA6AwqMWCRNs1OpG
         RoVPdEyrLWkh0k0RS+m2JcK0qxDaj3QW6t6iEqOP3224OjkGce8B2bQGNWXQlyeCwRle
         6Atp8iKw7yzp1zNTAfhz0TUqXMKfk0eGT3M/7P76eGRQs0GaNVoe59H8T/cH3m9rQwvl
         3WGC72ICwGB3/fg6JjHe6cMBjVCZ3W9GpkNv218VcidYUGyFMRqu6bT8G14IOcgK4vfJ
         q6OA==
X-Forwarded-Encrypted: i=1; AJvYcCVBzjboBHGQvlGIdkV/FwJpDM/GEM1cZfQhBfiVa8AahwSzgSpVMonbqNrx2xMMqKc6DbN74UCi9hprqxgvDE15@lists.infradead.org
X-Gm-Message-State: AOJu0YwoCol1q3UglRMpZT1KIIgJZXMEn/Nz1Lx/USeNribA8pMftUfw
	EczPerxCdk+TqIpyxTb67/AyeMRIKcHf/DoHxoMdwPFBtpTfP9+wxHLhvXsO7QbWnXk=
X-Gm-Gg: ASbGncs7/KoCvKsimsx2nk9cMOQ4c/WVUgZTLLPtzaCn3fPC7X92VbWBFgorvz52fTu
	U2ComFj7RQkAMl+6ADoJJ6O7C0dBqGNmkVj2JTXoAfIXTuf2qg8hZH//0eJfXnvkAiOGaH8Ec87
	ehgLgGexSo7puDNEQ5h3yC5cjOzyDA7Ksj9L4gqgu2Vy9tndDuhSgyWfi59ZDFkXs2fMM87Y9dU
	eMn5nxSwWgxuXl0kvOe1WeEmasx6EVcfJudHGN7DzQVbv6F19aDyaPZyLOnMEIdOWFcDCGs7oOm
	7HDRlX+wLDVP9unv3mYkB6VAfakDoIIGkHdB+jPqO4eD248PpKG15iA+289kd4tPDHP775ZrP7c
	D05D9hes4fm1VZePDcSsPB9IxkZf74bawEA==
X-Google-Smtp-Source: AGHT+IFZ4LkljsZAZV2KGxX2vnp7A1Ij/erNB1dV87KomdD4NYdDAGsePpI/vQBLekU2xgSQDZkE4w==
X-Received: by 2002:a05:6000:2503:b0:3d4:c46b:e57e with SMTP id ffacd0b85a97d-3e765536c58mr1041490f8f.0.1757669042563;
        Fri, 12 Sep 2025 02:24:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7b3esm5727337f8f.46.2025.09.12.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:24:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 11:23:52 +0200
Message-ID: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+bVJ+4hy5vMtuVwCqUQtQcNPKerS7zzgW7OjoDwLJD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBow+anDJAMN9wRUbRQ5JlQl3eiWjS4RDs50mngh
 v0da2zDAfqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMPmpwAKCRDBN2bmhouD
 18n5D/4hSZl8udzkB2YzvH4Z9aKuFcLBa9CFrbK1nRLSDu5FSjWXEXWKEbFj1MHjLOqSErjfA6f
 fc2Ubu88L88RmHPoMzOYbLoElN/YbJz/dIcfvMLod8fnzL+nyanIDfXmVZtUmmDYQSgiudqq55N
 OgcP1rd3Njv+m6SEpSi9mucEgKnmUW/IXbyBYlD+Kf9WQMw6AGL4ICHWW/kdhFOk5ZcOjb1HnW4
 OAHTA2vvtVF74+R8APPWN46YH+EFMlIbmGxIAT4HXnpqw9hdoUbIXp5OqY+f027EOcWS+tUlw/L
 U+PodlsU4UHYaoRtvkk8VhihoB1YgDyYkotQtLGqHYP970ckzBwoScgk7ZWMrRY67jWusybohk/
 s0Sp6GbG2Iio6vqkiMMxTYn9Yvj1+Gifxh39F+gN7GBgU9oAjMTiPuB3aEF7oV1Pm9sO+X13wCk
 JZrp9Lr7mtvLvnSqC8NcPGe6K4RBMSK16uLP8KVuigMVo22/6w4qqL3uOChq/sXCS5+s5ImXBOQ
 XMGDwuPVLAxgzYT7HmVuCKaR23ULDBoq29eCZLj3YUNm5MuzgKkthjnb9mQWiHhNWP25F0eJDuD
 ujygi2OswjTMsQQ+Ad8fb301JcyprI6J6eqSPB4ZFgCmc1C+y4Btbks/pdsehgKkZWjRTK3XoZC PTV13F72brgao+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_102405_119397_CC278A53 
X-CRM114-Status: GOOD (  13.38  )
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

Print full device node name with %pOF format, so the code will be a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c      | 9 +++------
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 7 +++----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index c4a1d99dfed0..16cf9d15f247 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -258,8 +258,7 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	grp = sprd_pinctrl_find_group_by_name(pctl, np->name);
 	if (!grp) {
-		dev_err(pctl->dev, "unable to find group for node %s\n",
-			of_node_full_name(np));
+		dev_err(pctl->dev, "unable to find group for node %pOF\n", np);
 		return -EINVAL;
 	}
 
@@ -276,16 +275,14 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0) {
 		if (ret != -EINVAL)
 			dev_err(pctl->dev,
-				"%s: could not parse property function\n",
-				of_node_full_name(np));
+				"%pOF: could not parse property function\n", np);
 		function = NULL;
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
 					      &num_configs);
 	if (ret < 0) {
-		dev_err(pctl->dev, "%s: could not parse node property\n",
-			of_node_full_name(np));
+		dev_err(pctl->dev, "%pOF: could not parse node property\n", np);
 		return ret;
 	}
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 5f13315ebff3..50a16f3bd131 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -274,8 +274,7 @@ static void fill_pin_function(struct device *dev, struct device_node *node,
 			if (!strcmp(pins[pin].pin.name, name))
 				break;
 		if (pin == npins) {
-			dev_warn(dev, "%s: cannot find pin %s\n",
-				 of_node_full_name(node), name);
+			dev_warn(dev, "%pOF: cannot find pin %s\n", node, name);
 			index++;
 			continue;
 		}
@@ -283,8 +282,8 @@ static void fill_pin_function(struct device *dev, struct device_node *node,
 		/* Read the associated mux value. */
 		muxval = sunxi_pinctrl_dt_read_pinmux(node, index);
 		if (muxval == INVALID_MUX) {
-			dev_warn(dev, "%s: invalid mux value for pin %s\n",
-				 of_node_full_name(node), name);
+			dev_warn(dev, "%pOF: invalid mux value for pin %s\n",
+				 node, name);
 			index++;
 			continue;
 		}
-- 
2.48.1


