Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC408C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPFP1kVa2PxmQHLyXpRxd4Z+Ex+6P4XfF6/MvtfR+hE=; b=D7nFb7dQ0b/CTg0Z8yvdAP8giW
	+MElEl2tH8Tk9Kute7StXcdTG4MPi7gYt0ALX4XeO+rLn6nqMz6pRxr5/bObY3Y9Ya/nt4uqbwpsT
	CEaAAEMTrAasuQ0/cDcB2akqP+2jmucR9hwYbYiu5ZlMSUOIy7oYtpe11cH9DzJzH6NcQ8NNTbl+Y
	qHRTZf4lNIOtaCOkH+AmfDF8Uu5oq62k0Ra5YgR90aSg7yRGhaBZo3O1g7qJckaDfUyA6vVBOa+hd
	aZOHF1EAqKDmjh7VrkvPBzT0sMubGchJHIBfsg1Xss4uQ49494dD3vaWKTu4bZO2YpD64nXlpWkn7
	fg/tdFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXPH-00000004ir3-2gVS;
	Fri, 23 May 2025 18:46:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXNE-00000004ian-3O7H
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 18:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NPFP1kVa2PxmQHLyXpRxd4Z+Ex+6P4XfF6/MvtfR+hE=; b=fo/a2HIqqormLHOou2h3r406W6
	lse4uSK4QsUVyInkLy4kpFJy35E1dy6xhkUh9UhUDea/Q/IrQyYFjNAmQs9S2F9sLtBzgjPEo7vjJ
	P+dyZjUyK8NIqIB/IPsvGEyR13/i3/vc+ZDC7VJdFdW9suFGlHnIj0HVb4SR8FVGVo+zhPn9NnkaT
	U961Xj3rgWJlzJVO/LxrYv9tuB126t8/wVO2IUvNCgWfF/828t46TVqZrTW5WDCOgU9oJYEUavHFF
	EcXbBBkKPl/RaH0te0vuE4n06GfZMyYxojggfMLawxMmcSFWWZlBvMONIa3AAUOeopyVPr6FS1Bro
	y3a/C/2A==;
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIXNB-00000001MnD-2F7P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 18:44:03 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 69EA2C0000E9;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 69EA2C0000E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748025837;
	bh=0r9gkCW0yRQt1gnBJzDmjX7k23tGsj45UqKcrz56EBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MK/ygYe5WajchT5AUNHigM6mfw558fmeml2oAUIhvCXZPtOzcgfzi5DEknQmAbsza
	 QQQ24fFLXujWnQlIC1tMXMmgT9qpNyAOBTaqAffEl1pwn6UzANZcN6Xx9AnRE9DcS6
	 5nTEO8F7p8qgsHYRjUIZvVBinlw7BFV4dEkkbZ/A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 4810618000853;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: justin.chen@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
Date: Fri, 23 May 2025 11:43:54 -0700
Message-ID: <20250523184354.1249577-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_194401_854878_B8365F71 
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

Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
has been defined, we can greatly simplify the matching within the driver
to only look for that compatible string and nothing else.

The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
register layout since that is the most common nowadays.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
 1 file changed, 3 insertions(+), 55 deletions(-)

diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index c87b37e2c1f0..ec4c198ddc49 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
 		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
 	},
 	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
+		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
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


