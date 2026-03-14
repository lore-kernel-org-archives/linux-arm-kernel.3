Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DAB10706DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=; b=Gh4ECcNoYbQjIhxcErl+Xz+i/1
	OXnnAF/ba5Krikj/om00Oxsg+tlycHfIAqMSWt569faks8G/eiT9cv6/9c9n2f3A6C1wxuH8zHzFI
	1qHdP7GHEjSnheAnD9pHy6KfpE/WRTgI0kYSxeyYA2WUkm/cqifvyH8W0SUbtBJ/mZqcf9bd4Pr57
	+7pxhGdtuV5JWqh7a2/oPe3xBBri0uDlorRMztmrls+qoAmMsTGzwPh208dMV7u+55YGcPwmE0X2b
	tGf+EqL8D6d4vFBt7KZz9YyyNo0w3lSFurPPo+qzFuoev2ohyiFMu83RtTBh1OhhijzcFwGyBTFMO
	orFiJLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkZ-00000001nwQ-3sn9;
	Sat, 14 Mar 2026 12:05:47 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkT-00000001npX-1w5S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:43 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tK8Xn987xD2E4Gla2rxaps2ofkrXo1cuvEcYFOsTxARvNcXW1zawINBO1qsts/YpvmSpcOyTEbxmvpjIKBHwFIlPHV4HO9lFpBRa1ymWfRH5yJbLghhsdaz4GNG+UlJBNrzslyICmPeFNEfPvQn16hrXd6iwyj4m32Rztsiu3qGNVwExLr+JbQZLz/jPszS0kD2Q0da0LhkyItw44AOHZiGsHAkEkpayPhhvVNwZjk07m7H6AjYM6GddzxlsdNNg95eXQYsbmD/ivytfTFsnhNhVhXn6tV/7Rs4ez8B+9wkfSrLtd8l0JhyEhpQEVePWDhkq1AJAQjFfXZAbkBMxrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=DW7fPGKYYeYsbXw9kUFna67u1+hmIhTWpdc2hH4AJDIqdkTPnjsBAay7++rKmSu6QRS2GnONZiu6cBupytuNDcInTozaokDh21bavh5a1Tmxq4cpzSJbNt8CowLVZByJdkTp0upd3Q4sCkjzyZFgzrgPjxjucx27vOnuekD0L+/On9bbEMiTe32ShtlTzyCjKRJ0KISbO0U+6SR9vIif1VkBbY9pW8Gc6dY2I+NKlXNohmlR4CInQKz8Q1Ta+eHRTIoIRs9Il2BJsbS6583xowqCxqoU1cZc2cslYTjgWlkiI+aUAB2lR4KUvKyXJxZ5sBLJmelHkmeOmeLxOTSu6Q==
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
 b=Nz6wZ0bjWg2kIVw0xqZmNCQMPkaQvHyt3w3aueBUnX3LNR1ZauToE0zWiVu+xaQvxA0o6v2/R1C15sdZIyiVhFgqxXb/cjHkw3rH1PjjF5EqxSq8iSw+y7axiEo02Kz/dCrNxnW1ksrGVHRebpBfQwydg3GbUSvVT0gZaEpp0xQ=
