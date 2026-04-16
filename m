Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E950CF8A160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Ak+ZDEB7WeybsrLIOMHRS67N6O7QONYYPEi13P7yBA=; b=iDTHV0wIV43MbE8E7w2ZNGBcEJ
	stoS4ZDwtISOyoAcQxVRonGStARZQeZ62V8vBjk1tiNkdfscAr/3kXvmz8UrWS3xWjS0WEtseXwjR
	g/pJ2Zqpd2H5enA7zQj76kMAdUYrAg218PLVRIW0DfX+e4N3x9SOd54bpIXTbKoM7NFrJNyjLdo00
	e8IvcBGZ3VYQwFNd7gA8I9QFK4skrqenF2jceU5Dv6Y22XF/EjWT2FEYUU4Gt70ORHgIEBHoHgQeP
	d13x7fAPl/RsEUytenC5fgmfWkq0LjUBOdteiQYuimauS6D0hehZ0h2QPK57lrFcnxMekhLwt1Ez2
	Xh1BRXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLAx-00000002P43-2pTl;
	Thu, 16 Apr 2026 11:46:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLAv-00000002P3E-2fhS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:46:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so283839a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776339985; x=1776944785; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ak+ZDEB7WeybsrLIOMHRS67N6O7QONYYPEi13P7yBA=;
        b=Kj8I/fP2iiMGOsTTo8ItCB2siFGrOnIVQQSdPku4seva3Ndk9WBiX/PPEdXTI7QJ6z
         hwtWfW8ZayLbuVcmizkQ+w9R1jyanZtettkOYCyAiq9T4sH3yxKPNmzFRtLqUYG81Y2e
         ltfHZU15O451co5UPf+BVTajNpTIIjDh2mWUyj2ReycVFSdAfbgB9UO9CTKLMebnKBxH
         WM7pTRIjWAOEepQ2KB9A+ITNKEdiLFq8nr8fgwFZkS0MII0j/Rj43dIxayvPLqHCar34
         ipThgXWkTG8cEhvc8Yq1tP9356tB479jKyoyZbzXHE9xDrjIR7gOdDnGQLGUQ+c1tSZP
         IO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339985; x=1776944785;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ak+ZDEB7WeybsrLIOMHRS67N6O7QONYYPEi13P7yBA=;
        b=a1NbtzwzSeVEKF6FJ7+uGtlHe5o4RpKyk52nQSUBfqvZnjrdacJj71XPaymF75PPJ7
         oPyn2tj4Xqy2XTAMyNPMi4YrqoIPi0dBVmiVeN9SYdpMTuYs9WBU1ENSF3zkHPijb5jB
         +x5Ds7UGWvdShnQ3dS/397KpWF3WMFwF3pClNm7sot+CWvpS21hO4fedp3Tx0qa3N14+
         XlCJ1fWDODP8NGX/qBs10qAf8pHU5s2bEsRqy5CSatxgeVGmScSU+2tk4UhXz9Xs9wtl
         L1EW6j1ndJWRSO2m10qEdl51AR+CNwPOdv7rD4bNq7eWYlZNSDQgdqIQFW7G2Wf0YYDt
         QFdw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZEg2vLfcj/0rvzPfMDru60nXjCOEjZMZUlBiRlBXkxUWcTVrmxOc8aKhST+0uDffN/MTJ5Q5bCXWXDdmfjjhn@lists.infradead.org
X-Gm-Message-State: AOJu0YzjHc6+4NCUr5sr++n7dML70sRvvXUfTyGtc63iigsVtE8GOE/d
	RThLQns7b4H9v+BxWS17k3lrnisTVqwFW3tbbnuQqDfxhntScaBWrj3F
X-Gm-Gg: AeBDievrgEZwsUI2rT+4+4JlGZF8vOHMvWefauTA76PZj8ztgLKlTe8rntr6PmnPB5l
	B2V/xnbRQijY4JN9uPJ1VQ1TDL4tHIg784PWayTDxJcpb8Rt7QpA3ps9D8xAw1DMB/BhcqzapnX
	JSCV2mDTUcKKKAQBudCTKzzVRDU6v6n5KOg9cXby4KUNwqEJS+CIW3tTxGzaB+GdVKjM06UUYBh
	jlG9DS0Jta+QLEgAfMu+J/b93hhWAld+RHSuk0aMj02VPRv28FsrCcmCqgQfH4HXH/MND8H0/+H
	NLRjeROWWYiGTbrpc9idd/1MD4Ku+0VlqnENTJ/dM6VV58xtEFjoMbFj5Zp1wHDjZ94fbyW+ZK8
	LrLZ3Fs7B5Kcnh3+/m7hdEUGCuExm3GIJs47SixHZl8opcEnpYnTPCjTcMIVEj/Ttgz2KTyDpId
	jA5ldyMUh4iYu1yH4Eu1DhSjnm16aEuPCEKcGDGTDw518hh/1mnK+qg/FRd8KJ3Vyy83rUD2AvQ
	Tpq0UKD7b7hZnuCP5iXgzPK01v2xxE=
X-Received: by 2002:a17:90b:3952:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-36135c6d422mr1195562a91.2.1776339984508;
        Thu, 16 Apr 2026 04:46:24 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36132d01150sm3055586a91.14.2026.04.16.04.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:46:24 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 16 Apr 2026 19:46:20 +0800
Subject: [PATCH] spi: mtk-snfi: fix memory leak in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-mtk-snfi-v1-1-fafccfd288f9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAvM4GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3dySbN3ivLRMXTNTw0RLCxMDA6OkRCWg8oKi1LTMCrBR0bG1tQB
 NXuIaWgAAAA==
X-Change-ID: 20260415-mtk-snfi-651a984002ba
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776339982; l=1399;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XB1YmbfqO9Kx+UK9NAZHUwfreTrkYt0BW/+tigI6sTM=;
 b=HdxlppJCMd5S7npIE2p7HIyJ3C1bLlGGm6txyaDjoKu/faflIykPEP+jl5yqiUDjiXFBSkwmA
 W+GU00d+C+uCf5klSZDikIGK9NNNS+RbAUxEafQxqJZTlPGQhcbnlqW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_044625_677002_CBE6FEEF 
X-CRM114-Status: GOOD (  12.75  )
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

ms->buf is allocated in mtk_snand_setup_pagefmt() but was not freed on
the following error paths.

Fixes: 2b1e19811a8e ("spi: mtk-snfi: Change default page format to setup default setting")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-mtk-snfi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 73fa84475f0e..a728cf571b78 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1447,14 +1447,14 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = nand_ecc_register_on_host_hw_engine(&ms->ecc_eng);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ecc engine.\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	ret = devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
 				       &ms->ecc_eng);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "failed to add ECC unregister action\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	ctlr->num_chipselect = 1;
@@ -1469,6 +1469,8 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+free_buf:
+	kfree(ms->buf);
 release_ecc:
 	mtk_ecc_release(ms->ecc);
 	return ret;

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-mtk-snfi-651a984002ba

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


