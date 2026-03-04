Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF2DEB7ED5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=; b=uIKCtoWAyhmPL+xuEGDo6M6zwH
	uX3K3shNC0YkNq6afbUMXUw5z4M+Ql9rh8dMmBtvnnZSEMaPounyxqj6e+zMSpyg96nQ5k/y0wJTZ
	5BMvf7+VYWtPPnfkQmxg3+/joaDfiYB9ZK6YKjH/RrEldWFZJ0ZXkin94HkVdmJzA7Uj4gYsJmNiz
	RF01AVqcqcCwp079B6JP7vUv5YIWA5jfX9DW7K01WoD6M3bjZNB3wpKPTb9HrcDywJlV1mqtMHlhE
	y+WxPpyCR1/Al1QDnbtBXA4uWwSMz4uRZIv6EcZ5Ttr+JikrIezlandM2tid/+aW+vg+/OAAU9ksz
	zcaSTYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIP-0000000H4dr-1ekA;
	Wed, 04 Mar 2026 11:21:41 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIM-0000000H4b9-38UE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:21:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zORK6i5LiJkVB451fCH7kqSqAtNlOihBDU2L6gAn+q3Sk4ixLDdE/xpi8gKS/RibXhCk4UusGqajW5rULU5YN7zI+Vz/XbuPFi/C2YeROHnXcm9NJnRA1BoGV24wYSaesTTDCJMmK/PlN2itP+cRVStmpVDtDOiNjRWDVc2ETgq4wOoUXMJQtyUlGU1BLo72gbqV/rSEgroy073HQF981WdY/ZB0CaIXPo0LCh4ddxNI3Fu2sEf2kiclZc23VcFir3C8Y9gwxaZCRHPSPQgYuFHuQfp1ajwoR4zztLUffqck1CI3l5nua6Fwz+zSnJ3Dd1QSfurCjWlwlNZTXiBgVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=rLpTPaUj0LfRX6dsxFMGqkOB/CUi3s136l/Vi6N7y1INBfcWy40ZfxDEQRfa+2mSAsmdzqVO4X4vBTYmmLUOHiL0c5a+rdmS917JzoKdH+wKj/Yf59bV0Ezj6gMhfzTBNudjeUB85/2KKrGl2BL3C8RNDrags2iASOMY9+KxppNQaghPW3QrqJHnBDtMAz89sGJgpOrzrLa33bU8iPfcjU3/k5/80VbKmJz1HhEmCIZsEhQquPGDSPQRbNhtj7M/CfOGrAcy7FM/EieyWR3Ry4uq90UbhGJ0JI0UV9ZY72GfKHR5mxZ6P6kelD099U8nm/SsvuJCZmFHtaUy/UvBSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=i6k1fYh6QcZkCwyu+WLvAya9P88brwAuD/S51CwfXmusw71Pan1R+mOJQ0LglW5HzpeyV8klYwi3xuY8VS9QQBmlTq8iBOAcUMWC43dkwkAWT3e2ZmbudJr2VxEPdANOTJK8rWjWDKlDZHpN196S1kK8gl2gHSPzKGeYXXw0hBo=
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by PA2PR04MB10124.eurprd04.prod.outlook.com
 (2603:10a6:102:407::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:35 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::d7) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 11:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via
 Frontend Transport; Wed, 4 Mar 2026 11:21:34 +0000
