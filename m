Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A68910706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=; b=sEp5xrV6j/QUMCfSKUXzkrFr8g
	w7mH+sBTXNTwxEv2KBMQriT/spijuR6O24/OWPmn/z7rTweT10XwfAuuY5FhCfWiuqLXfToVCEVnG
	6EDycL37Vyx9Dn24W1cTe2rGndpvZRgiACQBPRO0h0o5S+bjh6rmxS1oVr9u+SZxSy5/meSCt6h8I
	AxO8pEObHM1OcelLSR4+AWdvonruLjC42lhGQ1i2Mta/sovCvrMN9XxdKi/M19fo/jVtwv74U54Fa
	WGE0X4r2xZweka6Vb3VFEZzVcoPs6t/o38JN1ot6VrfZQ6/ErX3wB/E3BsGVhBb4ykUUVroGu/uED
	h4Q0ylbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkY-00000001nuo-4218;
	Sat, 14 Mar 2026 12:05:46 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkS-00000001npT-2Hjs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Tybr2y//KGETmEMchA0uX9x6cN6Kx6LfcRUsRYbYoywUlaUdTU6lBa0sDVtXq8goaW5VMB4Sbge5AJT+yzMwaKMgAukVnyGglwKgxy0e7RCbGLZ/nWcS29Rep5qwgdDfdqHJLX4WqX/ezANRY2IMhfBD4dYDMpxUyUZaUxA2gB8lnoL4pA5mL7kMrx0EAfo8SW05oImblp7IL8cph9ZuQhffiYquMuNpVvkfJEkOgm01DFlUh9dlYgZ7eknwkf4IMtouAMmxewmHlE2kDsZ2mnkrnWlTTV/Nc9Bv8gGyKG1CTfzgBOiouNRbVeCrqoeCXLC8B3TnPOnxWA/a6PpypQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=fZDxMVca5pI1FSd0Ss8iPvZvciH3AGVr39v8rplayU4bPYbCw9+sZ9VdoClYP8knbESiOdOq0i0G1Qj9DEPskutxgReZJ0wf0vaF9QUEJGYK10ktcoNmvq+04GnvC0+q1ANDdhkDpImZFiuXIu4twkbJleLxZrfMDmxT3Bfa+mkvU51XbwubGYAmVg2B8yxXlbri8pPG5z5ZOuKdri/OgAgkro2zqdgbIlD5LQgHNHPhuMbeRmrjX8HDBontKEp0RcnMqNTtP193lyHwfFWZhzvqZpP1XMngIFVgp59hUvqvtmFF8osZJC59G/FJOGbyz2BvB8ccC+/HixYQRxFEJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=temperror action=none header.from=solid-run.com; dkim=pass (signature
 was verified) header.d=solidrn.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=dB4dN5mC+WPbJ2UA6Ls3m6sbSEajgbW8aXpCZEWIQYBrfvzJQGAUwx7Vsp6WUcbJP3aClfrZ7jJUYp4Ds0HMOyb5X0N5WbWW2c1qyVl9TbhfFDKr2hghy1zH3+Pm8X+q5M8GqWXRrxReBnU2YBYIrwrgVN+5XgPMUNpJ6XYGTDY=
Received: from DB9PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:1d9::11)
 by DU4PR04MB11754.eurprd04.prod.outlook.com (2603:10a6:10:626::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:05:18 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::41) by DB9PR02CA0006.outlook.office365.com
 (2603:10a6:10:1d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Sat,
 14 Mar 2026 12:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=temperror action=none
 header.from=solid-run.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of solid-run.com: DNS Timeout)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Sat, 14 Mar 2026 12:05:36 +0000
