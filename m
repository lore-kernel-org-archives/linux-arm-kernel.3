Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A7EC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=; b=kHs7uB8zowqhhWtjaBELSXqsfD
	GHSRX0aC3e2NgfK9cPvhfZIUeBkT9u3UyqqQ23WCSs+HybpYrisHvCVxCV8UczsVqkdFVMmTdEMtA
	p1Br4ZvijFyFSek/77tb6gNWPkkgo5xuXDH3PKRv06vYfLJ/XVZL5JcxEPvUiujiXJ83fRegOJzJf
	CSG25McrzTzLoy+wMcD9ng9h/gTN64DAn/MQNPJWPDEgjwh28oOlhgO4GGLjhYuAXef2LtNcEkgB7
	A5FyGtDMFl13Xkm9Hm8ZIrz6vYx4b9xA/iSYtfb8z20YpEJGvovswqgW43YPmDBOcG38TE7WmWfYX
	00cqkK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdmS-0000000FDHu-0ZSW;
	Fri, 21 Mar 2025 14:55:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdfP-0000000FBVV-0Gek
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:48:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39143200ddaso1285850f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568489; x=1743173289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=eQVZljA8XpAR84r32C7/Js0dWKWhBCA4YY3fgDuKYl6ep6Kd4+s9VG/GlQUScwpgLj
         GqyPnHEMhMPEmEagp5/wQvggSPZxBv2V3mN6s5Qao1uCKGnqVqevY+A+OEsHVqW0aRW+
         CA1uChEEZD2MokC9gp3fVpoKvPVeCNBIej38nvYAHr/0PwoD4ihKj+3is4jh6vmLeHrS
         kkZYfWaTH7Tk2Z9Nd3xYTC0jhLCXHCZCMpdS3B2grL5Y4CLUfOW7quNZWe43f+/f5pER
         XzcKiwQClrjdERIVfGucHq/ToRKIPsm3cNd/H1KnzqQikRxOPJshG4e1P39G5nAa8vFH
         8yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568489; x=1743173289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=SahmEXOVnnGOlwqMeSvJgifwEkP9GytJ12YsKA0HxZcr7lY48Jx2NxqTMUX7GCLBuO
         W4xPbA4Gj9eEjj2LmZ7MpBz9Bw4Z3xvsyBuz3N2HGWU8+g9g1S+EhO+lu3hRuiYbKQhi
         4lxmgFJo3xTDTGdXXSKbVO6WB0FEwCb/sIofL7ti09Ik8wnI7JQXg2pdC4bbQsRM/iCE
         Fijk/6Jjpa6NYlSSYhhz2RAd68yW3idi4gp+HptiQ3DI/0jyO59sQnFY9CBVvOqiXpv0
         8rRp9qquwl0YFMet2oh6ubMBSUQS00CW/KyinbJCzCITwRgK+/Wf4tPsbwyT7iJ5tBui
         4+CA==
X-Forwarded-Encrypted: i=1; AJvYcCXO2znDYpu5Rhu3XeKB6YhQk3HqlhfWME0iVvUNn8K5ZIDV+L0oI+ciypS7vc8DwNkkXC5DwTq2y3bqbVwOycxR@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsrL9y4KQtNs/QHtXTq5OKrfTrCJNtv0jwbnAnG/gUpsJJly7
	dx3n1O5JpW8TZDQ/aUwwS/cjRTigg/IA/9aEFWjK74wYAn03pLm2GiOOvg==
X-Gm-Gg: ASbGncuExx3F6vAmogCZYj7SXn9RJQ8qfSH//Qw4gnxqBGdOoXFYw21JnNXuC6ta1dO
	VKePTxPs/PcdbTLadN7My/FxQb7V6UypjYAETenANWH9gqXctkv7wWxSvZYU4vtXU6bkyIr4W/L
	anXX99MDxH2vf8NppkBrL/7h+fDOngbueIOG4k+KottTLsH/CWmZsLYn4yniWJex8A8qi0I3lZN
	912nqqZIsIN5iNa3Uwvve0NhYK2kBz/mWOhtAsYoh6u1pRhaaXT4TBaOd/jantpGnveLB1PvM1A
	hIE8gTru462brSEfqYjso7tEK88cUWygzNQnKjgaSuPxcynTx+PIiByTmNKMBwSJAV7IoB/kOFd
	OIG7XZzKqTyl+3ofOrXTO
X-Google-Smtp-Source: AGHT+IGV1TOlNM3xng9QbH9wlKQQUk/Hqr0UTaR7z33DFcaPZufgeSbUX/WC36jQ/lzEZqtWL3v0TQ==
X-Received: by 2002:a05:6000:210b:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3997f932f07mr3452699f8f.39.1742568489430;
        Fri, 21 Mar 2025 07:48:09 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2533851f8f.45.2025.03.21.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:48:09 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:48:03 +0200
Message-ID: <20250321144804.1435502-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_074811_100909_39231E47 
X-CRM114-Status: GOOD (  12.11  )
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

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae..aa22265c7 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -177,6 +183,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0


