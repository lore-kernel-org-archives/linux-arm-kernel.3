Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC72EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=; b=0Lf4d25kuU+ml3FSn7WCYEA0t3
	Sj09ZeIdkDrVPGhv/fij67GiNbGQia/ljqLZP/LzwXmkCaKidRbVd7mButoXPuBD2M72xjyAdahtd
	i56md1jWj0a3LThmTyZbKEm0cI0wUvec4wpuoKgykDpB+a7rhqRYprxsdOQLVNQUyBmay99DD9MMe
	lLiDrcqUZzHrQCnhb4kQ52QhWZzdtojGb3cUjFeziZ6mL6/q+PESjBgi72ctht1oIw1bluJFb7Fje
	GOFCw6SqiKjnGjMyvM3TC3Dr7wGAgyEQM2qOvwLPq2qkxsCxYu8Fv3K97dlBPQA6i4PSRcxdBvNtL
	9ml/6Spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kau-0000000Ek7I-2m69;
	Wed, 02 Sep 2026 13:01:36 +0000
Received: from mail-centralusazon11010050.outbound.protection.outlook.com ([52.101.61.50] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kar-0000000Ek5Z-36ps
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8A2kiBWz8wlCE9/Em6n4ZlB+JwMwr7rtWTAO+681VmzgcMP52ZuODJSsORsoa7Srgke/f/GmWGyV/kx3L260s/7J/64ux/Xh1uvUF4CE48bMVU2IuldN4JorsdxjYBsRXJc6+0yy8/zAC2P5X9FTqkK/McR4NadYnQCkuKwp0C7RpHbvBFXLK/EMZ9ZzUr4XxpzVbiSDrZVX2ttByWqPBq8Hudb/Jfy5mAKqTeEtKemJtwdt/xMRo7DwWInzA7sV/gqe1gVypEh5lJfdrsgPzye6zzGqWwMsq55zhswEhOKdKuQALI98OUj0Ho4Z3yckMig7CwRmpeSOQZEma31jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=;
 b=Zea1/OddI1EbhNYecCZV9trLIzo9dMvDRIRmsg9XX2OZc9RMlXne0fj1VcltAiG1VP57lVjmr+C46tX3EYvYI1IKiL/FhPkMPexJrcgc0PtPhKlJzVMhkBkuZJtrcLcewmGEAVZKvMGLn7dl5W14YzM5GTHm9NcztAfj+05BW87NIa45hAZM3IO6hgUKi/5OZTqhaYlweOfv4u2LMCbfic8ZXv0OxFpm/2fXVcsR24YaOpobTkLToQWVw1inLlAxUgaWmIuvB8IhQCcRUmBNAh4+s1E+pQZ81U/dXHJtrPR0KkJhZV/4lEVTlfro2BPZ481UcgY4qOQkmoC/GzXSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=;
 b=ZjUxId66AgV8rDnyPhsPlNW81ee8W2SK5JksQo1dbaUd/qAuHPBktwgqUM+LwG4BCrP9KVviAQdmdtjuGj28GgWoG8P2EY2ABdS0J9oSEUVLPI2a4HD5nnXh3heiSkbG6haHY2DEOkPuy8DxO5SE5lVSHz6r937Fxu6cUVicInWgNKGqmlgTG+eSkNyKK99ONmjHuA5NCUFAUt8UweZRaBSGr64CyEcD5uzZpOjYgorLzzbnr8D7he0nAHe0taPAXp0ngxPtoqREeR6x4w5a+WoS72h1qfVaTd0G9uHmsRxdYCyov8g6BTitUJOpuWH+xYpV9qI2TTeYvVn8xs8mpw==
Received: from BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17)
 by IA0PR22MB4402.namprd22.prod.outlook.com (2603:10b6:208:491::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:01:20 +0000
Received: from BN3PEPF00022BD4.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::47) by BN0PR04CA0042.outlook.office365.com
 (2603:10b6:408:e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF00022BD4.mail.protection.outlook.com (10.167.248.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:19 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 62D81E4DB;
	Wed,  2 Sep 2026 16:01:15 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ian Ray <ian.ray@gehealthcare.com>
Subject: [PATCH v1 0/3] drm/bridge: dw-hdmi: allow ignoring rxsense for hotplug
Date: Wed,  2 Sep 2026 16:01:13 +0300
Message-ID: <20260902130113.2720-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD4:EE_|IA0PR22MB4402:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37500e36-4f33-4247-7d9d-08df08f24862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|6133799003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: EbM1VzQmcM2omfi7VysFqMvXn4sTKpwIKdD+mAPXeqjq8AJhAFXODfZDOARdyc8E5giQBYigcW3TyuuP2AUjW8sEDpEqykUChdvoohPZwvA0ZpzNMDGus56Yz8QllCZoMkQrUS0fRfZlHCc7lcFvh/Utc7uyw1Sy7L1iD0tXeQheMSSkFjf+XawQki0JDzeZ8yiSatki/klSW7A8hsVhYjLQSbLbwJ+Rv8FceADr4wtVU3kHt5ma6Ti22kIUi/W/ZfQ8FudNHzYwQYhXyuqmllNnDJTYT+67Wo+gdBbew5lt5NbWjl1Jbaj/jUj+H8aVQhObXZg46LjEgOD0DRBe6xfBR+4HR9hnsFEVvpi2v4VrqpCep+MO+d3zYCKFHWLR2nfZc6yV4ZgWzr+WAt6BckJCcNVuJNBPTkTttqvLGZWTTzyMqX9ikuwI7GvCuADxSv50vkz9UC3PVT/WbJfvv5GOraOju+2gSU5J/Fl1FX64FNxgUm0W4YiI5I7kI666Nt6tDX1v0iNGCzTTee2qe+aiCI0+1+TxpHG/7QvE3NvrHq4p91VLBH8cfshkhh/1+eh78p3eEtWleO2y2fd1I9P7v9tLW/94l/FdR4uKzIkQtNlmkrjBmvgOlJ0x7wIGR1UQQmPjHWIxpvWZXOB9sM9D3q9yWAyT6LFmxwntZ4rsEypa9ShG1Zl/Sn6RVYvJRAqRfWwllVefvZaGMfZHog==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x6u/S+nEmkA85p50yDKtJRJBHwtSin4qLMIuXDXTS6D4t9mdcBqRtTUeGbyBe37W3SL1DnCDiA6L3cwX9W6m7Wh7LAcCzdTW0Q2f40IAmJcfUsNPan6MVRR3U6BEY3Q44AyzHhAfC8zNzD1bSU8mfr+NM0zcWD1uYbFFAR0PjBijDltiu7uEzle16SWRsoYlAGMfFYywjPPP5RRE+CFPZjDQOyPbDbnYpU8EUvyFguxERJw2CWi3ZWFw2RacCeXldlgEB91Q3TmUkbzPdnNiKNxzTiux+OoBQvhuOXx7Fu4TOyAt7QTzDmcldvzSP0nCTOTPidmASFZuemnrkS9ao6eiUhcWJ1Yha3F5/N74kQQ9DRli5FOOtKdcNjs5sYuA4gw3hWz+wf2DxQxViDzjO+N8dQUpLrHiIN48sme4kSN5xmB6phJ7VYuomVNFPPvh
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:19.6980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37500e36-4f33-4247-7d9d-08df08f24862
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR22MB4402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060133_789937_13005E4B 
X-CRM114-Status: GOOD (  13.07  )
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

Commit da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event
on link change") made hotplug detection also consider rxsense: a
disconnect is now reported only when both HPD and rxsense are low.

This is a problem for boards that route the HDMI output through a
downstream device which keeps the TMDS lines permanently loaded. On the
GE B450/B650/B850 (bx50v3) boards an STDP2600 HDMI-to-DP converter is
used, so rxsense is always asserted and a disconnect is never reported,
even though the HPD signal works correctly. The connector is stuck in
the "connected" state.

This series adds an optional 'ignore-rxsense' device tree property that
restores HPD-only detection for such boards, and enables it on the
bx50v3 boards. The change is backward compatible: without the property
the existing behaviour is unchanged, so old device trees are unaffected.

  Patch 1 adds the device tree binding.
  Patch 2 adds the driver support in the common dw-hdmi layer.
  Patch 3 enables the property on the imx6q bx50v3 boards.

  `make dt_binding_check' is clean for the schema.
  `make CHECK_DTBS=y' is clean for the device trees.

Note: The series touches two subsystems. Patches 1-2 target drm-misc;
patch 3 (ARM dts). Sent together for context, but driver support must
land first.

Ian Ray (3):
  dt-bindings: display: synopsys,dw-hdmi: add ignore-rxsense
  drm/bridge: dw-hdmi: optionally ignore rxsense when detecting hotplug
  ARM: dts: imx: bx50v3: ignore HDMI rxsense

 .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi               | 5 +++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                 | 6 ++++++
 3 files changed, 19 insertions(+)

-- 
2.47.3


