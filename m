Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C8CC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=; b=AzOqX6/jPZV5fQE6ESPU9h46Yu
	yih+d6FcOApcxs4NFqI9VubmKbY5Il4qX/yCP3rx8UL3+AO+/dgQDKSKu+7DmqabhtSUKf+QMdwUY
	Q9otg9sqZyY+4iCC4eLNjvN5la9L6Rb3FR4cgClBw5Js8aET2IjFOGIXiQwI3NLKI/WvIa2+BnVWA
	R8FHM1wA82T6TCPrWPrJoN167LK5aqUJBC+cjwZgFQSBZtRqUUMhSDrEfwq1d6fltsRoQRsHQ5h/7
	tWd4y+CYCEwROOts+Ecg4FR4JxU8LyC43WjWIJsKfZJikzcw+ySBHj4F8GcJAreHeEJyM2t86U771
	MAgUsrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMZ-0000000GYMW-23fH;
	Thu, 15 Oct 2026 01:34:31 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMU-0000000GYGG-2lcl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:27 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-4949f037131so2562388fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028065; x=1792632865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=cug/wCy8MZVqkwi4LnJhr6+LuDDCnbwUCUGT//wLsx9JUE96r8d8D8IoLnftESaSl8
         087uXwQdsGweK4e7eIKdGFEjvSDChc4AaC+0iiNkF2Jk4fSu3v4nZQI3mLbfvARniGfn
         y8joHkQ5HUUS92OIBdiMFYGoo2d7IEqJ7ZllgmnSXVErjMUudWEQKa3CExZVF++HAzkD
         6e8C4J9RN3CewNxR0rjf5sdmtpxSCjSB6/aUmuYrRsFNpSCZ4phIV2k0XhIjgIT7bVAz
         68Ga1sCAZ9juPN+1V4fdzbAHGLtaseKSUJp5t2TGSVVp/ns0c6SixH5HVfjV9Q1LskVo
         CRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028065; x=1792632865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=ht7zCxj9PLIPSnZu2GqUsZE3QVez25GnrVej04+U3sGfLFBbk2Rk13lIm3u7+SmL/6
         0y8q/ozUDRe1IMExATLB62AnprIDreYptu2kePcrm12XYKO8LjhhUSeeaQtvwEwqn765
         YntaGyz0dbQvdBsUSHUlCKwGXzI5+dd/XwAryIpj7e73nT+SQ/KGYKofwO2H+V5NiQQX
         7jhCO+hvg+AM+J2Hfe8Ttbe3V1QaFcGS4TH7LYzvJ19YO18Cw0bBt1p8WcjeP2ZcFLAp
         LEgCdfEuSzUBojqxqq9SZpfSHTKvlUHldDPxOpnSWgGx2rwJIga0G7B+V9uci5Hf67Qv
         Mvkw==
X-Forwarded-Encrypted: i=1; AKwUvByu5Z/87czzOEEwkkT8V82c1S6/gAzoCg4Jf7IX5fHDKfvwEx6xVs2oRCvzxv8ujPJVyEJmo2NvH0Uqp/BUsNvv@lists.infradead.org
X-Gm-Message-State: AFq9FYLLeHP+CtJA86HVKMQ1o4IgePbK+jIFtjDMkonkU+EnuzvgLjtu
	FSBrq02vTt2kDPXu7yzLJFasMl4x33zZLkNctUA+6x3IvueGQnlb/nXq
X-Gm-Gg: AYBFou31SbtqzGOfCQHWT34xOsvdK9VnNEqLfccri7Kwj1sHtod3eCZbfrLyLqm79Cs
	UAekmQ5mCCFhzPfpl3lW697QgONRaQkbyh0IzLMR0Q95RTYb/jWOY25XGYn44lKO2IyP1n31kVj
	rx+5AwEzHYOaNW3hjRpHk22TQvK3mS5vb8mHjVAdaKEnffcvMuByafTAW7GoIxRca+Zq4E5/lK0
	ca3Cy+jY7Azg6eVOFY6CWeGXZQDIMKCLqOCRuxWVIwF7ZtgV3WuqmNMvilSlXldOPlp8uSniRBA
	ePbSNYFRXVfj3Xk7UlGmmpv6M6+quLPu7ue8tdfS0KCSdk5SEMtP4im6Tqx3A0D8ltDp43z39Ol
	FSnraztsyBwLma3FG+sNkd6IpJXMyP46g5dFJ4OXAO5dPR8on21IUY5YoYOn5vz03nYrATDdh42
	C4CdPoZAGAoWdlOWXSpoSxK/Iu1OVveoude9K12slxU+X9ApsC/pPpUAoAcgH9yD5j4nnV+6bpz
	JgAhQtzrtFGvWRPbu3MVQgBqe1GTqam3SJ6CqafJwpmMRq4m90rDSMgj0cvxDTzpxMLmYwutcsw
	qNgmWErZ8Qf4scwN0Lv8okDnbLUmoz/HA7q/uuQI05u4ClwYMbviH9BsdLEeyB524X0yqwLIxre
	oJ/qvF2pm4fGRtkaBqT2G
X-Received: by 2002:a05:6870:4066:b0:4a6:c1cc:e1 with SMTP id 586e51a60fabf-4a6c1cc0336mr6240528fac.5.1792028065404;
        Wed, 14 Oct 2026 18:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:55 -0600
Subject: [PATCH v7 08/16] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-8-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183426_710583_1D8D32B5 
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index dfdd8d8aaa6f..6c4e1740a245 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1824,15 +1824,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


