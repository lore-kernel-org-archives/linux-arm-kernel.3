Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C683C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlVKoMlW5skUFdPg1+G6eEcVrecAIeUMd4PF7++IZjo=; b=rk1vRXIk4mWvqlaPt/6nwKNIGP
	i/2mGaCoFcwqif1gPQX1ozbVhb5V7qYL27I8Cg1s2pocXrlQVxpKcQflcs9Jku4kRfvJu3sxlpi4U
	TKpW6tHa/74cNIPGof6hnD3njS+h8lc+7/TMr3KJ9dWIviTrhSJii0JmOKoTMHf+rOplsKiux9cZ2
	xPYlS0O0Zpq6XgNrfqp6A8ZwKN9fehBkIEgyPwCVp6d+oydLbI2QwQopKHx3vquCx1673FpE1UCUS
	8cmJUFnaNUli6MmxcFHKqkX7HewSWbmu+aclvdhp+sfiLf0Oz3FNF7bAlOtQuo9KlNRvIvAH7ovbM
	6AVThobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbcO-0000000DhRE-2sxO;
	Fri, 04 Jul 2025 08:18:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFX-0000000Dd3F-0HM1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qlVKoMlW5skUFdPg1+G6eEcVrecAIeUMd4PF7++IZjo=; b=F+i6QZn9lrwSHnXRmM0u2GoACx
	BJltY4LxCUAPkYXMMYegPcMxg1JrOduLCW3jiIHSPpmo1TbqgZZafXmmIFQ1EclDyD/3XwMZUMtBF
	CeQP2LiYp/9xiT0WXs6L9gAIhH7oL/aHTi6GKqtSatRrQfYm2kUY40k8gzGfkaDkDcBQ2cdkqZxur
	VVGHuAE++Nf6L1TovPBDIH9CbtlJxckeI+aSVSGhAYY6jK14lRi4LlI2F3bJM2bmCawRRMxCTVzZi
	fQvjTv+GFTt2qHnO2XszSH9srVza4CinPvfNdFM0/TtryUnRmP2giPgthWfV6wWpN8ypjLFFXuQtw
	O2P570ig==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFT-00000007pdW-1bWW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615659; x=1783151659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Hx4Vms6Gxu/8rFa2Up0txUhrMnFHymKtoeJok1L+Oo=;
  b=dt7Fj1GidQGGJ8r332Z7E1B52G5FO2kIZZLqWKG4EMNAyspWwSILJUo5
   BlPDWGufaD8UfEtJgkyE5eiNqkLSXloopUvcrR24PNGij992zOg5ct4mT
   /Q2GPMhWFx17GkhTjpCt9YYd+LeJ80V4HG6JrdQkgkEWc5WEusyqumT7I
   9TNBz2lEZy3sX7rc2eCCiVQh49VJktFMmRUE1HyGHm7e45wLNqVdjVi9c
   HbdpODsmxQ+TLfX07iuM94H4/tbpFxiOUhdX5FTmFZVDNGjBO/AxNo2To
   5B7E+c1MKq7TuYhz0wgXR5ZFD0nzC0JtAaGxVqZ+vfh8+YKAmkvcnbO0a
   A==;
X-CSE-ConnectionGUID: ksjXG3xUTKy8YoRjRZPtJA==
X-CSE-MsgGUID: rWiZMZrRTX2jcZrQV/bQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494576"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:18 -0700
X-CSE-ConnectionGUID: 2mqtTLXUTq+bpmvXXnf6rQ==
X-CSE-MsgGUID: FVacNX9iRDuVwQJgPpJ6DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924242"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:16 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id B059A4445A;
	Fri,  4 Jul 2025 10:54:14 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/80] stm class: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:14 +0300
Message-Id: <20250704075414.3218411-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085419_973696_FEFF286E 
X-CRM114-Status: GOOD (  10.81  )
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

 drivers/hwtracing/stm/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index cdba4e875b28..f75d06e3787a 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -659,7 +659,6 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 
 	count = stm_write(stm, &stmf->output, 0, kbuf, count, NULL);
 
-	pm_runtime_mark_last_busy(&stm->dev);
 	pm_runtime_put_autosuspend(&stm->dev);
 	kfree(kbuf);
 
@@ -679,7 +678,6 @@ static void stm_mmap_close(struct vm_area_struct *vma)
 	struct stm_file *stmf = vma->vm_file->private_data;
 	struct stm_device *stm = stmf->stm;
 
-	pm_runtime_mark_last_busy(&stm->dev);
 	pm_runtime_put_autosuspend(&stm->dev);
 }
 
@@ -1082,7 +1080,6 @@ static int __stm_source_link_drop(struct stm_source_device *src,
 
 	stm_output_free(link, &src->output);
 	list_del_init(&src->link_entry);
-	pm_runtime_mark_last_busy(&link->dev);
 	pm_runtime_put_autosuspend(&link->dev);
 	/* matches stm_find_device() from stm_source_link_store() */
 	stm_put_device(link);
-- 
2.39.5


