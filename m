Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592A3EB7ED0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjlLXxmjXZ9xlSS0/wanR8hZhbeBnCxLtmIbtQmcVcI=; b=2awCphseg+JL7cYRfGFe6JDAoz
	zz0R7ljnVslTOdnQYnwMMGdAA+3f351pblRH5PSFJpkfnnvCN+XRf+W8HXmR9wd61PXybtbUF1ReS
	KiTpU1ANGhCU2qPst9N5Bjtt9kb1eIexo1zOHrp/9IGMIjSQCVRvXVQkjb9ok1TnC+LPo/UKIbgzc
	sLd9EhVDAVvosOVM8eME12IGQufDYrw9BC3pMR1+GnWyBgvr4W7o303eg7YbG+HUdlKDjZhjhMXO0
	ZaMUj/GgDhO7RSyEn3FQhcsDPL03Dodkhj2sTF6/9Khfq48m3DaL1tH/UNI7SLVnm+hvqoN4j2xd7
	022rj/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIP-0000000H4dM-0Dmg;
	Wed, 04 Mar 2026 11:21:41 +0000
Received: from mail-northeuropeazon11022136.outbound.protection.outlook.com ([52.101.66.136] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIL-0000000H4at-43zM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:21:39 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=afwOiQyc6IxWVmSVw5R6i2TtYPWAVELyXMs0qtpmSwNNWztro25d7dgd8fU7Sh5bzy4pS0xL7JYorZTPEqiTvUZGpCYfjG5vYX+ZixoqWcTYw2t1xHketyxXiQGU3Rx4vBEgavkADj+Q/efGdsBZi7fOo2Qiix47rlvWMu8Q9XLFWsyjXx7YcSOsIAguPbh0RD1HTX0AJCc0hcJOMX73Ont5HqZDqw4PvtYGf5uqWxOP6SzuJEK4ckEBdMt5D9lij+5cBEnOMBACLhkQHrrsdMfh3U3fEVN2Fc0XocHDJ3159YF0IU6Z7JDjSy7meiMZy2vh9jkY+B5J3cBlfz8ZuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjlLXxmjXZ9xlSS0/wanR8hZhbeBnCxLtmIbtQmcVcI=;
 b=KWl2beGzBvBzkbHy1Th+xeVVYoKbkWDPDY9uQWLFtTuNQCOauPdDsofnxE9rvaTBDAzPlbzgcBIRLWbIHJKjZK9vsucZ+XnduydpEo3hFVIVAn/yHvi8Kmfvxh4ljY6UvfKjC4q2GqkOQNqqcj+rpd+6yn/J4TyberasCPxFu5lhvHUCf3X8Sdy9EdoD0QAvxbnvD6RjRJ3c6b0r+iuVzKs1bnGv15t7zDJlnpJAhVLAB8eFLmdmzqlIVQIPlnOWiltbHfvbsDLJrqKlZdAAiF9mX5UwcNjVQF5xne/ZQxevhRA55aAWTKRdT9VlJEEVlQKETNyP1vfQWjA7DjPwhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjlLXxmjXZ9xlSS0/wanR8hZhbeBnCxLtmIbtQmcVcI=;
 b=MGg/RHfrQitkSqneUAOziVC/EgnLDs7JoZvTZS7V/8PV8bNjb9AfYExZR5++BxqFpyWUBuJSpDGRQOgfi8xkAhNGnSTHNpccBjWpvR11d9Q6QkfRxOLTUGnGrrBRbooL3kzu9w/NXUGzxa+BH91xXFWoJ+DP6np5YHDTJrgZowo=
Received: from DU7P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::17)
 by AM0PR04MB6820.eurprd04.prod.outlook.com (2603:10a6:208:188::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:33 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::f) by DU7P191CA0013.outlook.office365.com
 (2603:10a6:10:54e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 11:21:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Wed, 4 Mar 2026 11:21:33 +0000
Received: from emails-4983932-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-248.eu-west-1.compute.internal [10.20.6.248])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 07C318069B;
	Wed,  4 Mar 2026 11:21:33 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Mar  4 11:21:26 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6OjvO6L1NIZCj62mQItWMLAmEpHoCp4qS3lN3qsqkTwE30k6nbhRD6PEgmkAuh9pU82eLeCvjenyu3QnQKH18Z9F5FlPFrb3RhPqjgYyHLJzz1iBluY8asuGk4ABtf7xTqf0ZG3ZiJpdb/DPWEBy+M9qhWE87d8+mX6IMTYt15klBl+AkZ7waLkMP+3qf3N0P7qoHwoaZeUZ7a1uX31Z+FmESNzfpaD3Xd/JL6fuzCZzLCdZ9I5ttjJDJ7wt8PBattDrEauCUII+FFWX+Kxfh8B6p5/ntboCzlZJPJB4ZfWkw978DPusdFEpO0XGYaqpZTloNBtIcaP7H+z7lmIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjlLXxmjXZ9xlSS0/wanR8hZhbeBnCxLtmIbtQmcVcI=;
 b=VFkeLv01a26crJ/EgtTysORBlrZn7H6/k64O6vy1PwJSnWwGLQqcdAC8QuxN0ayMKys9UKUPdjj8vV6XWQDKc+CK9e6x0L93zDwM1Coygmg+UmyjL0XgH1edRmrqRAv4N9CsYmPz/iOlkao5GAc7vMucJFvZM2WAFL414GDbGnRHGvFS8egFOkV6NRaetjl1tXhBFOx7l2ohdsWIFdyrU1hD0TIgXVMQ0an9zyqA/5KliHi9OqHztiaaKgQFwUXQmZpVPx9SSQ5heXb1ZeiD+NiKiDrOjxwwDjDhZ+6GayncD3ahBDnI1jheShg5SCMReqm8j56W9l2z/8y/hvpyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjlLXxmjXZ9xlSS0/wanR8hZhbeBnCxLtmIbtQmcVcI=;
 b=MGg/RHfrQitkSqneUAOziVC/EgnLDs7JoZvTZS7V/8PV8bNjb9AfYExZR5++BxqFpyWUBuJSpDGRQOgfi8xkAhNGnSTHNpccBjWpvR11d9Q6QkfRxOLTUGnGrrBRbooL3kzu9w/NXUGzxa+BH91xXFWoJ+DP6np5YHDTJrgZowo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:19 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:21:19 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 04 Mar 2026 12:21:14 +0100
