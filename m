Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E440CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YzQJxvwmMhzu3B5HYjuBhrWROduS4cTFh66p66QLIlw=; b=RgdKZ9il+E662iMPn5M+5CdVAy
	HOO++LSuut3pMpKPYo3YzOBKLne9Uz6ueQUKHalub7A08hwJlb5ppApFYOx+dp0pia+hL5AXhlo5d
	C+FlwYwkYQ8CvazCXX0AWrJcHEMtSPcrRZ/GS0CCpGXeOfHJVHKrWFtkR8fV8E0mpz3UFKxhe98h2
	RmAdVj6U4Iwe9qAPzcMlY5zBLGqQelIFT4my1RQ2Phe8nryoJ8LpHX6R12CvdIWTT5FLWiiWtHxkz
	w30V24kSninGQbC7M8L5qoBidOJd/3CUrZodm4B6jLN5sZagXkMpuxk9XdYm3QHaw4Crpbw2djzzH
	kkoxXFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLwY-0000000DqHf-17tT;
	Mon, 27 Oct 2025 12:03:22 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLwW-0000000DqH4-1yJK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566600; x=1793102600;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=69y5JxPNsQzf5MPEoD1ZYI9e/AfXfjV8qPp6QO8ll0w=;
  b=N2L5SKJOkgXAaQkNujuA6/5FFVKfYH1rPPI/j8Fesz7vDamgNpDlnGt/
   w+4TXyiwQgHEoiAjSk7eOW+MwVJk5SLCxF+n0+3qiWg6/5SdpfJ4qBQak
   ygyxZWzKYkYkz56EoLypKxQvkegpb+Up9In67Hs5rBhavMTUfytED7r8G
   1IR1qFzAVTmayJ4IKJ+tIsBBlEt6WUG9iLzLSAyuwUltL5e8UVJPgZZuK
   kMU07rPhFBfRTn/H0MnzDob1wScOD965DIhq5AeQnOCUFFATJiWJLOgZd
   uodoYyYKdIuDt9n1LPoXzLN67VaO32KtpfQrS9IW8Tq5tGeXIUL2WMrdV
   A==;
X-CSE-ConnectionGUID: DFTsDJQMTbmyzlMvbqbXGA==
X-CSE-MsgGUID: 7N4182H4RSW9sDg5pNv7TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63531628"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63531628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:03:19 -0700
X-CSE-ConnectionGUID: AL7lAoY0QyG3O64gvxCm1g==
X-CSE-MsgGUID: pqpeOZW/Sh2F9W1BXgeqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184252514"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:03:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6330121E63;
	Mon, 27 Oct 2025 14:03:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLwQ-00000001dl2-3Uo2;
	Mon, 27 Oct 2025 14:03:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/1] stm class: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 14:03:14 +0200
Message-ID: <20251027120314.391148-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_050320_544959_6B7C5284 
X-CRM114-Status: UNSURE (   8.11  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
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
2.47.3


