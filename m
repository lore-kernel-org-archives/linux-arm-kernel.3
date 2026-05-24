Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F012CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m87Vi9s2z4ycj7PdUNcTqSYF5i97u37ucngS8a0qbks=; b=G3iu7AUDdZ705XuNRkWuZBVVzZ
	EJC+RrX4+T7Tp5eWHrOcIf/WeqjT95pvsnvx3srPg+AqrwOXCxBYiePhiTalUEloyQHKE18nRPp4I
	JWGktWWNaaZlXg4gxID9QAvbkr1KDHrMNADxPV5qZR+8y8gSR0gs/8V1kw9aDLUYevNNQUG36U0Wk
	onhxE5oZS59ngKTi57n9V3THrByY107deToZ7v968Ehg6YYhO0hYd/hyGNCE3DFVeuelsUZK1eEsq
	1vNYGyc0mBiEhp/Jr4jUKvj1tMbj4tHQvbyoYpk2+ULIWMDjFI2k4HKelagYgDSUpumbuXrxNEwDY
	jrrWqtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAMP-0000000F96a-0tn7;
	Sun, 24 May 2026 15:03:25 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAMN-0000000F961-0sa0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 15:03:24 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=oa/91M+RiZewiR5387DQzJeQwjLB0EpF8DRIVzkeO0uZfup8MZOMBG3xK5KKDssiKKGQrpjB5MQ9YakM+5j8z5MiIh1ENoZP1eBGW7Tv8X4/fcrFxsLqmJT4FQrW4CMEs/HbB9oABbRldxYh6WNq3eWuOLtvtbnMhNX8quHQURSabwvo4u8Vz3hVAs1k1G+yH1SZ4KLOqMzHZ+iOETq7zyaVao02M6UhrAE6cFPI52UfiT2BwmL/Hg159GlJN+D1lTK19HJkDlKEiGocK2pGDEsISbVz+AxlSDDWciG0bXaAAMZ220SPDCFABX4x7dM21eMehinzEfIEp1My5tIrHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m87Vi9s2z4ycj7PdUNcTqSYF5i97u37ucngS8a0qbks=;
 b=F3QmK7t/gillukpIaj2WveYzBZwERcvd7oIZDmpgrD4HdRQ20esDpiDgXk49ile3+rcJ45ymtIhVtOYpMzn13AiXhLbqHJOcpFYnyI+pNZ/6If1zFbcNq3fiJKfuibbo8Rb2ijlq9KBDPyThi7W2OsEcs+dpE/mQiAglSFtrqVNZvM96M2EaJGuyEsXhnVZ5FkQ6SEg+aHgeXldcjaW+7ObBwifG+MamtKPyfp7pWmELoD96rlaFP/SC/vPO1WJh6U3s0ga9t+tlFR1RluGQItRuW4MxT9aqZP0EzsDGSYGg8m1mR/IWFjqcT35ePF0oUH10OvnjgMumDeULkFg+HA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m87Vi9s2z4ycj7PdUNcTqSYF5i97u37ucngS8a0qbks=;
 b=hs3sOeFOpLRFlpJxd101NU0xjWp6t/TlGjZKnO9fW0vBs2JQZShV2GyjLNoYhbEtcoMJs08h7Y9VYPKg68iVoiQaL0Y+Vd/ifeDWxEraaYhibZp1p9iztHC3rMYYVEHFmMVtH3sYB9OfXh6V48fcZevJVveIyUhTG8Xqkr2z7lgeIMEeSwrroloubxv/19rVclHU9QxP0EX9p6vvmwEeW/7brNxDlOBlf2V14/sdvNleST1njdXZuU01eAxcTzs9XW7SlazY6Clf4Ni1rxiG1ODPe0MpPJegnmPTE9sddUQpnSfJ9/Mbrbw7xdb+Xmw9aKExTkJXFAylx7P365Y3AQ==
