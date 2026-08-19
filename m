Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DB5C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=; b=13ilE7domopQfG76BkPPfmCUEi
	rdg6fZpl3GANq0b0gGdT7zU8Ijs5UdBcsXXSZvxBYUxkZZsTXl2+Sf+ee1X9OOW+teEIvXfO2hJKD
	mz+xWOW43984wKi5JvPpnxdAOl7eewlsheQQDmq8PFN+2SElVqmmrtJldoRXrI2S8ZKNS+DKypz/w
	1kNxLmd2feLRcxd30b/supngrOfO3Uk2AzT6ltTyNcu+4PSS/plnxfDOGa1hgnaQ6izYK6jAJlZYi
	fm2Kuuwy9WUzSunGZLyy7uTfh8mmwO5OXX/zkSexZeCdCIgxj6qb1ePdR7Z/lheVtpnSAQrJQ25Es
	XkH9ezzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMt-00000009VNK-2CYF;
	Wed, 19 Aug 2026 10:17:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMq-00000009VMU-10q7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:17:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38511175ad3so851586a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134675; x=1787739475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=kg0zrFavVL5ou0DQsOxcAZOjlMb3GGxpm40QuQtXB4RjELryIPToZoxCdnUi/2urCP
         jq1UkPu7sMDB1GZ4yl1rpowde98AcHA7ZCeF4InkMOPu51q+epZA1GFc8F7QzP4lQacm
         kenNKcd5qeupTwCOaIsgT5qL+yd00HRePWmeGL2OkRah7Al6qRF6QRDTnIwpoQEzdlE4
         mHLjtSTu62AJ+1WI+4aX2YLAZkjOBk2ixk4QDwOfpSY2oxSAM6WO3QfTC0rUlVUpYH3c
         SQzJKmoxpv8voLpqePvICI+Tz3D15UT3bPXKyJ7ZyQyDfSfBN66AZjwXeVHAUqYAlOnB
         LDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134675; x=1787739475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=SMcpCkt5/0i66VgLGdb9rAuz5yKGlFbbTrnZR33eHCrI659VVArpMAxlJfuspNdZ7V
         OAMglbLne/Vi+VShXmw9CKeC4XjiAVBsEmkMEi0Bcloz7/uQy0ptZFLS2sMppjNAHZJ4
         Qh5lBSm9hQB6SpOYzReAICsJZCWQKFQ/hWUO7PfQrtCoByTiyy50sACqKtodlh7wZxRD
         rR+mDIyyVAtqlCpEUwJPsDizgFDKBf78uy30yXGPyXOXBED4BeIKgtmjN0DAwmBxQQZ4
         RYhOPeHWxDqWMNjfkN+pQrFqp+f+Vv+x0Ps/FAo51pq7nFZvyyQ43UgFH//xxt2MaVgl
         BL3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrJ4dxrHanNPxWlYIn55qgXxqVPNGt645nRoaqQFiwn8BbEqt4YPatleS1/6pvUrEMebc5RYxRvY5xE2d26AyB4@lists.infradead.org
X-Gm-Message-State: AFuF++mbiAwqPlk8gAwjW3ykKnvM/tfgF96hGEavBBEy7fwLrolvaZUm
	6RrriEzYy+6OL0C9kHwnAmBN35G6jDxo3pQHddzlr+q4/Ns8pkHU4xjP
X-Gm-Gg: AR+sD13L/1fnnuLBraxoCJrO4y6RcZY9YIp448eqF4qQrcI9fIkaRTmjihCsI9sr0F4
	qO8SLl1EPBx2BPQaMETyc7o/OvTtonfuEVCs3Xo7y9Zi7ACBBshPphSJzdJEJ4Qjc+kAQGiaw59
	JJOo78RJkdptlViKzoFhPGQ++Ojt6p8QdeVyabuiBdz05zTzgoT18hdlY2d0tyd23OIJQJPHSxL
	HJZ0Eftov0gKED/7WfeAejjBLzCvN9TwEAz3zUMD0jnSbfomlZgnafM4Jw6O+W6Hham97MUvJOy
	BwlXkaEwNqzQd3QzfPBztvwZtIDNOVBEjv+aCsW7K9/JGkg9HClG9HokvT5a5k2r9ZsYIM6/B8c
	fxx1i7ctNh3YLXEvTqZ3Bkdwmfq6TDc9NYpkywH9nRAeBTxGwRkpj+m6PwrxtLYET8SPKclM/qA
	rB475cydGbZbfd/VvcKNv0tKJeanrMHcuH1XlYrYAYpmYTQAOUh5jQ/QdpP+POGWF6LEFsQhc2y
	HnnprIepI6XqGUFgDjHvA3eoB9BiNRPF93nAzPaAzQquShLWxIfobQC2FgwqCFoxDEWKt8DlZYq
	0wWu
X-Received: by 2002:a17:90b:4ac9:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-395810cad6amr6268601a91.14.1787134675189;
        Wed, 19 Aug 2026 03:17:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:17:54 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
Date: Wed, 19 Aug 2026 17:17:34 +0700
Message-ID: <20260819101736.67632-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031756_449130_47745540 
X-CRM114-Status: GOOD (  12.49  )
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

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0


