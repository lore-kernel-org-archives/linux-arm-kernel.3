Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805CAC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mUhpdzwt83JAQo5ReLBcjX70G4Xlj7y9/Aum4Qf1/y8=; b=GoqMreu8XolPkopzOWjYGVgvYo
	j3+ZwbdIR3dWyXgMNSATIpgtOi4LE3Nrkd47mx7y6QiaTQOLWhHNrSWVDa25T7HIAY9J8STK/fXWG
	KaZBs6udmOWVRxexxAR4qgcSPY2YQJFTyNPDAgrwJT2muFr2jginr6CnZIFPNIZh0PZ69ApnekIA5
	ylMDYd74GnK69VIPpeHleo04waJN0hRCYWpV+G4zzOhPzIjrPOs+G4gjZIC4kKEr2P7Hg9q0do83h
	X4BW28XBc063Wwj/SMmOw3FiEP5FTQADdN6KFmzSy8XtvBEre12T3bJoKjp0+9AMJM4Ly1bpuTks7
	k/aYiF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzu2-00000006U9c-3NbY;
	Mon, 17 Aug 2026 16:09:34 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvztz-00000006U9F-2i5l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:09:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9B97D2021FE;
	Mon, 17 Aug 2026 18:09:25 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wvztt-001z5B-1l;
	Mon, 17 Aug 2026 18:09:25 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wvztt-0000000GIh1-1rnO;
	Mon, 17 Aug 2026 18:09:25 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 17 Aug 2026 18:09:23 +0200
Subject: [PATCH] dmaengine: pxa: fix double counting of the hw descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-dmaengine-pxa-v1-1-850c215c1196@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIADIyg2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3ZTcxNS89My8VN2CikRdMxNDU6OkJGMTY0NjJaCegqLUtMwKsHn
 RsbW1ALVd3pRfAAAA
X-Change-ID: 20260817-dmaengine-pxa-64152bb34313
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786982965; l=2267;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=D9WRnoe4v155Yuh2kUpX0fyEN+hFQCP5ZrigCdKEEeo=;
 b=AJKvO/QZuJIonFzDi8gj1ix7neC3X40fbm6QZwMVke1PYjFEDVIN7VH8cxTIzDQ8lLPhuVxn6
 xuXZ3vIU6bLDjMf5VjMVix91xfM12GyXBu4X9HCQIoOflCqLeWdBSv3
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090931_854427_EAD02C9B 
X-CRM114-Status: GOOD (  10.89  )
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

pxad_alloc_desc() was converted from

	kzalloc(struct_size(sw_desc, hw_desc, nb_hw_desc), GFP_NOWAIT)

to kzalloc_flex(). hw_desc[] is annotated with __counted_by(nb_desc), so
__alloc_flex() now initializes sw_desc->nb_desc to nb_hw_desc itself.
The loop below it still increments nb_desc for every descriptor it
allocates though, so nb_desc ends up being twice the number of
descriptors that are actually there.

Drop the now redundant increment. The error path has to set nb_desc to
the number of descriptors allocated so far, otherwise pxad_free_desc()
would free entries that were never allocated.

Fixes: 69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
pxad_alloc_desc() was converted from

        kzalloc(struct_size(sw_desc, hw_desc, nb_hw_desc), GFP_NOWAIT)

to kzalloc_flex(). hw_desc[] is annotated with __counted_by(nb_desc), so
__alloc_flex() now initializes sw_desc->nb_desc to nb_hw_desc itself.
The loop below it still increments nb_desc for every descriptor it
allocates though, so nb_desc ends up being twice the number of
descriptors that are actually there.

Drop the now redundant increment. The error path has to set nb_desc to
the number of descriptors allocated so far, otherwise pxad_free_desc()
would free entries that were never allocated.
---
 drivers/dma/pxa_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index fa2ee0b3e09f8..8252d27be8c3c 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -752,10 +752,11 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned int nb_hw_desc)
 			dev_err(&chan->vc.chan.dev->device,
 				"%s(): Couldn't allocate the %dth hw_desc from dma_pool %p\n",
 				__func__, i, sw_desc->desc_pool);
+			/* Only the descriptors below i have been allocated */
+			sw_desc->nb_desc = i;
 			goto err;
 		}
 
-		sw_desc->nb_desc++;
 		sw_desc->hw_desc[i] = desc;
 
 		if (i == 0)

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-dmaengine-pxa-64152bb34313

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


