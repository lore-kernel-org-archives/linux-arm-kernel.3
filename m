Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1568FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGX/8llQgktP9uhRGMAJdUwUlNVBv8iTAag4vGe1GhU=; b=HLnNviRsE5OhSw3HLqKmQtMWyN
	l6kFi+gZcYL8dRFa9eOIFfnl5LIhZrp5Ftazhn9tismcaCdh0IJG4eWgRQoVwV4HehucXbfAMagCw
	ShRZmrWx7LkYf/GTL/AYtelVTZgIoIApETa1Al2ACwL8P9BKYxUi0VEILFL1Lp96fpUv1UULwgaLt
	9RAvC4YPFyCRhHURqw+YaDjl6mWvZrWJ2JVWhj+OJtbF9cGQ2f8mj8ZqNADVwd0Zl1Z2THgqLLygO
	9rk+f/5ULG28oqV9J02AYK6INuo2xCmXDtP9G/HXo8UT+138mI8p5WQkrbwyhxzaAkbL4FV5OKj3e
	RGLlnP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whojs-00000002Xnh-3XXo;
	Thu, 09 Jul 2026 13:24:28 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whojq-00000002Xn4-20Nt;
	Thu, 09 Jul 2026 13:24:28 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1B1EC1400151;
	Thu,  9 Jul 2026 09:24:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 09 Jul 2026 09:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1783603463; x=1783689863; bh=wGX/8llQgktP9uhRGMAJd
	UwUlNVBv8iTAag4vGe1GhU=; b=ZXoSJkpdC5mkhxwGCFhYVOeL1WuJ7wODi6SrO
	XhDAPgdg4esQhNFLz/+/F1XTfS/UohqmgIvf2zp+3bUNPpcuYcWeBTBBL/U6osM4
	q5PLYVP08U0oBETrkMZpKJ3gYrR4Ocf09n6sbNB1ME1InsNl5zHdAGLYjmy6SBfy
	/Jg6IAl06Vb0/4i6UyaRlncU0h/9IU6CB6xaQdBNBG7AFbJfsxNCLxaTbDcp9yqd
	X/kLtrSBuycDIWfxsf9Cx7HRhQmyiZYtNM6LpoNXB20Vfv3NUvcrGCz6oNJ7g64P
	ZpZjuBcwoCB+GTvMBK0qvWwW6P2eflBOhWpf1Ix+ums2+paig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783603463; x=1783689863; bh=wGX/8llQgktP9uhRGMAJdUwUlNVBv8iTAag
	4vGe1GhU=; b=pYDWn46+qzT0tq8+yCTDERCYTc42H6t7RcWcEG3vQsr3NazDN5E
	hzbqQVcQxs1PW1660csePRGKt7AOC/U0AMoCpEPXkFk7UloJGimPi3pkwHhlVlJa
	lTVnoel17LyjuNaMb3h4rjulh4l/snx7aW8QnjqYYAgKgd0GYCzFaJE20r4PbTLu
	o0bKGXpZhFLtITw063r1oaVCDF94b8If8ACsKdp2/hwlpusxdIj4BJSRfmMoMBlQ
	GaQXy17DZ3zzDl2rXCvuF9gboaPznBin7CWKea+T7dwLvhbSMfkIEL75icX2KCa2
	EUPkVLSEiZ3jd+iwWR6NNx9BGxZMfsF1CWA==
X-ME-Sender: <xms:BqFPausLqxSjo-hXlIp1tqCjDHTTh13WYiE_YPj8UmuwgWsd55nIiA>
    <xme:BqFPauZTXc9NnwTBcAnmyr6mN5_s0iXAo4IBJq3UzrxndhACr95WeHoC_RgwyCFQS
    D_5S72GfcP1z_Wm-TVOia7iC16tvDCwqXs_RwdwM0zGq0F6u00>
