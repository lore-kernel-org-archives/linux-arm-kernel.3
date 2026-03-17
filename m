Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BEEFED9F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkFKFfVafio9wlUMym0htkYEInqaGwV1UPjpE26mqVY=; b=2rvowqP3+Ln+wVrshlH5t3ijMd
	lqfx8/lYPQNHy9V3fEM4kMmrctTLa4ON7n807/LSdGbrfW2291o865GonGUpS3foncZuQ6VN2ig6J
	firtyrGAFfsNoLa+KRoSO7plaPv4DE+4dCtFNUity/PPAJ1dcyBsM3+SDwAQEY5OPrvSsHSkEKdWl
	3R/rRZlYSD9BCtwhIw7rA7eclubUV2FQhRtRXFUcGpJg1Ax42gD/p8qhpfDYpZPA2bG/zsZ0b3CR/
	AjKECCg6jzj9jCKRG5i/dNmCURHGoJDFi1stQ9pglSufhDsgsnhOthJhj3uATESlN4cxDxSimhDNO
	Lv8gGuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y5z-00000006vEU-3qZd;
	Tue, 17 Mar 2026 17:20:43 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y5x-00000006vDl-2Kfs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:20:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SZI7nFmRJrT0HBACiICgEOjEsNqOWOZdZq4OTYyehqdDVu8Tm9SNs+C+MTInn0tBeJ1luwO1E2bAo1aa/sqhft+dIlFf8+hUrlrsj5UXFAH80//F6PlUM1v/8JKukx2UMPtNsy/TJPq1tArhzmDaLoz5y24Cp5bWAbj4lGoD5XZ1ShPpSD0ddTvTCngnvYqAVBJsDohBl/srXStnJDLKSagZCgZZw6B6eGTOcTNAhn5mqm7dqPWJ/kbe31kG1KIuuzo9qkhcS4BLFSTtybvXppGEEt0UxjpHIceTjOKLCjTO6flcdE7yXeP5riS8NwtOgxGY5zx3wS7q+jbiohngLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkFKFfVafio9wlUMym0htkYEInqaGwV1UPjpE26mqVY=;
 b=vVi253DY1xgOiM0mU4AD39znBDV84jj4aHUMYOXwzNqbBo5DNbUyCtQJdkbq0IP26L5JDa9/IY+loIdcZDvm6dVafhqywz2Yb7Ff5rN9kmAnzGTeHg6JA8MRw4GZ65ZrDmolcwppOA7wmSKDGXQJEzOsy88LAYGi6T+jLtKzHxw9+A4575voy2RvfoEf00COl9duMldHIJ+9EErt89OnSjSUpCs/iNzkqJjkp4P4LeugShc6DZaAQC390UD0M8BNRxBrb5gNdmvixx1kEvL+5XHAnmtB+6C7uKOE8n2k/djIrk2q8ep6+0Rv/Mi9GgZaEjkx/MjrTY0HqQTqysDp8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkFKFfVafio9wlUMym0htkYEInqaGwV1UPjpE26mqVY=;
 b=VRzsSRY8doIfsxw+mUq9eKcgmf1WGNSH7n+2VqvsT74zYhjVhEswU+39tKE/UNKwPLT/4NSXzj42QEizF9vhccmm70zAioZtZlURJeaIoy5qffGwEJeu7yT49wIkRXwBd4aV4G/NC9FM7PpXA9lX1IB8NITtKKCDAhloXNpPS0Q=
