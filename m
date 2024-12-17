Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FD3E77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzyMAGttA/R0puRBzpRiSvHGmkn3uhv5iY88EMm2o4A=; b=v7Fh2gSxecwzDEPl0Lo+yZ6jP5
	Q82f12DSzEYvZty7PnFfsbY50SCbHN/XFup7S2vWUvbCWz3vGvBCTG5ln2TkX3zUh7tm9ADBxrrxr
	iB0WdJpbB3Cg52eHSphR8JX3jw+a421Eqcg/eqZHEh4uzR6aATp6w42d/B9SBNIhL5fTpWH0nQvS6
	au/G+UNdc/fIK0DPrbg73WlkjxcgVM5QjSznrdc3baKyD2P3Q4u1A4QMnwHwGDW0dfoW6j06bhJ4V
	NWUUFOA8ryx26cTtLBFCC0i7qEy53eR5mXAZnykSZgdc83ok2YZeyUits0ygIQ4y0eFV2cvAKli/F
	H4Embd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdY9-0000000EfrF-3yW7;
	Tue, 17 Dec 2024 19:48:09 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdUv-0000000EfLA-2mdG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:44:52 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B50FEC002817;
	Tue, 17 Dec 2024 11:44:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B50FEC002817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734464688;
	bh=82v8W/aCfyKyNH4lLoqsF3249ZAUx/s7U0qVBPIAcBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BmBKZbhs7Hl3w51VzWeyghKPj39aujguXxZFdaSBQNdp1pAG01bxK2MVl+aAIjrGp
	 ol/j48AB/7LvLGlfN8y2xDlgPM8ggXQPX/dziPSoLpzLcQalRU/1/i6roPtJWTaXbC
	 skWqjXImOwsaBMjkA4OL+VchCcjcTG4r33aIpSEk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 6976A18041CAD2;
	Tue, 17 Dec 2024 11:44:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 2/2] memory: brcmstb_memc: Match rev c.1.5 compatible string
Date: Tue, 17 Dec 2024 11:44:39 -0800
Message-ID: <20241217194439.929040-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217194439.929040-1-florian.fainelli@broadcom.com>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114449_785870_1EE461E8 
X-CRM114-Status: GOOD (  12.56  )
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

Match the revision c.1.5 compatible string and apply the v2.1x register
layout such that we can properly control the Self Refresh Power Down
timeouts with those controller version(s).

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/memory/brcmstb_memc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index 4f17a93aa028..a2750142cef7 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -236,6 +236,10 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
 		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.4",
 		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
 	},
+	{
+		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
+		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
+	},
 	/* default to the original offset */
 	{
 		.compatible = "brcm,brcmstb-memc-ddr",
-- 
2.43.0