Received: from DU7PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::19) by GVXPR04MB10070.eurprd04.prod.outlook.com
 (2603:10a6:150:11d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 15:03:16 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::5d) by DU7PR01CA0017.outlook.office365.com
 (2603:10a6:10:50f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 15:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 15:03:15 +0000
Received: from emails-5674389-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D66AC7FD6C;
	Sun, 24 May 2026 15:03:15 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 15:03:07 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nr7Qjn+T0Fwu7utmNJPXyz7IGPgscz4V+rOwU9gOdK4n8M9dnYTNqc2H3y5I8D6DXFINORN2WtYdZgoDE6OqP15HNkadYV7sX4uqLKNkln4Q8AssE0ldgjPap72BeT3fIgdKLZrW/swMSMuVuhrsXbd9AMzKilFUSthjZ+lZzWirVdjEFuXE+0NPOqbqO85kM9x3ftmWceGeDam2imJ4a2BXESn687rj7h3pW6kEa7K0QjBswE2z9+gJyqGzqYQ+4l7k4OBPD3HiTszSKv9NhbAiXk7Riwv1cIJP5GZSgHpkx7eiUjeRV6PR9vYnZj5dGwewFmE74ZJd6Ca7cKqDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m87Vi9s2z4ycj7PdUNcTqSYF5i97u37ucngS8a0qbks=;
 b=elAdwXfaKTlmB7hV/nI2aZc0JbhBOY8gAgZDsOPh6gsNJS8p3Q3NjZJz8XBcl3QruAA3ztfJI9EnSY3KO31A+Tc7SWBytvLwpiy6QwiNxmznLgT4V6EaIAWnueERhULjG3dWLykVfVhDkbvcUYwXdXUSV6+CexvW7eOdZBy0vkTQ2yA0d7j+jwOii0c7n1Zas9VllI2HJGktPvU5pb4oCrNx4CMlI7tLewOgHHEuhOkLPhE1Vc6rVwWEe8qQcaIp2XJ4EgDi/WuxvC/EHuz9wlIzlEMgfS/s35e248B4vgF5bvOwpK95GbykO+daFWzHazSqxSaSbQTlGPlx79yKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m87Vi9s2z4ycj7PdUNcTqSYF5i97u37ucngS8a0qbks=;
 b=hs3sOeFOpLRFlpJxd101NU0xjWp6t/TlGjZKnO9fW0vBs2JQZShV2GyjLNoYhbEtcoMJs08h7Y9VYPKg68iVoiQaL0Y+Vd/ifeDWxEraaYhibZp1p9iztHC3rMYYVEHFmMVtH3sYB9OfXh6V48fcZevJVveIyUhTG8Xqkr2z7lgeIMEeSwrroloubxv/19rVclHU9QxP0EX9p6vvmwEeW/7brNxDlOBlf2V14/sdvNleST1njdXZuU01eAxcTzs9XW7SlazY6Clf4Ni1rxiG1ODPe0MpPJegnmPTE9sddUQpnSfJ9/Mbrbw7xdb+Xmw9aKExTkJXFAylx7P365Y3AQ==
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 15:03:04 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 15:03:04 +0000
From: Josua Mayer <josua@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton
	<jon@solid-run.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Thread-Topic: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Thread-Index: AQHc641BrJq/RKSt4UOASflXt3DyN7YdRb0A
Date: Sun, 24 May 2026 15:03:04 +0000
Message-ID: <313fa31a-5221-4ac3-a744-2be3405a3a03@solid-run.com>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
 <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
In-Reply-To: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|DU6PEPF00009525:EE_|GVXPR04MB10070:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4ba367-6f6c-4289-4898-08deb9a5955a
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020|56012099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info-Original: RYCCWTQ6Zs4/crGCSHHhDz57JKl2Nch1XgKbGi2kYco2yo1/j4SbkQfh65csQtyxSgHB+Uzi388dAt93yoP23QJKH6WUxPMHEaTUs5PKB0vohHDPH6LSYNBdTIscTsGragX5+cViGo7+Q2ybSvn1U1n54UFkdboaxuT2CJhT7Wk4uV9Djy9FixZduU8eKPN2WYuohlobLgbTbP4GoRpRUjwY8J8gIO5980Pv199zGyNrVh9ReSGysKWYU5eyvJPZ7jRGUpfyyMdFwGJhbe3eWKsWgy5i7cyKNEk30V5ugOErhSWR5rntTuHAtZ3CKjAHyPLUk8XkPHSmOyIgNei9gd/fhX4AVGH3txrpd+aiqFZrb/hpLBoFkmIFgAHakRtDYd/AlAIjgGR7W+W6l4FcsRp50Ca+LS3IrpXN6bgKF+LDeyVeMVjHyruMYcxY7cwZBHx+FoaWRiotMrVvGNS15eA1UTmvZ9+WS3c0j/1sAXV39Hq80HkUGlMEK3KO9v6tKpFZPzHPKwUUTPp9Fb5rREIf9hgzzlKNbiLb3rbSasBvIJPwEQDOz76wodBkrFMNoSQUeRieOu3DvwQxlxg2b+1XiBTfKFYoprw6rgPIw351677iT0VfoBGRFUIenaJ+Gvp4pb6vrIkY8ge7UCRuQeigK2hknadarCgf+ZwEO917cR1yArGlqQHDiqs8S5m2AVbE7HuwUzPwKQtv2jMFgdX33s5YC0CD+Ub32jTdpc4frvo8f+p+Dub1P1woHYCrDiI6T5s+VzGrz8VMmgrqpg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020)(56012099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F9C0C756BD4C043B0D54D9094D8A1B2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PSFKeZCQ2TDQ6mj/JUoowAo4OqiBYeRqjH9UNQER/6p+AtQmM2qRU57lHQHtW76epieFue7xbe2HsywVJ35ghM8nRqP/7CV7du7gXuV0LH3R9r1s/3o1fimHxYcULP2/RFpMJ+X8Q/QRGMq95IPL6iNGovNI7oWd2FEf3V/unVI9ooXD7TmjQEfQi7GcvsZ9PBnDtMJcwfb4QThyc0JehwRD/ZVvG5HNephVQb2Catg2VnDDXwS5CIb2xRjSRWyY+KZNKBEF3Rz4dE88SpYv2BI/x/r/2dO97R8UXgbsBZi87Fxj3fAtXTyS8ISkVVwDth5USmC9B+A/2mEvwRgwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7e717de69b6445438ae421a383c6e750:solidrun,office365_emails,sent,inline:0a3bdd9bb938331ab4f933c77bae4b7f
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 32b5df51-7259-49c5-38ab-08deb9a58eaa
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|35042699022|376014|7416014|1800799024|14060799003|921020|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: BsFvHDRKRm7miUYMtRnR7JSppt62of/pgNSCGFz9z4Btdtq0x2CRjOsPbkoNjibBUZJt6RRRdW0ryTdF7c5XFOp9hvZAZst0hRhx3FnOTrJT1cofmXjvjo/IqDwcowuGUAZ7J5LEmVyWxjKn5PR5odm4wjfXC8XhNhY2H4kYSVI0mBWHPXx5PPnHB99vEVQrb1h8/jOl5p9dZMawgu7xWMGxzjImhXbEPP+G9mnYwL38bqh6B1FDCoWXySDc9qPCRa4HKRmKzfECODWQIvw8wxJ04lT6Oxd/T1JMVphOpaovSc17Fz5xQAYVM11XxqsKloEdbkfiPpIqj7wR3lClt52T3aYjf48Oq8NWfrfwAuMtSoYHBMIacbrqmIMNUs9D1y5r04si3ro9dY9ZDM3KfMMX5aJkbFWq4wy6fdhbebP9pJWet0WKGZdCByQ4WBHhpi9YT8hHwaUYTsHuIHJwtrg8R7Wlk3EqL+C0iq+kCntlA3X6tm7X8YyMbevWFfLK+eF3/wJwwvf0VAsd9Fg1ff3gP+UhfD8evzw9EVGlQk0YuQLm95O2aWfwwdgx7e20IeRu1LVfMJaeleKm4DhHOPZ6CmB+wz9HIGWN2FhwOqLDDrWyK4FuWdEMGfwrH2DqLBHQt9xYym2MS8YGsZAcPEt6H+EyT7fQPxgz/nzCLNlLY1E7gdhECa3oAKWXlw3MH5SdH/GCgZoT4PwbGXO0PxINbg1k/+S8oJjWFk5kFZG3zbBMHnx3hepSLtPMcy5fwuMTcV6Yy8WlnxhbbAYdUg==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(35042699022)(376014)(7416014)(1800799024)(14060799003)(921020)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h1KIn8NgOlQ4bSlili0kJuJJom2wh5AxfAl84gwWmmT3Tv6gNC1yraIqGDMPGhyhHwn44rJGoB/0dIN1v7YqapS8qwIVftAI1RCQmDy8fyWb2yDyZ3WX8PLC9Q9t6OjAdL2AphO58dcSPFAm81cVChzk+7QXhi82mR8C09AdlOpqqiEzRmdyHw7zmNP1f22nSDD/5N03IK8TPsdHvkL1CJfFmwhUrfVIxekLHXIRsjscwIiqcXiQuEdgLVCM/HWuiwD3jqUUeFNF/n9qkeZHNpcRHuTLsMvIVWsK8VyZIbIBaYXJ0KjhTBI9rVC/3FUW9PTLHqx/IRkgRu/r4ShiZAFKHLNaaVjgoD4/JkLPjTimn1GbCmluTFpOnN1gDhHPpA9KzK1fXt81hH6SYwo6TUXUu0iuJN3T6wiwBGlo/OA2GPZp5S4P12chwj8A+kzz
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 15:03:15.9238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4ba367-6f6c-4289-4898-08deb9a5955a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_080323_395950_B7A96D40 
X-CRM114-Status: GOOD (  13.69  )
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

QW0gMjQuMDUuMjYgdW0gMTY6NTQgc2NocmllYiBKb3N1YSBNYXllcjoNCj4gTFgyMTYwIFNvQyBw
Y2ktZSBjb250cm9sbGVyIHN1cHBvcnRzIDY0LWJpdCBtZW1vcnkgcmVnaW9ucyB1cCB0byAxNkdC
LA0KPiAzMi1iaXQgcmVnaW9ucyB1cCB0byAzR0IgYW5kIDE2LWJpdCByZWdpb25zIHVwIHRvIDY0
ay4NCj4NCj4gRm9yIGVhY2ggcGNpLWUgY29udHJvbGxlcjoNCj4gLSBleHRlbmQgdGhlIGV4aXN0
aW5nIDMyLWJpdCByZWdpb25zIHRvIDNHQiBzaXplDQo+IC0gYWRkIDY0LWJpdCByZWdpb24NCj4g
U2VlIFsxXSBhbmQgWzJdIGZvciBib290IG1lc3NhZ2VzIHNob3dpbmcgcmFuZ2VzIGJlZm9yZSBh
bmQgYWZ0ZXIuDQo+DQo+IE9uIExYMjE2MEEgU2lsaWNvbiByZXZpc2lvbiAxLCB0aGUgcGNpZSBk
cml2ZXIgZmFpbHMgdG8gcHJvZ3JhbSBhdHUgZm9yDQo+IHJhbmdlcyBsYXJnZXIgdGhhbiA0R0Ig
WzNdLiBUaGVyZWZvcmUgY2hhbmdlcyBhcmUgbGltaXRlZCB0byByZXZpc2lvbiAyLg0KPg0KPiBT
aW1pbGFyIG1lbW9yeSBhbGxvY2F0aW9uIHdpdGggc2ltaWxhciBmbGFncyB3YXMgdGVzdGVkIHdp
dGggVUVGSSBhbmQgQUNQSQ0KPiBvbiBwY2llMyBhbmQgcGNpZTUsIG9uIGEgdmFyaWV0eSBvZiBu
eHAgdmVuZG9yIGZvcmsgdmVyc2lvbnMuDQo+DQo+IFRoaXMgcGF0Y2ggd2FzIHRlc3RlZCBvbiBM
aW51eCB2Ny4xLXJjMSBhbmQgdS1ib290LCB3aXRoIHR3byBwY2llIGNhcmRzOg0KPiAtIHBjaWU1
OiBSYWRlb24gUHJvIFdYMjEwMA0KPiAtIHBjaWUzOiBBREFUQSBOVk1FDQo+DQo+IFRoaXMgZml4
ZXMgYWxsb2NhdGlvbiBvZiBsYXJnZSwgYW5kIDY0LWJpdCBCQVJzIGFzIHJlcXVlc3RlZCBieSBt
YW55IHBjaQ0KPiBjYXJkcyAtIGVzcGVjaWFsbHkgZ3JhcGhpY3MgcHJvY2Vzc29ycyBvciBBSSBh
Y2NlbGVyYXRvcnMsIGUuZy46DQo+DQo+IFsgICAgMi45NDExODddIHBjaSAwMDAwOjAxOjAwLjA6
IEJBUiAwOiBubyBzcGFjZSBmb3IgW21lbSBzaXplIDB4MjAwMDAwMDAwIDY0Yml0IHByZWZdDQo+
IFsgICAgMi45NDg4MzRdIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBmYWlsZWQgdG8gYXNzaWdu
IFttZW0gc2l6ZSAweDIwMDAwMDAwMCA2NGJpdCBwcmVmXQ0KPg0KPiBbMV0gZXhhbXBsZSBvZiBu
ZXcgYWxsb2NhdGlvbnMgKHBjaWU1KToNCj4gWyAgICAxLjE4Mjc0NV0gbGF5ZXJzY2FwZS1wY2ll
IDM4MDAwMDAucGNpZTogaG9zdCBicmlkZ2UgL3NvYy9wY2llQDM4MDAwMDAgcmFuZ2VzOg0KPiBb
ICAgIDEuMTgyNzYwXSBsYXllcnNjYXBlLXBjaWUgMzgwMDAwMC5wY2llOiAgICAgIE1FTSAweGE0
MDAwMDAwMDAuLjB4YTdmZmZmZmZmZiAtPiAweGE0MDAwMDAwMDANCj4gWyAgICAxLjE4Mjc3MV0g
bGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTogICAgICBNRU0gMHhhMDQwMDAwMDAwLi4weGEw
ZmZmZmZmZmYgLT4gMHgwMDQwMDAwMDAwDQo+IFsgICAgMS4xODI3NzhdIGxheWVyc2NhcGUtcGNp
ZSAzODAwMDAwLnBjaWU6ICAgICAgIElPIDB4YTAwMDAxMDAwMC4uMHhhMDAwMDFmZmZmIC0+IDB4
MDAwMDAwMDAwMA0KPiBbICAgIDEuMTgzNjQyXSBsYXllcnNjYXBlLXBjaWUgMzgwMDAwMC5wY2ll
OiBpQVRVOiB1bnJvbGwgRiwgMjU2IG9iLCAyNCBpYiwgYWxpZ24gNEssIGxpbWl0IDRHDQo+IFsg
ICAgMS4zODU0MjldIGxheWVyc2NhcGUtcGNpZSAzODAwMDAwLnBjaWU6IFBDSWUgR2VuLjMgeDgg
bGluayB1cA0KPiBbICAgIDEuMzg1NDgxXSBsYXllcnNjYXBlLXBjaWUgMzgwMDAwMC5wY2llOiBQ
Q0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAwMDE6MDANCj4gWyAgICAxLjM4NTQ4NF0gcGNpX2J1cyAw
MDAxOjAwOiByb290IGJ1cyByZXNvdXJjZSBbYnVzIDAwLWZmXQ0KPiBbICAgIDEuMzg1NDg4XSBw
Y2lfYnVzIDAwMDE6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHhhNDAwMDAwMDAwLTB4YTdm
ZmZmZmZmZiBwcmVmXQ0KPiBbICAgIDEuMzg1NDkxXSBwY2lfYnVzIDAwMDE6MDA6IHJvb3QgYnVz
IHJlc291cmNlIFttZW0gMHhhMDQwMDAwMDAwLTB4YTBmZmZmZmZmZl0gKGJ1cyBhZGRyZXNzIFsw
eDQwMDAwMDAwLTB4ZmZmZmZmZmZdKQ0KPiBbICAgIDEuMzg1NDk0XSBwY2lfYnVzIDAwMDE6MDA6
IHJvb3QgYnVzIHJlc291cmNlIFtpbyAgMHgxMDAwMC0weDFmZmZmXSAoYnVzIGFkZHJlc3MgWzB4
MDAwMC0weGZmZmZdKQ0KPiBbICAgIDEuMzg1NTE2XSBwY2kgMDAwMTowMDowMC4wOiBbMTk1Nzo4
ZDgwXSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAwIFBDSWUgUm9vdCBQb3J0DQo+IFsgICAgMS4zODU1
MzhdIHBjaSAwMDAxOjAwOjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMS1mZl0NCj4gWyAgICAx
LjM4NTU0NF0gcGNpIDAwMDE6MDA6MDAuMDogICBicmlkZ2Ugd2luZG93IFtpbyAgMHgxMTAwMC0w
eDExZmZmXQ0KPiBbICAgIDEuMzg1NTQ4XSBwY2kgMDAwMTowMDowMC4wOiAgIGJyaWRnZSB3aW5k
b3cgW21lbSAweGEwNDAwMDAwMDAtMHhhMDUwMmZmZmZmXQ0KPiBbICAgIDEuMzg1NjA1XSBwY2kg
MDAwMTowMDowMC4wOiBzdXBwb3J0cyBEMSBEMg0KPiBbICAgIDEuMzg1NjA3XSBwY2kgMDAwMTow
MDowMC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQxIEQyIEQzaG90DQo+IFsgICAgMS4zODY3
NzhdIHBjaSAwMDAxOjAxOjAwLjA6IFsxMDAyOjY5OTVdIHR5cGUgMDAgY2xhc3MgMHgwMzAwMDAg
UENJZSBMZWdhY3kgRW5kcG9pbnQNCj4gWyAgICAxLjM4NzMzNl0gcGNpIDAwMDE6MDE6MDAuMDog
QkFSIDAgW21lbSAweGEwNDAwMDAwMDAtMHhhMDRmZmZmZmZmIDY0Yml0IHByZWZdDQo+IFsgICAg
MS4zODczNjhdIHBjaSAwMDAxOjAxOjAwLjA6IEJBUiAyIFttZW0gMHhhMDUwMDAwMDAwLTB4YTA1
MDFmZmZmZiA2NGJpdCBwcmVmXQ0KPiBbICAgIDEuMzg3Mzg1XSBwY2kgMDAwMTowMTowMC4wOiBC
QVIgNCBbaW8gIDB4MTEwMDAtMHgxMTBmZl0NCj4gWyAgICAxLjM4NzQwMl0gcGNpIDAwMDE6MDE6
MDAuMDogQkFSIDUgW21lbSAweGEwNTAyMDAwMDAtMHhhMDUwMjNmZmZmXQ0KPiBbICAgIDEuMzg3
NDE4XSBwY2kgMDAwMTowMTowMC4wOiBST00gW21lbSAweGEwNTAyNDAwMDAtMHhhMDUwMjVmZmZm
IHByZWZdDQo+IFsgICAgMS4zODc0OTNdIHBjaSAwMDAxOjAxOjAwLjA6IGVuYWJsaW5nIEV4dGVu
ZGVkIFRhZ3MNCj4gWyAgICAxLjM4ODk2MF0gcGNpIDAwMDE6MDE6MDAuMDogc3VwcG9ydHMgRDEg
RDINCj4NCj4gWzJdIGV4YW1wbGUgb2YgcHJldmlvdXMgYWxsb2NhdGlvbnMgKHBjaWU1KToNCj4g
WyAgICAxLjcxNjc0NF0gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTogaG9zdCBicmlkZ2Ug
L3NvYy9wY2llQDM4MDAwMDAgcmFuZ2VzOg0KPiBbICAgIDEuNzI0MDYwXSBsYXllcnNjYXBlLXBj
aWUgMzgwMDAwMC5wY2llOiAgICAgIE1FTSAweGEwNDAwMDAwMDAuLjB4YTA3ZmZmZmZmZiAtPiAw
eDAwNDAwMDAwMDANCj4gWyAgICAxLjczMzI3N10gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNp
ZTogaUFUVTogdW5yb2xsIEYsIDI1NiBvYiwgMjQgaWIsIGFsaWduIDRLLCBsaW1pdCA0Rw0KPiBb
ICAgIDEuODM2MjIwXSBsYXllcnNjYXBlLXBjaWUgMzgwMDAwMC5wY2llOiBQQ0llIEdlbi4zIHg4
IGxpbmsgdXANCj4gWyAgICAxLjg0MjE4Nl0gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTog
UENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAwMDAxOjAwDQo+IFsgICAgMS44NDg4ODNdIHBjaV9idXMg
MDAwMTowMDogcm9vdCBidXMgcmVzb3VyY2UgW2J1cyAwMC1mZl0NCj4gWyAgICAxLjg1NDM2M10g
cGNpX2J1cyAwMDAxOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4YTA0MDAwMDAwMC0weGEw
N2ZmZmZmZmZdIChidXMgYWRkcmVzcyBbMHg0MDAwMDAwMC0weDdmZmZmZmZmXSkNCj4gWyAgICAx
Ljg2NDg5Ml0gcGNpIDAwMDE6MDA6MDAuMDogWzE5NTc6OGQ4MF0gdHlwZSAwMSBjbGFzcyAweDA2
MDQwMCBQQ0llIFJvb3QgUG9ydA0KPiBbICAgIDEuODcyMjE2XSBwY2kgMDAwMTowMDowMC4wOiBQ
Q0kgYnJpZGdlIHRvIFtidXMgMDEtZmZdDQo+IFsgICAgMS44Nzc0MzhdIHBjaSAwMDAxOjAwOjAw
LjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4MTAwMC0weDFmZmZdDQo+IFsgICAgMS44ODM1MjZd
IHBjaSAwMDAxOjAwOjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTA0MDAwMDAwMC0weGEw
NTAyZmZmZmZdDQo+DQo+IFszXSBlcnJvciBwcm9ncmFtbWluZyBhdHUgYmV5b25kIDRHQjoNCj4g
WyAgICAxLjcxNjc2Ml0gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTogaG9zdCBicmlkZ2Ug
L3NvYy9wY2llQDM4MDAwMDAgcmFuZ2VzOg0KPiBbICAgIDEuNzI0MDgwXSBsYXllcnNjYXBlLXBj
aWUgMzgwMDAwMC5wY2llOiAgICAgIE1FTSAweGE0MDAwMDAwMDAuLjB4YTdmZmZmZmZmZiAtPiAw
eGE0MDAwMDAwMDANCj4gWyAgICAxLjczMjYxNV0gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNp
ZTogICAgICBNRU0gMHhhMDQwMDAwMDAwLi4weGEwZmZmZmZmZmYgLT4gMHgwMDQwMDAwMDAwDQo+
IFsgICAgMS43NDExNDJdIGxheWVyc2NhcGUtcGNpZSAzODAwMDAwLnBjaWU6ICAgICAgIElPIDB4
YTAxMDAwMDAwMC4uMHhhMDEwMDBmZmZmIC0+IDB4MDAwMDAwMDAwMA0KPiBbICAgIDEuNzUwMzc5
XSBsYXllcnNjYXBlLXBjaWUgMzgwMDAwMC5wY2llOiBpQVRVOiB1bnJvbGwgRiwgMjU2IG9iLCAy
NCBpYiwgYWxpZ24gNEssIGxpbWl0IDRHDQo+IFsgICAgMS43NTkwODldIGxheWVyc2NhcGUtcGNp
ZSAzODAwMDAwLnBjaWU6IEZhaWxlZCB0byBzZXQgTUVNIHJhbmdlIFttZW0gMHhhNDAwMDAwMDAw
LTB4YTdmZmZmZmZmZiBmbGFncyAweDIyMDBdDQo+IFsgICAgMS43NjkwODldIGxheWVyc2NhcGUt
cGNpZSAzODAwMDAwLnBjaWU6IHByb2JlIHdpdGggZHJpdmVyIGxheWVyc2NhcGUtcGNpZSBmYWls
ZWQgd2l0aCBlcnJvciAtMjINCj4NCj4gWzRdIHBjaSBib290bG9hZGVycCBhdGNoaW5nIHJlbGF0
ZWQgZXJyb3JzIHdpdGggSU9SRVNPVVJDRV9NRU1fNjQgZmxhZzoNCj4gWyAgICAwLjk2NzgwOV0g
bGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTogaG9zdCBicmlkZ2UgL3NvYy9wY2llQDM4MDAw
MDAgcmFuZ2VzOg0KPiBbICAgIDAuOTY3ODMwXSBsYXllcnNjYXBlLXBjaWUgMzgwMDAwMC5wY2ll
OiAgICAgIE1FTSAweGE0MDAwMDAwMDAuLjB4YTdmZmZmZmZmZiAtPiAweGE0MDAwMDAwMDANCj4g
WyAgICAwLjk2Nzg0Ml0gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTogICAgICBNRU0gMHhh
MDQwMDAwMDAwLi4weGEwZmZmZmZmZmYgLT4gMHgwMDQwMDAwMDAwDQo+IFsgICAgMC45Njc4NDld
IGxheWVyc2NhcGUtcGNpZSAzODAwMDAwLnBjaWU6ICAgICAgIElPIDB4YTAwMDAxMDAwMC4uMHhh
MDAwMDFmZmZmIC0+IDB4MDAwMDAwMDAwMA0KPiBbICAgIDEuMTY5MzE1XSBwY2kgMDAwMDowMTow
MC4wOiBbODA4NjoxNTcyXSB0eXBlIDAwIGNsYXNzIDB4MDIwMDAwIFBDSWUgRW5kcG9pbnQNCj4g
WyAgICAxLjE2OTczM10gcGNpIDAwMDA6MDE6MDAuMDogQkFSIDAgW21lbSAweDAwMDAwMDAwLTB4
MDBmZmZmZmYgNjRiaXQgcHJlZl0NCj4gWyAgICAxLjE2OTc3MV0gcGNpIDAwMDA6MDE6MDAuMDog
QkFSIDMgW21lbSAweDAwMDAwMDAwLTB4MDAwMDdmZmYgNjRiaXQgcHJlZl0NCj4gWyAgICAxLjE2
OTc5Nl0gcGNpIDAwMDA6MDE6MDAuMDogUk9NIFttZW0gMHgwMDAwMDAwMC0weDAwMDdmZmZmIHBy
ZWZdDQo+IFsgICAgMS4xNzMzODldIE9GOiAvc29jL3BjaWVAMzgwMDAwMDogbm8gbXNpLW1hcCB0
cmFuc2xhdGlvbiBmb3IgaWQgMHgxMDAgb24gKG51bGwpDQo+IFsgICAgMS4xNzM1MTVdIE9GOiAv
c29jL3BjaWVAMzgwMDAwMDogbm8gaW9tbXUtbWFwIHRyYW5zbGF0aW9uIGZvciBpZCAweDEwMCBv
biAobnVsbCkNCkkgbWVhbnQgdG8gZHJvcCB0aGlzIGJvb3Rsb2FkZXIgZXJyb3IgbG9nLCBiZWNh
dXNlIGFmdGVyIGZpeGluZyB0aGUgcmFuZ2VzIGZsYWdzDQp0aGlzIGlzIG5vIGxvbmdlciBhbiBp
c3N1ZSB3aXRoIHRoaXMgdjcgcGF0Y2gu

