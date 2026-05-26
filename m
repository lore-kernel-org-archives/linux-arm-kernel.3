Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D826BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ku/vxDrBu7T4TGqb3O0QJz0UZRxcqf3H+SXkaiCq2AE=; b=qUIdLOtNmFbxzqmXwuQy1oesiQ
	h/ao5XvjcpwLqC91fctpzt04XznwuD1g2HqndG1R+FSk52DrovS9Qf8dggJnA5s/siQKadoB8X7TS
	WbpCQIArC8yNIzz7E+t6N411UtyBm9pJjH0E2phleyoTUKWHa05auc2VFGtS7pQ88DLK9BbcNM/JT
	k4Fu8fpqL08PZWsloMMU84//mIhi0JncXzfTM3k5XheiWA688YFVNKj59usz2vVkWJEcGRd9ExJiZ
	SWwem47CX/n4kZq87LHqiAtvqHkZehmIQJrphsP9wm80FB8ohOZLPaPRiQVDW42xkNcA6qGwtZ8u3
	LRISKCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRyCE-00000002w1e-2SzG;
	Tue, 26 May 2026 20:16:14 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRyCC-00000002w1J-3Gta
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 20:16:13 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-516d78df76aso47847851cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779826571; x=1780431371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ku/vxDrBu7T4TGqb3O0QJz0UZRxcqf3H+SXkaiCq2AE=;
        b=ct0bcuiijylc2MnlIhUr9tPsHLC8NjLUUP0DMhs4qL5Gs/ebT66fAehn/GnF4hZ8Bc
         V9oV4QT0qBNSxnCuHL4yywEWXTNoBRrM813iyMrcNZO3QgSfGc7GOL/ZxEZrhZJ73LOT
         ByI1U/rpDnB5FxHEJLFq6cAa275YikP5f8GlHoUDm2dCTF5UuuJR1XG/h6D8Bxk1pIix
         0jvCraNWYsNP35l8J0OPIuop2JhBW0DHcwz6L2W5oNmmHo9kRLkieDxR5gHqw48ePrU4
         pkZUhheiJiwsTwub1otchqRdtE5UaBQfcOSucW3gS9J+/Hpyl0lLg4Hoso8KPgkAjK+r
         9lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779826571; x=1780431371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku/vxDrBu7T4TGqb3O0QJz0UZRxcqf3H+SXkaiCq2AE=;
        b=BXEN4J5aW6zo9BZwohY85wvY5scViIUjUzBRt+DQJIfyoVmh619VVQe4Ja2ycLtnbq
         vNYTTr/viai5aYdnwoM6mbHx90nK6Ykxxl5nJXhl/XdZr4MpFuJuN/4bp4okOqIcNAb1
         lNPnPJ0vhhyyPn51v+iHWU8Q4tehxwMvt9Euqhg+Iyjf8BB2uLTneS7xAGe4/b44DvGo
         /4D33dVp/tjFDwkefK88bjNGLzQXnbW7SrwbDLwPV6YD7J1hfsLkeruSg6JOojABnwb5
         gxuBQflN1dRXEbqQyDGbSdu7zdTRPFrHUVyEYglIintDILn51R2wzVTZRKVY+u/Otkco
         RzQg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y0BSs8o0cNjYyL3QLtVgjV3HXsZGpnRuI72p+xxdimfP+HrwmDyd6o7O7+GWmtOqbmU0G2nEFjs8574UJ0Smq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0vo5D0RiOuBJ12bk1maBhnl6RuZchQYRqKm7fpbe4g67WefTO
	TlMvISrjRDgEGaSqwf+HmUYOdngeOEOpWvHHfpELhvHlxGFVsDSgaHIK
