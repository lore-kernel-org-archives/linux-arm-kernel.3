Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 00:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=; b=Fv49TE8TbHoHwghLkspGC5fv+q
	+Q0qv1DwkD0XiOkL27HiiObofgrwxFshDntqcQhNMmsz4g8dP9AxHvIgIkRURh3IKtYQYY8yxOCcG
	xO+waSFXo0QH9iVPdL4KSsbWCo7Ix/zIjMZoMMLqEVUyC2tgL134lOp3aaAekpOIJ4rKzuKf7gLa5
	At3o6oMiiXIHpplY1QKJEVQ8Wn2HazI1Et2x/59h9epGMsndj+wACED9lbMAZIgqqofhJ9LD+NQdw
	eV2uaL45ADTXlb1nDvn8MMARn4IyGPrGN2nSdSRJ1VzA+WyODgMjXApDfjS7ay1+VrMIo+WqkQIYa
	+MsljqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQvR-0000000Aak5-3dy0;
	Tue, 14 Jul 2026 00:23:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQvP-0000000AajN-15J0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 00:23:04 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8486672f03cso3313221b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 17:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988582; x=1784593382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=;
        b=T8Q6qiAIpk1up3kfZJbJKG7ClTakdy6q1MerLdEj0T8U9FmOM4yaPaDY9aj4DtAMTx
         W5kq6QhCfFGahcjeuEWpl0kOQD5E3epD5qf1BQmCOKWu0dbrqu42+YdbtWSECQT35jwt
         NCJJIz2kNB9RRS8VZyj/IMMbYAJivrm8D5bQlj4WoAOFnDyn+MoR9nyGsH1mxrf6wWAF
         I/32p0mXh+99OgiZ3OmN718rZ7+JZOWaB1GrfHhhXhJWnJ3TZEFORWMBn6L/Q4iU9f7A
         hDtzhSEo++DL3WE2aRTn5gTIp52yVmyHmULKfrYxGaf6zC1RAKgG/KurV0zDgwhc+Kxt
         K1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988582; x=1784593382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=;
        b=qeKDJF6GcxgoHe3Vtx2D4YHYcdPzSd0M15hpH6X4WWsjpe5BNYHwShyZj3I7szWgWh
         yyzY3tQ0ZAZSZIVVr95iNK6N99JbGDGY94JCC6/SqHz7N0CVGaq32ESJcHQc4H01wRlr
         pqVKoi/i+j0ERULD58GvVYGzci9UVzXcjRLCd6bKf2t2y98E1TuLYMQMvaqnspD9oPiC
         cxd5bpTKPV47VFt33BNnK4Yfv/c1zF+fd6uiucEvKcHk/8aofnIqsBzVfySpcPXvAr94
         Cko+Jd9ghc3ncwfiy30Ql7ZX3J+diAvA6bxyPpcRxVYKcJJdI66el2KgTgqBYats0CPx
         Y68A==
X-Forwarded-Encrypted: i=1; AHgh+RrE9yVjijGIFk6Gu+Fo3t+ML1aJ/LqM4DGatkMGAvWOxUVVDOfFxR3YRv6pmbsb9FAl/hhjXoGYYcctvTrHVcGO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0xsGZYMAfPY1agiEcJOKji4bhVgAFrvMrrZqe3yiVX28nh2b
	AbUdINoHZ7eRZ8tisaLTKJZOTAfBELd248PQPDU7YXp0cpXk3NdL6R+Z
X-Gm-Gg: AfdE7ck7HxS79nTc43Y96GKb5WvZFfyOw/xblMA0BH8nSns2AwxC5a2/gCazKMXmYuy
	T6YbMn3+9U1qUEzF/EZtcnFC+xcoeB1I+gYe9oVqgP++Xm6HNX+JjujV0JfoffC94Sq2mld/SZ9
	WzuCC2CKx+qOxqh3p8/lrG/a1wcqRaXjxOCe3VFfiuT0WCdv7IO1vjw4Ii8MWAWZJpbSdS6nhUl
	DfSQrtcY5u1mWv1TZrA64tl7OD8sP6GyOoJ6QMrN6mVVNtW06Q8+Jypzzgj8rXqrtA1lUmVMBtd
	UC5xM5uB3F5Txf7K2NsgaTntwzWDFL19U9loqcLEsxKVhOaVu+Inc4olAKo1rrTngGZaixz/BXm
	CX9170uBtSpdcZBWjDX0+oN4fComB/119qZupsO6S5XVaHH3h6GaBfRAf7OcyrkzeCBtlbvIK4g
	6kprZlH5s2po0ubJbV8WLmzcpgvHSPWoE9lWd+/zSb2vAKjlBaWFSt49e8qp3rzKWcKNHnbBBEG
	ZN0hB6nWrEcuX5VRGdI5S86Gu9pfm+i1v3a9/QgJ0uQnhxh+OTsHe2cZ1T/ZK3PEw==
X-Received: by 2002:a05:6a00:3395:b0:842:83d1:ee6d with SMTP id d2e1a72fcca58-848896dd7fbmr10534315b3a.45.1783988582236;
        Mon, 13 Jul 2026 17:23:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm473962b3a.23.2026.07.13.17.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:23:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rtc: st-lpc: get IRQ via platform_get_irq()
Date: Mon, 13 Jul 2026 17:22:59 -0700
Message-ID: <20260714002259.1392655-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_172303_321841_A9659623 
X-CRM114-Status: GOOD (  14.46  )
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

Replace irq_of_parse_and_map() with platform_get_irq(), which resolves
the interrupt from pdev->dev.of_node directly and returns a positive IRQ
or a negative errno (it never returns 0). Propagate the error on failure
instead of the previous open-coded "IRQ missing or invalid" / -EINVAL
message, so -EPROBE_DEFER is handled correctly. The rtc->irq field is a
signed short, so the negative error code is preserved.

np is still used by of_property_read_u32() for "st,lpc-mode", so it is
not removed.

Built for ARM (multi_v7_defconfig + CONFIG_RTC_DRV_ST_LPC) with LLVM=1;
drivers/rtc/rtc-st-lpc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-st-lpc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index c6d4522411b3..ae79ddf24f37 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -18,7 +18,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 
@@ -212,11 +211,9 @@ static int st_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->ioaddr))
 		return PTR_ERR(rtc->ioaddr);
 
-	rtc->irq = irq_of_parse_and_map(np, 0);
-	if (!rtc->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
 
 	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
 			       IRQF_NO_AUTOEN, pdev->name, rtc);
-- 
2.55.0


