Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711B8C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=; b=v2xr4oCQ+6V43mYarsfJ4K7RY0
	8om9fwD9W8x98JnS7AdziUQkDYJS9MNIkncAS9yIYTmMaL6EQS74Ny4a5WayUcJJerisOdn2/xq05
	gbdaEPnf82+rZrWX5y6zS7jv8TmKJiCWKwmFQRaR0CS42mzpyVE3sTaeD+L+PE1PIvUxZWo+GKlRk
	L0cDvODvSkYEji+qof8vbw28bOoo+8O7kczSrg+cgXKuNrQmJ071BTMieFxh22aTXsVie+gUm0YV8
	drMWHBUxPjVTWmJF3nYsW9Gd7OdiLrZPv+1WyhDuOQiPdVP+I4PLYl62Niht3L3BIgsZzVFP5WAjo
	ln59c4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGGQ-00000003SpZ-2C8O;
	Sat, 31 May 2025 07:04:18 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGAH-00000003SLz-2Duj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 06:57:58 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2347012f81fso36253515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674676; x=1749279476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=;
        b=efCNjTsIaSyNmS6mnmj/JcKXGJA0GziSLIWK+OWzLfEOFcwokRbbdWAhIxc5AOYkja
         D+lx6PT/FSqvvbRwde4oCZRpqw4XLdHTUOjrflyyuJyFgyTLFYP4/lu+sDyfpsn3eb/g
         SxSbADrj7VpIob8FpTcanRwgqj8JDsgH82cfFuLi+A6CxIRw9dB3kB0rjnZpWFk5obzd
         bByTvmOTwlssRgZ+p8KdtISaq2vXaagjLpnp6V8FUBRgt6y7Ixb340zhBJEEZCoQ+w/g
         4zocK7akhpxKrc7OvrbKrYT+sf6aNos4iNTy9IwIUjpQh3jBPHW/rA2raX7Jvt+ulL3q
         dk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674676; x=1749279476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=;
        b=oOZvam6fYJTeDVBCZTnCqj4NvRu+RGprYCEWcer0QnaPw2Rgb4H4pwKyzeKJrY4W9s
         kACjw1/1+r9e2AgU+1NQwWqamiVVf2DbE55Y9H7JHKsfd/+wIpotgnsQunL8And3CvZx
         MML6wc5aBZeZnLzjJuDcI8x0iIZSKPXjqbBHBtI7ddRsJogsc1xA7W1JrCbGfeGmOz1a
         vRBEptD/DUhmXzgvArPdwpW+oNBpjN+y6l3kkDu4dZ+eOFz+rTlAVjpwsn/rmlHfren8
         SN+f7vnOFX5pnXQe++6v6suP4H+jQpSXM1E+V18iiijovqNNiDh9i0UW1XukuMDK2IW2
         MqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkkEVSpujsasY86g/p5OVlm15PD7b5tHj0ze8FcSCkuzriCF02+vZROgotbg7n0xCao5kVF9CBGw4peekOupD/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyhy7yqxDEB4UE5x54Ps71aWxdiYJe6rwV+fyMU4XX52pCX/4c
	8SQQPcxucCcalEZVDCqTFKv15fsNz3t4OhD8eqYhA5AHGIJeJdYOJ+ad
X-Gm-Gg: ASbGncuXCaCHI0LlLNEuiQQbiJQ0mbliodXzpNltLPIMWYzinH/73La1BDmMWyQo5+d
	Zbzrj7YEE/CFzRWE8sVEPgmTU7Bfzu3jKBnDuBHVPStpqtvBcenNDM914beRaDDw9tk/uS3AY4Z
	BZZDvR2HB2kavVFfMecA3OkbYveXltpOVgggwwVneIzT+CIwXjRTOXLm6JSsOTuiIb9H11eYXNk
	AhBOIr7CClJ4KOSSXLAkLMqpYTlVKisSqY9aa9vy+XX4LFfR8c7nRnVaI2n4WKHVuEBVCNt/cmq
	alb464S/mb6+5rnycXsRZlqIJIa4B/8xK50=
X-Google-Smtp-Source: AGHT+IEZEi9SjcI+3gdNIx2vN1L8Jdx9YJrveBMTkReaRTGrreg8M6bTR+tIvp8XdcV58kFMe1FPxg==
X-Received: by 2002:a17:902:ec8e:b0:234:e655:a627 with SMTP id d9443c01a7336-235395d6680mr70877965ad.35.1748674676483;
        Fri, 30 May 2025 23:57:56 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 14:57:27 +0800
Subject: [PATCH v4 2/2] i2c: imx: drop master prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-i2c-imx-update-v4-2-bfad0c8fd45c@gmail.com>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Carlos Song <carlos.song@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=973;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=kQKAVOjABu4DOdsXyMCztP9egiM+XBu9UnlB89Vw2+Y=;
 b=pU3nS5K/z91d8OcdBox2f63zfxUhxWUPLtlrhjoZVy21l+Y9Pw4XxYTZL8coyx6XZu9rmRwCT
 DefaDA6YghUCOJT2/YpR3id0q8qHsCsTy1UXDct+TsQiQB89grxhXZw
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_235757_571657_1ADD8012 
X-CRM114-Status: GOOD (  12.16  )
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

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5b276e007292..d85adfb73bac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1687,8 +1687,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1


