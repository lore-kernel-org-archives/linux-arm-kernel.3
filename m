Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC078CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSGx250uhdjdakZcPHoX8Nbq5J4cWyRmd4SLOgVrrcg=; b=NqD5OsTIKb8KWSO3q70nbAg7ik
	AjcvR2J1cphULddLpCaJQVhzkTUVvVjS/MW7sZdC3NXm4Yq0OIR23JjkYW7XLI9k4gbfOaPDFCWR3
	GS8CWxL+Tu8tTBvFjplhGpj8pRtVPkjMSOF/hqJz5Dgl/olbmOctWrBV8ePPTYeLfeqdOI8bQmJu3
	AIub1lR0i0izVTOUtoiZkH+1YqlK68S1A2/xoD7CwrOxynta2Q5MayNlyNYASO6hYV4MgtOg1tw7P
	9dx+OgGPczt17vrala02TXlrdlffAthaXvd7ANkkdmCFA+snDWQW4crtZMx0rGl8QTWs7xia484J1
	5Yx6SQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPw-0000000BVQH-340D;
	Mon, 24 Nov 2025 11:07:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPq-0000000BVKc-2ZF6;
	Mon, 24 Nov 2025 11:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qSGx250uhdjdakZcPHoX8Nbq5J4cWyRmd4SLOgVrrcg=; b=CitzKFYiWYoD5I2MsGcEwRMKC5
	uPiNMXNRhJcI0ql3q+uVqKWd6pEHtDmx7ggxNtP4YdPu540qSHMCWtLRzbvVfqau6oYP7PSnY6Lsl
	vf+2xAVvokivCN9+K5RMxBxX1OtiJ1gcAuA/cVdbpnTGmNIwkvDaB3k9PtRQtA1xZbeqCPD862eNy
	Sb5naYXGM+/MeSRmczZFD1VQL1yjk7qBefVj0O5uI1VwqM7vEpq7g75XcbZNFMj68UsL3ksoSTUBe
	HimT0XSJ/kAYDkmtza1jooejja+oxEhH9xyHXMjjUsdjbFapr1l9ZO3oTe+FbT0EiyoUXFOp1a9n8
	5oKUrL0g==;
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTYB-00000003UI1-0Dnu;
	Mon, 24 Nov 2025 10:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982433; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IXS8IHBlRkcxzbrqOTzjgOfUGwHgAeNekmQt1A56O8FmgN29sqvy+RBK5umlrJwt7srj03ctCnkYy6vjpLGhvMKHl25X620EkQzd0BCP9YXPQaSbKWIPTzWTJnzrchnBC1VeMPcv0vXJC22dLwVVmFiVfJwPTy8ceyYWIuMeVhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982433; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qSGx250uhdjdakZcPHoX8Nbq5J4cWyRmd4SLOgVrrcg=; 
	b=EjNhvEdyxDbs/2bwxjR2DwjWci/LOks7rzSYdsVfv/xKZrHfarjhKE4NQ6qJOWbgLkv4uMEw3WltDmWeytXs0zsaBiloWhbbij7AC91gCsfDMYkc3VqZ7jGm4F8ganM+iXLikrnbBV34/P2vgkbvK8isz5C9L3eamqdpnOqvogQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982433;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qSGx250uhdjdakZcPHoX8Nbq5J4cWyRmd4SLOgVrrcg=;
	b=KmZwvMFrlZHV0mUn6TEmW8GPNOzPiVgf1uruk15TGaZwaVIqiDuh6abQ1aihVGgF
	ibLFU2sEz51fQy1Yxn/JAwspmO5VUb42f2yUcTl5l7uQAN5tkeLx75vbp5ygLGphK3D
	MGC7rMq+gPdTd/mirTF7ZHZORoew461w9nxU1bsw=
Received: by mx.zohomail.com with SMTPS id 1763982430549222.18364403003534;
	Mon, 24 Nov 2025 03:07:10 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:53 +0100
Subject: [PATCH v2 04/13] soc: mediatek: mtk-dvfsrc: Change error check for
 DVFSRCv4 START cmd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-4-d9c1334db9f3@collabora.com>
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
X-CRM114-CacheID: sfid-20251124_101203_431444_ACE8DD3B 
X-CRM114-Status: GOOD (  15.19  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding support for DVFSRC Version 4, change the
error check for the MTK_SIP_DVFSRC_START command in the probe
function to error out only if BIT(0) is set: this is still valid
for the previous DVFSRC versions, as those always set this bit in
a fail reply anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 41add5636b03..7708b07ab2d6 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -440,7 +440,7 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	/* Everything is set up - make it run! */
 	arm_smccc_smc(MTK_SIP_DVFSRC_VCOREFS_CONTROL, MTK_SIP_DVFSRC_START,
 		      0, 0, 0, 0, 0, 0, &ares);
-	if (ares.a0)
+	if (ares.a0 & BIT(0))
 		return dev_err_probe(&pdev->dev, -EINVAL, "Cannot start DVFSRC: %lu\n", ares.a0);
 
 	return 0;

-- 
2.52.0


