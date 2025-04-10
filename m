Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E63FC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1aD3H5SmNlfRhw7KUYgaAyaJqkhSNgnVmYp8u5QpgpQ=; b=BMtBlx99LVL3kptVTn1eT1leSZ
	RACHzBqguVLdg8aV6YyE0LkfGW810IioHuIfDls/VyU3A05oB+KocVXlBqXQg4nYrJqikTJBl1Agl
	kAqjc4MWB9Spy9jzaXDL9Zd+luWQOa6a2G/N2QSxluf7juDsN5J2yOCvhav2qjCyL0aBJilPc1T8C
	k12cLZBI5UJQf7S/3R4Yi53x9Kgpj37gJkXzxL6TYArRjrIYyhPT0HAciYfAF/E4n7eUgThJS0S/u
	TWtoqYZKa+t+VZ8fGOlH8Q9h+yXh+MqT/txWhGjq+Gt3WTRHJk9ysLv8W9dlQw/4ar5CU+aUcR0x1
	vTjiIOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uXJ-0000000B8yH-0xUQ;
	Thu, 10 Apr 2025 16:13:53 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tk1-0000000AzqA-1qxq;
	Thu, 10 Apr 2025 15:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298577; x=1775834577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kVA5MpLBMU4IYqfLgN92o9IEr4g+jq3spidVJHcMb6o=;
  b=A7L/Jf8zyq2DTcrf/+TOMHhSNQQ3Klde43qhvF3ruYWpyeFucsev5IDc
   Xd4XCvbFLMhAAH0Saw2zA1rR0K8Xfl17Z2I5JFVWBPBU343JcBl1sOiHK
   RZaJxE9xmLT8+GTf3DBl8hvil21wI0icQ2b6RN3BKF8TVOu3Cd4GWt10r
   5vWBvMMePRpu8/LkgUrBLNlJpdQwLUWbC8EGT2xrqgJAU9Et55Kj/lHDl
   iQV50HZE0dnGeXzZQx0TfF+CkU092kMrXph9nVNJbsg7BpTtcbM7fFm4h
   YoGlW/0AMiVG8z9Aq5EBYTVDTqfC6N1ctK2+/uaU1vkmA8v+YQJV6RgWQ
   A==;
X-CSE-ConnectionGUID: RD9wf2rQT1WA9ydKnUstjA==
X-CSE-MsgGUID: ybvndWx4Sdqy6iYaAjd3zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716264"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716264"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:55 -0700
X-CSE-ConnectionGUID: 3j6bmGJiRKOZWNowD2NzRA==
X-CSE-MsgGUID: ew/RyzT9RNy/1OP0CZJiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108194"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DEA3A11F74E;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HObw-2j;
	Thu, 10 Apr 2025 18:22:49 +0300
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
Subject: [PATCH v2 0/3] Use a local device pointer for hwrng drivers instead of casting constantly
Date: Thu, 10 Apr 2025 18:22:36 +0300
Message-Id: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082257_499335_37225978 
X-CRM114-Status: UNSURE (   7.97  )
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

Clean up random number reading by storing struct device pointer to device
context struct. The changes are very similar in all three drivers.

since v2:

- Add a struct device pointer field to device context structs, don't use
  struct hwrgn priv field for the purpose anymore.

Sakari Ailus (3):
  hwrng: atmel - Add struct device pointer to device context struct
  hwrng: mtk - Add struct device pointer to device context struct
  hwrng: npcm - Add struct device pointer to device context struct

 drivers/char/hw_random/atmel-rng.c | 11 ++++++-----
 drivers/char/hw_random/mtk-rng.c   |  9 +++++----
 drivers/char/hw_random/npcm-rng.c  |  9 +++++----
 3 files changed, 16 insertions(+), 13 deletions(-)

-- 
2.39.5