X-Gm-Gg: Acq92OGsfZu6WSe4mRGSGPVMeluJ6en405h1EwIjV0wbZads2Wkf9KErX06Qbm/mgk9
	wNE1i52Za5Psz1148P4+bpOZYxkYKAou1DlUR3wFsJpaMs6+pRzOJfOPAm2dv+dJlj2pDgXJYuH
	REVCnvSr8oslbI+02qBw+ShPOsBlttEqULDYSM4dfp48LiP94At6PsLwB6oPqFFfLHOO0B7kaIY
	VVf1oQzdpMfRc+zeMlCljOCjBFT1DJiS/RYyArktZlj0wOftUTg4J8LXNpaMY0lqxZ0IJoMTUPj
	03jSu7BJ8djyVGCzC+dMDCotGLvZ3mgKKgYOwi3zBFsJQVQfmZ0oGjVGtbD7a55Dofq69hi2M9M
	m47jNZsKqLsBcFQOFA/Fd9PGC8egTwVRnoem31Vn37p+k0NvqmlupvOQm+PX7tJhjPS1xUJ7v1E
	u1V+FaU9yO2W9u+0yC2Jj1X/ScZturm+jy84lALIekFHNIwbyYPPUtz8f9hc7hElxpbyTHzSa0Q
	pwUvZIMBBmFfi3GGBrJTck7pd4U6vnulO38X5008dOF6Q==
X-Received: by 2002:a05:622a:4a09:b0:50f:bd79:2642 with SMTP id d75a77b69052e-516d463bd85mr282690521cf.48.1779826571221;
        Tue, 26 May 2026 13:16:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc9cfsm25433541cf.19.2026.05.26.13.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:16:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ste_dma40: turn d40_base phy_chans into a flexible array
Date: Tue, 26 May 2026 13:15:52 -0700
Message-ID: <20260526201552.13376-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_131612_828805_68CC06E3 
X-CRM114-Status: GOOD (  13.39  )
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

Convert the separately-offset phy_chans pointer to a C99 flexible array
member at the end of struct d40_base, and switch the allocation to
struct_size(). The log_chans and memcpy_chans slots continue to live
in the same allocation immediately after phy_chans, indexed via
base->log_chans. This removes the hand-rolled pointer fixup that
recomputed phy_chans from base + ALIGN(sizeof(struct d40_base), 4).

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ste_dma40.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 9b803c0aec25..d3e3c4cd43f1 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -602,7 +602,6 @@ struct d40_base {
 	struct dma_device		  dma_both;
 	struct dma_device		  dma_slave;
 	struct dma_device		  dma_memcpy;
-	struct d40_chan			 *phy_chans;
 	struct d40_chan			 *log_chans;
 	struct d40_chan			**lookup_log_chans;
 	struct d40_chan			**lookup_phy_chans;
@@ -621,6 +620,7 @@ struct d40_base {
 	u32				 *regs_interrupt;
 	u16				  gcc_pwr_off_mask;
 	struct d40_gen_dmac		  gen_dmac;
+	struct d40_chan			 phy_chans[];
 };
 
 static struct device *chan2dev(struct d40_chan *d40c)
@@ -3128,6 +3128,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	struct clk *clk;
 	void __iomem *virtbase;
 	struct d40_base *base;
+	size_t alloc_size;
 	int num_log_chans;
 	int num_phy_chans;
 	int num_memcpy_chans;
@@ -3197,10 +3198,9 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 		 "hardware rev: %d with %d physical and %d logical channels\n",
 		 rev, num_phy_chans, num_log_chans);
 
-	base = devm_kzalloc(dev,
-		ALIGN(sizeof(struct d40_base), 4) +
-		(num_phy_chans + num_log_chans + num_memcpy_chans) *
-		sizeof(struct d40_chan), GFP_KERNEL);
+	alloc_size = struct_size(base, phy_chans, num_phy_chans);
+	alloc_size += sizeof(*base->log_chans) * (num_log_chans + num_memcpy_chans);
+	base = devm_kzalloc(dev, alloc_size, GFP_KERNEL);
 
 	if (!base)
 		return -ENOMEM;
@@ -3213,7 +3213,6 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	base->virtbase = virtbase;
 	base->plat_data = plat_data;
 	base->dev = dev;
-	base->phy_chans = ((void *)base) + ALIGN(sizeof(struct d40_base), 4);
 	base->log_chans = &base->phy_chans[num_phy_chans];
 
 	if (base->plat_data->num_of_phy_chans == 14) {
-- 
2.54.0


