Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84338C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 18:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4SzYn/LOBe00JITEFR1EWG230FJHt5O0ZhtyKRSn6E=; b=xr5sxIt1ok/naUz2g4W1wrmjO/
	Rruztb6k1XVfCZa8ajfq2LKM68tGrZDIs2dYDONfNYWYIBB/IB4DF6Jp/x7DAaWqdvMkb1k9Z2HGV
	Vp59kh6iUslPtBRQZdUjtLqjBI67Mhhm5xFDQwUcZbuclCT++Nr+4e52hCPTIQVxi2Ywb2eFiYZvi
	p2+/VCaymxWxCiznae/Qky2WJV69EzhBIB5MNSnj/GAlr1po/gZqFWdfTsE4WOwCQ1ukjTtPc1ojF
	Mcy8nLT7GoUb6TBRALaBM2m2cqN6Iz4v2tkU6+Tij1ve39EpETHP1l4+9d+PFQL0JNUa4+s5cr9nP
	zqGNzfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hk5-00000005RQf-2mun;
	Sun, 06 Sep 2026 18:37:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hjp-00000005QzD-0of8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D0BE4485C;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F83CC2BCFB;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=fDGXcEDT3HqF7GbnuemiQmkxSZ1c6I8Yl9AH275YygI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NPWSSUl63IvbiOxVy/1rr2KtoUGQ4IBzU6SEayuDmAopAZua4hXc+wOja6OMXtHqr
	 jlWzJrTTE84ehhZD8eGqW6Ia8pQbNy8Qlrfg6wd67DawuciCxF8kvKwcg5aXzrAzxh
	 Cj+m4Rfb7VFJxQDUNsDw8Xf0upUo4+T9U4O0vh6N8xSKXtK3xgLjmy8jkgDC5RmR0n
	 i1AWUz0pxF4trTPQwU3UFxDUqOlS7yU12+EBy7vC5JMebym/Zrz8KSrzaGtmx+3e+9
	 /8ldgAULkLCLumcbAqbK8z3SBYgoK3nx2KkYrqDnPUyYmxFyEkDvbnpi5civo/A3Ff
	 SEytJfBU6ee2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB8CC79FA3;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:40 +0200
Subject: [PATCH v2 17/22] thunderbolt: Add QUIRK_NO_USB3_BW_ALLOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-17-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5725; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=fDGXcEDT3HqF7GbnuemiQmkxSZ1c6I8Yl9AH275YygI=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTSd6n359+r+wNKPT5rnF9h+s6ufjKyWNd51k8AxeN
 evYxzSPjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEHv1n+F/0wOPYya1eL+Yt
 V/nH03jl63zesxHza0MsZ+57ZCIZ67mF4Q+H7uuzvVqnIw7ZmE3axb927nLJsBgjo5VeXP9btb8
 ml7EDAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The host routers on Apple Silicon do not implement USB3 bandwidth
allocation registers: the CMR bit set in ADP_USB3_CS_2 by
usb4_usb3_port_cm_request() is never acknowledged and every USB3 tunnel
bringup fails there after the timeout:

  [   49.259325] thunderbolt-apple-nhi 501f00000.nhi: 1:16: available bandwidth for new USB3 tunnel 18000/18000 Mb/s
  [   49.265869] thunderbolt-apple-nhi 501f00000.nhi: 1:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
  [   49.267894] thunderbolt-apple-nhi 501f00000.nhi: 0:4 <-> 1:16 (USB3): activating
  [   49.269410] thunderbolt-apple-nhi 501f00000.nhi: 0:4 <-> 1:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
  [   50.771764] thunderbolt-apple-nhi 501f00000.nhi: 1:16: USB3 tunnel activation failed, aborting

Add a quirk to skip bandwidth allocation entirely but keep tracking
the initial allocation in software for the consumed bandwidth
calculation. For completeness, discovered tunnels book 90% of the
maximum link rate in software, matching tb_tunnel_alloc_usb3(), although
Apple Silicon cannot have any pre-existing tunnels.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/quirks.c |  9 +++++++
 drivers/thunderbolt/tb.h     |  2 ++
 drivers/thunderbolt/tunnel.c | 60 +++++++++++++++++++++++++++++---------------
 3 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 9f7914ac2f48..2ac1bfa01c15 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -46,6 +46,12 @@ static void quirk_usb3_maximum_bandwidth(struct tb_switch *sw)
 	}
 }
 