Received: from emails-6154127-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-166.eu-west-1.compute.internal [10.20.5.166])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BC3D980645;
	Wed,  4 Mar 2026 11:21:34 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Mar  4 11:21:28 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6xLdVnyd3tSNQM7Xmeu7oUrNFszpkppsrDM+ax9FNY69Ez5ut35HeXrvXyPrg62s17XrDg+aG9g1U4P0jJiJekjxYQmgvZKd9v2qZ8+EKz6HIbia3e2NfbfsMdsutsKPhe7Ms4UsVuw4Wg68iwWP3WI5zepAxrd3BRyASfE3ROF6hV1Nl83b0cSAKHg1j0ISVLk8UN9ytNcogNUmV8SdakdCBK+87fXva9wxSB1uMLwOpg4r2o+TFxWki2PZ06oy3Lv4ho9Lklo5wps1P7/crcoSHNT5X7ZtcNnMMSkldIFzJpxOe36Cp3mWakviKDELnDRRNaWW6c0MG5ozuez9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=pYQQbm4u5T50uOK7cHIgtiUXvHsTADX5WQTl6tWZMhhMjeFjmghC5zvHi7+WW2RqiCHMC+02uoY8eBKjc1D/BjovdW+ynlaeNdUNtugjKronPBpOsdRnoqrp/g1ngsQnEcI83DsiXziTrfOu02ImBORHxzagBDFxmSIqgVYCwc1y8BhbAeSN+etZI6jNoyPog0Oa188AJWEAYBFXO5mCzeIzHnKhIfxAl2L41NjaIAgn60z+Jsh/JFB0qnn6WKvEYM37UPVCBO1kf5PADaB5eZf7sHbmLdNWQUu2Fl7MIr6H/NI1F8/gtwrFEhwG563v1bUh/SA3QvMgvW20/p1ibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=i6k1fYh6QcZkCwyu+WLvAya9P88brwAuD/S51CwfXmusw71Pan1R+mOJQ0LglW5HzpeyV8klYwi3xuY8VS9QQBmlTq8iBOAcUMWC43dkwkAWT3e2ZmbudJr2VxEPdANOTJK8rWjWDKlDZHpN196S1kK8gl2gHSPzKGeYXXw0hBo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:21:22 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 04 Mar 2026 12:21:17 +0100
