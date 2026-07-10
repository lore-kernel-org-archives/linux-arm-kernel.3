Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C903C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RFOqWcsEwd6ePMQdZZ8QPUfPlo/GmYQwqUASim0itw=; b=QkX3cqlfWSyEGXaQkII40uzQHD
	TyyhQCtsCPQ5QvKgSR6JEb1ENAyHtY4oTq02vcyaQD2PA6uvYu+kbdeLepcex6E4itu1UmTolT3KC
	wkRQiLPkMdyUFNRQpe3Tsi5+BliYKcA+y6SkvHYFZQgckt3p5LvXbPSNtraMPqAMhLvtu6/gpFVlm
	pNwDEZfDX5u34jCaqcC+9zCRpxy+bw1OoJ6m2JVSfbTuf8SSl2OrbM/kCpchB6rxAjtP/W8ME3o1E
	lXWd5YxVWXmsbrYoU2XSLslfbzsdujCgq0AIQvx9A+wV2uqhtqb9oflsPtJ8vD4sYCbiG30dptOXQ
	P7jv/sGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Mz-00000004h02-2N42;
	Fri, 10 Jul 2026 10:22:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Mw-00000004gyG-35rL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:22:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so702374a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678926; x=1784283726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RFOqWcsEwd6ePMQdZZ8QPUfPlo/GmYQwqUASim0itw=;
        b=Bh3hvS4D6y/E+8EKFCyKiIDElU7uL/VDILuxEjWxSOyTYztB7wVYKLDh7jaSv/GMBB
         QcK/4OnTXJkIBohTXMCWTOKIpmkQfotqCRzWDk0WDSGW7qCQLVc7AQfG1JBy4h+Pj0zt
         jPJuD9J8Sbgbz14x/XkhDlLva8vVxosY0QCcik/MuBnQPhl3OJgV5csHQDEBtN5lJQ5H
         EdXPFgF60gl4plPGIQ4Wnv8pDvNOjsNC8iKrQ8JH3Uog85Jl68XnbQEdvR4A76AIIZVs
         A3lX8m3HT7KNr3omiqOAmrBmQ9z5QOYsh+2t6kwozDL2wqDFYxs76UjbJfE6JVzhBLG1
         Nx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678926; x=1784283726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RFOqWcsEwd6ePMQdZZ8QPUfPlo/GmYQwqUASim0itw=;
        b=Kct04nukeZ44l8q6fBTgpkWOiX5oPkfNtjJvCog1/cJ+kzNvNw11cTSJE/AeOYC7U4
         9wgXz9HnwbbBflBB6PKDa/ghfUueEYfSPiY9JuArE92goGEmR8aLfnep3ARXGSJ/PKtN
         Os5jKbCHE+QoRQoX4hMM7IYrCOAnANr/obS6mgKxarGUhYnAuKCX1vuHOcL1F297/iMR
         UzVhbhPNPq5MY8gLYe3bmWH3RC/rj6fw8plgy7En1/opOLpsos5Kt/RlWEB5m9PvTrgE
         8MdHaLtkefIdptTLvN7VE7K3aVchd/IGqUO8XGFpCqvXhttaoZnp2CtCYx54oJZ9zzts
         7uWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3lpGHvsBVlMNofC7BuX2rm2aYrbfmdK2sf5Rf0ImuJqzPq1hHbO8kjqTojNBtbuo2tJcBJZtfdgKfpBqbajIK@lists.infradead.org
X-Gm-Message-State: AOJu0YwSI9yYscP1BM3Bw6SgeZRy3dP8gXyVp/c1eMZZCWsT40Swd+lz
	axUBTNdmrsQ1tt+WfZIgdO9YbdF6y3oVmRmzUu9N1Tg5YiYua2p2X1ze
X-Gm-Gg: AfdE7clm1BIvHnwClxq2mrVmQTrU4SC68gm76XI8WGn3YXtg9A1y92qqun1eiPvJ6+Q
	ERN/FaQ2SPv9PwvWA+HbS9I6i8T3/37kBGjLfWG0rWxfUzv+OiSBvpkWp4duEwmTbRyzcK5L0P2
	vTok+zkX0M/TqUVA2ToPALpyqs28ry77Ka7NXrKS8rRUKq+2RuSceDGSKC/nl4SXefxbWy2SJiW
	VtwG3HUIVhO3xDTb8mK/s0jmAN0WFOu/wLzccVRniWMos1ARsgN9XyAYtosDxKEIM0HK6Zaa2Ri
	deHqZN0+7oJGfUeX29g+2BWlS2iPoqm/nJ03YjtiHA81ekSrGRn0KT5qwBZYvd9ScXgu3XrLMhe
	FyNl933/uoTrYVS/k4bzxnE8qrl3DKwry6khog4PyfUAMlB3Ms4G6tMLrlCOUXqzsVpZKkZvtvX
	whig0w0PzmA0DLjXE4vPpA+xMXc2Ac4r3463rFYB04t75tXhQ=
X-Received: by 2002:a17:90b:2586:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38d6d1eb86cmr1754316a91.38.1783678925820;
        Fri, 10 Jul 2026 03:22:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:22:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
Date: Fri, 10 Jul 2026 17:21:37 +0700
Message-ID: <20260710102138.29347-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032206_779971_516C8DF0 
X-CRM114-Status: GOOD (  12.81  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

devm_request_irq() can return various error codes, such as -EINVAL,
-ENOTCONN, -ENOMEM, -ENOSYS, and -EBUSY. However, the driver
overwrites all of them with -ENODEV, which hides the actual cause of
the failure.
Also, devm_request_irq() already reports failures internally, so the
additional dev_err() call is redundant.
Return the original error code and remove the duplicate error message.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 017a64ab9f1e..deb7225c1b4b 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -274,10 +274,8 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, ret,
 				       xlnx_spdifrx_irq_handler,
 				       0, "XLNX_SPDIF_RX", ctx);
-		if (ret) {
-			dev_err(dev, "spdif rx irq request failed\n");
-			return -ENODEV;
-		}
+		if (ret)
+			return ret;
 
 		init_waitqueue_head(&ctx->chsts_q);
 		dai_drv = &xlnx_spdif_rx_dai;
-- 
2.43.0


