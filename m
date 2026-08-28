Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B93C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=; b=wMu+UlIzjXLBfl4ATtFO8v2e9X
	XNOA6B5r13ago+S+v6UXWuFA5DXfv72wYi+4/VUsyLQuBOAX42DEXsG8xH+bYhB+OqP9aTdLPSCHR
	LNqDalreiIJ0ITxDzP8xu+LXxGXKDDu4AGaP4LQiuKOhg3SFQtcOODuCC2sVoVd1BspR26zRkJgdF
	FvHFzFc7mTgo5o0Er+UZWW6c64yNjk9MvvxaI2EEpJXnwb5lc7+0wpYqaQGduft470pRsMqXI+W4N
	/jEX80wsKwfyqE/1obCoosu25io4s4R0owYXRKbVfMOwVFb34vHSgmTCfKAExS+Wvmf0UKJjuHPqa
	w2R91YoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomo-000000057ml-0Bg8;
	Fri, 28 Aug 2026 05:05:54 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomk-000000057lu-1tk9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:05:52 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so411422a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893549; x=1788498349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=;
        b=Xd7/0JljPntNnW4CRH8AKZ4zq8OgRlvI7DN1JOBdm6H7xljB1IzjIlK5z81qnMqwjV
         TzPqx9vJ019xfICEUHkTf/8RGVBL+MQFvsKqZH5GlPpSLp6BCF4QpEgrsNviYPvwmMAu
         rJ0KMpizl+eg74Sxdxh+OSnfRRNyirDzDeKfUIERLXcGNVDJNxRGQ4mwCDxqNAhPwNXI
         erjGlKhhdDpSJxl8MVd/4yxrBlpDrppqkBTRCqsHmSj0qKSFlVngPyAHWmXw2g5nwxiG
         WAUQySh4UQgWissEqdQquqVIzUEJqnc/IzlHNajxtLmcUJ/iOhLxiIWJ7Yk3ShVz0sRf
         B2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893549; x=1788498349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=;
        b=s0ZRennFpEtafbwP8aorcQEkrb3aXoXvyoIhzuQlDDfWY6W2IkHd8lZU/q6YoLk6r+
         Tqle4+DA7rtF3eDihPh5ZKaObcejd4vT1wYqh0kk6qY+uINz+fVyUA3AiVkJuVuFaYR3
         fgBWUV6ctVMEhuv2+vlmA8q6G2X95urpf08X3lJNZNc0U/ribfTmCTLagVLHgbCp2YCU
         pW+WTbRaFbfcOJdGj+025YrJLlfETCJfvDYP4zofo4I/+OcFZZLv7Ie8plEDSWQ8xzmb
         1ZHiJ1JgMlyoVsvzjAuKqK0iMIPxsTGWHvBfP+/ILES3Yd4Q2/9BmolacfcXZgUc6suC
         7dxw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6GSrR7ThdY/5d/cRNhodQD8GxjtPH2jmlS11zIXP4Zj/67OfUMdZMrrUiVUlGqnSV7HJHq5Bl8oq2bNoPSEBX@lists.infradead.org
X-Gm-Message-State: AFuF++n8HYIrGdW+YwhlFfxYsgbgGgIQt4omswuXUey4AU4Ffcq7nKHt
	kZQbDM2Tx3xCW4wcceUd4sb43yrstzL2YOxgYClJNtMm5FpgH/DTV9dB
X-Gm-Gg: AR+sD13pgq9FymE13dF3kJtr8bGMcl/dtnoI9VbFXwqGVcNOaKQ+sru1ZL/8Qilpk6p
	PHzlP7ZFqvNYzLmN864ApHh1qzUw44xo9tbc0zFdSev00KY+Q69eY9qqxkzdpnOmxNTvm46edtk
	//zEdKjrVSyyfgoE/V0BZj6N+25yjbbpZA3iWO6tFpd55ysTtd4pzLxSSAsks+ADnR5+8xvQSaI
	uptGXkSPVHGxK/qaFuPo421OOgXQA4eXPn4eRLhsWR9eSJPwhK7bEZTRirJA2tIkj+UEMHpBoRO
	p36LkTND3vsGQPpPshpHHyL3yJIHaoBen2tpDrw0foBo8tK3O2iuXy4eJRDXS80n91UKAWVafeN
	3MrATkpRdotTQ8EmOLN27Q9l8M3nNkLRO1L2hGldXOCwIlAinCteX7hb2RUBCmSDQVC3gLwzrl3
	KxPhvdEkoDr3aE2KpfuCWaQA8hk51IPyO8zTr8Hx6Sf7zjgmhzlsC9ncSjyvVIVRY7DKgYeRGyl
	3csgk/TdpUxDM3gYJenulF7eAfDFd5gGeHRvZe3aEx6Z8VITmu1W/FNE5/fC6UYnPCRKRhhE0Uy
	rtbqP2L1PIoUfjA=
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr9291203a91.2.1787893549522;
        Thu, 27 Aug 2026 22:05:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Fri, 28 Aug 2026 12:05:21 +0700
Message-ID: <20260828050526.590761-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220550_494363_39C2E0AA 
X-CRM114-Status: GOOD (  10.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.

Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 95 ++++++++++++----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 +-
 2 files changed, 53 insertions(+), 50 deletions(-)

-- 
2.43.0


