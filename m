Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426F5D31768
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXGcEW/yKJ2kT/lKQoK+ikV2KsFoei/F8kGwDlFWQO8=; b=GICtJVKuUXqzkHKcV04fv/5S/q
	V1bvLF5Uv07vx1fRNuubF2AOtQOrj3LVAMThFS8dDxW3PHkOQ19XL1I5Tm66Tu9Zafs7ocmd1ceGy
	e+EofZLLsXe+6j+0iSx5Xcq/zECXvI/6WWJletoMWcFkp4hcsdZ71FDPbcxSCSER9m6dGOkuLH8/L
	S42u/TeteUpYQME3VuIt2e4Hfy8yzG/gs3sYIDzAGBE385qfb33MHPgw15tDlGo5zLkQ2rkZbQgFZ
	11K/RqCcheFdpLhHW8etPNO1p5A2dIOSmnWhRDImtuLVjnTU8hjURluRtxdvn1JtgZZEz19Uq5lEq
	OmWRYRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MuS-000000008fH-3IuC;
	Tue, 05 Nov 2024 17:00:04 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MGC-0000000014f-2fTL;
	Tue, 05 Nov 2024 16:18:29 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b158542592so399391985a.2;
        Tue, 05 Nov 2024 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823506; x=1731428306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXGcEW/yKJ2kT/lKQoK+ikV2KsFoei/F8kGwDlFWQO8=;
        b=dUmuwXRN9J+ycj36wdL3/tbipuGmVajN942zZw0H8pVa3g7Vwr/M0s2LEcoH9h50oV
         MStB9bviSuVT0qGSiLGePXBawW9sEXdzpAkFE0COw6FFxDhwr0zKMInMnmBl934vwC6u
         yk5KskiefNUJlBfnpE4zwqdJA2Zg/TnSg6aqet4bi8femzN3rbcCAHe/pHXECFM5I66p
         O6TAgtI6M8K+KsW2h76hsh1lIYoRTIgJHnduf85QmS9gIysQSAqB27OdPpOtblzOU+sg
         EZfrUjAVtFrkYA6KE0wlAtqGU9KeBs/nuumzyRyjCVoA13Lp8WeO6Ur36R79uPXQkZ3j
         RcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823506; x=1731428306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXGcEW/yKJ2kT/lKQoK+ikV2KsFoei/F8kGwDlFWQO8=;
        b=VukY1H6qjwHJilgN1/GgozDrqRu+Wzl+tntUPTR3pKh7hDmwHdrpKNTpN8fPdYlfHN
         Nyui/qO96E1y12X+WMaD/MERw5CrJywF00CR/JZ7QxjByN7bVtL8yWmxL94OIEf08XH7
         m8DE86AXz0WFpvoXJSxEVFp5PGi/bl7zBWA/LmM20pNQSW4yIJHYFDVQh8abk3Eo1THE
         emRTd6syBNvYAlaunZKudtpU5ldjyblPc2hAAnnHYhWasf0tmRyWYQOXmCKmqn5uH5lR
         rkfIUwThA1OZfgX9/FE4yxym/DPYkYlCr4A6eEGFdHPi+hrzQgNWO4KPtqHBkCukQthL
         1AyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfDqPlFVct4M3XifoimrtnCbcGgzAogJ2O1jd0CvuOMJrxogTrpidcNfKh2WgWWlZSG6qtw/zN85+akJvN+cI=@lists.infradead.org, AJvYcCXne2/g1PEfqw8ZdNoEMOq6GDfs9vqXnBhuiCT4k5CVrOXY3/IoQXZVT1arHlWUzOB0bDMfn2s0rxAwr+Puga1Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyieEqH4D4rfTUz4miSabdqn17gurwDeNLkyAbgfcEPPsPZWxtf
	9x9lkALjxA36Fb+ZLtIwAl2vmn/o9Zz7Vw5Z3YzzT1XN4EnhUBqw
X-Google-Smtp-Source: AGHT+IH/TVTagDdBicU9q7qr8NhSf15bW+aAQAdd0pCb97OHGnCjFbeCAMwnLUwjAeS4tg6AWJHmHQ==
X-Received: by 2002:a05:620a:4492:b0:7b1:52a9:ae15 with SMTP id af79cd13be357-7b2fb948de3mr2387592485a.9.1730823506107;
        Tue, 05 Nov 2024 08:18:26 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39eb14fsm538010885a.7.2024.11.05.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:18:25 -0800 (PST)
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
Subject: [PATCH v2 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
Date: Tue,  5 Nov 2024 16:18:19 +0000
Message-Id: <20241105161820.32512-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081828_696098_AEA3F441 
X-CRM114-Status: GOOD (  13.18  )
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

Add check for the return values of clk_enable() and clk_prepare_enable()
in order to catch the potential exceptions.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-pxa.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..0ee6fe83de40 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,9 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret, "failed to enable clock: %d\n", ret);
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
@@ -1560,8 +1562,12 @@ static int i2c_pxa_suspend_noirq(struct device *dev)
 static int i2c_pxa_resume_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock: %d\n", ret);
 
-	clk_enable(i2c->clk);
 	i2c_pxa_reset(i2c);
 
 	return 0;
-- 
2.25.1


