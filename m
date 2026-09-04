Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C5C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/WcwZhKQetLuVj0VCLbzfxuQncGS/yqg6oOZ6MnNyQ=; b=bKlrb806bhyduhhRPpxK6Gu5ot
	seGJQnt9bhRFivsnXNPWWhyFxKAqc/gi7vCLPG7OZcs4NHj6rZesjmGqlDMDL5d6+oFLNGUo/6NbQ
	mXLMkXCnAFnCObVzoF+6HvmMjqoyXvZ7sWdk0M7En2AyLrPAibIoqoEoEiesz4WuLa4ldjOfCfqE8
	NM+hIYZkj4/EygrcF8hE83iMTRl9U/w/8LQUSoFZuXxpEM/bVE0qyWDkiBqIlVGK6l5UTB7MqPC1l
	Vv38GWqfUpXXg4KCHf6ToQKMWHOaIiI54h5HfQ8QX+2GOkF2n+TzKRzQ6aRps8q2yMQJYs4uPSGtj
	F1wQQ9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TWU-000000025TI-1Hsj;
	Fri, 04 Sep 2026 13:00:02 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TWR-000000025SE-3azU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:00:01 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-499db1740f0so383285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526798; x=1789131598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/WcwZhKQetLuVj0VCLbzfxuQncGS/yqg6oOZ6MnNyQ=;
        b=Ex4HWJXvOodnnHHBq/PZgveM4LTWwBxi49x12l9tTxFLSmiDnAWYYBbeXLv3LqzwLy
         01U/446HkBUAJ4WflRAdYNZMtj7q2M/a0hGFdOvBojaQlZmh2UXQ3XyATEA+X6XBAQLl
         oBJHpJAMPbvvE9XdoeTskwOwIuSNB9dlMH9ns4jaNF7XShgrGmUNvg0JTsriUjQxWM4y
         Ps2K1ZgK01KoalXMJYVXP+QrGZp6sicjKWjx6iQ6m92WuNKPzp5R/pds5xhZhjSswqaO
         WqgX4tk2WI8xf4OHIoirzl2TcZPa4VZMY6iQyqkGMXQwP70aw0/aL8hpuEqEkYAX7onM
         YMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526798; x=1789131598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/WcwZhKQetLuVj0VCLbzfxuQncGS/yqg6oOZ6MnNyQ=;
        b=evmCHOofZOxRimmQwnzxqCSIZ8FA0okUHoxVDIjk8Ezhu/cwazCfHG4AkjeFONYd8i
         fksbCZ8YqGElIGz8+qvbbkDjAlEZABJDfnChxRsoRDSkSpwZ9c6I9yZviBA9MzrSZfb+
         YZAFaFVTq7Yj+ht0CabSkuM7Fb8e8Gh1683F4h+mbj70VOw8Ea5/QJWtzvMlmlUqdglk
         dcKYKNPHPsMbe71iSntXMtbADCPeyxva5SOVI+V1uuAmGMDcO+SjFUsdDjyFKDHKrqqS
         /m/fDpKnWd5JZLKEib3fUlljtbhyCmLQQ36y1SG0IzbQ/Qrcb+vDR592D5l54P81AxJk
         SR0w==
X-Forwarded-Encrypted: i=1; AKwUvByTLgzyKIY9eNwSet/fPlw6n/dJfRQsGPOGt20q/vja2Pm/pptPkXY4pgdpQTTwWyLuXCYSPTbZ3Dpen5F1GDNa@lists.infradead.org
X-Gm-Message-State: AFuF++nZkm/jm/rXJ5bmfn5ZN5PhFRQfQmjGMyUG6fsdx+BOl1MaKQhJ
	+OBPJ0i8XrxTRLh4nJ935esUXL/cyHHbW+zbN/uCSJPpDl8s/rJWs4M1
