Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCC7CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC4S4OgvI8rYow2KhwwhYEnTyWYds7Q2RbkM5QQk8rM=; b=rNyTWjn1PBnX/RgV5RkjNMmKy0
	3AuKxGL4T23ZpFav+JPl5upZ71kvUdoYbqsr/k3lrnDXd3mbhMdVbirMx5HbyLmuo29MMJMq1yZjW
	nAVIwYMWMIiM+k6lbj8PVFio9m/4ecDNOzh5aXOp+HUjoRSovyRkO18eOe7R/QtFkeJjy9fYLMlon
	1/LuEhpproGQF2zrjys5nqvpTMqKpzfwETcXZmdJOoq95QL0jkR2Qj0z8PkvtT8PO81Pez9TNZZ0e
	U8QoPRgcpuDu5rZzR5kEWowZxkZCRf2/cmAHNskOOD4eCJi0kA//5BY0JZqQ7rpjJe0ocwd/9CqYK
	LkO9yJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1LL-00000007Q7h-07ze;
	Thu, 23 Oct 2025 19:51:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1LF-00000007Q38-16Qn;
	Thu, 23 Oct 2025 19:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sC4S4OgvI8rYow2KhwwhYEnTyWYds7Q2RbkM5QQk8rM=; b=kdaaZ78pHlxBGaEVw9nCzgi7x2
	5evGcqXR3uX914EUaf2+1UrdfYhb9BbNksvwzXBPne52QCCIOPPxZdaT4NyBCcGcWK7OYUgpa9T5p
	da+tCfh+BnO7854x5ilZMf52YytNtTJgTPTWvxOpKB/eec7I0XfYzjisLfClVkMRNUDA8kJ64f9pk
	+eWzBCZ7SGcwhAozuokdGWnb7FkpBtBT2+J6sRE6vBHz3hlMkqz4AxpYmVLsQV5y5c82yrsUFTc2Q
	wsK8fESD2Fv+WkfeF40byQIgJA8wGYGTRGjoa+6uA/p/fUNJEYQXu8o0phtdXcu5Y6IhURmmQVt6a
	5pDuf4ww==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0TX-00000001gAS-27RE;
	Thu, 23 Oct 2025 18:55:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249064; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j8TPr1raiaiGVwFd2scEfxIvXznQGjP/bwE+MpSZarIK15pg+ZO8R9rmLQx3xKv3ZPWu6KxpajGNbVntSvym+oUXDJzf5GzUOtAWAFc+PUKPI4r9l8vZhjTyUQQ/IIvpZhsb46UmU74nj8GZ8dzjpl+DHI64m1pYZ9+Q3d5ddsk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249064; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sC4S4OgvI8rYow2KhwwhYEnTyWYds7Q2RbkM5QQk8rM=; 
	b=LECtg6z+Z5h2IS8wKz6CMGyGjerYBGQQD+7NSlgdcvU3rP91WFekPgcZEcFlUJK4wkCnjKPuBFXCERwypkffzrP6PQLIAghz4Ph3WmYFPC4+kqnSRCslEifAoOen8UyI2g7jeb16GB04l4PyEJXFI2/bEnYb2cYDumuZ+P6A9vU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249064;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=sC4S4OgvI8rYow2KhwwhYEnTyWYds7Q2RbkM5QQk8rM=;
	b=Zv4MOrKniMIGtMnmt6iOln+TEQ79dc3VScoA//1eetuvPJ3hh1iTiWCDimYLvbvw
	RiO1DeuqilsCHSqIKuPvLNrtz522CjXSVmtCk18vs+IUArn0KgSquBJtEp/RBuPHjVb
	0WJFK9Gf3MqDneUs9wDICSRsWMkPQ1HooLCA1C9I=
Received: by mx.zohomail.com with SMTPS id 1761249062931154.5897707928499;
	Thu, 23 Oct 2025 12:51:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:26 +0200
Subject: [PATCH v3 08/24] scsi: ufs: mediatek: Rework init function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-8-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
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
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195551_925646_7709682D 
X-CRM114-Status: GOOD (  14.13  )
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

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index a7aab2332ef2..131f71145a12 100644
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
2.51.1.dirty


