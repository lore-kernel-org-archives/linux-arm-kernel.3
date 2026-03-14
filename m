Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0967010706D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=; b=kAnUTAfgO6EUiPe9AJZB9GzQOw
	mtijRPZZprh3UxBPDZPnLflETBhehs0+No5/G67D51+C674DRXHtYHgn62aw4s/Ml1+HA01wzBRKY
	OnJwtMHC6ysM2D54We6J82wzhLzdzRDRujxcB2C+Q7Y98pl9aOQqeinIB6p6/u3Ly2sm7BxPXll7C
	xYz4m/MY3aRQnhiNPy/mzAi0bbLGcbHNM86w3QZxvUUtLi+4Fq0wilXXuD0pmCyMP8lxOZAMwZOtW
	ZHqoX0yohWhhAWsBGKfftK61VWO1nB8ZnjQhyks9KGGWEJXCv5KPRrbGcvzS8ovafLes1eh86JxB1
	oQUUvLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nke-00000001o1y-2ab8;
	Sat, 14 Mar 2026 12:05:52 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkV-00000001nrP-1vb6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u7dSscybVROrdMl1sy69ZuJvIHGmTOCE1Ni/9/d48zRoTngCQo4BjD+ucXPMITDppnDdHQpNMNYvEYIs+7Vr9SuVERfV5f21zJz+lms5Es65/aQ2vHOskQ6ch7x7YNyYJpNkdegLOwCghIdKv7fqYO6qsS4UNunLahWm9i8it+FzMqI8FCUshvF+Y+RabxOW8BE6jqabMZXRScvMzeILtBNhgvutzdGVO0TLozUEE+ESCGxyiONyVSoggGX8RdCWcoqIPHriXJUUN2yFVoWsRsjyEXimwFUmVaHRx6Jf0ZSriAcy74XSNVuI8/6ZwZJQ/ieTEYsFvMGMvye8APeBhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=o512lVEKpghZwypouagginvdwM3MfMmUXg7Us1aMZ1HkCHKbwl66N56uAALMPjGcGU0CAqNjasGgBUu3X76Oslrrkse5703wfMFesdkFBqMRLbx/XMxX8VTasrCE8jGBPrfmgHUR39lToKMXKp8z0AOorO79vxgR2Y+gBA1BO0wwUV/tAz/mV+T2hOxAYO250iskkoU64v/PXZjXCWE83XT8f/q63x9ZoEwLTxv/2Z8zVc+CMyoOkS7WB9gphS9NoJ+8zF8mSvyF5vy7BeGIpuwtpKBu461u07nHIwBFsqOgsSxM88epJyP7IqIRu0zoCEFSQdhelm0VQHn4nwwPrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=ihvxYL/WaeS9kzXmWjW1hsJ1D/mY6aAxG8VAv39Ilz4tusxCs7++SUycS3e+skbSIJ/YOnOUmOtyhUZze8CfUok/wFymOuOUOrMbeRE3al8G6G7ngqFLtIn9mEl75OKJPhwMESJ045l5SQDq1JwhSqTyph4VJDpMvH36Df2f7d0=
