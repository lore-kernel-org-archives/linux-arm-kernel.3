Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=; b=prFDeb0FMZ7MypshS8fom5qT/f
	/+2cJ+eXgSLq4QhuFtzUb1JFAFv+5Cl93ZWBmjoYqRxxn+b7mJ/3EP+KCGcEW3hPE4yDaJPxiaZ60
	V+EBAVh4UNYGA5aiK4x6JDptRdUj/yyNLYa8ZukfX4uvZLVbZYMJfoUIMWt+pKI2N/PJrvj39ad3T
	sMWg1GVt5EjFQ9gofa9KN4rsPgLUa2yrqHgHRau2RKIjI5yE+WDjFt/qHE23805colcAqN6beAlAQ
	bcyoMTD6YcEvmu6OCCPv+6NRCOnrLMwRUJKV8Uz3XE41L0mhAFbQSZPZ/WsCrWWcO5nepsRIOxUAT
	31cY6Zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmJY-00000005toL-49tY;
	Fri, 31 Oct 2025 10:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmJV-00000005tmd-1ygC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 10:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=; b=fgdgGitYdJE9nKvH7JKzYDls1S
	Z/j2V5GxpGAo2pIgP6ycd5zOTe/xym8kZzYNPQ6EcVEJkZf+cfk52yJB56kYsR3vKyCLZwiRCQjYV
	IW5LJLVJSE1ezk5/S4KxymCOJTa3rc1O5b2vUNQ+RYLHK/LRZWndqlQ0O58lrAN2VWEbwEawymnhD
	7KfvY8FLfbHq3AX2xQ16pucz76n1CANqEKfNo6jI/QKVoW/HDJnlE9EZiSf1IFa5LdmaihS2OUvLM
	l5Gte21EpCBU1UutFEsUnVzDtAKFu0O+3iKQeyluwuI1v81uiOGT5PZd+SJEbIfiWh/8pTKUYhj+O
	CJfGKhCQ==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElRj-0000000B1IS-0rqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:29:25 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B08A22003;
	Fri, 31 Oct 2025 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761906274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=O5UZFdFL24kPXAc/Eq+iDS4umBYxWpRJIe/gFyDCTeCUdax87Wo9Jtg93uIL+lKw8uwFap
	gJ4IbTe8R4QC5/9TdTkbzq0sUKBCh/zuEXqM3p/B0QgBYmtvNyBGCIfiKJUqqR7y7mhyIG
	E7hBkOFQrx/yrVci3LwtVVjnytR7OR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761906274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=5CSIKl8PX2d4Q5AAA8ug0fAN9qwgTQD9Is7UbKNCAvqSAXlVZVW6tLli/ruoORsfZW8QnA
	OJk2a3no8LarumCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761906273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=ynmFKMkkkS37BuO1Twi6pN2gXFlZNx1h5pbiUqqQ6La0mdRI10n+qVgbjPMbpAK6AvaXE4
	v3WYsj0RDbdAa7RBWhA50pmuToKLJbKkCQBfcl3Wv4vii2a23UeX4yKc90KfacZhQDBHTm
	UJJU0vgUK3YZhpbZShWMAnzRrWAbNmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761906273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=73hwmyAc76PAoujBSO3iW4vFjcO3FWXXFKdOMFbAcD4qsLk1PQb2+KGiX3H3EDGdIYAail
	3eYog3EmgRgfKFAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF41413991;
	Fri, 31 Oct 2025 10:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WMXbOGCOBGlqEgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 10:24:32 +0000
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
Subject: [PATCH v2 4/4] arm64: dts: broadcom: bcm2712: Add watchdog DT node
Date: Fri, 31 Oct 2025 12:24:23 +0200
Message-ID: <20251031102423.1150093-5-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251031102423.1150093-1-svarbanov@suse.de>
References: <20251031102423.1150093-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7mwea5a3cdyragbzqhrtit3y)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_092923_391128_1CE4902A 
X-CRM114-Status: UNSURE (   9.62  )
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

Add watchdog device-tree node for bcm2712 SoC.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index e77a66adc22a..08905034ffc1 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -250,6 +250,15 @@ uart10: serial@7d001000 {
 			status = "disabled";
 		};
 
+		pm: watchdog@7d200000 {
+			compatible = "brcm,bcm2712-pm", "brcm,bcm2835-pm-wdt";
+			reg = <0x7d200000 0x604>;
+			reg-names = "pm";
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+			system-power-controller;
+		};
+
 		pinctrl: pinctrl@7d504100 {
 			compatible = "brcm,bcm2712c0-pinctrl";
 			reg = <0x7d504100 0x30>;
-- 
2.47.0


