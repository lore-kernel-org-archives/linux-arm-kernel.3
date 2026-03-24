Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022B3F4613D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=; b=UIvIZw8+7UkuQ5OwdfVatPnE79
	ot67mUUs0Z8aJLj67aYiKI0kBgJZb4eKaGiHrR5o/CnmAF+C/Jgvud0oz9u6fBxE16wwGVTaDt7bS
	RY6s/tt+hL67psmrJSMEiqhNjQapJR0XvBZNfRSKdQ8bgYKxjBudp5G+irfZ18boJ5aEIGgHs4txp
	CV4MfJnIwmq5L/FeJcZfBoj4GM817MW0zSm0ToMajFVVN1HXcgX1s0Qu9wBtKp6mWeqzLMLjqT7KK
	3OfAQbv57xp9YWltGRORZFIBCeGWZqKKan6pnkFtAAroDZ1KqD0GdWmXeqyHxe9UVCsG66A2cTKNR
	sIOAb8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514s-00000001OxZ-0b4m;
	Tue, 24 Mar 2026 12:41:46 +0000
Received: from mail-francecentralazon11023092.outbound.protection.outlook.com ([40.107.162.92] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514l-00000001OsD-0aLP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Staxq2gZ3WtEBNDwNkBmmXxNpZZkEXCGkc6vFPoHt7M+9N+i9QWFCUWYW6JjKlGauypkzW8JmTYi63gHRCMkNJDukefE5oc34JXjCbO6CCVUEUZA7EMQLJ13rVtt3KB1IPu5SB+sVh1PETnq95c1buEEJ/tXtvEXMdsZ7UXg7VC0DYzmQQVR0rbcMzvPTlo92/fji1j3YkY5BFvIzl8ZaBo8euH44yjKcDt9wya/hISrsC1Sx32h3rrSfImwTnTHLNLPh+HUt7XytxjM7VoYmOAMQi819ObJ5E2dM+HmtipH6SftyT19DA6IIFCK8MQk5R6l1UjcAzSniafpZf64Cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=VJwwQnzKyNgAKTb9p8R/tmVZkksnMeVZ+tj4+2Vh32e0NYnHXTRPMIxdZ4i9OTFdhXDWyDpHp/CvCkkoWajkmzd0l1mwHC5v1CHuLdDNfW2Yk2VgTH3s6Ba4C/MNCB7Sm4jD/sHI1k9aZWwfxk3iOwt5Qiywy5oA8gz8NAlNcIoqHxyvUcjrtu3+qX0y3GfwWZtPrSLiZ4/kHSfLbQ5OhASfg/W6Xhu2JE43C+69VLndSIAKXHtmeQ4qZA3CizNYVwBX1nsfNCRkBmp2rwLeaP+ZWRXFC6F2X5+h40Upfe77HyoJ2kkM5TLQtijgQfzw9TgqpbrXycFKXE6v3WM+dg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=DvHTzDmJz6u/QHe8Q2qSK/n6H09ofE3gBbAp7BbY6A3mQPh6N/Um8H7Mp45ogmc6fkXh1cB8/ukunQ0uNCGrmJMYj/Rh4DTL+BeRB0w+HvXorqMhaHiRS3TBCoiW0Bvr7dxWDcWlFkFYlY52o00IBqOqwxZJo5hPHLvLw9aZrVM=
Received: from AS4P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::20)
 by AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:24 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::4e) by AS4P250CA0030.outlook.office365.com
 (2603:10a6:20b:5e3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:32 +0000
Received: from emails-2668-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0F61980118;
	Tue, 24 Mar 2026 12:41:32 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:25 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW+cjMtrpDMdP5psDKNfN+a0Ttn45jcro1qzQ6QN+HcaqBdEuKWTMz3Ud6qvW0tZ8mCY7iloydtg6x8MGH/KhQc7lzTUdys2p7OUobjzGhXUZeMNN9NArxm5qsCmRNgh+yUPUmXyVR5SiaeUhWChKTal0tWVfmJRnybWTJYLQGRLTD/JxFqfVlIOqWI+2jLM9AYPm4KMrvRNmGErRdJMQ+/LI7wUgc3+RTkt12lUR6pFGNweylYIwXQ7YTW/HUl05E/ObhLE5XPGzbnRuVPQ6HxBXlbeGiwFDlTRwhDi8Q/oaeZogZjwe5AEWXy5YRZSpLBuzPLotJ/dztTVnFaQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=GwlxTMEUuDUInnGQi5pmFvhoBYiaY8+BTygNrTa9VfhKfGlEDwSd9VlzqeRyqcvY3MClCRs1xeB4bJB4cx6fYWKsLukfeX/9Ur53+5V8yAVbFxUNywoJNYBzmo9F5UyEghANaHc1yrq5MDqEHTtyWZQ/b9wgXv7vvE9JeIuPxVrPKx/2YK/O6qXT6SRO2o63XrHVc7XBVjFDQ11JJu6jJi/dMaWRtkQCTdnW0HETiXRtIlNTvnOZYZaTbXxYsrpPrS6j68Urj96O7uM/of4Ohwc4Bt4J2sdSxnE0WIgpyGEBHOhIacpgaq9vgQb3SdRL+wfjysHfsWw/kZzjgXYq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtdicxhQZQful002p2FPiQBhzzSIOaWfLVbVVk+xlGs=;
 b=DvHTzDmJz6u/QHe8Q2qSK/n6H09ofE3gBbAp7BbY6A3mQPh6N/Um8H7Mp45ogmc6fkXh1cB8/ukunQ0uNCGrmJMYj/Rh4DTL+BeRB0w+HvXorqMhaHiRS3TBCoiW0Bvr7dxWDcWlFkFYlY52o00IBqOqwxZJo5hPHLvLw9aZrVM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:14 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:40:59 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:40:56 +0100
Subject: [PATCH v6 02/10] arm64: dts: lx2160a: change i2c0 (iic1) pinmux
 mask to one bit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-2-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AM2PEPF0001C716:EE_|AM0PR04MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 44cd5933-70c6-40f1-8ad2-08de89a2ada3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 9Xr7flIOWsj31/IUfvxDT/92pxhfW8jwPUScXN8XFdCoHds3oNm7VZMaE2PrxM50QwRHUKnpx+IPn46ew5bFojJzkF8BbgTSloBg4WWN2xf4W4mZa21AXjcJ6TrfO8F1INA6CfGQP0aVMt897bEwRZXHV2/TQR/G4jF4TD+wtzIiF3SCacKX1fpRpLoOBpmU3Ri+J8YtjMoxX3eqxKBFNaiI5NNUtzr6PZjnj9LzbpgmRjrQCUEIMg5Mgl164z0xYgETuskwqJHodtF9wYZooGb6jVpgv6ks0enVUgo4GVBR4XdjEFKB7PJ7x8bNbv/eczE2TkvFt5eob8fI+KY0U0qBbWnkvDUNFLOhimgxLVMUfzDoZwgeba0oDolj8ly1QDj7aBt7du6qBvpt2+CBdxcsJBTjdWh4Dd7VD8h522pJ+FAbAepBsAnBJPEknKG2WZU9w1U4YJLo/5LJ9KrfxPRN0x3upZiJjrp5M62/qMmst5Hxd5AzCf6I5L/9p41wEntgC7a6YzpRvxob/tMZZnNEmhyTqaJJoIyNQLJP4ja9C8jWm6SHQ4NeZ0D1f/41V1tlcfkp2EVAwE4b3eQrwoG8NqaBeWzLnREZjHstlRJnD693moZhkkRnMHOYQfAfNrDpStRHSIocq3dYtAerrK/dWmp+0rNqaLyiHfyj5iAj7/r6I3QTPIKitQdTjseek/mce8XnUEG68zBk1UXILm3Oyc5QFJurcHRvouR6u7uoswiQUadc3wIIyusG4ZWrzwOrISIafOeUozeSD8zo5EUusSK8pT3qeiBMvOwnyHk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: m7oH3ey+/5DapAvj+n1rEJhbCSsMgjIQBQYiWFk/Z6rNox02AdpZFHfZURv7JhgPzzLiKZYry1pBG/UgFF46HGk/1p8/rPvZUWU40m+GGBK8gj36zIkD6450SxsjWEJyB6m7Bb9QCnCBkvn0kTKr8aZ5TW+3viWn06RIhPcMymcb6FHDpX7Udpe71HFjli3pVHdoN6zbakT5qJqQELEQXpofNp25VFyS+h5zJGdC8NiZOWMUbF0Efb2ChN/G8QJIUYn27tdbBs64X8j9iNHpB0owUUl+qkt/9QfOQrLc1hKm87EDFFNcJQKrYmI63gd29ieJFd+w16rZo4PEXbJpvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 77b71b1efc5c4d34bb95f4a2290e0719:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9f8894e1-ca07-4301-33d4-08de89a299a3
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|82310400026|1800799024|14060799003|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: AVWwIwjtcrXbg61/5LczcV251+I4r9QekVVqvT35ELGFiYZSqW97TZ3uyKUJglF56vjdh7+e+QdHAUFKgwE7IOAJ6PQH8jX9BKUOOjrzpMS4O0nZY1yXbAqlpDA2ey+DfG+8MtoA25kv3x2MmkDQAORolFSNqOBzRbqiMiV569FM419/3IZRJiREijTL/a84XjnYf0mRAOkvxcX4JecqRjFyYNfQQkoqFNcnKsPKfN3zzzbDGcmFXHj8Tcy7W92cGuh+4KRQ4cQQwNWisx5KO8R4/lEB+bhKkHAMmbXV8CNDhliu47lyAohk+9lT4SESTa3k4d10NqqLMSPHQ6596lxO2xzRtwFZE6+AV7oQK1v2HfKS9Mb2aJ0RwnHu5FLaYnb5/IyBIJcuyf35OIYFKLbJ8b9z6bSsThLCiSZIH3uRqAHGB0iv/DNfd9m9p+grVaoF4/U8iIG9JUFB+g9FqSOATrD2VMvwbCPdXMIlx2zB3mTuaC323jT1cRM61g2u+f65IiWHaxbfT1E82fgXYe52HTvOPU4CsVbCoY+iGe7TK5CCSEkuWAZVt6JJJUy2Yraq+6CRG9m+3qBiEqnIsZfQ8CA8rEvpKaWt82DXICT6fKMpu/m+Y+SwiND23Aj+SmwDQowin+DGAMwaljO0prlb1p+XpGDNXv88pH6SX9sOmxBb/f7cW1T/82pjtqU5/74bc5ZhC3/crbwcTtlTD5JCFA/j30oHZ7ZvHo4vUN8bnNHoL3TAINRoOAtcXnrB6OCGGpoVx5ESzRKlyPN8FQ==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(82310400026)(1800799024)(14060799003)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w3WeBA+AhNr/1DpAck6/p+ih6NurP00eRP2HmjptSihQp5hr6mr+RhXWqZgArld8KBEzkMfMgkmh3cAw1QgGs3fRl063lWwlN8X2svRlNw5zH9tS9CpBlgZX/enE66Hp3zfOUIxEaBFBytpn5L/5ODSW/FHXX/TX5vjSPm0N3riTO+07dS8x128W5fAfL4b+9XaboZmibLmSzHbyIGVtj3H4Tsb1xBlZAAPnP3ibI8koVWbXMAD6wKffEHH3zJmkHp84Pn3eNFPA8ARvMJcz/EmY9oY82UUdoVpKgZ3R2gaj7cRB6fmWjbzg2202PbIDXAs075gf+znZgOlF5giBIqhO8yAJhFBNuvcb+DHV7jWMBROawF8lOpaLfYl2wxZn7AfjKYIuK68Ty8jghwhKLeE2wMJschIzPH7BmMR9YgDGFlXU9YexycfDNwL6zUMM
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:32.3070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cd5933-70c6-40f1-8ad2-08de89a2ada3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054139_189071_F8869D74 
X-CRM114-Status: GOOD (  11.33  )
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

The first i2c bus (called IIC1 in reference manual) is configured
through field IIC1_PMUX in register RCWSR14 bit 10 which is described in
the reference manual as a single bit, unlike the other i2c buses.

Change the bitmask for the pinmux nodes from 0x7 to 0x1 to ensure only
single bit is modified.

Further change the zero in the same line to hexadecimal format for
consistency.

This change is of cosmetic nature enforcing consistency with
documentation. There is no known issue when writing the extra two bits
marked in reference manual as reserved.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index af74e77efabc5..d5bb55df03216 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1794,11 +1794,11 @@ i2c7_scl_gpio: i2c7-scl-gpio-pins {
 			};
 
 			i2c0_scl: i2c0-scl-pins {
-				pinctrl-single,bits = <0x8 0 (0x7 << 10)>;
+				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};
 
 			i2c0_scl_gpio: i2c0-scl-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
+				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
 			};
 		};
 

-- 
2.51.0


