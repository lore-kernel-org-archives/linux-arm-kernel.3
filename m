Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAB1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CkvJoLK373ln4zs4Nd5alF3ccwEdYezxl+TGr5Jtiqw=; b=BoG6U/qM1F/1G7lzb6PfuDuOlV
	94aC1QFMAh1IvKBfP8Ctp5AqckH8ruHQHHOeOyg8ZST6wglRDho3HL+z9V8ZZO/MZdZikjvcmC43M
	7UbgOf47Noao7xYrVi5BXPjaBaB6q3LfHItO5OChg6WIpKiTo/Zgt99+dyu1+Uf0mRRRUeOPpNsYJ
	1wp+j+tRIKuBZ6Iv3+8YFUblSl3FGwDVfz6S0MJkz/QW1c7AztiRdmzOm6jF+zSwqcwqJ7vhji4Ny
	sqmdXxav0Xs8VgyQNniNJ3YPR877QK6HBES39jlw336YkNnOJfvzP6xoOJMPGfcTbF62Nhiv0hUKS
	dtrYgvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUEN-0000000FOc6-0SrC;
	Sun, 04 Oct 2026 21:58:51 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUEJ-0000000FObb-4ACQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 21:58:49 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so688818a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 14:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791151127; x=1791755927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkvJoLK373ln4zs4Nd5alF3ccwEdYezxl+TGr5Jtiqw=;
        b=IQLnk5Shczr6aOSpsdDNVZPD1l3nV2D4kaffZAOV0hTTF75mTUXZDkY0QEq1XQdTXV
         e3cNzS5A7erPqqjqh9b0GWZm82FC+LqHc+tANxYKIdhxuUwE+LAsbNyE4tFMQ0nMIy0e
         WKcvgKom0ybzWlrGVp0Qdqrp8Dg92sfGZY62H66ZsfXS+2fjhgX1QmDMdn1gv3E1rUGo
         gt0Y3Ux1zqpf1nMqjJyld0wuFov6yYGeKVBE9ScxGhQnMmH1oj6EzY2F2zkL1mCWGrjd
         AT0RYe7k5PkBrG7iH7yRfTZIUAc4jmcDkYSqITZJeDIyL/WFFiEJSa9ZyATaYknfGTGI
         sSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791151127; x=1791755927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkvJoLK373ln4zs4Nd5alF3ccwEdYezxl+TGr5Jtiqw=;
        b=luVYC7ppgD493FG01ulquXMsuy2TaRRgz7t6gP5HeoU523OFx62DD0KVZggpXoUNIC
         awPeVmIbjvGl0cHiC+0CgS7hx5K51MuGVMNuAKqzwyhsTLeZ20+qAmBTHYbkfuh14NmH
         YaF2ctjkFfPANVK0LfnCI4F8IHtVH/ihCTG415IT4a1JhB/458TXUsobCAAnQSKsv9zN
         sjISQTkVd5bBPkNXSdoAgFWyqdLr3oXjIUMMZTZTbX54B4T+e65Cs4gcogZmQaHCSIYZ
         gHnxw/R4zlXxYH/Ve+8IMZgguc2cJBHdJCI9BDY6QSHBJuDtKDx0KDrHASfklKV76Oo7
         CqtA==
X-Forwarded-Encrypted: i=1; AKwUvBwr/u1cl3DM0tM8fJzZjURXzOgerTXtA0/Xhz7O0dDsjgT2+a3aUdzuhqFCUFDxu7Wx5sXdIXxpY8aVOR3fOSCN@lists.infradead.org
X-Gm-Message-State: AFq9FYL+aH3GQgUqhm5qYzqBs8RjarL1xCjAHWkAXCvT8Pbhy3K723PJ
	D8ckqwidCQhgYUVHA6S8QogbpG7Fn4KiDWIIuaaWJDGv9U72I53p9TIA
