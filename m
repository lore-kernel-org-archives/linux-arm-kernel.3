Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A066B1091929
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvt3lJ9bUn/nS9x0h5+rL6WI6mE1I309IFcyKJoRia4=; b=kPko057482aRrPvfWAhiPu3MhK
	sDQOf4FWVvY61jv+0CDjZBmA/7KuWUojfh2dg6nQ1MyITdlCUAyx0L/rg/erqFzl7cYrf0nIs4w6L
	VSDvajairHiINWubZJCiCDU+y1ZNzf3RqKX9+akMZmZyfrHxGkv7nglNQpKzrC5AbLN9EMMY7tlDu
	34r01sEz/yfh97cHly4VzBJ9sZJpDJXbrvCPqtxkmd/X13d+sSBX9Xu4XXwl63JYjMIH8RxvXoFT0
	NLFUc6emPSxFf1O2bOYpConCY3c7mANf/RA5rtR/q9tinxVuKXNrwbnYZHisVqaMzA55P3G64F1Yj
	in/c74Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ln1-0000000BdME-23sh;
	Thu, 19 Mar 2026 22:24:27 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Lmy-0000000BdL2-2tld;
	Thu, 19 Mar 2026 22:24:26 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 8B0221300092;
	Thu, 19 Mar 2026 18:24:21 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959061;
	 x=1773966261; bh=cvt3lJ9bUn/nS9x0h5+rL6WI6mE1I309IFcyKJoRia4=; b=
	R8Mv7Cx5F4KphjYg5Te06q3GICfi1OVK0mA6wu+CWFeZihur3s9HMXXJbyj+4/OU
	S8obxUz4xPrnTTL376SDOwyl+zqHmnu+eA3p0hHLPi1S8VnLx19xGTXAdT910Vu8
	Tf8B9cCzIuDezYjjkIKhwTfbKpSszn3HS7Uc0cJcIj5UJHwYLoKJfffywv3lUIz1
	UBKGMIgDbTEWmQ64k6jTjwkezW5PI2KM0sc4krVr2vcKISOfJmmm0kzcWS6XEdA1
	zjSRxjtrNNyL7k/WAKXCfq5jgZhTTGA4yBfZGzX9hdwH4gHRwDNoVrrtzWa8504/
	4etlxOI+enFMOcnT7xTeBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959061; x=
	1773966261; bh=cvt3lJ9bUn/nS9x0h5+rL6WI6mE1I309IFcyKJoRia4=; b=H
	5hw9ndQf3J0zoni9OhrC8aICkuhLQj+lEH553Pca5iGA6rGyxxW+2YkwEJ1OUSwB
	B5ye0M6bOO72D9Oj7A2PfranAbJhEdP3npU8wydqQkdgIjTgbCmzrqPkvOOBowYf
	uI0b4bmpLKSm16/Xlrbnn3Fik+1+WOpxz+3rc132feRT/t4SqNKrPc7CDFjLmEHP
	ZPipPyaca+sfRJ3q4JwGk8sNDPAxlWt+/+hSwSowsoyWMTFKyuMbPhcz5/NqQMO0
	1IffJHV+6y9sD1dQgDDq/UvAyLCAaBxizhhT/hHrcDQ8+Ad2LTZnjHXdd89Y3RgD
	9r0RZ+WZTUPjHKmV3LZYw==
X-ME-Sender: <xms:lXe8aRq7XXfH62QHG1Eo6iVXYvp7W3MbWSJzPwoGig-Ti9paUopnCQ>
    <xme:lXe8aefZiOzCc19OsoPrapH62OLeItba1m5Gs3fPFxL1Yk2SSzNQGqBiS4Bv_MUDk
    GyZbWbwht8JvuIR2xUOd4Kk62HvGaKgiv1owF1pkJG4qAg_7NoC9iI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:lXe8afbhmW4q_w2VNssGoXD64Fu-Rje7qStDCBkVK2ovPU0b8t5h5A>
    <xmx:lXe8abmQiBF7Ca2e0IrSkFtBDDilqxZpTuzK6k0apiJZ_T_5dP8ycg>
    <xmx:lXe8aWdNb_n4ZPD5J-Yb1jX0Me0DgRjWNFGvLmg168FqZ6wCl3qQKw>
    <xmx:lXe8aR2Gq_ZlhS02e-GuN64H8kykrSdLhfjBjOmkIturyVUpheCFQw>
    <xmx:lXe8adR1q8Aduma-lGb37yWLie2Zne4817MU72grsMo6idwHm94gcYvH>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B15C1EA006C; Thu, 19 Mar 2026 18:24:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:17 -0600
Subject: [PATCH v2 01/13] wifi: mt76: mt7925: fix stale pointer comparisons
 in change_vif_links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-1-d627a7fad70d@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=floss@jetm.me;
 h=from:subject:message-id; bh=DizT/ddlZFD7KX9YeoKrBVdFFWkgs3dXjw0pBgdRG1k=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeQLAEYKacw2gZHHInwwSGuqAs3PNfX4ugdx
 LEsTNqv5OKJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kAAKCRC17sMLqGd3
 H1fBC/9KPA6rElLV7oP7qIWoscZFIglo65pC1Yw08WqMN2abP1gEhVtoJbclzmn8uI6zNhWugmU
 hNyWMAOiZUWPUzPqOTSwIQA81ELfLR9OTDsvl+eRHLajkpCEG1ZtuMO7NSVCyQHmkTs6PpV3ssj
 GOBGfmpa3mvh0AO2zigkyJdBAH1fqqfF1/83LIFyOHaYuwISvO590gIpEy6fdiwbc+RiRX2VsVP
 21lben5hTemr/aw7RaNi+GfLxAk4tW4137GJ1ntChEZNly/Er11cmPAFU+kss3dA7aA2BfYIDqw
 qmx0u/oLIPm354fc0cwywEA7d/31VOTQfGmGPw+gYnsHJBSq7wrYpt69U3ZlLlkaKETCirvdEA2
 pANymSKkjudeTsABKSwKypSjAck/35IJUieqA2tDOvlsraWsByxwnM38lan6q4CjJb8YFzxhL2S
 AK5Z7tl0sCKRmanvjr6mWMdXZ4jlFrv/Wol0iuiDS//QTsLFiZOsnnhUfRXqj+TmpJzu0=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152424_913896_5C0AA706 
X-CRM114-Status: UNSURE (   9.70  )
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


