Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661DFF6E96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzAPEKG6So/PDOGgY059VUp1RC8xXZ0CXcJWrOlWZks=; b=Azdb6S43/01opTXugSK/V/skhV
	92iqiVG91e4KmrjfKZCTXibmXKoVLhx6p5UMrraHe98F3bLdX4fc5nV1Wuv77Qh+gbDDRO6np+6Hf
	LDgmJ6na4X5A0ENFQbbI6ie+L2FEeYCmEQ35ZFGX/jpzpyU2xgojV2EDxGblhNC62CeHyOS00rVMp
	WE4ut/RWwEz66IWIKfaiLS4muwaem1WmLrNq5w0AHCsgkDVID59zqslFSJN2hlrlz1Jp/z4YW7eQW
	bgLJk/YPSjdvp9THLpVpqsqfJimENUMP7jZLmpSRTCPGkQWyIWccKERHr2a3DeyaqYOPBAKaMA/kT
	5fcNjiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2d7O-00000007Jj4-10VH;
	Tue, 17 Mar 2026 22:42:30 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2d7H-00000007Jhb-0cOd;
	Tue, 17 Mar 2026 22:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzAPEKG6So/PDOGgY059VUp1RC8xXZ0CXcJWrOlWZks=; b=Xi7S8mCVqyoEHR9EBCuewJZyHn
	NzHGkJ1s9ukyv7YF6ovfBYxFxMMg5tJ2h7VzPYXL92/+8Nyr7gDx/Fdi6GgnwDv4rR/iZz3LJSiE5
	t4Jw4Q/9TiY6sHxytsQS8FayNFYtktC2U66Q5jk9fXIjndlFwOsGmYZ7W0xDdzntk4izGyPMx+ysM
	sisUeyoaZBvWyfhMSkfSkSSzjyZQ7363H21xDDSMycSJEJmD+jNhR0h3ac+xEF3U9PzGs2S06cdW/
	tgtEErCn45gVht5PDdBht9TKaqpZ+6xeYkwaV4TQPUR0zLOaiqxabRSKHWHKak3QhrSSVhiZbC60X
	TFlG0Gkw==;
Received: from [189.7.87.203] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w2d77-002VQv-4b; Tue, 17 Mar 2026 23:42:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 17 Mar 2026 19:41:50 -0300
Subject: [PATCH 2/2] pmdomain: bcm: bcm2835-power: Replace open-coded
 polling with readl_poll_timeout_atomic()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-bcm2835-power-timeout-v1-2-19db323c51f9@igalia.com>
References: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
In-Reply-To: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>
Cc: kernel-dev@igalia.com, linux-pm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=CmmPaRCr2hx1pUoOyiaFLoF4fRJRXNq/GTA2ITgum2Q=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpudi5JcsfXMgcYcCBw1ClEm9HvzDKFJ12jR84F
 CKbxS6s7haJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCabnYuQAKCRA/8w6Kdoj6
 qg1NB/4gfFS+FHmcdn144QE3wxtqYM2Owhhc7uvEYX4wodH2DVlkoKsz9mmm0xttspRbSecwFcy
 GdXw/l/zyLjLRvTmtNe/VsPievQTHdV+dHePobKLBYGkR3dmttheD9kLTuzOrhl8EJp+mIDPh+A
 bcOtlF4fSv2U3E6Y6WDW/B9a6gxvTbInZoXMzCPsHFhlwF4YG0/6cWwWqWcBO/iJ8D2yfqcVsLc
 n31QijEtmxo95XsSZ0vWvfhyGEnbKyOc/K4Rp7RxNHYkNjrRAgfFv+kkJ48oqTdhIjqSTK6VIHs
 bO09U34UbqMIK73X+1DkqzjSXIP74lO1heg5aFkpoKgnVmmG
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_154223_483790_FD1F70B7 
X-CRM114-Status: GOOD (  10.00  )
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

Replace hand-rolled ktime_get_ns()/cpu_relax() polling loops with
readl_poll_timeout_atomic() for the power-on (POWOK), and memory
repair (MRDONE) waits.

No functional change intended.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index eee87a3005325848547ce1f5fd729b168a641460..b76d74e3849be0aff226cfbe311970c9557eccfa 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -215,10 +215,10 @@ static int bcm2835_power_power_on(struct bcm2835_power_domain *pd, u32 pm_reg)
 {
 	struct bcm2835_power *power = pd->power;
 	struct device *dev = power->dev;
-	u64 start;
 	int ret;
 	int inrush;
 	bool powok;
+	u32 val;
 
 	/* We don't run this on BCM2711 */
 	if (power->rpivid_asb)
@@ -239,12 +239,8 @@ static int bcm2835_power_power_on(struct bcm2835_power_domain *pd, u32 pm_reg)
 			 (inrush << PM_INRUSH_SHIFT) |
 			 PM_POWUP);
 
-		start = ktime_get_ns();
-		while (!(powok = !!(PM_READ(pm_reg) & PM_POWOK))) {
-			cpu_relax();
-			if (ktime_get_ns() - start >= 3000)
-				break;
-		}
+		powok = !readl_poll_timeout_atomic(power->base + pm_reg,
+						   val, val & PM_POWOK, 0, 3);
 	}
 	if (!powok) {
 		dev_err(dev, "Timeout waiting for %s power OK\n",
@@ -258,15 +254,12 @@ static int bcm2835_power_power_on(struct bcm2835_power_domain *pd, u32 pm_reg)
 
 	/* Repair memory */
 	PM_WRITE(pm_reg, PM_READ(pm_reg) | PM_MEMREP);
-	start = ktime_get_ns();
-	while (!(PM_READ(pm_reg) & PM_MRDONE)) {
-		cpu_relax();
-		if (ktime_get_ns() - start >= 1000) {
-			dev_err(dev, "Timeout waiting for %s memory repair\n",
-				pd->base.name);
-			ret = -ETIMEDOUT;
-			goto err_disable_ispow;
-		}
+	if (readl_poll_timeout_atomic(power->base + pm_reg, val,
+				      val & PM_MRDONE, 0, 1)) {
+		dev_err(dev, "Timeout waiting for %s memory repair\n",
+			pd->base.name);
+		ret = -ETIMEDOUT;
+		goto err_disable_ispow;
 	}
 
 	/* Disable functional isolation */

-- 
2.53.0


