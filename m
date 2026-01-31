Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56340D61037
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=; b=feuESLYQKrS85rt653x2JfrZkt
	6Q0MUbbtmFU5sTY6IYEyF3UdN0SBRMrtd5wYQFpbZzk4mxs82cwvzgrzrzEcMB2Fe445XmOqyKIK1
	Az4AmqWjsarZkPO8P+Y0L86NacAqB51mlr+ksKIIdFBQeO3QzaMi6I79AghT+61r2nkVLXJJJ3RXD
	0JugYcQK8aAsPY9S4oeTNDJuW/pBWZLL2TZc1iGNUzZDuqZoniKKSGB1CXKPK1JmAEME01t6XYqc5
	eaL3jBnjPDE7AywqR4wGvOZvXb2yyfcOiZRjpiin7BMyhVnrWmhF1yOBDc3vXCH609pmPNUTIW67r
	0yeABslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDaq-00000002nI5-1R4G;
	Sat, 31 Jan 2026 16:13:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDaj-00000002nGE-25ga
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 16:12:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so6386901a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769875975; x=1770480775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=;
        b=AW5MoBLVgpSSP/9WqOZwtOv7ap05IFLdy63dgspGH7RU0bhVRE9HJwgtWYAuBOPQel
         yNqMJCEhXFoDhlxgnuB+O3Pt+rE/51VFpav2E5FjWXNgoC7NGVBTuebhQBzTBF5EhXel
         tH8vFGqS25+M0wmZLVZTPDGRNOyWiXF9O/RElNx4Zdf1H/t6dZOhrlYcxNrKQDd0F+lk
         yDapcxlpvXyd0bnSp+ZsCegWzKrcoQBAu6SLq4gxuNsiYqEvcW4YmYDLOw7A3zQ0TQj2
         PJ/yRS8gRoQgeFFewqbreup4hLjrEWyvhe1zZ5xb3AW2aoPXKadFLokyefY5t8/tGvCv
         7HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875975; x=1770480775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=;
        b=UPVPJVmw2KOU40zT1brJ8fHzzr0uYka4l/kVHEACYVh6M6Olc+rZzmf6e2jLi8NkDS
         rwFTXaOjC+7i6gNStaNjsNwm5Q2DmnOs0r1jrAwl01tkMqHibYTiGLu/7hhLGyHNVLlb
         pA4UP7bESJK7zqnpiREWor/2RDI5zdwzokW3ssL97sgHYO/ZcSULthO5dpHdVhqNzOC6
         fnjSwpBZ4KBk6En+SwsatdOdug0JHICwC9nYWemWJ6ZxgikQi9weF1rtWgsYtNKf2gkT
         wykCxQyAC39wTjKSjY/3IVH53dGR0aZoMvd3+JEtPvwUsqoyQ43qv+1sSt1eg+HJkkIq
         ieYw==
X-Forwarded-Encrypted: i=1; AJvYcCX7hIhmlwWZ342gQMH5jyOZnZ+lguzbhri/Ho6p7y4jLtoVZ2Vq72tLc6C61s+8CIrcpdT6msGphYL4mPMZ0J/1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh4gKOS7shGn+3l2/ScIkmDSLHzU8AW+ZNzsZy27AWdr/YvN22
	zLfdFA8wCqdysAZV4RWtEP+cSrFI98vf69oh5Ciqn3osY5ZOZXvxZa3y
X-Gm-Gg: AZuq6aLAYSjxELR2bG5lSbC2uUMetoO6CLilYjb2b9HyFmEwJu3eJF2Pe7K8zPAjFzi
	ywlgyPflfSbxVO28fY8JDochbS/DkXJoMnaCxpQ/OSGQAv5gcBX8F70Dmc+VUnLGgSNAPmBhTjJ
	qGG/XMtEgn0cv3kXSDKikjrPRT0i9pxczllF+bb7xtrxGiJQgE0g1X2oUMohQ7TzqrgYHKc/mip
	TmaC5oHx0dhQYLRYv+q7z8KkXWMBdWPFiJhQBiT5mM36QgKFFP2ceG8zAaM1HTgcJMFfZgKOKr4
	6nMkjYSIRicUI4kucDTRjwGZ84kJjnK9YzXw7xkYqynD1obTxtgTd3ljSAKizcoWYM+Iq0ngnqf
	3CfbZiXUoixPAdbWht1I6jsiCXxfVapCWpkxQCUnT5cdSy78gUbIx+lYxfQFxoGUmKw5k5D2tsr
	93dItViGKNtBk5eYM77yr4WsCAiLr4DpQOBvc=
X-Received: by 2002:a17:907:9701:b0:b88:5b72:ec39 with SMTP id a640c23a62f3a-b8ddf805340mr625902766b.5.1769875975203;
        Sat, 31 Jan 2026 08:12:55 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:46ad:7674:ff90:13f3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm5433232a12.34.2026.01.31.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:12:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v3 2/2] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
Date: Sat, 31 Jan 2026 16:12:43 +0000
Message-ID: <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_081257_553566_C17A8B28 
X-CRM114-Status: GOOD (  11.50  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index be7f5eb2cdcf..19f34e18bfef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
 };
 
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a08g046-gbeth", .data = &renesas_gbeth_of_data },
 	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
-- 
2.43.0


