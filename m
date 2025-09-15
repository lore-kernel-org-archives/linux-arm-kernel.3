Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F58CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uXYipikAORq7rmSiXBAcddF/TDyI+Ck/jJ3ssPKAKWY=; b=b5p7ktfbtmseF6+XKKYGh/eRde
	kRXsNRdRzXz+ClbZ0gERZiND7T56JhgOcAaoBr7AvPIt7Ao758v4MA1/okRv/Qw6MJKQXvRaFsQZv
	EsmVicaY6mst2GUwWIpiV4dJi4OkEdnxcQ5Kkq6jouhPdxcK/fAQhX5ydVAgdAOT6my7swtqX/rAS
	DWCif2PVpWlye37XtGJxxZV3pkgKYNLk1q0bFDDzBJk7gAIDB6IhR9CVutHtHxlKtKiTUaxjulYNM
	vtH3Zd231Tfe8Hp3elNQ4MiOu79sp7Uf26DB94/UvZkmFeefyUSPjAbR0iyluXpegHv6B6IthKMfa
	cQ+ApyhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy82A-000000044kz-0k5S;
	Mon, 15 Sep 2025 12:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy828-000000044kl-0mni;
	Mon, 15 Sep 2025 12:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uXYipikAORq7rmSiXBAcddF/TDyI+Ck/jJ3ssPKAKWY=; b=IY5jgLbFVA/c0E6/l03Uz1V/i2
	409PH3s0/9oQrEZVWdbNsSrrdQTa+LJdqa+U+TPh6Z1M2EXPPZsJBibQzaVhEu8NgDgvEIvtfSKcR
	VyYyTML5/oeyxrFrcQ1xE+HTF34FIQQuAqpeVvffzmwizU5a0JXXxZbmKVNP28b7EDF4WL3ZozMCk
	aVr2GopTBdIVe1a6ck9P/yhEV2T6RF7ND8vSveEp+QgBsTE5BMyBPdfw3lcmWQ2JMw3nM7G2KBFm2
	zhl//liT+6lMLLSR4bm/gt46LHRMQ3QzjZZGQaCikSyHiGMDVI8XXuQ66xM9HQCy3OpOx7+f0bRwh
	IpHxEUmg==;
Received: from m16.mail.163.com ([117.135.210.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy824-00000006yHu-1rLW;
	Mon, 15 Sep 2025 12:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uX
	YipikAORq7rmSiXBAcddF/TDyI+Ck/jJ3ssPKAKWY=; b=EEBeOIh/Oflc6xA5cO
	8ewa4chJ9vmkDiAP0WKltbkUE51T+ydUcJOSThGB7wYBC3BGFDNj3cmMSDBBI24M
	K6YVLH18A0lDwF3Lk62/HSo6S16spdoIdjuY+AhMUJaQ3cJJhWS0MEXVRgJODkTO
	N/KpT3GlRi7SB86gO4ylZNVW4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3L8IEAshoNuutBQ--.65473S4;
	Mon, 15 Sep 2025 20:09:41 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	haoxiang_li2024@163.com,
	hverkuil@kernel.org,
	tzungbi@kernel.org,
	jiasheng@iscas.ac.cn
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
Date: Mon, 15 Sep 2025 20:09:38 +0800
Message-Id: <20250915120938.177691-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3L8IEAshoNuutBQ--.65473S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1rWr4DKw4rAFWUGFWfXwb_yoW8GF4Dpr
	s3Ka42kFyUJw1qvw18Zw4Uuay5Cr1SgrW8Cw13Zw1a9rnxXFWIqr1jy3WIqFZ7JFyvka43
	Xrnaga4fCF4Fvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_MKuUUUUUU=
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBEAnJbmjIAYMTQwAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_131009_072273_ED6DA489 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

vpu_get_plat_device() increases the reference count of the returned
platform device. However, when devm_kzalloc() fails, the reference
is not released, causing a reference leak.

Fix this by calling put_device() on fw_pdev->dev before returning
on the error path.

Fixes: e25a89f743b1 ("media: mtk-vcodec: potential dereference of null pointer")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index d7027d600208..1c94316f2d7d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -117,8 +117,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_enc_handler, priv, rst_id);
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
+	}
 	fw->type = VPU;
 	fw->ops = &mtk_vcodec_vpu_msg;
 	fw->pdev = fw_pdev;
-- 
2.25.1


