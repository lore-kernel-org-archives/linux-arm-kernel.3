Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65650CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=; b=tFfu2spOHYgfGBv6CowC8iR/R5
	ReNhGj4DLgwvnqRsSREW4AycCLUtgUgqd0Wofk7CYuIc2Rmk7lYmxX26S3l2+ggy5kLJVk30yuie1
	CUokDz3VgNqPqgqxrbV03+7228esuZsTuVVaD/bY5d8dt3JMxYbopwPDaJBNDNQbq6HuMWG+c3Jzu
	S+9SaHg9pQTREgMhSQwgP76ktuHVqTlBWbnKSOMRa+FX+iLwOQM9Cddotn0egBQx9WY7UUdih7E5f
	0iBYLyzrRNX3ARv942kLAXAJwl0Ht8Ga0Ghom2xbbZP71wg6F28fFJ6lnxQIxP1/ObI2RLAlNNOpZ
	nBu+H9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtwc-00000006d6X-44w9;
	Fri, 31 Oct 2025 18:33:51 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtwT-00000006d1s-1mgh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:33:42 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7FF991F38C;
	Fri, 31 Oct 2025 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761935599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=PkJIaNbFkJ+tGnUzeOqcAJvsnB7hnurbnya/au1U9KqCWFFYKbyejfEg/mVZD/1RYh6FBj
	LlZCC5e0VQTHnS3Ew0fsUmAAeblv5jZt4qcd+rVTjJ4JMtuDN86fXr8+Wx+I2oCY1kUb7C
	kXXQdE5ISe4K0xeMKJubhdS1C0r5n5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761935599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=JboD07DhvfSMkw7SJaicojzh3/KnYhpNggSyEWcSMO6emvqXo8KiAApoLjVT2PQaeY3kRq
	e3t5uom+f/PryHAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761935598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=mPScrzR9lZpxhWIBdzwqVE1eQpONQlFwy4r7+/E4uF/Y8SbOd+qBYED2apTqQi/PnfZAeu
	eQgVR4ka8X9LDxqIbIo2pIC2MiUs80YcXV2DmJO28o02FBjZf2YJ92OAXgrKZo1jV9RN3V
	iLc5bVoOFcRjbjrgb/5nWG46rhMvwY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761935598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUyPK8JAqWudplR/2LaZrm1ThRmweJDGU1ip12PgpiM=;
	b=fRNXJIsU6uOgFvB35Eq5/AMM89K/5ASw0imiJDGw6ACJONBdwuJCearraxpS8OqosS7y0a
	SrEmkDRVmt3mSoCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E97E613991;
	Fri, 31 Oct 2025 18:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EMe5N+0ABWmTegAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 18:33:17 +0000
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
Subject: [PATCH v3 4/4] arm64: dts: broadcom: bcm2712: Add watchdog DT node
Date: Fri, 31 Oct 2025 20:33:09 +0200
Message-ID: <20251031183309.1163384-5-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251031183309.1163384-1-svarbanov@suse.de>
References: <20251031183309.1163384-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RL7mwea5a3cdyragbzqhrtit3y)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_113341_603143_AE2883AA 
X-CRM114-Status: UNSURE (   9.58  )
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


