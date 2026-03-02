Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF16EA4E21
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xlcJrFChDIv95SjHOfVdEffnTClZglQAoeyjDtZkUy4=; b=m2UUgyITjx+/PA0KD0/RggQWAR
	C2qWWsnBI8dY8ksfxs/DZG1TAyBBF8gXG89hSmZFI8rXvWISe9SMirjxVOwKuNYyqO3gr0NxomjL8
	3XMBGU7psqSwSNHY/Urpg9Jx0rQXq98dTY5qf0vR7vzG+oIXUAiwddjePB9z5uwOZZWhKlUZ5VkvG
	iwQCCQdQ+R5TfbYaPHTD8mDAsoXK0TtHUlR4X+8tVVwu5q0AS9Bg0UrurxXZTV96fPga9/v+1/cDB
	3YeKP0damS0h3svUU4nW9mKG7Nwkk/c4rL/zgeTVH5GnI6Lj2/MeMAEt4KruPdvcdPTH7jql12D25
	MNI0TSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5A6-0000000DMHB-18pq;
	Mon, 02 Mar 2026 15:26:22 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5A2-0000000DMGe-0ohT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772465178; x=1804001178;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WzWOK/weu/eua8sM2vFaS4HQZPDtBCH3vWv4YoQlErw=;
  b=XfRBH6ftsya1E05mMFxYzsukwDr7iFUZtxj5OqqiFPrBD/a8kKeQr0L8
   f3G7oQZIrejEzx2sKI88pK4WWvi/OR+5jVGK8l+5BSSKYNQDoqjBBCsmt
   /+iE7+6CqEveXleA30/hV3mfL/ur/1ailw/FUkX/omJlm7eJ7u1cPs+x5
   XuMmwte9SpQmfTV4sXZr8GRwhCSx0FAZVkuXM7iozPRdH6ZTmH1xBcdBu
   K5ot/ufI7fHMvJ3Eykl8CuMFbfzAQx3/N3jvEP9Z5tnb3nFypv2bgnwiv
   HcnYA2+UiLI4+r2Cwz7IZvqFSc9dIwwWlwxvzHOLKjVKOBG+qdSsO39n0
   g==;
X-CSE-ConnectionGUID: XhIBe7fhRXShCj4WCPqOYw==
X-CSE-MsgGUID: FmvfAGOPTw631Gmsk/S/dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73660168"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73660168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:26:16 -0800
X-CSE-ConnectionGUID: FknM8oHgTpeOXx//eIUwAQ==
X-CSE-MsgGUID: Z8sn/fjkSUeb9NrwbUp0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="222187198"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2026 07:26:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1000798; Mon, 02 Mar 2026 16:26:13 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Date: Mon,  2 Mar 2026 16:26:05 +0100
Message-ID: <20260302152610.2498426-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_072618_301649_76C03AF9 
X-CRM114-Status: GOOD (  12.00  )
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

No need to open code the devm_gpiod_get_optional() wrapper.
Instead of checking for a certain error code, check for NULL.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: added tag (Peng), rebased on top of latest ASoC tree

 sound/arm/pxa2xx-ac97-lib.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 1e114dbcf93c..47889f6003c1 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -330,13 +330,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 
 	if (dev->dev.of_node) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
+		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset", GPIOD_OUT_HIGH);
 		ret = PTR_ERR(rst_gpio);
-		if (ret == -ENOENT)
-			reset_gpio = -1;
-		else if (ret)
+		if (ret)
 			return ret;
-		reset_gpio = desc_to_gpio(rst_gpio);
+
+		reset_gpio = rst_gpio ? desc_to_gpio(rst_gpio) : -1;
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
-- 
2.50.1


