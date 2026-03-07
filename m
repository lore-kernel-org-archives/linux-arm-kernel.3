Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9AAFC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1zT+FghB6YhIIp2sgwQx7UzD3lNCmEI6z5nrADAygg=; b=JVjekQm9PoMs/n+2Fylltsf96r
	yejPmAolrLxY7UHLk4MFOZu9UMKlQz3QLvKtzSLREJAOqxnp4IA9ynRgWfrTIaiy11mlqHkDLuTqh
	Xn5VJB8Uk9bkR+lq98XKdf56cF+swcfdMNZSR9PX+DAkzSqpIqbYrfp2Eex6vyB/sxU22rrfpBvl8
	e45DS6nJMpFjCRLbJ1LdipwCl4EesQ6aB6eOshOQFd7tZsZIoFdMWWBA0Ko5QyewrNKR25ZcOejxp
	VJiRYk9vQDFowP4eI2PUUH/MYe7A9tsmWLIFXgCvk+U3ygp7NuOK7XBdat9CDjSqZ1cDk7bNwoh09
	l8Fi4QOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfce-00000004jHT-0A9P;
	Sat, 07 Mar 2026 00:34:24 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcY-00000004j6D-1cjV;
	Sat, 07 Mar 2026 00:34:20 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 2B7941380783;
	Fri,  6 Mar 2026 19:34:17 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843657;
	 x=1772850857; bh=m1zT+FghB6YhIIp2sgwQx7UzD3lNCmEI6z5nrADAygg=; b=
	VSPLO6rYYIYhHwB11m5lvqLhQfV0BQG4s9WbEfHXSfniFCMg/ev8w/CWEM1yxxMX
	XRP/7Cbu2RDcGHDu94kB2hXDVpcBXt+u/QkxZeaJLDeRW3eUlT1wYlMXCKHW2xw5
	3Os5TIXYn8SQLt0V2zrRl6cPy5x4Ee2nZjqPnXhmcUatG2xbpv6W9/55x35yP7rp
	KQM8KglwWXLDm+6IF43Hn80C38yMLLLynL534PqqJO5Rkx7GD09hu/xF8iEdcqUj
	FofV65LIPi+InPyKB+88bQgp+p/epgNp4leY7rD3+v0eMwSWOs6O7O9lFSygsKpz
	LmNm1u/9jbxDaJSKrf5YMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843657; x=
	1772850857; bh=m1zT+FghB6YhIIp2sgwQx7UzD3lNCmEI6z5nrADAygg=; b=5
	ZgzmB2ow6YdLNwBpPpEuNjuAnvQqXLYq+2lhyeyjQkJuJEA40peb2X6aYRaX5OFm
	hDO1Lk92UlBdumflVov4CXwib47XcwmEjdWRVDWNv/r4OZUGv1ZPy0tJ09bWHSVc
	h3bzNZoNOgMGAnVkq3zy2fEx4QohnpSiHnJtwLjQhxY9SsOYcQ3kH9FgsJ4s4ukD
	gEDyHswylq5PA1TIqlUk2sbZfL9y/v/qc38m4yxqwQgiO4RBv7xfhC10AgwgAKWx
	wfFrF4m6SIgZTX95q7wIjpLOwKzs6pSQAvEi3Jp8SKkcCnt/CmDQo5lmSS/RYCnc
	dtMxedlcaJYNGvK4562Mg==
X-ME-Sender: <xms:iXKraSqAvzWVpEGYy1yTe6f_V0pFu5JqmCAqJI7PjuJKRvNoOEAjEg>
    <xme:iXKrabch9l1qJtHWJTQHvHZxYLrGK7jCn_94apN-vXgLSkC_z-A-wKhOgAcdxJznQ
    4Mg8o8DFMSF-2Hp9qbyhAHcvY_HN9DgpEwdfFjtXy1q8aidleviSro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepudegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhsse
    hjvghtmhdrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholh
    hlrggsohhrrgdrtghomhdprhgtphhtthhopeefudelfeeifedusehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheplhhoohhnghdrtdigtddtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghrihgvlhdrrhhoshgvnhhfvghlugdrjeehtdesghhmrghilhdrtghomhdprhgtphht
    thhopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgh
    hiohhsrghlledtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgs
    ghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgrughoihdrtghhrhhishesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsrghmuhdrthholhhjrghmohesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:iXKraSp1KeibkMB82S65CrHf8a7GQbdY6qHbf7v_U9rqQ_cauzeBuQ>
    <xmx:iXKraViS84k1H5cSTLKDHp3nddr-xyh24FN5IvijQMRODOymnQsbQg>
    <xmx:iXKraUxwfCP8bchItlfVDuB_8uVyxVX81kjHF6jdY4TWadTKQgqd5Q>
    <xmx:iXKraT_okmNH9v74Qb6cNxsCGODAHOMUEB1J4g6iHQYWeaYI18DL5w>
    <xmx:iXKraW09vseMNh4kKCXeoLtRvvADeyxElHAtYiEwmekXdCck4MiaWjd4>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F25D01EA006B; Fri,  6 Mar 2026 19:34:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:35 -0600
Subject: [PATCH 16/18] wifi: mt76: mt7925: fix stale pointer comparisons in
 change_vif_links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-16-c77e7445511d@jetm.me>
To: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>,
 Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Javier Tia <floss@jetm.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=floss@jetm.me;
 h=from:subject:message-id; bh=I+my/0PvchaearqqG/a7SXVT9SRugYd7pzKrmWjv3Dc=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JQa9CQDT7yyw0v7f1AJ1E1OA5S8IgRzwmih
 pYM34spFrKJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyUAAKCRC17sMLqGd3
 HxZVDACn3a8K6Dz+qaREBw5xmpcItg/OXRAr+MFLMeCJUzELSe13b5rXqWTa6qaVJmybeiPNcK0
 X+aLJs2O9CcUc0mA9FmEo7vU3xf4t19OrtzVEP5Ew1Gl6o5zUtlX7loN+cv0s07d6mIbs2RjZbi
 oh9a/sH9seN0pxGbgtj66EKj6ZFKDLaYGs3kUoTibxZUAcwJNoDAahRalcVteiOs+JnVWjuBM9k
 h2UxYjnmqMEBieFmPOCvAz7Ro7rTTBraU2y8ohPKQUmeGD6Z/CB8LPpaux43eY5qtA2RF5YMDRF
 glPTf5aUEKqWzbQQxQs4k6J1cAMMv8WvG3637mrpwoCqc/6ViGQLcijrrT6aHMRK06HhU8FRoRW
 0crNbn5paf9qjSjhLZmfH8T7j1xZIoWciq/1rzK5gIo3iDYLrl6EVtH+ZBC10OQqwKk9A4GsfEn
 /muF5w6HW1l+jicBzIFSlmmW2aTvXwVYb5htNOxrqORb1fSINPJ+b3VlLUDz++VXb9lhE=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163418_526354_AF579FFC 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add MLO support")
Assisted-by: Claude Code <noreply@anthropic.com> (claude-opus-4-6)
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
index 4e1265886f20..f82c56c46324 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2073,9 +2073,9 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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


