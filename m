Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27460C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qv5CI8QgjHSQGUAsYpHOyJ+UdzvD7BcP4G3r/lK7tFY=; b=PBXiaLairwkX7cCq8/ut/L1QpZ
	9m5DBmC8XBV81a/dH0rBb34o4k+BWSDaTdp/3jIwsUzLQHVGBlr59LI99LWSpWe/l4PAvUCCTvOHd
	xfHtygQrVacXd2efnBLDbhWJ9WV3KO0Kffl7Pl503BRz0uoQ4Y2gQs947tWeyKpXadvCK4e5LLnnL
	BSgqZ8dG6T6Sw423cbKcJBqBeDxj4WEuw6LCt9FT9cQKnhnudRioIDm7k53Ve5ttkIJZ7NTsb6yIX
	M0ayw1aIoERMLu/cCYYiXZS8lH1SOnK4OTVcoq/ze/fcyC67+tbqhjTJ4lZeBnQp+ZpXFVoE2Z2MA
	YOzl7RBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qsv-000000047yd-1mN1;
	Sat, 05 Sep 2026 13:56:45 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qss-000000047xl-1jeV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 13:56:43 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482e1b429f7so69366f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616600; x=1789221400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv5CI8QgjHSQGUAsYpHOyJ+UdzvD7BcP4G3r/lK7tFY=;
        b=EUQeZXPJIcv1UUMoirgcmkgF0A4MF8n3k4Fu1zGItltv2GWgJYHHyV1jm+5ZrvRsCf
         vfkkUg18pUEnsii+ojQWI+q1ZTpGGkecpfPMiDbb5mw1Yjf+CSwfOFTNm+cJTavv3a5O
         Xa7GeGkD3jdrmNx3bvXkXwif69PEjduZZPAKJ0Pvv9iOsHRMb6J/07BS8qSQn0PygbVq
         2mwyaG/9GqmEPiK0Wr7FwT1Vak9LImCICgKwY19/+qbBeUDrSXzDCrbmo/rUqkt6GVGF
         NLfgqCtg8Uh6Bz+BbErQAYQmFP32ri5hufevWSYXNL4pctazhkXv1x/ffF7rEqqMm3Bk
         keOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616600; x=1789221400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv5CI8QgjHSQGUAsYpHOyJ+UdzvD7BcP4G3r/lK7tFY=;
        b=NKtMfQL4YdzlLbdT2XjfX7ydc3l4MRcvO1Myfxj506G0yJuxLEi57EURSvegw87qsQ
         I40ipY2PJABiZ+t2acHJT620EQVd39jE4Nf5L43CHdD2Zlp+o5Ek/XmtsWxBuJeDbPWa
         TplYCzeZwLyp2zcZ/ODCZWXWVUWxo8kKfhH5IEdPzEa/eYfy1x8jpBxSQzNzgyHA+3ch
         HLsQW2qy6VssiGxyQgV0s2iAGAsaB6ws8iSBTM2mIC4DwlUHXQ+gh8Gf54z+5xtyxAQd
         ZDMNGuO5EC4EeQ5eo2+xECGyqxKkPMaO3VMCsqkwnNKNEpjWkG5nbY0LXlA6mlT2gz5n
         nJaw==
X-Forwarded-Encrypted: i=1; AKwUvBx9m8Kkv3rv12/1JqUy+KLL3rQPrtdLDMnewuldWZAwtP3hXaFCtSuWc5Hnhz9FNo2dJrhola83Gu/DkN7AkvaH@lists.infradead.org
X-Gm-Message-State: AFuF++mD5UVF+kQcVhR4x4g6Ez96YXfZcRrHeL8c2LihMfllFiXz3H2x
	qMKmPpc3t59M40hvtLIYRAnkKg0j/OIYCTeq2OJdn+iuWUiUERV6XpqSgYrR2A==
X-Gm-Gg: AYBFou3ecK+yCY3jYjvOqfaxNYXW0/WbYkPtfAJuNSp1nkVqiaDxnJ2VsYhEyO6OABT
	HViE1IhBRqRk/fjXzEFY0bCYBDjHbDIPRKux0YLq+eJDhIvcSHO1LFsAyRaMIb0xbsITCbrUqVS
	g0DlLkQB3rzu/XNsn0bGw6HqZm9fxut+kfKtMV82dlVytmjV0BmbtwF+Osd58CQ6rrw4dMyL7Jh
	WK0j2rwaSrRPnb0uLB8PiJvh+Y86Q2Z1x5ciWZul9l9Wl6Lb++mDOsKOpu/zay1yfO3VuH+goED
	HawEXH+Ff3EJA7y8OJBFV0ylZdm5KmaeZavmn95tCW77Eypaw2E5qywWBeRmMsLtzMHKvpQWdtL
	urgY0P/a9SIdVs8vhYHCeaaH+f9/e/PePqIR6hOMipW0lbWsc1sjA5VUwtAGb5oj+6mtZtU7qGy
	gSmrqj5dktfAhUtulJu2j5x+TiN6t5S2bRxmqWCK+rdpKHbciXka3l5pUNY8SrUHLkMAKNEeshu
	Q2HZ16jQk56ebcZX+aW+U4Jb72x+2q/jLjqvk4vwXyOjaeSgyeeGfbgi7J3ggNp7/Gv
