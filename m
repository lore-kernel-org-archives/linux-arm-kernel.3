Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B9C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=; b=1ZGP5R9M5O68imFMrQt/W4am/H
	ynOnWsGrK7Lx3I1Fe3Jr31LjW6ujue3hhbbMta6oDufm1kLflumhBL/oixHTJsTKs/d1uUU5wyEWd
	V/jaWg4SKLQWRrkDLGF+q1BPXR6rfBBBHXG0iEgNqyXDeCKpjlbpk5Uptd7+HcuRiZFYoDqrmqQ+h
	7Cbo9ZW8Z6PX1BHaH2q/r3KLuvCEBFgiS9nmOObMXd3N5uCuCxgPJFERv5hntLTmAu2XC59rsLLqp
	yHfi0FxbBN4t5NSPK/a6tMRN6mGVccr9E3vMYQcIAny/okFT0GS9caoKsLyNVTMVjJr9tdnDPdwef
	FuRmFU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshG-00000005QZr-1fgq;
	Fri, 28 Aug 2026 09:16:26 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshB-00000005QRQ-0weU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:23 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84830c774a0so1044441b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908580; x=1788513380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=LSovlaTRWTl/41rrZcdJqi8zP9eZb1BGoS1VW23uXRHi9XFxTuipn0GpFi530Tg80O
         DU6GJkWUOUVd/gtTSg6ewd0zNrFDyZLKuIXPrS4Oqr8TLGSz0vW20rJyoIwXZeQKF7gT
         JJDtL/sqWSYz9rGVoYhmZDPhYw2I59p0Pzpu81ZvDABMBON30o9nrmU7Q1sOeOViJJJC
         k2N7oiC7Sqp1dSRq3+3PQf6x1X/yR69b0B9VIv/lxklsXmsG4tf61zyNULAfBV0RtDEV
         KLtBP3P7Bzssl6aWy1pLCeqBama8pynuaMoEtE4JzOHGOO39ACsbkm2t4u6ieNVI76F0
         5YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908580; x=1788513380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=SEb9eyAuAm4k5hfchd5lJ7D9DcUOY1JI/MZmc1Mz3j6Ph3N/pNyfl0/4amWk06eDwT
         z9pNWIVYF+9gtFHjkDnRO20lLu3U7E/AYBKqO0EQ0/jrhUT7yIKTsdRqXO+yH9/cLOzp
         K7QTzpbbYibjYyJDP1zjFRa7FIVNvojEvcA3fe/ANm81k42mnws/exjPeZoATH5R+fnP
         61+Wf8kUR1QyzcEQAx72J3VGJq3/qLFYZLD97Kfx+tdt6c30obJ0vdtaFefYwoxz8E6O
         lCMynuQGY8R1WQ+Ld2BwHrgdkxDInVqlb/fmxFT2h9dQgBA6l1vxe3r5BdHdvM4Y2La6
         azMg==
X-Forwarded-Encrypted: i=1; AHgh+RoqjR7HXL7ZU21SFeifOYNYM3TIxVap+4uPz5XdOyAYyqG+77KGO9Gsh2vtk0oKbnznW1BRbJ0rbGrdzYe1b6wb@lists.infradead.org
X-Gm-Message-State: AFuF++mwfxXfp2s7yb4f9uxXN0svevkY6f0mzLw3f+KGCcxE0HuKe772
	aZFo5H3mAuxNyta8vtp8W2s54TkRwgHBkhwwtYoyDDBM/Ffhmk+n3R5i
X-Gm-Gg: AR+sD10//7/rjQDi2OQxgsQeoNK0+v6/BrvXyqmGp5AwgCFHO0k08C5bQkBRAzlJvE+
	CEXop5oH/Makv2A3DJCMNp0H8V5Me3YgGc9Ol/RbZX2M3J5wdWskCr6tgVX3Qu3iCpnGo+0EMY8
	D4VjjC2L/bNdamSuFQyy3tr9qkE72tqTwPr/fGF/r74Q0xmtAsP2y8W7UUPtzBiU5V/LwvGiGO5
	J6XIxa0N5+sVZmTdIf1JA1vvreYTxk+GYvX1QhiNNgItwt2Woj3EQpwrwaxeFeGZZWyVjN9VVV5
	MrOheRkFy1UyGxAUIvxJ50aWL803zYIMYwVeDWMSy7ERoV+gy2RhcIlSk8E+hzfAbbHYvmo7zLB
	Rvkq6m00cPP8KHiPB7DUj0Zc8DLNXCDpKSw9DciQxby+OVCRcvhtnHMjG1L+A0kRRCMfqoVH+fS
	WR+kEKdriFarKugFqGHRXrs3rofVMITY2heofvcguVOb8BDd6LOEre5s095NcuoHEot34dckuyn
	WRC2wLhc8tk2xIuyyVdW/1dcwCrRv/hKl5JZjhg0o80Rm0eK8AX4IICO5uNXLTS6A3QZ/OMar91
	kL9G
X-Received: by 2002:a05:6a00:4109:b0:852:38ea:3fd with SMTP id d2e1a72fcca58-85629a252e3mr11093863b3a.11.1787908580220;
        Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:19 -0700 (PDT)
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
Subject: [PATCH v3 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 28 Aug 2026 16:15:29 +0700
Message-ID: <20260828091532.600047-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021621_340831_3EB0EE94 
X-CRM114-Status: GOOD (  11.55  )
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 85fe828ca5ae..6d2871254e32 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


