Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D35CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anGsl/cvliycUtThHm5QtvhBocjLDjCTYF6O+RQJC+o=; b=mPKwELO4e13r6BtbuqqGOtvmxy
	16tpuUBXVh48gjgjxMqCBOs29jqIe3VTsxvfwOwxDa7uZb60Ye1vxjFK/fyxfcujfq5JpTtBa55Bu
	Sg4C2ID+TTDDcOwHmLHZ/GFzkEuzo/XA6f66eYaG7drHkELQs1OdpLR08ztIWI/c66g+fplleRzPD
	V1+dr4bFEVBEcBB2rDolR30tHiYA1wTZkF7y5eKoGAEWJLm7AlSckJEv/i4kv4k4uX+dTOt1ptkN2
	nxlUOPknNlb0XneH/6FyZpmo82EVZccZjPgkLpxnE1QrXXlW/ZgdvOe3VBqRuzTVtZ2oc75vTifaR
	qs0j0YOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxlY-000000032Fz-3rnM;
	Fri, 15 Aug 2025 16:58:56 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuy4-00000002eN6-1EWC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:59:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AEE52124F;
	Fri, 15 Aug 2025 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755266365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anGsl/cvliycUtThHm5QtvhBocjLDjCTYF6O+RQJC+o=;
	b=of2qZcvsKcOHurRSlUypk85U7NzPfCa/13IB0XDfUBynGMGmuNStdfixTSM4/UaP4sakU+
	1/L8Dk2h7inDdp3HZ/ck7CNuJkiENbSNp4iqZHTIRL5UVxWRmpJ9vB+NvokTDYaxVhoj9f
	WcdRzhtHU/JE/Vj1RzIoWE57VyUcg4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755266365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anGsl/cvliycUtThHm5QtvhBocjLDjCTYF6O+RQJC+o=;
	b=gbC3FqKXaYDW/K4zQn4jdvRElGUYd1VYQCaYeqYZ34yZ/u3uaPbJUNWA2g9mkCBTxlKGAf
	kJ5aha3qhSpnbkAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=of2qZcvs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gbC3FqKX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755266365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anGsl/cvliycUtThHm5QtvhBocjLDjCTYF6O+RQJC+o=;
	b=of2qZcvsKcOHurRSlUypk85U7NzPfCa/13IB0XDfUBynGMGmuNStdfixTSM4/UaP4sakU+
	1/L8Dk2h7inDdp3HZ/ck7CNuJkiENbSNp4iqZHTIRL5UVxWRmpJ9vB+NvokTDYaxVhoj9f
	WcdRzhtHU/JE/Vj1RzIoWE57VyUcg4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755266365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anGsl/cvliycUtThHm5QtvhBocjLDjCTYF6O+RQJC+o=;
	b=gbC3FqKXaYDW/K4zQn4jdvRElGUYd1VYQCaYeqYZ34yZ/u3uaPbJUNWA2g9mkCBTxlKGAf
	kJ5aha3qhSpnbkAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 954A113A8B;
	Fri, 15 Aug 2025 13:59:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AMo2Ijw9n2jMfAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 15 Aug 2025 13:59:24 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 5/5] arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5
Date: Fri, 15 Aug 2025 16:59:11 +0300
Message-ID: <20250815135911.1383385-6-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815135911.1383385-1-svarbanov@suse.de>
References: <20250815135911.1383385-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt,netdev];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLw7mkaud87zuqqztkur5718rm)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 8AEE52124F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_065940_503388_CFC30320 
X-CRM114-Status: GOOD (  10.10  )
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

Enable RP1 ethernet DT node for Raspberry Pi 5.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index a70a9b158df3..c70d1cb7f3b6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -23,3 +23,21 @@ &pcie1 {
 &pcie2 {
 	status = "okay";
 };
+
+&rp1_eth {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy1>;
+
+	mdio {
+		reg = <0x1>;
+		reset-gpios = <&rp1_gpio 32 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <5000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy1: ethernet-phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
-- 
2.47.0


