Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46D71048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 01:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yacvo8FTXmtUK6kvMPHtNgDomN8fLaxrnZj3UqvDkYk=; b=gmqCS4JmCO6Jzl4vXTGFIO7Wc9
	fV9xMOod3Z41tgn1Ipkfb1lByS8iSyy4DNkAsd0bLCaJT1DIk16foljDFrU1L7R6xr5ZIxmnuiSgC
	rO4MKbeIytZe79TtEPdfVZxkAZ5JPM7P/DNTfTZ2W7oyD0QU3BBB+z/X16CxPLh3IptYNff3wWkfk
	hem4X1DyixV0BBvK/r1JUd3w5IdMHbiptSRnA7tqSpi5Hpf72ZZALN4KRr5siEeqTU543bPNxCNCn
	/9PV3GCWthqlRqEqlSnKJRg44EN0QCp6PFCBfTA3ez7BK5DjMpt7sbSQHx61RPswIfajTlyPWnf1R
	HozhO+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9Ck-00000009OWH-3BZI;
	Sat, 28 Feb 2026 01:33:14 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9Ci-00000009OV2-2nxi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 01:33:13 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso1972899e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 17:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772242391; x=1772847191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yacvo8FTXmtUK6kvMPHtNgDomN8fLaxrnZj3UqvDkYk=;
        b=bMPFuyl7MuDvLFgD7ZKxjb19ja1zz9O/0/3yDrq821T/I83g1VhWta5EUymjpGo6PM
         JQ9JOlOfxQxr/hOzXHzg5Rwq5Iv/ltdEbxIO8KkbXDYS+qnzBM85MsuOVYVGyC6GB7f/
         jMwRH22W9DxqZYCMFvNMGLa7DK6iWQjvjpZls8hYxTzUs+T57cLNzmnC7I81GyqLriao
         +wGL5hab8uPBl1lRPxytv3InFxtnWYF5V/Hw1ZL5PS2tfKA4ZQ+cUOfnKXNINd15QQj/
         ViJLFMeuJ30a/eG2x7p9qp8nLwBBWXQTer1vCOKGJCTEwiW9wQ2GdX/yVsQF4rZjrfwP
         rq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772242391; x=1772847191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yacvo8FTXmtUK6kvMPHtNgDomN8fLaxrnZj3UqvDkYk=;
        b=d9ja44mwUhhufvr+7+LWLXf+rchB6IOoFJe44hRNVApf/1UvCBB1haWevjRrkCLXSA
         GOLgZjUbrHYT45z7+xHCAmQ+GpFekr1bZd2lWqI6POAZ84ahJfaSr5K1YDFEjCvN4uxx
         QO/RKcASRQq2A7jILshLkPjJMI9iFvWsVZ/qilno9qzR/b6fXeAuh8KTNaaLXNNDMpc8
         WjfHG871e13+ZDS5JIKHMg70zpqETr4js81EomYa7jTdP8LUtBSJJ7O2xG44LpIrwMt7
         YzRNW4KgsBqlJQU1RLmDI7PhrSXNH5JisKC+qGqvYQygutFVFCt4zX0ByidqU/b0hKVw
         LjNw==
X-Forwarded-Encrypted: i=1; AJvYcCVdToCiPm8eDYn1u9HqujYYjOFH+NadpjusnZ76jpB0pE0hwbxMAOd5iPrUuEIGamKXxfSRAeC9lISefHfJgXoc@lists.infradead.org
X-Gm-Message-State: AOJu0YxXQ8BwGtlwzoMtIUAwsF3NybtjMW8/jXrYGyB+3F3tpVb5QVk9
	9Wwi0MJCTgBIlaOwesI+DTggk3haQLZ/v3gqR5wS7Q3qGK5c1qhEiLfUKrW09w==
X-Gm-Gg: ATEYQzxPxZ+1ulxYczfRJrTv4XPjDk16yQ1oT0Q7H/PmUv+GxZfbee8AiwZvhaA9Cl5
	9SQTmLZ51QJlE0zWJ/F6j2Gq96SZzYwtfjkD9aOWcqZ6p3wbonG+JpHcW0vbwF04xwuek2m8yhn
	SDDc+X5I/IsEZ3DVxk5mYIiPS4YcQLwNN914GnVsYIwRPfLVwYjVfYENX55yGbESCj7s7c8UXET
	puOQTgSlww4eWNnU7SXJXxoTQsbu2wsuinQhZaPyI3wUW+/sle0K/CYaW0rERCY3ic8MikwiMXt
	ntfsNl84piQhs/CP9ow1aArR7Hue8cnwdRFuZ7wcoaZFj5joKB4/5KxlVlH6xDFVEHhWFPXxdjP
	kOnyQdpfif/aZuSQwNX+YD7F/m7juAuAduxkow7E2W3JR43GZaovbmVk73F1H7GaL+uDSpByLFN
	3KBfCguZ/r4saU/zR4pUjgZ7qJ9Arq8M0TnBf2oZjwFxR+lM9opm4LIIELntKbCWRTvNb4
X-Received: by 2002:a05:6122:4d85:b0:56a:8c20:2d9b with SMTP id 71dfb90a1353d-56aa08dabd3mr2771676e0c.0.1772242391379;
        Fri, 27 Feb 2026 17:33:11 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:2e2b:437e:ccf6:b644])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7a8sm8950597e0c.4.2026.02.27.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:33:10 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] ARM: dts: rockchip: rk3288: Remove rockchip,grf from tsadc
Date: Fri, 27 Feb 2026 22:32:57 -0300
Message-Id: <20260228013257.256973-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013257.256973-1-festevam@gmail.com>
References: <20260228013257.256973-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_173312_715852_52EB7494 
X-CRM114-Status: GOOD (  11.67  )
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

According to rockchip-thermal.yaml, RK3288 does not require rockchip,grf,
so remove this invalid property.

This fixes the following dt-schema warning:

tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[53]]

The rockchip_thermal driver also confirms that grf is not needed as
the rk3288_tsadc_data contains:
 .grf_required = false,

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index 4e5e7509de48..4f2c048aee54 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -551,7 +551,6 @@ tsadc: tsadc@ff280000 {
 		pinctrl-1 = <&otp_out>;
 		pinctrl-2 = <&otp_pin>;
 		#thermal-sensor-cells = <1>;
-		rockchip,grf = <&grf>;
 		rockchip,hw-tshut-temp = <95000>;
 		status = "disabled";
 	};
-- 
2.34.1


