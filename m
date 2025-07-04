Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2FEC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLkgydU9Ol7wHeLFmDDKA49nT9P1mEhlC+2E4mimj/M=; b=o0k8bMqGQDe9hYVc5lakhrUdhx
	xGInrSi2oTJmk2OxB/j92kBxhlCEXK0ltiOA/MKVkQzZfvYm7E7+1a/MMs5SXWiL7Kpb3Ng+DhS7j
	qVI1oT6KWtp8S/lh3+9Cepcj9WeqJmIBn0LPlUgO4gsC01bpBh33iwVbYPX5kic3ZSexnbbuoXR7f
	zH5VSPRSvtqOaFOrxES1Key7GDlGecfVKq4JZfIOmJD8vPm5AOSqNIsnXGAigkS0kAcrZugp86zy/
	R3vIydJvIv9xHfrvha7h/FE52MX/ESr254o2EKrM56/0vb5w2acm0E3RaZcgG1IbHDl6CySOyMkEo
	sVulvSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbuw-0000000Dl8h-2SCQ;
	Fri, 04 Jul 2025 08:37:10 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbGH-0000000DdGu-1IQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615710; x=1783151710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eVLkIeLgEFxD0O6073m8DnwCRdtHe+L5RdLUWpA3UoM=;
  b=l9QF1w+fhZJtMNpbrYOKLUNb1VEn1avrZoil81qCp0J4Qt7iNDqTPSPH
   +6gkNRuw4rOfeH3hcwHa6QdKPGJD+L7JzO7d35ecFF+QftQprzhKUW6Vg
   crLPHPJna0Hyk4Ba6efEb8a9NPUr/4e5+CI5g8kd4sRmhStLxLIG58GGX
   lHPMo6x82nuJJplUnIORhZmOZP/PzVmL9UCJk8VTrXkEzZG8qCQ3DWX4R
   SiuMLoiPHdMSIIqgBelGWRIrdREVV2lGCLF6cEZu9Qz5JKXHeEnPcg4Om
   NryVEO3LCAhia83aHULFKS5uw+LjvYpYCddsXcKf7Vun2+5qJA2Ro86vD
   w==;
X-CSE-ConnectionGUID: VtBSCHDSRFGa3LITVaX/jg==
X-CSE-MsgGUID: VGHMrh4sQD6L/dtvPyM8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194275"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:03 -0700
X-CSE-ConnectionGUID: e4q5kn2ZSyCHwss7ykn6BA==
X-CSE-MsgGUID: XMYFixcGQDireEw7dxOfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616682"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:57 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id D98F744419;
	Fri,  4 Jul 2025 10:54:55 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 70/80] ASoC: atmel: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:55 +0300
Message-Id: <20250704075455.3222541-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005509_393924_33CB7CDD 
X-CRM114-Status: GOOD (  10.91  )
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

 sound/soc/atmel/mchp-spdifrx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index fb820609c043..521bee4998f8 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -577,7 +577,6 @@ static int mchp_spdifrx_cs_get(struct mchp_spdifrx_dev *dev,
 	       sizeof(ch_stat->data));
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -660,7 +659,6 @@ static int mchp_spdifrx_subcode_ch_get(struct mchp_spdifrx_dev *dev,
 	       sizeof(user_data->data));
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -726,7 +724,6 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 
 	uvalue->value.integer.value[0] = ctrl->ulock;
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -762,7 +759,6 @@ static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
 		ctrl->badf = 0;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -811,7 +807,6 @@ static int mchp_spdifrx_signal_get(struct snd_kcontrol *kcontrol,
 		regmap_read(dev->regmap, SPDIFRX_RSR, &val);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 unlock:
@@ -875,7 +870,6 @@ static int mchp_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
 	ucontrol->value.integer.value[0] = rate / (32 * SPDIFRX_RSR_IFS(val));
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
-- 
2.39.5


