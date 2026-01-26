Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85B4D13C0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZsk+AdQN3zF6RFk72WnyalK/6pbfIeRYauOjs9RINM=; b=IRHHAPSAHjNYVIy0B82aaivPEz
	zt+hF9H5ZADn2HUj0s+4ZVf6FrQ8Nh1xzKOJ1pJOLsibJvJ9OpWPWO5xvpPmoQ6MPKjCvLneSoFwu
	p/5s+RuKGW3uc8UXEDSYqOn79r65mRKPgV8dcvIYJ6l0b7XhH51q0K7UbUskLdQj2UWofb8wI5X3a
	EZkgXRx2XE3UZU4WvJDt6s01cnB5lVUll31F5ZHp7Q04bv/dNc7BLyhsAy62AHusvrM2E7BR5r5fd
	oMB12SLg3K+LnKL07u9DpflSP08xkg2JZrn9YJBFj9QGawSdA4mltrIorOKWKDuxLECHLdTkCw6BZ
	CUQuLJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1S-0000000CeDE-3ZMW;
	Mon, 26 Jan 2026 13:52:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1H-0000000Ce6a-3SuQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A84BC497;
	Mon, 26 Jan 2026 05:52:34 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7012B3F632;
	Mon, 26 Jan 2026 05:52:39 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:01 +0000
Subject: [PATCH v2 1/8] coresight: Fix memory leak in
 coresight_alloc_device_name()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-1-b5a3c0441c15@arm.com>
References: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
In-Reply-To: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=2227;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wfdu7BgNyaudGo7x3olBbFwiUZzdWbnFwEbSgQIKBIE=;
 b=JXRDFl1FXfxzkOotT3Oic2XKedRywv/hZLcv6bZM4ul8omNk2C9p0Z/NWCUXlnEkMHG++1VOY
 r+oJd2CAEqMA79rFxFKwGoJNeczaTNSL96pg39ZJcnf+kIV38psAtez
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055243_910438_0763BA00 
X-CRM114-Status: GOOD (  12.37  )
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

The memory leak detector reports:

  echo clear > /sys/kernel/debug/kmemleak
  modprobe coresight_funnel
  rmmod coresight_funnel

  # Scan memory leak and report it
  echo scan > /sys/kernel/debug/kmemleak
  cat /sys/kernel/debug/kmemleak
  unreferenced object 0xffff0008020c7200 (size 64):
    comm "modprobe", pid 410, jiffies 4295333721
    hex dump (first 32 bytes):
      d8 da fe 7e 09 00 ff ff e8 2e ff 7e 09 00 ff ff  ...~.......~....
      b0 6c ff 7e 09 00 ff ff 30 83 00 7f 09 00 ff ff  .l.~....0.......
    backtrace (crc 4116a690):
      kmemleak_alloc+0xd8/0xf8
      __kmalloc_node_track_caller_noprof+0x2c8/0x6f0
      krealloc_node_align_noprof+0x13c/0x2c8
      coresight_alloc_device_name+0xe4/0x158 [coresight]
      0xffffd327ecef8394
      0xffffd327ecef85ec
      amba_probe+0x118/0x1c8
      really_probe+0xc8/0x3f0
      __driver_probe_device+0x88/0x190
      driver_probe_device+0x44/0x120
      __driver_attach+0x100/0x238
      bus_for_each_dev+0x84/0xf0
      driver_attach+0x2c/0x40
      bus_add_driver+0x128/0x258
      driver_register+0x64/0x138
      __amba_driver_register+0x2c/0x48

Change to use devm_krealloc_array() for allocation fwnode_list so that
the device model can automatically release the memory when the module
is unloaded.

Fixes: 0f5f9b6ba9e1 ("coresight: Use platform agnostic names")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c7cafff8f85e501f056e4e151e372..ed304f292b7b02e89c59053d43f88fbf663cc993 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1546,7 +1546,7 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 	if (idx < 0) {
 		/* Make space for the new entry */
 		idx = dict->nr_idx;
-		list = krealloc_array(dict->fwnode_list,
+		list = devm_krealloc_array(dev, dict->fwnode_list,
 				      idx + 1, sizeof(*dict->fwnode_list),
 				      GFP_KERNEL);
 		if (ZERO_OR_NULL_PTR(list)) {

-- 
2.34.1


