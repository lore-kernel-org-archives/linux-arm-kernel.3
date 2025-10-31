Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D938DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zY0i1hFTvnmr5huB9hek+Pwb38AvUIlNlPpVHaoc8LQ=; b=Lu6WuFZxTFkZGO98iAa9dckcdV
	KyI8QDoWCchfP+HygL+KUXNs+JKRLEVydFVb0Wfa7Lpxy5n69s64hExbZUToyc2sgLp56isaF8DzK
	GHXIwqPjtRrDR5HEcqfehOYoN7tv8DF07nkrWiEJAi1pTZNn+5vfdUK/pN+H0YvTv+zkUjeIPKur7
	AezVKUDQc7uhSHeK3qYPVF7ithg9XqbDj5YohbKTsLrKCy3+c65CPBh+BAKwQhMWEQqDrNEqouAJH
	TfTkdUkqUtO9Y+SPqw8RBZJUb/fz387tT7uJN+pAKEfvhjn1Me6Aqz7Cg1WZ9CmnLpsZXUnVmAEiR
	X+ULuEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmJA-00000005tfO-3ORG;
	Fri, 31 Oct 2025 10:24:36 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmJ8-00000005ter-10bw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:24:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C84911F7F6;
	Fri, 31 Oct 2025 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761906270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zY0i1hFTvnmr5huB9hek+Pwb38AvUIlNlPpVHaoc8LQ=;
	b=K1ATfEJY2wgCmakj9Mn7eXUwOQTo7p8hriAyF8Pp0zIGTbgC0aUW/5WywNukmy3k2wsR6X
	FM8gSuUkWvt8AzfAIl/jL6BIo5w1r4LiXhHJvs5ltWPF39QoLiBFR8HbF3GoDdKlxum7N3
	+kWyWp2yq3IXwo/uOooyi/ty4eD0xik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761906270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zY0i1hFTvnmr5huB9hek+Pwb38AvUIlNlPpVHaoc8LQ=;
	b=FCliQ5k9446MKozyZLYL8ujtLdKji86DJeUhRsZUPnF07kvy9Wq9c5q4gcF72BNyPdxxOI
	bJyumw4j3awSAnBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761906270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zY0i1hFTvnmr5huB9hek+Pwb38AvUIlNlPpVHaoc8LQ=;
	b=K1ATfEJY2wgCmakj9Mn7eXUwOQTo7p8hriAyF8Pp0zIGTbgC0aUW/5WywNukmy3k2wsR6X
	FM8gSuUkWvt8AzfAIl/jL6BIo5w1r4LiXhHJvs5ltWPF39QoLiBFR8HbF3GoDdKlxum7N3
	+kWyWp2yq3IXwo/uOooyi/ty4eD0xik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761906270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zY0i1hFTvnmr5huB9hek+Pwb38AvUIlNlPpVHaoc8LQ=;
	b=FCliQ5k9446MKozyZLYL8ujtLdKji86DJeUhRsZUPnF07kvy9Wq9c5q4gcF72BNyPdxxOI
	bJyumw4j3awSAnBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1600213991;
	Fri, 31 Oct 2025 10:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UwO7A16OBGlqEgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 10:24:30 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH v2 0/4] Add watchdog support for bcm2712
Date: Fri, 31 Oct 2025 12:24:19 +0200
Message-ID: <20251031102423.1150093-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_032434_432765_4AEF0674 
X-CRM114-Status: UNSURE (   9.38  )
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

Changes since v1:
 * 2/4 - add else clause and move $ref inside allOf (Conor).
 * 4/4 - span reg space size to 0x604 (Florian).

Comments are welcome!

regards,
~Stan

Stanimir Varbanov (4):
  pmdomain: bcm: bcm2835-power: Prepare to support BCM2712
  dt-bindings: soc: bcm: Add bcm2712 compatible
  mfd: bcm2835-pm: Add support for BCM2712
  arm64: dts: broadcom: bcm2712: Add watchdog DT node

 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 38 ++++++++++++++++---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  9 +++++
 drivers/mfd/bcm2835-pm.c                      |  1 +
 drivers/pmdomain/bcm/bcm2835-power.c          | 17 +++++++--
 4 files changed, 55 insertions(+), 10 deletions(-)

-- 
2.47.0


