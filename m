Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7E3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIP9wHwt0Gj4u3KzxmU501MJprDFFyxmCGVXsa0hrFE=; b=rCpYCsSGEx9Vpx6y9qYLQ/On56
	uOY3vXzG0g5pvhZkaNJOe4JaybVJEL9/XPlcS3JLwJBcxBC/OHmG/9Al6l4PEpE9/1Dxd2AF4QOG8
	0+sE3uEPJDinbE6Z1G1mpGcm+pNC+e04fqLA3MCn6Qj8cMdIIz60Ymt7u+LuK5DU83xW/3rEwPZx8
	PODqOWXYVV2eFA3eYmKT3HMu4edyTY38EaAiNFfdk3kYmIKCTffaypFxaqsD8yXo7KZskXJy369bH
	QfJTLYYoohOTArwNJDl3AgTXtptUpL8rvx0WlfrMAnk29nN6C/tl+yx73KCtIzAzBB+7EloV51nYZ
	Y7v3EuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgsD-00000003gIc-11Fs;
	Wed, 05 Feb 2025 14:59:29 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgqp-00000003g62-1tRl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767483; x=1770303483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3EDPzq+QRjtF8ntIcn0E9PwMJhWnjlNrTN7MIeR80jo=;
  b=DVIpvhbdr3MW7PfK2OQac0w/T/qBI2z2AjBkXlDONxLx9hw7Dj+GVUnv
   2ytElc0fTiBJuxuUF45ubQ2xkLaSYqSXfl+Ci2wn7V/K50lRndDbkRgeB
   7wBQgwzqa1US1izKjcZrhnazl8S8XKcaT+n+4kXYAB3Fh4qIf5cqVFpW2
   s5IF1uuSyyYGNnGx3ddlyYySr7ja/LCf6febK4xgL4Cv1+Tp4jmu+ff1y
   AVLbh7xvZqojkjRoU5Oe+mUPzPqoTYUkzLGFxxausL6ZvDd0YSRNhSG/u
   IGpmEdgfsZdvHyajPzWsSgjjzOUCCvxoBQ4kueOgVkWqjevOEf6MRngvx
   A==;
X-CSE-ConnectionGUID: UEgTHoxwSu6TOl9TqFR2DQ==
X-CSE-MsgGUID: /kp42QWZRsS8zkC4Lvfy3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39599700"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39599700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:03 -0800
X-CSE-ConnectionGUID: LMxD6/3vSq6Xcb2+iczw9g==
X-CSE-MsgGUID: TDg2oATYSdCw/H5cHCpDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115968400"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 06:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B93DE13E; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Frank Li <Frank.Li@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
Date: Wed,  5 Feb 2025 16:57:10 +0200
Message-ID: <20250205145757.889247-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
References: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_065803_497312_66F41A52 
X-CRM114-Status: UNSURE (   9.87  )
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

Reduce use of internal __dma_request_channel() function in public
dmaengine.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 83cbf7197a76..a360e0330436 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1646,7 +1646,7 @@ static inline struct dma_chan
 	if (!fn || !fn_param)
 		return NULL;
 
-	return __dma_request_channel(&mask, fn, fn_param, NULL);
+	return dma_request_channel(mask, fn, fn_param);
 }
 
 static inline char *
-- 
2.43.0.rc1.1336.g36b5255a03ac


