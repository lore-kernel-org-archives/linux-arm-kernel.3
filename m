Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60438C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=; b=hz2HPyTqwtjNN33wvcCOSQCBWO
	ZyB1EsFKBLzriQ4NZolEMYUhxJ5yfMi85LvtUBHomKrPwnWaM8oceu0yxy64T3KDZv83KC7LeUEvq
	0st3kWcaetPWxpugEoZXbsY0J+qQsz17abVWR9OwAp9Fwm54ahH9QHtPkN/Xjss3ZSZuCPR95zPsL
	zUkVTvNgR/FhnEiQxXEEeEXDDBTaDBLD1Z58+IzfjNDgrRBWzOlv9WUg2R18UA/sHuR3hvB4v0uJY
	NypWnrU2YWCxpQRdYkzNJqmUnLFa6I/QtX07SfzTqcZ6KfgFdkJBJzQh9OcNfwAs9+MyhgUIo8+AG
	MTt90skA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOt-0000000DKG3-1TvN;
	Fri, 21 Aug 2026 12:31:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOd-0000000DK61-0pG4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d530328efbso8495755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315454; x=1787920254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=;
        b=KIxlz8fS/qQmKkwoqlU9LdBlSQLtxhhPs+VuHkiTSluep4NR5llM6LkhJoNt2IqC6Y
         +auTXpaZKDg5wEEBipbiRqlQ8phHmflqGujwVAIaOGBUYP9e4ZrKCyiazkp1Q5MpHETB
         H6MxQ+clFV7QZSFx79OwKE/rJ9SG4pVNj4KyJxTx8msjhdb6TFkSZLhpWIgTxtxeOily
         s777eaeuReN5rCT6wRTTlDwkN70wLdBBMWh/QyvKZ1iYhirPZTIe9HlddJwZP22vj0Kf
         1bS2+2L+5sfsCp1Yfu69KyT9z+oQDlkN1BP2gJcdV1MKmuJSlI0dXvtvT5eZ5HZSPaRT
         kc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315454; x=1787920254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=;
        b=np0EBdwxqEXkU0PMSqZmCszyUELk7m1j9SZipReIVBiCM3YVxxLNGzkTBBMT4jO+YW
         0KviqbEXF+bDoKNfU34g83jFEW8K7NLKTX3D1k1euk6A+3Qu80no2zpGSTjTVSpBquxI
         dzfJhZN4++nxKDDZ0cOKX8+px2Tw6GgkM3wz8+VctdnKJnU8ajGSd76l8uPU/hCp9mVC
         ARJGrf6wrcQXUi+PSCOUBnxdCFpGd738LSJPlwZX+hJTuW0qd9HT5nQRxsRM9O/sbnyF
         HQw7ZQbuUgiSZ1Ykcf00tmB9gFaZhAuetywlxk6gxefVKcxPYm6GKiaSRzsf93yvVFpv
         QZNg==
X-Forwarded-Encrypted: i=1; AHgh+RqFzMh6/ISVoXLQCaupU5m9rpywLp7dqPDNzR902AI0EitHkjLLdAMJ4wSo5804fSNpQJNi1TLLIsLSkU1BipN/@lists.infradead.org
X-Gm-Message-State: AFuF++krt8sioIQLN3FAvBg1ZLZmLsNxBBEHl6SX7cmoAUjdkRIsPwrp
	RO4Pg3I9lJOhAjZSN/ojSiv0aa92yVO38Bywob+TBPhlbWVsEcGTMqcbc5qDmQ==
X-Gm-Gg: AR+sD10LNgxKJvYY2f88ISmQVDuS8zMfikRlnPYx2zyp1RS+P7lFv6z753c7+vb9kt7
	nTa/lDRiDuvowxHi5LHWSZa+iDv8HZfT+h/RCqGaP/RerpNVlQxPm2A0mBXHn4sPy7gXFx7crnr
	N8Ybfq+eQCqiUtwRdZtxNVJl04n//Lgy1Qjtm7y8aUUF/oV3yYbMhLeUwXmaaGe4MeOWiSO0qhA
	aB9wxDpSEH63OtRx5BJhEoXuzwIZ4ZSIpPLAfHVt4rsCc6cR1CBTY0VQVha/Uo5s1Y7RTP1DF0I
	2xXt9GbApK0uxbFcfHNrMGy6MO+4GqvPcdwGrq0TNQFscpquiUAQ3kx6UL1pOXhvFkhqr4KIgXR
	15RxD0XO7DEuVBfVoiWRYvmFaF4XJIh7jYqfbYuFD7hIdCEYlyq74fIrZ3hNsHqjDmpgmGMTOIL
	DQ/TqIieDL2JGP5qamSAT/Uefmk7tgBRyvqaroIEvUe7hWWm3NpvL004A2kGwar+G1Tl4CkXF1g
	36obAgwa+1YHocINqD0W31ANrbyuJ9kx0juY3InfNlpdeKTsPVDph7qnzfi8UxWmhMY6+d4iFdq
	eSHY
X-Received: by 2002:a17:903:3c6c:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d64adc5f3emr120518305ad.5.1787315454282;
        Fri, 21 Aug 2026 05:30:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:53 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 21 Aug 2026 19:30:21 +0700
Message-ID: <20260821123021.41390-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053055_528832_BC33244B 
X-CRM114-Status: GOOD (  11.45  )
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
index d6b0174e2655..8cc8eb8022b5 100644
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


