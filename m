Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468FFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eUeUWPqGxjDLTTrsBqDXhi7dC+CwV/JeiH2/GL5wANY=; b=cCR1zoRQpZ26c2t4JYKehcU0RC
	5AuwlRVh3tN2DXJbOxWP4I6X25RN6m1Y5DgNFOZPCnFag6Mra8gecTxXf/lKwBT6pPHxccfdTqi3T
	w19HAuG2NcAXPimz+OcIxtAQ64otdEK3Pu5P+esML76mCPOqgsNliQKspSxThzXdd8llstH1y6V8t
	nD44Nfd+79CAZWkgNNOuVZfMx1O8b30jRTAvF3fhDcSetJj4+XY5ktqcuoXO3eFpycm6wLJaleEmz
	tnXrs0pUanj04UCHDfnFCArMGs12WK1XNKsPfvBkfQyIN4h7TpjQydxaH5SsuhAkmuVWJyjlOECAc
	dskmbj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwsy-00000002vLi-31t9;
	Fri, 15 Aug 2025 16:02:32 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuxn-00000002e9d-0u6p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:59:24 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C4EB1F83E;
	Fri, 15 Aug 2025 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755266360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eUeUWPqGxjDLTTrsBqDXhi7dC+CwV/JeiH2/GL5wANY=;
	b=2OYHYrMCky0gEl8GEezjU1lUB+6+cS+kSYJdzxHCgzpm/3AN3J4f433JAvwLltLML9MajP
	XHxAYGo5IjNAwP47zmC1WXVej09JlHzeIsIOL/ihBepuwOSVeAI+tvbGlJqee4jdz2xZfu
	FOARBUryNCgVauyQDq5EDARCsJ4TzuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755266360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eUeUWPqGxjDLTTrsBqDXhi7dC+CwV/JeiH2/GL5wANY=;
	b=WIaR5XEVxmwG3WY3qg4JTxvyQfD/LMJD3zAaScABW3C0EC+7HQ6FnG05xV6woKEnHqGh8l
	wBhRCWoro32gLsBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2OYHYrMC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WIaR5XEV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755266360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eUeUWPqGxjDLTTrsBqDXhi7dC+CwV/JeiH2/GL5wANY=;
	b=2OYHYrMCky0gEl8GEezjU1lUB+6+cS+kSYJdzxHCgzpm/3AN3J4f433JAvwLltLML9MajP
	XHxAYGo5IjNAwP47zmC1WXVej09JlHzeIsIOL/ihBepuwOSVeAI+tvbGlJqee4jdz2xZfu
	FOARBUryNCgVauyQDq5EDARCsJ4TzuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755266360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eUeUWPqGxjDLTTrsBqDXhi7dC+CwV/JeiH2/GL5wANY=;
	b=WIaR5XEVxmwG3WY3qg4JTxvyQfD/LMJD3zAaScABW3C0EC+7HQ6FnG05xV6woKEnHqGh8l
	wBhRCWoro32gLsBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2642013876;
	Fri, 15 Aug 2025 13:59:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z1sKBzc9n2jMfAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 15 Aug 2025 13:59:19 +0000
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
Subject: [PATCH 0/5] Add ethernet support for RPi5
Date: Fri, 15 Aug 2025 16:59:06 +0300
Message-ID: <20250815135911.1383385-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[dt,netdev];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 3C4EB1F83E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_065923_397953_76F29906 
X-CRM114-Status: GOOD (  11.27  )
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

Hello,

Few patches to enable support of ethernet on RPi5.

 - first patch is setting upper 32bits of DMA RX ring buffer in case of
   RX queue corruption.
 - second patch is adding a new compatible in cdns,macb yaml document
 - third patch adds compatible and configuration for raspberrypi,rp1-gem
 - forth and fifth patches are adding and enabling ethernet DT node on
   RPi5.

Comments are welcome!

Regards,
~Stan

Dave Stevenson (2):
  dt-bindings: net: cdns,macb: Add compatible for Raspberry Pi RP1
  net: cadence: macb: Add support for Raspberry Pi RP1 ethernet
    controller

Stanimir Varbanov (3):
  net: cadence: macb: Set upper 32bits of DMA ring buffer
  arm64: dts: rp1: Add ethernet DT node
  arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5

 .../devicetree/bindings/net/cdns,macb.yaml     |  1 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts      | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi   | 16 ++++++++++++++++
 drivers/net/ethernet/cadence/macb_main.c       | 17 +++++++++++++++++
 4 files changed, 52 insertions(+)

-- 
2.47.0


