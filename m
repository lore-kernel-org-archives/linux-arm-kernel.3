Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D52109E527
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvt3lJ9bUn/nS9x0h5+rL6WI6mE1I309IFcyKJoRia4=; b=Ydl9roSuaQZSNKXNNubGAwJXg0
	/YkFyXg9ZQAnvQzztlFi2a1gMw1LPPdBGwkhG7oL7cgKNqlfNtDJJ6FJDJ0KpxEO6lnEjTQhs/Fy5
	Nz1/6eDoMaseXslqCZxP6ce+FUdkd+mknL/uIfdB0tEHLMxMqkOTp9hUrz7hjp15drGEsXfK0YRzJ
	EN53Bvpob9wSmmGwnWHlXeQM3vHy+2msuNWYYhx6uPXdN09/ZFYu7n7gn8vlrT8ZUv0n3C+TVyzzT
	Z6IsekGQy4Q1X6ur1F0wRTb0uDTh8x6IUqM6TPbTvTGgJslE3/xVnIzJphT9KwoJyZ/QGVCUiJmBI
	6tDdQa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRL-00000004Jod-07li;
	Wed, 25 Mar 2026 22:11:03 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRG-00000004JmM-0aIJ;
	Wed, 25 Mar 2026 22:11:00 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 6983A130050A;
	Wed, 25 Mar 2026 18:10:54 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476654;
	 x=1774483854; bh=cvt3lJ9bUn/nS9x0h5+rL6WI6mE1I309IFcyKJoRia4=; b=
	kwYOWB1ms5OH7QzL1JH6bQVFjQALUmA8xgZWm8i8yQ7tSNwh8uVE+s2ayiny8UBj
	zItlJT0hOy6ypw8mF/K9T32dEze4VYt7E3VY5xFGsJPLcF6+ObTReRFiNm961THD
	ZzG3FR8YcF2yKUIYFyClLcV8qtCc3zKOtyNpNcwaodz+hR/rdpNYbci7mrFvLrWY
	zySvIkY02hh/T1mUU/tXpvrU/SHs4dtqxAYdwYGKgGiY9tNXWWjZGGUt99GrCq5D
	Nh8XMixaD9D+ly6J04SJ3Ikjuw31PAkLgRs/eQ1xJbq7bbldXjbZ7TJM9uO1CyE8
	eXECwEz5L1Qpj/GDjMmhxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476654; x=
	1774483854; bh=cvt3lJ9bUn/nS9x0h5+rL6WI6mE1I309IFcyKJoRia4=; b=g
	20KQ18YO2ga0+bfQ4hTAhWDBkJ3fA9YafihX9S4oEf39wiv6ddCI7GrHq0t0fnW1
	3+XKm/6j3LnXzlBAcFFALynfpNKilGG8TVwWLbG+ENc/GXQ/iHJUuBQGXuhO9zvr
	AjzX8ql3g8NIZl36CARLET21eqWqslNXd3bjDrdIvLxPEDkg1rZ3WwJaMzQ0jPGt
	20C4avUB0sQca+MR1JWGOPyMZ/jty9Oh5VmExMOj0XC6meAu0Qbx8Og8V6mSkAqM
	dqBgvkngHBGo3xqWRFR/5EtizH3w4GfPfYw9gxihf6iFj3XGNHpkX20kuhXbd0fE
	jZVpGEok39GQau5jQf9nA==
X-ME-Sender: <xms:bl3EaYuKu4kvyWH_ho9CzCtsrLM7G6wHJgsbcN0hcaIA4dTsRdk6nw>
    <xme:bl3EaQSzBUE2Av0l9MMHtqL9cezl5zBXsYIUo_X3Qv1_mFIJjQ9_025A3XDtwwP3K
    cXFT7YU57BywCBA99VU6iXYljBDZRBtx3o6TcUC3hkCZMKneeTN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:bl3Eaf_zMmGyuTIvyQdG2vRw1kDJCyb06fjOHJvIMk9rdqTZy5ZsoQ>
    <xmx:bl3EaY5UNVHf20RBPtvT_3k-73LkA8UVpCpyvtWKN0ylI3Jq_OHmew>
    <xmx:bl3EaRgNTIwEZzSLEM1rGOjexD9ft_Bg29agHROj0t91bMV9iAbIOQ>
    <xmx:bl3EaXoqDggjdymLuHPYOWVoCZ-voVOqMwYTHxs13sB4cgSF8rcvQQ>
    <xmx:bl3EaYHnLppdurzCK4Bl8Xtz2WaFqPbTzo5mJvYGCRoGxuG-T8fCaGNH>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1CA7D1EA006C; Wed, 25 Mar 2026 18:10:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:50 -0600
Subject: [PATCH v3 01/13] wifi: mt76: mt7925: fix stale pointer comparisons
 in change_vif_links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-1-5ca66c97a755@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=floss@jetm.me;
 h=from:subject:message-id; bh=DizT/ddlZFD7KX9YeoKrBVdFFWkgs3dXjw0pBgdRG1k=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1psC0hLCRzjME8P4BchWxGbQKnGDkG2s0SU
 Pb2kwM/SG2JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdaQAKCRC17sMLqGd3
 H3ihDAClMgWNmFGBvIc41K+2GkosPVqd7mIMJ7jeNi/bvKlG73i4DUvihCHEp1xVm+UWUBj63yo
 lRSxzjJaayRjv+kHy5euXu4n/BN0JZgo8y/cIUUGJPp6idk7Kgc8OFAYbHhuxS/wT2g8kTkHElF
 7KLqZGZAtB9LavkgPrtSgklWfG/d1AHTAm/TkQBdFmmQ+83v1phQVGlSsPD/3HUlYPRt3ak1qOK
 xlyfAsvzRpvhLj+9xePow2WEjnkEG1zOwM1oJNCH1AgUgLN00ri5gfhEvqxOxKY6BekZzaLwZhi
 J7bhKfy2Jix4u5q7T8A6SAmxxEaow/RRKldkYTexSZ3hxSAUqapOmsgJQT4CIpQxFcaVEcCh/0/
 aD1NMQj43Vv7XYHAQ4QTNb6nQLBzj/vXnAVDtNaXYFiCTkdiqwVYCkmb/GX4upSVrqZRS1vXs+B
 JBP/fF3W6v7wZLOCBjhyqs/ufJpgArICFhmXKCR2VmvAN/ur/kqH5TDjU3SO0HbmeWiro=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151058_464669_6869521E 
X-CRM114-Status: GOOD (  10.34  )
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

In the error path of mt7925_change_vif_links(), the free: label iterates
over link_ids to clean up, but compares against `mconf` and `mlink`
which hold stale values from the last loop iteration rather than the
current link_id being freed.

Use array-indexed access (mconfs[link_id] / mlinks[link_id]) to compare
against the correct per-link pointers.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2d358a96640c..f128a198f81d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2047,9 +2047,9 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
 		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
 
-		if (mconf != &mvif->bss_conf)
+		if (mconfs[link_id] != &mvif->bss_conf)
 			devm_kfree(dev->mt76.dev, mconfs[link_id]);
-		if (mlink != &mvif->sta.deflink)
+		if (mlinks[link_id] != &mvif->sta.deflink)
 			devm_kfree(dev->mt76.dev, mlinks[link_id]);
 	}
 

-- 
2.53.0


