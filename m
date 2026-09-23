Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67160C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=; b=i9M2mog7RCKRfV4zB7sgC64Q3s
	cbIzUgqICYbTi7Otg3s6SnuwID9OAObeauFu4zDibuEQ0pfBGWHwc19njU47cuWaEedj9M9FED86N
	vlCtbNRR8SJm6F6vZ4RvXysqilpEsEcpgtLCOLr3U7pcxUisM+iDEHtK3s70tFVb49ueAojM4M+cV
	X7/hZp4dGSYEE2S3Bdcw2NcB3X6GI3kYavF09WJWu1U74LXWcivWUO4Gaij2bCpDMmV3T1k0GxDq0
	lSxCAAckwNGAFDm7cyPZCgxOXBB7hhb4oEcNWc9U4hAkug+EIsF7EJHI/0KT4kRveZE2f4cW8Ichr
	r6NJOoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IaK-00000007Zqi-1hFl;
	Wed, 23 Sep 2026 08:44:12 +0000
Received: from mail-pz2-x16.google.com ([2607:f8b0:4864:3b::16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IaI-00000007Zpg-1KOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:44:11 +0000
Received: by mail-pz2-x16.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso561148a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153049; x=1790757849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=;
        b=AfszeG/uX24skQ4a+eVkWxiruFY2a3R1pSYG7ahkISAwr6s8HcEiT3PxmXKO6vG93l
         vG0/wYXR2h8SlwMr+JQYGeS/p/AftUqj6N6H3URDrTxA5+L2WId0R2DcmJhj1DYw0Zj/
         cjl7cwNow0ogtNnslGEgHn8IsqnNPmUc1TqZrBuD8Ag5oeeAcA0qzBz/OZQ7DkChW0da
         r+Mi9dMPtZrhWQqTpL/qKxLRmO7qHoDkaxsOCejtfI79+6qrQQOGJRVZMpLWf8PQ5YMm
         MUs1Q4fmzzWg6yl5R0eDLXXbZPC2vY/cBTGu2/Ah3HEfmt2PsBC/twoCvKPsBa9QUUR3
         umjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153049; x=1790757849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=;
        b=MofEMPsb2+mLMpNC9X8OXfyQv63z5hCf92t9qpmu7OtNKGJTLhIL/MQbsj2CHIc0va
         HfwwvG0m74urjimptktx46ttpQz/qSGTPorN6OjlTMmGFRmISrDYk17/a8NLCqmOP9cB
         YPnZYzZmt265qJY8yJbXo4dmrEaKbtUP9fcYq/Ca9bf7ESGgpvv7slkvmhY879JScosq
         uTuWfyzJcoQGwIS4bIP0janF3kLQ7hqdM7fzfpSHA5bjlGG/genf5BlN7IPCcVHUZ/Ft
         uFELQQE6S3uwJ8P3XzKY+N5HgB9o3X94wgv4b/lRKxzso6NXUXvSRwJSuGVGRhKQp0HA
         +PuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbVmi3dX0jn5ogD28ZqITcfIhcAJVFizQbLrCGZd7U4W44GPFH6JG2/T5M3QP2nPlWgxYONCPBctk1vYYpYaUn@lists.infradead.org
X-Gm-Message-State: AFuF++lMdCSz8VbHuJ0L1UU7z/e+7zsBUbuUuCIxZUEmOW2/AzLIpJGT
	6a5eI0hfFhXpk2tUXwyL3Mg2TKQ9PMrg//BVG21Ys4MjoJRvzcZzrzCH
X-Gm-Gg: AYBFou2nLsnY/kFIu6mZBwcA4clE5IJmDXX6B9W9sKWaLoHXELTIV6vdcqncf3Efc9p
	q6Mj7APO78qMVaExAB+E8Rkw2pm9aA3deETm0xDWe0rGLMTkXrE2/f+l/4in83VlAZiO1y0USgp
	bql+AklLZUy1ACbSSvMMqP2cy1vCUOxEFnkORttFVLy8tEjjgX+bUEVLK6my3p87Kw6niTM1DgF
	j9cPkj9cyBxrSCoDrWhz7yCleuK02sKki3yy4bV9OMO3s4VK8HYzJbArnXbSR3oUOd/f+vWWV22
	xdN05XMH9ME1zTW/CQlS+zVPXx+e63i3kbkyjFXzOElNy7/AVYHhA242OK8M/s2zma8IH2IHuol
	Dw6cxh+AYa2lQJZcvK3A+XDAWz1JJexGBjQY29kjanQuX3DyczIA2fV/tupxzDeoX1KRycG+LpJ
	4+N5j0pLPvQyUPlYxevgsjspSul4YPU2XokibaH9zRUDnHHEX4zp0VAEvI2XA/fhVBvp0PjLqGT
	8pzfca+jE9hHEloUh+wviIhfoMXxnEUDbXLta94n5ZmcXg72u2PGmFva0B46BK1LW8MDtMhD3vu
	nA==
X-Received: by 2002:a17:90b:5825:b0:39e:6c68:c77d with SMTP id 98e67ed59e1d1-3a07e6b5b65mr1774611a91.51.1790153049477;
        Wed, 23 Sep 2026 01:44:09 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a088cf5b02sm1534349a91.14.2026.09.23.01.44.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:44:08 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: claudiu.beznea@tuxon.dev,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mchp-spdiftx: Fix a deadlock with the interrupt handler
Date: Wed, 23 Sep 2026 16:44:01 +0800
Message-ID: <20260923084401.65336-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_014410_368175_6ADE201B 
X-CRM114-Status: GOOD (  14.78  )
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

mchp_spdiftx_interrupt() is a hardirq handler and takes ctrl->lock to
serialize the user data and channel status updates, while
mchp_spdiftx_trigger() takes the same lock with spin_lock() from process
context.

Interrupts stay enabled while the lock is held in mchp_spdiftx_trigger(), so
if an SPDIFTX interrupt is delivered on the CPU that is inside that critical
section, the hardirq handler spins on a lock that the interrupted code is
holding and can never release.

Take ctrl->lock with spin_lock_irqsave() in mchp_spdiftx_trigger(), like the
other process context users of this lock in the driver already do.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -306,10 +306,11 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substre
 {
 	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	unsigned long flags;
 	int ret;
 
 	/* do not start/stop while channel status or user data is updated */
-	spin_lock(&ctrl->lock);
+	spin_lock_irqsave(&ctrl->lock, flags);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
@@ -335,7 +336,7 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substre
 	default:
 		ret = -EINVAL;
 	}
-	spin_unlock(&ctrl->lock);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
 	if (ret)
 		dev_err(dev->dev, "unable to start/stop TX: %d\n", ret);
 
-- 
2.43.0