+static void quirk_no_usb3_bw_alloc(struct tb_switch *sw)
+{
+	sw->quirks |= QUIRK_NO_USB3_BW_ALLOC;
+	tb_sw_dbg(sw, "disabling USB3 bandwidth allocation\n");
+}
+
 static void quirk_block_rpm_in_redrive(struct tb_switch *sw)
 {
 	sw->quirks |= QUIRK_KEEP_POWER_IN_DP_REDRIVE;
@@ -61,6 +67,9 @@ struct tb_quirk {
 };
 
 static const struct tb_quirk tb_quirks[] = {
+	/* Apple Silicon host routers do not support USB3 bandwidth allocation */
+	{ 0x05ac, 0x2000, 0x0000, 0x0000, quirk_no_usb3_bw_alloc },
+
 	/* Dell WD19TB supports self-authentication on unplug */
 	{ 0x0000, 0x0000, 0x00d4, 0xb070, quirk_force_power_link },
 	{ 0x0000, 0x0000, 0x00d4, 0xb071, quirk_force_power_link },
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index fbd1a0a9927a..7c2fcf20e49f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -26,6 +26,8 @@
 #define QUIRK_NO_CLX					BIT(1)
 /* Need to keep power on while USB4 port is in redrive mode */
 #define QUIRK_KEEP_POWER_IN_DP_REDRIVE			BIT(2)
+/* Does not support USB3 bandwidth allocation */
+#define QUIRK_NO_USB3_BW_ALLOC				BIT(3)
 
 /**
  * struct tb_nvm - Structure holding NVM information
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 7e8284575dff..0893ec19d606 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2268,24 +2268,41 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
 	if (!tb_route(down->sw)) {
 		int ret;
 
-		/*
-		 * Read the initial bandwidth allocation for the first
-		 * hop tunnel.
-		 */
-		ret = usb4_usb3_port_allocated_bandwidth(down,
-			&tunnel->allocated_up, &tunnel->allocated_down);
-		if (ret)
-			goto err_deactivate;
+		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
+
+		if (down->sw->quirks & QUIRK_NO_USB3_BW_ALLOC) {
+			/*
+			 * The host router does not implement the bandwidth
+			 * allocation registers and nothing can be read back
+			 * here. Book 90% of the maximum link rate in software
+			 * instead.
+			 */
+			ret = tb_usb3_max_link_rate(tunnel->dst_port, down);
+			if (ret < 0)
+				goto err_deactivate;
+
+			tunnel->allocated_up = ret * 90 / 100;
+			tunnel->allocated_down = tunnel->allocated_up;
+		} else {
+			/*
+			 * Read the initial bandwidth allocation for the first
+			 * hop tunnel.
+			 */
+			ret = usb4_usb3_port_allocated_bandwidth(down,
+								 &tunnel->allocated_up,
+								 &tunnel->allocated_down);
+			if (ret)
+				goto err_deactivate;
+
+			tunnel->pre_activate = tb_usb3_pre_activate;
+			tunnel->release_unused_bandwidth =
+				tb_usb3_release_unused_bandwidth;
+			tunnel->reclaim_available_bandwidth =
+				tb_usb3_reclaim_available_bandwidth;
+		}
 
 		tb_tunnel_dbg(tunnel, "currently allocated bandwidth %d/%d Mb/s\n",
 			      tunnel->allocated_up, tunnel->allocated_down);
-
-		tunnel->pre_activate = tb_usb3_pre_activate;
-		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
-		tunnel->release_unused_bandwidth =
-			tb_usb3_release_unused_bandwidth;
-		tunnel->reclaim_available_bandwidth =
-			tb_usb3_reclaim_available_bandwidth;
 	}
 
 	tb_tunnel_dbg(tunnel, "discovered\n");
@@ -2365,12 +2382,15 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 		tunnel->allocated_up = min(max_rate, max_up);
 		tunnel->allocated_down = min(max_rate, max_down);
 
-		tunnel->pre_activate = tb_usb3_pre_activate;
 		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
-		tunnel->release_unused_bandwidth =
-			tb_usb3_release_unused_bandwidth;
-		tunnel->reclaim_available_bandwidth =
-			tb_usb3_reclaim_available_bandwidth;
+
+		if (!(down->sw->quirks & QUIRK_NO_USB3_BW_ALLOC)) {
+			tunnel->pre_activate = tb_usb3_pre_activate;
+			tunnel->release_unused_bandwidth =
+				tb_usb3_release_unused_bandwidth;
+			tunnel->reclaim_available_bandwidth =
+				tb_usb3_reclaim_available_bandwidth;
+		}
 	}
 
 	return tunnel;

-- 
2.55.0



