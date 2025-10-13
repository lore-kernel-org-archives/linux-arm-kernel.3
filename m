Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913F9CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5W/p2P/EoHtENGM2zw+O/fNV3kIkZkb90QJ9eHXBW54=; b=q8jai5CZP0A7bB+F+ZcBPeJJnj
	fy/eFbuxpLPg+qP9Wk/Tj1q3m1/N00TsisAo/1nfywiRPqHvm0k/uwm2bbT/lA5MaHyW0Vk0ZTFTE
	MoPUPFkEvb5/gvwEbbtK+z0USm42dP6phul02DwC48pNmIkcevwUSS2XvtFwdeQXHCRU5MYN7vTsN
	TbuqV6Hxh7R+dWRpPew53zM0TQyexdiXZX7uzxu3pPZSfLR+aCyFbP/rI1ZGUIo74f3OOqgY6k5VM
	PkDxY35p3mkAyNnTtQM0kWz2rJXlB+OB9q/7lOPMXRliwpVOfHuPbiqFiYTXn/f1X+ER20S38eeWK
	XmgNkCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D4q-0000000CVGy-1c5T;
	Mon, 13 Oct 2025 07:34:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D4n-0000000CVGS-0gSf;
	Mon, 13 Oct 2025 07:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760340856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SjXvJu+0aw4xckUH7lck7ICJqmaQGmv80hZYTOYLzaknZ/8xvlq40ClTC57fIcoHd8npb86VG9Y8lEFYP8CWAJEvMZFdWwfz9Q4n5JKT2SGvqV8rfh+cCdhe+5JVurMrcqsK60NYFDSgDxX3niuml8J5RovrZIniTi9GqQJuqoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760340856; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5W/p2P/EoHtENGM2zw+O/fNV3kIkZkb90QJ9eHXBW54=; 
	b=gE5whtZRfMU5IMkCVkgFMHEhfjktbPhtMbgGr4vQdbe8mWOdNRIRzegLrH7jsL145/7aGuxFzlzzwcAZ5dgCi9udaiFhlT+esw0IxjaHCWUFvIi9OTEgBeLDqxyIJovNDWB6ERCTrLU+0dJit5IOKLN2k8ILkmO7rCrfvbnl9Ec=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760340856;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=5W/p2P/EoHtENGM2zw+O/fNV3kIkZkb90QJ9eHXBW54=;
	b=AyQkphUp6sUYT5/8R3SRYFj/3pk43NQrIK4FuMU8/rbecKhdT1duMmIYYbA5MWbd
	SN1oQaQk9FDra61sc+sC5xzMQzrrkY705gZaEYDtDjYy86oVaZwSQ2IflTsDYOZubCV
	nqESgaDlUGDIofIb0f2bW7So6LUxQQbbRZIucH1g=
Received: by mx.zohomail.com with SMTPS id 1760340853910318.69177918268304;
	Mon, 13 Oct 2025 00:34:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Oct 2025 09:34:04 +0200
Subject: [PATCH] PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-hiword-rockchip-dfi-v1-1-4f2a63098553@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGur7GgC/yXMQQrCMBCF4auEWTuSxBpKryJd1GRiBmlTJ7UKp
 Xc32OX34P0bFBKmAp3aQGjlwnmqMCcFPg3Tg5BDNVhtr0abCyb+ZAko2T994hlDZGyMdjo617R
 WQ33OQpG//+qtPyz0etf4coxwHwqhz+PIS6dWdzYtijfQ7/sPfxY7wJIAAAA=
X-Change-ID: 20251013-hiword-rockchip-dfi-41060f664820
To: Yury Norov <yury.norov@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_003437_416479_7A1FB293 
X-CRM114-Status: GOOD (  17.05  )
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

Like many other Rockchip drivers, rockchip-dfi brings with it its own
HIWORD_UPDATE macro. This variant doesn't shift the value (and like the
others, doesn't do any checking).

Remove it, and replace instances of it with hw_bitfield.h's
FIELD_PREP_WM16.  Since FIELD_PREP_WM16 requires contiguous masks and
shifts the value for us, some reshuffling of definitions needs to
happen.

This gives us better compile-time error checking, and in my opinion,
nicer code.

