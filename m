Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f2zIaBu5egU2fz0I8v1SkUtexRvT+jWXEOgQa3ZIiEg=; b=lFxomUt/2OKXyeDXrzLXMwZncG
	kazFCz8oJE+wK0eEjQC1kB4PnXionzPi3ntfEDVcmwZUI3V1i0a6rhTDPSbaLfdmUnzF4Wg9ILxm+
	IU5y5cPGA051ri9VovUDdGQXSw00fkQMUrygs996v/6WgWnSKkKfgbseZCuaoN6frN2Ykve7dBF9C
	ZIf3/tZqUEoLXBjjMfyl0FkmBYyZfopq7a1IfNUNDVewmr0hQPK40d3Tv+LPZz6EFWQ9uL1ZHCFh8
	LQJSEYyWmf86o1rI9qgVTvMsI6qlnf03r0o/mYaMICEUydV/c6yKGKMVF38gVrfqs7u2qemckRmMC
	XQQX731Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7gf-0000000BTZc-3oVA;
	Fri, 26 Jun 2026 14:37:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7gd-0000000BTZ9-258f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:37:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c81d799ef2so3124675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782484662; x=1783089462; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2zIaBu5egU2fz0I8v1SkUtexRvT+jWXEOgQa3ZIiEg=;
        b=aNTN2HZ1RjEZ8nNA45PQ42F6Zw4LoBOJ4eflvEudqGqG79vn9TEnRTuPExvRAOrdlA
         RbGeQgzkHDK69c89klteQXNbCcQWvvyRgs3c8FZx3/uPS2K1O2cubBWj39yVUlaQwD2L
         ff+P7y7m6lCQro/ytngVg8Wen8bM3DBxl+/rqXR9ioJtRuFB5do6Y6WOQFMEIdSDxXS+
         ayL1Bjhbp/2TELb1bvkS362dcZ32tfhJYNP3bNtcQC0YRDx1V7TXYHsF3OnwYl3Aa8XO
         Wd+Is30eNAO052Z6ohe3P8CUIelcwC8hi2FZi/arbpz64htwJHJTc/vS9n9Dcpt3Tydb
         c72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484662; x=1783089462;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2zIaBu5egU2fz0I8v1SkUtexRvT+jWXEOgQa3ZIiEg=;
        b=RqZSHjrTUBLJ+B7sGWrSeMKtrkbXxH4tvflyqIhkG3ZwfVCGkdNtLFPtC79vdDcdch
         Evy73gVbk00Zxg6SrgcD2XpfuRCtI5WmUq7mco9V1h+m57nsWeY5PubDwZeKZJoznC3O
         xSRnYei9ECG9FKdPHBYZQ3I8EfVJ8HtbmFomxFSrxDc2Zcia8h7sf5/CPWb3UeLHzFIT
         o1YGpKeyfmiuS+f/EJ8AVholgIip5kGhuAwuVsC/9NvJzNwdozNBihTk5n6IeeFz+Tzh
         93LL2haVL688s8uPYPkOTSuKM5dsfdKwikONoK6a4culHMXvp5hsWaMDfCvDtdjXtnlS
         ML9g==
X-Forwarded-Encrypted: i=1; AHgh+RrMybZPQ7St91ur8YPWncNOzQ28op6/Geyw/5/q5BL32+o2mZZItGFTSPeBLF/SJTOnC9ZfuvEA+dq0TKWySm30@lists.infradead.org
X-Gm-Message-State: AOJu0YxDQx1YpaLxNQCJeZEE5q9VACSnlqYdMG3wIa0oJMHaU7/jwXgu
	JMjwJtuNstuachAw5ccRm04g2cLmeAe5QyfJrXk5briEc5ygjleprdol
X-Gm-Gg: AfdE7ckr+jLgLE3AhdbWaDFh/rUXYZWJGxPL5DX0Nh3ZvYKrzN8gG0CgRrjiFp3gpV5
	in2zNygR5gMKmAvkhaI2eB7ZUNGAV/ePP64CtVZJdsZFAoC7aknA5lJ70kd9vcuzcm/gUKJGMKY
	du0l6ADuEAj81IGYpd3ATU7tIml7N/ItnuEh1XsTRtTlflV3mxJ8V5okjfgOPmuHcOR94Ztn1vd
	HlEdkN8/13gN29QcVFGo8Zg08gJGbMSiCMqusx8HeOWAesgaucBkcJngenPFtyQb84BneCM/N3P
	ijAsB+zTqPVN3RoyM5y70lpVhDAdPVDgJTPDbPIAG754bg8EJu6RLIL7U1cfBtOG8FRuuvLOt1C
	21YGRdnb2wdJpa9v8225cgqgHxZ/DOsgW896j5BpFy2ifNBPkhTgk4AWQwO9mpMBQNNvOudpPLF
	fLiy7g4srpM4fLJ+7V9MkVezuxQUZIDODgL+dhVsDf9iSK95qs4gpr/RFT8o5UB7Gu734zTzh9o
	qfDGSQ=
X-Received: by 2002:a17:903:285:b0:2c9:97a7:f541 with SMTP id d9443c01a7336-2c997a7f613mr2239595ad.39.1782484661576;
        Fri, 26 Jun 2026 07:37:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8e3csm40667925ad.10.2026.06.26.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 07:37:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 26 Jun 2026 22:37:35 +0800
Subject: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK6OPmoC/yXM3wpAMBSA8VfRubaaWWu8ilwwB0f50w5aybsbL
 n/19V3A6AkZyuQCjycxrUtElibgxmYZUFAXDUoqI40yglcnaA52FkVu0RaZ1FJriP3msafwvar
 6Nx/thG5/B3DfD4YteVJtAAAA
X-Change-ID: 20260626-soc-imx8m-938e89104044
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782484658; l=1048;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=hdcucjKaXo99zIVLHqBl+pduwyuwZ1Ak8BLvT8zqF9k=;
 b=/JiTuhoNoGmbRMn7H8kiMgtE+3nCGhdX9twaHyi5h+Z4MushNSaK6p8SzSXEY0Are5Ox6mJEb
 yEATvpMTHfiDWPE6jnnXiBWPtLkIHVRX/wN3H9iNLUv5+gAKIy4IEow
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_073743_538363_0687D3CE 
X-CRM114-Status: GOOD (  11.00  )
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

When clk_prepare_enable() fails, the error path does not release the
clock reference obtained by of_clk_get_by_name(). Add clk_put() to
the error path before iounmap().

Fixes: 390c01073f5d ("soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/imx/soc-imx8m.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index fc080e56f50d..de19972435f9 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -150,10 +150,12 @@ static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_com
 
 	ret = clk_prepare_enable(drvdata->clk);
 	if (ret)
-		goto err_clk;
+		goto put_clk;
 
 	return 0;
 
+put_clk:
+	clk_put(drvdata->clk);
 err_clk:
 	iounmap(drvdata->ocotp_base);
 	return ret;

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-soc-imx8m-938e89104044

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


