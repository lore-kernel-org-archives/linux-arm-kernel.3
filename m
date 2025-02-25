Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22CCC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYDFKCivjY+iNd9Gg6iE7b6mxvcCHfwOBswGuF7X9gE=; b=T+nwgO4k0fXh7A
	rmohjnS+V2tl7i3lt6HFsTQ7CM0Uop/9FuFfIgjL24F9yLA5oyTLTX5pLKXplOh5J1Wk/JO9sNK2c
	Z9xniemhasQIXrgQ0w3m80TwSbT2oSAj8a8IOjmXPWwr4/ZLAVSj2z5LJBSKwNSzr0weUE/aEomOy
	2Uvhc9U3fjWGt57Nbsbfp6NfyzBWT9+/fokbKDZYAYer2HjHAZRpQE5tYqQ75P/Th0xa1VRgH1LPh
	UR55VU0PAFAgqyvChLSFe5pUpF+vtF2eCwULcziYgxSjFDuHyzjXYfvRWztFvbrp9U474kEVdtQ8C
	R/awgLYYKuIBH9JB/9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmukP-0000000HKC6-05YX;
	Tue, 25 Feb 2025 13:13:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuSX-0000000HGrJ-0IrU;
	Tue, 25 Feb 2025 12:54:50 +0000
Received: from mail.ideasonboard.com (unknown [223.190.81.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8778EA30;
	Tue, 25 Feb 2025 13:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740487996;
	bh=K8hIYu68rnMk8PuN3JrllsDdE9qN2sKwvnV/8hDc6p0=;
	h=From:Subject:Date:To:Cc:From;
	b=ClrOZbsTTH3DFN6wyn7XRIdWSNmRUQOenqTON8mDFWaaecoAKayo7wfkldy88kzIj
	 +WkWCtf8F38ZoVrUeXhdADCYcYlhNeTg0os08ccJIlpsq5+u3obe/gt3LTU9xM5fgM
	 knG0E664+BWc1QyCxotQVOnTuCWl6MMMqLwTWSX4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/2] media: rockchip: rkisp1: Add support for WDR and
 AWB64
Date: Tue, 25 Feb 2025 18:23:03 +0530
Message-Id: <20250225-awb64-v3-0-af29b1201e48@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC+9vWcC/22MQQ7CIBBFr9LMWgxDoagr72FcQDu1s7AYMKhpe
 ndpE10Yl+/nvzdBosiU4FBNEClz4jAWqDcVtIMbLyS4KwxKKo2qlsI9fKOF3Ssr5X5HaAjK9xa
 p5+faOZ0LD5zuIb7WbMZl/S1kFCiU9ZKoMb0xeOSOXAqjDy522zZcYQll9ZGNRPzKqsgSve29t
 qgb80ee5/kNj7Bkud4AAAA=
X-Change-ID: 20241230-awb64-79270098e15e
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=K8hIYu68rnMk8PuN3JrllsDdE9qN2sKwvnV/8hDc6p0=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvb2C0Sz5JW3o1cB9kaxxMhz3Co6XvCbcwa+yt
 ERkLN8E8KOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ729ggAKCRBD3pH5JJpx
 RSEOEACmkSF2j1EvX0tKWSiVJJoKSMR1M3KwyauCfPpS8pNOq3ZDvdopd9//jpCoXQH3UBdfiXZ
 bpJR50h+tmP6PL8T3Ce28lxyJMbxW2iHQwXpw2kJf7SNwj7j5k4QwE+pG/Et74MpvLSZUi+ObHw
 YhpjpacxX7bhQP5weDBxEYQRZ0rPJbyS3/4zfIudidmYqYGCVrCqShBXvBwbVUaw+qA2tPSfneW
 AwLW5d9u7TTFklxU7jnj5DnqY9OITUfDb+4WxZ75so/21DGCaQXWOd+RVsLOyZuWwX6xCeQxvss
 ncCcofForN6WSIewgNBntA+aTify6GzJGXvYgsHZdm7u6f0Wt9Oa7Hp2bfaZJ4aG65iOHBRP/L4
 Ogx6ixXEKfEqiTffFtSSnZ2PTLq0Sb//+DI33+eozLu9DiQwtz3h8ceO63uYMWJ8o84GnXGCeBF
 FGyZlKQ5Eq5jBgq3EGohhoiFtgdj7rRWJ+tdI/Vd6K3dLflxbGGz8h76LlOkKg3ATrVfSH8kn13
 FF0PfQq60+Z08TNJGlkTYB/UL+NRaro3Ah8L/vP9ginucPo/o5oY7aqOhWzaXoLnYvLMMn6zhod
 sO7vraJbSIUF8l31zrUrsYJe5KmeWjFjyjmi/z75I1QPM58/ZFei353LSzYNabYxx6TjT8FTQ6t
 LoywyKrqHaKfWjg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_045449_256096_5A506280 
X-CRM114-Status: GOOD (  12.96  )
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

Add support for Wide Dynamic Range and Auto White Balance 64 modules of
the ISP.

This series is in continuation of the v2 posted earlier that enabled
only AWB64. We add a new patch enabling WDR, and rebase the AWB64
patch on top of it, as WDR is a simpler module which is present across
different variants of the ISP.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Add a new patch that enables support for WDR module, and rebase AWB64
  support on top of it
- Document the fractional bits used for AWB64 configuration parameters
- Link to v2: https://lore.kernel.org/r/20250110-awb64-v2-1-01b7fb471465@ideasonboard.com

Changes in v2:
- Fix register offsets
- Drop the _v10 suffix from awb64 functions
- Combine the min and max for R, G, B components into a single value in
  the struct
- Move all the configuration except IRQ and module enable in the
  meas_config() routine, making sure the bool bits are cleared if
  userspace updates the struct
- Fix documentation and indent at various places
- Create a single function for getting both AWB and AWB64 stats for
  IMX8MP
- Rename accumulator fields to only specify RGB and not YUV, as AWB64
  block does not operate on YUV colorspace
- Link to v1: https://lore.kernel.org/r/20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com

---
Jai Luthra (2):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range
      media: rockchip: rkisp1: Add support for AWB64

 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 215 +++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 140 +++++++-------
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  40 ++++
 include/uapi/linux/rkisp1-config.h                 | 208 ++++++++++++++++++++
 6 files changed, 533 insertions(+), 75 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20241230-awb64-79270098e15e

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