Subject: [PATCH v3 2/5] arm64: dts: lx2160a: complete pinmux for rcwsr12
 configuration word
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-lx2160-sd-cd-v3-2-dee4523600ef@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI2PR04MB10979:EE_|DB5PEPF00014B8B:EE_|AM0PR04MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cf2375-d848-4388-2474-08de79e030cd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: te7uUnROmdmriw2rwlhYQ6GIDpeutpzKYl4YOsGJORfMRxqLyUB9T54n8Hi0xACWCLo3bBxmEbyd4kYu/9QCqWhxM2Xf9QhFmGj68Tn0oI42wzqEiFh/6lXTDNKjk/Wwf844HBRLKmLV1D4zJiQXu5f8ShBiW1rvzx/ga9Q+3obAxklw7pCa5cZ6R/tiE0Z6MRW0Eeze89/wuv0afTxIue0s+Huh+otZDE6ILrAL9dwQ09bxOVkpbRFkPls4ny6lw/eYMyU+F99ztoSX9VU2ueeAF2KpfEpaRyDFTfcn748GB+rVPWyCe4wjlBBCVHFP9DUgjXfHNNiSK+xipQyeDizfndJL+zIgNqPLIG+UvK17R2EV+4ov5Kd814dXceQYof61q31gRJaoMIy+iQr5s/+NV69w2acgXvWLXIuZZJVDwdZ+mSTHUaPI/mzqKxxJAtT/wm0PMZcigCTInFCa6loIdo0pGGpKunS4wogBSZ46hrXb7ZZ+S/ZTwUs/XfYeApGrB346/dW8Sy9pfyu++NnDdsKzHWmsOpGOgUKcClSG+icu2gRpu1y9EZ37oxTA7AeOXWGroaMPf4zIwZorRml6TAdFQj45qzWpWfqYewK+t5dJFVkMps/22gepxCVMxiX+vGtVH2FFn4aqZjGSBl6+5JSsBEcvmkAN/ElZW8JJnva97greh7sTDgJHC3l7MzZT63h5hFWi0cn0OVyTeW7ikBhUHoA3AqQIiRSWMIJRGWfulmbCjSVBUcqlcjUQIxs62XExO0GZFlCCCXIIrZkjK6y0lDKbwt0NMRgm5FE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 25dc207dab9d481c806a26e22a089672:solidrun,office365_emails,sent,inline:24fbdaf47b4eead4bec4b5d78012f82e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: dba41629-c3a1-433f-cc36-08de79e02874
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|36860700016|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: Vga1urLW6Slq0DLHjG9zMqyqTb7p31DFnBTfcrMdk4raq0WkKjNylLp834M9DqOvdmgTj1ANeSuCsiEmMqlAzHtS8Txfw/CDaPCpLdSXprygNh2/kQc9p5mphKCaKWdPKoBsGO4nmdl4NQq5wKHB1Z6RIiQY3LjCEnfqNHrQcaEWyqYrlK0UWYGbTiF/Cd5zE+BE7ro9Mh/rrd6LC/XLdNaCyZK5W7RI5wPvpV5ixwIOqSaZf1DS5imcRffRng8cQx82FNbIvcPqGG2D7uhuYDZ9L71G8iqUgGwsexuSQm01c0UZRNv6bRKr4qjOwry4KQdiggXCh4zZ7NjqviqD+g8qfNjgMtnYTyc9FB4WkZtPL5cuzN/sp5SiMQ+50hd0WgBfrXbuqW7QBwHt0ppGIiWxuMoyC5P44p0+QkfQxdYB6fg0PEeIDkJRGzPrjJ/+OQ0tOTyMMCigYJQT+fUOAWh0NmKoYbOuNjqfkutXr39B0vCEyF+CeFp61fLtF2kGNkr/ui+utVEZ0B4OZcnI8LzGcelseyGiRTJYFRXuQJh9bRo6QjiurngwSt7dAX2sWjAxZPlfNeWJtJ5JWXz6Iu4rrc3taae97tXd6T1Juz7z4QDQlvIFWrpZPavBDci9X9DUPb/d0TdrxpUxngW07/lORNFqVF3frJrqaQ2fLepiZ7vkZr5og6pU3vXhH73ClH1Mw8NYHlahAxQ35dSa9ifVZdpAY4P6op0dUChiU+CQ/gGNAjCcdu6sMJK9WQC3fSM+OtIj9flePTbrTR5+UQ==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700016)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: juZ1cjHtsSGKdx+iAcqEVsVljRsU/Uxt3+qX4O6bG4RNMPEuuYWmcaV4VV96e1e8jH4BOgtb+B2ib89Ma8eWvp2NS1Pc9f7Epm/zL7TGxbn8tkE6a3uAoZWSjUsPVZqBI3Mb6E2gj7RjBhNCpffqn3t1aOu2HROvf+wG6vlnb/XHESpWgpRRoZUvwdjEfp9ss7O1Q96TGv6sVGfQqeJsEMfSAEi8B/BGVZiJNsEnzXrPrQIzfrWBTr32D9WXzj4PZpciwvxRZdmXDHhklPn2yQ8pczOM/DDws0R5qjPKBH5Y+jVdLdmY1/yo90IshP49i+H5/Kfev/3QwakzYmgTT6asQa+HVZBTOUH0Te10476I1gyjw0e99GZNyQNIgOaB2B5ZNS1Ms9bsk79zJPhxUFVu7Ah2rKAqZs6Mq1h7jLODm0cnzI7Zq1bYm7NwWi6B
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:21:33.1137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cf2375-d848-4388-2474-08de79e030cd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_032138_160189_4C34EE52 
X-CRM114-Status: GOOD (  13.47  )
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

Commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to
support bus recovery") introduced pinmux nodes for lx2160 i2c
interfaces, allowing runtime change between i2c and gpio functions
implementing bus recovery.

Firstly this can cause unintended side-effects because the dynamic
configuration area where pinmux is modified at runtime reads zero
initially, causing application of the first pinmux node to clear any
other bits previously set during reset configuration.

It is possible for bootloaders to implement a workaround and copy from
the reset values from read-only area to dynamic configuration area,
however bootloader updates should not be required for kernel updates.

Alternatively pinmux in device-tree can be made complete, to cover all
bits of a 32-bit register, not just i2c & gpio functions, e.g. for
RCWSR12 register:

LX2162-CF RCWSR12: 0b0000100000000000 0000000000000110
IIC2_PMUX              |||   |||   || |   |||   |||XXX : I2C/GPIO/CD-WP
IIC3_PMUX              |||   |||   || |   |||   XXX    : I2C/GPIO/CAN/EVT
IIC4_PMUX              |||   |||   || |   |||XXX|||    : I2C/GPIO/CAN/EVT
IIC5_PMUX              |||   |||   || |   XXX   |||    : I2C/GPIO/SDHC-CLK
IIC6_PMUX              |||   |||   || |XXX|||   |||    : I2C/GPIO/SDHC-CLK
XSPI1_A_DATA74_PMUX    |||   |||   XX X   |||   |||    : XSPI/GPIO
XSPI1_A_DATA30_PMUX    |||   |||XXX|| |   |||   |||    : XSPI/GPIO
XSPI1_A_BASE_PMUX      |||   XXX   || |   |||   |||    : XSPI/GPIO
SDHC1_BASE_PMUX        |||XXX|||   || |   |||   |||    : SDHC/GPIO/SPI
SDHC1_DIR_PMUX         XXX   |||   || |   |||   |||    : SDHC/GPIO/SPI
RESERVED             XX|||   |||   || |   |||   |||    :

