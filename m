Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCB6C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oW6XItzS3RhCClczZNyaDVU2qBVnd8oWUKJM2XLF3U0=; b=ytoPOvYubq8MA8lwASWtcrhoK9
	D8SJuv27CLPobwETk7QFkIh38+5m78FgjCLcNpGDIPmDAatvB/pSf3Ft9r7fvP8CleGOP5c/tsGxj
	pwi7O3ahp9OkyXkOt0sTO7wH9IoHOIb31fuYmk+63uB+B9HGktoNp2iD1reMonaePDDTwrfIwtq0H
	68LGeTfEI/+X6Is/vt0nv++NGxd3H25ptE09KKNWl9pnWFCUDH1f/ir9FKa5IkFxX02N5SlKbZO+Z
	1hrgAPte7g5hZpfIuC1cQdqHtI853NrpjLBppZBlpwpGRFIwS7HyxtOcSzt7hMz34pFo0aqr9octO
	w09JHX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNHk-00000006kol-3qJ2;
	Mon, 11 Aug 2025 07:49:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNF9-00000006kLP-0ao8;
	Mon, 11 Aug 2025 07:46:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754898413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oW6XItzS3RhCClczZNyaDVU2qBVnd8oWUKJM2XLF3U0=;
	b=D7gy0hIMV9tB4JSDXb0uCHwL5gaG18Lk2pQOD3YSLW9as31Yhw8YmISxYfvU/IrfrXqUBS
	nbowDfp+MVLNNbrDnUscxWIriOdjpSNq2kMtL5hOe5SS2x/a6g1OXqR427CkC5Vco7VUkC
	DUvD8KxL92ZZOsaaIwe6OIEVO5Bws2AtoSOL6M9y0xUmGBMXpX/2Uppaec1aCcHNXDa2mm
	IlF/VcvhuWWtGM46hC0WJEy+zwW7WoXgk3tK2PJAtu8UxDc0Vhj08+hGRxNAz5k08BBeWo
	MNlVAI6Xzt0yzSHEUTm+1b3g7ozNaExmDWolCJh2FXtZHosV3XCVR1Lc4WvV9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754898413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oW6XItzS3RhCClczZNyaDVU2qBVnd8oWUKJM2XLF3U0=;
	b=n17P2/fiJG53D5pwyp7NZbW+XMU+NFAGp5OpB3RNIwEkGKA2z6sAG7oYV/2nMctIN1W1Dl
	zIlYq2zkB4+4Q/Dg==
Date: Mon, 11 Aug 2025 09:46:49 +0200
Subject: [PATCH v2] media: platform: mtk-mdp3: don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250811-restricted-pointers-mtk-mdp3-v2-1-d76e5e6d5299@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAOifmWgC/43NQQ6CMBCF4auQWTumrSLEFfcwLJp2lInSkmklG
 MLdrZzA5f8W31shkTAluFYrCM2cOIYS5lCBG2x4ELIvDUaZWjW6RaGUhV0mj1PkkEkSjvmJo59
 O2Li2tladlW4dFGISuvOy87e+9MApR/nsb7P+rX/Cs0aNrvG+6BdtyHYvDu8sMfBy9AT9tm1fi
 r5llMwAAAA=
X-Change-ID: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754898413; l=2558;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4MMgbTyUJWGMqEvl8cpxSSQkajFSIFS92Abs4DfMrsg=;
 b=n1Jerr5rl9LAlwvxTZyKzlziPXqsX797vW1petW8HJJp/SY8O5gNi275PdXyjN02ZDrVitc4K
 Oa9s5IvBC2wBP6nLh/xuazfOJdCXOC8hU58Av291JSfTAqT8CfuBUc0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004655_319056_F027B2D6 
X-CRM114-Status: GOOD (  12.43  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v6.17-rc1
- Link to v1: https://lore.kernel.org/r/20250718-restricted-pointers-mtk-mdp3-v1-1-c7ddaa0612ea@linutronix.de
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8de2c8e4d333a8f92684f1590a3dd0d13bdadcc6..6559d72d5d4278071bcec0c5c9be398d1639ba5c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -282,7 +282,7 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-	dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
+	dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
 
 	mutex_init(&mdp->vpu_lock);
 	mutex_init(&mdp->m2m_lock);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index da3a892ad867eedb4898509da8790981475e9a62..fae3e1ad2df758a50bd175479dbaf7a9eb859222 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -221,7 +221,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	}
 
 	dev_dbg(&mdp->pdev->dev,
-		"VPU param:%pK pa:%pad sz:%zx, work:%pK pa:%pad sz:%zx, config:%pK pa:%pad sz:%zx",
+		"VPU param:%p pa:%pad sz:%zx, work:%p pa:%pad sz:%zx, config:%p pa:%pad sz:%zx",
 		vpu->param, &vpu->param_addr, vpu->param_size,
 		vpu->work, &vpu->work_addr, vpu->work_size,
 		vpu->config, &vpu->config_addr, vpu->config_size);

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


