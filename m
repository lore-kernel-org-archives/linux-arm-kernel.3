Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EA7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLnG8c2xuEE2z9wReiBYt9Tx58asG4MmHs5+1KbBJQ8=; b=ekyTOtUfDeML5MOsofiVkGOGNu
	YNm0e9n6hAUetlRQNPT4xqHmgE13B4UQCvdL04u8j0NmCsgoTJrXYIZ10tyg5QQIRCOvb+n1xJ14S
	B7hwQZmBL9G1XqTnDjs64z/ONLa4z6YZ1xWeUZRVXjDuuxHduSk24rmW/BPdUq9sRRSUwZXq97Sdw
	LJtic0CD+rUI0xOGQY56o+kS95fNmyBUBijOK9AEsvzQWrrBiYytlu1KS+exeC/8LQS5kPNnvc2x/
	MQvCuPIBk0waH+eVD8F+3PmYzWa0hBeRWQeIMClscdosXtcLcUvADfxlbr248BFipj73BCSTGIp+x
	taY8PJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8Fu-00000005yHV-3txl;
	Mon, 17 Feb 2025 21:02:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8ER-00000005y1F-3FSv;
	Mon, 17 Feb 2025 21:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739826045;
	bh=f5tgNUKn8b8r/9Um0XvFMzVBJvr9yukC/ZCxlBpueLU=;
	h=From:Date:Subject:To:Cc:From;
	b=bSDoAD+JmM6J6AcSUDPkzxa/vE0iU5XSWGbAfLo/JbUAZXYz3UiFHJ6Uw9pBaWDql
	 6KLWhZbBSdZZogDh0shLRnSSHjQdS3iUr5y+grmvv/sXTWXyYjAdEcnFu1lwWaGs3c
	 ZChyktJ95Uxgy7oeXN3aVBnW3RL7iWVVuvyIC/xgk+obT/KB7M5kT0hiVUZHuowwS0
	 Ld6weeFac+aDBakv6K6JbwtmqmG4ahLU5yPsgZjp/Ra2bMp8z9o02zQmXIPNjWJ/U1
	 ptkkg/N8pv1Y1vK4HjqkVtQDypnoJp8XpEGlIBH5cGgK2aOdqwTW935r/hj0EFLgav
	 NjmuK0IVOApPw==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:11:e976::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B235C17E1097;
	Mon, 17 Feb 2025 22:00:43 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 17 Feb 2025 16:00:38 -0500
Subject: [PATCH] media: verisilicon: Fix AV1 decoder clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHWjs2cC/x2MQQqAIBAAvxJ7biHFCPtKdDBbayky1ohA+nvSc
 QZmMiQSpgR9lUHo5sTxKKDqCvzqjoWQ58KgG902WnU4GSz+kojuVuj36DcUdxFSa2wXlLF2DlD
 yUyjw86+H8X0/3kW3uWoAAAA=
X-Change-ID: 20250217-b4-hantro-av1-clock-rate-e5497f1499df
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: stable@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, kernel@collabora.com, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_130047_981683_C7D18E61 
X-CRM114-Status: GOOD (  15.04  )
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
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
This patch fixes user report of AV1 4K60 decoder not being fast enough
on RK3588 based SoC. This is a break from Hantro original authors
habbit of coding the frequencies in the driver instead of specifying this
frequency in the device tree. The other calls to clk_set_rate() are left
since this would require modifying many dtsi files, which would then be
unsuitable for backport.
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c355934cd80eb442219f6ba51bba8b71..9d8eab33556d62733ec7ec6b5e685c86ba7086e4 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -17,7 +17,6 @@
 
 #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
-#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
@@ -440,10 +439,9 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
 	return 0;
 }
 
+/* TODO just remove, the CLK are defined correctly in the DTS */
 static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)
 {
-	/* Bump ACLKs to max. possible freq. to improve performance. */
-	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
 	return 0;
 }
 
@@ -807,7 +805,6 @@ const struct hantro_variant rk3588_vpu981_variant = {
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


