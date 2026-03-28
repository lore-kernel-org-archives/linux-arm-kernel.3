Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916AF10F3DEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/qgP9gqmMpp2U/rdBQhHtYOkT3qsy2wmqdnlrMFSgg=; b=Qgi1cOtUpHTZG3kA0DONhaHCHr
	9tjenIYoSyPVYAe2GuEUxUoffx5FS4+dmu097eMayn192211fujnjpMvy3ZTvMi3v9ezMmF/n6C8o
	0dPNYkFbOLznksqtJVvefGyeAklF8XiaihWy7ydNmoG7uvT/JHE8Rg//+FoDBUyrScLwtVSd3t14g
	RLcMvKyHhE3fEsDq6wXpfu9rTbXqr/2HOMMYq0qXOBiY/SYYMEyzIqagB9JRt6wkj6MVkvh2gfxsc
	UJ15fwLI6nzYzWIDvCFTzNklADC7Uy8DoSE1/dANtq6PKLYrOdlif2yEKku2sjMh6ZChxn8DnDSrA
	PguOTrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WC0-0000000960Z-39Ad;
	Sat, 28 Mar 2026 16:07:20 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WBu-000000095zA-1TAu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 16:07:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2154712a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774714033; x=1775318833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/qgP9gqmMpp2U/rdBQhHtYOkT3qsy2wmqdnlrMFSgg=;
        b=aA6DZGaWI7qnSCnphRkoSBUcBRjKkKlmbOGSJLinTvqoBwyvIR0TbepcW0mW89ZdGC
         kk22XVu9O4dva63vWDfziIawNNfxu8XXDjmVmFnJBQwmnss+ln+M/mRPWFlVd6wzITuu
         IZOKXIFIIsxtBWpquqSB3MTqKaPp5RyeB4WedzJPU82IM3zzsx/81EB90R1u0vlOd/Pn
         mh7k8mHt886VRyWFgTYE8q+7g+OSljlY7BDd38bWtHsDYCVFMBpb52HH+swSUbDFS+6o
         jzWniM14X5LkB3HpBR022F4zSHcHxxha1VXoOBBL+pazLWR1o2w6YGRpEnPfGI/8WZ+S
         EvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774714033; x=1775318833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6/qgP9gqmMpp2U/rdBQhHtYOkT3qsy2wmqdnlrMFSgg=;
        b=au/ucZqxEJvllLatLsIlt2N0diUbQBwtpSEy/ciQ6c+a3TGEjgxPPuS8y/flx+5N3i
         2iISYIs0vm3vTK5pkcDuB5SQJ5561Aco3Q5D3AsrfC+Y6xfGq2vxl46+I4cHVGITiHbx
         k2lYaBuiArxgunwvfzU1CHqeDOd8j+3XUtCJhprXX4a1YWQI22lSuPcW7V9KvlVfV0ip
         kZhTc+a+6hCyBfB9LU6JsVH+Eh5XBsKFcq+TmnMTUhHCUYo3t/xNSmhguX/G2vzm1id1
         hvYFzdTwDuIbZkG6f7HkbXzCPdLPMD6D1rc+IlAFSLR8+FCXzFPb54OA4pbvM4KsxBFC
         Am/w==
X-Forwarded-Encrypted: i=1; AJvYcCXwglAZ+tsnYGkAwEXUVqfCNhBtHc1qdeXIgXebBjkjPUVQmqzuc+8JXpuuucLKwzlyD7iPOIgpXiRa+q//qYBk@lists.infradead.org
X-Gm-Message-State: AOJu0YwT96KWR5LWJt9WKSPk6ahTvvYL9K7/w/ObXkD05pRFa3ue10FB
	6bMx61sWIUJewzZ6nq5acooJKI7BEBj3sPJXe466zfDvsF9SefOSoiro
X-Gm-Gg: ATEYQzx+XlpSiB3tquC1hPOdOlHRSaaxu2hE9RwjTe0QoOga//ffyBE3Tln/jKTSWb4
	QIhyAx5xyZyGY0liw4j9jBuDppxI8DVrtewmOe1FUHqdOhIDafRDRyZKHvIZbh8T56RLHgJDnXC
	sYcX7oaY0JurskLNGHrK9XBvqdWgHKxu0KOQKXtscTy03DjxhBwEkP8Av9duE7iPMAgpC7RJJNu
	9kDYBgjVaVSVOA4lf8R7syUS84yUvUaFhY96vdXWElCAVQuZUNEjl+bJhqaGgSIxhERS7qoft3H
	7m23DnGVwvVIn5If1cldr3sgF3XWXeGT3TbcdKud0smqPUQx9JD00aTgVjYEyWyRDKNvKwdQlhd
	yfYolDMZXAWIhf/qc/avn0HNQdoHMJvusgDAdV2ob4S8y4AxYVQDy+iSeCOEplfYSDh1POpFOJV
	VMZ+dbaCoi7hK/9k/w7VCAn0hePjZKSOSTlFNR
X-Received: by 2002:a17:90b:1e4f:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35c300060damr6402909a91.12.1774714033225;
        Sat, 28 Mar 2026 09:07:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec27da0sm1988140a91.8.2026.03.28.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:07:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 00:07:06 +0800
Subject: [PATCH 1/2] spi: stm32-ospi: Fix reset control leak on probe error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-stm32-ospi-v1-1-142122466412@gmail.com>
References: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
In-Reply-To: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774714028; l=1079;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=B2M6TmSMVm9Sf6C3C9nuArJeOUQJv3qKC5BIO5ffMLE=;
 b=K3icUELnLZRMgZ/cPYJO9EzPAK2OMYHOCr7hyQOJnzEc4OMrk33Ar+ZZkU3slL5LvqPmk2sLA
 mJOwZbw8vXjAsa1nv9Kt2X0dyD1JJSNopgTjyIp2Ct8Tin+OylPlzR4
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_090714_397039_6BE9EE60 
X-CRM114-Status: GOOD (  12.73  )
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

When spi_register_controller() fails after reset_control_acquire()
succeeds, the reset control is never released. This causes a resource
leak in the error path.

Add the missing reset_control_release() call in the error path.

Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-stm32-ospi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index acf2d182e8b1..52997c3f7174 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -960,13 +960,15 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	if (ret) {
 		/* Disable ospi */
 		writel_relaxed(0, ospi->regs_base + OSPI_CR);
-		goto err_pm_resume;
+		goto err_reset_control;
 	}
 
 	pm_runtime_put_autosuspend(ospi->dev);
 
 	return 0;
 
+err_reset_control:
+	reset_control_release(ospi->rstc);
 err_pm_resume:
 	pm_runtime_put_sync_suspend(ospi->dev);
 

-- 
2.43.0


