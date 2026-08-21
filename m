Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FADDC5DF95
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdU5H3bN2YjJmdkOpTyhDKdtNDQWhj7nx5HM5OCNwY8=; b=iG5qkYco2CcHwoESebo/RPX9Lm
	7Zlrxt64t4G/cI6ZE0ba9eJ6JR7eb6ygrWJDMTUsjs3Ebi8UkEPyfPQZeKj2+MjhAuQA5e0/2HD9Q
	vMRMOiQvAKz99MK3dkj4xpkV0fH0Ri6uDzAdksll8mjPX+0nKQUyw1okdiw1VIIu9tTk4Al32DByH
	MMSLAzFCCTZ7MoRmJ/Tkm65jCfmLz0OITeGywZ3oNh5RAriMOkBjnU5Bqsql6hEl32PHGAJo8nkWt
	o9EIgZN2xodI6THHGmnp7+/BgX4U2c1lXXsnCXN7xxjZUoj4KBJbga9pF8uEqt7uSZnoXVAF0hOAp
	YRHLICSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdu-0000000DSlH-0ZZQ;
	Fri, 21 Aug 2026 13:50:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdj-0000000DSbS-0CRt;
	Fri, 21 Aug 2026 13:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3954860A78;
	Fri, 21 Aug 2026 13:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8104C2BCB3;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787320233;
	bh=+OdNmU3kQtFUJCrPPsP1ZLOdt+4zemG/iTRVI9Yczzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nSIKX+gRiO/5nYNaej3KWZHgi0X+dJDb9wS5J33mX39xXn03Ex7DQvgEjdEZp4z58
	 RijZElCtvVTESWx92292ngDu6iqBQV/TLE6fl+rr3c3h0PZXZ4QQxna7cSLVaB+PQU
	 c3ZnloBKWWHKfZfSss05uiDbc0L2iG7nWnabDDHYryaxA2k8cPK60XlkHb8aHWGjGx
	 30OZQE1+c40p/WGFrpfrCqcH4Awy0safJQUVqX18mUyMH4IokFNyGjna2/Izyz5TdL
	 DQCDnJn729YSyMeyRcI1dA8o+4BkSNPeeVdADzSMYb+4BZSzXnWVqyBJZF16qqx3Yo
	 MohE1K/rTebEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16D5C5DF93;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Fri, 21 Aug 2026 15:50:27 +0200
Subject: [PATCH 1/3] phy: apple: atc: Support DUMMY PIPEHANDLER state in
 configure_pipehandler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-b4-atcphy-usb4-v1-1-45c0b741e0c0@kernel.org>
References: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
In-Reply-To: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>, Paul Cristian <p4ulcristian@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=+OdNmU3kQtFUJCrPPsP1ZLOdt+4zemG/iTRVI9Yczzo=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH+NJX+Zztsv9Sudi8M7cUh0vmGn48crrmz45Vb74x1
 2s2LZ3YUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhIlR4jQ6+hnNtj3jKviK/b
 //jsTK7o5/oRb75/7nr+U3kp6utEvBgZrmluCP1l8O6V5tWoT/J/Zh7xTiipWt2SGP/9k//kgs6
 9bAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

For both Thunderbolt and DisplayPort atcphy_configure_pipehandler is
reached with a request to switch to the DUMMY state (i.e. usb2 only).
With the current code this breaks USB2 when all four SS lanes are used
for DisplayPort AltMode because the -EINVAL is passed all the way back
to the phy_set_mode() call which results in tearing down xhci and dwc3
again.
Let's actually handle that case correctly and also drop the default from
the switch such that we get a compiler warning if another pipehandler
state is ever added and forgotten here.

Reported-by: Paul Cristian <p4ulcristian@gmail.com>
Closes: https://github.com/AsahiLinux/linux/pull/515
Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Cc: stable@vger.kernel.org
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/phy/apple/atc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 4156fabad742..a3162f25e6cd 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -1121,7 +1121,7 @@ static int atcphy_configure_pipehandler_dummy(struct apple_atcphy *atcphy)
 
 static int atcphy_configure_pipehandler(struct apple_atcphy *atcphy, bool host)
 {
-	int ret;
+	int ret = -EINVAL;
 
 	lockdep_assert_held(&atcphy->lock);
 
@@ -1136,8 +1136,10 @@ static int atcphy_configure_pipehandler(struct apple_atcphy *atcphy, bool host)
 		ret = atcphy_configure_pipehandler_dummy(atcphy);
 		atcphy->pipehandler_up = false;
 		break;
-	default:
-		ret = -EINVAL;
+	case ATCPHY_PIPEHANDLER_STATE_DUMMY:
+		ret = atcphy_configure_pipehandler_dummy(atcphy);
+		atcphy->pipehandler_up = false;
+		break;
 	}
 
 	return ret;

-- 
2.55.0



