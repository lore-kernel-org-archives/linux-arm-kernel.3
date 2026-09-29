Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7542FCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=; b=SdHLsPx/S5uI1FKRv/XzooEYkr
	91H05I3sakC8qpbzkzEMB1ytOmZVqO8m0ZuDWkEOMAgEm0wayRDHhZAGSQ2KFRo2FpvxdmKPjBJJc
	JDGes1dKIhSxKvK8BfP+XWBrVwWeb1T6HKQXTWWgM6vG07yb2As2g/iU+oR/2/cdVoc/8f2Bd3O4/
	RSyMDnqkYC1jrmIjqpk/Gk+xqCnelmRn0ATIpjEvFZUFGqDa02l3Rl+8RLxMIqlwQPvks+dObc9+W
	78VUZsCakVG+zH1khb8qVeVSfG2RkIAZU1+K/GHj51cXGdX4KqiCaJQOoM2G3O49uwGybs/P3TpTI
	9qtIpdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR55-00000002Q62-1kW3;
	Tue, 29 Sep 2026 06:12:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4p-00000002PxC-35J8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=; b=EIgPBDN3Y1xpR2W1mvlKFuSEIz
	COb48ykwQOf0JY7/z3x3E2zF/skoSy06XV39sSoVDj2fNmavnbkaXKWhmfzZqnc71BIUiwcAB2fBD
	umnMgIz/iEa4DcTCSoYpXqvaoSoSQum85AWCvd+CybEnOPl7a8SE3bqfQHrm//pjfXoSul0Ty+Ywg
	RYrQw2YwhT+qHeCDYijrsscg13ZS7jInA21XL7ERyv0WbgTT2fvr9JtBV+0+XmWh7L4d+Oanzj847
	nuOITTe0ROrD2tZA73fw8iF6siVPfhRHQzwRdJfEKsUym5KA4YFXHIMKZXLadP5DcMdCMpOyQjCKy
	JBpfZYmg==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4k-00000002EYb-4C4R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:30 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d8fbef5018so25568225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662345; x=1791267145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=lxVURu3h2XUzk4kgWX7sD1aWDt+SpfX5WAZ0i4SCfpIdraFDKOynE9cyJGN2eL7pOq
         iTKdKRKjDNgGiFQDDvu7uoUpfiNb95Ox6jTabCAAY387yIcY8B7hJWVeL1CN2O6zOxdD
         iwF7IES9YUEiv74Qz4mcvfu9attXo00RYRQN3Y4fywstjchKx8cuckhTA27rGwe5iwLW
         RsznukTfaEa3wykl/IVdQaaWwZBBBtIoTMqTU2yEdP5ntjkPFEAkx7QqBtkZZUChzSSc
         LD00f0qDmDtX4Ynz8BpaU/208Ag1A6+SzYVjfCDHgoJUqySgvcbAaSLovQCpAYs89xta
         G7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662345; x=1791267145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=OFT1UdqILRK2JM0e+id2/u0A2O1mwwrksKNDoMISCotdspEmi/O5Jj3PwwPXInlwe9
         fJFMS85ycpzWAxQdSKbeqCuLovz2BgXbSNFAczyl6hhAf28tDlzNcaqyn01lmB4ygkem
         5vl7ePrpKKQC4qDlH5pYNn6fLNTMlV5p72A8J9cP5lGKIDGnlJC8PXmJQhxALrQR5MTR
         YMmblt4ijEE8rgHDeEbsSisUkfKwok3G2I3/XPvZG4LwVwDVejROn3w3Q+qqB2gybydy
         AUQor8yPfxFT3oyqqpw4ibge7YdNI7XPWlZlhlGSFnJU+kUZmdsSROFjYgyoirZxpG6k
         NfQw==
X-Forwarded-Encrypted: i=1; AKwUvBwnzNQMqYNtbdScL8DehK1lnG7ZQKx0Db3Dm/RK9RgneMlnuQxJztRn+GB7pOfydvaYoETlYsj75HIpGQJrHXq3@lists.infradead.org
X-Gm-Message-State: AFq9FYK0dBw416ipBwGKdtd7v+ZUGvxJBleZMCFc98vlMA3hdt135QLP
	aNdducUVz75xHqiwzsH5/q88kb5VCTL4q28hLCqxnZMLAOtim1B7pZYo
X-Gm-Gg: AYBFou1u8komE5Nnd3+bPbHq8LQAoaWeB06+sBKZNNspf3U2K7osbn1SH+rUbKTOFYk
	uHMhJhNT90UoM1p/636AA+ZNQ6JNo4dFFU/skqomCI7TTMEUFEW2mIUNo8q4g8YN4egXSlpOjlX
	rYZI/luSegdfirSWXu8tcNTVrG/RQLIwn6iqph8/X95X93wmNLuEl9CQ1sAshIwvOtZDrHsW85q
	3EszSYc6h5usnN0ARLOcS1T3BXKvURHqDNmAh6nvi4vhZLDasZkHuFKSNHstXkRYHzsKPd5LvLU
	LGtwwDBAyWjn5uXOWNLk256lehWMYdUe1umeQV7P7Rz69JDyx3kQsN8vLQjpeIztshtc/LhdjD7
	O0I5NrdIJEeAdminVmovDKo9mSnHFF6WRB2lxrI4Rq13Y6wcMokbByIGMWD9oW1T4Nq6iUOW6/R
	4SLf9HZsJSyEJF0JEEF36dm2yVKlFdj1ABT7xaiMPiVSKzq6F5ey1sRq/4GNQwepyUonl2VUvXU
	XKBKzlQZfpdg6I0uB8DHuuv9z4yODb60HKFgMqjums+K0PAuT80JTBmu4O0LC3xL72Z1/nbabn8
	8kUuA0tGMSn1mg==
X-Received: by 2002:a17:90a:bc9:b0:3a0:a515:c47d with SMTP id 98e67ed59e1d1-3a0a515c8f3mr8329776a91.34.1790662345126;
        Mon, 28 Sep 2026 23:12:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/10] ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
Date: Tue, 29 Sep 2026 13:11:17 +0700
Message-ID: <20260929061121.124001-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071227_668331_0D24877D 
X-CRM114-Status: GOOD (  13.79  )
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
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index dbfd02d20338..91a05ea6b8b6 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -618,10 +618,9 @@ int mt8196_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8196_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


