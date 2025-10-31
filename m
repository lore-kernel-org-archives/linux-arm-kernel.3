Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95673CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTw7iWUX8HaZ6Ol9jn6dxV7QLQ2mYM3zWUSbDbp7Gho=; b=Z5Vc95cUGkbxhkmOriGkIXDrEu
	71sCLJk0yPFnEc/vtX+iNeIpdRuiR5RbytWMjurIhYjH2lrNa7JDycRikVisk0jibKg6GVmkVDUyj
	tU58f2BKMQwNXwzG7dj/OgEVXF0Qq/pYndyqaXqpoG6IjfXVGkZZ3O0CZdLOwXi5DQyLjoSn1t4tu
	KGhnrvtfGyRmOkPTI9xdxsME743KbuCMReraRu+6HfVsu/XNaoFz001X5tWbcLq/8n6tyUb4eYzh5
	34sK0EtyWTqwauiIy2w4EhsUhC3YFatfeVxiJh5IOJMQd+Yeo4j8Xj8pjHj6Xw+lT5UUXklRzUBJ0
	y2+HQJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtwV-00000006d3D-0mDw;
	Fri, 31 Oct 2025 18:33:43 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtwM-00000006cxj-2tFJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:33:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E28641F38A;
	Fri, 31 Oct 2025 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761935597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTw7iWUX8HaZ6Ol9jn6dxV7QLQ2mYM3zWUSbDbp7Gho=;
	b=dUBPGBA+p2/5SFiVzyJWZ5LLo+3i9jsO5eUeUx4SKk/qeyFkLZrm8JVfXEivukyVYcnnNX
	hF31VLhFfkS2dSaFwyxbCFmHUByRwmsHOyuarkD/uxkH70ZUetOJD9spmb+WDnjrxAtfD3
	4TlRcjlHTMhRzpobgxDYpAr1rUTITHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761935597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTw7iWUX8HaZ6Ol9jn6dxV7QLQ2mYM3zWUSbDbp7Gho=;
	b=pAyUzm72q3IlV1VFiso88cyzsmqCDwhU/gbgORlYbk0VLDEzHq3cNmnNaHzKlIXc/3MUfo
	F0aflCR8YZVk+2Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761935597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTw7iWUX8HaZ6Ol9jn6dxV7QLQ2mYM3zWUSbDbp7Gho=;
	b=dUBPGBA+p2/5SFiVzyJWZ5LLo+3i9jsO5eUeUx4SKk/qeyFkLZrm8JVfXEivukyVYcnnNX
	hF31VLhFfkS2dSaFwyxbCFmHUByRwmsHOyuarkD/uxkH70ZUetOJD9spmb+WDnjrxAtfD3
	4TlRcjlHTMhRzpobgxDYpAr1rUTITHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761935597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTw7iWUX8HaZ6Ol9jn6dxV7QLQ2mYM3zWUSbDbp7Gho=;
	b=pAyUzm72q3IlV1VFiso88cyzsmqCDwhU/gbgORlYbk0VLDEzHq3cNmnNaHzKlIXc/3MUfo
	F0aflCR8YZVk+2Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AFB813A1F;
	Fri, 31 Oct 2025 18:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uInqFO0ABWmTegAAD6G6ig
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
Subject: [PATCH v3 3/4] mfd: bcm2835-pm: Add support for BCM2712
Date: Fri, 31 Oct 2025 20:33:08 +0200
Message-ID: <20251031183309.1163384-4-svarbanov@suse.de>
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
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_113334_878189_85B3EA9C 
X-CRM114-Status: GOOD (  11.46  )
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

The BCM2712 SoC has PM block but lacks the "asb" and "rpivid_asb"
register spaces, and doesn't need clock(s).  Add a compatible
string for bcm2712 to allow probe of bcm2835-wdt and
bcm2835-power drivers.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/mfd/bcm2835-pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 3cb2b9423121..8bed59816e82 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -108,6 +108,7 @@ static const struct of_device_id bcm2835_pm_of_match[] = {
 	{ .compatible = "brcm,bcm2835-pm-wdt", },
 	{ .compatible = "brcm,bcm2835-pm", },
 	{ .compatible = "brcm,bcm2711-pm", },
+	{ .compatible = "brcm,bcm2712-pm", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_pm_of_match);
-- 
2.47.0