Secondly the i2c bus recovery descriptions use explicit "_scl" suffix,
suggesting that only scl pin is configured.

However the pinmux in LX2160 always configures i2c pins in pairs, i.e.
both sda and scl are both switched between i2c and gpio functions. Yet
sda-gpios was not set.

Thirdly i2c6 and i2c7 pinmux nodes are identical, setting the same bits
because both pairs of pins are configured together in lx2160.

Describing them in duplicate nodes is confusing and hides the fact that
changing the mux for one, changes the other too.

Add description for all bits of RCWSR12 register, including i2c, gpio,
flextimer, spi, can and sdhc.

Rename the existing i2c pinmux nodes to be consistent with the newly
added alternate function nodes, and set sda-gpios on each i2c
controller.

Merge the i2c6 and i2c7 into a single node.

Other configuration words, i.e. RCWSR13 & RCWSR14 may be added in the
future for boards setting non-zero values there.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 153 ++++++++++++++++++-------
 1 file changed, 114 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index be0ccab5a626b..920198694e2fb 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -750,9 +750,10 @@ i2c0: i2c@2000000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c0_scl>;
-			pinctrl-1 = <&i2c0_scl_gpio>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-1 = <&gpio0_3_2_pins>;
 			scl-gpios = <&gpio0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -766,9 +767,10 @@ i2c1: i2c@2010000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c1_scl>;
-			pinctrl-1 = <&i2c1_scl_gpio>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-1 = <&gpio0_31_30_pins>;
 			scl-gpios = <&gpio0 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -782,9 +784,10 @@ i2c2: i2c@2020000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c2_scl>;
-			pinctrl-1 = <&i2c2_scl_gpio>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-1 = <&gpio0_29_28_pins>;
 			scl-gpios = <&gpio0 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -798,9 +801,10 @@ i2c3: i2c@2030000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c3_scl>;
-			pinctrl-1 = <&i2c3_scl_gpio>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-1 = <&gpio0_27_26_pins>;
 			scl-gpios = <&gpio0 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -814,9 +818,10 @@ i2c4: i2c@2040000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c4_scl>;
-			pinctrl-1 = <&i2c4_scl_gpio>;
+			pinctrl-0 = <&i2c4_pins>;
+			pinctrl-1 = <&gpio0_25_24_pins>;
 			scl-gpios = <&gpio0 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -830,9 +835,10 @@ i2c5: i2c@2050000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c5_scl>;
-			pinctrl-1 = <&i2c5_scl_gpio>;
+			pinctrl-0 = <&i2c5_pins>;
+			pinctrl-1 = <&gpio0_23_22_pins>;
 			scl-gpios = <&gpio0 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -846,9 +852,10 @@ i2c6: i2c@2060000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c6_scl>;
-			pinctrl-1 = <&i2c6_scl_gpio>;
+			pinctrl-0 = <&i2c6_i2c7_pins>;
+			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -862,9 +869,10 @@ i2c7: i2c@2070000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c7_scl>;
-			pinctrl-1 = <&i2c7_scl_gpio>;
+			pinctrl-0 = <&i2c6_i2c7_pins>;
+			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -1713,92 +1721,159 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;
 