Received: from emails-3033242-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3CDCA802C2;
	Sat, 14 Mar 2026 12:05:36 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:28 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiWu3SfYmNXUf9c+P3JuVy9GX+aeVOENZvnnr/O4vAIq9eCNIutLJIomwcj8Gw5P+c41g8R+JokbZSzcx6CzQGD0s+Z079VOIoACzhyEy9GBC1QNc+IbB8tBUQj8q4WHUqMZXiFwa9bs959b8eQ8TSPGS4e70S1NDmI4RcCDdwYDILuW6URCNMQJGIXj2nY7VJvpiorOyA14ATnfwhNc4+qYGrkE6nfqLiQIPAGubO5PxAfSG56pwSa8Ut0EF9Zep0nzg2oltv+ERuf3yFUM2rZs9N3+w022EtQ3z8WtSYbqnLD7lCShi32O8pAAVRXP+fc1pP+J3KyAP8ROVhBc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=uM8HgM0t0JUODr7TqwDEU2QLEkILw3r9Ky9PdlR7JqCkXzXcTcpoSg3sKckta1RPnAC9loIQraQ6PNZKFRxkHldu+bj6ocD2IpoFfPSL/dc1cTT+AUfwlu7yqz9CS4a+OiEu1ZXPgOZxRAjTbI3IaKEZdCakrh7IO5WB1lXjv3hBPn10oumHytLjoGISelbm6UsuxqtIWx7OUeAtDWInlB9utc37u4ugryKA3+gleX/MUVM8VHb8W0HcdaYxDESoC4F301WNzeIYV8CagFzoDHtwopnFxiOGL9ZdH7PSm1I1BDfWZ+MQT8RgtD60moyEXAI4MyzXG8I0fvvPUaknfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=dB4dN5mC+WPbJ2UA6Ls3m6sbSEajgbW8aXpCZEWIQYBrfvzJQGAUwx7Vsp6WUcbJP3aClfrZ7jJUYp4Ds0HMOyb5X0N5WbWW2c1qyVl9TbhfFDKr2hghy1zH3+Pm8X+q5M8GqWXRrxReBnU2YBYIrwrgVN+5XgPMUNpJ6XYGTDY=
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
 12:05:05 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:19 +0100
