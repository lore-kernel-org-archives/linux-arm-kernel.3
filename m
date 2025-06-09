Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8686C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZaNoH31uWj832VE6t2dJ2Q3BI3/vqMxOqvAPp1JZoY=; b=rneNnaC0HPw0/Rwvhefy4KJKqC
	8g8I6I0jonwXZbOL9bB6e+yAux9ZyvOxeHyGVNcfSBgdcb9X3XU1UO2pss0aovyDwz1DkIWA88tWA
	zT9KwS0QrafSy7ExZUwbBpZp197FNC/lucqFirSB9Pcekm0irPLme60nGVUPOAGlQsU4Z1ovRDhUU
	drKvnxtSQDqKuVHz2NlrnQSbUp1uGwiWFeAS8oLzoPVOSmw8XpUfm+st3qsfIo2RhEbfD0lTI4T5y
	rDLSk0c8iMhjIAzfmEikTXrRS5BmPeGJCvcgM40qD16Uw/6laGcclPoeKUTVboq81SJem7bxjEeiy
	sSG/KDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOk3y-00000005Gth-1zeN;
	Mon, 09 Jun 2025 21:29:50 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjy4-00000005G5c-0d6t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:23:45 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BD614C0008E3;
	Mon,  9 Jun 2025 14:23:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BD614C0008E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504223;
	bh=adVcvFQAO98qXYOyxqASBRwBadBn9tp/mRSFQhpO32M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWE9xPNIibnoRTv7jCm0NH4W9QTINnQ4qK0Po1PdT6VDMOrOY/aTbp9tbnvGDWxQ0
	 PlNfE5pPs7YquFR2Q/ZRzmotsE8A8D/VUcWxoezJnSnaJe8m0NTH2XPsJ3hVCRl5Pa
	 uyOW16KR6GGwwGbD0VxECY8pbvmT266Sh8jxi82I=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 99BF01800051E;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.orgg
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 2/2] memory: brcmstb_memc: Simplify compatible matching
Date: Mon,  9 Jun 2025 14:23:11 -0700
Message-ID: <20250609212311.2264108-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
References: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_142344_205145_AA4D5EBD 
X-CRM114-Status: GOOD (  13.65  )
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

Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
has been defined, we can greatly simplify the matching within the driver
to only look for that compatible string and nothing else.

The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
register layout since that is the most common nowadays.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/memory/brcmstb_memc.c | 56 ++---------------------------------
 1 file changed, 2 insertions(+), 54 deletions(-)

diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index c87b37e2c1f0..ba73470b1b13 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -184,62 +184,10 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
 		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
 		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
 	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.2",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.3",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.5",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.6",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.7",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.8",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.3.0",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.3.1",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.0",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.2",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.3",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.4",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	/* default to the original offset */
+	/* default to the V21 offset */
 	{
 		.compatible = "brcm,brcmstb-memc-ddr",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V1X]
+		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
 	},
 	{}
 };
-- 
2.43.0


