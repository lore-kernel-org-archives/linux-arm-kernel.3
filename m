Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF6CCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKe/EC963oBgQNNoRNR8ODyV5c6TeMPOa2YDrtdRsTE=; b=aC4gc6NoddZ2ON4KEXuEKI7AF/
	Pjd5jZveK+ahOMrSp4w5mMRe5sA1SrVhpYJPmplvdgdEBU604stDBg+7Fb+DdkHioKGPMw0j8yFH9
	svirTOvQoGEYqEIVwfKUNSqUxs61hE6DRu7RCuK6b7kKOszr6GKphPSvtD5fdlyBcsCUeuOA5hdQw
	IM/qqt4htXgvFbw5JOLnaYX0NRE3acVc6jMcn6TlsAOwZC3Wvx+5OUbu9B3LvGvzHDgP9kfZ5k6GL
	RT7+bvo4cLHd5fxgaY1Hb7VWkAIS3ah1Lm72U9NtTf4KpszVY2q+7TLq9mb5z5Xk+ES4Or3YyNp3j
	onhd/v8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYP7-000000002pW-04N7;
	Mon, 25 May 2026 16:43:49 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYP4-000000002nj-3Cf6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 16:43:48 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 492C8B00573;
	Mon, 25 May 2026 18:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779727424;
	bh=qp1BSjiUi/5p94Cir8hjZnud1/YLhmdgzYl21op+gvc=;
	h=From:Subject:Date:In-Reply-To:References:To:Cc:From;
	b=XPuei6rdkZskA0RwtiqaThjnXqS16ATRvRhHDM6yBENsFK5U48qrhytAMF3Y5xVwm
	 Xhi6+LQH0RofaRGbKs8diCsTqyNxQOUlZReL8HIUBHc/JpC6/1Sp/AbPbMwmZjWGlv
	 MJCJNOwNJuVJU0JhX7nXJN9MK3KLxDrV3e9arOY1hgRG65dbWA9BqLdG45FLDKCr/m
	 PXW42nuV9bKgkjw+l+EgQsrsi7WWR3XW/Q4ToTN5eqnR8cPj4LzJKktoKMBpTzGpbh
	 hfvknXDufjXM8yddWNpxeL+r9An27M/tgW1c7FQ+QokbMhpiWQb+j0GW6H8+EF0N/R
	 3tE2cQaI7E9dw==
From: Vincent Jardin <vjardin@free.fr>
Subject: [PATCH v2 0/2] i2c: imx: fix SMBus block-read of 0 locking the bus
Date: Mon, 25 May 2026 18:43:14 +0200
Message-Id: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJ8FGoC/42NQQqDMBBFryKz7pQxEotd9R7iIsZJHWhVJlYs4
 t0bPUGX7394b4PIKhzhnm2gvEiUcUhgLhn43g1PRukSgyFTkjUWw6j4meKs7N4oxuNrNXlJGGT
 FJUfyrSNHVBVsIUkm5fScgbpJ3EucR/2evSU/1r/Vhx1DQa61RddVN/8IynwNCs2+7z/FPPq9y
 gAAAA==
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Kaushal Butala <kaushalkernelmailinglist@gmail.com>, 
 Shawn Guo <shawn.guo@freescale.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779727406; l=1125;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=qp1BSjiUi/5p94Cir8hjZnud1/YLhmdgzYl21op+gvc=;
 b=/ro5eVxZjr1OWIerjlcGOqzj2R+rX0uTtmI8My9AmNtsOn4T8Sc0gaQam0AfE0a8rfwikUoZ5
 vWZINmgOxGjAakNpEz9usWrVpOcMUv3VKjcF7tglCiCol2IrBWVCKW9
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_094346_939690_A10C605A 
X-CRM114-Status: UNSURE (   7.06  )
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

i2c-imx rejects a SMBus Block Read byte count of 0 (valid per SMBus 3.1
6.5.7) and it returns without a NACK+STOP, leaving the target
holding SDA so the bus is stuck until a power cycle occur.

The same bug is occuring with two independently introduced spots, so the
fix is two patches with their respective Fixes: tags and backport ranges:

  1/2  atomic/polling path       Fixes: 8e8782c71595   v3.16+
  2/2  IRQ-driven state machine  Fixes: 5f5c2d4579ca   v6.13+

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Handle when count > I2C_SMBUS_BLOCK_MAX the same way as count == 0
  Reported by the Sashiko AI review on v1.

---
Vincent Jardin (2):
      i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)
      i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)

 drivers/i2c/busses/i2c-imx.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260525-for-upstream-i2c-lx2160-fix-v1-0cba0a0093e5

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


