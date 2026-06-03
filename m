Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DgpTLB1hzkqNPPrde/I8zx966U5X1f7Z9OQaGxgrfCc=; b=sF+kG99O+1hl420eE2xI8PMnaO
	iHfyso1AQwAB/gDW9AEXNNOQthMZ1ScJjtVuHcQfxpZ/vHer36dElghQpi0/c07443dESv7CRUIIX
	e7ll+wSg1cPiK6IrT75cmp95f1bWI76u/KaJ1kDa49no8bj16156Nn5w32Zn9k88Gwsg+7dcTiuJQ
	/MdcbySQajcFkn5OXXe+311JcHWBnxEtRvCCdZtxHD5S7LTBoyqpmcHvx6ChubGIP6KX+ejpvnpLt
	kUfx5ijLELAB06tR8NsmCCKgNgY7mS19QOUm863d9QN8RdoBQ58ixSX7ps8Z42fZdUW2YsVMFFX2i
	9bofBSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUc1N-0000000EA32-0QVM;
	Wed, 03 Jun 2026 03:11:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUc1K-0000000EA2e-3LKN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:11:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0b9328c4aso25082355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456314; x=1781061114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgpTLB1hzkqNPPrde/I8zx966U5X1f7Z9OQaGxgrfCc=;
        b=plAvbkJ1LoztiXT/n3f9hGDnUkpMHoXsBg/nc1x3x4ngXhxVl9t0dvwZTZUTgGdAIt
         28rExS+GGdpu2D+2V/H89srAXjzdxQUypdfiCxG9d1VXyd3KGrYiEesPp6JLixkkhNor
         Wl636K+2NVvE4czsciP7cFjrqTjs3gvr1DdriusTa2/hHjdTQ0aIiApPLobEMsGzZcQi
         uUk7DrBhV5Ao1MVIuOX5CIIdIWdbZiWgQMasZxCWPkjt/4CNklFyefZPqwnGQv/2jzFT
         2p8a7R4le5v3wrolYXNKXP0bTCVLUXUTX2hFwms77dIQMsewC664hlo+I6euchnxli3W
         pB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456314; x=1781061114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgpTLB1hzkqNPPrde/I8zx966U5X1f7Z9OQaGxgrfCc=;
        b=hgl4aO2f61fqU4x6P4/V5pLdQQ2eDkuytSX0WMw/bNzXVCizE0xfS3T2SDUeA/uwT6
         r3uaEddShWgd8r1SWmgdfS/sG8PFvK8Pu2Gpsd87gB2nSyYyTMTqf0CPAxOk8mrBQC3k
         zzladeL66UCtgBYRE3Bd56OjNq4bn8KFDk+kdrZVh6NbbsqeFkryHvpqit0o35U1yOxt
         jGgOnPcko0i4+mgrse9rKHtC/sYaYoZcRnkYgCMYGkn5EgZdd1AkcaOPOh6/WQrJq033
         5wMFw0P/Z3XPwI2CGqcwy1wJqw4lVtAll4Rgu2+6LGqP7trkIIMdtWAAPLXQVY1xTw6b
         9Zgw==
X-Forwarded-Encrypted: i=1; AFNElJ9VWy5Wq5LgGOjiJ96OqYmGxJRfH4dg864yviCsBJj+qEChkfI8zvCu87FQSHFWID8fPALNSup7b6pAGsRCXbNe@lists.infradead.org
X-Gm-Message-State: AOJu0YwwHMGHf2Sa3xYYVQK60aJbo51KPErOf5oYh4/G1RRJFspqaZLE
	5ZDG1KDIjr6uBSplhKe83K7GkGRYc/kljB16SQUF/L6VPThKIDdsiDjB
X-Gm-Gg: Acq92OFVJ+HawXmrOB4gcnhVfjJiJn9Mfk85zm93sTO1mZX/3tsks9l51IJd4niH8Li
	/UF4PCTeye5Fhd50WDZcYLJTOIpqxUTJzktcn+N2SqblcSW3cY8ofJ+opYU5n8/H/YtS4R+DONG
	vdntJIRyurSh+R3Y3mldb55qdsnzb8blZnczKrFdgdsKTYuw0AHOtq1X+Zm69cX/jw3DpKz36Gn
	zYMbHMe5fL8GAOVIe4AKOZhMRHxvigQnM5/5qgc3I/Fli8igJTC5oPoxVwxhmPjBOKRmq4N64F2
	ILGEv/tfn/NJeAjlbMMiYG0iIkVvgmdrR0AABZjCDmsSMfLoUl1slk6487cvA4NJ681e4zELW4K
	tIy2PT8O3Hon+bgf81w1Xbj/Pl1mKuzj/51R0DWqHrJs5AC6CjRshXZxUxvpIn+gcec8vuTTUPf
	4ehTo4pi+aGyPoYAoFxU8DT5OgMVVhLXRi8ovgC3N9BvuzwhQClaS/lXehVgcfrq63rv1DPkdN4
	pp+l81yVoGCz6TF+MXq7/lMnbyIFWXyjUzru1/Gxqqxsg==
X-Received: by 2002:a17:902:f545:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c1644d5834mr13983125ad.35.1780456313668;
        Tue, 02 Jun 2026 20:11:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm7211795ad.29.2026.06.02.20.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:11:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] i2c: mxs: add missing kernel-doc for struct mxs_i2c_dev members
Date: Tue,  2 Jun 2026 20:11:35 -0700
Message-ID: <20260603031135.289302-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_201154_855888_69935FE0 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Add kernel-doc documentation for the struct members that were previously
undocumented. This fixes warnings when building with W=1 and ensures
the struct is fully documented per kernel-doc conventions.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fixed Signed-off-by.
 drivers/i2c/busses/i2c-mxs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35..4e07babea9c3 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -108,6 +108,14 @@ enum mxs_i2c_devtype {
  * @cmd_complete: completion object for transaction wait
  * @cmd_err: error code for last transaction
  * @adapter: i2c subsystem adapter node
+ * @timing0: I2C TIMING0 register value
+ * @timing1: I2C TIMING1 register value
+ * @timing2: I2C TIMING2 register value
+ * @dmach: DMA channel
+ * @pio_data: PIO data for DMA
+ * @addr_data: address data for DMA
+ * @sg_io: scatterlist for I/O
+ * @dma_read: flag indicating DMA read
  */
 struct mxs_i2c_dev {
 	struct device *dev;
--
2.54.0


