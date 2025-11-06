Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925A2CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fnpzlv5TqPyTNVopTKhYQKTQxoXkISz35QRtVU9Hac=; b=V4MTrWopHrxBoutTek3uyKc/7y
	mas4L6bwsu7X/6K+G80eGoV3e1zmyo4Fw1yi49qEXyqlZXokJDsGg2yjUwIMb/VPwnZ/c5hP7X6CN
	/swBpGPY4yTqkFZdbVa0KsfKZzFbfCSnLiTWqBWtqlxOEu8i19EtYuNXJT1dByfA8HmOkyd1PStFQ
	grrSFtNaMJAGBlHmWxcmAr/HMB8f1lQg8hlLp1qeZddVbVa9gao3abga/rw8L/Q/9jIP05HmDqiIz
	xAJRZET8BY5JWYpuFg1T+D1vQtBVwvj4YyZrJmBx5FkuWapLkY2q3s7DsV0O0IwWtZ6h4b21Ulohy
	IAMSf07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fF-0000000FtyW-0DKX;
	Thu, 06 Nov 2025 16:16:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fC-0000000Ftw1-0ZEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:16:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64124e430adso123593a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445800; x=1763050600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fnpzlv5TqPyTNVopTKhYQKTQxoXkISz35QRtVU9Hac=;
        b=KsMKQk23k+yMjckewXUBkqxvZv8b0s1jzV3/tuE2a9dM5BytPLKoMZlIbogT1g3Cxl
         zKY6FYBw/SXM9TwChNh8z2wYKtso1G3vzeiD5/U9ilsVl1LUvF41lMnrwzByMpl/fYyZ
         TNTrcis4/g87bBt7EmX+tCLbxjd7FGSHRugFofwVedVzF2+4Ze7V1HOONMbUxJTHbXRP
         PtDK0sBBtYZtGorFTYeClGXBtO+df/as2XEdCaSZcLRyVsJEgBGOcv/G1BdK59gmOppB
         w3uOAzzOTNEy1j4+Ua0otdymDZyqS29m6jGNpGX/gbLhRKwQimL7rFbkxGM3Th35jOH+
         yn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445800; x=1763050600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fnpzlv5TqPyTNVopTKhYQKTQxoXkISz35QRtVU9Hac=;
        b=LXR9IqfgZGlC/0A5tpJK4SOXtK8E1FWStZ5aPetElmdBIR+meHKZYLgrmOM0MvkLtr
         I/5+RNODgoSibvSX2MQR/vXU/XXWYV/z5VUWLtnmXHZnEcboRsF+Hzyr3xqYriw9+YQ4
         hJycPu+svsrEThC2c/DzA0wVtAtzRk60vtmLipdVICDZYJGNkyDLs7+/mHKSPpIXidjo
         NMUUqtg1IF6eSyzGveMqaL0SD9JLpT6s8DLU+uUz8wmsD435lIEuCPkqn5OYEzDJg1+6
         FBhWPJBijC/6/Hc6BBNuGvuq3GmVBP++wwi2gfA4KFTs+QjOI7pMLN9eEiQyTj+x5JEo
         uZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCWe/Df/FXqAxxWGtw6IU9gI1kh2kYwJ+AUs3v39XYLSF3bMNp6LbI/xzw3bsvIVUPTnm7nXx10Eu/nrvKuiBv07@lists.infradead.org
X-Gm-Message-State: AOJu0YyADvAnqWnMYntWxwizJw6fe62BlvzEeOotRyn9uwH088yKC8PD
	gLNCVTa2nb427kuPgYHlqnqbR/yNs3mOrrkt/rH3QE0PC4d0sFOzVad0r6kpgrqj7yUwk5OaBLc
	v+E66
