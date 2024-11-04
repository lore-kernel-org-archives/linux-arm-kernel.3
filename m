Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37693D111B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IPe6UqXwt1Jn9/ptU0rjFmhQNp6In8Ac0X1HQzny+Q=; b=tukbP/sNSpnTnNnI102LQYf0LO
	6s9GO4wQOoD2ptYh81WEyzLm6nBrGyMSwf55yQ4M/7q77PR5Mt3OLYqIdZZXmBPfUTxwOXrbuk9vo
	TQdCVXyMBvTpIAAX3L2bRgJ8vFscL3f3PK6jdXfiUDAex3oa7rLO9heKpt6AcSS2krUZR2BHU8idx
	BNgP0mE5U7cVHi3R9tm1PoOfezRziiTSk+vcdHRIYLk/N+iyLQqRGZmhIHGXtM6U2jYOmoeYfLQX1
	nesaIqIVv6XVODYkxsbkCte1EnIahomGqw/ZONu/77lQscnIiDrtYWChSAROVIKOk/TaczlQGn2v/
	b1LoXyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rqd-0000000CtV6-0Zgv;
	Mon, 04 Nov 2024 07:50:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7row-0000000CtGK-2Ekd;
	Mon, 04 Nov 2024 07:48:19 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5216122E;
	Mon,  4 Nov 2024 08:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730706488;
	bh=lIE2kYZAcfccRQOGzfpt1usumoHzGDS1Bwy7k9LLV+E=;
	h=From:Date:Subject:To:Cc:From;
	b=BGmUGZveLZQN2MpLF618g5rb5aAiPbO8bw6s4OPz3c6iYyzxCxVZj49vdBsHxe9nK
	 /TkAEaDpajkRocAuxaZ60q+ceOtboaANMFoBTwFPt1GAZm/d8sxI4tRtg0L8I9XgQc
	 Hyfr8vKtS6YvIsswuoR4DtMkzSruw3JoDX1rKE0s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 04 Nov 2024 09:47:54 +0200
Subject: [PATCH v2] media: raspberrypi: cfe: Fix mapping of dmabuf buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-rp1-cfe-fixes-seg-size-v2-1-2afd9f6f9fac@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIACl8KGcC/4WNQQ6CMBBFr0K6dkyngkRX3sOwGNoBZiElHUNU0
 rtbuYDL9/Pf/5tRTsJqrtVmEq+iEucC7lAZP9E8MkgobJx1NaJFSAuCHxgGebGC8ggqH4a+tSd
 7CdTW5EyRl8R7o7j3rvAk+ozpvf+s+Ev/Tq4ICJbIDy5Qc+bmJoFJ49xHSuHo48N0OecvgjVO7
 8MAAAA=
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lIE2kYZAcfccRQOGzfpt1usumoHzGDS1Bwy7k9LLV+E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnKHw5Vu8U1vmF8yEBEzPMGHgPaEVEwdvzzIApt
 /MP+Y9gKpmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZyh8OQAKCRD6PaqMvJYe
 9XcID/oCe7Uv2FXQrwj4bGBwcq9WWXRU9MVexVilLDXe8nzSBB73N6+QCNtpWKNSo7pRDBGush0
 a5bI/js3YbnwNwf+aEt9ZUwmcQTuR8KDycf+o+y/hUrCq8k8N1aczqcdmOYbbBncB7rS7jdF0IP
 tCOYLb4gTsgBNpq15bBFUyeCfASxt9qIa+zpq9Rrx4kJhMlR//Bls5gTZT6JWkIoENS9s/Se2j2
 tz0BQV0rwC2Q4m+xz6Wnp9zoKHwr0Y3Xy10t+Q11zu5nzqT3AlHBWsHeUKLUNQEPdnTYqhHgi55
 +hFOuG82gt/e1ved8pBqy9wp38GrihDvxrg1XWNYEtHCvDK0hRiayJtxo1rHvEd9aarTEYVMSVI
 UlluKC13oSnp3uI2wnMLqVFxzbFKORlC5dlgKoo3xBdT/AHlDqoLcU0cEH3goGsaCxCadxzNUZD
 PyUZ13WuEnux+XSRg4oCyfgAlyR/ZZxjEpvef+XPm5i16S/VeS0Fim7WyXl84Ug8DXulrSJ/NeF
 cXeNFbovzuhZaiLb04We+Q0AZmjDAiexeYY59AIFOZRb4ckPMsRs3SLo522i3GLXcsaUOewcHeJ
 YNvE25ecHZijTngKZ78tI2cc6KNDg6d9IN8q1Rj0TfieSeGXtksr4fACog+qlLys1zA64QqEtMt
 OXs3uQgsczK+47A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_234818_760028_02D56BFE 
X-CRM114-Status: GOOD (  11.84  )
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

When using buffers from DRM, DMA-API gives a warning about: "mapping sg
segment longer than device claims to support [len=307200] [max=65536]"

Add a call to vb2_dma_contig_set_max_seg_size() to tell the DMA-API
about the supported segment size (which is UINT_MAX).

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Drop the error print, as vb2_dma_contig_set_max_seg_size() already
  prints one.
- Link to v1: https://lore.kernel.org/r/20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index da9e1a1e4d0d..e808c80cd37c 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2341,6 +2341,10 @@ static int cfe_probe(struct platform_device *pdev)
 		goto err_cfe_put;
 	}
 
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (ret)
+		goto err_cfe_put;
+
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(cfe->clk))

---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241101-rp1-cfe-fixes-seg-size-b70309da74a2

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