-			i2c1_scl: i2c1-scl-pins {
-				pinctrl-single,bits = <0x0 0 0x7>;
+			/* RCWSR12 */
+			i2c1_pins: iic2-i2c-pins {
+				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
 
-			i2c1_scl_gpio: i2c1-scl-gpio-pins {
+			gpio0_31_30_pins: iic2-gpio-pins {
 				pinctrl-single,bits = <0x0 0x1 0x7>;
 			};
 
+			ftm0_ch10_pins: iic2-ftm-pins {
+				pinctrl-single,bits = <0x0 0x2 0x7>;
+			};
+
 			esdhc0_cd_wp_pins: iic2-sdhc-pins {
 				pinctrl-single,bits = <0x0 0x6 0x7>;
 			};
 
-			i2c2_scl: i2c2-scl-pins {
+			i2c2_pins: iic3-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 3)>;
 			};
 
-			i2c2_scl_gpio: i2c2-scl-gpio-pins {
+			gpio0_29_28_pins: iic3-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
 			};
 
-			i2c3_scl: i2c3-scl-pins {
+			can0_pins: iic3-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 3) (0x7 << 3)>;
+			};
+
+			event65_pins: iic3-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 3) (0x7 << 3)>;
+			};
+
+			i2c3_pins: iic4-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 6)>;
 			};
 
-			i2c3_scl_gpio: i2c3-scl-gpio-pins {
+			gpio0_27_26_pins: iic4-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
 			};
 
-			i2c4_scl: i2c4-scl-pins {
+			can1_pins: iic4-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 6) (0x7 << 6)>;
+			};
+
+			event87_pins: iic4-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 6) (0x7 << 6)>;
+			};
+
+			i2c4_pins: iic5-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 9)>;
 			};
 
-			i2c4_scl_gpio: i2c4-scl-gpio-pins {
+			gpio0_25_24_pins: iic5-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
 			};
 
-			i2c5_scl: i2c5-scl-pins {
+			esdhc0_clksync_pins: iic5-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 9) (0x7 << 9)>;
+			};
+
+			dspi2_miso_mosi_pins: iic5-spi3-pins {
+				pinctrl-single,bits = <0x3 (0x2 << 9) (0x7 << 9)>;
+			};
+
+			i2c5_pins: iic6-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 12)>;
 			};
 
-			i2c5_scl_gpio: i2c5-scl-gpio-pins {
+			gpio0_23_22_pins: iic6-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
 			};
 
+			esdhc1_clksync_pins: iic6-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 12) (0x7 << 12)>;
+			};
+
 			fspi_data74_pins: xspi1-data74-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 15)>;
 			};
 
+			gpio1_31_28_pins: xspi1-data74-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+			};
+
 			fspi_data30_pins: xspi1-data30-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 18)>;
 			};
 
+			gpio1_27_24_pins: xspi1-data30-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+			};
+
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 21)>;
 			};
 
+			gpio1_23_20_pins: xspi1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+			};
+
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 24)>;
 			};
 
+			gpio0_21_15_pins: sdhc1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 (0x1 << 24) (0x7 << 24)>;
+			};
+
+			dspi0_pins: sdhc1-base-spi1-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_dir_pins: sdhc1-dir-pins {
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 27)>;
+			};
+
 			gpio0_14_12_pins: sdhc1-dir-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
 			};
 
-			i2c6_scl: i2c6-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
+			dspi2_cs31_pins: sdhc1-dir-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 27) (0x7 << 27)>;
 			};
 
-			i2c6_scl_gpio: i2c6-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
+			esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 27) (0x7 << 27)>;
 			};
 
-			i2c7_scl: i2c7-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
+			/* RCWSR13 */
+			gpio1_18_15_pins: iic8-iic7-gpio-pins {
+				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
 
-			i2c7_scl_gpio: i2c7-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
+			i2c6_i2c7_pins: iic8-iic7-i2c-pins {
+				pinctrl-single,bits = <0x4 0x2 0x7>;
 			};
 
-			i2c0_scl: i2c0-scl-pins {
-				pinctrl-single,bits = <0x8 0 (0x7 << 10)>;
+			/* RCWSR14 */
+			i2c0_pins: iic1-i2c-pins {
+				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};
 
-			i2c0_scl_gpio: i2c0-scl-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
+			gpio0_3_2_pins: iic1-gpio-pins {
+				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
 			};
 		};
 

-- 
2.51.0


