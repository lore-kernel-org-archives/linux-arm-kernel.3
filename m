Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1824CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nh2BwXcqSdTeSsYJqkF9RIrGlJ0c8WcRgaO9lphJ/XY=; b=B1A1pzM2+u1seF
	JH+Uu1T8AZUE/QACB8IogNR9VrhioDkzJ6JEO2ojSWVhxb1UwsKyZuVX2ACl6MR3tHG6BM2fH5Rap
	osIOFGHB9XRgaAKc9H+WBVx3jQTJAE5hSRyatM/ZyyDgzx+261f8IXiK3L4DnVfRQQtCQ1VRGge7d
	h8+hViul0OXs80MJdg106mn+bJGyx95inI5ogPBQlYP2DliUXKx8CjbYR70gbtcvvEnBWQtBpUHH+
	UtJA3uGvoFecU/SIwNPqEbEggZS0IQ5PfAwjeUUqlUOZhR2jbgsz8weZdd38rELn9pKhDwPKmEiZI
	DAECiTA14mPZNkrA2NFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSeA-0000000FEjd-1XUh;
	Sun, 04 Oct 2026 20:17:22 +0000
Received: from mail-westeuropeazon11010016.outbound.protection.outlook.com ([52.101.69.16] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSe7-0000000FEfj-2hI8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7G+hfE7/ExaJr4yqG4y8neUC2jw8B0HK4uppluTe0ki5vVj2IBraGmWWQhNHEXKFasMYw3Hqe3s1qMSLFTfvlcG2uX3l7AnCAkI4HD9mXlNJpJHvNQdd1CqrHsXBXe7/t3LMLB+SUQKh11M/nNhFlkEU0egJAoFuJHWGbSncm3jaO7ImbzyYrDZulj29M7sb7KiTFLgZ9ZbgdbsGp6q/xOQhMw4EzEM4FIZZQOdCF8PipX2rspIS883cGjMbC83OQZuOvfGgTLKPkLTPBrmUwb/AMzoz7xstUkeupXT25H+x7u+/KfLWVtLmqE0WP7sBX76fIU3WZICWQfjqeoT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh2BwXcqSdTeSsYJqkF9RIrGlJ0c8WcRgaO9lphJ/XY=;
 b=QtVs3i45v1T3gZYKumW4NxcQ2arzA9wc1wa/y7K4PP0d2OPkPqW6pdmCQZclhvna1ehH4ShITGm4NBdEasYnjGfaxZUyb2CfQhVsyvfn5pMtJ8xvIF6xZ0ZZnDYdHQAgq/mv7otW/BHo4xGZXIE1AIus4TwwYwM3vR1PCUXE9t5WC1aPsXofOY0pgm8lyjJaDcaPWNQcRxP1q7xs0OL8YJhRCk0BicA6GeBMBchCt8LpPNbkEKuZ0P4RWas7XWoK6iP9112yaZPJjlJ080b0plgZdK1dUGoZqaguSO8MbXqhptxcDpUs4ZQ5trhVeKyQCdPAfXvknWTuMcSMN/4DjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh2BwXcqSdTeSsYJqkF9RIrGlJ0c8WcRgaO9lphJ/XY=;
 b=PlvnV7FSz6XMJs9+oppLCcK83vMieqadouVAZFVaWFQv+OoNL6VH2uQ1WEfbQfRhFea/uGWoKFOWV+PQqZf5SBWnAKl9r59t1phIGARLRotc4MVzdSOta5gZmzRATbpim8gO4TlkJWR4RcjAlIblVffrUN5aNxg9StRvKVO4XmA=
Received: from AS9PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:20b:48a::9)
 by DB8PR02MB5948.eurprd02.prod.outlook.com (2603:10a6:10:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:12 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:48a:cafe::81) by AS9PR04CA0134.outlook.office365.com
 (2603:10a6:20b:48a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:11 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 16F304C10;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id EADFC8039B99; Sun,  4 Oct 2026 22:17:10 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Subject: [PATCH 00/17] ARM: dts: samsung: cleanup Exynos 4210 dts'es
Date: Sun, 4 Oct 2026 22:15:57 +0200
Message-ID: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6zwmoC/x3MQQqAIBBA0avErBtQk6KuEi3MphooC6UwpLsnL
 d/i/wSBPFOArkjg6ebAh8uQZQF2NW4h5CkblFC1FEIhxccdAY3f0W5k3HViq7XR2lJTjTXk8PQ
 0c/yn/fC+H0IRO4tkAAAA
X-Change-ID: 20261002-exynos-arm-cleanup-944a44ce73b6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=OFEjfbdS8hlAlRBrBMu9TdG7lxfFOSKHjjSP4vHUZwU=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQcZSZXy98KvkPWww1v4QqbmQLdVxgVKngVq
 70C3Ts+nC6JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0HAAKCRCwB25JC3Fh
 a2+KB/4rUhMSYcNI5yZ79tABYbEIFtwaWFXq+AGf+u5iY//gE6KvsOPZkiRE2pEjyJQfO24e2Pj
 exjjaLfY0p4McaW8q6od67cxhYo7vUxE2f6lnmUh5ur08vff1vvHJQOnbyigrcUtBczWZOfC5DU
 z1ydC04lodmRPQQnpc4g59YT/bHWSGc0jw9LmwyoeWIzqKpnnKVOdlKskt8KpQUyIp/Hvu4YuW+
 T7ckudEI9nX1nueefehuMMnb5Dxj7Bj0/EuCRCBUHaNSP3zhec04LfMbiPclInBPHWaUo4+ueIn
 Rz9g8sOKxJcsHrZ7pukCEWCi2I8N8uLPIAUHZ3TVdUOeE9NQ
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DB8PR02MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8e79e0-6889-4066-bc00-08df22547938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|30052699003|1800799024|376014|82310400026|18002099003|13003099007|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Vyhqz1zl8SqfJ3yojfO1R/0zrI9GoImRldihWHX1KT966cbCDY8NFstd0/iyZ8fWGboAb+n+ANqlXew6ZokH+v8IIYW8rhz+QxnemTNn+nvhxDJgbXMZ74MLePZI2NX6AE4w8usZxZM6fkBOBFmKpMvwlU3Znp2AG2sR4ll/TWua+/nelDw8SoWVJ3l2NcBHdAAxi4TOPMA6zZBKdklpdrdjTKLV+oy++9IAzBRPU/OmjoO4LgC1TcQ1e2dOCbMs+OKsl7fxrMaZhptq3QZLR/rrDuQNW6ctsEc5QYFJwp9ulOe0IVGOm2F8rByNftB308SV7iBrqz0ogqaQH3UBG6hgKHXrVi4qGJswCE/WtQVePGEOeKXrPV8Pd8cs28gmSXjzxrlnEiMDNhUe/TU5XV0iTWMbF2G2H7KuEpEEHOTNwc61nEmPkdIFaTAAGW1MMoKEGv9j2BYj+BsStfguwC8Fg8bPFw8ubUzC/RtMlciW2MS2zadHpaanXGoNeXDGC7uhUBGaAb92+aMdx3HL4bL31RWHALlvRnXz3FrYJOLdikPrB0opv5kkwUJHK6ada15kHVGKGJGUOalWX0RiTuapSwGeJdlcM7iT6M+vGD/TiMeKTEG31fNVODWVhBtnfStzbRvPXKp5SXl3Slg5LpeF1BaDZpa6XvxulUsm/z8UUFNmr0Y92P952HRzxvi7zF6Hog7cr/dfOxpnnMMtZw==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(30052699003)(1800799024)(376014)(82310400026)(18002099003)(13003099007)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D7dOWz2/WTTTdiLTHuGI+d1gq9sHcLMfzEU6Msyt4w2nrg6Akeo4fgTgzgU9IlEGSwkgjTjOXpoFEdv8+GqKXeMX0aREqoI9eiUIaw8R7X0lN66D9kVZ2h+NlHyclNnJG1gym/w81GpoU4t+uI/e4IsGgh4DraqTiFybSZqXOn6OCp621Js3HD7VyWMLnyaXHLmtApCwYyUEsV8zs5NZNokijHjhDzRjF+YyWRlSbrXw4j1wc1JyX9VEIupAO0GpJPt0hd8e561IY4n1rLD7D/gE3G0PsVdAQWbMho43mVDaVzhD13AJxHuigA14CROHN2OuSksKdfwdLxpmdM767KQNkb0iMPgEAz27Jg3W8Bd7HUIz6mjZJWN4RFe/Sj8bwel2L3ito3EDOTl+/OGXbNqOLou6fcqUfOYryCJNtAywKCmB/Du99bhL2jjDTSYz
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:11.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8e79e0-6889-4066-bc00-08df22547938
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5948
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_131719_728695_6F58BB31 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Fix most of the warnings that are reported by
scripts/dtc/dt-check-style in strict mode with Krzysztof's recent
fixes [1]). Waqar Hameed's dtfmt tool (described in [2]) has been used
for some of the empty lines/whitespace fixes, to decrease the risk for
human error in the process.