Tested on an RK3568 ODROID-M1 board (LPDDR4X at 1560 MHz, an RK3588
Radxa ROCK 5B board (LPDDR4X at 2112 MHz) and an RK3588 Radxa ROCK 5T
board (LPDDR5 at 2400 MHz). perf measurements were consistent with the
measurements of stress-ng --stream in all cases.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Hi Yury,

as promised[1], here's the follow-up patch to move rockchip-dfi to the
new FIELD_PREP_WM16 macro after the LPDDR5 changes, which caused a
conflict during the last merge window.

I've re-tested it on three boards, as outlined in the commit message.

Link: https://lore.kernel.org/all/14358105.O9o76ZdvQC@workhorse/t/#m6b5b01cb30a04745ea3167a660b4794c608f387b [1]
---
 drivers/devfreq/event/rockchip-dfi.c | 45 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 5a2c9badcc64..5e6e7e900bda 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/bitfield.h>
+#include <linux/hw_bitfield.h>
 #include <linux/bits.h>
 #include <linux/perf_event.h>
 
@@ -30,8 +31,6 @@
 
 #define DMC_MAX_CHANNELS	4
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
-
 /* DDRMON_CTRL */
 #define DDRMON_CTRL	0x04
 #define DDRMON_CTRL_LPDDR5		BIT(6)
@@ -41,10 +40,6 @@
 #define DDRMON_CTRL_LPDDR23		BIT(2)
 #define DDRMON_CTRL_SOFTWARE_EN		BIT(1)
 #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
-#define DDRMON_CTRL_DDR_TYPE_MASK	(DDRMON_CTRL_LPDDR5 | \
-					 DDRMON_CTRL_DDR4 | \
-					 DDRMON_CTRL_LPDDR4 | \
-					 DDRMON_CTRL_LPDDR23)
 #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
 
 #define DDRMON_CH0_WR_NUM		0x20
@@ -124,27 +119,31 @@ struct rockchip_dfi {
 	unsigned int count_multiplier;	/* number of data clocks per count */
 };
 
-static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl,
-					u32 *mask)
+static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
 {
 	u32 ddrmon_ver;
 
-	*mask = DDRMON_CTRL_DDR_TYPE_MASK;
-
 	switch (dfi->ddr_type) {
 	case ROCKCHIP_DDRTYPE_LPDDR2:
 	case ROCKCHIP_DDRTYPE_LPDDR3:
-		*ctrl = DDRMON_CTRL_LPDDR23;
+		*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 1) |
+			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0) |
+			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 0);
 		break;
 	case ROCKCHIP_DDRTYPE_LPDDR4:
 	case ROCKCHIP_DDRTYPE_LPDDR4X:
-		*ctrl = DDRMON_CTRL_LPDDR4;
+		*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
+			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 1) |
+			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 0);
 		break;
 	case ROCKCHIP_DDRTYPE_LPDDR5:
 		ddrmon_ver = readl_relaxed(dfi->regs);
 		if (ddrmon_ver < 0x40) {
-			*ctrl = DDRMON_CTRL_LPDDR5 | dfi->lp5_bank_mode;
-			*mask |= DDRMON_CTRL_LP5_BANK_MODE_MASK;
+			*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
+				FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0) |
+				FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 1) |
+				FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
+						dfi->lp5_bank_mode);
 			break;
 		}
 
@@ -172,7 +171,6 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 	void __iomem *dfi_regs = dfi->regs;
 	int i, ret = 0;
 	u32 ctrl;
-	u32 ctrl_mask;
 
 	mutex_lock(&dfi->mutex);
 
@@ -186,7 +184,7 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 		goto out;
 	}
 
-	ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl, &ctrl_mask);
+	ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
 	if (ret)
 		goto out;
 
@@ -196,15 +194,16 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 			continue;
 
 		/* clear DDRMON_CTRL setting */
-		writel_relaxed(HIWORD_UPDATE(0, DDRMON_CTRL_TIMER_CNT_EN |
-			       DDRMON_CTRL_SOFTWARE_EN | DDRMON_CTRL_HARDWARE_EN),
+		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_TIMER_CNT_EN, 0) |
+			       FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 0) |
+			       FIELD_PREP_WM16(DDRMON_CTRL_HARDWARE_EN, 0),
 			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
-		writel_relaxed(HIWORD_UPDATE(ctrl, ctrl_mask),
-			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
+		writel_relaxed(ctrl, dfi_regs + i * dfi->ddrmon_stride +
+			       DDRMON_CTRL);
 
 		/* enable count, use software mode */
-		writel_relaxed(HIWORD_UPDATE(DDRMON_CTRL_SOFTWARE_EN, DDRMON_CTRL_SOFTWARE_EN),
+		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 1),
 			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		if (dfi->ddrmon_ctrl_single)
@@ -234,8 +233,8 @@ static void rockchip_dfi_disable(struct rockchip_dfi *dfi)
 		if (!(dfi->channel_mask & BIT(i)))
 			continue;
 
-		writel_relaxed(HIWORD_UPDATE(0, DDRMON_CTRL_SOFTWARE_EN),
-			      dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
+		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 0),
+			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		if (dfi->ddrmon_ctrl_single)
 			break;

---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251013-hiword-rockchip-dfi-41060f664820

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


