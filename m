Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC6C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5b1AZnkxJ822WnGI1cawa71JzbmEizJKLCI/py1PnE=; b=465rTswNaTFjnP5OHB741zAlYz
	1tpy3X/fbu+rH2BhPufWG28LZ389+X4sBhdG2WyYdTF7G1dyJ46Y3npwKe7jWp1TRLSC86Z7suqCU
	LmClSL2WpPqP6/XUwqeCMFYWsJTAOcxfh9gqeFamM/iuf5UCosrKpe8J0tJlikuU6Vx7lez6+dT6D
	cUdlJAlU2flWZN1tXAqVafQ7Np4XcRjUqpjn28jWEMQ0s+Pq07Z4HJNgwDXcSEJaFjv2Ck07jwJXi
	Ql4Vyf13AV1TeNU+QwyuaVG995f2+PV6T3ic89diulVkgWZqXejt6IMfbrsKRSiqEq6/EenBDLTnS
	07VW4lzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc1s-0000000DmTH-41En;
	Fri, 04 Jul 2025 08:44:20 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbGL-0000000DdGu-3aJh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615714; x=1783151714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EoYEpuIhjevRLmOMCR7f7TcajIGyH0zpZLQ+nin4C+I=;
  b=aN1lQ4+3bqVOJIuwIF2bG3waH/48tc9BniekHkod4BL4NrVbLRck3Dof
   gB8c1dc9qUWWN7p0jPU9Zr7M5Lq/Q7JxVsEjTVLu+B7eJAmqqhvCS9VL1
   xQVU+Y9wgedmPD4MCQ6cxny74N2OtNQRp4vXSNZVGKSPlCoKwAy+rOmsw
   vq8h7LrajBPOaGjCuj5GAzPNZvsIqqsjeNCdXxzmUNg/+8Fqy6w4yjkpX
   A1gYxXkvJHroe9370dKOwcYO+BBuA6P8Sl4sc/NC6M/g306rOksfKPF2y
   do7fosGzlbwNiPTRigTUDbfPjV56a8xrNo3aYGlRA1zrELumK/5zCks6b
   g==;
X-CSE-ConnectionGUID: 70z2z9u4QWy6R6rT7LRlzw==
X-CSE-MsgGUID: USiq4MjjSvaLi0fXTtG4AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194374"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194374"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:05 -0700
X-CSE-ConnectionGUID: vgQ8PaqkSnqJO8aISIvvhg==
X-CSE-MsgGUID: vTwceVOmQzGj0D8RXANUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616716"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:03 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id EDE1344BAC;
	Fri,  4 Jul 2025 10:55:00 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 76/80] soc: apple: mailbox: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:55:00 +0300
Message-Id: <20250704075500.3223019-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005513_961756_3060B2C4 
X-CRM114-Status: GOOD (  10.62  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/soc/apple/mailbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
index 49a0955e82d6..b56600229a7d 100644
--- a/drivers/soc/apple/mailbox.c
+++ b/drivers/soc/apple/mailbox.c
@@ -275,7 +275,6 @@ void apple_mbox_stop(struct apple_mbox *mbox)
 
 	mbox->active = false;
 	disable_irq(mbox->irq_recv_not_empty);
-	pm_runtime_mark_last_busy(mbox->dev);
 	pm_runtime_put_autosuspend(mbox->dev);
 }
 EXPORT_SYMBOL(apple_mbox_stop);
-- 
2.39.5