I have started with just once SOC to keep it small and make it easier
to review. Sorting of all the nodes, and dealing with all properties
using "discouraged style", are left for the future.

Series has been tested on exynos4210-i9100, no new errors during boot
as far as I can tell.

[1] https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
[2] https://lore.kernel.org/linux-arm-kernel/cover.1790629313.git.waqar.hameed@axis.com/

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
Henrik Grimler (17):
      ARM: dts: samsung: exynos4: add or remove empty lines
      ARM: dts: samsung: exynos4: order *-names properties
      ARM: dts: samsung: exynos4: sort all properties
      ARM: dts: samsung: exynos4-cpu-thermal: fix indentation and sort
      ARM: dts: samsung: exynos4210: sort nodes by address
      ARM: dts: samsung: exynos4210: add or remove empty lines
      ARM: dts: samsung: exynos4210: sort all properties
      ARM: dts: samsung: exynos4210: use operating-points-v2
      ARM: dts: samsung: exynos4210: align all multiline properties
      ARM: dts: samsung: exynos4210-pinctrl: align all continued lines
      ARM: dts: samsung: exynos4210-i9100: sort properties
      ARM: dts: samsung: exynos4210-trats: sort properties
      ARM: dts: samsung: exynos4210-origen: sort properties
      ARM: dts: samsung: exynos4210-universal_c210: sort properties
      ARM: dts: samsung: exynos4210-smdkv310: sort properties
      ARM: dts: samsung: exynos4210-smdkv310: sort child nodes
      ARM: dts: samsung: exynos4210-universal_c210: fix alignments

 arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi |  72 ++++----
 arch/arm/boot/dts/samsung/exynos4.dtsi             | 187 ++++++++++++++-------
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts     | 125 +++++++-------
 arch/arm/boot/dts/samsung/exynos4210-origen.dts    |  30 ++--
 arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi  |  42 ++---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |  61 ++++---
 arch/arm/boot/dts/samsung/exynos4210-trats.dts     |  60 ++++---
 .../boot/dts/samsung/exynos4210-universal_c210.dts | 114 ++++++++-----
 arch/arm/boot/dts/samsung/exynos4210.dtsi          | 182 ++++++++++++--------
 9 files changed, 522 insertions(+), 351 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261002-exynos-arm-cleanup-944a44ce73b6

Best regards,
--  
Henrik Grimler <henrik.grimler@axis.com>


