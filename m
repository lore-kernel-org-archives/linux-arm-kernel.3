Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED10CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/1S7DDo5ejBxzJdRig49Rht9iTPiAfim4WL9ZDXSqU=; b=49eCd9AT+r1oZZxbiebUJIeWil
	AHQ+wkVtFxFdaze0j9VcMHWAAMkP13Vi7uvlSoKkrZCgFuof0bp5GUn8plImpbaBLwhgY14tpjgWG
	cPxTnpwv1ga+ITouHI/firDdeBmjW1LpMoJx0K6I40OCFTC3hrPCenkP9x9EgnaVvF9pMdMMrjdiK
	lrvwq6O5OKK7wEh+/qXhusS8doARK3B/haLz11caVwto72fa5zAbQ3gyKy8/xDXNL4Auz5fL+tnY/
	/3JMAzCYGDrl3SroBf+VCAfZb21r990wfZqNU/ap98620+xnNya+9Y+UF/tUs7hkJt7Nzqt/WU33w
	NN4Z/TbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTnJ-000000033OQ-3FOF;
	Fri, 22 Aug 2025 15:35:09 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOB4-000000023zj-1plc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:35:19 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 382FE1F445;
	Fri, 22 Aug 2025 09:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755855314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/1S7DDo5ejBxzJdRig49Rht9iTPiAfim4WL9ZDXSqU=;
	b=YVEY+EGodZKOmVAVQ0gO2Ch0wCOuQ8tkiZKsZEHzP7rDC6aFp9R69INz0Q1fZBIyryz0iT
	qs5WOUDYB6VesUBZmcx7MNxFvjKcqK952rR0gBFrXQsYiSkvoFscRLOGaPW89jCoU/Bvq1
	7jqdy9kgoZYJbmOJvlyf7F3SOzGAqLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755855314;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/1S7DDo5ejBxzJdRig49Rht9iTPiAfim4WL9ZDXSqU=;
	b=lDGNN0xyT0vUW7cYQ1+/IbmDMlmD6z38FKMKU2aJkdg7yD9Sa9pOE69PuRRKQPnT0BycV/
	ON0Qkf5e1ohdTdBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755855314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/1S7DDo5ejBxzJdRig49Rht9iTPiAfim4WL9ZDXSqU=;
	b=YVEY+EGodZKOmVAVQ0gO2Ch0wCOuQ8tkiZKsZEHzP7rDC6aFp9R69INz0Q1fZBIyryz0iT
	qs5WOUDYB6VesUBZmcx7MNxFvjKcqK952rR0gBFrXQsYiSkvoFscRLOGaPW89jCoU/Bvq1
	7jqdy9kgoZYJbmOJvlyf7F3SOzGAqLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755855314;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/1S7DDo5ejBxzJdRig49Rht9iTPiAfim4WL9ZDXSqU=;
	b=lDGNN0xyT0vUW7cYQ1+/IbmDMlmD6z38FKMKU2aJkdg7yD9Sa9pOE69PuRRKQPnT0BycV/
	ON0Qkf5e1ohdTdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BB3B139B7;
	Fri, 22 Aug 2025 09:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AO1kCNE5qGihMAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 22 Aug 2025 09:35:13 +0000
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
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 4/5] arm64: dts: rp1: Add ethernet DT node
Date: Fri, 22 Aug 2025 12:34:39 +0300
Message-ID: <20250822093440.53941-5-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250822093440.53941-1-svarbanov@suse.de>
References: <20250822093440.53941-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	R_RATELIMIT(0.00)[to_ip_from(RL7mwea5a3cdyragbzqhrtit3y)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023518_626761_61277ED4 
X-CRM114-Status: UNSURE (   9.45  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


