Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B802CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fE/8k1v1er6yt8K5zlufTxmneZEuI8I3OJXU6lY3dxA=; b=1ZNaMD4fYkENmICoTXKTrJ+1z2
	MUMBtqZfxpsBZJaV1bRz0sOedYzZMuryHIvjLoOz/lQifX4Bd7hTKS+Px5WW9NtiMp60cIcEXslqi
	9gEH1+CXQ9wlmpHjlUSuEOXI8MG0TxU1algpoKlFOpRecBWYVbuOXi3ITKqpPIyn55jDbiwIPph8x
	k2r6aja4tFqKsi2mYsGDWMpsCZhbCFF0hjw1awRPWL+fMz6l8i0uj66jr0baG3FG0czt72ug6RtAf
	Pss8YGmZtfRsh3h9Ak2V/kNJ/MznkjywFrIdofXeyqSSMOfH9YqcRfm/1IMhHNqekVojb0RHzJGIy
	cGhVOh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkvn-00000003RAA-3hCL;
	Fri, 16 Oct 2026 16:37:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkvk-00000003R9g-46g9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:37:18 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso15538a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168636; x=1792773436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fE/8k1v1er6yt8K5zlufTxmneZEuI8I3OJXU6lY3dxA=;
        b=WCc0OD6wR/dKX8V0HgnPm6kY5tyu7vSP6bgNStUeJA0WR6nckBEMLLiIeKCk5E6zLr
         MitJ+drdMKMT68ArvX4ONSAct/4fBqDqSiflTpwnFi4jgDivd82zBT59m4pfbuunkc+J
         pnn2ygykGCgtGDfqT0mejeO0ASwd8//1JDFf2iQD5LK6Z0Vc3eb0N3QPlaWa+fW37J8d
         uugIfFHFLRdW8GgUOekHFPIPq+RJgc6mX41VyffmHm9kMGoEFjDDmqMic3OI717xBC2e
         QvnWdc3mbjsigC9/trHFEotji3+LyUV+1bbtCrLUe0EXim0GA/CwpbJ4XF/h+70Em8Oy
         OwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168636; x=1792773436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fE/8k1v1er6yt8K5zlufTxmneZEuI8I3OJXU6lY3dxA=;
        b=iD+KwJR8njozrOdcybdFjo0OrgS7/hIEtqImkY+s24R8qnsKRsk+NGq3cNSgNAbwQY
         24n4SAZqE7bNhf/WTyrqYNTQ2+8hYJuNaDjXJ5YQ5qWBjuZebpYxJGJ/gk1FtpXmpqRV
         BJZ0wLyqt3I28oalTNz6G3m4ESefxcdlmECHvCgQEaVwgF0dKhywRWOMfTXzRHGSvksU
         hq4ZCqv4RToK3ghyhAxDl0eXI7Amu9lrjHCWTxG6m99ISSxCRyqX2fPVGNlcP9qrjURB
         yNhaq2fhp1uXjNQScW/WPqdyAWkkFcr76VUfhmqnOeXpkK2irfZr/XEoFygkRjt1dlgW
         CDYg==
X-Forwarded-Encrypted: i=1; AKwUvBz8GjH8rwxW2pJWmJ4zedU8W6gwUlxloYzxVHZ/ku1FKB6Sd+OPsGuDaCVJK5vGQrDOa5+AWXDtVD1dUiPsE6U0@lists.infradead.org
X-Gm-Message-State: AFq9FYLYDf7ECqOxPetIqUd6JJpj0NxWMsP2xPrCndmOB4jJcncDostj
	JaRYCF3Crq3IdIDroaJ3H7Q08GpGqB4ciHEPOReiEMS13zvj3KoAop1D
X-Gm-Gg: AYBFou0M3x9Z7HcF/RxyAyIguieQMsEGYFTX0KieuA34VaHF+WtZGUJSPcPfDE/Ae3Q
	IZhbfFO2JcPSjTe4tVmM1ma7F64WW8s5JeZOoV1JVO7buauymtCnssnOXG0Ri1TMn41RdOCy80U
	jzKsczrn9kNlVWShgxvQQ7LAt8J6B/kRPoPb6EtH7SEoxqeGYisMLqtVhMrljhPM/d/B9g6coAS
	fAmUxL+EZT63A2A1kqlToyM+MCBSu0tZPZvxPU8HT8XybnSpAsCHvN8kaCzPLBKvBIRDb08/URw
	Fg1rw4YkmelW4Pq12CJdoUeyMPklfNdQPHopyZNaP8l3ttcVkiWxhx1YRvfQduN7MZnzU/clTBO
	snay5my8oc0a9KJ6ZguRFdZXVaMuDWYxel8HbZcq21Aa1ia+GIZYoxfXRXI+rKzdtRUd6n0QldA
	P9ELdE7aSI2CsSE2GxeGxnB1S/J3h6DxhN41Fg/OO7+vf+LXcLLF6sXQpX7E9sKA+6Jg+w8+pPG
	CLayTuSTc6HiU1sz/WOe9E=
X-Received: by 2002:a17:90b:4cc6:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3aceebea420mr590463a91.3.1792168635662;
        Fri, 16 Oct 2026 09:37:15 -0700 (PDT)
Received: from MELOKC-LAPTOP ([61.171.228.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm11154255a91.9.2026.10.16.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:37:15 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mmc: mmci: fix DMA channel leak when mmc_add_host() fails
Date: Sat, 17 Oct 2026 00:37:07 +0800
Message-ID: <20261016163707.3508-1-anferneemelokc5@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_093717_021097_737EDAC9 
X-CRM114-Status: GOOD (  12.08  )
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

mmci_probe() calls mmci_dma_setup(), which acquires the RX and TX DMA
channels via dma_request_chan(). These channels are not managed by
devres, and are released only by mmci_dma_release().

If the following mmc_add_host() fails, probe jumps to the clk_disable
label, which only disables the clock. As probe then fails,
mmci_remove() is never called, so both DMA channels are leaked.

Release them by adding a dedicated unwind label, reached only after
mmci_dma_setup().

This issue was found by manual code inspection.

Fixes: b38a20f29a49 ("mmc: mmci: fix return value check of mmc_add_host()")
Cc: stable@vger.kernel.org # v6.2+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/mmc/host/mmci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 416bdb184ed4..4db5c55b2700 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -2477,11 +2477,13 @@ static int mmci_probe(struct amba_device *dev,
 
 	ret = mmc_add_host(mmc);
 	if (ret)
-		goto clk_disable;
+		goto dma_release;
 
 	pm_runtime_put(&dev->dev);
 	return 0;
 
+dma_release:
+	mmci_dma_release(host);
  clk_disable:
 	clk_disable_unprepare(host->clk);
 	return ret;
-- 
2.54.0.windows.1