X-Received: by 2002:a05:600c:c48f:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49d010c4f64mr47995125e9.0.1788616600147;
        Sat, 05 Sep 2026 06:56:40 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B950E00B62CC1B9060BE3C4.dsl.pool.telekom.hu. [2001:4c4e:1b95:e00:b62c:c1b9:60b:e3c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm10523155f8f.11.2026.09.05.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:56:39 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] accel/rocket: number the cores by devicetree position, not bind order
Date: Sat,  5 Sep 2026 15:56:12 +0200
Message-ID: <20260905135612.7324-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_065642_478991_AA90895D 
X-CRM114-Status: GOOD (  22.59  )
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

rocket_job_hw_submit() programs the S_POINTER registers of a core with an
extra bit derived from core->index, the way the vendor driver derives it
from the hardware number of the core. rocket_probe() sets core->index to
the slot the core takes in rdev->cores[], which is the order the cores
bind in.

The two agree only while the cores that bind are a prefix of the core
nodes in the devicetree, in devicetree order. Unbind them and bind them
back with a different core first, have one core's probe deferred behind a
sibling's, or disable a core other than the last one, and every task
submitted to a core whose slot is not its hardware number times out after
500 ms. The reset that follows does not help, and the inference finishes
with wrong output.

Observed on an Orange Pi 5 Plus, over all six bind orders of the three
cores: only the devicetree order ran clean. The other five produced 27 to
140 "NPU job timed out" within a single six-second inference, with a
bit-exact oracle rejecting the output, or throughput falling from 130 to
1.95 inferences per second. The timeouts land on the cores whose slot is
not their hardware number, in proportion to the tasks the scheduler hands
them, and in both directions of the mismatch.

Number the cores by their position among the core nodes in the devicetree
instead, which is what the hardware number is.

The wrong value has been assigned since the driver was added, but it only
reached the hardware once the extra bit was introduced, hence the Fixes
tag below.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM sparse checkpatch
---
 drivers/accel/rocket/rocket_core.h |  5 +++++
 drivers/accel/rocket/rocket_drv.c  | 31 +++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca9..46ed8352a79d2 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -30,6 +30,11 @@
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
+	/*
+	 * Hardware number of the core: its position among the core nodes in
+	 * the devicetree. Not an index into rdev->cores[] - that slot is what
+	 * find_core_for_dev() returns.
+	 */
 	unsigned int index;
 
 	int irq;
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..e2cde31443ffa 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -157,10 +157,39 @@ static const struct drm_driver rocket_drm_driver = {
 	.desc			= "rocket DRM",
 };
 
+/*
+ * The extra bit that rocket_job_hw_submit() sets in the S_POINTER registers
+ * is the hardware number of the core, which is its position among the core
+ * nodes in the devicetree: a disabled core keeps its number. The slot a core
+ * takes in rdev->cores[] is the order the cores happened to bind in, and the
+ * two only agree while the cores that bind are a prefix of those nodes, in
+ * devicetree order. Every task submitted to a core whose slot is not its
+ * hardware number then times out.
+ */
+static int rocket_core_hw_index(struct device *dev)
+{
+	struct device_node *np;
+	int index = 0;
+
+	for_each_matching_node(np, dev->driver->of_match_table) {
+		if (np == dev->of_node) {
+			of_node_put(np);
+			return index;
+		}
+		index++;
+	}
+
+	return -ENODEV;
+}
+
 static int rocket_probe(struct platform_device *pdev)
 {
+	int index = rocket_core_hw_index(&pdev->dev);
 	int ret;
 
+	if (index < 0)
+		return index;
+
 	if (rdev == NULL) {
 		/* First core probing, initialize DRM device. */
 		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
@@ -176,7 +205,7 @@ static int rocket_probe(struct platform_device *pdev)
 
 	rdev->cores[core].rdev = rdev;
 	rdev->cores[core].dev = &pdev->dev;
-	rdev->cores[core].index = core;
+	rdev->cores[core].index = index;
 
 	rdev->num_cores++;
 

base-commit: a9f09b5ea0c3db1e2d4c0f8d3ebdd612d8aa0366
-- 
2.43.0