Received: from AS4P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::17)
 by AM0PR04MB11853.eurprd04.prod.outlook.com (2603:10a6:20b:6f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:05:22 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::d8) by AS4P189CA0030.outlook.office365.com
 (2603:10a6:20b:5db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sat,
 14 Mar 2026 12:05:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Sat, 14 Mar 2026 12:05:36 +0000
Received: from emails-4525761-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1A5C480130;
	Sat, 14 Mar 2026 12:05:36 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:29 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOtxLxZbR0BUgrRizEFm2Go33ISxAvlFtG/Qrl+1LHYUockev+9Z5pehzFposCO6Z4X2Kjed/LiwctRyakhpwkUqw/orrhP9+HCTZ7jE+HqUrGRJxBX5GjzIKvZSFr9AAJ1pkt1Q2scNoQRek19xzZSk3+ag/W/t155vlxUDH++IkjzHSk6WuZKqktKTphTEIfEYUeoy6S1RFfZgNezecod2k/GCtdaq/DqY6bru9B+BekTxtitXZB4A0TYI7ZmGXMCTz4vCZXf1I3J5iDts8w8Bo+yegyYUCMftVxYnfEoAV8dhRp1lH9KHK1dGaYn0lGVun9HVhRpc8r2W6n8qgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=FTTezoT2mxPaBIoU1AIlg6uGDHiCjKXUbPKJYbBEulLT6lXk2b/eML3JZHQNEhtO0ktVp4sv1Le+Lj7BqfG6dmD724mYOW5EikyNyPStIHhMpIyJXwhshhf8q2Pr2J28nU5Hd4vw/o0tEVecfWlmXXam1838UvkCsGBUei9XxflzEYE1NNrwEwpDQimkmjxQFHUKuG1bqHbpe5cVeJU2GDdh2O4jixmJZ2eeERWWUEiJer9PhEe+vTo8aWbi/lXaSSf0c6YqlX34BCYushuvyJZARSETN77Ahlo0r3/1A3M3A6Y0IT2wfadJGren5O/2I6tfALqLS6K9nTItjGyYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=Nz6wZ0bjWg2kIVw0xqZmNCQMPkaQvHyt3w3aueBUnX3LNR1ZauToE0zWiVu+xaQvxA0o6v2/R1C15sdZIyiVhFgqxXb/cjHkw3rH1PjjF5EqxSq8iSw+y7axiEo02Kz/dCrNxnW1ksrGVHRebpBfQwydg3GbUSvVT0gZaEpp0xQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:05:04 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 12:05:06 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:20 +0100
Subject: [PATCH v5 10/10] arm64: dts: lx2162a-clearfog: set sfp connector
 leds function and source
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-10-83de721585e3@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DU4PR04MB10500:EE_|AM3PEPF00009B9F:EE_|AM0PR04MB11853:EE_
X-MS-Office365-Filtering-Correlation-Id: f543c97c-d590-4d2c-5fee-08de81c20074
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 2W1rR35C6dDsv7fs0RYyTzY2BAbHjtErjU3RqzuIaTJc82dUX1TQplLHcTuuW0kaxnxrteLNKMZlI14NRzX5kP1k21m0LhTvoVDzpxyIaZaKJeWLfiEggdPky9BrvrEqyg9O3Sbg/yr8FwjhrrDv7aYjxKNAYKNvszROWAmkOgDDjVED/kZubSkkSWS6PgCZLGQY1IAyArWB6O2WcaPTndmvatjUYbQC88J56WSadLREpmM4G6if8puovRE62Zv5NpFS2F0v0JTdVFuUUKjN8XjOiEDFKXG0aqqUCvVrBmAwDLmF396nhMhB11D+l2rRhfRIxx+GxY6mpxL/eeejaohfDmDIjRSbGBH3bXj46aqNVqFzEDEsZeCpi5NJM1P2b8S4kIjoO91CZU3WO9iMMmrzkp/fFIn5tpGgp/iAPGUsxCKqxWmU6eoRD4LXTTMTklFJ92D9T1JN5anSbWOoCWjRbYi2KJfzx6bIB3zn9q/z80njuq8my6TKioA0CLPZTebnnSlYrsqOMwRx0k++NayLUWRXzjrF0AxiXa4NN3/IDIp5RLrxvzLmIX7nULHDf/yzEn4Djjoy+xvakgDycrnzIszsikYgbioFieGS8GHd/1WYkLlkmRz7OagnKleDebcy4zy7fodikPzR0rtiFqezTi71XpurXlDgu6T5c4fN03vPJblpz6CvsV/el2fZ8nCHUrscwRp8++XxdUmb1tOjjT4bKk2VFrlUSysEC1JnfwtYXfiApseK3+27wHn0smscExftI/XgiQd+jUXBjhabYSYu8d97Jhh9+6LBRPo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: nrFoNvw2HjUfkzM0S7h/f2CqRJml7NtUJmn8zFL5c600X0BUrK3gnt1U0288zCUGrsmRl1fV7rNdn8UJZUSOBfNUCHGViYuS8dJS4nv9fZiNWRZG78xCGPDWkcjGykeT+yMixnCpo3dxOP6PsFyZJHAvRlDhq0HOrX9uY7Grzky9Fuw3x/xZrO8TxWyDnGqc8RC1ROs+pAN9pqjXkDXfV+/45bgI+ZbiWzCGP+DpRuTgBrot+DiCOBnelGi4QEmCDd5luCTnTwqs33Q4QIG8WrYcj3Ea1abQgz7m8ySERecRKzjXloIJFfcRaF+LyTz03TYeuAsQZL8VBpAArpNyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4c08832f590f4401affeac91b5f4fa08:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bc680990-13b5-4ee9-161e-08de81c1ee5c
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|14060799003|1800799024|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: KOdR4n6i1ksPYI3U0ZyKfHtLS9jx8tanjo/zO60eBtMJPeiKIf/tBLTF0BdoL1jqfZSzWPKQPsJcdexQj7LE8t+daStg7QldXhFqAGhruU5d6qXtefTX+034n51DcEuiGLfZmbyGjtX0E4yk3dVzh0Q3S8cvctpaTpkbDOqCKATXgp1rshABdMFSES+kydGncKU6mhY9lt2TqzzUG5Aa1XZ8QIuctLUQxOt4Wl1jQdTFn8EbtcCJ/BhWCbIZNqjQUjY1gkNXVJNO0dJwUBcDRtZ02MetF+DtlGYMRUCgnF6Sx/aGVnHhcU33rH7TZKpmek7fE3iLHzUTApIHzlO+Yzi8J8uYqSTzK3kPm4xfT7jHW2ceVFBezFdhTMIP7t4NnG2mzUFgz4jGmWF4SLEcTVz4+T4HgKxVYUJ/ksJuVdLobGt5pvIADKEp/p8H+2O5fVB3nX6ZM2G4eMRLLmf15fApKFj7WzNJtmw0NfQYc6QnztQQoQeOFX/5BoQPWlfBBvs9awHuAm28Q47Mz4mXTgjnbS8W2ZwQHyUMiw3rinU84Vpq1pyKyeka7Y3oQCgiRScckQSOo23aV1v94sSHEjy8KKH9qJ87GRIPriyxnZoQ9QyjEBimtWAgG+eicGhrIkoVBcl1pr/V+DCMMDPyF1GXoqAo/3tSGkeWsyb9gY6yfPK39vqdoZAmC4ovi1vw4xlB9ptikDFLY50iwSSYY0yUtECOZozC3P5wSx851wnY8L9bv/UVfMCK9l5yPEhSwogQEziy69Uc+1xBV3C5bg==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(14060799003)(1800799024)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G7vdqI9S7DGPuC3Vp50Z/nuSNn2T89ABuX/0aQjgpnpFe6TPHkdw51XU1B2WRfL4yuqoy4vWSdBDjUhXbokujMljzB2gsTrJl8c1uCgEu6/CA9nAI4yfE7Uc1uK88FrIypJ6uMFk2Ex13fx+LYsEOnsWHUgrnIsJkgFnBOP1KKxGhZcBh4w4UXJQySWjOYM0jp7AHgK/fma9Adqg/3iHfTFGupRDPlj9ysAAr0UMIGcb9wQekm7gdHFncXswcgo3adq67fPAC/oVf1/yfQG6IQmgjlIgwj63BX69OWy8gQ3eAc+XbbSYHf4mcLFisQCbq4rnSvrWtS6F4xj8MMR2fSxpGMmzc5XoJjk+2al7zlwwVlugC0NmCtaNoFP52+5N8jPbxLA9d8oGaPXrTLJMvS+eArv0bqNOKc3PUsh/7+7FlInLMDouo+ctcFYGuogB
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:36.3408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f543c97c-d590-4d2c-5fee-08de81c20074
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050541_498178_17A96CA8 
X-CRM114-Status: UNSURE (   6.56  )
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


