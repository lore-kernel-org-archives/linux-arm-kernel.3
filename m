Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114BACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 03:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMAa48VV4WNzxnbugA0Rcp3703e/G17GYUEc0RKkr2Y=; b=nZlFZqnK9VnZz/tog/qqBGDK6I
	Wu3KI7pA+l+mQEqJtIu2kbhapp1uvc8o/y7Mqac4ktvIKcMjIe+/hdlLs//zmPJjuTQqaf7BZO0tp
	vlr3NfNbht6VCUxAiHMqAmxVuOD6p7ppXwp6S/45aHhzvFmvqLG0vM+9Icun6ek3EYosnAyciI8qI
	HY63T0Zb3fQWd6wbWVuUH851WP3LKDXPNaWEYWf8ZS3SowHTkIn6Diso9cSxUkgAh6LiX8trz246G
	3I3l+CXuyF6j8AHk9YOjr2myf3C7vmrpznw/oSRaKFghYLv4i11MZjsCl/ktjx9CZAyznMD4Uwtxt
	5P598nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDpP-0000000D3UM-2rmP;
	Mon, 27 Oct 2025 03:23:27 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDpM-0000000D3TX-3Bb6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 03:23:26 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowACHY7aU5f5oAK+HAg--.18889S2;
	Mon, 27 Oct 2025 11:23:09 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: will@kernel.org,
	mark.rutland@arm.com,
	james.clark@linaro.org,
	robin.murphy@arm.com,
	ilkka@os.amperecomputing.com,
	make24@iscas.ac.cn,
	u.kleine-koenig@baylibre.com,
	suzuki.poulose@arm.com,
	bwicaksono@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: [PATCH] perf: arm_cspmu: fix device leak in arm_cspmu_impl_unregister
Date: Mon, 27 Oct 2025 11:22:59 +0800
Message-Id: <20251027032259.5818-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACHY7aU5f5oAK+HAg--.18889S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1fZrW3ArW5GF17JF43Wrg_yoW8Xry3pr
	48CFyYvFyjgr4UK39rZay8ZFWUGa1ru3s5CryxK34F9F9rZry8t348tr9xK3W8JFWUJayU
	t34aqr1kWa15JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwV
	AFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3kucU
	UUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_202325_175214_CF31A868 
X-CRM114-Status: UNSURE (   9.94  )
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

arm_cspmu_impl_unregister() utilizes driver_find_device() to locate
matching devices. driver_find_device() increments the ref count of the
found device by calling get_device(), but arm_cspmu_impl_unregister()
fails to call put_device() to decrement the reference count after
processing each device. This results in a reference count leak of the
device objects, which prevents devices from being properly released
and causes a memory leak. Fix the leak by adding put_device() after
device_release_driver() in the while loop.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: bfc653aa89cb ("perf: arm_cspmu: Separate Arm and vendor module")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..e0d4293f06f9 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1365,8 +1365,10 @@ void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match)
 
 	/* Unbind the driver from all matching backend devices. */
 	while ((dev = driver_find_device(&arm_cspmu_driver.driver, NULL,
-			match, arm_cspmu_match_device)))
+			match, arm_cspmu_match_device))) {
 		device_release_driver(dev);
+		put_device(dev);
+	}
 
 	mutex_lock(&arm_cspmu_lock);
 
-- 
2.17.1


