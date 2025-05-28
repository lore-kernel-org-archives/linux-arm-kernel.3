Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C56C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shTq+LjK5kytOL+ZAGqX+p9U+O+5+OqX6NmjbEioOnk=; b=Vaky9y4Opm2IPeRounHfRrHlOP
	1aNhxXWuTes/6B5g9sFIVSOwZBssp41QsbmKAxKz9qEuogDA2rTfsH7wOWu+R2IPMJxj95bdxzlT5
	BR41egreZvz8Uwf7Him7rMk7RrdWuwoPLUlT4/PfJScS6TwyizBZEf6ux1gl9zIty6Yo1USGoILSN
	oaPnScpWkcv9YIKk5Wh2MoXBxkMu10gbEpoU4DTrAr69v4qOajRUE6S62I/lxSDlIAY5GyXZGXzRL
	XgcUbzXJjIJjb+m7TYxUitO+RkJwfFdq3KOvXenUgCro58Y+/W08EKNtSH9vAkdIcRdplFBDsDmJQ
	W6blUPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCJT-0000000Cbfy-0fIT;
	Wed, 28 May 2025 08:39:03 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCAk-0000000Caba-4B6e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:30:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CC0243181;
	Wed, 28 May 2025 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748421001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shTq+LjK5kytOL+ZAGqX+p9U+O+5+OqX6NmjbEioOnk=;
	b=Fmb4isi5ctT5G4E+PxA6NLD0Xpn3HwwowHzMR32KwsKIs8h/3/Go/bVkp1nRAB4j3AGowP
	Sd6nwUDcOGwYPI1XHQIvGONvbWBBjM5cX397cAKYTOcH5JrfnJLEI4lsrAT26qKTUrFytp
	Ti4iipv9XjTMmffc//RSLPQF+DKMbrrTXcO9dYxa4R8ZQlGY4JEYiOwtRwui8NyqzjTjIc
	jZmpaACJWnfoIMPt43Hzp7buEHV1CgLRSFO7R87xnJbYq7+qBstPmy/5Ya7GW2fyPSWw1l
	au2OcxFZOjlE4tQCv/TZBT95gVBILNLC5dfVkO10nFXa3ZHvDhDQXnNl0tO8Hw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 28 May 2025 10:29:51 +0200
Subject: [PATCH v3 2/2] net: stmmac: make sure that ptp_rate is not 0
 before configuring EST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250528-stmmac_tstamp_div-v3-2-b525ecdfd84c@bootlin.com>
References: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
In-Reply-To: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
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
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhin
 hdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvth
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_013003_184770_ADF32813 
X-CRM114-Status: GOOD (  10.39  )
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