X-Gm-Gg: ASbGncsaqL6HtcHqf3yZ8wIdCXa7zMtuAxdGkGuTWectwsXDoFBRhcPlgrFIE18M6Me
	AWZwdSgr0SQWaL3vK9y0w/FGYk9FXjXsXqSemKyvwsQ92aAhLyFG82EXw/Lj1O1FSW/IxxDgt2t
	5XpICf+D/KyAOqCt7fPAuCnlh0t7dG1XK3nZWbFjHBQVlKG5tViiibI0oHVpppG5x7MWoxroYMK
	Tleul+hAhTkh7qqOjxA6ApG/SzKeupnlPmkFsK8P7zV0nOz3I60kx6XVbNbvn/KP1koPOIzKfCD
	fjogO3UoPJWFqTEUX+XMVV6jwnYnvXs3QkcQz9N4s1y+bDjfHt92hqCbP/vuEeH4E37CSLs0573
	oL1XO6XNlgNvVKf+BSro29lHIMjhptdz8XbH8lExZvk5bK/xc1e7zWDHCQQlabxtcVFeq0PQscB
	yxdjPja3TnNFFrEwE/bz6lUCsv4gI=
X-Google-Smtp-Source: AGHT+IG/5tTc7ZxspWUa/B8lb4VJAe+mwb5eciTvDLKhw+fK6fmt5UhwDE0B5Na16xt3VKGSskNthQ==
X-Received: by 2002:a05:6402:234a:b0:640:9aed:6ac4 with SMTP id 4fb4d7f45d1cf-64105a44b67mr3713567a12.3.1762445800269;
        Thu, 06 Nov 2025 08:16:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:26 +0100
Subject: [PATCH 2/4] gpio: aspeed: Simplify with of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZT2hMJMzDp444RtFAMt6NxeIg8ehhxp6qQkq6o38pVU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGkMyd/IHnLxQ8aaVNi31HhlicsroQ2rUZcgWUqQhqbqfNgTz
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpDMnfAAoJEME3ZuaGi4PXQc0P/A43
 VlDZbJcd8JJgzif8Kxz45G85Cei+azNOhCDEWH00UmdsmhkuwJmwLV+Ajksw1M4M6mgS80zGzly
 5O02OU5dduEuqs5AZNvaL0cVqHiVZhq+YhmANDSBQ0/E3jRTOOR/y9Kzpb9wIJ9YPoNJ2Qtyf3m
 9CiCBFsHGxIT2Asnc0bw2xxxIXDfLJkc0ru5+Hzwr5y0OH6ips03STdfYXBGn82p0xsT4abiVXr
 XW38qszaEhKlyNt/SNUyEhOmddIAXFWNGLymNcCKEUrXEsNJFmCMEbC5SjHYcBkmHthI7LIIAF+
 Xxpmjh52IS6RfKOOLmJEVlRlayLX80kQ9FsGDef3p6FtQEkX9tJPerYMs4SFtxopCN+HF7MixoY
 buUncg8Cw7RYV6DswaMKg4q01FNFuvYAVMAmOTAO1apdaWDsQi40ET5rYH0vkJ1fL7gvPByVP3L
 /uyg6aZubCZd8D55phWmbVsC0kW8hgiZKvjuR7A1zzIhKIxGrx8bpIgiEMaUbxsDIl5G4qxqIh8
 tcABibfodCZr+m12ITCbUUoCgEfmSwcoE57jaZ6Cf6Y0wwzIEnqqP1h0L/smNhts94gcsIoTZMG
 edD5iw8glo6+FCxSFKYbaOvyeqrRYLGb6SNZPRh9N0GGlO3Cch7OoaZuBlidPfbXhcC/r6xtUUG
 VRHv1
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081642_203290_CA5FF9DD 
X-CRM114-Status: GOOD (  12.18  )
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
 drivers/gpio/gpio-aspeed.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 2e0ae953dd99..3d675b63936c 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
 static int aspeed_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
 	struct aspeed_gpio *gpio;
 	int rc, irq, i, banks, err;
@@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&gpio->lock);
 
-	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
-	if (!gpio_id)
+	gpio->config = of_device_get_match_data(&pdev->dev);
+	if (!gpio->config)
 		return -EINVAL;
 
 	gpio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
@@ -1334,8 +1333,6 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 		gpio->clk = NULL;
 	}
 
-	gpio->config = gpio_id->data;
-
 	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_get ||
 	    !gpio->config->llops->reg_bank_get)
 		return -EINVAL;

-- 
2.48.1


