Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B083C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=; b=gHYZihWux/tlkJ9SbWW6XfB97V
	bnuXEr3JhenvTaIZ/OqkFSgbrdb6QIuzp+m3XaFRyyHDurhv4C2MmGLlgT/4wpgBUqG+2YazNG5hj
	onQ2RMxsfblQixUYs+NNqMCCHm+FGWpJHnyExbpujVNI4/i7uzHGtMMOJa+FQSCUHxmHN89boaWwP
	PMdTppWwR9VX38ncXrZG3/ryGa2PdoTqtoF7afbyGjsOuq/fZLIPSl7DDrgyhne41jP4FwShxzIa6
	ICU9uAhXXtSdCPxWwmEZVZPYQo+xKyjS4jT1Zf2Xr/3dbb9wKz6P30qVT/jy0x0MacJuoyKvz9CJD
	LSATPmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Da-00000004kJr-3lSi;
	Sun, 06 Sep 2026 06:19:06 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DX-00000004kHB-1m9r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:19:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1921773a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675542; x=1789280342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=;
        b=k4UCNb3a4k82GMXF0lz/wWZ2IT12ZpkH1/PVQ23MiXoJdQZ1q0u1I4LM7SfU61ilk5
         eVEFNGZUJsZEqE0u86MkCxiRemKDA+XPuVVhq0c2tqeeNcS0sz2dsI3TXGpBfW6jLQBi
         lKOmRI6sSEFuxzVvapDRxzDwa+pSFbX0JLv+MB3EW9Hq1bYa6F1U6oUBY/bDcLBjemCE
         vUeK8Y3NOOX9qrzLRw7hMIMNnGHaQBvgux+zarXh7SnptcyOp1cVgyJ/bstUev2wn77y
         eLp8xi1ZxFwiU/z9Y0tn8qV5R6zqcPrITe77Nc7A/oSGQevEGI3/Gqy1m5EnggOX9I6v
         4X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675542; x=1789280342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=;
        b=GAWiRCFWuBW4/FnDV0rA2WriWgmpz9ZgLHLoXxCG0+N5Pg5nGQevLKerkVbNSuYJbU
         cyhS0E8b/s2sjSR5pbaXgfff0kdpjrTU8WQ5CRgFR1pQhlMHq76NBXwcqFVv4NhCfwkf
         3TwkwDbtgi97u2h6W4hXro0mZHtkgEqVTc/mYGsYkfbk4cRjsFVCrwo6PBj7bbAGiLMb
         55dFhLcO5dMyrBS81ezMarT4mumQTpqIMGlyZPVuO6JdtOg3WSA6A8gb5tBwdRrjLWaP
         FppyiDVJAz+Mr/c4KJMHll+0OmUEg3Q2qciIvHzOVFbuOStRjg2d/cGi/K4L+ZdGK9dT
         EtOw==
X-Forwarded-Encrypted: i=1; AKwUvBzIdxdMuKvw0pyt0w539ELX9GAFfU/ynFCQMxTOFcet2Lx6IvP7QH076tvhyReUDVtz4jCSkiE0XxzHy9hg82Al@lists.infradead.org
X-Gm-Message-State: AFuF++kOJr+KTt/D49btQHH3gn98wivZomMci+96d1R7PcqIM11hIITu
	sf/d9R6UotjEQ8Kb0a7cDqGF8S8M0Tud79e7Gf9PdBd6ru04gFKaWlCK
X-Gm-Gg: AYBFou3eBuDhLtQ8NGe2dpHbNcSs9MNzWbP6NtJWRaydZrndE13+t4zxAn9C3d5ZeRQ
	Sv8uqPxJVoD1p6MpJsBr6zZcwT0hPgEp7Yghn3RlFSy+nxtQlPxs5wjwASbUEXQeXnivYN9sVFp
	n7hDYfLpLFXgwhKFRQ0Ypz1mK9EBKDXBREa5C7LFQrPjeN1r5C9aTiyTlJYmC3setnZergYznFi
	4jbj0miuFPuOvOIKUqkzPnWt8BVjeDOAEFaRwkXCwIcFqa6WyGII/nSV9/Sq5Qi2KolApa4+UJN
	F3WvT2ICxPciqO/K2iy/qCWvBwcolVEVjzgYqCSOr2Ffu+DHHOGsECu26Gj1JSSD2pQvjQMBGg2
	qNPD2/lX85/Id9f2IKpAnPXeuut7HlYCfO9TjJ0h0VjrCKsehPEt5cmJs+bdbI/exJbGu9W8Ljp
	xmNfeLl0dWthfqZ0zCxb37p1ZlCOO/ItMuUehZW07ztZXUgkeiFew1cVOL5+w=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr24578243a91.16.1788675542370;
        Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:53 +0530
Message-ID: <20260906061755.5103-5-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231903_465458_475F321E 
X-CRM114-Status: GOOD (  14.36  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
-ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/devfreq/imx-bus.c         | 4 ++--
 drivers/devfreq/imx8m-ddrc.c      | 3 +--
 drivers/devfreq/mtk-cci-devfreq.c | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 49798f542d68..dba76d8b9e5a 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
 	priv->icc_pdev = platform_device_register_data(
 			dev, icc_driver_name, -1, NULL, 0);
 	if (IS_ERR(priv->icc_pdev)) {
-		dev_err(dev, "failed to register icc provider %s: %ld\n",
-				icc_driver_name, PTR_ERR(priv->icc_pdev));
+		dev_err(dev, "failed to register icc provider %s: %pe\n",
+				icc_driver_name, priv->icc_pdev);
 		return PTR_ERR(priv->icc_pdev);
 	}
 
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 52beeb5b7d65..28d7c595fa17 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
 		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "Failed enumerating OPPs: %ld\n",
-				PTR_ERR(opp));
+			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
 			return PTR_ERR(opp);
 		}
 		dev_pm_opp_put(opp);
diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 4c22be728f6a..bda788909887 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -364,8 +364,8 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 					       passive_data);
 	if (IS_ERR(drv->devfreq)) {
 		ret = -EPROBE_DEFER;
-		dev_err(dev, "failed to add devfreq device: %ld\n",
-			PTR_ERR(drv->devfreq));
+		dev_err(dev, "failed to add devfreq device: %pe\n",
+			drv->devfreq);
 		goto out_remove_opp_table;
 	}
 
-- 
2.43.0


