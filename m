Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6579CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdgnhdw/Mw698xqGaERI0Yc6xoNppjlBNBAYGnT56uY=; b=VkOoOLnuZ19MDxAGidZtvlB9EK
	c66ITVkMrsi/B+qgc3OeEJ8shz5Rw6XyxIRKSz0bHc1040Ns0GylkcbWWnNWC4AxJmaxwlnXo002g
	N/hxp5EUVQCWgR3uVq3Agdamw+fiXDaByUhtCaqWW4erm48dvUjuK3rAlF+vEZi/FsuylG5cFsTzQ
	zu9A+ZMN7vaf2w+1Ei9ov91AcywG3YGYxV2cO5z1VmYWG2LiLDwMvyKmjj+EHpZx04eSpBWmtvATg
	rbqEOQT5wdaOttdklnKpPmVJ2buTTavNPHZiN3CINMtf+lUaKKmMP/ptjTPcGbApNrJV9I3PuWqmk
	N5zQfLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1M4-00000007Qu5-0NMg;
	Thu, 23 Oct 2025 19:52:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1M2-00000007Qrs-0ugJ;
	Thu, 23 Oct 2025 19:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wdgnhdw/Mw698xqGaERI0Yc6xoNppjlBNBAYGnT56uY=; b=IPb5iLvBtFKY4GZ3jw4tzc2kCd
	tjCRiEDH4z3ikLgWI6syxHVZpfAuujfEtkcuZ/HhKmUV7CwtfIsxMf4SiSLrBEoUa657yYQRnsw8N
	MXLLfzcaAaaNNlQGp6FJmY266YEHSYnfE5h0e6RDvyLn0Q//BKXpEd4FV2Uu9lVxdJRBbuY2SP8U5
	VSXyZHbO0ZQ67IwgiWvyC6Lc8+NaE24xrW4UohRvfRCt9PPmjq9X6I7AOpjqCfgf0aUHl0PSWWWeZ
	XWQc6OFCLf1dxWQsEuDvFjsQIywDVauKgIaWTYBcg7Mbi4gdszPUoKGhpEDnQjXucJEbgqrTqXv79
	SWSD3Ehg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0UK-00000001gHM-1OCI;
	Thu, 23 Oct 2025 18:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WaxXirPEazk8bjUvbT1e94tfNHkfnDb/YMN6Lh+8h7iQIqONf2p8UL/kaHVTtL+dGSlQXQj3Hm/MCzxmNWIUjEKW7jtmaySiui3pkxKve0skiBPM3uGcodgnkNi2TAGvoe054nV9NHzvZNkGk5PQOvbkD6WpZsHIJhT1uyBO5fw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249114; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wdgnhdw/Mw698xqGaERI0Yc6xoNppjlBNBAYGnT56uY=; 
	b=ZN29Y/9w7GPQWpMo9YB44rSwdNhvnL69YT2fywuEB6dip55GI/ybFOW1CYoHnuGHyIGmBPgCzfXKqpGDyC4+Y/AdQ/INobWAPB5xueMoX5hbZha0pP/oZpG8JBVySJWXCbMrgmZILKgnxk0sefCAfAEfTnMCg/bcWghyJcb2Cys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249114;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=wdgnhdw/Mw698xqGaERI0Yc6xoNppjlBNBAYGnT56uY=;
	b=YU8Bib3XbAo+fHBH4bkDRlGa0w9eOdrt9oM5pSOBjRws/FuQ3lcbwekorLHJBKNp
	4ACAWBVMMo3kku1XngEHTHyAjuOvlUuPoguY3G//6HXsdYN4MUMUt/MwaDdSu9RP6wu
	q52QTvCQFYSaCa4qNwwFj7lDK91faB4svMEzNmuI=
Received: by mx.zohomail.com with SMTPS id 1761249112427642.1241395414302;
	Thu, 23 Oct 2025 12:51:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:34 +0200
Subject: [PATCH v3 16/24] scsi: ufs: mediatek: Add vendor prefix to
 clk-scale-up-vcore-min
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-16-0f04b4a795ff@collabora.com>
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
X-CRM114-CacheID: sfid-20251023_195640_794500_B9D12086 
X-CRM114-Status: GOOD (  13.35  )
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

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 7a890302c240..20db25efd634 100644
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
2.51.1.dirty


