Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1EBC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=; b=KGvwVHTJStWUJEzoW/+GUupw0s
	tzyMQIghgQgUenrD+Ob7ZK4pyMZ9zFkpUygGdiIlMNQ/svPKPQsgm+NwmCUsTKv+XlMLB3D4PifbN
	0S+txMByCzEG2dHSzSTiOWF/tx7nts2RvpvtM835swFOC5CS1Iq0jGfqVhtRcVvdHeYqNib3lHiDY
	MtfJci9FN4HpSSLw7vWYdTI5UD3USF/2O2lo3ta6Wh3ktbxMauMCa3Evu5kkGWiD/OhXnTsuPXSL7
	/WlqSyDzT5g9KoV2UTkWAQCY3Q3IPup80TOtEUUMeHgv9eAq2ez7PYSKLhlABVjIvt1OxAnCAHElK
	aZ3B/U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i1U-0000000F0DA-2zQd;
	Thu, 10 Sep 2026 16:53:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i1R-0000000F0C8-1Al1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:53:15 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8690079f2c1so1318015b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059192; x=1789663992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=;
        b=Z6e202R0M1aktL4LpPSJT25aANyJrvRrS+fVmEgYvnX5ZXXwfaxhXan8gypeCbbBHo
         aVISD9iW44Eer6Dik1PCsJRcALbnADM4MRDP9cKQSZEarIr2LUDQIJPQav1DEs96QV/+
         csFMB4JaxYtBdFhgGajn0RJJ7Xctdz8MKlB7IxAb5ifO2vO4mOEtFOzxM7NMnynAtZ+3
         rvfEL7psDIZXGTesF7b3Ocqo7U73NyNOpo1b9ONYL+1TQlNahfWYb4BdVKMsDh3ZEHx5
         SGPfTJTHof0r6qy+zFuznhMAeqVYOxpfnkIaMcIJdl6xCaxV5IzNXOVTtsia0L7xusgw
         eQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059192; x=1789663992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=;
        b=K34mSMGESV8UJLUl+k+jormLXWqZPO5ScfSiYnRmCWqvvldJUoZqjmLynixf2cj/Mb
         xI4hFvu5RGBzHtbKu1FwNT/fwTKAOOjsiclQ3qH1JqZwyG5WlI9ueUwv3++kKQ3zcSpq
         3n2NvlfNvppp1MrRg7m8A8ENMGMBXC+7cDkB6ZoXJq+iMgN2D0Pj22cpXjvDqQ1yQFed
         Dz/9Mfs2zfAI0f7MHyUFfnZOp91b350grXhifLRnKj39bMkZTjy0z6/BTYeCwqwuWkG3
         yjRXr1Tkj1zEwDpCB787v1adhXOHZLYjmdTkvKGFDGrBYa/XpNLel+wFsoi1SHc8Gdpk
         bPVA==
X-Forwarded-Encrypted: i=1; AKwUvBy3sDxG349xFqkN/x8tk/NPz0bUGcPFkqfmVU5u9CgbOFYDVPPU9vDD7NdwngALOuSYdf2hkygF96+bZkUOwnr4@lists.infradead.org
X-Gm-Message-State: AFuF++l8JCqb7O+5jCu3GMAEQUdmhxpktzHDFa45sE3Xc405ZYidNJsT
	TIz+xYntWPJRMs2pV/6EAJ5uQDNsWB+VLk86fJHOHYN8/gyX+EjAwwjQ
X-Gm-Gg: AYBFou3z+/h9HXnwwWbJjTytCwIPt7DU6m1NaAyU/TrYSYdUOOMt6pcMuaCF9N3fGy8
	U5pDhizjUDPXJzdUAqDmg10ikUkzy+tHxv1MjEhZ9Rcv/aHJewVty/qe3ug5JXHmI+51w3LG/vy
	fZMZiLtH2qz+xl+gJZDJ3Bg0nOYyut98CMMz2C3sPTaBjKH1BTCJEgLU8bKi78nYqUHmG2KSKXo
	QSw7xgYT5FLdJ9cewnbyDSKHjtieOdnbXpZgQ5+iWDyOcoSau2ly1OgHJhmwWIqTkzQwM11KiSZ
	bZdLHOkxjKMuFA33cOdRUEqDH3V6qlrveLK5fj0Mxyzo1DpreeKpp+pTlzp+Q49GQ/+Vxs7aYSS
	ECDEWxAmBE6HIpyIj6wc+/OuHBAlI4a5g+7bIB1EOGxQTTIDcK3CrlgBQbyMaBzhHGCRWxvdEBy
	PIUqcNzOal6m8tfcGx5GJMZm9zlHOrM6oafDk3AmfGBsPEO6rlOPynNObudpGuvVlAzeTNn11xo
	ZiuuW4Lqk+Sf0kaQc150IdOjWap
X-Received: by 2002:a05:6a00:6d43:b0:869:201b:7386 with SMTP id d2e1a72fcca58-869201b7831mr9536931b3a.1.1789059191831;
        Thu, 10 Sep 2026 09:53:11 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac21sm8425743b3a.55.2026.09.10.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:53:11 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: james.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 RESEND] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM comments
Date: Fri, 11 Sep 2026 01:52:53 +0900
Message-ID: <20260910165253.378212-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_095313_309239_469DA347 
X-CRM114-Status: GOOD (  12.42  )
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

Remove the obsolete "/* NEED CONFIRM */" comments from the MT8195
configuration. These values were previously confirmed during review,
but the placeholder comments were accidentally left behind.

Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Link to
v1: https://lore.kernel.org/all/20260522134522.368073-1-akkun11.open@gmail.com/
v2: https://lore.kernel.org/all/20260525092437.29313-1-akkun11.open@gmail.com/
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd8582637550..87bcbfa2d5f122 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,

