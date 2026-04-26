Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC681FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xZ30A4JRrqrMCt4Ckf3/WljJoHffiX5vavkFJli0OJM=; b=N/MgFOPWcbvIfr/47uUH/kud+s
	j5DZ+PpOBDeD71ftQb5SAftLVcPYS1cJz6rbRv90m+10cxRrTqEWeAiNtY6+uSgfIvNnYejYerijg
	mJF5vxSQndzRWOVwZJuZLQSbVhtmvFAM+vvqHpJaVrvxzdveJr246zjm8Ka1WBNpf4x9HPazZL4s6
	Enoy/q5xMFjl2Jdb1UmKgef1tddLnvkisAZ6ZwfGa7/1I8YYomewmIGLqiI23M0VjDmkiqKw+6pBD
	Dz2TpuD8CcwfA9OmP7JTegmtmR+HyoLcQgQSlmZQ3UiBMLMlLlX9655LwDrO2SMO/sUjbcXYb8qBc
	c3kbOy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6dU-0000000FqA0-188m;
	Sun, 26 Apr 2026 21:03:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6dQ-0000000Fq9b-10p8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:03:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso69129655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777237401; x=1777842201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ30A4JRrqrMCt4Ckf3/WljJoHffiX5vavkFJli0OJM=;
        b=SsPDAy3Zfu0EI3FMXca21uUedJQWtuSUDc+56TqYiQQgYR2s2p6iFs2/uCL/vA6Ngr
         751n5sySRaaOORXD/Cs5JFd1H9f36edkoVEooTqDDq2P2vTzaLmbephJ2qrGZOvktSpY
         7dQzePGqLLFYdM66mDk6fV6xz0IJ4VAXtbCEd7zt+O8W/t40UuIrt+QyN62Z1FOrsYkO
         eOBKx+CiCb71qq10nrj4W9ydcOveLRTt6pMMi5PHitFIMdtymyT8mSdkzNpwAL7rL7mv
         EQNolaEnxAK4KXx5de5eDwsM5ZaDpjdtoigU6wpEHh/YPkXP7cAeHiWaA8dwHKXN+42y
         AHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777237401; x=1777842201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZ30A4JRrqrMCt4Ckf3/WljJoHffiX5vavkFJli0OJM=;
        b=M+NGALa/wlLPXBd5eflkZX0AFmhqdZJum6/eqM1a3YxSMTBFIE2NrIkuuRSyR5sX4y
         7UacFXkqv5mkpRouMP7c1/8aPgnWMLK8fP+JnBGb8XD/N+srM48LX5vYNPUKEpDSyXiJ
         2vjBff5HosADo+YWLTa19jAo3BU3+aU48eoALs9AWD9aUSeOLqGW6bIPe4npTol61Gcq
         KSadFgZavpRyEegXQ8Yp3PcqcxdJylz3/R7TRVQR9uVJe/OtSMvu0vGipD829TMOzbEy
         e3KCN/XrRxuD4dbFroFsdhzbjxudHbNAVxxDyG39/9QjlTZYdt2EK6f+SSWsS57CWSre
         2rew==
X-Forwarded-Encrypted: i=1; AFNElJ+cAEgq8X2fxaM35tP6bRBoWGuBWnpFJCloCDfoHsalxEUZAGxsHaQODeApnGeWVmxW1EV+nB9c5YBrNXG9IcAZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwrjDa1g/KxtBz8kp77DYbtZC9zVFK8TS3B8Fm64wI4Hz3eTYpU
	rdTQdtyLAskVaf1jNDktSFHp+lRVTV3XwgxXZxt7YuwZoZyx5KHULsc2
X-Gm-Gg: AeBDieudIss8+TB+Th8wP8eTBT3mBdRwsTDJbVl/EfNUzFDjmt5g0+iiawWGJiIrTyd
	IQUROqFBkQy166lhdmBTCFi8raOy/bvlWSJXYc55s9NAHBg6DvIxs/0ciYiAEdis23Wck4OgDoZ
	deKV9oraTVHCoJUU7WBM0xaXEM5mJLnFOsHnBkbTcnxh6Opnu+B3vH+kxDOpVu+KzXRyNC2jlsg
	QabxwEVCzX4uj6wqcri3PVN1jG00WolmQkzjP/tHnSAYPHMmvDCXduce946rpzO60ShWS1OkKEV
	rdlIGCxlYEO9zGgYCHEelFQ9oxBUNlSVgR6yHdd9+gH4C0b4HwUWkyMR2yncXsqL2nQUdGpK4/Y
	Tkkq5Y+xDgvcehzpR4Uj8HJUhU1/rOPmMUizh2dtpfNRiKiQJLx0NYW5A5A6XbB9JMPDbhqxOwu
	48QDWvZyJKLQMWHs/XDNDuz1BUVJc21ugOkBBSx/X1ix/llbiW9nsSmqd7t4iOmHZkgZg0
X-Received: by 2002:a05:600c:4a15:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-4891aed16d8mr256485525e9.23.1777237401330;
        Sun, 26 Apr 2026 14:03:21 -0700 (PDT)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6114f2cfsm81640525e9.35.2026.04.26.14.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:03:20 -0700 (PDT)
From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
To: tudor.ambarus@linaro.org
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Subject: [PATCH] firmware: samsung: fix stale response flag in acpm_prepare_xfer()
Date: Sun, 26 Apr 2026 23:02:55 +0200
Message-ID: <20260426210255.73674-1-titouan.ameline@gmail.com>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_140324_289165_C51ACEFB 
X-CRM114-Status: GOOD (  11.82  )
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

acpm_prepare_xfer() only ever set rx_data->response to true, never
false. A reused sequence number slot could therefore inherit a stale
true from a previous transfer that expected a response, causing
acpm_get_rx() to enter the response-copy path for a fire-and-forget
transfer whose rxd is NULL.

Unconditionally assign the correct boolean value so the slot is fully
reset on every reuse.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
---
 drivers/firmware/samsung/exynos-acpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..2fee6bb60efc 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -380,8 +380,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
-	if (xfer->rxd)
-		rx_data->response = true;
+	rx_data->response = !!xfer->rxd;
 
 	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
 	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
-- 
2.44.2


