Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40848105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=; b=Sgh3oUgg7gC18em7Sgmkm7oCmX
	vD7e+G54YCbz4hepel3I2UV8J9hQXNlH4jirHac95eDO0BcEYi+IdQ3//BRSW3UkU99QpO6uJ/OjI
	HjcfpOE78T1iVN5D+/oh5UbfMReuM3JwxN/Q11FampsDLRFTftHkKBPaAAUfaOney4H6nTMD7kBey
	CUWrGmRn5Efu3rYFiT0fdzCYOYzGL/MQAv4zxdvcsHKHw2W9R6O458QzXIh5C/IUMdB1j5wDQ+3Th
	FM7anCn9jSku27SQjU5GW6qlPV/5pbeNMvJZDOGdNzQBX9GjWSUKYiMLDrNmDORKcjYblvf/ReNG3
	0hf+5LZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OH-00000000Mvl-2eXQ;
	Fri, 13 Mar 2026 14:21:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O7-00000000MoJ-21mX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=; b=NlCU1cHsnWyZqgh7X/EFH3jDaT
	YzsrCCIPMH/tUJyINKk05jufk2CLej7i+qd5O65gJ1RHyvq/+AedqZ7cOygUDAjsxI3TWi017Hz9F
	KGCH88Rz9pDhwiSxoEH6bEsjf8BSgRibO5YYYcT6RRQ0vob81g2xYiJAWnGpBuxKPDiOXEmBeZo0f
	0vxQ4Llw007orzRo+htmuBHPWx99S6jW84sXdF4ESAC1u7VBkynv0VYLZvZZJaAy1dFgYAsWOBS7o
	8bioZEfGgKaX22izwz0nhNd3HMJm0uzhan2bi1j/O9SUuetJ+3a7bqP1fI32aXPTtWTdxyXUIb6+v
	7TqQ92AQ==;
