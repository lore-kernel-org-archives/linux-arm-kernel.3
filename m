Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86194C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=; b=scReJID+qUGs/mWs6HxwYx2fkI
	7b21XWgliqwZh7MxrwlEwcX/ncL1SR1NUxWuoL956HaJUTJJs8wVcJpyhp38YW27zN3wGfjKXRdPv
	wPvRuLuNKOtWjOdWK6jJ4qSVTbk8uQGlKhLRqy6+sjzuVFAA4kcmNj5EQelhYD6OWnEeLh/DpFlJT
	rh5UAx4wpMvF/xGkzyy5Jbk/Tpj4chVCydA4/ot4E4NIJkggVZ3jv4RBQjFL2ynzwRl7rtZIhUghn
	sr/kcBGx9qQvaNSDcxLdEysOs2Xh2/RobNXElSmv3Va9h65wPycF4Nr0yrBTxvnhlAlI53+UHYPHo
	UXX7/wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WI3-00000007Skr-1IQ7;
	Tue, 15 Sep 2026 16:45:51 +0000
Received: from mail-pz2-f43.google.com ([74.125.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WI0-00000007Sjz-3sFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:45:49 +0000
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d20963so370997b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490748; x=1790095548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=;
        b=ZzWlZ0aRN8oN0R+b/Xj42shCYj9lC11eN1x6k7lNTQz2gsKKqBAnOZ8kYM4rjPgICE
         vdq2lXCTYe711wMaXmEYjejecCdKrhBbYj+9mO2uW1gYiBZaOkD7wN4V49qoQSi2Q4rD
         usmgCaE6egao/BPAPheC9Dn3MnvNDWOT8Lb8vssWd8Sm8VvT6+VzLKqtgAFZ+OP+uxn9
         wfzbTuAld+fda6TE/0V6tYG62lNowEzbVUG3yxfXoU2H3vxFp/Njbku7dpwZRzJNQXsx
         h9FEfGcd+oIgwXg6HSN2o60emY3zasR0sA48iYfrUXjV5NHCq7cdoJY6LFecPfu3+fKt
         18Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490748; x=1790095548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=;
        b=qSs38l4hwi8MYqDAotWS0ownNSyChCvmX6QKP6GIOltkrnKelISo9VZFGIUN+n9Z9F
         En5nPptCgI8nAVUir/a0r3L+unjpPTtacWGeJbJOt0IptaZqxVxiZUeBvsSNUInQnn7u
         FsuqSiIhVOfEegz+ryCkK+szjedpbMciFfMf5/3zs/4H8i3I8P3gq78c6epyE2R2Aq1F
         USYgDiZ0jOY/zPGK2ooi1f9HzH+h18hmgII0xz73KbqoIjZ+RYNd1r6tCXeodtGRBeRD
         4jcW4XzIv+ixMFmWJg5lds8zodUybVJqgysb7N0t4BYZ+Kg3uwZ0LaNmSowGTr3IOPTD
         4mEw==
X-Forwarded-Encrypted: i=1; AKwUvBycNc/mEG9nSbBdxqXqmZ4sGSrewYRjdaHz85rlSqg935JlOduL5qjifMKp/dtE0GhxLYpkfIvMHVkQ+eB6F+fk@lists.infradead.org
X-Gm-Message-State: AFuF++mnIY/Hxzvj2ZBm/S1gRI6jLRDCf/cNeEZkSM6Gt3iC3Ca6dSc3
	7WfLFWBCV7QzBXef7RMwq3EPM9z8n1pvH+TJF0NCqzM5oo2JEVvNQ6HW
X-Gm-Gg: AYBFou1xWTzUN7fRn3CD9fAxeBilTjThBPlTsaz7DgAOYX10LWbLcj5S+l3xfPIWLCw
	A6aBqePGyK9PL1ueM9CeYvIvMZFwgYN1WoI03Qx9R+EUnMmme0kVxgLgPxpDnBMhZceo85EdKiX
	Xv802Ts5ytzWRlF1jj9KBchQiVdUmHuBQTQE29bP/RZejZ97tlB6j2mMIbDdEBme0MhIEwZjc9c
	XSOuC0tG69zITwAtC55TuuyenxrxUJJewOxPoYT4CqhWA3FtPJTrqvEnmgx4AwqKB7ajSbv4SJk
	AfB27jccJqay6Xo88ODr1x85N81hXCnrUHmY5DvP4gqfAaGzHFMYfBtUoOx0M9sCs+azbVYdiPX
	GmlIqE2z42QQ51LyJmTX9VD/yxAcdVVhAkGBDYYt33fvF9ctXaPn6p3FUVojUpu1pf9UgbSHx1+
	YyiHFzz8jZ9appnY0RA27539iY2ZZrs/7zcGsSSy1w6MzUT0swU37JOg==
X-Received: by 2002:a05:6a00:e18:b0:86c:f33d:e3d6 with SMTP id d2e1a72fcca58-8717eadc194mr2942536b3a.9.1789490747845;
        Tue, 15 Sep 2026 09:45:47 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc09d4sm6481081b3a.47.2026.09.15.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:45:47 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: nuvoton: fix clock cleanup on probe failure
Date: Wed, 16 Sep 2026 00:45:37 +0800
Message-ID: <20260915164537.2496540-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094548_979192_B5DD2144 
X-CRM114-Status: GOOD (  13.12  )
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

ma35_nand_probe() gets and enables the NAND clock with
devm_clk_get_enabled(), but the ma35_nand_chips_init() failure path
also calls clk_disable() before returning.

devm_clk_get_enabled() registers a managed cleanup that calls
clk_disable_unprepare() on probe failure and driver removal. Calling
clk_disable() explicitly first drops the clock enable count, so the
managed cleanup attempts to disable the clock again and triggers the
clock framework warning for an already disabled clock.

Remove the redundant clk_disable() and let the managed clock cleanup
handle the clock state.

This issue was found by manual code inspection.

Fixes: 5abb5d414d55 ("mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 1a285cd8fad6..f659d3a6b9ef 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -993,7 +993,6 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	ret = ma35_nand_chips_init(&pdev->dev, nand);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init NAND chips\n");
-		clk_disable(nand->clk);
 		return ret;
 	}
 
-- 
2.43.0


