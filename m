Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B14C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+UUPq9hnFfXRk8mndOboayVxGmH6TX7x4H9Zgx7Q04=; b=XB7y84B07ftYXOvet+K5sH5Onb
	xJDSnolgNGHsAB0UX75VMZtWebmtrJfw6VmhzfGslyyMxmfdRd7f259h445mP8qi8Fc0jTdXMv9Nu
	0khBdiIuyAaeu1SKe+FY0Idpq42FDuiGuTnBtQhcc9SGXfotPZVWdaiwjyi6T78nRecD8JSbExD9W
	9FQNRMqpD8q8k7DG6zP+fMYGD5DRghZ00XjPTJ7n9TYyF4RTxGEXsG7/ezqIWEXz3h/iThBgePT99
	d8spOUzycnqn3vkkIiNvZO2oZZyamNjlgSRQk2h2in6B4eJogNwj95HAv/1s7O6CBOAyAqVBSTjih
	S3dyrCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixcF-0000000AwSz-3no3;
	Mon, 04 Aug 2025 16:00:47 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixPs-0000000AsEP-1Nkc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:48:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-615547ee514so776463a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322479; x=1754927279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+UUPq9hnFfXRk8mndOboayVxGmH6TX7x4H9Zgx7Q04=;
        b=l+rYIqOHaPv3Y4znGXb8+jGlTLjftrcA/vHleRGp8PzWd1/Vx8bMM/XyAYxfwYiLFN
         XCLT6L/7mKknp253IFGXZ9P9ZoPXEan6efs7eUp4abxGrMhBkrjHX+W4V1QhXHsw6cSk
         BOMdpHdcR7msciLjBQ8+JBSB6CMhKcggCocW49pkl2d2UFi5i5mIG1QcYj6KFpP70cGF
         fGcUHG5AeJtiyh/00Z8OikSMBqzqFs/AijmhxF/dyuSXwZ48raUNEtVUweIY9R4Tg3nI
         z4c7nj1ZhUe1FxrsbrNhW3oVDBYuPB0L9B9/zN8G7GdzWejs/bLGVH9YaCPmYp3CTDeq
         MxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322479; x=1754927279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+UUPq9hnFfXRk8mndOboayVxGmH6TX7x4H9Zgx7Q04=;
        b=rORiyp4A4Xvmirxyo3Bc7UryECzAYl106zuNyYnyisICvO3WkzTbQv+9o36ZDet3Wz
         4DWQpaD1Vz04vOMmVBI1+9dq+mllNenUXxQEmHo6Hv6Lwlra4opXbrlYY4UAtXgTSpto
         8CbFZo15ZxJMSeH1F08WO9r9ntSk51RDZxGv8g6pmvuIc1QHBr9Uo4eW8g0QGwhxxO2W
         4Qkf6ru6h72OYfZFCnRWMHqkUhA3JUIIwfWLrqNfFKg9PdJA3fcrvBLS8rzwaEa3btpw
         vztmOUnWBYt1Zr4GrpU8AMoMRdDoVLfeVVipMAETMdYG5GGPw/4eueeG+R1u/szKxeVw
         KKgw==
X-Forwarded-Encrypted: i=1; AJvYcCWSeyF0dlHDEeEwsZKycMC/+UMNy4pE4ruqxk0boGsBaIlqtTCgjuIO2jgZFc+6/7Vkycy/cAXjVSNVpQWfe+Qb@lists.infradead.org
X-Gm-Message-State: AOJu0YxfIwKGHPFoPs3fTG8CzrldgjnXeAwCo8heqenJvs0ldZIxtaBH
	Tzbfo1HeCr3XXCkU0QQhFuxSqQAhu5N3cKUSapu2atEUumzwNSs/sjxt
X-Gm-Gg: ASbGnctjNW4Uj9txryeZaGaPa7Ioc7GM/lxBdojE96bpLf1/d9TS3nGmvihjjFS2R47
	4UzEPqgVqRCTUK+7CbSLHdl1GCn6uJfjAYBWZDpyCsI8AaZgp0RPKFfmOO465Jhj5ySH3z4KQCn
	YxjQDvQF+J8E7UbgtJ54UsOqalVHBGIe63K+brNhoNd40uu34gG9G0Q9Mgf2zZfp7UbaJu7I/AI
	KysEd5H9Q6gnNyLit+ba5rGmUnB1vEyoamTNTR3749BrSke7G/UuTBplQ84bq39+nRGoGgLMfPc
	Ycn3Dt4eR5UfESJ/dOg6rJkDntbPASFlGuiy/e52d7hy1XZ5jvkp6fMnY7oeFQ6U6JXGpcG0jMY
	D366cSizIXt+8hPNTj+rMIdjO2wxdVHGOmnIxkZaRWujV4EComjxXsux3hkO+M+wYOCjQsjT4em
	OcOi8=
X-Google-Smtp-Source: AGHT+IGHFleDuYVTLlaouFoArNS2Kzppp4J9Fe/k66R1ZNoacaEZv77NGxcVeIFO77xVLXCz9sDJPA==
X-Received: by 2002:a17:907:6d14:b0:ae3:5118:96b3 with SMTP id a640c23a62f3a-af93ffc6aebmr384185566b.3.1754322478376;
        Mon, 04 Aug 2025 08:47:58 -0700 (PDT)
Received: from localhost.localdomain (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8306sm757276466b.83.2025.08.04.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:47:58 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: alexandre.belloni@bootlin.com,
	michal.simek@amd.com,
	srinivas.neeli@xilinx.com
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com,
	Ivan Vera <ivan.vera@enclustra.com>
Subject: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
Date: Mon,  4 Aug 2025 15:47:50 +0000
Message-Id: <20250804154750.28249-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804154750.28249-1-l.rubusch@gmail.com>
References: <20250804154750.28249-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_084800_370194_7D9C67A5 
X-CRM114-Status: GOOD (  14.97  )
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

From: Ivan Vera <ivan.vera@enclustra.com>

In the event of an uninitialized calibration register, ensure the register
is reset and properly programmed during the probe sequence.

At present, only the calibration register is evaluated. If it holds invalid
values after a power cycle, there's no longer a way to reset it, for
instance, via a devicetree entry to 0x7FFF. This issue is documented here:
https://adaptivesupport.amd.com/s/article/000036886?language=en_US 

The fix prioritizes an optional calibration value provided via the
devicetree over the value in the register.

Fixes: 07dcc6f9c76275d6679f28a69e042a2f9dc8f128 ("rtc: zynqmp: Add calibration set and get support")
Signed-off-by: Ivan Vera <ivan.vera@enclustra.com>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/rtc/rtc-zynqmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f39102b66eac..0c063c3fae52 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
 	}
-	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
-	if (!ret)
-		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
+
+	/* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB entry. */
+	writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
 
 	xlnx_init_rtc(xrtcdev);
 
-- 
2.39.5


