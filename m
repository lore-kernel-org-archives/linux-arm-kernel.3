Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF239D185C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=458Lt/Oh4ccoveskL5sbXfhVHUcBXn63m/yLt9UTlCk=; b=d8Kk+jl3FV31hWAX3bPnVqj962
	6g3wAxyjmhI+0KgT6eNCEK7Ytw+sMEBCr0wlIGvpasSuH+Ngcby4XqUurgHCHScWo4l8RcIkHMxeQ
	boVHBuSoreeWPunHmkjzgQ62yoO9ioKAYqU4d0JiFF9giQZCJwW3Bz8mnG42rWtFE8teFELCBqg9K
	vfBHkNU0yYqBEM9PbbsUh2MZc0G/qIknYft/4vy6u7uum9qWLosVhYZsiKcQQ0z9csrp1YHkpzCY2
	rFbAf8d5BuUBiBEMhvubhXeUIqqgGTp0oeA3WohuFEi4Et0fdeErpmfdv09/83Brj+CQuLmidxHuv
	F2jIoefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncg-0000000GiFw-1MO8;
	Thu, 08 Jan 2026 10:52:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncd-0000000GiBe-46Rg;
	Thu, 08 Jan 2026 10:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=458Lt/Oh4ccoveskL5sbXfhVHUcBXn63m/yLt9UTlCk=; b=ha5Ae19fTXyoNhovkNkXLQWNVP
	rpWdG609iAPUqOa1O7+1kwHd0wAsERiEAonWHUnx4gzZfEdFzFYDP9z8d+iPinxLwTBJZbPFW+EsY
	bIAc8oL0Gg3SsSqR7DLxr1Q94MSkDCUWi01z3G26hMLkrS17mBhoxABknjYpBn7Aec+2+l75o6wB0
	cNsCmuzND3br/AtalP6SD2SZvsU/Xly6EliI9nw8IG5cjsN+sQGbhGx8YjX2Vcl2HnOaFAii+1JfI
	IBdKcPfkh29AQRcxQcYBeMTVHctbBYxVcDoMZIsRfsoaYdi3PHEsUgfA6mZ/BMtXUqzzo0LO31QDl
	oNS7YR1w==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncS-0000000Cy1H-3cQT;
	Thu, 08 Jan 2026 10:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767869499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BVxJ8F9zNdmqeGerP+D++ybHJZHF2c74BDKc5yj76qy71jkvIk8cQDEkL4pj6xBqHJLxeVauCfqrKzgUoav+CHRrjyxb+BAQRvWEeju5u0n2Nd2r1+jGoI7nU+Cj7hgIFiNwIYFtmx17q/Vogpvw0OzWApMEdw6soBGGbeygWsc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767869499; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=458Lt/Oh4ccoveskL5sbXfhVHUcBXn63m/yLt9UTlCk=; 
	b=aHmiAjDJgZPKj4dZ/F2hyPUCI4eCr1An21GWtJdCjgo2CjQvrfJLZZoOhMNurT+M+fSlNO354NR76rxKFjybkkVMbKZKmLsh51sAxYEtblX8RcBzBhmebqR9wKN8ukD42PT4ipNrTtRMnOFOgBo1JisIMHbeG7vC0udzkaEilzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767869499;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=458Lt/Oh4ccoveskL5sbXfhVHUcBXn63m/yLt9UTlCk=;
	b=FcC91bUtXOvWkqUybO+QhFATu4UH3hTAd5jqnv5aK+Bq6f/s1f0PddMRgem9VPRa
	ZSFdKI0swW7euYsftVYg9kcDk6GfsbH8j8WpDc7sLmTpYtUU2FCOUvi/QqoTq3YTfWY
	YlW9npP9LYWzW6yhahao7Vm5i+i7K2qgfGmt2Lx8=
Received: by mx.zohomail.com with SMTPS id 176786949840443.34294090996946;
	Thu, 8 Jan 2026 02:51:38 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 08 Jan 2026 11:49:36 +0100
Subject: [PATCH v5 17/24] scsi: ufs: mediatek: Add vendor prefix to
 clk-scale-up-vcore-min
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mt8196-ufs-v5-17-49215157ec41@collabora.com>
References: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
In-Reply-To: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_105200_133592_10B8408C 
X-CRM114-Status: GOOD (  13.22  )
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

Device Tree properties other than the standard properties must be
prefixed with the vendor's name. The "clk-scale-up-vcore-min" property,
which this driver uses, and the binding did not previously document,
lacked a vendor prefix.

Add the missing "mediatek," vendor prefix and clean up the error print.
No judgements are made regarding the use the property itself, it may
turn out to be implementing something that it should do through a
different way (e.g. OPPs).

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ecf16e82a326..2b7def2cde54 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -958,9 +958,9 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 		return;
 	}
 
-	if (of_property_read_u32(dev->of_node, "clk-scale-up-vcore-min",
+	if (of_property_read_u32(dev->of_node, "mediatek,clk-scale-up-vcore-min",
 				 &volt)) {
-		dev_info(dev, "failed to get clk-scale-up-vcore-min");
+		dev_err(dev, "Failed to get mediatek,clk-scale-up-vcore-min\n");
 		return;
 	}
 

-- 
2.52.0


