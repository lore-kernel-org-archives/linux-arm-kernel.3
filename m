Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC3AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=; b=i0GCG04mdHL253vR2wU5BhjNnO
	gSdOd2bGOsHP+zkxp0w6Vj5ZWiY8ydK7atW958/fVJzHPCCnV/brcW24Bg4vFjOoIhRXxKva+tBKn
	6rskNGR8qabybQXCWRBKqNPiMu9b3n2T3x55BUvTShVIqe/4qfzjWwExVodDrsq7btUBfNYT4Qcv4
	9V0TyzcOAcsH+LWQBDqQO7JtRF2b1k44fr9kJazOIgD596csIHr6gMAE7Oa/PgHdD5O9posWwkKSf
	3/ewvbvzRQqp1MLa/1sFWWaLI3edCoX9DHp2tdCiWoz9Vzy0LVuE0lLHKPk35sOoBmhCTKDVNlq08
	ctUEQDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WZl-0000000Flrd-3Aff;
	Sun, 06 Apr 2025 20:26:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WW5-0000000Flbc-2f4a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 20:22:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so2688495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970972; x=1744575772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=;
        b=UvhGN/7qE+MPOpbYjZYPQKHzRLwTtKdhQpvRl0qVmM2egMqzaaSoZ0o9d7oIJiNmaV
         z3kUUk2b0PT+qyQxHCuCzXo0+qMk35axO3xd3yDwr1MBQlOYPxRVDbiE8NJh0G8pWotc
         qoN+ZWe8phmFYEKopQpnSMXuQemyuC3aJ+s2oB6Cgp16K5ubuk1qWsBFTksda7G6u/1F
         ueLPCiUKH3XDMXt8z9memnGVWiYJNTmHAMISG7CgX51Z0aZQq1ZI4BgpPOwVPT97bWwc
         O72/NO8r40KgoBQ9OW6aG6hSM9YsS3EtLNeIPVs95TXzO+3slQcyZTYBXWg9AJawgLwI
         ZDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970972; x=1744575772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=;
        b=KTplP0++rujYd4kl+/4UA3ysvrKhlIgRfmWj1bZxqZNd52IcHDw8oFD11HZOY+wxX8
         I5LMjUcHAhB+oRgvspp+zW/fuA+B9xbA8OXYVbh0Jr1xrhJSWSSBROeomGJV9uG69D3m
         /Mo54YasaG1yo7c0XA7Jx4zmWgBgna6bB4t7hImDNFU4g1CMFVrlh0Z5CPHuhDLQdnIh
         fMgvTUbRD9oLptxvVV80ofqxMVa2JFDX/PHMWWpgBrPDWB5iVDatNEVqeRsl+bQIyjbd
         Yl/XNCgXeH3S8Fnf63topjksmIkdbdofM2XXGvhdvwjOcvNS1Rbbf8JeQj0LMmflppO1
         iqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1+yM4m2S2fo3zZmksCYqKdm22EkNe/t0rj0xRgPCfOs7Z//MCKCcLD/JlVqzbBINdWwRUFPNjGiKs5Tm+u7cZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyBlPsavJjO3pnx/dj4F0n9i1xCafc/bwI5iPcmfo+oQ/477EaU
	iOaT5vSxfk2rUzFdEgzWGQt8Bpug3koHE6iiSwj/6XEOBomkmG+nKVz55zpx3p0=
X-Gm-Gg: ASbGncuEo3NP0GARW+/4mZcdo30K3jOujnAngtmnvj2+Wiz++fWXx7eK0zajG85a6dA
	lO/66cf9n7gNcAhkHilGwd+Zr/6ebMyOz35PU01q4Is7PMV9BPVMsEBnNY17jgnMZWLE3XdEar4
	G77LKrdsN2+JfCMdtD7KUquayeFODRua1rd+4hilOUzl8hu7VI3qwBUr/3ZmVVw0EtnxuHCtpsi
	zNNhTkUc11qHF25aj1LKMYaJ9JEH6XG6BtlwMKbcYm6sD0JyRB6RKbiG6n7MWpLQW7X431IkqmU
	257H/upgJXbm9Lq+6zUnC6QSEknQplv6xm17TqPiXHz/MBLCibEnwwKbOrz3UJ1I
X-Google-Smtp-Source: AGHT+IEF8tj7Pq+6DZXgyHyaSB4Mgz8msO3r9oCeK6E+RJBMjaZB+pmLJuJSpG/6Qd5AvxQHxn7QGw==
X-Received: by 2002:a05:600c:3b12:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43ecf86b411mr30682825e9.3.1743970972004;
        Sun, 06 Apr 2025 13:22:52 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm115304655e9.0.2025.04.06.13.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:22:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] gpio: zynq: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:22:45 +0200
Message-ID: <20250406202245.53854-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
References: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_132253_688890_5DFCD582 
X-CRM114-Status: GOOD (  10.12  )
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

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index be81fa2b17ab..3dae63f3ea21 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1011,6 +1011,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
 		dev_warn(&pdev->dev, "pm_runtime_get_sync() Failed\n");
+	device_init_wakeup(&pdev->dev, 0);
 	gpiochip_remove(&gpio->chip);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
-- 
2.45.2


