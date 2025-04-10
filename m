Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5199BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=snR33B7zczTC3bN8IdXkOLcUmwroMI60wHKgyBtLUdc=; b=ghVYAOqIcxtWZm9hQ67dmpDmIb
	dPoj/2hGtq1pnP729ZZJC2wxMYcgTi4Mh+HYS7PJIjKkt8acvaqh9o2F8W4G/d5O94X9kYh3ipprP
	NDaXqom7yb+gpXz8l9a1dLwVZy4v7gTfAxJa4/RPP5llhFmyn/B/d6hUf2+oGJAzuH9o4arD2zAPz
	Whf489cbT+qdxIYIWFLsWCSLHZAc/mJeUQxYgY6p1PK+iv8wi/BqBJuRC8d2mUr+3P85J2TUkXNdg
	bUV05nSk0ZrU5AKmWgq3ryxtWen2ppb4LlAPb/Be9AoGg5LsE5kcXTu+cHNSqx9m9Jx6IcuDtEAF1
	YroIi7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mXy-00000009bdV-3hRU;
	Thu, 10 Apr 2025 07:42:02 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lzl-00000009TQV-3ZDu;
	Thu, 10 Apr 2025 07:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268802; x=1775804802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BwgGI6MZYv2vNydtUJb8sY2UgwkVT1/xfezAVPOvL2k=;
  b=MYI96k1BYD+dYPrZGkWZa9LP0bqhPlDJVLQCXOAYIhzFGVmRf+VlMCbw
   ppzdU+dFAAufhhCHuLlwDi40R6GVlpAYmgw3iXKSaQnERhIFaftzWP7JG
   TDqjR2vN/tJJWdp4zTcJjvERn3jqJj1VxOKfC7zLX85HUgfSTrreojJJR
   upjcS1SUSy8nVVwmC/I+va9cQKMOfjQCT+pbClLIwirQIOahl1H4lvxWX
   afnwfExm1yhTG5M8NGIk9HcH/FhaXHPII66SHszGQfsZd6DtI5wjnVn1t
   Okx/qJYF8ySEc721l5ZsLRmXXRPjfQg7mYczT4eGVFtinMMjDaIO7sBLQ
   A==;
X-CSE-ConnectionGUID: i0HQSAwZQQG5fvCihvcM8g==
X-CSE-MsgGUID: qC++cvxFRuGdI7gZt0vAnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484806"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:40 -0700
X-CSE-ConnectionGUID: dc0X+vL2S5ioxsxxRhI0SA==
X-CSE-MsgGUID: 4vsCeVDXRH+kGFuW1sc24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791503"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A9DBE11FA2C;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQT3-20;
	Thu, 10 Apr 2025 10:06:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] Use a local device pointer for hwrng drivers instead of casting constantly
Date: Thu, 10 Apr 2025 10:06:20 +0300
Message-Id: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000642_103253_745B451D 
X-CRM114-Status: UNSURE (   7.20  )
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

Hi folks,

Clean up random number reading by adding a local shorthand variable for a
struct device pointer used on multiple Runtime PM functions. The changes
are very similar in all three drivers.

Sakari Ailus (3):
  hwrng: atmel - Add a local variable for struct device pointer
  hwrng: mtk - Add a local variable for struct device pointer
  hwrng: npcm - Add a local variable for struct device pointer

 drivers/char/hw_random/atmel-rng.c | 9 +++++----
 drivers/char/hw_random/mtk-rng.c   | 7 ++++---
 drivers/char/hw_random/npcm-rng.c  | 7 ++++---
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.39.5


