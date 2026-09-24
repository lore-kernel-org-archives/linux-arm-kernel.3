Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE1AC98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCxRdNlieCfNGhjYZk26pUpqaG4f6xkrRSGT2nKsEsw=; b=QAAY/Dv7oMerzR9xWuZ4oBhf1w
	YObwGidw5WCuAU+Lgnm1/oBdOI0KhRMOAFhiG9MZEzIbkHbyri7qHeXLFTB2D5URXqTDVVeGeZGgz
	nhL+OPwU/WmiP9Vz4ep9JEA4Qa2deiDTKcYCAh6SWzxX7GINfLbn7KEwMZom8I7GPtCtaqBoij4TQ
	URPo4AMsY+Y6h14sEVA4JVkbYM0EaBreqSA6c9aa3aFpmEqfMxEIzXqNmGEP66sKBGxwVH4Uog4hM
	89bf6tsduMQnRNzYVBKXpQz4S6UXiqNt8tlpfhcMZk8jII9SJqmjTK4oklv64AZhmsrdXZ4B0jzb3
	b4gwkuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYQ-0000000Ar3E-1k8t;
	Thu, 24 Sep 2026 11:23:54 +0000
Received: from mail-pz2-x23.google.com ([2607:f8b0:4864:3b::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYH-0000000AqzS-3Exj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:23:46 +0000
Received: by mail-pz2-x23.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so408174a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249025; x=1790853825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxRdNlieCfNGhjYZk26pUpqaG4f6xkrRSGT2nKsEsw=;
        b=TrxC/5I+pKSdMMdsKYYHXGiqCMAWkKXnnRsEROubOMiFDXZNcjkYsGCToW1E2Y+KiG
         UGrlUtR35IvQW4+hTbzzIv5r88uPMur4H3EqgOrqiSl/ipid4kLVUgqN4iLdnDWmhJVQ
         rJfwHLo3zZ4QVgtvpGlMgmRyTWQahgIv+ADIbytFgH3nH+xY9vYJVMChtB1KQlWyhnnd
         LxeX16YHymBdapM8iVMuJcAAHTpwkpoAcTop4KM3uOFQIAryEXcopcLS60aetuAh1Wo6
         ebcdM9oWwo+QS4zMcLmDorFmTg/xUggZGe7ZSrD6ZNm1hX1+8SCV9DbO2koKpnkR9Xyg
         KZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249025; x=1790853825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxRdNlieCfNGhjYZk26pUpqaG4f6xkrRSGT2nKsEsw=;
        b=ZLUG0KUm32XWmpPXfg0zzs77gco9iKfs/nhmZyciqu/RyyF6YypRAfZyUTgLUWxu1n
         RgjOt55pyoIa7FUMrXGMfiN9F+e32KqzvMNa2n/6k7AciiPVfUtBB0SgO4epaSQJTPiw
         EX78UOCWvS5im3TAAROtcEP8YC58B5NHQqa7GAD1E7VMHNlpURQ4dDzQrhELGsnXF5Z1
         Ki7y9ld9Srsr9nvvdUzJydiizS9n7wzHVxXSSk8Ll971nM0RLFRMftzFnTCnpMiIDU5G
         sxc7lUi9c5lUClYiALtzA9mc7HBSrZDLHBS687toBCxoN5LHXmvYId+LSO3VGOifTbiO
         RK7g==
X-Forwarded-Encrypted: i=1; AKwUvBw26ANLTk4Dl/Axk3jKqYA9VVyf/IkrOrVDr0veQGpEhMV+CInIDORjAwHL+msehG84Sy9R4+L1x+Qvl0mvJPJD@lists.infradead.org
X-Gm-Message-State: AFuF++k3D2h1OO7+cGd7u2JVzmpfx+Acb9rXNOOys71YETS/ssBxpIZs
	hG3XL1T7Gh8FQ28eH1WM0duaPPa8QMLErRAsp4LKM0SOILsWtPxRZGxh
X-Gm-Gg: AYBFou0vJXkTMIv5a5fVWUp2oLoXwKsXgLK6aFFq8R+cp+UD36ZW5ZweBG7O4X1uPUH
	cgbzNMU3LiVWqTK5i2dczr2HfXa697P2M94RnzQvjIE4e/jRdWsewmAnJ1xzhN8SYxnaYOCM1Sh
	g8yRK+vLJz6BVz0QZuPSKwd2lkY29zRbD09Mz1Yx3CsTizF564Z7dvPU5q/BajsrVtoNCo/YsIv
	/GfxPIs7v6RfnU4+Ruj739FgoXywi8+LwUSauwPOnDpbDJ5mUUuj/FUaB1EOn2VzGMe/tm+lfBW
	yoM2/GtylPePnwaupBR2gpjDIcKRn/Bwn2SJTyfKulw6tFbTHfgjo6W+B1lbf9QlXtKhrBDHt1+
	UcxCOjBbaapma8rsLm1v8EThocokpdkZICxdx7PHcJZBcvIfiWH4hD8p9CuVrG/7Yqa1mGJlFHZ
	UjnZ2XTBJCso/bkaJZFFOJEfFr5s6askD0rT1+sM+PLHxmBBy0kATGB2I=
X-Received: by 2002:a17:90b:38cc:b0:3a0:9564:2d3c with SMTP id 98e67ed59e1d1-3a09860e008mr1308139a91.8.1790249024756;
        Thu, 24 Sep 2026 04:23:44 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 1/3] spi: fsl: unmap immr_spi_cs on remove
Date: Thu, 24 Sep 2026 19:23:27 +0800
Message-ID: <20260924112329.1566051-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_042345_924145_DA7EE84B 
X-CRM114-Status: GOOD (  11.73  )
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

of_fsl_spi_remove() does not unmap pinfo->immr_spi_cs after a
successful probe when CONFIG_FSL_SOC is enabled and fsl,spisel_boot
causes of_fsl_spi_probe() to map it with ioremap(). The probe error
path already performs the matching iounmap().

Retrieve pinfo from the platform data and call iounmap() when
pinfo->immr_spi_cs is present, pairing normal removal with the mapping
established by of_fsl_spi_probe().

Fixes: 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO descriptors")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/spi/spi-fsl-spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index e45816ef7b65..665902703973 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -702,10 +702,18 @@ static void of_fsl_spi_remove(struct platform_device *ofdev)
 {
 	struct spi_controller *host = platform_get_drvdata(ofdev);
 	struct mpc8xxx_spi *mpc8xxx_spi = spi_controller_get_devdata(host);
+#if IS_ENABLED(CONFIG_FSL_SOC)
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(&ofdev->dev);
+	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
+#endif
 
 	spi_unregister_controller(host);
 
 	fsl_spi_cpm_free(mpc8xxx_spi);
+#if IS_ENABLED(CONFIG_FSL_SOC)
+	if (pinfo->immr_spi_cs)
+		iounmap(pinfo->immr_spi_cs);
+#endif
 }
 
 static struct platform_driver of_fsl_spi_driver = {
-- 
2.43.0


