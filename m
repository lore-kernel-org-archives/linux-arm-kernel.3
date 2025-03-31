Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FE0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PInnCdBKi8aM4fbhPrQJn45/zC9pgXXJe6ZpEybvC+M=; b=PPUaRXGjmdc8E8aB1s2QIOWRcM
	51r3QNpRWpS68KuBt1pRqqMq1kf42L6Rp5Db9lGohZx+98D+vb/xW+Yuo/4lvYiY05cWeq6SIO/xg
	hwg2wUAE80HK/rHZyYf/knxIICaedAwkPw01fZd9xr3b0k67RLXLyPomCwda2X8+55m/IxVSuMChU
	Rr6Egh1zpPxCLBIeXTEWjnUD/RLUCbwqlk+EzKuKNtS0xXTgAlVrT1apGduddYfixDF7I02S87WzP
	prdNbWrX3vd0pEPI3C0P0yeoSifnjvJVLjXzGMTcCwvRWKD2moWy+Q8IQyV5hzhMoag05iHg7gXk+
	Tcr6bBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFZx-00000000UKi-0GHI;
	Mon, 31 Mar 2025 13:53:29 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFYE-00000000UEh-2d6F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:51:43 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-30362ee1312so7905629a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743429102; x=1744033902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PInnCdBKi8aM4fbhPrQJn45/zC9pgXXJe6ZpEybvC+M=;
        b=VECPiGEPqwQHTojV0gnUtAYwVbobOB+a66GlxEFEV/Nao59JtwJUFht0x1Og2aCaK4
         WTOabjkESLKOmOARl4xkMEIPfBiEjOO+neLFvXQhHa80wU+0p8904XD5/nJ/TG9E/tY+
         Kr+0Krxhh6qV872H1W7iaGQkr6xhMYkCMncPsy1L2e371Pbj05LuBP9qAcFsSU65G0F7
         YabIPBZjs/Avkae4dBA33rOCiSMC32lZTadQ+AqvOzXlaZxjvjpZNWuUQQJ1R9cibSo9
         X0P5Tl36kHYuFnnOp3SLoCIkItHzrDKebRxu/IeWywycuNp1yp8Url/3NPmuuuyj/EJj
         9ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429102; x=1744033902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PInnCdBKi8aM4fbhPrQJn45/zC9pgXXJe6ZpEybvC+M=;
        b=uvYw1v+9A+jqYqu9hL4nAzCIYvTtBCgQhocpsGv619bWdxWQ8fZkwLU+yVkdyhEqPp
         PgmG/Ni4ytkkmgF/xzp0y8j4bqoek/sc+C9rU9P4IbX75OqXbm+wgvQp1oMHcPclnsgo
         Kw1k/TpMV5ePHJqTuOyLXf4GbfjhL9d25OD/PIOHxUeLzwKQITTVSSXzNW9Yqm4BvYtX
         ssFzhSlBBJrGGwjSfmmvAJyTQZZMZQOCCCSL9yBGLwTXpf3gnriR/RyEgfbXZrJ9Xlo8
         XjeHv9TWek4Xx0X9HcQS14Z3NVeRQezHaV7Jbex72VpbhKBWTEAiDcQ+/cm+aWDLdsJp
         d5aw==
X-Gm-Message-State: AOJu0YyXB/PDp0nhCcY+HRIPIn5oYLU4hi5W+4bw64WOlbYgciZt4VQm
	kWBKvcJkQdkQ1xg/kks780RQpCztRrLL0szHocm3mWO4gciRpyGXslWcWsWuhEEFUg==
X-Gm-Gg: ASbGnctkHMq48X+LMqScHR2E70W81aeVvcR9kMLgwJnR1kKJatue8CLxx2My+/6mm6K
	j1wpEchst9MW5NDajE4kbSJ7IqB1943PafOIqLNQD5qIt/14hEVu0CDhO/G/kwuQj47iVhBPfls
	IMphk9YSSunKY09wNq5YtH43OhepqtdpVFj6R+UCLX6RNQ+3Hx/uDt8v+39wdNQktE5tYdpNi0F
	LvjnBgtYGawd2ZmHDAExIZ3l76/SGBHf09FPt4R8Fp9bPnFFDtNPJIcBLJDiq43n7b8+fj97gX3
	ovsag5h65Jfcf0dIlRiAPJGf2vo8oB2OMxvMp0E4V4mpANwuIt2F/D0FCluvaniBpprnAEs=
X-Google-Smtp-Source: AGHT+IHa8yleu6Tesplwr+MK7f1aRyjHejZjDckNp6dbjCL/LDmj1X0vASxGTqF38/Sw39ZjVBBpbQ==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-30531f9fb9dmr14645807a91.9.1743429101645;
        Mon, 31 Mar 2025 06:51:41 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b70b4sm9513637a91.48.2025.03.31.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 06:51:41 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] driver: tx2: Add NULL check in tx2_uncore_pmu_register
Date: Mon, 31 Mar 2025 21:51:28 +0800
Message-Id: <20250331135128.11881-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_065142_670984_DB86CC0E 
X-CRM114-Status: GOOD (  11.16  )
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

devm_kasprintf() return NULL if memory allocation fails. Currently,
tx2_uncore_pmu_register() does not check for this case, leading to a
possible NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 69c32972d593 ("drivers/perf: Add Cavium ThunderX2 SoC UNCORE PMU driver")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/perf/thunderx2_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..24443ab5d998 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -738,7 +738,8 @@ static int tx2_uncore_pmu_register(
 
 	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
 			"%s", name);
-
+	if (!tx2_pmu->pmu.name)
+		return -ENOMEM;
 	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
 }
 
-- 
2.34.1


