Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF3F01835
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbI1SV8H/A4qosZYbkwhTobyA++HOSFk8wTW5Aruoj4=; b=T4TRQHLXWY7MDdEhjUHFNEcCVT
	OEW/lxzaZ06A5h8dRvQq7YcGtkoL0s7kk9u4wWmcx7RZEPKbOx+fe0nu6hGs17yh6LGl2vnKk4GbN
	JTo1cNPv32NdY6Xs/y3nY5mE6uTqwpGpw6WAfmwcoWhGmoZFJ3OBmHWVOJcUOI5rAPDMgbtZYsUcF
	f0If4yIzOxcAD2gHWuk7slPOCNh9eSWJYMtFEDICWIH7Y1rinYpX4PoZSEQSEr+hNjL14YjPfaryL
	iuavTc3OMt3upsH/C2CwtQ1c9HagafPgxGypDgTzP71QDIpWzz8jdnOWEXpbG5sqs5bV+VC5Oxyp8
	twczqs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVBr-00000003kWp-1H2d;
	Fri, 06 Mar 2026 13:26:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVBo-00000003kSy-1D46;
	Fri, 06 Mar 2026 13:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772803549; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hG0il03Mc/qfJTASGS7mIdUr0xwAY/97lyO0eM5/3jX64cJ9fJvQk6nBMe6VF4IkxyMCNX7//OucCWme+83SPIVkCfg3/mWEObmUMvxJUtHXaFL14Q1KpGAMOXUtARnJc+KLxkUGD9oPdIdUoWyehLdvQTPRohyQ5RHFzVuh4IQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772803549; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XbI1SV8H/A4qosZYbkwhTobyA++HOSFk8wTW5Aruoj4=; 
	b=IFb+h7PJ0PlBfaarpdcFi5CwNM+dKNmn4X12LRHlNGGAlRKNxg1NwWtxjxdQUUrS3YODxEq5LQiVw6RJU3FGWTLMUyaj74ow7F5V9IsgAOftP+gOlk6sYDEVRv+BvFVSZb+Qy3cz2tiwkNyFM7t5OZITyrVbqyEQj79e6xw4XFg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772803549;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XbI1SV8H/A4qosZYbkwhTobyA++HOSFk8wTW5Aruoj4=;
	b=WVvxHWh4+b2yNOI5LVoHrOfk20DOrKm5UaYviOtTdle66FlrphTruamvdgGzOuBn
	xkJkN0e2np2nj1EVQeMW4hhPSJXz0uoz9Mi6p20w0TlfiSElSHLUT8metqy/eCV1q1X
	frlMVWlSDW3dI6nY22Z/g4i4MJWsi9d0d/c5jHNs=
Received: by mx.zohomail.com with SMTPS id 1772803548131217.32860788159417;
	Fri, 6 Mar 2026 05:25:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 06 Mar 2026 14:24:49 +0100
Subject: [PATCH v9 08/23] scsi: ufs: mediatek: Rework init function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-mt8196-ufs-v9-8-55b073f7a830@collabora.com>
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
In-Reply-To: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
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
X-CRM114-CacheID: sfid-20260306_052600_525288_5890E175 
X-CRM114-Status: GOOD (  13.77  )
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

Printing an error message on ENOMEM is pointless. The print will not
work because there is no memory.

Adding an of_match_device to the init function is pointless. Why would a
different device with a different probe function ever use the same init
function? Get rid of it.

zero-initialising an error variable just so you can then goto a bare
return statement with that error variable to signal success is also
pointless, just return directly, there's no unwind being done.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 0d22ac4c925c..392383e03ab0 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1248,29 +1248,19 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
  */
 static int ufs_mtk_init(struct ufs_hba *hba)
 {
-	const struct of_device_id *id;
 	struct device *dev = hba->dev;
 	struct ufs_mtk_host *host;
 	struct Scsi_Host *shost = hba->host;
-	int err = 0;
+	int err;
 	struct arm_smccc_res res;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		err = -ENOMEM;
-		dev_info(dev, "%s: no memory for mtk ufs host\n", __func__);
-		goto out;
-	}
+	if (!host)
+		return -ENOMEM;
 
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
-	id = of_match_device(ufs_mtk_of_match, dev);
-	if (!id) {
-		err = -EINVAL;
-		goto out;
-	}
-
 	/* Initialize host capability */
 	ufs_mtk_init_host_caps(hba);
 
@@ -1344,11 +1334,10 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_get_hw_ip_version(hba);
 
-	goto out;
+	return 0;
 
 out_variant_clear:
 	ufshcd_set_variant(hba, NULL);
-out:
 	return err;
 }
 

-- 
2.53.0