Received: from DU7P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::9) by
 VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Sat, 14 Mar
 2026 12:05:33 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::4d) by DU7P190CA0015.outlook.office365.com
 (2603:10a6:10:550::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.18 via Frontend Transport; Sat,
 14 Mar 2026 12:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Sat, 14 Mar 2026 12:05:37 +0000
Received: from emails-2311019-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0FA87802E4;
	Sat, 14 Mar 2026 12:05:37 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:29 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fx+I07f3q8VjThGWweMdui2niFdKRtHGlIt8OzSF0zcm3kWO2B5fPappeIN+M7GVcke//ZSQ3VPpg+CeiLOov8+r4Fy/zWpx2uTrd3++VszSfQIqDoeDiyK7siSEwaZBcHssprULatVhXtKOj1Jy2I050n3zSDaJKGAhNGvhWv6dMHjfPhCbtOcSXWKgvZ1P6w8ByZ2wVYLRCr0OGt89vaBM02lQGNEpo58tqh44O/B8hiilNZC6Cwqty/p7N13zpHesqBV3CTNRHszsN3ooBsby1j3JSLGjn+LBqq3GWcMuV6U336481H+0kcIeqcqPKyPPHd+U144wI7jN6Wmccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=MBT5Qs5cyjBv0WY1ZW8kOs9rRKTT9Tv3PftrLckWl7mV1uMmUPZjYhIbCHTCb9ZfH2iQiu0dItM0GVzeQ5I0RiJw4PX69OaE94Qd9RzorRnTLI91pnExnNlQ2FkbE5w+boqxzCAtjn/I9sIsxsFwzUmrNIfe9QnRsWmBV6rCzJRxfOKB0Y34olBeyA//+gLkx1WP289bNcf5DouBzFu4ZN4r1xLsTKIu5RKnNFvOpojWQPUG+ugX2M6hZgJHTxt4se+amg6vz23lEiQ/j5Ax+6WtffAW9PB8HmejHUvbpAXxj/W6dn3Y9AX4ElbD8n/XzFxhSzTNBbzclZBnm9k1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=ihvxYL/WaeS9kzXmWjW1hsJ1D/mY6aAxG8VAv39Ilz4tusxCs7++SUycS3e+skbSIJ/YOnOUmOtyhUZze8CfUok/wFymOuOUOrMbeRE3al8G6G7ngqFLtIn9mEl75OKJPhwMESJ045l5SQDq1JwhSqTyph4VJDpMvH36Df2f7d0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 12:05:03 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 12:05:03 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:16 +0100
Subject: [PATCH v5 06/10] arm64: dts: lx2160a: change zeros to hexadecimal
 in pinmux nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-6-83de721585e3@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
In-Reply-To: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM7PR04MB6805:EE_|DB1PEPF0003922F:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eebf0ec-8829-4091-f4fa-08de81c200f2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: e9IoDVF4Cm5qNak179+FB3HO3aOKtBjnvvwhbH1CnNpBTcyVBx+hVFFxPDNnf8t3CYTB1lTtZRDGIiZgtCp6uPH9aSaTaEh1ILmBzkz86RFvBmyPFc7r12zxfjYj3bAhjLvQOy+BZk6IXcyb+Uu2SnXSfHsupyZHuwEnWOY8SBZ0kwv8LBmks5wv94HPK37qVXqkKm3cOTwlvdSiByYrLtJRCS3LQZ7ZR+pBwEo9iZxiYLsjddbFA+ulOaFd2CZQu63/gsh0CIZOzvaWbWavhMjFtAzQ9GyOklD/haF9aTxOzAy07d30RMAfrJUANEtQ5bn1ydsxjDor9sWXrCJ3XBXDxoqFMk786M+C9iBEKNLocOzYPDfrhU9E06oKAf8VVBfCXXpKe/UBf0Pmnynl1DKIO7aEuoO71m5/iaAXNY+8MrIq70K8ZNeHa5RsHS8XKK14BH/Xoktf0Eq8nqJDYj9fFuw/kFvTg5eYdhQ90dOtf8HVjKv9+Ns5D8dDo63JjltTs/xXQTWFFgwW04G3epMj+jb9qse5938Yd7nEgeDdlBIOYGaAA/PaxtDw/Rwd8qGc8K54DsBCsPCo0MQYK1/+blJJgzHGIm97uvYz//jjgb0FmqfwnkZKaBaz536pH/xCl9wy74xq3Xz4zagHOF+cbk6u4qCpV5/yEuVU/BtycaxrVJGUkt0GBwemanBCG/8tj1clIG/tsQS7y2mbXeEzB+OjdtlmkYlL6bXayFBbqH35Ehv9zDJgH/MlIHPMaRVDX3gtEf2ASfnM+3CQVQCjzuN8ih4MIwweZ0uENd8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: haQqix3gMrkPDePc5KbfBJlwReFxdTXlX//S1prC/s2PabxBcVfLuiDyzf2VXLpb2JuBA0ap52quACf+EZMyGXZ1eMUiAyLmjuip77mAMA/N6ZXwJ4NNAski2oVyb5BlcEK8FSSIwg4/M1HWphdKzL1M819MSpGhWCq+b9zJrlyBHn/K6423d43XrxHD+fimWwE3MC/mUa5wVf6H0cIl/BKs7WDBCWL7HHN9GJ2V6VCu/0Ka3Ln/jZony1IopKpLUR1NklF+pPxr0NWdQKY+heFB7OAuLW1UG2M7Rqh1/6Zb3MWuldxX12S7Mi8LzojaCMfQxFETgiDxlxM5GMYBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 19f01c8db26f4d41b5d11b240644edc9:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e99df103-a8c4-4a1a-f3b4-08de81c1ed00
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|35042699022|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: V1MYR3ZCGaOV05YbvnQw0Q7IuBs4RG+C0K8CzLmmnlfXGgn4N2JVoJOmNxdUfqvU16itKz8W2t9BUT4Q3P4hZTuI04yz7nmCeLNYiJsn1GJRbjbnkngHRAl0DgCgE/08Y2eXhX8bnnEY5qfq1sf/P5qzNFRqKdmh33C5o3ecroNHwESXGCH9OVDIICXrNQabpjx6zX+h0NjfiFM4CILQl71gZmgVxoPZPm2AnzLF1fPkeNnntj53r+4jSjsH9qGAdkDDeUho9gDTTvKB10fyYCkpiIBM1bOEjHW7XzoTBdpgSEeRKGyJGqpEykwQsGVOY60MBsy2UgpBmPwGj+wmHs9qEjixxvx2Z8KWK5SHuxKL39Xg0LzuE6G0evcF5+WJKbD48E0ITUIDJpm5ZRNshG6sQDFUNg38a9HnWvlDAQ1ON96Wl0VRhIZgwsTGyiIk9eD9FaeZkFPi46h5krE5Udp6RHIy+GZaI8cA33zTO6tgIympGGDbSPP0UxoUF4slsmVlUFhvXWdo0HZ+s19DdEjC/G0DWhgZUDYUnPZtZZbOAbp0/eUfob6w0g2bsus9iwD1BRjwJMRW+kf+IordLfk72ZVgkiQMGIVQuKCVoGug6MHk9Gj8C7r8ARo9m6KVNjsK0mydELE+4LtXj8+8xwIQPZzaSmc8vzsv0yckHEHLinemDROvUm83GBwkao9vWrV7CqAaluqBqDAs6XFhI09u1CI+pC5OmvHZxEas9lDYVlhZKXIPWKQ4ZtTS/egTos/+DjoUEpzH/htFmbCG/Q==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HqhjO52YqYths5mq1DJ2Rnxb9zMrchfHUTKpLdR6u8IXh0kyuNi7SJ1RTA6d3lF8tmh91LCRgeXWh8NXj/K6ogWwwiol4cP7ysgNW49qjCZPnk6NJcyFuXpVU5PK5ohU+xl9IACZt6FjT36xs98BykCtZlQ7HdAzw5RYTJIcMnjrHSPjs0js/0XxWLEupRGDBMoZfHXxaQuJkbFQUgWzISHlAWORJKItWWVLnJCQIth0rjdEcFr1SlBw64z+x3romY1YRgApNSAS51jR/JLjHd1+ODnQu/VIu1nTZ2U79IUAF4fnTUrLBnzznEfqmKFbthG1B0rz06fXOOA8518mw84xbU8Ayh/llKXMi95tUs4fEGUWDnc0qnA1Ms0j2c9e0aTttLWod/+GEvgcaDBbcxriWjt3Sx5V9Q6LbDjMqfd9B/WHsO4lc/wbDGirrEa3
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:37.2331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eebf0ec-8829-4091-f4fa-08de81c200f2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050543_553143_C5356284 
X-CRM114-Status: UNSURE (   8.59  )
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

Replace some stray zeros from decimal to hexadecimal format within
pinmux nodes.

No functional change intended.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 53b9c5f1f1935..d266bf96e2c6a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1722,7 +1722,7 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,function-mask = <0x7>;
 
 			i2c1_pins: iic2-i2c-pins {
-				pinctrl-single,bits = <0x0 0 0x7>;
+				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
 
 			gpio0_31_30_pins: iic2-gpio-pins {
@@ -1734,7 +1734,7 @@ esdhc0_cd_wp_pins: iic2-sdhc-pins {
 			};
 
 			i2c2_pins: iic3-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 3)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 3)>;
 			};
 
 			gpio0_29_28_pins: iic3-gpio-pins {
@@ -1742,7 +1742,7 @@ gpio0_29_28_pins: iic3-gpio-pins {
 			};
 
 			i2c3_pins: iic4-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 6)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
 			};
 
 			gpio0_27_26_pins: iic4-gpio-pins {
@@ -1750,7 +1750,7 @@ gpio0_27_26_pins: iic4-gpio-pins {
 			};
 
 			i2c4_pins: iic5-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 9)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
 			};
 
 			gpio0_25_24_pins: iic5-gpio-pins {
@@ -1758,7 +1758,7 @@ gpio0_25_24_pins: iic5-gpio-pins {
 			};
 
 			i2c5_pins: iic6-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 12)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
 			};
 
 			gpio0_23_22_pins: iic6-gpio-pins {

-- 
2.51.0


