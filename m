Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D1F109192C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=qicJTRWIyrOBA3hX9hsWFUq+Di
	N8DGETpxOgBWsLxzVwGLrsLBIDbJU97HGYWXOUSBX5xVc0Op1LTRsQJnkc/MDLk7bjRjdVcGLXkRx
	wg1G+PaxDNqivY1wEjq2SsX/D80/d7wq6YtisTdYF/j65VjTW5CBGLPO4tk/dEqlRUDsE17NnBqwx
	mmeKwlgcalXpuqsmYRWn2JuIB8aTb62lbUzMrW3cKQs/DfKwsMgKzb6asEjAAKShMnIMn2ubBEi3n
	fWUT+dNboVyhogNSU7mv2hsAlVDrBBTKEzAGD+p6W2Dy2op/0bwQ4+IGIY2CZBa0wY4xOKLDfhw53
	zPPh/ZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Lnj-0000000Be6j-0SNy;
	Thu, 19 Mar 2026 22:25:11 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnL-0000000Bddo-3Wm6;
	Thu, 19 Mar 2026 22:24:49 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 9C0B91300170;
	Thu, 19 Mar 2026 18:24:46 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959086;
	 x=1773966286; bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=
	AzP5OhthuIMWHDuLNYLU4bKg+OwoC+HW6qG+2IMF6bfOUEp8wSHJUURmNZrGXVEF
	UM0Awx2rTE7AQJXEWMQqrwle3a903IMlqNnzJBIfw1JFNAw7ZUcRKqnY2QYYJuD0
	YAe91jz1HyuuctL8IJk1mBzyCKcQ1VaH05k0aqYpaMR2am5RD3RQq6MIHEH/Syf8
	h2YzNSFk5whXS6E59bH2oRSqEuKI/G/pGBC/wVzfCdoEo1MT+yJCpgi2LuxyltX2
	AmOAz+3EjVLXunmEB/sZZndf+q9Sns58cHxV7GLW0KYMzFGDeb3ULjD2ZntSRl4F
	MZSp7OH8/spDzlb0kTDRNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959086; x=
	1773966286; bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=0
	N1FBmJstklqTbwHJbFY/DwOwscV9pi9QRwXkdg5l0zciJRvR8n2J6ZrYPP/0Ku1s
	aVNCiigAjZkDXBoeeVXDxjAK7Gk2Vf/pdWq58cGnWSfpEGdhKSLJwinvXm3o4V1y
	epHD6fMjUP2CWEud1QTLrbun3j/K9C306gZYyQA6sa6SYQq+bHJILoT0r8ul7YIa
	XCQgs5dOWIgQOdq9O7k9m4LHuomCuNAgQQE2eTMbxj22rA3YMhiP0sIbzfvYnFXZ
	vfZYS1LLzbNIKFl9Ez2IYivbrbi4cfViUrsxTzfWJVtVEPJfweULZEudHCt6eftc
	1+rSyI8WrQARJLYlS+6FQ==
X-ME-Sender: <xms:rne8aV0y00RejmpI0V_ks5g0-PF4_r8RTEEcvfCZE27h7_m1glEIZQ>
    <xme:rne8aW7TdvxxJbXkBJmjUWbjnNteSOq4mLNQvHEUUscjq_FRsRUvocjPu1XLEIo-O
    gMjAcc0NTPhS6rTyoncdsLJmimPt4_cyiFs8cyiK_oknNfVTKHXH5Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:rne8aYH3ZM7wIVrTgahcBv85AszxVME5qxH6IRShKVs8AMWTOGzxNg>
    <xmx:rne8aeief7Zgwl4j-h8Qfp6GKEPpq0b27XJZ3_QhPNyy3n7R0SbrPw>
    <xmx:rne8aWqRsgItE4EkrI64uafcY_mAWBWhd_arOAZptjWRbZwv1dD55Q>
    <xmx:rne8aWQtLqRwG56Srx2WrdzMEtPHFYdvHG9XLu9wdXTrIW2oN2IbUw>
    <xmx:rne8abFuyG0cF2xqxJt7Ow0kU-ufJaw9HD1-P3zuLF87m3RmwW9Kmm2t>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 535E01EA006B; Thu, 19 Mar 2026 18:24:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:29 -0600
