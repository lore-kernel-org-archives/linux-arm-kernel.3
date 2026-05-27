Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B1ACD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 00:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/qmpMpDGto5NskeOa7RLSttaP2uOAMocijbFFRGCfIw=; b=T+/Nd2OO0i4Id2ZWo/leOhQxxQ
	MnkORIHqLaRsZ0BbaOepH78zfih/sRN/HV/zKbGYhibhyL0EnFKp8F4cQZT7GauXEfxpVdwC31gNZ
	wdKYFFTFPwchZ/5ZgDaLw0NLR/QZYVZeahcM+8SpFAW37fTjD7WAc9bioXVF1VdnuKwK191VqDFRI
	RIM9zmUmSTy8DJvbk+8Zi+6VxIxcE5MNeMJneS4p3lAnXixY2ElKuWkNwozYWoXmSBXJcv/wSm8DC
	bEczgldQsRby7ZhOWZd2m5rki+x5/sUyA3Bl6e+Ze4PlXFlOG6xgmr3uttpKXJ/Oe3zMJx+YDndcw
	iCuDrIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS2PM-000000036BE-2ave;
	Wed, 27 May 2026 00:46:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS2PK-000000036AF-1SjP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 00:46:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2be1dd4af34so99712295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779842761; x=1780447561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qmpMpDGto5NskeOa7RLSttaP2uOAMocijbFFRGCfIw=;
        b=RP8uw5NEz+U3gJmiAOcTvXo7JTeffyq2+rFqWN+SCEeyf2NJvZuv2/V5fhlPLNzxBj
         l1z3DMe+WddDzq0a/5/LlxkMpVFE6EI7jx2vdy+i97yeMsKNpFH9EJ5PLtuHsSR1wdvN
         Bmrhs24G+gIPoueo4TdfJnx45vwhnal/nzkcVhkNaBzXuJPkKhhMX0cQp1O0vtCghoFC
         3QCSyGm/6BfCwhB6aIDyuyJ0f4Z0VmqMqkyKr8Myc9xMtPnNgD13iNI0qUcGxridx9C0
         yOe3ydYmo4Xjgd6uDYYsRBdUiABF620xbTasjiJqtalOUagi8DsZnzh2QwzSFCrHS8wJ
         Jy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779842761; x=1780447561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qmpMpDGto5NskeOa7RLSttaP2uOAMocijbFFRGCfIw=;
        b=XQN61oLFD2e3jzWXEO7B+QTn8Tg8jGjd2miHg8E5xAS0He1SW5kGINuQEp4BmAf3IN
         dUW/4UZz3hWIeaptBu2hCtcDnAi+kKtL7C6doPOCrKEHaom1bCgvX9fH1KO+zTbNmDRX
         UjiwuL5rYN2TtL/9y/duzDUiiPaItrLi025+dG4RZwhlb0FnxJTsvu2yxB5clNeFEAfi
         3L/42YFXP9p96TsdeohOe6ATMlYEMVA6AGgwxl54+MLtQl3cKnigMTmnVxu8E031cqcB
         3IgY6koL/KpoTc+SmF9HiaTW8v/aNkSaXZ4tHf5oOzr4+Bo5hJvbZ2X3ujEYP8eVA1gi
         A/qA==
X-Forwarded-Encrypted: i=1; AFNElJ+FAbuT2UVYmdlPfcfSJxZWp0jaN0cAz0oOwSkeOXswNv4Fwl7C+bMuYiJ39E8OWeSi9jOmd7KuIrADd3t5OVRP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj6QL91S5AFyo/qYUZktT1nISqOnWvINGtF+NDiT5CppmM8T5K
	FCNG2zSoGEbo5FFA4Ia38+Z68DDbBBtirp06g/U0396Rz3nxtSuXvCr8
X-Gm-Gg: Acq92OGEdhudQbhjOya7DEgO85/dtr0gs237I3/zU1UWfImVl9XA25u96UeFBBtjgaY
	12x/8aMYgFfayVBP5bhiu8FX3nVNNhC+4993RMp5Qar7JHlLEGebfWEnHydpPNvjZ75FceLZnUy
	8mBMKB1wDpEgKgdKt8ZCmC2WV0zy6PrMpIZjKls5djuW6q34V5B8e7+Y8pHIqp2gURkiAmIkaZ6
	285G0KvJvVjjectVyFLrEv8Y8wkAIK/wfmWcILGBal1l32wftHzhQ9JN9gsxtcEXNWr5vwzkrYE
	sNggXakbVaUvBiwtH8Egj5cdJfHN/HDKb2xMC0VbaQqgSScI7Ayz2oRILALpnpevs4eycwGnkg9
	meKzT0tNhC9F3NtZ7sQ4e2n980YdWOqqtMZSHXw7tC+nY+ih0fx4XH3wVtD8wnczOnNWrVMfpAx
	DumPTsEX8iiYhQwajYPAuTbdaoiYpr86ZKNJGNDzLa/BaaUm93LA4mKHEehFYBlgPeC5wROXfED
	VbpOcuCis55gOogTtQZN6QHMTbJLpaAxUA=
X-Received: by 2002:a17:903:41c9:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2beb023584amr219157495ad.0.1779842761021;
        Tue, 26 May 2026 17:46:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ea3sm138552635ad.43.2026.05.26.17.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 17:46:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] Input: mtk-pmic-keys - match loop with count
Date: Tue, 26 May 2026 17:45:43 -0700
Message-ID: <20260527004543.22875-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_174602_387940_7A1E5491 
X-CRM114-Status: GOOD (  12.70  )
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

of_get_available_child_count is used along with
for_each_child_of_node_scoped, which can cause a mismatch when keys have
a disabled status.

If a disabled child node exists in the device tree alongside available ones,
the loop could execute more times than the initial validation accounted for.
This might increment the index variable past the allocated array bounds,
leading to out-of-bounds accesses on irqnames[] and keys->keys[].

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..5d4ebbafd276 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -363,7 +363,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node_scoped(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
 		keys->keys[index].irq =
-- 
2.54.0


