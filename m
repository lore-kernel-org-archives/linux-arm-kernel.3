Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67216CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EXvIJELtPeWWNHTJ0QhhxSzR5D/kAxg31WwqT6sMgg=; b=ey4k12rikmPkyVcgGN0kYZvfig
	PZ3laKbd/1SmRF/YO6Sq0iUQjiaouVl8YwvAoeYoZF2i2GhpmvgSPiVysatB4wfIjd57aV+hr1s33
	6eRflAuOxKBaMB9MtDOYnXhdYfkq941X8+BElnFBVtp+jxeUoIBSpfwWAphkQp+feVv+mow/LGxKX
	I+eZkEIk4H9c6mpR852xwDha/u5gVmI0wKlZm85KcD5cS+7ghdsfXA3MmdBq8UVXMpElm71Nxt747
	ZEdJYOCt3rkDoAnlabomqRq84hlcdfE3W7UPHGv2gLgwD0IJ2os/3OX/mzFSa8QVJxPJoeg7fp+q/
	TyX/smIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxlY-000000032FX-18JK;
	Fri, 15 Aug 2025 16:58:56 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuxz-00000002eJS-1EDd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:59:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 862312195F;
	Fri, 15 Aug 2025 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755266364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EXvIJELtPeWWNHTJ0QhhxSzR5D/kAxg31WwqT6sMgg=;
	b=lJhH/Sfjf+B2RjMmx7YRB/6p6bztKPzerfdHEZlqhTn5OFasRGhF5HxIdH+XI9aG3xjxZz
	VM8s4V7xhDwy4hxpRbiYTF1ojaycV7pww7wAsL7aSGXURYn2CkTjwZ3Xuev5DjDjtUsTFA
	cHOWciLzo2+zGYKrL/BPCBRN8yMZ5UU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755266364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EXvIJELtPeWWNHTJ0QhhxSzR5D/kAxg31WwqT6sMgg=;
	b=DFc8jzonk6YYNNXaOgo4mJKXV1hT8vcx5dMZzHf6hBodNHaixr53R3ViWJWqe6kz2/JTTU
	Ix3KkK8BkuzxIYAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="lJhH/Sfj";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DFc8jzon
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755266364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EXvIJELtPeWWNHTJ0QhhxSzR5D/kAxg31WwqT6sMgg=;
	b=lJhH/Sfjf+B2RjMmx7YRB/6p6bztKPzerfdHEZlqhTn5OFasRGhF5HxIdH+XI9aG3xjxZz
	VM8s4V7xhDwy4hxpRbiYTF1ojaycV7pww7wAsL7aSGXURYn2CkTjwZ3Xuev5DjDjtUsTFA
	cHOWciLzo2+zGYKrL/BPCBRN8yMZ5UU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755266364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EXvIJELtPeWWNHTJ0QhhxSzR5D/kAxg31WwqT6sMgg=;
	b=DFc8jzonk6YYNNXaOgo4mJKXV1hT8vcx5dMZzHf6hBodNHaixr53R3ViWJWqe6kz2/JTTU
	Ix3KkK8BkuzxIYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8809313876;
	Fri, 15 Aug 2025 13:59:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPPmHjs9n2jMfAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 15 Aug 2025 13:59:23 +0000
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
Subject: [PATCH 4/5] arm64: dts: rp1: Add ethernet DT node
Date: Fri, 15 Aug 2025 16:59:10 +0300
Message-ID: <20250815135911.1383385-5-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815135911.1383385-1-svarbanov@suse.de>
References: <20250815135911.1383385-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 862312195F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_065935_642542_887E37A4 
X-CRM114-Status: UNSURE (   9.72  )
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

Add macb GEM ethernet DT node.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5002a375eb0b..6bdc304c5f24 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -39,4 +39,20 @@ rp1_gpio: pinctrl@400d0000 {
 			     <1 IRQ_TYPE_LEVEL_HIGH>,
 			     <2 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	rp1_eth: ethernet@40100000 {
+		compatible = "raspberrypi,rp1-gem";
+		reg = <0x00 0x40100000  0x0 0x4000>;
+		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>,
+			 <&rp1_clocks RP1_CLK_SYS>,
+			 <&rp1_clocks RP1_CLK_ETH>,
+			 <&rp1_clocks RP1_CLK_ETH_TSU>;
+		clock-names = "pclk", "hclk", "tx_clk", "tsu_clk";
+		local-mac-address = [00 00 00 00 00 00];
+		status = "disabled";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 };
-- 
2.47.0


