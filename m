Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQyYlCFSCFKmwco3eE+KC4eUxSyLW/tniSiDEiBpUBg=; b=Fehc8bg4TguhEwK0sH6viLFoRG
	ZJmja/B0K2/5wxeG2+m3dZmKlSenCcUyl6LKRyr+1WlyI6f0GqX1Cmsfx+z77sKqdgKmf6NrXCbl8
	iKnCPfQaiMD+DhYmO7Owmtag8ys2YHRRPpLA30dDPlD2Vwy6B5oyjlQDirN1XgWsAZtlVMPnZYDwL
	GexGjhi/IOf4ii0nsvk9HsWePQlMfIaT/kmMAU/deyeHtOhRb4nD7bmeARoVl7i5tu3sQNeVLSQGc
	/55R52hxmejqughnEAtwT7JXD6bqd0bL0FnCNeAZK6LfOKRDxDZ1yLKFFFSmmodk6oRmaX0yYImyw
	WByHw3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZV-0000000GTLC-0V3X;
	Tue, 05 May 2026 14:16:25 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZS-0000000GTKI-28Mo;
	Tue, 05 May 2026 14:16:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wKGZK-000000008Qu-3Q6t;
	Tue, 05 May 2026 14:16:14 +0000
Date: Tue, 5 May 2026 15:16:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 1/5] net: dsa: mt7530: fix FDB entries not aging out with
 short timeout
Message-ID: <f285707e09a0febffd1b987f204ff4eb71736489.1777986341.git.daniel@makrotopia.org>
References: <cover.1777986341.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777986341.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_071622_544837_87B9A497 
X-CRM114-Status: GOOD (  13.54  )
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

When setting a low ageing time such as 10 seconds, the algorithm in
mt7530_set_ageing_time() finds AGE_CNT=0 and AGE_UNIT=9 as the first
exact match (starting the search from tmp_age_count=0).

On the MT7530/MT7531 hardware, the per-entry aging counter is
initialized to AGE_CNT when a MAC address is learned. With AGE_CNT=0,
new entries start with a counter value of 0, which the hardware treats
as "already aged" and never removes, effectively disabling aging.

Fix this by starting the search from tmp_age_count=1 to ensure entries
always have a non-zero initial aging counter. For a 10-second ageing
time this yields AGE_CNT=1 and AGE_UNIT=4 instead: the timer ticks
every 5 seconds and entries are removed after 2 ticks.

Fixes: ea6d5c924e39 ("net: dsa: mt7530: support setting ageing time")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 44d670904ad8..b1903da7d500 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1027,8 +1027,12 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
 		return -ERANGE;
 
-	/* iterate through all possible age_count to find the closest pair */
-	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
+	/* Iterate through all possible age_count values to find the closest
+	 * pair. Start from 1 because the per-entry aging counter is
+	 * initialized to AGE_CNT and a value of 0 means the entry will
+	 * never be aged out.
+	 */
+	for (tmp_age_count = 1; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
 		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
 
 		if (tmp_age_unit <= AGE_UNIT_MAX) {
-- 
2.54.0