Subject: [PATCH v5 09/10] arm64: dts: lx2162a-sr-som: add crypto & rtc
 aliases, model
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-9-83de721585e3@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DU4PR04MB10500:EE_|DU2PEPF00028D07:EE_|DU4PR04MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: e195a297-32c3-4397-ff69-08de81c20064
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: nQGjZXLYAueB+DKcI1P9+KfQO3+bdHGARSgmTqN1PS0OWTSI2DWZ7jwHcCY4bO7pCV6AFQJBfhA2SiW2Rar/UOdiAfOMUQPVVRNPjEVOz0/3z41k0h7Cl6MPwrjULN/13TVF1CjucQqkM8ZAYQXmFeJsYExJ9bs2Ne4Wjh2amVDRolyUpeKs2zQQiSdPP4lqZw1Peg2Md4mHf6Cc0eEf0d1qrWt7fs5hYadrj7goJLjoQa5hTLlkhgDEvmelvxibjHyBVbkQwE9y7fISkGQO0qYaA4iHNvLHRd1TQNWPPqeA49JjZcgEOqN+VCg8kb+06j6N5IEOi7nn4u4SMGToFfAtGVifaWqk04hruc9WzxJUup0pon5poXOGtCSsrVJ7N4szf7jza1vnmBQZy3y+L4GLP2p5kL36hRdJq2AOhYDIDEL+YgnozJJt0gsKPWfw3CC1s0wMYHw4zuZyxj0CcGpW3FxtEyySu+m83vWjAVWILSEpBEm6SLn1KPrsuOuxtOGiX0Xt+Sbiagoz++Z+4+mYnH6QSihN5V2R/Ba7B8U+0sVbwcgbdXoqwa5xXOtaAzqOV3K19BGeMVRJ3aw8eE6HvIG/nB+TPyL7Ua/VJ0Md+do2pHUz5IFjXjSFp2vOrgXHLZ41cwol05A4AV7eyUUKt3ulyeBUehrKfjECrX7xbiIgIcMF//KaWs9tCko2XIRfQbzFjTwa5u3ykaDugaARsuSoWDhorOtHlGyTv2V0np+DUSWt1apdKAQJK2weoUBmXN6/c/3DW+6suLm4RKUFFlHgIB3+mQpmgQ5CHq0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: uIa+Pn0reCe5SDBfIiGHs1ZxwH30yaqVf3VwNcyxxuBO7Oy/o7yugkrtAdSD+z3J5ML/kkQn9Vx5m+b5A29TbqUSrLyS5OXzGWv82a5QoFWUp3NDbTgfOX2UKlsc/Vm3j5jtrn7qOpn3e7fQ3I9kqe89v6WyqXdUgJIa7yxkQ20tsLqA82K1HlEaxbcoE0Wet4ChaGvOH/dD+1vYuUgE8wpjhdwMElI8UA9I+/cNJ1ch/s/TsLEvAAlrXOylznf8Rmy/+EqlkH8dYo3z9SvM51IG5SBOtMcFQORqYxFrvdyMDbaZV/Y0WQRSL4okI72NvoYqWwwFIOBP8WtBt0+Caw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 41794e66bee34fe3bf809ed4668dd09a:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e4c2bca3-457a-4150-4130-08de81c1ee0b
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|14060799003|376014|35042699022|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JoJ65zREimt/f5FyZ2w8fX/43cfTPC6HBC8IqXgs4nv4ipDnjol5fmFj78QypTz8Cd30fNuvG3SZTX1O3Hu/aOqUjEhklNqQ+MehpHNGcJJ5G2wti+cDC/8sAbT5Nz4R7h797BSoJEMqrHNPFJXqcGLjB2D5Q756neUxXem1Kg1GVIgNOrlx2m05hHv6qjkkZ2mdnSiBYbXlA1hjVJHHEuE/5ikMZzVX4NjW7yno8D7qmqQz8aSB/2EC8/BIS8+0gpGsP5uQWS35pFjgSgubOmizhO9pivj3aZapYC2ym/BFdMcksZDdtrorAsXfPp+1lDqhv4mBHJLd0LvwLNVnd/x+UHTDkDI/MKoFOecuBRhq2EYeFEFOLc8/K14KcIKGiBZy7DO7GgbHJWW7erLdoWIJ5fdZdrLP3PLkB1iAlRJusGkXYplqvg7silx25VlhLNPjhlYgZ2GNJ9WyVvPvHHV9ySblr9MBJCkXHzRw4tC9NyXr6adCwb8AWc5/vlCekLOL9j6e3oPok5OWlBtJsz1eHsP/d1gKW7Q8IrQw/glw9fRt65T497ysdNDTYxhFOJRgc3J/lm3mnHa1dB88O/Qt/nLe3roQW5bOjuA6TPrbDzQvRE7dw/g6qZVIOr7gKHjL28OxVKL8M4HKg5Gcl55ZHqfByMQj3nAqx/wASCXIDv3COQDX/ZSk78hl/YOsa79FlJm8sXaaODRH9tzs/wfCPxoVmI1Y7lJ/IiNji75sC46HOwVmqP9OYS6NTOF9DV8hUONz83hhcF/maVe3HA==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pvacmq9OoZ/sp62f0J2B8K/DczcKjUTHnBGGBupeS3C2sFXt3Y/GsilO7MOyHC/MQHXHGgD1Eea0nFT3a9Ai+SXpRIfz2LvnPySeB1DFedPNLdrf3mZMxiBstmF1avGSGkC9J68BtjNtCiXdWCZkHlF2sELOGDq6z7zuIPUYcap1y31OTsHxuwXf9+TWLqY3g9LM97X8mlB1/9ItY8CJ0UKbN1569PAjAxpJtia1xyRLJA894QEfWJg/PvJxKAKU85n/+CwuaVeQMA/Bzqzuxh66r6GzbPScWdR7ofsuEBNo4t50P827CIhWMXr6Lbql8++OVjfsthjkNLdvOCmWK6JFJLFlBhu2DUpAUibLK9SPAGGvsMWJHHOjL7Z+VKMlhYz6j6BFEificbo36YbnjIC5Gi1OOYOxERIew2E/CK6uW4QDJT1CB1Yi9zgy5iqN
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:36.3030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e195a297-32c3-4397-ff69-08de81c20064
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050540_916271_D54FFE8D 
X-CRM114-Status: UNSURE (   8.45  )
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

Add aliases for crypto accelerator and rtc0 ensuring that on-SoM RTC and
the SoC A72 domain crypto accelerator are assigned first index.

Further set model and compatible strings which are informative but
overridden by actual boards.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
index e1344942eaaee..3ad908d52a18b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
@@ -5,6 +5,16 @@
 // Copyright 2021 Rabeeh Khoury <rabeeh@solid-run.com>
 // Copyright 2023 Josua Mayer <josua@solid-run.com>
 
+/ {
+	model = "SolidRun LX2162A System on Module";
+	compatible = "solidrun,lx2162a-som", "fsl,lx2160a";
+
+	aliases {
+		crypto = &crypto;
+		rtc0 = &som_rtc;
+	};
+};
+
 &crypto {
 	status = "okay";
 };
@@ -77,7 +87,7 @@ variable_eeprom: eeprom@54 {
 &i2c5 {
 	status = "okay";
 
-	rtc@6f {
+	som_rtc: rtc@6f {
 		compatible = "microchip,mcp7940x";
 		reg = <0x6f>;
 	};

-- 
2.51.0