Subject: [PATCH v3 5/5] arm64: dts: lx2162a-clearfog: set sfp connector
 leds function and source
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-lx2160-sd-cd-v3-5-dee4523600ef@solid-run.com>
References: <20260304-lx2160-sd-cd-v3-0-dee4523600ef@solid-run.com>
In-Reply-To: <20260304-lx2160-sd-cd-v3-0-dee4523600ef@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI2PR04MB10979:EE_|DU6PEPF0000A7E0:EE_|PA2PR04MB10124:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b02cd7-d08a-4387-f78a-08de79e031d2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: /+JLFIkQtyJj4KqKylHYUhkVP1yU2Udpz8PhWs+gIv65Ug9fGVt9LlvIgd634HfxqS284mXYyvp7A1xH06l/L4z935EVx6tLk1IioTDpHllpRaW5ZdzwKWCVvaEOzMp7dV2MXc5IEhTpeGAY6MuZ2EPUzwmNQ5E6k7C/bzouN9zZLNCFh9x7SCX84Xa75BNkFZeYwV0Sa2K0hdZhp5V/BR1mxJdXJcWbLQ6HBZKHvqdU81JK/eCx2TEU/VCG9q9GgfrZdfVORKS7UYJgsPUExNaYDJPyZreyRgHPa4pdpE/VFoS0CXKyswrblxKqaLNYo8FVJ6dmtCP1KxupgrqR+U1J9CQd6QAYwVVOa27ofySjIUUv45uNp4iNxWNBSlSyZJZqU6iCsQWodJRPFL94/oIk3F4QZIaAwP02Ahyv+QzN43h6yEjNr9wFhKh47hdchdeLBqOic1EChayF2ZZz14yfRrKqXKCy5IBAaVDQi1TUVM/clPOIqCsXPmiVdqY+pI/Ru8txojZHuCCFtX0dviOBXwvVnmMEy8tiNT53lQKHns9hhTSsZX9yUPVsVS0UoBR5k3PKoC4lJLi4KvnVUYgCInRVoOsDCS0Ueo8XB2lrnMPCYAKIqQ0tt3gf+epQ6yuGQ5ORojn+BAw4ThOUAmpkfjoaYhxEyAJJBl2kmQT5xGJwtTR40RO5tD42lTJ3hjvMhkwJlbDJcy3yh0WHZddX3WfClz1wllYYPvcqStKfbLr7Zyt4X3QY8MSsOHlHIWpTmVRuiUAU5uEhW7eGds4ueJOMYZDzrySSo7bw20o=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 54fe2691756f47ccb4f60a55b4df73e7:solidrun,office365_emails,sent,inline:24fbdaf47b4eead4bec4b5d78012f82e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a9b97948-dcc9-4e08-79e4-08de79e02989
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: gTRecWqBcGqB8wXMYI/Sk6LGjEGiW549YqWyI3nrdOzGIT48rjZ0x0ESPGwzy1mSlSyZF64IAxwyHt63TAxZXCpXy8FneJ1vVgMnJZxCRsw7CZ8xVLJ6AH06gasYY7QlijG6SOAZdW6cplPM58bN9rSfEsejC9rRAE8eEi0msAZo3IBBPG8rJBqpsruRdSgjHV/nwXdUBa5OfHOgihOvIr2fSF5kvJnZbO5lluE8QWg+LOs3r6qiSWPPyV6yKgyTJv4bOYMTPokE59HXorRRqX2D5a7MxJDzT6X1/160dHJ/JOhIybZ+r0zVhGu3W19QbuuvM+f0bh9pBm0oAe4kiK/avPDyW3jq4gOO26r/X/i9gWn4+RQXrZLsokJTsPwheGSFtY7UB23tUzytKmtdYVDVjISoedjVl9mnfl8s1kVvnb9M/7lpGvdHEMyoWM6dB0iz97VwrA2BN6kSJjztsEeci2znEwmRZlOPNMeXMA8d9f1U0YqBu8fLneRO+sXS+Xt9tsSzZNyjOnYORX44Qk73zEhrnk4LfmBWEQeCZiy+OMKjNbnEFw9wDyyZsurTY0SO+nlOxifhZMEijj2lw/3nwDUzKmcWymP+s9vfkbSEeXD3WItq0WBhKjsWWqDTAFGBXlO99r9w44rr5Tb/BFzPvKix/jATdb6tRONjAbvGVKCahdAfMcvMip+jO9hbqAs4kT5dinKXGV0QExPmTUFQ1l8jtcK9iEMsVxLCywzFTzAhgc9u0QY/jwD39VZjMVxlpGH1IwbPoA/5W4knZA==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ofWcbvGS2rgui03ErWjl0YMi0PhSkCK1oaWseuEgLDFoMotwuMZuh1f8P+L6LyqAghpvnHR6eOPfenPAooNCGLeoEOF9ouSjKMi38iC8AkAlMnxK4iZR4EwYF52re+wqzTMKktkABoxS2z9T4j8tZJF+c/2a2jVSXnwHhzQMkmQax6ZtFgcirBq3Te4mmr3zGJ3Gq7nTyIGfbjzFtMLDEAeP5lmhmBem1d1V0zevdJV+3pI+AfFOTspgXocJ75ajd9DG0zBueRp95v/T+UHLX806TKmbFmH+sKAF8Eg1TWD4+3D7G3NcLoy/vBmvFVNGSUN8hjXdgYWh9Hv1mK0UsKtPgyVPFJpuPcUvJFyjkn4s/+MsA2I1dO/WGE3DgxcjATJ8ULPU1aH2aVw/kpgnJDeu5aGXy6HYygf0Uewgv7mfrjh/C1g8iZKy3/cLUAQ6
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:21:34.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b02cd7-d08a-4387-f78a-08de79e031d2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_032138_794170_D707CC6F 
X-CRM114-Status: UNSURE (   8.94  )
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

LX2162A Clearfog has four LEDs attached physically to the 4-port SFP
connector. They are intended to show information relating to network
interface status.

Select "netdev" as default trigger for each LED, and link each one to
the respective dpmac instance as trigger-source.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 8920326a06735..9d50d3e2761da 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -41,21 +41,29 @@ leds {
 		led_sfp_at: led-sfp-at {
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* PROC_IRQ5 */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac3>;
 		};
 
 		led_sfp_ab: led-sfp-ab {
 			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>; /* PROC_IRQ11 */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac4>;
 		};
 
 		led_sfp_bt: led-sfp-bt {
 			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>; /* EVT1_B */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac5>;
 		};
 
 		led_sfp_bb: led-sfp-bb {
 			gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>; /* EVT2_B */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac6>;
 		};
 	};
 

-- 
2.51.0