X-ME-Received: <xmr:BqFPaozTLf6gQiIwQdgnoVsOScGn9ozCwslRu7RRQtFZbtkxDav9wGCqFJdsUjaDmKGdK8gcLWNIu2oEJrzJtMF7TILmF5E7_RA>
X-ME-Proxy-Cause: dmFkZTF4y12o2fouM9BMGiLlCXxzON6QJktU5ZMw61OZlwMGXCfWvXX11sepL1RHTZiVGm
    qD6UI7Qn5dttq6BYQnCaFKulS0dSlPonVGh2GPoeLpJ1GLyJqOcyEKkyFBqMEPShOIy1EW
    BFWZWOa0Z1nRQof90N0fEid2O8AA+sGJ8uiEm0qn6tIITNwttmx2li3sCi+r1jev/bHXrY
    DCYljvRd5kXWKAO+X2sYYDdvQSHskpnb3bT/VAmNr9yG8lStLbKiCG76+wXXTcy08Nqeah
    nEhqMdkQhZ6JNslFh0mE9bus5iTJVTPHp5YW48Cz8/rqecWUBBv6xjeT5m4P7vw7cEATg0
    4Tk6x6JnK9qJbTa0NFUBLbkSCox148JcUm5REgnJN+xqfebWSwh+Gm7SGZXSSBeeB0ypHW
    B18KKUSPqIWsmoXgVsFyP9imCh5sSlnIIkbhAQ9XlWVyFVn7VvpPuAzK5kgYLwjvFR3OT6
    ipETHZVzvqN227P/DQoJoQMJsjK1J5+Eodro6yA0D7l0cnz2YCtHWOxp/M57z6t16FXQn/
    x1lelK5dKAp2q5nE5B7lyPJR4yijcHyp2SqAqVEpRsqmJy6Jr1x44dGxrq/CPtKhKmY9lD
    VLjiq8APOM3cDiWe/ob79Pbk58KBO2ByACDFIiix0FT6IeX56ULYfTatObaQ
X-ME-Proxy: <xmx:BqFPaujecNEyuVGyrvx7O5mWEvbtGz5C-um-F1wJ9kc3zRB9DWm2pw>
    <xmx:BqFPask0dy5v2MFfqme4452AsoVlXNBcHYfP_tAvt_0vS6jKnzk9uQ>
    <xmx:BqFPash9KWhLPAoo81qmsjRFTmkgBq5QUGsNvY24mDYx17YMvDF92A>
    <xmx:BqFPao0SwUz75L-joRfovl930Bz69gi34RjiuTW66bVLc8adc54CZw>
    <xmx:B6FPatSabWOTOv8zn1bcLiTuiLWN6_YWcPUwfUrLGOAlusmjSFsoDhls>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 09:24:22 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mtk-socinfo Add error handling in devm_kasprintf()
Date: Thu,  9 Jul 2026 15:24:16 +0200
Message-ID: <20260709132416.212212-1-griffin@kroah.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_062426_581672_2DA785BF 
X-CRM114-Status: GOOD (  10.64  )
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

Add an error check to the devm_kasprintf() function in
mtk_socinfo_create_socinfo_node(), returning -ENOMEM if the function
failed.

Assisted-by: gkh_clanker_t1000
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 424a1eb82c20..e294730ba709 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -76,11 +76,14 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
 	if (!attrs)
 		return -ENOMEM;
 
-	if (data->marketing_name != NULL && data->marketing_name[0] != '\0')
+	if (data->marketing_name != NULL && data->marketing_name[0] != '\0') {
 		attrs->family = devm_kasprintf(mtk_socinfop->dev, GFP_KERNEL, "MediaTek %s",
 					       data->marketing_name);
-	else
+		if (!attrs->family)
+			return -ENOMEM;
+	} else {
 		attrs->family = soc_manufacturer;
+	}
 
 	attrs->soc_id = data->soc_name;
 	/*
-- 
2.55.0


