Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE15F3C9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5DXCfdvJ1l3iaiyIVD67Vr2Fhjn3yvdCNDjCKNCXps=; b=2TgtX7HoXsd0D3h2zG0xXB5Qkx
	fr3g8OnnQozfDl5Vp+Iv63RoNyFiVZtHipK1zS3E9y9UXDF4UWr4vzNKTbfiDUmz6aL7Tdo/ljViL
	1hu//EtTLJSkLA+zi+Hgmx1UBt3skMatqhmC5XcGxpf7mot+BTqOjTYPBxPihy92zJmqk+2SQS18H
	H4dYgYrHKM/ici+mMPX9g15IaCzqNJFRK45RY1i8A/N+n+tMCFMNoRmT0B6M0G5vDdUFjF1nuhxvS
	eDwoYtzt8G9xTyDMeDXF/wpJ2BcfwYh+ugAjG9fRdgb5RSiUBaQuHGeQbzwZ+gn2EjQYS4TAfcWjt
	1doC4EOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EZ-00000003POh-2TYO;
	Wed, 25 Feb 2026 07:22:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EV-00000003PKO-3HxZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ab46931cf1so3798335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004175; x=1772608975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5DXCfdvJ1l3iaiyIVD67Vr2Fhjn3yvdCNDjCKNCXps=;
        b=aJrUsPBmxEY7Q4d2rwTFrBL5DHh0pLIPwjB4YErt43YydPtrSmlZAnoG0IDc2G1gC8
         jJqqPaS8cK3JTQgkgj/VnmcgMDm3+mjrmXsRtsZhblXy1LRdsjV55xseQuHSKj+OCkgF
         XVqUn/AmLL0YAp1Hx8i25jKPi6V5jM48S8VQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004175; x=1772608975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5DXCfdvJ1l3iaiyIVD67Vr2Fhjn3yvdCNDjCKNCXps=;
        b=H6IYEMEPw8VX2QqK86XVcbnb1d9GeCmtNdS5HoeWeL6MtfKRavvCHjl3y5jbuTcrkE
         XCGOpQ3I+T/PBmTiBo//TP03T7/Vg2k5t7bdKNPvTLYIjPjk2q3wA1Wru1ajvOMm/M+4
         fOi0UQkY+1Ng0kkkjIxgSV0FzGRxGCar2DbrErmagGbftGbidwaHoZkEGBbbgIPNH3xk
         9KbAbebE4zwWgYxgx0Mch/g1p2DrCPE5dc2O+SGJIf5j+cxsE6ixDhU3ABfDv4cWhN2y
         lMAPEBk54XDJgcqyfGOIx2BIfip6zq5/amrTIe7eyh/7oeHJNeY5lLODdVgov7TlJ0M9
         yL4w==
X-Forwarded-Encrypted: i=1; AJvYcCUMXIo5qki2O3SVKmZ0l7mxsfFUHv3M467dxUdbgmJKeHSGIe9yygZgWCGp9Q9MfXi5LyXbcveajlA42RZb3sEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxLwrhRq/IYyYpUP2wdDcMZwKkjag8N0SsucPtlcEhOdCarfB7Q
	d/71JhxLU/r61SewcSmpV7let7AGfryWs7NHU7Pj9V/QP4AvilIIDip9zKwNzV52jw==
X-Gm-Gg: ATEYQzykCQxCVEBdDOk1LyKlz/deWajoB/vSVbxLSqDvY0GQivTjbO3UmyR1sLru2xe
	G1Xu6lJ8WRi4syiB6lNFgW66Rth5R2j6JOQjSD03bvc7KARBgSuR9wx2wZhPRHwDafxXvOIJSex
	Z5bT5ZdvegKAwqA3hdlv0Wt0OykMEq4gWu7W4mxI0WvHZ4TS33pTXHbCy45j9sMZyhx4c4yva6J
	aFLuuYppKOgc0bej/B1Y2nZmLC0ZyhrJryfiiyAT83aXYLQFccFZlRvHoSWC5709W0lQ6yhdcAI
	IRlPqYQgqd/m793vVIA+pf5LxaUTaQJgic3e5jsGwq743xDoHOvMADiIEwBAAtn6Oi338bcydPR
	mkMJRL9Yi3mWSSRI3Z5ldQJ0ANpACzZTpxemO80yica1u1ScwaZpSDIfFIPPTEmfoC5jzwnZsBZ
	/d3WoqgGwktvHS45t3LV+H1gilsQIPwTN1pgSYpRg+YF5FkpW9ke4A31QcDKZqc4LJN1YC3Q93z
	cvYsK77eN97ojSQ
X-Received: by 2002:a17:902:fc45:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2adbdc3eae8mr23994555ad.3.1772004174956;
        Tue, 24 Feb 2026 23:22:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:54 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] PCI: mediatek-gen3: Add error path for probe and resume driver callbacks
Date: Wed, 25 Feb 2026 15:22:19 +0800
Message-ID: <20260225072225.3345307-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232255_946849_DD97EE08 
X-CRM114-Status: GOOD (  15.07  )
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

The probe and resume callbacks currently do teardown in the conditional
block directly. This is going to get ugly when the pwrctrl calls are
added.

Move the teardown to proper error cleanup paths.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 22 ++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1939cac995b5..f2bf4afbdc2f 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1189,13 +1189,15 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	host->sysdata = pcie;
 
 	err = pci_host_probe(host);
-	if (err) {
-		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_teardown_irq_and_power_down;
 
 	return 0;
+
+err_teardown_irq_and_power_down:
+	mtk_pcie_irq_teardown(pcie);
+	mtk_pcie_power_down(pcie);
+	return err;
 }
 
 static void mtk_pcie_remove(struct platform_device *pdev)
@@ -1301,14 +1303,16 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 		return err;
 
 	err = mtk_pcie_startup_port(pcie);
-	if (err) {
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_power_down;
 
 	mtk_pcie_irq_restore(pcie);
 
 	return 0;
+
+err_power_down:
+	mtk_pcie_power_down(pcie);
+	return err;
 }
 
 static const struct dev_pm_ops mtk_pcie_pm_ops = {
-- 
2.53.0.414.gf7e9f6c205-goog


