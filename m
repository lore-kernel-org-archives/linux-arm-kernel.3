Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8021CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=; b=EUQ0fk6XRdZv9ja8VQXeX1IfEz
	tOXEOh8omFzdzaewGiWUUcFrq2loQhqdYt0XFz3mkCHxh9mTwG4REkEMIINnFe4cuFvYR+aB5WWtp
	VlPp8AC/dCrxLloARspEaF7JoA0pH1fS2xqV0CetR0e4irdYFSdSuWn9Dx1/8f1djKxOf92P2mF/x
	p/RvXx81Sob80yzI9VnnTRp+bnfDvzpBSx9KiLiYVmtDnFuhA/TijWNQ2eZEFUidf1qvNItWRpl1C
	k9dtEguKZ8pqIMIcY3EKptSmhABFQCRXT/tb/pWWaUrxsa9+3BXXTf37rBeioiu5/e/K3Zt0avA4k
	kT5djTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSP4-00000002dK7-36Ml;
	Tue, 29 Sep 2026 07:37:30 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSOv-00000002dHS-25CX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:37:22 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso3045867a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667440; x=1791272240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=;
        b=Bx4+nEkNj5Cova7s+zPMQ+gsVJObGcVyeo+dvLl1vVMllxPmM7JxHZMmCiX9H61wlf
         0LjSkvNYGyaw1UH1M6iAp8OZ4S5EaxgVpszoG4Din7hOq5pVjEV0wwTHiQwF8PuMAh2E
         vEB1zzUJA+0Vj3DK63CLSdp17UhKjJTPyqGHPP7uF0R1fWBdLOI7n+KTwZ/dTFAb3pzS
         BhasyWkR3Sbu6enMCmrrpP8rhR0jlW7FZ8FGJ1ej9fIIcQHbvSx+AwB7lE4oRQ5plPLA
         Rx4K+Y2eJYi2r03Pwd+gU564W/woqAubUzBEWaHCLrrrrA0NZx8GtW1P+CKm4IeSZBeo
         bG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667440; x=1791272240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=;
        b=Ki+sFk/apHY83eXAzN8DhWUX1RSfqORB5mSpjyV58jBOfqtOJSRwo+Zi6sqTmqNyzu
         yFlbvhhEJDX2Wf2RlBxw6ui8wP0P6SyV8SBMRMo2ju8117O+cdfr0W5dp6C990L0kWHN
         7an6YVYU9GrOCJj0ophf2UiBeVqsycT+HH0i3c3QCAyr3cMnnb4OPoj2GM5gtGGU7MUE
         pCiAyjzZr4YbO2yWagtt85/GDe6L/vB6q8h5BNTqJ/Rruqo1WhN5m4i8Aim+QHATtbO/
         momtA//FJzxJTgbeRkJziasDE8j/nRSRnDIBccMYHNutMfAOF+7NtWUXnHIoRvD8M+hm
         6c5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHvsq8E2M3XFSwZRet95f+pUXrLJp68z23Vtup/i6vZzcGu0lQX56MeVX9wP0IK1D+QomIjmNtXOnOP5KjC3Tj@lists.infradead.org
X-Gm-Message-State: AFq9FYLn8Qszt8y52gFHo/D/w+Jw1M1RwDXD7Hi1Yeo3cg6ElPqc5eAR
	WJYG03A0vUcqJVH60YjIDGIRuFv86twX8VvOwuz5zGICCzEhg05kS9br
X-Gm-Gg: AYBFou2yfqndynKttvJLDI4FU7avtgsv+aMVFJMnjre/fSbcr7QKgCgITv2oCCiRJ4b
	CJLU0HWAltGgMbKROZBT9g5oEwrqlP/iNX6magmvKzSvalXZHbpEUy9DoO4OLCTeUgFipEZ0L/d
	00gY4nT5FHw4DTujOxf4aZb+17S54iIDJecHM7NCdBDax7rmbwgy5Ui0kb6R6iAizYsmsz/CaQi
	y1dg4RSZS2DYOU/9n6CFHu2TBBWIpmuiTUOT72CxZp2Qz8jNrOHRt7iQ7adbWSVuJAzMIbys5fL
	vRr984cVhDwJ1l+Tc11y2UaX0XN0sazdn3aNiytY9ntdtKKzjfe9JePaFhkkeokOEW/QAen8PwF
	anBgKcoMTkyFXR4XF3eVvww/F5Y8krRdNS5/3moUuFjpg9XIWUW+U/ufKNsfJioiwIX3zjfQXRM
	a4uAf61m/iSm+HVvQAioTvkChwcXjJkEfNxoAB9ZpA56Av2bkIqGeVSNjMnk70eA5o20T+Hg==
X-Received: by 2002:a17:90b:164c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a098df465emr13963048a91.30.1790667440494;
        Tue, 29 Sep 2026 00:37:20 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498ecc986sm1328708a91.3.2026.09.29.00.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:37:18 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v6 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Tue, 29 Sep 2026 15:35:52 +0800
Message-Id: <20260929073553.4136336-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929073553.4136336-1-zxyan0222@gmail.com>
References: <20260929073553.4136336-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_003721_555600_DCE25DE2 
X-CRM114-Status: GOOD (  13.50  )
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

The generic timestamp_interrupt() handler derives the EXTTS channel
index with ilog2() applied directly to the PTP_ACR channel mask, with
no check for a zero mask.  ilog2(0) yields -1, which ends up in
event.index as 0xffffffff, and ptp_clock_event() uses that index in
test_bit() against a PTP_MAX_CHANNELS bitmap without range validation,
reading far past the allocation from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an EXTTS
interrupt arriving in between passes the flag check while the mask is
still clear (snapshots can also linger in the FIFO from a previous
enable, as only PTP_ACR_ATSFC clears them).

Check the mask before applying the ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa772c..2a076e228e9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -242,7 +242,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1


