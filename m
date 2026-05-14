Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAECACD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxDmT0r7TaLqOgEr9jqjLgSkqCD4Eh59UUZmwTP5K8Y=; b=wBDya5JKWbPq9aZsaoN5cfq9EL
	voo+/b9BER4ecFIywvv4Y7fXkmV8X5gOMFSXZgc6Ty8wUCgRNJXNW1R8mD3KgztON8G3cRFQSiDL1
	eVr/gkhZ7kJB9+uJXSrT0u0+hPqQ/J69FT0djNmU4afck+1jQ5UdPjiiW8ljqfYmQWnAu/SzeAb0M
	VNzKP4H9q3yFlIgbFc2tzuQlB/ekYBZHlLkfPnx2un3X8DlMVGy4eDgMDLDeKUuQjFgoOCepvD7Bw
	Knu6QXqUeqO+EAKoNYYCH/RVhM5SH0cypdAk/eFPfB4TSuscGIRH6FVzxPLV3YLcrMCm0nVB72t1V
	EXS/9W9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWfz-00000005eqx-1m4X;
	Thu, 14 May 2026 14:04:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWfu-00000005eoi-1UF0;
	Thu, 14 May 2026 14:04:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wNWfo-00000000448-26bb;
	Thu, 14 May 2026 14:04:24 +0000
Date: Thu, 14 May 2026 15:04:21 +0100
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
Subject: [PATCH net v2 1/5] net: dsa: mt7530: fix FDB entries not aging out
 with short timeout
Message-ID: <7788ded12dc07b1bce329ec35fa70f4b45f3f9b7.1778766629.git.daniel@makrotopia.org>
References: <cover.1778766629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778766629.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_070430_393115_3FADD3F7 
X-CRM114-Status: GOOD (  17.97  )
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

The DSA forwarding selftests bridge_vlan_aware.sh and
bridge_vlan_unaware.sh configure the bridge with ageing_time set to
LOW_AGEING_TIME (1000 centiseconds, i.e. 10 seconds) and then run
learning_test() in lib.sh, which expects a learned FDB entry to be
removed after ageing_time + 10 seconds. On MT7530/MT7531 the entry
persisted past the deadline and the "Found FDB record when should
not" assertion failed.

With msecs=10000, the algorithm in mt7530_set_ageing_time() finds
AGE_CNT=0 and AGE_UNIT=9 as the first exact match (starting the
search from tmp_age_count=0). The per-entry aging counter is
initialized to AGE_CNT when a MAC address is learned, so with
AGE_CNT=0 new entries start with a counter value of 0, which the
hardware treats as "already aged" and never removes, effectively
disabling aging.

Fix this by starting the search from tmp_age_count=1 to ensure
entries always have a non-zero initial aging counter. For a
10-second ageing time this yields AGE_CNT=1 and AGE_UNIT=4 instead:
the timer ticks every 5 seconds and entries are removed after 2
ticks.

Starting the search at AGE_CNT=1 raises the minimum representable
ageing time from 1 to 2 seconds. Without bounds, a stale ageing_time
of 1 second would now make the loop fall through without setting
age_count and age_unit, leaving them uninitialized when written to
the MT7530_AAC hardware register. Set ds->ageing_time_min and
ds->ageing_time_max so the DSA core validates the range before the
callback is invoked, and drop the now-redundant range check from
mt7530_set_ageing_time().

Fixes: ea6d5c924e39 ("net: dsa: mt7530: support setting ageing time")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2:
 - Set ds->ageing_time_min = 2 * 1000 and
   ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000
   in mt7530_setup() and mt7531_setup_common() so the DSA core
   rejects out-of-range values before calling the driver.
 - Drop the now-redundant `if (secs < 1 || ...)` range check from
   mt7530_set_ageing_time(); v1 left it in place and would have
   written uninitialized age_count/age_unit to MT7530_AAC for
   secs == 1 (loop falls through without ever finding a match
   once tmp_age_count starts at 1).
 - Reworked commit message to lead with the bridge_vlan_aware.sh /
   bridge_vlan_unaware.sh learning_test() scenario that exposes
   the bug, walk through the search-loop math for LOW_AGEING_TIME
   (10 s), and document the new lower bound.

 drivers/net/dsa/mt7530.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 44d670904ad8..cd311dfd3600 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1023,12 +1023,16 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 	unsigned int age_count;
 	unsigned int age_unit;
 
-	/* Applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds */
-	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
-		return -ERANGE;
-
-	/* iterate through all possible age_count to find the closest pair */
-	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
+	/* Applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds.
+	 * The DSA core has already validated the range using
+	 * ds->ageing_time_min and ds->ageing_time_max.
+	 *
+	 * Iterate through all possible age_count values to find the closest
+	 * pair. Start from 1 because the per-entry aging counter is
+	 * initialized to AGE_CNT and a value of 0 means the entry will
+	 * never be aged out.
+	 */
+	for (tmp_age_count = 1; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
 		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
 
 		if (tmp_age_unit <= AGE_UNIT_MAX) {
@@ -2428,6 +2432,8 @@ mt7530_setup(struct dsa_switch *ds)
 
 	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
+	ds->ageing_time_min = 2 * 1000;
+	ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;
 
 	if (priv->id == ID_MT7530) {
 		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
@@ -2617,6 +2623,8 @@ mt7531_setup_common(struct dsa_switch *ds)
 
 	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
+	ds->ageing_time_min = 2 * 1000;
+	ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;
 
 	mt753x_trap_frames(priv);
 
-- 
2.54.0

