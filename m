Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86421C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=; b=3BZ1whkyegoBBOTqn/FBPcYEHO
	iik1XintqHd2GOEEmY53T0zrzJInnh9qDlKrx+y+EBs2mfFBBjzTdUFIZeHBlRVZcaoeWD5AngdFR
	GGebSg0pIfaAKUE6MI3ArigwM9d3BV3wsepyDCS76q3LfDJOjHVMxTSwRnuAT6OlOR1zJIlkNPWyf
	98mIhC6CX1HAMDXunb3w/QJQpgR/5FYFPq1vA0h0wBlb19CgbPuApxnnGwSr6etBPfkozZXxRj0i+
	yixDxTWhMRPXNG/Pt0fUrxs8cX1v4mDe7AkMyW0eSc2LeaL8e/2vpza61qmfQ/YU987KOF6Cc31aO
	bmPJU9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617z-00000002YMt-03h6;
	Mon, 14 Sep 2026 07:29:23 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617s-00000002YFM-13G1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:18 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1209594a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370956; x=1789975756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=F08u6rtLui6GRHdBgGweYBtDEcE8TBD/MV8xcHdNx2MLgmmt8q9ISs3lO5XbmhMzHi
         +E96c+VK/3El0I4q4aqj4phAkbeKFkKL7ikSf7F91eyWcIu65Naj30G9XKGq9m6n5I6L
         tJgDrIhLY7rZHeCRzmGFPUAIlwPyfOG5TNXmzxkxvJjAdYx9DZ/QIUSryci1ZEdqRANz
         v0FdPLV67jloDBL5z4XTANruq2GHs5LBKFlhfOlAjukobPcWJe4EgCKNpqovIGicPEh9
         B66DCMoexKrui/bcrWUhiJ7hhJVlmaCY3a1TXmrkdNhgXp+++NHNmtG84mGQr5hk3Hj7
         rhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370956; x=1789975756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=jUZ00a0hpFhRddrrmPeDRYNR1ouUB8vwuPe6i249hY8IyqftFrJwJqp6ieUNtf2bNx
         i/dGADUwJEjEnMSFwaNVvaL9RDymMVrntwyf4wMx7Pcy97DZALE2mq/WEw5FcdrZzVNC
         25KGs7qeH3sOLAdm9ODK69OMXwHe4b+XJXZeyOIDc2wRCZsTKC+4UNhQSlGH5ZdoxtVv
         3dv0csgl44AurkOiRQm0epOVLaSkCyK22gBIQaDQ89pecT6pIqjcgSiwL82qOGvh7VeB
         eS+rgFL+1B3mo8zRqjafCBs+QLlJSYM/M+I4phDR+DYueG+MRbb+ldQd6vTmtYXl9khP
         FIgw==
X-Forwarded-Encrypted: i=1; AKwUvBwB6N3JTsylcki+nos9BNZAncYQPSMRshJ0x5gmAhnEFp+6XiXsaisKuuTKOoiTdJf6Wdz+Mbe/5jPbnYfubgU2@lists.infradead.org
X-Gm-Message-State: AFuF++n4BzNrd3FyId81Z+C7hDY/C33ET62ThUhyKG6FhJAdiXr5I3B5
	2H6CjwfQhZmW4h9AbZ4ZV3nF6bHSTLjss19180vts/0Ql/m2L8+fQm12
X-Gm-Gg: AYBFou3kLH5mG/U83xLworjPKYUmoBNMv8/y1jUUc8NImSsz+zk3lGJy1RHyD6Ajvf/
	2fjC52u0WgVGIK0Zm2kiboGlSs7Y4KHYTQ2Gf0tCAtiIut59JI7OWCZBNLzc/MkebIaZIuyzKox
	13Z9ZCw8+wd61qeYUHaoasnezufqJTliwJzt9ilcE3s1LUrewymut1PGSghPNDdezsJQpLDDRw0
	zlu7IytMsGIJu6zP0Khi50RlIsZa/WJp33AzyeGhbZ7Xv0m0PK3nsSS00s0D19DZ84IBFtNsJH+
	w7Zfc3Wh3PaFi8a6/BD0k46XS19ctja57EgeVho1dt+YeTMh+3/7AlMkA1poa2b7/EPQfi6yslN
	J9nxECnP5goXWD5BTDor2eRG2XxDnuUPfquTCppu153HZGZFwLDvA4m2qQM520fmWCnWaLosakQ
	DwM6URUHr3JHEQ7AmaBevgo8pKI6kVZGA/mI4OMxM5uygd7FVRHSySA260sEA9q/cV4LD5Muzx+
	Cgk0nZooRVTmVR2Ujk4QxDnzyZbqc69ABFHk869yxAMU/qgzOPnNEsK6qpRQd81lGuaJPjwIyDi
	EpSxJqd/NbhLSk0=
X-Received: by 2002:a17:90b:2885:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39dec0849e5mr3489837a91.18.1789370955702;
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
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
Subject: [PATCH v2 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Mon, 14 Sep 2026 14:28:33 +0700
Message-ID: <20260914072842.24420-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002916_355057_AD804059 
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

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 8f6241d47a65..69aa3715c19e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0


