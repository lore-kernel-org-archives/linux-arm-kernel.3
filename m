Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2FC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=; b=4KNytyzt/iK08neGhzfHH1EpwT
	ghRKpLZ3bD62PPV3A1i+J23zJilNSMMgygPzN8ceoDnZdraSg97NBl4LKUykbF6vXFRYETBD4RQ9W
	JpuzbCQX42VUX2oRGexQKftYpPnTirw5THHpO1pBGaEp5xxsIygWtHvOWXU7Hk9segYqWSpVluOLP
	aBfySNNpkN0kORU1+Ngpzon3KVDXNbtlQnsTmMfnbStP9Wh3lEIIu8n3C3D24/jRMJJA56teu6UBJ
	6NzQw4A6CKYsI2ldw3d9e/DcScrOje/XMOfT2WohN1JHtlQ+ZXfUUh1y9iCMuVTg5hUwvTYHXgGl0
	whF+OiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMM-0000000EOf9-1q3Q;
	Thu, 10 Sep 2026 12:58:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMK-0000000EOdL-2v1i
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=; b=Y83v1U+OFxgNbb3fFypkYCBPzl
	UABKdIcncWTmpEmGfSDRwoVjzaJNkjcPmwvqjaEqe8NYQVePbMr07vGzooEsdAAuWcrdefFgpubC0
	cahIa4u6VUTkxhmw4XYx1Ky8opJ8EqGCLD6+692bfLhp5QWSxqg65KUuid4c6my41jCSxSOnnKIi7
	wJkzS5oWG3OP+kzeYd83hgLdaKB6kAq0zjgVXogGxGRilMDLtRURihZtcaKJsd5LGuxj5loBJyOfB
	scLLo4mI0KvAfDr32byvoizO0FgUi/5gSemxVeBshImcJCN144xSdUfBruDKP5FtUJyA20zUVlBrt
	dOKzFcqQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMI-00000002Uzz-0FJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:31 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1105579a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045108; x=1789649908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=bIRDHxuBJmmpgWYFR/oyC5WOW3jWB2NSqCZMnonfR/GDlcAzhr3lVwsl6Cuq0Dxkbu
         ldSmmSnLpyD2jtSAjTGm3Z5AVb8QF4KD0UDEM088ii21Z2GlkPAGvNmrDaxQA80cm2Ka
         3/GEoRFFWw7Ywkhd+9TilyWOWOA6TL3V5LvSQJjqhf8AgoO6gAwni2E/cT+W+AkMhyar
         LXYjHi0dslLADEAyBDIb9OXzLA3iZed2lAhMTa8BKSmnikHvT8Hj2qSwM5YK/TIqKVRo
         qHacE68AGoK+bKH46iS5MaNODjdIEFQt0PkvdztWlEVeN8DPDibcjaduVuSyRH+oFWbq
         XiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045108; x=1789649908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=gGGU8lCfFSVSyvDZvl3/t2iIpX5oayT8jlb+G/+u0U+r9vln91gvunZiOT4Np/r1b8
         77fBvTDLFG/991S7lt2RNoH7rlq7oM4D/sDFBrCv0A6MHO6eE5YgnY6EIOtc/Mvk6cde
         RZjbZFcj2nXBCYsWoWuE7yFE855w4QjuK5BEnjRwLKHqBXOlFbHRuayQnrC9GGgUJZ01
         618RXjqpv51tg+/a4k5jGXlZ9l8jU56cqrn53DHy0jJDPsT0DABJcOFLvHZkbWY1Le71
         mD/O6b0mOXUpfUamshoS/FfASvRHWUszAZDT0kfm2S3xZDYJb6Pq9/brWBGT4anLnj4Z
         z0OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaS38bYT6jCu/b8ATeOozzPL679ZcOcfN53jSJSnLG1t+9u4kXufAv0iNajluuLdIKjZgqKB5528ZO9QrcdVZo@lists.infradead.org
X-Gm-Message-State: AFuF++mRiI9eE30+z7FiSc/EvTggCscE8csVRupNe2lisWdt8ykXLFSS
	NZUXo5IBtPfx93JWgEtmH7vIgY42ud/A7RrriQtc95XUgj3uVHdLmZLY7ohLdQ==
X-Gm-Gg: AYBFou1nqsEM8OxqpHLLvxjCsk5DXBEwfWGUwuILHIxzV0up+BYSKR2iZ3TBkMqtNx+
	md7SwU8JJ1TgoEef0T3h5FqYjO+axF58Sr5sM5nh0l6EljZ//ZQBsTeIdE7sfsYLNqcnlZUID88
	CeVH+6IpDw0Hc4ExKL+s0QQyR+QTwK6A9OMzckmu7dYigwIGHgX21luuY7xeSGn0HAJTQtjmNze
	QuayajVoJkanRauAHipy5TIEdbklA2xPm7eGSSG0HR20a5yNsV/l4aILvw5nkjT4MH99HDnZQWu
	GY0pe3mhoMhnqhz7Ya0mEiQOf4WiQAEu1MMSzBufqjVXUOsQwggEKEeM4LXNvDJl4K23/QpjiCe
	kDewvMsihhst/wFX4lKxfTR7TxdxZ7bYJybCM6eFHItX0k7LSJeWCm2ZuQ63rBwxtK3lp3AbEbp
	ivaM+k0DlhiDvensnWDgOFuiG4lf+2WoGK3vrKkuNtFr9yP/AWGaP9gML6KA8PE/dkBH3djUrX5
	inBusujvZST036aQZN+SSso4fghIeZI83HeGeBP1GqciwxTtyIObA/u8TNLDm9qkMDnMxBVkXFO
	IBl3Cl8xHEM4eqE=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr10327996a91.24.1789045108156;
        Thu, 10 Sep 2026 05:58:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Thu, 10 Sep 2026 19:57:35 +0700
Message-ID: <20260910125742.150902-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135830_200338_C3ADFAE7 
X-CRM114-Status: GOOD (  11.75  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 435914aafb44..4997031cbcab 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


