Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0635C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=; b=Ziqewr4kR+x9bYLkGpGr9pRKAr
	diex/gMg892zRoenF2AtZV44lsqrOXHl2tYegRyiaskl8fnIhShayl49jmuN+hgrCR7B0wUVIHDHN
	aSUGPcZ/o+4HgKhuOmP1XsUxadlnxP4mc+hfCpFSKZLCPt1BG52+jNyTLTPOJ2I9ys+xmEG/62XIn
	l8WtzePwaF9Ain9hfd3TfASfRX6Bh7FFwf3p+e3dqHC+ByJ6RIBaJC2GfGXZwLdIeJxybiSlSH7L3
	mDBZQUrTpjOD/bXTsS8QkxXPGmUnwO+bF+cd1RSXnESWu0LwUcBlUUxVjF9KM5JiccVqM7H0nhD9S
	fBSfrIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GKZ-0000000C90M-2BUn;
	Thu, 17 Sep 2026 17:55:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GKX-0000000C8zM-29Lq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 17:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=; b=hvx2JFfmAMV/6K7KnEDr3PSlgj
	2r3UC0aapQHwtKqreyUJ31L13MWtFljMcGE9aRX2MaoUfTTkAt7kSXyQpqUNYBZkXM2Ah1IP6qKrU
	OgzjQQNy/7Dxs+ht4bFd3ILaEP+YVapn3jaiDAdiFXqazNC09eZlnySBYV6YuS7I48ZqTkqVNTpWl
	VDkTy4a7JpsROXyYafaeLsnnQ0n08JxfaXKU2NZzJdX6i2r5pJ8vlJd/TScTR/eR3xQg9k7Gb5d6h
	yZXFNPJ50bb3ImvB77x8Swdr3wSioTtJSt/i/hXacFM43xVWcww9GD3rThnOEyhpQIN6zT8FdDoB/
	gmHMvPPg==;
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7GKU-000000098QX-3mFL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:55:28 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so602737fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667725; x=1790272525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=sNBS81eiwA4ICMWyDcDSUV2L2RMkj/T963+hJJQLt/sRY1X7ghnZSNaccWw4cEWl9r
         BPG/+ZxF7iUc2zhw0qb1LrdAIgIVrwUD0sKvQbCfHL4dXXqsOwm450uGEVHUupcK0i2j
         W6yuNEmaGffJDgr2hmZ5tgY5IWA4i4A5n3KLUYBDy2DHkXQT9+saE5Qsw5rbYPYkKNr7
         U/BwbNH500MTaLWAJDnnBhB3hE4W9AziXXGy2TgtmOr7hjq+vLZdsWbit+9lsnEXcOnT
         d5OFZpxoX5WrYl7HkF608sSj0s2MC4QZ/ZEYZvOWus/t1EymH5pHiYiRIaQ2bBhL2V2O
         N5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667725; x=1790272525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=Hr4uu2A0Plhs7IWzFPB5mcH2LSumRseDHxBqLxnkYYmcfiD9UpOa2yaDTbzwNbONTk
         tmp55ILXZIFcyyjgMsSTbgCgkr3pV4Ywee6tJbUGUxerbdPu5ox2HssFAJyn8xoF7Ie7
         InLlRRFRN8tDC8Q1gL75ITONBrqCVf8PgMFTf73BJCAudUoP6B93kht4Ug0BOyphVKf8
         9rb3FTPyjAUoEzrOPp1LnrFoyh7JPGiJJ0ujJLQbu9oX1y6D8/7eTodV354lXsSd+mnH
         CzQlRMyisCl0ECypOElskdQNgkpUTBE7tcr8M/qWxfzzrJ3ET0+9YXBbmX6rouUDZudu
         7AAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBRxnvfPhGWHGyFLeaSEwQjeGCBgzLIRPVNo4SB187sjQWfVzxxv9n220jWrtGxvOz94FDiWPSIcLDtx5n2qlb@lists.infradead.org
X-Gm-Message-State: AFuF++l8SPpyGqDgdba5kTU5cv9YVBO/p91p8/yl06E5N6jwPEApP+F5
	B5sNZpAhWfj8pGEFQfJGD/boRYccu5qzeYomBxlS9ahf3KSo7OvxIgxrJUWP+Jst
X-Gm-Gg: AYBFou3u5Qamc4lVl2uPJS2UlZgFThtYA28TNICMopPCnqTZoM8FSEZwfdAmZn/bq8Z
	xuLIWLdtpN5SxILdAMk8vvMPHtrT+lh/qbtqGKE8sF03sFueMyqb64edNQt78I1HD+yGZiFvsH2
	Xh5pg5oFiXgjcpvig//RB+kCvsy5WiJCC6Sc+/wyRyqyfsvgnuOyfu6CLxg2wlDG0DlwfyqDmbO
	ufEXYacse63/0IbgghspgVV2EYUoxt+bAmj501mzmQVQt2AFHyqWSV4JbHWfyWnYl5zpNwHVcOY
	ZsqEWYAIRFptXx6xlUDpQ+wUmzODHbV999weJrxVWvXQV+r/SOqzAgxok3WNOXWSHpGVNHOgvMK
	vKiWYfOyRlAGkeRqcsDSiC2sek0hv0I8SjDHk2hrN9T4lfdflWeoUONkK6VZdFGP7KwdtxNAss0
	4fRivSp/ApMlyIMoGxKh6xrHw+dJwK2gqeL0Llfpx4FrGA8M82BDfIsfzjjCV4qTkgK3MQXC0k2
	dH8w/r1AAKT9+ErajuBYKWnXwiOHB7ehuZabgp+CiwhqM20lk/tNAn4QjX+dgDD7+GuQ7zVUA23
	bxfWatJXosHmLNurINdBA4cfOgTRwyIAtvZJOGjesyRfsmXKkL6sdt9OjyH7joBzoAR1uJZ2zjw
	pZJAtg33tnaRYEJWmCsK7
X-Received: by 2002:a05:6870:1696:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-484752f7f6fmr6824911fac.6.1789667724804;
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:14 -0600
Subject: [PATCH net-next v3 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_185527_044565_833A24AF 
X-CRM114-Status: GOOD (  12.69  )
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

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4523a14f5e0c..1020168f1c3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1276,6 +1290,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0


