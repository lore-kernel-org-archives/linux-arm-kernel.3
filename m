Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95EFCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w8K4Di+TZqJGeQ9KtefzzYJDRnJQ8lETdLbz+OS9Z8k=; b=e8CLBUHIQwAUknFH/ULYxFyXje
	x0GSaToHI+9uf3jv6eMox5okzGN/8hpVpIxymNvWnoL0svC6dTVANahBxj1059zIRKZTyJD+i0L6D
	Utz5AOqhpNkbwFR8UkQBf5tbq/YfJ42kjFdoEUQz4zjSnX+dJgHgHtwtxPysxvcacGL1zN+XYLm18
	pb9KaOURsSSWGI+jWGplWLl9sLQ0Vgyr2dGJzEyPavzjDOeyJ9JZfl1hxUx7tgCtA/NQM+cj/4JtK
	TnGz8ja2wI60zXl9yb2XyZd9dDK0ktwpPLxayLJh/wwJ0Dw5qAuhL9meCQBUZGyYFpWjNR74wur1K
	ttpM9O/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZbS-00000003Xg5-40M4;
	Fri, 22 Aug 2025 21:47:19 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOAy-000000023xS-3uj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:35:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4F741F38E;
	Fri, 22 Aug 2025 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755855309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8K4Di+TZqJGeQ9KtefzzYJDRnJQ8lETdLbz+OS9Z8k=;
	b=Jpx7TfgQD3LLv427Zjr/QW2NdVqj+Wb4P4cnkQVBrS5vX5vHuK9VLVLDlsWS8lDPZ3IT3L
	xNe+dSfyh2ziAB+O/qdovrlpW6maVum0GQD/R91IgK6fEkoxTVd1TIYVsxELGK3au5aJst
	N+hfNcylMSdF8vhKRbCuVJ1lFc/zKg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755855309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8K4Di+TZqJGeQ9KtefzzYJDRnJQ8lETdLbz+OS9Z8k=;
	b=mGf/scZ3dMXHqk/8rGPyOrCWWiPWdFZp2Kb6RWmbBa1GGbCBHiyuZ9mbfT20j/mep9cpcU
	yK1k7muhbIpaSoCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755855309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8K4Di+TZqJGeQ9KtefzzYJDRnJQ8lETdLbz+OS9Z8k=;
	b=Jpx7TfgQD3LLv427Zjr/QW2NdVqj+Wb4P4cnkQVBrS5vX5vHuK9VLVLDlsWS8lDPZ3IT3L
	xNe+dSfyh2ziAB+O/qdovrlpW6maVum0GQD/R91IgK6fEkoxTVd1TIYVsxELGK3au5aJst
	N+hfNcylMSdF8vhKRbCuVJ1lFc/zKg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755855309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8K4Di+TZqJGeQ9KtefzzYJDRnJQ8lETdLbz+OS9Z8k=;
	b=mGf/scZ3dMXHqk/8rGPyOrCWWiPWdFZp2Kb6RWmbBa1GGbCBHiyuZ9mbfT20j/mep9cpcU
	yK1k7muhbIpaSoCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB6BE139B7;
	Fri, 22 Aug 2025 09:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 79ZjL8w5qGihMAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 22 Aug 2025 09:35:08 +0000
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
Subject: [PATCH v2 0/5] dd ethernet support for RPi5
Date: Fri, 22 Aug 2025 12:34:35 +0300
Message-ID: <20250822093440.53941-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,spinics.net:url];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[dt,netdev];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023513_121894_93FD4410 
X-CRM114-Status: UNSURE (   9.04  )
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

Hello,

Changes in v2:
 - In 1/5 updates according to review comments (Nicolas)
 - In 1/5 added Fixes tag (Nicolas)
 - Added Reviewed-by and Acked-by tags.

v1 can found at [1].

Comments are welcome!

regards,
~Stan

[1] www.spinics.net/lists/netdev/msg1115266.html

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
 drivers/net/ethernet/cadence/macb_main.c       | 18 +++++++++++++++++-
 4 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.47.0


