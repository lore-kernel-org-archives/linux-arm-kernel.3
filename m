Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77188CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=; b=AKcnDjOUP8PzwWVogu9i/QvzsI
	GPrPbFG3qC8tP38nujjW2/I0Ox4HL4MqMBVZMf5nSFxTTezD5EvCPJvd3/NTfHNtSriA/CTiYqnCt
	A0HslrY8ixEEVu0MUvD/49xLkxBcA0YJO5hbr4P07pYFk4i0thOMQSjjdFgavLhtdkg3DjljvOxKX
	Uhm+UD6YzTw0k3F9LUD/sw3d69YDVSpTi2UAeqxK6/5xd01AUIwCLpIiQRdOVAg/Y3Jk3v44jHaJe
	hmKs1sUkTCWfd1r3vMwBEpU0uPDqu2UwzDu7AFB3RQLc4E5C/jCKmbUFX/Jm5y/mbbMWumcFnaqvV
	sZNFGwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVhE-00000007yeR-2t86;
	Sat, 10 Oct 2026 11:57:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgU-00000007xzS-3foe
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 10 Oct 2026 11:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=; b=U0PGzfR9KAWNM4OdjHTXrzGaPD
	GAFrrD5XzsjyBa7fhuiUPfVn74tWsVzjq6jZugO2S5uf0XxfrAIVeZBMGy6H93sxexZtJh2Q/bqSF
	IyFKtr989iw6NcwF1gSYaZWDmL3WB48h0bIChkDsZcOqqk8WkYVXCz6lgBiGCfhQE9cOJXseklmOL
	uX74zNP2L9Xr5X8KPqGrm+H4UsuAFV4b5sdrpD/BEnVqtkjgn4namXlxqBpTdRs4pxQcHiPxJE1XK
	/sTKL2weVwADA7nbpiYrf/hIAmQQPUb2MRu60D0WQP2rrEjfM0fUU0cSi9n2Q+hD1AOVe7eD75m/O
	z2jnyrMw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFVgQ-0000000C4qn-2yMD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso1216895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633369; x=1792238169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=Z/Xvl2Z1eJS39dRPXy+8jDvjsfr/jRH4ZmNu4jn9RE//Xq8FosdHFXp0TmE+4uKYIt
         euG7jvAoIlZ9pMAeUCsZTXJBy1GT9zqaG3eiz96JacRgOtGZLfh813XoFAtWRQJ4wzG5
         trLIOn9+j4lgXLh5kxveMDQGqgXz8teO8k91aJY3xUyMluI40vPqBiQxj1mxKsxO9ahX
         8ptIbyHje7NBhoiT5FQtvVLwyonJgc1H/4fVAnznoF7obb1f4j4/EErakEXgulGzOty8
         1i3OK936fmWgxkadVF/zydPYKAix2dz1/lOUc5O8Xkw4OrEKNk9pid0XzMnngBloCUCZ
         Pl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633369; x=1792238169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=HZBd/MqJS3GZrHbGIoK7G57vftiUbo/xxSkQes5KiJsl2iyqu9DMUCMN8G33nAdFgC
         OxKjXHuR8zvIsCyiR2JIXixNczwti1abIkSj4yDmZ+LQU4Y1GsrWZ0pMn/qFZfE9Wy4/
         PXUdQ1/aZjcsUJy5HbR/KkJviamokCKtyBF6ZOsh9gLdZByHxZUQGH6JT713zJdblQ1V
         bq6WyNeC5DC//bt6d+F+9Os4iMM/1vtO3g3RhLGqGK7pChFqsj0rhUKPhFp7sqQaMiaC
         wG/FHfGmnGjDJFwkuX1NCtawp+lXJYHLNTSSDHY4yFDD7Ehu7trwl3V01KFDBTfaf2qC
         8P9w==
X-Forwarded-Encrypted: i=1; AKwUvBwVNSTCz9g1JNT+QklWaO/wcfQMpsKZ/r3FITfxkZFfMAfaE9r+XFxMlNZB2Cnxasd80oPfBZOkD2cILXfnqq9r@lists.infradead.org
X-Gm-Message-State: AFq9FYKn7nvkslvNxvcqBCWrZl/SW3frHyYw4FtponywH7jeOpXjEQpb
	erdWdxO3ys/hpG+oF3Zi4jq1aQgZPlGSe/vYZ7TrFD/4tHS9dfx3NDM4
X-Gm-Gg: AYBFou3M1GdiLzgiZJv0wC6HNgEc4I2Y1FDB35tmxBwRviwD+BnqvKxSSUE+d3xIlXv
	VowiMT7MOEgxgyvnrvIfIcfV9uEhmT7/p6zJGgD06/Dt4TSUopDkHvThiN1L8SPWrzzQTjJW6hv
	jOTD8iBU2c4dpXd9we/VzEPpnb23udYiksh9tL2ehH7cb3q4V1l3PJHUd+iq1No0S6RuiwqN8MY
	07D+zVjxwB7QZJkbrdDp16vZqMuuX8XDNDGa2+c0wOm8Xw7cVFlLJWW1MoFBQzB5BukkssWE39s
	Rdk/l6JLJ49qYAl0UcV5USl8qQ79wAD+bjtjhWqECDC3JG2e+9+mEooODge2/gMQ4OBlSFLP0tm
	/a19H4e4UinmPRajDsjox4m+jyzmXH7DrnvhXLG2DVxZ4oFi3Pp7A0VooeeZ3R6/OUivfkFuyZl
	yJxoXLQCqOwz1yQjpiED2nLV+Pp5Np1v5dAVGMy68xNncAOQMH/ats6uV+NvW6v+VJ6Q==
X-Received: by 2002:a5d:5d09:0:b0:48c:6a6b:69b2 with SMTP id ffacd0b85a97d-48dbaae7028mr6208118f8f.27.1791633369101;
        Sat, 10 Oct 2026 04:56:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
Date: Sat, 10 Oct 2026 13:54:05 +0200
Message-ID: <20261010115539.9237-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_125610_911794_7FC975C2 
X-CRM114-Status: GOOD (  12.19  )
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

Just like mt2701, MediaTek mt8167 does not require an ARM supervisor mode
call to toggle HDMI output.

Fixes: 511cf7d12331 ("drm/mediatek: hdmi: Add MT8167 configuration")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 738090a47176..9896eaf81e7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1214,6 +1214,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.tz_disabled = true,
 	.cea_modes_only = true,
 	.max_mode_clock = 148500,
 	.ver_conf = &mtk_hdmi_v1_ver_conf
-- 
2.43.0