Received: from DB8PR06CA0055.eurprd06.prod.outlook.com (2603:10a6:10:120::29)
 by VI0PR04MB11644.eurprd04.prod.outlook.com (2603:10a6:800:302::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 17:20:06 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::dc) by DB8PR06CA0055.outlook.office365.com
 (2603:10a6:10:120::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 17:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 17:20:32 +0000
Received: from emails-8423105-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-46.eu-west-1.compute.internal [10.20.6.46])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 17FFF7FFD5;
	Tue, 17 Mar 2026 17:20:32 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 17 17:20:25 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+MiSqybGjAfKzg0Mm+nj6DM5H5RQ5SY1HWTrnIDI4gnRom4quOhCPuc9dAyXIknRPmjbaSzGNwatQH+tjnDN097I75rZnW3tAP1XlXL76C1PBbSrlLznkcgGZ0Dc1an2+ZXooxEvGfRCw9Ta5bKXpksmGNkihBVkra9x/mDxxVe4MDJcVFWJTWWjFY3UsR8hlgfGonjimopkNEmE61rWjEWFFrwt4aUNfEn26R2d8RxVYJJowvVnNtTJLvV4Zsy3cPYB4q92jkrjSRrVs17SvERsLtil0sISVzN6Ygjmyaz4tZo58hWFapesBKak13N4r1UyOWlTqIFXWZTUGkbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkFKFfVafio9wlUMym0htkYEInqaGwV1UPjpE26mqVY=;
 b=k/yZu6DdgD/33Khum44oJfflTw4Ey/AA+ek0qMF82m5zj67xYaFi4cBwL/og/YobGs/Zd4oUOckcCInmYAF/EQhbJclv2/jw6U6R6ap8fTl97V311CqCckI96LvlQPwigCAF6KRtIOfvY0dXcpkjgeSbZJ/L4Qg/nv6gjU2VWuOFkJKj5Wcyeo29jV1tSt5mjQOHRjwyF+pHuinm+2owHICC07V35nJ9ICRpvSYV5yDlycXwB5algKAWUzISh8M4+wPtHlUTdaa6zr9yfqoNPsSQrrDliq1zeAgcJyoc+GSPsu0xzBFIN6/SqN0OZ78iWdOmSdK2jbbsGgElIpPfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkFKFfVafio9wlUMym0htkYEInqaGwV1UPjpE26mqVY=;
 b=VRzsSRY8doIfsxw+mUq9eKcgmf1WGNSH7n+2VqvsT74zYhjVhEswU+39tKE/UNKwPLT/4NSXzj42QEizF9vhccmm70zAioZtZlURJeaIoy5qffGwEJeu7yT49wIkRXwBd4aV4G/NC9FM7PpXA9lX1IB8NITtKKCDAhloXNpPS0Q=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV4PR04MB11944.eurprd04.prod.outlook.com (2603:10a6:150:2ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 17:19:54 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.020; Tue, 17 Mar 2026
 17:20:20 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Carlos
 Song <carlos.song@nxp.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>, Rabeeh Khoury
	<rabeeh@solid-run.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Thread-Topic: [PATCH v5 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Thread-Index: AQHcs6rJIV8a+JSJwEOfuuvDAS71FrWx5NwAgAEYdwA=
Date: Tue, 17 Mar 2026 17:20:20 +0000
Message-ID: <52a09ab1-ab55-43f9-91fc-c35f6a0d4730@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
 <20260314-lx2160-sd-cd-v5-4-83de721585e3@solid-run.com>
 <abiiDr4bLYIufKwp@lizhi-Precision-Tower-5810>
In-Reply-To: <abiiDr4bLYIufKwp@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|GV4PR04MB11944:EE_|DB1PEPF000509F3:EE_|VI0PR04MB11644:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e60352f-e787-46c8-ce32-08de84497e72
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: K/7J36Y1QXyMO8i7YqSio6YgVXNoVF2j7iXsOSeYeak+S4TkpqQXAt8TP5M9XI4kgr2Kxv667NAKS+m7+CmddG+WoMYUgX0m+uve1qFw7D4CEsDEC6ai60IkOhsDgnKpAZPqXxt6JKnjmbseo1FKVSR7PbRMTvqGQPEh/ZhmxqR5QRPHa45y693TgYQkb3g9L9lkh4SXRKKkvCZnwlJFouGfag0OlGitJNvkWMnkjA/0wOy85Lblni9HdPcSfWeGfTwTJ1enDcxjJFPZEr47dWHLRdYxbqUwnet3+EcPRE+37oZzrv1jHECE9gxH3pCT7gDkXvPsXZ0Ws6gNnuzb3lBA7VVF82D1LiG3r3omb/N9E2M/u3h67Ha5HldfoENczmKPG67vEhITrZFuXf81F7NnS7AVUVOs3dq/DTUiFkP1mLzWiYFf1o7NKLwEgEvVK6wd1ZMMU/bItt0PkTre5eN+sKgNkaG/Du39XFbd2u+4yKIuWq6uamYVj4/+rFh8yWBs2LduemxNsvBqnHxfiwLJVTvAUKAq2SxU1a+j+UB0msSJE+64xVnE8SLfVm+S2RMyiQmsA8HTrMwCQjJhXFEtrFs+BtWr6/yzu5QL64z44uS5cfLBgdlBYSphRQ+rr1F5SuOrHPmGmt8UY5hKO9CJCziSOZnuIY1gEYJIn8zZhp66CX0OG9VFTBFuy07Gn9EqvTTlC8UQQFx+nUnPIDHFWMqUaDOHm88R+L4jgGqqrBjkKE/h9XFK/+JysnBbfMdN0DILEHw1Eaa7Be0bxNTqS/hDIsoF2uhVLbw5lWQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <060CB10870472E44BD6819BFD78D5E53@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aCmtCcDYhDEp37xxrP6uHCiLDi3ZASU2lDOF85BdttTc7NVl6mU3h7iMc8Nl3iNBkLPcyWl9H7dufO5y6Rx29V3GFB8tItLrMdj+Y61JYElTW/47HUY/80nq29QSKhr3k+Jw5ip1SzQ5eDWZtDt3JxaJLYV5l7rDLTj5UMxjNWGPPoxBFQDzipc79OC5iQrh6xPr2fDWU6ovned2emnYuLZCceBn4x5eZuwNw2R7eDeyNHT4oMC6zN8dtaieUQQDUQpIqyBE9qI37evcKQoOpDn7X+daRp8VTsxagEb+ilXnRdMxXLijaoA+8VW1PVrDmUnbAq8M3Cyqkoy0cXWxAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11944
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e37f064415c7406d944df591603de6a8:solidrun,office365_emails,sent,inline:f6f1bdf983f706161a555fed21aa9639
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8a535f98-4a4b-49a0-0052-08de844977b8
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7puma7Uxdky9fAiSNFUidSNUunq6CMIPbe4fISKS9UeRD7NzcrcGckfpT+0iN6shtNIuSqEn9KB9P+a/i/dVW93YkKJWy/aBYnX74iFk777s48rCu/0ewy2GiX8wJcsK5zc3hphZnRruwkCFGPaeaSPHZyybQA1ZOBvUNv6laSqJalOxD53PaNRkarLDqH+pek7lZ9RXN3eix5buRTMK4otbBWnAiq+sLNYHHnEIUvVww10g5X6rRUO731NwpO3Ai+0vxTnajfqfQaEey3Q0XnE2lKHpwsTSWUYcNsUcXmokVBuPlnlyFyxx6lbvDqQ4T+I2VQf6Ka+87HnGzsaSy7gW0obpikSJAT+KNsvf9VjwdGI/rjHB92uPXUpIzxWTypMke45RiNiJRQeKeVcDn2vZ878EVqGIZnE4BJUJW4YRhrTLz3M0gSkYncqBV7CABcEy7hyd0RIu6pluQwS9RhIuAqYYmi9M37blYBpqsd4unbZ/wOXKspcEjIaDBWz6LtJ48SQ11F/Y1HvFZ3tkx8xnmwyE4Jmpx5h05TIng1IijGrFrVzLNwGK2jprd3c+cV4kaMmFs1ohIg5WwxSX1nUTwdx5N817KDqn8L/Y4davd7e7oEKji1D2YdbLRFHRcjCRkdYAiaYs6bIwJvbnKEbIrDOI64HiI8BVD6+BebtVDMVPExVGo8KP3PE1AhvIBQZ2ISw4lV0z0mnmBLf2PcWC9PJsaLadJsC9FED9AbW9cn2L1SZvkJEMHo9RPYPI7txOAnZaB79v/P6p7v56Xw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CE+ZK+d3fmkhp4ME0fEDsC2QbxoFRwX/WGafE7P8vbYva1TNBmOCh7LAu6NWz2Ar4yCIeq587MzJgUBupeIEh9hC3HSKnPm5/WmetcEzMJjBIU6ZTxbg39bvr3r277+s1bkfJrRnnTn+p8XbueZQuL6QBk33gIMTAbvaOJlmnVVMKTgS03dGmTooOUGU28db5S9qjTrihrcHVeV8nXc5pmD5Vm+KCVeyRx3jIiHuLcAc0j+QFz3g8GlfA/cNhNPIAzwr6L6fvIoPY83MBdF82q05PXmp+udLPag7kuRihkNZsCTsHFtaH6myovQt04Q5fAM4MCH+4k308mBSsUDAgVSVNg9jhFn4iCfzmkHKm+x+pW9XArtXbHoh4hYZg3w31C4XOgUxKy2EzUj0ef7Z666HxUizurpFl9pNXTtjnHm33KG7ia4KGXXynXsjfJ/C
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:20:32.1691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e60352f-e787-46c8-ce32-08de84497e72
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_102041_793877_25F9AC81 
X-CRM114-Status: GOOD (  15.50  )
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

SGkgRnJhbmssDQoNCk9uIDMvMTcvMjYgMDI6MzYsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBTYXQs
IE1hciAxNCwgMjAyNiBhdCAwMTowNToxNFBNICswMTAwLCBKb3N1YSBNYXllciB3cm90ZToNCj4+
IExYMjE2MEEgcGlubXV4IGlzIGRvbmUgaW4gZ3JvdXBzIGJ5IHZhcmlvdXMgbGVuZ3RoIGJpdGZp
ZWxkcyB3aXRoaW4NCj4+IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzLg0KPj4NCj4+IEVhY2ggZ3Jv
dXAgb2YgcGlucyBpcyBuYW1lZCBpbiB0aGUgcmVmZXJlbmNlIG1hbnVhbCBhZnRlciBhIHByaW1h
cnkNCj4+IGZ1bmN0aW9uIHVzaW5nIHNvYy1zcGVjaWZpYyBuYW1pbmcsIGUuZy4gSUlDMSAoZm9y
IGkyYzApLg0KPj4NCj4+IEhhcmR3YXJlIGJsb2NrIG51bWJlcmluZyBzdGFydHMgZnJvbSB6ZXJv
IGluIGRldmljZS10cmVlIGJ1dCBvbmUgaW4gdGhlDQo+PiByZWZlcmVuY2UgbWFudWFsLg0KPj4N
Cj4+IFJlbmFtZSB0aGUgYWxyZWFkeSBkZWZpbmVkIHBpbm11eCBub2RlcyBvcmlnaW5hbGx5IGFk
ZGVkIGZvciBjaGFuZ2luZw0KPj4gaTJjIHBpbnMgYmV0d2VlbiBpMmMgYW5kIGdwaW8gZnVuY3Rp
b25zIHJlZmxlY3RpbmcgdGhlIHJlZmVyZW5jZSBtYW51YWwNCj4+IG5hbWUgKElJQykgaW4gdGhl
IG5vZGUgbmFtZSwgYW5kIHRoZSBkZXZpY2UtdHJlZSBuYW1lIChpMmMsIGdwaW8pIGluIHRoZQ0K
Pj4gbGFiZWwuDQo+Pg0KPj4gVGhpcyBtYWtlcyBpdCBtb3JlIGNsZWFyIHRvIGZ1dHVyZSBkZXZl
bG9wZXJzIHRoYXQgdGhlc2Ugbm9kZXMgZG8gaW4NCj4+IGZhY3QgY29uZmlndXJlIGEgZ3JvdXAg
b2YgcGlucywgYW5kIGhlbHBzIHdpdGggY3Jvc3MtcmVmZXJlbmNpbmcNCj4+IGRvY3VtZW50YXRp
b24uDQo+Pg0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+Pg0KPj4gRml4ZXM6
IDhhMTM2NWM3YmJjMSAoImFybTY0OiBkdHM6IGx4MjE2MGE6IGFkZCBwaW5tdXggYW5kIGkyYyBn
cGlvIHRvIHN1cHBvcnQgYnVzIHJlY292ZXJ5IikNCj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1h
eWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kgfCA2NCArKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2Zz
bC1seDIxNjBhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYw
YS5kdHNpDQo+PiBpbmRleCA0MWM5YjQyNTNmNGE1Li4yODUwMGU4ODczOTA5IDEwMDY0NA0KPj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaQ0KPj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaQ0KPj4g
QEAgLTc1MCw4ICs3NTAsOCBAQCBpMmMwOiBpMmNAMjAwMDAwMCB7DQo+PiAgIAkJCWNsb2NrcyA9
IDwmY2xvY2tnZW4gUU9SSVFfQ0xLX1BMQVRGT1JNX1BMTA0KPj4gICAJCQkJCSAgICBRT1JJUV9D
TEtfUExMX0RJVigxNik+Ow0KPj4gICAJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAiZ3Bp
byI7DQo+PiAtCQkJcGluY3RybC0wID0gPCZpMmMwX3NjbD47DQo+PiAtCQkJcGluY3RybC0xID0g
PCZpMmMwX3NjbF9ncGlvPjsNCj4+ICsJCQlwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47DQo+PiAr
CQkJcGluY3RybC0xID0gPCZncGlvMF8zXzJfcGlucz47DQo+IHdoeSBuZWVkIGNoYW5nZSBsYWJl
bCBuYW1lIGhlcmUuIEl0IHNob3VsZCBzY2wsIHdoeSBuZWVkIGNoYW5nZSB0byBwaW5zPw0KDQpS
ZWFkYWJpbGl0eS4NCg0KSXQgc2hvdWxkIGRlZmluaXRlbHkgbm90IGJlIGNhbGxlZCAic2NsIiBw
cmVjaXNlbHkgYmVjYXVzZSB0aGUgbm9kZQ0KcHJldmlvdXNseSBsYWJlbGVkIGkyYzBfc2NsIGFj
dHVhbGx5IGNvbmZpZ3VyZXMgYm90aCBzZGEgYW5kIHNjbCB0b2dldGhlci4NCg0KQW5kIHBsYWlu
ICImaTJjMCIgaXMgYWxyZWFkeSB0YWtlbiwgc28gSSBhZGRlZCBfcGlucy4NCg0KRm9yIHRoZSBn
cGlvcyBJIGFsc28gY2hhbmdlZCB0aGUgbGFiZWwgYmVjYXVzZSB3ZSBhcmUgaW4gU29DIGR0c2ks
DQphbmQgZ3Bpb3MgYXJlIG5vdCBzcGVjaWZpYyB0byBzZGEgb3Igc2NsIGZ1bmN0aW9uLg0KDQpG
dXJ0aGVyIGluY2x1ZGluZyB0aGUgZ3BpbyBudW1iZXJzIGluIHRoZSBsYWJlbCBoZWxwcyBzcG90
dGluZyBtaXN0YWtlcy4NCg0KVGhpcyBwYXRjaC1zZXQgaXMgYSBzdG9yeSBleHBsYWluaW5nIGNo
YXB0ZXIgYnkgY2hhcHRlciB3aHkgaW5pdGlhbGx5DQpJIGp1c3QgcmV2ZXJ0ZWQgdGhlIG9yaWdp
bmFsIGNvbW1pdC4NCg0Kc2luY2VyZWx5DQpKb3N1YSBNYXllcg0K