Subject: [PATCH v2 13/13] wifi: mt76: mt7925: enable MT7927 PCI device IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-13-d627a7fad70d@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3386; i=floss@jetm.me;
 h=from:subject:message-id; bh=nz8eyDAP8ActMVY+DXN7zhQnBrM5b9VLE4uS6ZrmhBc=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeRUYSIdSZdhtvKx1x5yK4Rd8yQ8NM1L2y0V
 rwy4ahifPSJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kQAKCRC17sMLqGd3
 H6EjDACXjQ/CypFIMH9QqO3ZVzJcRAEYRiDM2yAwOTT8NeaV+whsm7ba9yo2QfOWd2mP4VB9cpl
 eA0YVHzs8et9cr8QCThStHUjmHULxnTXmEyxBq1oCAiIHv64XmXzfUBce9KIZMcZfr2d3y8Sfmm
 l0q4BiKktjoeR63G01IwQRRNdY++/XZ2BCELkFtPpYxY5Mj1SMkf/acB6GQ0ZR9pAhhZrGk7DoC
 N0g3f8Y4bUJs2DczHk0zZbK1SjeoroWIHDRW9/stoGm7aOeo591QGr5Uj5kiQPaBqwCLMiNkff5
 W60lYcriwLFRrJPKso6BODuiF8cthK34P0WYXBq/DVheqq/DCFmQGxoVVEUkvCMuxXh4ap4dqtu
 betxr7LPtUNdlocVDcTANJ8Oy+iO61YTX8v0c2ECnb6Yh7s4r7TEPosGZhTnovhi3ZAW3QRolot
 ioAejmcK1k2HQrzRfWjq5hJnyrYLGAxigHC5CtImWlEPycTaf1JFFQLPGXhdjYEffZRXA=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152447_974212_AC87E7EF 
X-CRM114-Status: GOOD (  13.40  )
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

Add PCI device table entries for MT7927 hardware variants:
  - 14c3:7927 (ASUS ROG Crosshair X870E Hero, Lenovo Legion Pro 7)
  - 14c3:6639 (Foxconn/Azurewave modules)
  - 14c3:0738 (AMD RZ738 / MediaTek MT7927)

This is the final patch in the series, enabling MT7927 device
enumeration after all infrastructure (DMA, IRQ, HW init, band index,
power management) is in place.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 29 +++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 693e08f35d68..00c3601f14ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -16,6 +16,12 @@ static const struct pci_device_id mt7925_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0717),
 		.driver_data = (kernel_ulong_t)MT7925_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7927),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x6639),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0738),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
 	{ },
 };
 
@@ -530,7 +536,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927 ||
+			pdev->device == 0x0738);
 
 	/* MT7927: CONNINFRA power domain and WFDMA register access are
 	 * unreliable with PCIe L1 active, causing throughput to drop
@@ -546,16 +553,16 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		goto err_free_pci_vec;
 	}
 
-	/* MT7927 firmware lacks the connac2 feature trailer, so
-	 * mt792x_get_mac80211_ops() can't detect CNM support and
-	 * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
-	 * Force CNM and restore the original mt7925 ops.
-	 */
-	if ((pdev->device == 0x6639 || pdev->device == 0x7927) &&
-	    !(features & MT792x_FW_CAP_CNM)) {
-		features |= MT792x_FW_CAP_CNM;
-		memcpy(ops, &mt7925_ops, sizeof(*ops));
-	}
+		/* MT7927 firmware lacks the connac2 feature trailer, so
+		 * mt792x_get_mac80211_ops() can't detect CNM support and
+		 * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
+		 * Force CNM and restore the original mt7925 ops.
+		 */
+		if ((pdev->device == 0x6639 || pdev->device == 0x7927 ||
+		     pdev->device == 0x0738) && !(features & MT792x_FW_CAP_CNM)) {
+			features |= MT792x_FW_CAP_CNM;
+			memcpy(ops, &mt7925_ops, sizeof(*ops));
+		}
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
 	if (!mdev) {

-- 
2.53.0