Received: from mail-westeuropeazon11020117.outbound.protection.outlook.com ([52.101.69.117] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O1-00000003W9u-3tVI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:14 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dODSXmPCAQhkUKpCFqNHMVX2oLpALF9wlAYUErXfchrMM6B8B2uIKHOWN4cAMfo4efDfeYb4EM/sP9b/tUyN1foNRN8mGRlzHFTLR17XAad3cadanSfjsiXJi7c+jU4gqY6Hkwm2hWm1S3120Xgph2PAtT7VELD3w7PFcKQPg7DgQ2M7ykC/xA/ZoFZLr/IdqVojH3neOw7+3iZLZ8gNYVnGkJrxWGaGgQG6u1xRZ2HbRTs/fWzT/a3i8a6NwJ4Yzz4hqyUoj1VdrSSsdDsMhyjQ0Pv84OSit/Mu9vSZI/tWdktZ+yMjqrpCeirmFacFo2CMj9dFQAcmXiAqeA5Fvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=nrDAZeNhpfbnTUMjHokvYwEhjT7KksnJwwEuvT7CrzKzu08kZaoZvCdeTfgZyEs0SeLge/F+hWOGdkoxtKUI9heC2aA5OlO1V0A2l8/tdNxgQ6LJGTmu6vQJcDzr3aXYczsUrx17lwhJG0fM+leTZzg6AhFdj1tEAwjlm8nxj3+YoJ51PiLRvQN9m/SLbdS9g0Dpiu3GGraPiFe2LXpdoH3T4THUa/6udzGAeZcTxLd2v5YrzV+PafMsLcy9GlfLReEIi181RQz5D/lJL17nDSuxgv57yWAKj6Bp9a2yNEdvMBMUWlZaNYzpFt2SdAkE2CrEA3UYtafleTWs4YoDOw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=HS5PQTM+Sx63MplvpEqy2FqbjGADCKJxVwkbwWEPU2ILTDcIOy6hLlcTQc4CsfQxik6nR7N5oSsnC/pzyEZ/TiN1ErS0LbzpYaeDCmGv1pStBO/MJaIbbaQ1ZH+QPZ3VeLzzRDq/uHxtBm2AJ2rY/teeOCLcCKEc09RV2msmF4Y=
Received: from AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::15)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 14:20:59 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::8e) by AM0PR10CA0005.outlook.office365.com
 (2603:10a6:208:17c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 14:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 14:21:03 +0000
Received: from emails-1804933-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 22C3380C4B;
	Fri, 13 Mar 2026 14:21:03 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:55 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozE6YG6qka04O783ubf51JJw3xc2fSVN8GQ1UhSAd1mhH37e0YYEJdg7d+tDAWg4iGXynXctWQ7npb0GMImB4q9LiUfpTwNjvqnbY+9Lev5y9N+/nl5uas5PMpZcauM6QI44LQM+TZZXEQm0Alz65WWDf/QeObmw0aQfeoheKd58S1Wkh1xD3yB4tnuPFRFwvenwauMgcNfYUw7i1VtJDdx1jYwOut/+2vXyv6DIm7+bGuiiwTJ+3S961xdbe0/IXsKMv2DKvaQ2osMMXOcidoOlxZ6xDe+/FjLbL1rFH+ZD9btAb/0ESiVwAgdYA2SBEX0TBr/A9ovTK+PjZ8Z4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=sXNLev4rQHTK86dAsEhsh1qIPRRqkIqvU8ZrQDPByIIK9/SzgAnCC5IXYJdfC9BPlKucUo2FztY6uG0zOL8fGlC4AdAB5UVUvVygDGZeXgIc94s5WnRrucJK6wFG2qRTHcxtJgDK1PsYl5JuEBOFnwEdpFUeJH5QQY4zTvOfK/2XEiM1ihAqAOaqcw7MT/K755FTlIUX+b17spkoAwRDRvI60f+/xTZSvWwUHGXdpvA5dIClvF0txNQrIE6kiGwh9B55x7DIZd9X9JW6XguJRxpgmI0yvJKrb0cCTuq1Gv2VssjSv8hrIp9iTotLO2pG69qY3Qf+Y7p9aWFiLVPNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=HS5PQTM+Sx63MplvpEqy2FqbjGADCKJxVwkbwWEPU2ILTDcIOy6hLlcTQc4CsfQxik6nR7N5oSsnC/pzyEZ/TiN1ErS0LbzpYaeDCmGv1pStBO/MJaIbbaQ1ZH+QPZ3VeLzzRDq/uHxtBm2AJ2rY/teeOCLcCKEc09RV2msmF4Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:49 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:37 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:44 +0100
Subject: [PATCH v4 03/10] arm64: dts: lx2160a: remove duplicate pinmux
 nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-3-aabcf230fbff@solid-run.com>
References: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
In-Reply-To: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AM4PEPF00027A6A:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9c9a50-8805-4a29-5e33-08de810bc21e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: TXYZ53dwHUM83XBzztGkCF5SC0B8TwgJkix5bK3R5EFZ1mcabURR5Mxql9cOfe5pLTWeCsh6GLgSrEXjjOSoGXy6NZVwtVXS+ErqG7EAOJy+qmJV1Wta4Ie4WS29uQi/kzFGOWm+8vyN+1OG4IHG7dzEeLc/GFnkfVs0A9KwLgEGHup7BILOroshPL492yuFlYFyBMfnBLQmFT+V2aVLuMzt9tZoJO1Iy6v0ve2ux8iD2JURxow7qjo2oaTOpFToptZFXzaYvCMSY/9QuWx2w6qtuCvphfTVrPcZ9j5wZLmMhqqMfCYYE0akW4iHC8B7yTCLhlDUQ0wQh3zFTgVc8+s9THBUxma8vOKaE8Qx9hsvAqwzTtwVlHHaGvAjaBxBw7g+twlQ8xkdwqCVOtMY+8Ed61Xd1FJIa6Ha2EMDeiiRm5QkPjuPwxiYex3sxpzNLW4GOozOIPa9+wPRrWgHdcbbsbwHBMyY6xbPKqaxjySclv043gra0BGCGR7g+T9LrSq1dnQFYFqqot9c8L1UIBZWfAu1S0Lui5VhoyabTv570JJBmMQcSo1MKQGO7d7aQr+sJyRJRpSYtwJcKrr/ht7WVLyZHExkoWbGSCw2ALDARfFaHgJJVwGd7RhYESopTJbYYGC5m20I5zFLbJnGCk7TluDqu2e30p4BxFujWccvlKIsa5cIDBa1RoigeZuRN4ad7gp3sv2LyOWRwPI9RXRXj9BE2VkQKS304Bf4Vq35F9va2CYHPWsAXfavPPxyyQkN1LPqnmpk6FIdGfjvVkdQl4HD6GxJX0S9Onh0wN4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: hZHEJ6hmDt2AkBpXb9ObR0I9sGxkp4lpSeefCCAZVYSs/tAJssCU94mEsYfcWQ/bpn5u0HRP0HN1LBhWuxKIjEH50Tei5IQSDUSGKmmUtYtjGODotsg+3rlzb/UKfMsBeeAV8Qd+ni0YF9n4HGYfie5ixjrAHAsfdjbTXr/dBY7ZQPKX+svxAG7qwZp8Kxk9sEPkfWICQ36zlNGi69r09SBULwTt9ybzdbJ1VTuDQ2xVR7KD8l+w0OvOmgJOVVH+SgaYG1Zo+7eQgyc7VNbrFp5vBhJ85C/Hrua6u1kYuwWyptfxYxvV269c9ML4+9qSbF8oxECssbog6uxgvltUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 171f2e04ea044949b966372972d23d84:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: dfd9b067-c2df-4988-4fc8-08de810bb2d6
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700016|1800799024|376014|35042699022|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: zAiHyVkQRe+RI30SIdrjzDK/D1OLGvXi/akZ5bKX3YxIsmt8FT7XmJMQEU/WahdNY+LL8v/aQIxxpG+YxVZ2v/fEvAo+BLJxNuUnahAuqVpft7F3cMbyTapCzEpsXiOkVuUMUwtSfNtTpt6MwxCdKNYktwnUhxxuCMp6vda46QZWYil2pIGHjdsmU3mmlPytIl0yujcM0LSKd7TluftrfHWlwI2795rbfcnaAodWDpnR6NAZVYAemcoML0mLdPh9BdFznRl0hHP2pVUCb8i8aL9rKZxX9x+8yOeg/Eo6llWZVNjFdTKm8aoWCa6OGeuxdUrMUx2sZX3XESU86SCBVK/kHeqJPvocN6fuVWPKF8zQROtwWrJQJwin001XX67VEZ6sAT6VAEegAzCqlR2IJtWiXB0rgI9fqp0PUxpNbl+DUsaZhqg9TPTyBG98MQr//bRB8uIbVEtr238FbQZemFLrvUkngNkYBpyTlExJUDlpBqeDbNbTF3HqSIcRC4PyEoZGc3Zv4FFBkE7ggf81QDl1DGE6aTgkpdL/7HLq9kKt8km6ln/hgP6AvtyO1Fi2j0/xMcS4nljYxqGARyROyOH1yxjPn1NO0AG8FjinHLnuqVSBbzRF27ubQ/2BlxCTGmtSbTciLpJQ4G3Q2f7Q5IMDMZ06WzWAi6HES00yoLn6Gq2u1fuddScl1sk/9K1btE3S5wJCxW2bVlXswZ1sn9TX0+1mUOg7hTgdzBYcPFA6v1GVrfzWCbL53fX+wardq0vBuTXw0ENXfqJ5YLnYJQ==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(1800799024)(376014)(35042699022)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XeeZR3N8aDPpepcmqV+U1+zp0SFWoDZ8MeTilg/vM7fHK7gbAzfx+eXI3bgdlxbiH6xCT2emGjcZzFZ1jPC2DbXjtonFL0xUPCHRdZHg+vYyC1RVdVglUVLn/yPyp7YS5wYKyEmZOw7cw9gisZ7H8dOfgl9jmEbyvAmDmk6U9zxC4BbxqNU739F0Qkpdjp76JDNGVnQiDBkJNnvTLZJDUjitPKAF9oNNdf8QuR9y1SlGKu/RsDiLZBHjhYPV+VK5zOOvDg1pw47E1DHCmND3NwsKEi5dZKoG8eNJGqRybGT4ROIXHoiolSWsOujjcVKlrIOWKj8O3shza21jOUkjQdR+xHFeFlyvolnRtou8ESa8NXfPELiBAMOQRMgWHTk4fcn3+K4araU8InobaN+pDWBQd51X6mrIQof4/Ad+9w4ts7GZpDviCRwiP8ISPosV
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:03.3565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9c9a50-8805-4a29-5e33-08de810bc21e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142111_113142_F437544A 
X-CRM114-Status: UNSURE (   8.35  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

The pinmux nodes i2c7-scl-pins and i2c7-scl-gpio-pins are duplicates of
i2c6-scl-gpio and i2c6-scl-gpio-pins, writing to the same register and
bits.

These two i2c buses i2c6/i2c7 (IIC7/IIC8) are configured together in
register RCWSR13 bits 3-0.

Drop the duplicate node name and change references to the i2c6 node.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d5bb55df03216..41c9b4253f4a5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -862,8 +862,8 @@ i2c7: i2c@2070000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c7_scl>;
-			pinctrl-1 = <&i2c7_scl_gpio>;
+			pinctrl-0 = <&i2c6_scl>;
+			pinctrl-1 = <&i2c6_scl_gpio>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -1785,14 +1785,6 @@ i2c6_scl_gpio: i2c6-scl-gpio-pins {
 				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
 
-			i2c7_scl: i2c7-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
-			};
-
-			i2c7_scl_gpio: i2c7-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
-			};
-
 			i2c0_scl: i2c0-scl-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};

-- 
2.51.0


