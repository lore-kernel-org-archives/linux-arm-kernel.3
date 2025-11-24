Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34586CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xhXPP3gRLRrtXGINvdfz74DYVPN12DyX86RwS57Epc=; b=06IPRGSVacTJnmDCxHugEpZvM6
	bJX2v9K6MFKQaUo1G9WU7AxZ3+jrwiorxErvwdTrxQVh9Q142osEDDeKsSoqSTvWYvpVaXXmJdHXR
	bFWR2tJ8rQgsj16r/loO0cMG90WeF39DQB8Pt+CS1HObI0/2Hnicfc0aLZ+DivNADbaHmqDRdvJBF
	lIjMPZ+F8T0TyNH5c87ppSJlBCLEAnDybTvN0hqswIaQCX7ZkGkh2VdyTu6U7f+GsrDQQfJMLSBae
	+TYwBWBdFwuEnLerKo8Zvz8CGzuAFXN1O9OzRyHqNw76zTfXG8yBvSVUJCfVeYfDUxDftp7jxSbwL
	ujJB02vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQ6-0000000BVcf-0Gz2;
	Mon, 24 Nov 2025 11:07:46 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPy-0000000BVSl-3QFM;
	Mon, 24 Nov 2025 11:07:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982449; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NUytUdA+SGSrlE63zS/zfKXRiZ1BMSC4p5R5zgwMLh+p4kk192xRuD1LZiEfiETf599/mhCdWFwf56efIffQd0IzTnk3x+4l/wKJNC0YveAQt82Yr+lnv5pnbOza88rDpgQpNqyHtlgmTwJAqchcdAMGc+9IVS1dkr7gHNfvi7c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982449; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/xhXPP3gRLRrtXGINvdfz74DYVPN12DyX86RwS57Epc=; 
	b=ZrYTzB4aiMCVcWODLe6FBUB0jF+HCIz2uW/tW/0O8v2elk1hGLCvmLUMI3xdPtblCVYO6BOOhOLu3X7Ir9cvhRVY4jGs3lzQoBG6JoW2S99SLgakutwUr+T1KZbazWnPdoS2I3rLXrUGlR0aR4KKVSTnJ0i3ZrSq6sfBSTPdOyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982449;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/xhXPP3gRLRrtXGINvdfz74DYVPN12DyX86RwS57Epc=;
	b=NE6wb5oHc1Tdel5K1oA7ijdBR7yq8P2ILdqZFw2RHEqgBSBUsmD1sIqjsQr6YX67
	LhfH99ZTQTFMV+eLuX+PayzAyw2nMEyMIH5nGI7SJXF7qWAOzdnG5u/AaR9HjuBPVZo
	iXMHS9n6dIqCo2ME41ebNSS+zKhCEZmyX2nH3iT8=
Received: by mx.zohomail.com with SMTPS id 1763982447257830.5724130617974;
	Mon, 24 Nov 2025 03:07:27 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:58 +0100
Subject: [PATCH v2 09/13] soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-9-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030738_981834_2F64329B 
X-CRM114-Status: GOOD (  11.90  )
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

The DVFSRC has a clock on all platforms.

Get and enable it in the probe function, so that Linux's common clock
framework knows we're a user of it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 3a83fd4baf54..a43d6f913914 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -7,6 +7,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -83,6 +84,7 @@ struct dvfsrc_opp_desc {
 struct dvfsrc_soc_data;
 struct mtk_dvfsrc {
 	struct device *dev;
+	struct clk *clk;
 	struct platform_device *icc;
 	struct platform_device *regulator;
 	const struct dvfsrc_soc_data *dvd;
@@ -650,6 +652,11 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	if (IS_ERR(dvfsrc->regs))
 		return PTR_ERR(dvfsrc->regs);
 
+	dvfsrc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(dvfsrc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dvfsrc->clk),
+				     "Couldn't get and enable DVFSRC clock\n");
+
 	arm_smccc_smc(MTK_SIP_DVFSRC_VCOREFS_CONTROL, MTK_SIP_DVFSRC_INIT,
 		      0, 0, 0, 0, 0, 0, &ares);
 	if (ares.a0)

-- 
2.52.0