X-Gm-Gg: AYBFou3cGmnZsbodFwvuaTXPR1Oy89pfH+1BxdEtQusDiTp25u9MGF9PNU+Jv+9ZZDq
	E+DaRsYP4bBe0prOv3JNjT8/x2fdnWEQcSs4lh98YPlbPnYLA9OOUYWBul3om21kTs2aNvIzKnS
	cuiVkBChTg9/Flf4Xh3dFUG7IH8dkS4GzU7h51d+d6ZhbldaYSitkMkcQfvY2HzQ8THw7+vgAgw
	aOChiTEkbLiEjNVh/JkYwzvj7Kz1Tz+LIL13v0iDkHBrVVCymwAzEsQKpz85AEbxZfLL3QqxAMl
	lBvw18eSZaarnJeBxZ93Dh6/0RhD1qceBLvOTeFsWkuyqhfG8xBDGzI9jGRE5HTcOOw5AaRn+0u
	VUg9rMs4FZa94MoGL08OEuazxB+D66hFqoZDHo8iBky32Q2z2gjMGKS9gXm3aiTdgiy1gnswErN
	kmJk/U4aATHAiw+0272I3FxNFoTXXVqaDoqtcIp9tItuYh36kcfEiwE3lyEiF5FqlQgIa19Gveq
	SU/BCxW63Eg+s98NAY+uTpIBaeDl6b2xcQ8LGtzrS47mIFhcOgo7crNBpaymJYJ1e8kniJnkLcR
	d17i7PxU7N4mBb4=
X-Received: by 2002:a05:600c:34c5:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49cf823c012mr40540685e9.1.1788526797556;
        Fri, 04 Sep 2026 05:59:57 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135287435e9.3.2026.09.04.05.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:59:56 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH] accel/rocket: search every core slot when a core is removed
Date: Fri,  4 Sep 2026 14:59:36 +0200
Message-ID: <20260904125936.26234-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_055959_947222_6A52BB85 
X-CRM114-Status: GOOD (  23.19  )
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

rocket_remove() decrements rdev->num_cores for each core it removes,
while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
the cores in the order they were bound therefore loses the last one: by
the time it is removed the search range has already shrunk past its
slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
without doing anything.

num_cores never reaches zero, rocket_device_fini() never runs, and the
file-scoped rdev keeps pointing at a device that is going away. Binding
the cores again starts from that stale count, because rocket_probe()
takes rdev->num_cores as the slot to fill. On an RK3588, which describes
three cores, the second round lands on slots 1, 2 and 3 while rdev->cores
was allocated with room for three:

  rocket fdab0000.npu: Rockchip NPU core 1 version: 1179210309
  rocket fdac0000.npu: Rockchip NPU core 2 version: 1179210309
  rocket fdad0000.npu: Rockchip NPU core 3 version: 1179210309

The write to rdev->cores[3] is past the end of the array.

Nothing in tree reads the core array often enough to notice, so the
overrun is silent today. It turned up while testing a devfreq series on
top of this, where a worker walks every core a few times a second, and
UBSAN caught the first bool it read out of the overrun entry:

  UBSAN: invalid-load in drivers/accel/rocket/rocket_devfreq.c:47:10
  load of value 5 is not a valid value for type '_Bool'
  Workqueue: devfreq_wq devfreq_monitor

Record how many slots were allocated and search all of them. Every core
is then found on removal, num_cores reaches zero, the device is torn down
and a later bind starts from a clean rdev.

This does not make unbinding a single core out of several work. probe
still takes num_cores as the slot to fill, so rebinding one core while
its siblings stay bound would write over a slot that is already in use,
and rocket_open() still reaches for cores[0] whether or not anything is
there. Both of those want more thought than a fix should carry.

Found by unbinding and rebinding all three cores on an Orange Pi 5 Plus.
With this applied, 25 unbind/rebind rounds and 5 module unload/reload
rounds run clean there: the cores land in slots 0, 1 and 2 every time,
whichever order they are bound in, and the shared supply goes back to a
single user after each round.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM sparse checkpatch
---
 drivers/accel/rocket/rocket_device.c | 2 ++
 drivers/accel/rocket/rocket_device.h | 1 +
 drivers/accel/rocket/rocket_drv.c    | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e72c5f..efd004194c1af 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -31,6 +31,8 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 		if (of_device_is_available(core_node))
 			num_cores++;
 
+	rdev->max_cores = num_cores;
+
 	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ce662abc01d3d..c62d567010696 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -19,6 +19,7 @@ struct rocket_device {
 
 	struct rocket_core *cores;
 	unsigned int num_cores;
+	unsigned int max_cores;
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..2bcfe4ab3c68f 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -223,7 +223,7 @@ static int find_core_for_dev(struct device *dev)
 {
 	struct rocket_device *rdev = dev_get_drvdata(dev);
 
-	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+	for (unsigned int core = 0; core < rdev->max_cores; core++) {
 		if (dev == rdev->cores[core].dev)
 			return core;
 	}
-- 
2.43.0


