Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308A2C98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=; b=kghexjVmb7JEofUdno6R8KVyba
	HX1MkF9iBX8p9rogwa9rtO014gNU2JAt+WQ9m6YcgaUw14cUfuKUb9sVm8aSb89P22HLDP6mgrii0
	iGwDM+xcaRxKLGWeIiC36VH8jut3+eIKH9rWhbyRbldhTqcTHiiqmcCdrtb9nOrkLywwsee64hsce
	kOWTMqM/Wgnnep3P0Jjenp3RJgimYKh/9JShTsBRSh7g6QkmI7ZTwLLOsEWdS6bgWaEv/Y+Xsdevp
	gvXpHP1TA0487cse2Vxme+CosFgCQSIlyBvxdEn072dn53k1LK87Un7o0fyEwHuIgfVS5Wh10wzua
	AGDxXHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtf-0000000CdxZ-47eV;
	Fri, 25 Sep 2026 04:50:56 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtP-0000000Cdjk-2wiQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:40 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0b89592d2so197880a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311839; x=1790916639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=qdrHQGi2F5W1RvDbIqLpDmKOkrel3H1CUQbxWgUdWQce5rWo1YoF/ZPfQbjeIDwJNK
         FMMJ1SD9upmYtX5+ymBOhPLfxj4veE4l/J4N17pOZe/vfo1E4ujsYXqC2T1vcH7yqMDd
         MBlaoniwhKtrHTnPycvlRgCFgiT9NKI2vIfHFRa2T0FDziXJLKt0cdMoi1P5EUVYPmU2
         oLfwfSfERoWpcUiS21n8zUrgZZjgy8KNjVUViKX3xsI2dD0TZ/MBaI27Q6guexaS/Y7N
         HUwGswshje/Q45wgCaDi/VaolnSP65N8bOKHgDUXh9oO6BtWFaQn9MM/kHFjPDiQd6+t
         4y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311839; x=1790916639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=rdz7/ul0k0ss4+FRIsG7+3StL8v9wD8q+v7lh3QxyyJoGohrZWX3FIcmAPVv0ObwgP
         e+6HZsB7xXHv8dTCikXQPnxB9DWqKDuLvqAwBOOyy4W4g4s7eCH6iBAHUSPFjpDrf825
         wle3uJ1QVqz0xPLpLDa5lG6GMFsZDyyx9ShxEdRYtc+0JyLZZwgaN6m41e1BYR6cJQKz
         AVqPduinX8iKIJCpbCMOXPcbSV6jekIeMCaQrl5gJibk2ufng1PWB0olqQavNe1yNTaA
         fo5uDKfCCiOs87bVxn8LJxtf8vSRx2gE55N+0R/oWtrMH2rsJLIyLst75nvy1SBsnxd5
         CKRA==
X-Forwarded-Encrypted: i=1; AKwUvBzmqEMMzVROBAJhpZ5oMS2kxUwDOLLT6SShNP/dIh/u9yTkug6tVshHBPEtmVTu9++6s5QWcNekK5MShdf3D6bq@lists.infradead.org
X-Gm-Message-State: AFuF++lJcmET/5rX1/laQLHcb6a5g3B/OwW5fxLDBQ5LdkQQHMJ75aie
	hyOUfWWKEn92sbxr1Ic//+a0sIACX/EMLTN0R4CXVL1MFL09/lxte67t
X-Gm-Gg: AYBFou1P2RNrO+xbXHC8XJLi0ctwrgV/vqSD2QfJNf74TFkAqPrXp+kvumXWq3aC1Ix
	svlYbkHOmPp8ImKzvVMcZFFz/ES/zEJ14CuYiHbZ6IDwhA4BGT9Gvkat1iWNiBUHuo7k30ZClf+
	pxA65U+MvLE42rSpIXWed4LTEUDiUNXxww1rFQBF9ceRGe9X8QGzno25ClyE9qfIMvYdNRnK+Ht
	LrQzk+MkySThYB74RouhKLuMJuK2U/qj8FkagT4DDvvecpI7weNYZYw31TRH/VYPuhLI/YsLtf0
	j9uwrTS87/Pr3uSeUgP+VDRBooKK+HTxssZBL4FJka+33zZmrk7YAsuT7lXnptDv7+c7XVJmyQr
	47mh70v3bMGplIiqf1s/cd0JOJKBwT0sTyIK6nq87TQN8LqeYANXHuOdFuxTD4rHR9fAEnF38FR
	W7svrXpBWDlhPXbaFMGWG0T+dW6QoeseB8jGJw84H+p+1FkcZChhOKZgPyIAwKyj49/aXJ6wAFL
	ArsgEc3tNnzn0AaBXxoG270GVOFflDPUrNyUkfZXoDb7p3L0an5sim+7cCVjW68uVDaZYRcUQ8w
	nGMQJ2wgAr1jKIQ+VkhfkDKk
X-Received: by 2002:a17:90b:4fc2:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a0c27621c1mr188132a91.19.1790311839074;
        Thu, 24 Sep 2026 21:50:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:38 -0700 (PDT)
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
Subject: [PATCH 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Fri, 25 Sep 2026 11:49:04 +0700
Message-ID: <20260925044908.450775-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215039_757820_C610D173 
X-CRM114-Status: GOOD (  11.88  )
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0


