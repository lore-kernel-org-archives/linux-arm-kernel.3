Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB68CFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3XJDX6qfgBAoycW3wQjEO4MbsbnoYA+2mPDwOZJoRI=; b=ZeV+9V+CAgz6Ej+W0mcJ4/AADn
	kfM0g8hU9G+9RNRXBZeBO0Ta6Y53BEG3iZ1a7NwbrFRAg6XVmSjSYRFwhzoZ7ByqwLTWM+ffnVhLn
	gHi9Qbw2iLuSPTvep/M01TcZvf6u32kGzfve3tuhx0ZEJVqbxBZUQQlIqMvYGeP+QsXlL1UBrr/91
	xWAkztfTGP4ILdsY5Z6CpNXSnhNYUCTEfdSBtM8NmHIyvwMuhhjfbWxIrJU+6G43gIzEEmWJ3AE1i
	Wn0KXPVmGXyczY65567XPEripFOyAZ2wTkyHBbBF5t+xTTjUoIpl2c/HYHLIbUaAaLwpFt5L89w7g
	jm3XmiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnsl-0000000Cvfk-1tME;
	Tue, 25 Nov 2025 07:54:41 +0000
Received: from mail-westeuropeazon11021080.outbound.protection.outlook.com ([52.101.70.80] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnsc-0000000Cve4-3lrG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 07:54:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acyd2Lxln6KKcpEsTHQdxtmumAYhiHsBfTrCWsMGrZ8JZh86z+JRLZBYjW4dYbb5rISi9JuASFxLwaGdQYCGZ6uiz27NcbIcQzmx/i7ybI36gffuZRnct4eanjeI0MPrAS9HPVPjyZQPstIdyE1HGV6Kxz2ruFo3oDj1V2thIOmluidljG7ScjnWafJsW53+Mpz6bLbxW8+pDSlNFL6jhoG7eGh6uPdqV39d74L9Dy1udAUPGU1hR/eS5gUsVZIW0apGZhn+11U6hUSMveWeEXxbygqF+W4iGWBLmDSJokuqioZXTXVpGGJc8z9ychPK9Mher7ihgTORxRt66cnzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3XJDX6qfgBAoycW3wQjEO4MbsbnoYA+2mPDwOZJoRI=;
 b=A+WE9IJ7X0Fv6QKT/oJFG6b8qSHzRUdYQR9ISFByymG10MTnGwh72yeXpromo7MOaedr96bzu1ExPs8lWPAqfAlgiMxxthJmWKYhyaQA278wvWAszjHnJ7hEaUgJJf7awA/oycEGytCfWSuCPAgQfxQHn8I08+1zKGoAI4C1uDtzBnvcZG3wP7Yjv5KSg2cK10g3fOXb3nTh+KyIT6t4YFP5EWx0qda7g+MCeDlqI2uB44zs9d+wwblx9MhoAP6zXRd+bPnLtk7XNXUCxhYI4wvpaTqp5v344k1uGXdezf9jbcriyhuKWP5+kN0mhOkpU3t7mAcX9OlDYH8c+Yyy1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3XJDX6qfgBAoycW3wQjEO4MbsbnoYA+2mPDwOZJoRI=;
 b=WpiS+nF+YBpQ2WSGIIVjOAwV42bm2B9lVCE8+pHXkRECVMwTSMry1tmzewV/vZXFT/Fm12ft14H6WYe3oXlikEcvJl/thEBj9HTLlp1YQtNk9ApUNXeBzIdj2nfRJaC+QKE/J+Lk593EL2Fj6I+aa/NysRU6nksqvzIUZoWnPgcqt/vZHKM95Unk/E/7qRVULlvc+36fNfI6MOW7peQe6Xhkj6AqxfXbZ12AQUYxdT31INBsYwHsQxYPpskTqUN9HF3aRr3HD4CvjlnlAUPRFt0JyEMgU34LzBLRF8j2fyt6oszgO8QJXtDPIEU8ea2B043bBAvNUO/DWan/UuRSNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAXPR06MB8288.eurprd06.prod.outlook.com (2603:10a6:102:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 07:54:23 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:54:23 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Tue, 25 Nov 2025 09:53:54 +0200
Subject: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
X-B4-Tracking: v=1; b=H4sIAJFgJWkC/x2MywqAIBAAfyX23EJaIvUr0aHHVnvITCV64L8nH
 Qdm5gVPjslDk73g6GTPu0kg8gzGtTcLIU+JQRZSCSEVJolcwOc2x2Zxt4EI+3rSWqh6kFUJqbS
 OZr7+a9vF+AFPci95ZQAAAA==
X-Change-ID: 20251125-revert-zynqmp-optee-a9d77159b243
To: Tomas Melin <tomas.melin@vaisala.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764057263; l=1397;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=mBcdbj7LFlhEdmXOt3QcwMpkj5oJiHoF5xx13Y8lnPs=;
 b=SuCuN5dwBzK/wdXJHN546WH5fOzZnDHUV4p5tzgms8mO85Pfjpv2kXDjkjgdmiGjvt/9jv1bh
 +GfmYC9QWl9C3azETGYZsfZbqBuoNApCB/ur3F4tjm8/UWGXfyiE2Cv
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GVZP280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::16) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAXPR06MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dce0957-9006-4976-184c-08de2bf7d979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGVRRDBNdUpnd05SVzFOYlBrQnAybUVTSi8zek9NRG9iM3hFZmxWSUVVRjJj?=
 =?utf-8?B?b0pZSXlsODl3RmcyZnpsblZvY2xWZHVHTEMrZFdoOW1wWVZwYmI1T1dBa0sx?=
 =?utf-8?B?NmxJNWt0VnoxVTdwd096YnlURGZDTURVamlXN1NGdXlZNnRTeXFvWFhqeHhI?=
 =?utf-8?B?MzJXQUZHTXdHUmp4aW9RM0xtck45VUQxMjFUWS9DTlF2cVdUTWVHYkxDTzZK?=
 =?utf-8?B?NTNQcWZ6b0FQejE4dE1rZnNzbWxtcDVKUWpqd0N1T1JCZTYvZ1AxTk1HV1Bk?=
 =?utf-8?B?ZU1FYTN1WWQ3V3Nac2hobjJBVmJLQXZRbTJWVjhsYWc4cVRFbWFzNWVucU5u?=
 =?utf-8?B?ODNINTZOQWtBeCtMTkZ4UStQcW1GbGVuVU4zQWJWc003VTNpWW8vekZvN3hV?=
 =?utf-8?B?cnF5NDJ1M25TbnlQdml1VWJqKytOemlZQ1FqbkxmYk0rTTkyZTdMcnVSZWRJ?=
 =?utf-8?B?eHFqTUUvRFM2dWVKd1ZJUE5NTWNQK1FVUGNkNndwQzd0T2lDeUh4bFcrbjVn?=
 =?utf-8?B?cFpEdjgvL281bzVtRUFRSDJicW9lVXVRdkhiellDckR3MkplTUdsZkZuMDF1?=
 =?utf-8?B?bkE2WjRnaXFrZkdQYU96cWUrRUw5S3BIdmVZay9CMkViY1BjaWUrWXc3c2FZ?=
 =?utf-8?B?L2RvMENjOHlrSHdic2JITGxNNmlyN0cwRjBCUER2NFg5SjRjSWd1aU42MVZI?=
 =?utf-8?B?RjJrZTBEZG1rV0h1YUkzaU12SXg5Vk1DK0hFT0ZmSFNleEhxRCtlL3NPRnhS?=
 =?utf-8?B?U2JtM21YNnc2U2pVSjRyK3k0Ui9hUWg0eW8rS043K3ZTNlJ0bjhLMWF5dHJY?=
 =?utf-8?B?U1cxWGdrU0FYUHpqSFNIcTBaWXY2Q2tRR1lra3FaR05qcHg4SS9QMlBhaUNL?=
 =?utf-8?B?L1dZTkl1Wlp3UzFNM2FFamFUeUZmczlxbmROTUZZOWZRbXkxcnFOdzV2VXl4?=
 =?utf-8?B?QnhHbHBNSDdhRWw4ajg3MWlWbWE0R1duN3RSV3REQ3Q0WUlHWjNWUmRLWU95?=
 =?utf-8?B?cjJJNGI5THl5dXg2M2Y4R1hwa1ova1JLeWJrRU1xM3FUd3R0K0crQzBiVmNv?=
 =?utf-8?B?OGxOQmNtZy81UVRza0RDTUU2dVFlWktock5jU1pVbWl2Z3RJR0l1bDBSb2tw?=
 =?utf-8?B?V2Z4NWZHK1B4cENkOEFpUG9aU2s1NXZIcjJJcUZOVW9QZ1l1SlBHc3hSUmw3?=
 =?utf-8?B?Z1hpWGtvazJqa3lnOUc5eXRnaVcvakIxMG9XVW5iQkhvUkg1d2VrV1V4blBw?=
 =?utf-8?B?amUwNlRRb2piZUhJQWxrYlRzVlpMMDc1WHliY0ovQk9WcUd5a2xWYjJJYzN1?=
 =?utf-8?B?c2h6UWk5WUZ4MkxDOHdwOTBjanF6TTZHNE9qNUtwUi9zalVBdWRZZkpEZFFr?=
 =?utf-8?B?SW1kUWdVQURkdUJsZnIyNmh0OWZYeUxIQjNtM2x1dkw1dFkvSTdFYTVsRk5F?=
 =?utf-8?B?S2NDa1hxVHJZYk9HMk5vNDdzdGduTHB2dnk1aUNIdk0xSlRCU0xadXdCUURT?=
 =?utf-8?B?KzMxZmZ4dDVwaVBiYmQwa1BmZlZDdnZjWFZaT09HT2FEa1Bkd1V4czVNNS9P?=
 =?utf-8?B?NDF4WnVSWnNhdWl0c1dQWWxzNU9QMXl1TVRBZ3VWY2JjMlhrT0xzb3lQbjJB?=
 =?utf-8?B?TXZvOWtoMC9Ja0JEK01lZ3k2OEpyNmZnc2VnK2h1cmNsdzdsYjVpYXFIVzkw?=
 =?utf-8?B?R0RVTlBWTjJDZzNiSVQxSk9IMUtPeVA1eWExNXE3QldYV0JaNTFVWU9sVlVI?=
 =?utf-8?B?byt5aGlyck84UnlhWEJKZDkrSHNkV1plUjdFNFExUkVFL3dGYmk0c3FwWHBp?=
 =?utf-8?B?UGo0ZXF3eHNLclU5aWJwUmFIMnJqK3BkQlV0NnBnUGNpUnA0ZGdQcFNIcjhY?=
 =?utf-8?B?ckVCeXN2b2pFOGZPVU1kaEJlWmFDbmxmSDNWSVJnYms1V1Z1eUR3SmdBeitr?=
 =?utf-8?B?QXpmMTZDK2V1cUc0QytvWUNMWmJaRVBmOC9ERFZBdjFMSFU2eWVIeVVMUk96?=
 =?utf-8?B?RTFkNUpmV1Q0blJUN0NZWmFEM2hibmhES1RFWG55UCtBYTluQVdOYjJ6YnYz?=
 =?utf-8?Q?jJkrXm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJiekRocTczUXdQZk5jTmFxMStpV3RhaEFwZktYeVlLZVlMcjV6ZXF3RmJM?=
 =?utf-8?B?TDZYcmdZcU5KMktYQjNwbkhwZ0Z4ekxNSEd6MXBsWC9HaEdNbzZ0QzNHdzRB?=
 =?utf-8?B?Uy80UHJna2RMMXlqbkNscnF6N3FuMFk4bml6MVlSL2NHT09GMUF4NzlKVHdX?=
 =?utf-8?B?eSt2eXZiTU13Ymc4ZXlGOUR3d1ZNS0JwU2NENWFzUkpvdncwb1p1Ykk5ZFgw?=
 =?utf-8?B?ckVoTmpFWGxCTVBpMDNJM09pYTNjZWcvcmJzcWlYUmJqVE9lRVpUMzI5dkp5?=
 =?utf-8?B?WHJBTXl2OWZwRHFNNU0xSXNIOEhJQXozbzhuNWVoOVdZVkt0VXFHVFFjUmVp?=
 =?utf-8?B?MDQvczZRclMwdW1Qdmx1WUw5VlBiUm5pa0F6M1RiMExtSDl1VDFOSzRxTVFF?=
 =?utf-8?B?TjloR0U2RS9QeDVLTVNWTmxlS1pzTE92czA3a1gyKytlQjgxeSt0SlFnYjlU?=
 =?utf-8?B?S2UyWDZOcUdVZmg3ZWxUYUdSMExJUGZDNjJxVHN6MW9MNllyY0huTmVhZGpF?=
 =?utf-8?B?eHR5dmxRU0xKenRtK2Vjd3llWFFpTy94c09vdGtoTlFOWTdQcWU5UzhacFYz?=
 =?utf-8?B?em8yY0VFTEZhV2dxWnZmWEdxTnZVZGFSOVNSMWFFMzQzb2Y1QzdWendVQURk?=
 =?utf-8?B?K0NBNkYwaFpXS2RXdEtveFIxc2hIelZPQVFEVGk3NURXeHBqdzNJVDcyYks5?=
 =?utf-8?B?LzJQb1ZFeUlLYU1pZHd1aXRzT3NpekRyTzI4TTRKLzNia1NwVzRDTG55UlQv?=
 =?utf-8?B?ay9CWm1tSkZubnVFZGFyaStLUXZnQ3JyTlJNMEo5SHVHUUZmTk43cUZmc2Zk?=
 =?utf-8?B?Z2x0M01Xb2c0eHVWQXZFN0tkek9UZTFBb3NWanZNSmlncUZZUG9EM2FTRTJ5?=
 =?utf-8?B?QkJIUU5sOTZVenIxQU05TXpnc1QvdWNCc3pGOURlYXp2NEpGZGc3UW42eFAy?=
 =?utf-8?B?WXM0ZjJTNGFjcXdpVGw5WGNHRUhpY0dkSTRKVGdKRnVmT212Rm5CRmtDUWpQ?=
 =?utf-8?B?ajdLcm9aTytCeGMrZE44MzU0YmxvVGh6S1RKYzcyaldiTFFIOXhUSmNabjMr?=
 =?utf-8?B?amJBUVA1MzFYV1o3cmNvbW1nRCtkb1ZYN0tKcXFvRkIvejlnZ01RUndKdkdB?=
 =?utf-8?B?aUVoTys0OFZLRjA3VnVvNVRXTHZOZk9YdG9CQWNrbS9wcmF5ckhTVWFpd0Ru?=
 =?utf-8?B?aklrSmxzdTNhT2JrRDZmdy8vQUNNeFFHK0poVlUwalYvU1lycE1SS0pXNGI5?=
 =?utf-8?B?ZU1wREg1a2I0L2xkVVlzeVM1aC9YTnhnUXRKZkNWeXRxNW9hUis3SVZNUUFj?=
 =?utf-8?B?Nk9KNnpsaVFQRWFIRUNyOGRhcVRjWDV6VEp4N0tYV2ZidWpMZkpNNlZsOXVv?=
 =?utf-8?B?VlNRZS81Tlk1bjB5MTdaZ09uOVU1YmR3OXZBVzcyUnVaekoyNmtVeXh4ek0w?=
 =?utf-8?B?UklVN250ek1qekFOMzdBVVdDNHRRU041OEtHbGRNU3NMejQ2dmMvMVlPRWdk?=
 =?utf-8?B?OXV2WDBmTG5zdXRkdnZyRUl0SHUrdEg3eGZCTEdiSEFFMDh5eWl6eksxZmpF?=
 =?utf-8?B?U2MrMFlDS0swMldEcThaWXI2akgreTVRajlWci9DQU82aDlEaHRVLys1MU14?=
 =?utf-8?B?WUg2Y2I5cWk2ZG16WG5pc1FiWkJrL0cvUDhQQVZ6QjZKZnQrRXY0cU9zOTRZ?=
 =?utf-8?B?NENONjc3c1FrdVlPM1d3TGZBZ2RoZ1JoN3o5bTVOeURUcEFrYXhNNDJ5RTA2?=
 =?utf-8?B?YUtZajdVMFlrclpzV1lIcWk0Ukpia1lpOGFwcmZsK21KZGZiYWV3R3JCME4v?=
 =?utf-8?B?N2JKaFdNenR4czhEWE5hSlRCeGtCT0IxQ3ZtcFIxc2JWL1pZUGdLQTRuM0pT?=
 =?utf-8?B?Y1NWS0w5QVRlS2szMlRtWnM0d1l4b28xUW9QZitmUmlYazUrVzJSQWxZc1lx?=
 =?utf-8?B?Yk9vclJ2SzloVmdOc3VML0xGQ2lqRmJkZFEyTWcwaEFxMjlIdmhWU2JuaFdZ?=
 =?utf-8?B?RGRGb3pEZDkyVTQ0VW1tUXhjNlVTK2NYNWhXREsxelR6S2hGQ3VhRHFmN0Nv?=
 =?utf-8?B?c21acWl2aVMrTHc0SFlKR3A5RW1KVFFycmVLTVl5VHlDWnNYVS9zQkc1Uldv?=
 =?utf-8?B?dWVpVHp2cVZMZkxsRXdtNmVMR05UNHVOOFdLTTh1SCtZN3J1akZMaU5TT2Jl?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dce0957-9006-4976-184c-08de2bf7d979
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:54:23.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykPGJnMU3XIC1lLCS2PFbZ5ObuWxKa8IjdDNDHTUHnyjV22uRRMrWHs9HXCovDsXAEgvayjM1JmbdVL56o2ABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_235432_905927_F2E59CE7 
X-CRM114-Status: UNSURE (   9.94  )
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

This reverts commit 06d22ed6b6635b17551f386b50bb5aaff9b75fbe.

OP-TEE logic in U-Boot automatically injects a reserved-memory
node along with optee firmware node to kernel device tree.
The injection logic is dependent on that there is no manually
defined optee node. Having the node in zynqmp.dtsi effectively
breaks OP-TEE's insertion of the reserved-memory node, causing
memory access violations during runtime.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
For further information about the U-Boot logic related
to this, see lib/optee/optee.c in U-Boot repository.
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 938b014ca9231d265314c0d6a934d0be706e420b..b55c6b2e8e0e10916fdfe762f9b6ae04f89a2cfc 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -192,11 +192,6 @@ psci {
 	};
 
 	firmware {
-		optee: optee  {
-			compatible = "linaro,optee-tz";
-			method = "smc";
-		};
-
 		zynqmp_firmware: zynqmp-firmware {
 			compatible = "xlnx,zynqmp-firmware";
 			#power-domain-cells = <1>;

---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251125-revert-zynqmp-optee-a9d77159b243

Best regards,
-- 
Tomas Melin <tomas.melin@vaisala.com>


