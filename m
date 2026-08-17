Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A188EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 20:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZhbeVh9+BeqqHay8mC42Ov5iNy512scNbvPs5wg+rw=; b=PlBb0fra3HFiKtq9jqt77UyUtT
	qINv80f+TrOTnGZj2k+Bd0zKMc1chZ0M93cDH4Kl8VYN70/BCQmArupISnOtHFfxSe5lK3o/+jt4/
	kBQO+HEctg5WOEL2UFMDkqcXnDQ1Pfo3N0/FyOysk71DSWtW3Y03wfzLAy5+L5dGc8CXMrE6QE2h5
	e5XFFH3wX0FImSH0r9iQRuR8nez4Cpz+sL76Gd8WN9gOWzfpIAEzi5An1nmRMOkEnrtHmf2z+lkYx
	/wTA3tBz2Jc9JJlYSWw9kFzSLbd2n/gWFcnLqA5kpAw+ZXcavQE6OOtjJObS/3bvKB0U7CzTBo3rS
	A19z1oRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4CX-00000006nIj-1HUD;
	Mon, 17 Aug 2026 20:44:57 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4CT-00000006nIL-0w9j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 20:44:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 79B9A201514;
	Mon, 17 Aug 2026 22:44:44 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1ww4CK-0020mx-1F;
	Mon, 17 Aug 2026 22:44:44 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1ww4CK-0000000GTDG-1EOv;
	Mon, 17 Aug 2026 22:44:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 17 Aug 2026 22:44:33 +0200
Subject: [PATCH v2] dmaengine: pxa: fix double counting of the hw
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-dmaengine-pxa-v2-1-f42ab0569a48@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIALByg2oC/3WMQQ6CMBBFr0JmbQ1TaEVX3sOwKGWEWViaFhsM6
 d2t7F2+//PeDpECU4RbtUOgxJEXV0CeKrCzcRMJHguDrKWuO7yI8WXITexI+M0I3aKSw9C0DTZ
 QHB/oydvRe/SFZ47rEj5HPuFv/VdKKFB0qrYSlUW86rsv73sNi+PtPBL0OecvN9yV2q8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786999484; l=2837;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=OymTM1oQLQsal+qNBkUI4yVe4s/AFlcuq3qvVCmg53k=;
 b=NnDXohUgWy3bkWKUxwEGJxUFYxlIDRPwojdF/IDz3k+6+8+ZOQbHy9h118+bsylfC30yq+iaf
 uDRZOzKQuFtDBTY2c6iKNlh92MGbWvmsDZGfulFL3ovC3epd9WV6D0E
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_134453_431653_CDFE45DD 
X-CRM114-Status: GOOD (  13.47  )
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

to kzalloc_flex(), which sets the __counted_by() counter sw_desc->nb_desc
itself - but only where the compiler has __builtin_counted_by_ref(), so
from gcc 15.1 or clang 22.1 on. The loop below it still increments
nb_desc, which makes it come out doubled there and correct elsewhere.

nb_desc is what pxad_free_desc() iterates over and what
set_updater_desc() indexes from, so set it explicitly and drop the
increment. The error path has to lower it to the number of descriptors
allocated so far, otherwise pxad_free_desc() would free entries that were
never allocated.

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
Changes in v2:
- assign sw_desc->nb_desc manually as it is only automatically assigned
  for compilers supporting __builtin_counted_by_ref()
- Link to v1: https://lore.kernel.org/r/20260817-dmaengine-pxa-v1-1-850c215c1196@pengutronix.de
---
 drivers/dma/pxa_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index fa2ee0b3e09f8..fc43124fefa89 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -744,6 +744,7 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned int nb_hw_desc)
 	sw_desc = kzalloc_flex(*sw_desc, hw_desc, nb_hw_desc, GFP_NOWAIT);
 	if (!sw_desc)
 		return NULL;
+	sw_desc->nb_desc = nb_hw_desc;
 	sw_desc->desc_pool = chan->desc_pool;
 
 	for (i = 0; i < nb_hw_desc; i++) {
@@ -752,10 +753,10 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned int nb_hw_desc)
 			dev_err(&chan->vc.chan.dev->device,
 				"%s(): Couldn't allocate the %dth hw_desc from dma_pool %p\n",
 				__func__, i, sw_desc->desc_pool);
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