X-Gm-Gg: AYBFou05nC9h1wTCLhPPYwepKWglko5w5MUEGjC/WiUTQKlOHvMCQeCFQ4KN84KHTun
	ymi98njCdLb7HkrwLAqoLfpYHkuaNYMwVsWhBKBfQ1rjtS+OURtwuYL96BJbUAqnXmqYYkkXj+E
	Nd+/h9kP75YDWyrxupNGMQ2zm9ws3ZJJ7dxdgVhTuuQq0Wlm1RGKycUHdApJbwTZnbSCVztRhU5
	P05pbjrEN3e2jVaMq8ulukoFkyHnWDEoskavdBWFKGHFlcHydLwIYpXhWBEp/ozFeh1sTZK5xnS
	ybRiNZAYI7Wdd1yvSarlMAzKCYdBAgVTduvhuheqqUS4XR19BiuGdbSRl10oENiZbgfMuHqddRh
	sCBSkbv1vl8Xl8wUlpYtL35lN5u9WS9VRBEkRgbntgjcMjhjynZzTBu7aOiAVyIsLou+qNGP5zi
	VX28kfvjpRi8wOVxfT81yIjNrN6azGHHuQtKX901EQtQhfiVlAKEqC7Ukoq8PQkdGJAUKnkImzd
	rmOtzewSN++WWq602j6b8yobYIpjMtQDAlBKpFjK8PA/AD92Hx39EubZ82n0M7uNlNTgt5Uj65A
	NsBPZNseE4y2pXN66V9QPY69IL9kVjuf3HWSjRemn7pGVTuL
X-Received: by 2002:a17:90b:2d4c:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3a6ce6ca6c8mr7611689a91.11.1791151126977;
        Sun, 04 Oct 2026 14:58:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d661ef5sm8486218a91.5.2026.10.04.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:58:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dave Gerlach <d-gerlach@ti.com>,
	Keerthy <j-keerthy@ti.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS)
Subject: [PATCH] rtc: omap: fail rtc-only suspend without a power-off RTC
Date: Sun,  4 Oct 2026 14:58:43 -0700
Message-ID: <20261004215843.396867-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_145848_062204_24F7FDD5 
X-CRM114-Status: GOOD (  15.58  )
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

omap_rtc_power_off_program() dereferences omap_rtc_power_off_rtc
unconditionally, but that pointer is only set when an RTC with the
"system-power-controller" property probed while pm_power_off was still
free, and it is cleared again when that RTC is removed.

pm33xx uses the function for rtc-only suspend whenever off mode is
enabled and an "rtc0" class device exists, which guarantees none of
that. Without the property, with another driver owning pm_power_off,
or with a different RTC registered as rtc0, suspending to mem
dereferences NULL in the cpu_suspend() finisher.

Return -ENODEV when no power-off RTC is set up, and propagate it from
am33xx_rtc_only_idle(). A non-zero return from the finisher makes
cpu_suspend() abort, so pm33xx reports a suspend failure instead of
oopsing.

Fixes: 5a99ae0092fe ("soc: ti: pm33xx: AM437X: Add rtc_only with ddr in self-refresh support")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-omap.c  | 11 +++++++++++
 drivers/soc/ti/pm33xx.c |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 18492165a19f..540232d6f26c 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -407,6 +407,9 @@ static struct omap_rtc *omap_rtc_power_off_rtc;
  * omap_rtc_power_off_program: Set the pmic power off sequence. The RTC
  * generates pmic_pwr_enable control, which can be used to control an external
  * PMIC.
+ *
+ * Return: 0 on success, or -ENODEV if no RTC was registered as the system
+ * power controller.
  */
 int omap_rtc_power_off_program(void)
 {
@@ -416,6 +419,14 @@ int omap_rtc_power_off_program(void)
 	int seconds;
 	u32 val;
 
+	/*
+	 * Only set when an RTC with "system-power-controller" took over
+	 * pm_power_off. pm33xx calls this for rtc-only suspend whenever an
+	 * rtc0 exists, which does not guarantee that.
+	 */
+	if (!rtc)
+		return -ENODEV;
+
 	rtc->type->unlock(rtc);
 	/* enable pmic_power_en control */
 	val = rtc_readl(rtc, OMAP_RTC_PMIC_REG);
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index 82979122417d..02ebf5a6f4b5 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -174,7 +174,13 @@ static struct wkup_m3_wakeup_src rtc_wake_src(void)
 
 static int am33xx_rtc_only_idle(unsigned long wfi_flags)
 {
-	omap_rtc_power_off_program();
+	int ret;
+
+	/* A non-zero return makes cpu_suspend() abort the suspend. */
+	ret = omap_rtc_power_off_program();
+	if (ret)
+		return ret;
+
 	am33xx_do_wfi_sram(wfi_flags);
 	return 0;
 }
-- 
2.56.0


