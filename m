Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971AC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZG5/sfixi74LSeiQo1OXaM4m5TUpoMFUVNIRZ8Z2pYk=; b=uSDVyO7Une1o76H7kJmTpcJ5Ad
	B84/QujJ27Eq6UUVKd7l5rVEDWD5Y/FUQUieaWe7C+151uAixb6w1wC8/i47MpmaSuzNnl2e/D7Tl
	aKTfqkZh6J2hHteLjQJQIB3vP/yaGGmyXhCfHv2Hnd3YW43kCNHb/CMjBjv6Vq7yIgrN238sysiR/
	OXQUdgcLxFh9Dei/ySIpnMHvmGPK23PxLS8K3nNhfFzbKEu9hKF/NSufiQX8jUWweV1m5M66XTAYT
	knOSItMlRFpEjw3vyLVl8q63xHI8XRrW//1VdGjMEZ5Xrz6YdzrBY9LXpnOdCpxLSCZr76GhIjoZG
	P6qysmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8yv-000000063zC-05OL;
	Mon, 17 Feb 2025 21:48:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8xP-000000063iD-2z6v;
	Mon, 17 Feb 2025 21:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739828833;
	bh=dWswvE6k6RZzT0gYmzA3vHv6oGrSRhqk5YRVLJGMfQo=;
	h=From:Date:Subject:To:Cc:From;
	b=hZufUftvTOC/mPZXkXOHREXlqLHcDmhBPjyZR65EGwNgnpyckzModKaTL56HP23ac
	 D5WU2jg40FGCoi8ABPELrsSFK/gEOAPGAgyTo24p+pqWO3CveE7ufid2/jUhnY2Z90
	 fM7Jq5QsHVozPBYdqANWrqbeKQWRerMiGbjwT+v/Me+o9aMG0gXVbKOg0Y/nfW0oHS
	 G9/PFlmmZtcSK+zSd1R8VyqjIc4FLW6I9efLoka5GrKJZNvy1R38F+gW9ft/TaODjF
	 sgJ5DCKez2nfV7gH1FCMX7t1Dx/xiO09Q4wWkmtii8wDUr5a/M4pR6ylu5uL+ckRwk
	 Csh+oYWpr5UpQ==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:11:e976::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8987817E02BE;
	Mon, 17 Feb 2025 22:47:12 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 17 Feb 2025 16:46:54 -0500
Subject: [PATCH v2] media: verisilicon: Fix AV1 decoder clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
X-B4-Tracking: v=1; b=H4sIAE2us2cC/42NQQ6CMBBFr0Jm7RimUkldeQ/DopRBGpExU0I0h
 LtbOYHL95L//gqJNXKCS7GC8hJTlCmDORQQBj/dGWOXGUxpbGmoxrbC7GcV9AthGCU8UP3MyLZ
 ydU+Vc10Pef5S7uN7T9+azENMs+hnf1roZ/+IZiI829YRnUywlq5BxtG3ov4Y5AnNtm1fTty95
 MQAAAA=
X-Change-ID: 20250217-b4-hantro-av1-clock-rate-e5497f1499df
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, kernel@collabora.com, stable@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_134715_922355_12277F22 
X-CRM114-Status: GOOD (  14.03  )
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

The desired clock frequency was correctly set to 400MHz in the device tree
but was lowered by the driver to 300MHz breaking 4K 60Hz content playback.
Fix the issue by removing the driver call to clk_set_rate(), which reduce
the amount of board specific code.

Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
Cc: stable@vger.kernel.org
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
This patch fixes user report of AV1 4K60 decoder not being fast enough
on RK3588 based SoC. This is a break from Hantro original authors
habbit of coding the frequencies in the driver instead of specifying this
frequency in the device tree. The other calls to clk_set_rate() are left
since this would require modifying many dtsi files, which would then be
unsuitable for backport.
---
Changes in v2:
- Completely remove the unused init function, the driver is null-safe
- Link to v1: https://lore.kernel.org/r/20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c355934cd80eb442219f6ba51bba8b71..842040f713c15e6ff295771bc9fa5a7b66e584b2 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -17,7 +17,6 @@
 
 #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
-#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
@@ -440,13 +439,6 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
 	return 0;
 }
 
-static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)
-{
-	/* Bump ACLKs to max. possible freq. to improve performance. */
-	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
-	return 0;
-}
-
 static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
@@ -807,7 +799,6 @@ const struct hantro_variant rk3588_vpu981_variant = {
 	.codec_ops = rk3588_vpu981_codec_ops,
 	.irqs = rk3588_vpu981_irqs,
 	.num_irqs = ARRAY_SIZE(rk3588_vpu981_irqs),
-	.init = rk3588_vpu981_hw_init,
 	.clk_names = rk3588_vpu981_vpu_clk_names,
 	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
 };

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250217-b4-hantro-av1-clock-rate-e5497f1499df

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


