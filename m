Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA5D31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KmtWlz91TJSK4h5e5cNQt2Ayuv3I7VTg5EZ5rZ7D4Fs=; b=DSmtZEiNMD+EsDeYshDreRUvKx
	r7mAtepOVzfoMeIQimUG1fTqox509xnak8f5kP/cuhCehd7/H8SAJF1zQWEBgUA9E7kYKiU2GypoI
	sEX3e5XSdzEd9QA27GgTALI1/VBXgJj5aMhPVjuHsgnz9SqHt12dArOzOTnPFifVhR2PwNO8Vi66h
	+qyr/bSMekoff3LDmgj5WWyEWBHQM8IzctmCShyTFG28rCXpLj6pA/UBI9ahGpIHj7RMnY6XpI2UU
	Gu84BHybJcDH6x3bWcl5HPdxdBQbF28jaUTjwlFt6wP+d5lqabQbR0+x1ZripdJF13p+xr0tqb70p
	I+56cXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Msm-000000008QG-2u2s;
	Tue, 05 Nov 2024 16:58:20 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MG9-0000000014N-3tvE;
	Tue, 05 Nov 2024 16:18:27 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7b1539faa0bso363693185a.1;
        Tue, 05 Nov 2024 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823504; x=1731428304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmtWlz91TJSK4h5e5cNQt2Ayuv3I7VTg5EZ5rZ7D4Fs=;
        b=bj42NX8jhhDebJznLM3bauGI+J6VQ6rWz0PeNFpoXQNXbhH9WFQqVziedxbh5Nz07t
         e5nPMg82nrpyV9yyUXrnJJ08R1nd/LzqqoAIE7bUSdObMKNcnknOUgdb2iCftpMcdbMU
         m2NiRwdUfSA1KaX/kCEVvmlq3fNfUseoNQsDes0g62FE8+ySEdGIij/qj5ClAJtV7x3K
         OHVni4nYWMD3KP/VGweNP5dt0fjYr7lBC45NBB6Af79ObV0qZxGXOVItZz3/5DgZYSLV
         hSMang0RLFPlyjOrYK/bb5eAIzgXuik38FnmJVujdCaSAmL4es2Udc9vy9vUB7sMW3SW
         ry/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823504; x=1731428304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmtWlz91TJSK4h5e5cNQt2Ayuv3I7VTg5EZ5rZ7D4Fs=;
        b=Mtvzwchf9KrYZKFuGEVXziI6UZfAfEoHUcKNi6m9FkWoAGvi46qGISmXNzcIJ5VaGT
         txcQWPrG3URN1kbsmEHyu/IQ9WtJY1SBvu6neJyMhwLFjH2/RGWZv1JV+sGTTsg2uJlw
         vihjqdKpKlyvmKFuBmj46A3RCw41fP1Rz9rsy9Hu8pXHA7ITxON5ffTU5ievRPJTPIFc
         LeuO4CKki8UiwRsBcQK4re8IAjshy0qzei7oQQems116R1qCacx8B2EAEUpHePTTABTj
         tOEmF9071771SK4AMO61eZe43WEHk+hxl4tUFIuywW26u9miCG4m3TKaqM6P4+vl+Tcf
         2RBw==
X-Forwarded-Encrypted: i=1; AJvYcCUGQ25gqEA7eD8yuZj+oMLbERgyj45XwSju3BQp/TIuVZ/8VKGELs6SyhkbheTdHx1nZxmvYCkZWiZPt+UnyzPu@lists.infradead.org, AJvYcCW0LGo+uJL7wHKQ/PZccV60iD3/SY9+IukvQuegISGmPIlqTspVuExROG135Ll0LamYxVC7He87k3QOzm5GIFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeTwaO8hE3D6kVnreQzUQjiLMZ31g0Vhrx7dMuV044UCCYwW8b
	WpTWgoLUofko4agYfHU0vkuHQkzIF2wE1iCsGikKvfrge+Leq509
X-Google-Smtp-Source: AGHT+IFeexANrtepr8tFxuvgULw0OpAvbMZOzidMyaWEF29zaJWbq8+xGIA3j9ZNrjvW8hCKk2crvg==
X-Received: by 2002:a05:620a:4608:b0:7b1:4d3b:d618 with SMTP id af79cd13be357-7b2f25529e5mr2568975885a.57.1730823504072;
        Tue, 05 Nov 2024 08:18:24 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39eb14fsm538010885a.7.2024.11.05.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:18:23 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	wsa@kernel.org,
	manabian@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2 1/3] i2c: lpc2k: Add check for clk_enable()
Date: Tue,  5 Nov 2024 16:18:18 +0000
Message-Id: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081825_986794_A62982F8 
X-CRM114-Status: GOOD (  11.59  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-lpc2k.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 9fb33cbf7419..0fe7d4421a31 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,12 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock: %d\n", ret);
 
-	clk_enable(i2c->clk);
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.25.1


