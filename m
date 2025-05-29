Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24ECC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP+cBqQl4oU5V6STKgR9qkSDk+GPXxR/Qkbrnuthsrw=; b=UxwpIUD8OCxGGBhJKDj139LH38
	8FuiO/leJTQ2egR6LCKlaKv/gCdFd1Qz63Vzjjf9CMj2Tax1J0fTIiDCmrjg6jYOQglteYNlkAoXu
	LK0Ekj0U5rNw0WetkeMGuz+dkJh2vZ1c5tqlEIGTwSg4Z80n8MpxLyYtJJPAANTz+IPhjiqhrE/dg
	t0AVB0hTmIgY66BwrjtPuCANpSCAUiHqpfYudA+Z2yyJ8cSnXCsFX6uHQzjq08/mdiOFPdB3o8Q6j
	PTVxHhdCcD1PF11G17Fqw3toACw7yf2VH3HuAsJ2oBhaDa2vsn9NQvNndFf92X/U9l39AXL/pRk9/
	PEIYlyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZNZ-0000000FONG-2oNA;
	Thu, 29 May 2025 09:16:49 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZEh-0000000FMDf-2fKS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:07:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E708A43302;
	Thu, 29 May 2025 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748509654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vP+cBqQl4oU5V6STKgR9qkSDk+GPXxR/Qkbrnuthsrw=;
	b=PZJP+2eq8AeMj9IpLi1meIJZZuysN3MuFx2xm06qM+HGf2PTvo6TxHv/bDeAj9wfwkrT+4
	qOeKetKK88G6R7XEcZ4+H75HCJNDD5oyiOkntMNUAo7taylJN5voJdDlIA9SXKx5rwEctb
	vEqeQxdyePpEXp9h3AcnbZpHfxosPP3PmI3qhz4FJ2Vq5mI0Y2lCrmgt9Sp8Ptp95QIK6A
	S6yDLki2Y+ole9CwHpj6YLcWDUc9i9Mrfgxhxaw5BhULSTTObgVM0EA2InCtlgZkcK6rgB
	1r3yHRVkd7Mg/wZsxYsSsGFSgwAQxwIgxo382G4YHjE6DptAmUr9z9ztWhfPbQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Thu, 29 May 2025 11:07:24 +0200
Subject: [PATCH v4 2/2] net: stmmac: make sure that ptp_rate is not 0
 before configuring EST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250529-stmmac_tstamp_div-v4-2-d73340a794d5@bootlin.com>
References: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
In-Reply-To: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Phil Reid <preid@electromag.com.au>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jose Abreu <Jose.Abreu@synopsys.com>, Yanteng Si <si.yanteng@linux.dev>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvheejfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrvddtkegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplfhoshgvrdetsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhhorggsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_020739_836226_E7B12446 
X-CRM114-Status: GOOD (  10.52  )
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

If the ptp_rate recorded earlier in the driver happens to be 0, this
bogus value will propagate up to EST configuration, where it will
trigger a division by 0.

Prevent this division by 0 by adding the corresponding check and error
code.

Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Fixes: 8572aec3d0dc ("net: stmmac: Add basic EST support for XGMAC")
---
Changes in v4:
- rebased on net/main
Changes in v3:
- new patch
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index c9693f77e1f61fe5c92f95f5e544371445626c4d..ac6f2e3a3fcd2f9ae21913845282ff015cd2f7ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -32,6 +32,11 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	int i, ret = 0;
 	u32 ctrl;
 
+	if (!ptp_rate) {
+		netdev_warn(priv->dev, "Invalid PTP rate");
+		return -EINVAL;
+	}
+
 	ret |= est_write(est_addr, EST_BTR_LOW, cfg->btr[0], false);
 	ret |= est_write(est_addr, EST_BTR_HIGH, cfg->btr[1], false);
 	ret |= est_write(est_addr, EST_TER, cfg->ter, false);

-- 
2.49.0


