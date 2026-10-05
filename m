Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4EECA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leelaKplSlz0zBQy959ImAMYPwrGQGI/LdumbuDxIKU=; b=EiApKfYkUydpqIBiqjm8BU5HHC
	WiFc37wZQeEiayZjb+KlKti24CTgqGXBak4Ns8Oi1h9PCtL6qtCV6vIyE0ekSNxooKzMi2pn4otpL
	bMoF6FmbRlBQ7q00yN/0Yzbq7EMYbWxUlehUsZB+aLVvaBoo+tYvPM2lD2vB5Z6Hy5kbe94Npf3rN
	3YFaPDjdgkY6eJa5GhvTnwEEQfNaiLfqLpvfPGtrv4c19E3wcK5yEcjL6zSGHPgKDYVHzLnTFfxVk
	cy0hZ1y0SwFVM1YSryuNmMNpdaGcgjmmpNwgJnY1qD2hBAJwpc5NFgQrxwoT1svV/PxIxlRYzKrUa
	IeyyMtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgU3-0000000GHIv-1osh;
	Mon, 05 Oct 2026 11:03:51 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgU1-0000000GHEZ-0gEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:50 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso745095a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198228; x=1791803028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leelaKplSlz0zBQy959ImAMYPwrGQGI/LdumbuDxIKU=;
        b=Xi+HyHo7V0fdQyhPg02qPx8XMahpvhTS3doa5rn4EJMVjTEPHlgZccHbFmdq9sDzzT
         vFqhtV69fLD2SC1oS5rb+ggEvYKoFQfQOI+gOopcZrtWKGWMzciofrUblWaCzcFdgk//
         iaP1Mgc/hCGHkVUv8ZvW6Iwo6DcXPRJukqEnqvp2YhB/CWqsQEjz11zG4x38cW9ENmmr
         cM6tdaJn9gkuT80/bhWc92uBJU1QWPm9DNe16Ww0Hw2u5q7NSr5AUr3Fcfn7PM45OP6U
         QAsde+COg7kOPdwE/9AxRn4LwG4cBBFhidSgK/7ZTh2yMrjX9xt3nFPp7BB72HoZNxX6
         qqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198228; x=1791803028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leelaKplSlz0zBQy959ImAMYPwrGQGI/LdumbuDxIKU=;
        b=DjiQtk8mqFb/xJ9JE6s11B2VauGXbiOT9ggzDRnXwEVDKpK5IfiHxrJhFAkopmIYGn
         1zaaFn8tR/esUDthBpK9QO0j7R/8MF0Su7rL6vp9Oz+y0WLma2TXJPINFEb5/m50vIAI
         fOEUzkO7hRYZyUo5mUOKLyb2tLls7RMzVhfIGPt4oZardQAOqez1qNVr6EEumjkRxRdU
         s/4SaYdYOHWM+XdCOJRCgjtoOeCDfQpbBwTf8PwHdFtYNS7pRmIthm4gR2R83KdLnTUD
         SQT8hGd6spG1BLT4NbYe7JkplreAWM30yRNQPsStb5zV0PcxqcbNSWjy0KU12l6vCnNC
         ZnjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmu+fwuiKzV2eB9vzYUHre8fd6RDcr+VubHR+js/LRjiqvRGi/Dp7cUzJpoDLa96x1fS3Enz1rCBLV6pR5RyoC@lists.infradead.org
X-Gm-Message-State: AFq9FYIdWFdpZIBBc+ZblhY6A1aNASnGqJJiUk9JyAD/rW4og4rKTMec
	PDlA/rauWr3QfVpppLQKvH0XJgA6MC9L6X+dffRwy6ECHj7YMrPIfMdr
X-Gm-Gg: AYBFou0w+w5z01Mg4L8cQsIjeqPZoA15aRJS9h1uvo7CdBo+QJF93TbN6DuuWo39r0l
	+gJssfvRyufRP0StJjAPT4/HmToaah8+KiqlyJbQUut8l+RktfAgHPwJ4BpYHlfkYHFEIkFHqvE
	qWSs8PelgpbaxgcwVR2HqzY9VCqCuyHGuSDf7ukRs2icvBebD01RuT8lXtp0v5W9BdNLDSRUph6
	y/M7rqPBd6O6cwFLfTNqnP+AI3Zi35jfqV7C23XUloPVmracE3cvUeHKWd0UVPJU99u/O5KP5k+
	N3djc62oZrycPnLi8s5kmSbnQYYX2TopCmqBzK8D/hN8EqAOp46zzIfCoQWEkWVaIp22rrNAYcM
	vo6mfvo7m+3nhed2RofpQw5Mch77jc/85uQyxfeDosZocOzen8uaF3EzKSNxV+z5kR7uM32cv3N
	D4xHJYfm7t9rbFF8nLUEjQJuuA9sDtSnFfKUR0qyNsgXKp5hFF0KMlcl6r6IgU99Rdd98MS6DA2
	QUjc8r3m3f7C3Aao9vsgWWAZff81LUXiBlFl6bRng7rIGzZhgRfcr9W8QhqQjxYlbkrG/FJiXK/
	BN3ve49s+FLrNA==
X-Received: by 2002:a17:90b:2b4b:b0:39e:4546:fb13 with SMTP id 98e67ed59e1d1-3a6cec143cbmr8426958a91.19.1791198228110;
        Mon, 05 Oct 2026 04:03:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/14] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Mon,  5 Oct 2026 18:02:50 +0700
Message-ID: <20261005110257.50145-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040349_233869_DCC5D56F 
X-CRM114-Status: GOOD (  13.32  )
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 02736949ae6a..bb357cc674cb 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2958,18 +2958,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0


