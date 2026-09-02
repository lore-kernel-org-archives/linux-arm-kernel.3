Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD0C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQYceg/hDAoHZSSsTfM6Hulawi5wLBgXPxrO6JfcMt4=; b=KTnUgRQXOdCUiAUTiLWjXRJvpx
	f18L6BMo4NpLk0bpW76pXZHbDwabquHqfxL2caYrLhW08dkUz9Uv+aYOGDHPdKGbZEAnjJMr9iWK7
	UG89XbtjFescX5LK82KoPxxbtTF6oClDHAB0+Lm/ozyzqRMC39FA3WiNK5Vyamylen3rnTKMIEcGI
	c7nHKJ/jChTVMoDO7xy4EjMl+N0/9CfD7kIVGonAXCub31o+wkXa0WzTLY8gegREYi5V20xmptns9
	UAV1mt+HoPkBka4AbPtjjEkZyZaQbgwoJX4YGX5hRxfoAZnGJG+IaXHNjZjXFlLrKfQVizDtcp5LI
	XKb2c5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kRv-0000000Eij2-3hVG;
	Wed, 02 Sep 2026 12:52:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kRu-0000000Eihb-0OtE;
	Wed, 02 Sep 2026 12:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EBEA443E1;
	Wed,  2 Sep 2026 12:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21602C2BD01;
	Wed,  2 Sep 2026 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788353537;
	bh=NpJ68cAdxRTul9v+KRzPMyOhGoHG7IvwOK7cj3TZ7Fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZlMEPtYb8sDEZ0lQL5z/OEYH3pSB5l7nbCuiXsKG8SPqRvvO5ClN+z5/SNch0oLZ/
	 v7WFc41oZTAUBcRTkYOwDVL/t6PfXUhqjd76Xpsuv5Hw66qu9gsdBTO5boHTykntop
	 3iWSoBQ1/cis4nOw9d8BuHo/eF4jpMUbDVC0THKo8gaaKjpC+XVUDxJRIncdR6Zitd
	 lAN6Y7VgBslaZNVUt4EXb0x3CpPmolWppZ0JBP7i3oJUkXZyopi2GAWrMWkKZgSlck
	 0RbL/4e7LfDWHNvGirlfZBiYE39epGlE3YNRuO/6ZtJ7mkYOFhlAhDs0tJm2e4TlIV
	 wd5mJOs9eq4sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053F7C624D0;
	Wed,  2 Sep 2026 12:52:17 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 02 Sep 2026 14:51:06 +0200
Subject: [PATCH v11 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-add-mcu-fan-khadas-vim4-v11-2-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 mfd@lists.linux.dev, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=EC3QR4h1VRMR/TQsGWmFoDDKLNA1VXSGTQljiGJtTRI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9YM6dc6bS1vZX3qQ9qDK78sPlr6zubF64d6wdvYll6Un
 6utsG5hRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRi62MDD0TX+8LUWzmzfRJ
 +XC3O7U98KaJwkXnXyZa21oSpz0578jwT9vP0PPDHN+5E1e//PsxU+65S1MA78ob7uuWPLGNWGe
 ixAsA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Convert khadas_mcu_fan_cells[] and khadas_mcu_cells[] to use the
MFD_CELL_NAME() helper macro instead of open-coding the struct
mfd_cell initialisers. While at it, make both arrays const since
they are never modified after initialisation.

This is a pure cleanup with no functional change, done in
preparation for a subsequent patch which will need to attach
platform_data to the fan cell.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/mfd/khadas-mcu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a7886921..0e74efe14f367 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -75,13 +75,13 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
-static struct mfd_cell khadas_mcu_fan_cells[] = {
+static const struct mfd_cell khadas_mcu_fan_cells[] = {
 	/* VIM1/2 Rev13+ and VIM3 only */
-	{ .name = "khadas-mcu-fan-ctrl", },
+	MFD_CELL_NAME("khadas-mcu-fan-ctrl"),
 };
 
-static struct mfd_cell khadas_mcu_cells[] = {
-	{ .name = "khadas-mcu-user-mem", },
+static const struct mfd_cell khadas_mcu_cells[] = {
+	MFD_CELL_NAME("khadas-mcu-user-mem"),
 };
 
 static int khadas_mcu_probe(struct i2c_client *client)

-- 
2.49.0



