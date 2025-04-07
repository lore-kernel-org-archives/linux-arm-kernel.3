Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38996C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IZAfUVaAOa7chBgO8REmAJsb14Zp8lXTUd7dS+omz0=; b=uW4E9dM+Z74Sl8799K+wVDW2+D
	AbeIDd8RrtNtr3tqjFeBbw9oxfQBT8VxHxaoD6xYFUWVC5UFilCmh3SxJIGF+s1kE/87SBgVdl5J/
	pcM/Eb+boSywA3s8a5qpHX7uJBQwCo/4qalSvv+ZATHzUB+ofXhnR2FkUVd8/jkDh+OPWe5Rv9eyd
	7ret8dM+KSZOmHadw6uUUVI0ZOwE6ifZEUyf5zX4ULJscPkuCF1SBJQqeMuNeFyMVbf1jsYdqO8kE
	Onx3bvLEHiDFQGpSKOooyoTnQL5+PorJokXeO6UcXZkzAaRrJMg23H6+KJpq4L31UnoF5ZO2ng/Ty
	rt0JWq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uK1-000000026Bc-02fC;
	Mon, 07 Apr 2025 21:48:01 +0000
Received: from mail-db8eur05on2060f.outbound.protection.outlook.com ([2a01:111:f403:2614::60f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sVi-00000001sUU-35DT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k91y7Nod0P5K8uWHTgCJfbPM0DlmqEHpMNEv2NeVtl1deFrZPPQUrh6mNNtYP+elNAxcvykeVmy50oxz+VTPEItI7B3oQK6cReRAJIQ/gQbeOHRsBhGTaT1uIWXCm2UBbAFOYxqNFa8KSNO5hHmD5LwNIKlD+VZpt1XqrCi37BK8ooHrtADmsEIjogWmf1NeJzINCbKsVbUlNhuEVNR2lR76ibZ922LmLrjnq/Kjw28aR7/d//FKoFxmTZn6ZzYsPYwtX5+zO3qdN0feV3ieuKFT5AheFZhCPCOfoxW0bYSf1FCtf12rAHxOyI5AhUfk3Druhs8yelftm5xzMjlJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IZAfUVaAOa7chBgO8REmAJsb14Zp8lXTUd7dS+omz0=;
 b=JRWe2Kggf9nxIu7yAK9oyMj+dr1XhfX0oWCFdvxEHXYUBCMty1spEnsSJm35UKWL/kVrjdE3ouSp3vKMOzaZ8g7AX2Cbb4ONuEt14qYPuVulBLsl/XrjYEPV/+XHidknmk8BmB68rnH3PTvNBDR2zanjHyypBceC1Qb9WtIboBOrr52+ck5vFHbXc7zCCwW/2SZLT98qY6PNgMTd7bUxC9ebbIx8N+aZucFTFUVitTUBW6vIHVciJKHs225v9i34L1Lw5LrPQcPsnHhE9XUMV35Fj2iOnBvJjTAeC2TTxe5zQn/oadGPIgsZlUv2z0GukblJ0m5COxDanDBQ2GF3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IZAfUVaAOa7chBgO8REmAJsb14Zp8lXTUd7dS+omz0=;
 b=VDNU7lWCNPP7oHaO05OgFRASCgE/1+LIjpElVBB9aElCrd94QcjidbLHX1KCvoJYojpxrEnVnMg6qxnuZMDskBHGWMiWzv8Ejg+PL2EnBXfPgW5UKZJeM4caDcRGKcs2SibmRxgIwlhQnpqRKX0GeTMEd56UcUvGxp1pOdiWFun1Anp9Zag81IL96ZFYX4OlwdzBTXIT8hMOHY8ifFdPqVC8WTmsTE9jwMLtIPnNc0nd1t1ScNNAYCzgk++dBV/bfLWWD+5zkE+rQU+Tb4/1iU8wfjYucP6u1SxqH3kksikgmS6zb5tcmMv4T8AfXpyGqbmOc/3uCjmSenkdt/69rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7452.eurprd04.prod.outlook.com (2603:10a6:102:80::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:51:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:51:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 07 Apr 2025 15:50:58 -0400
Subject: [PATCH v17 08/15] PCI: endpoint: pci-ep-msi: Add MSI address/data
 pair mutable check
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-ep-msi-v17-8-633ab45a31d0@nxp.com>
References: <20250407-ep-msi-v17-0-633ab45a31d0@nxp.com>
In-Reply-To: <20250407-ep-msi-v17-0-633ab45a31d0@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744055468; l=1143;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=N/Rcdz4WASrCVzB40i3dK6NDhujmvhnmUfU9wknM7Kw=;
 b=x1agWhk/JrxhYpfxdC044J20GwJzerSWTXt1mhoHZX1kbec7aSPHPZePWBh2+4dzuvyMeX47Q
 LEVluQQR1YsARtlTMO+Kjqa8Vi1gks7s/5nboX74KBMhiFsuKiQCzmw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 1879ff02-e958-4c4c-1440-08dd760da6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZwNUVXcUl0SldBR0dYYVR6QStXVm91ZDZ4RHNmWGZwSmErK2YyZzJUUkFk?=
 =?utf-8?B?UFQ0VFpyRDB6SFdtUU5DRzlGbXhyM3daL3hjNVlSL0pBb0pxTFM0Y3ZhclRB?=
 =?utf-8?B?M3VtR0hBM09LdUN5RTdqZjBsZ1lvQUMxVWpZdEd5TmtqVTRYcmt0djhER0RT?=
 =?utf-8?B?WlJIMGpteEdRSnlodEF1aGxBSUx4Z0NTdm92aHJibjg1Um9CS0VnUVdpSjIw?=
 =?utf-8?B?cmk5N3dMWEpSUUdZTlJ6ak02a3RvNURxZ3ZaTzBaUnVkamdwUWZXTURVQkVq?=
 =?utf-8?B?UVlndnNPKzhZM090Zkh4bzJEd2wyMklPNzlUQWF1dE92RFp6Q1NVdDRKY0Vk?=
 =?utf-8?B?OWxtL0dLNWs3cmhEU2hNUE9tUDc5TW5nOEIxcUphczhFdm9UcDdaNGl5ZzlP?=
 =?utf-8?B?V0tiTE05cDcyQjJpa3dZeHhsbzQwQXE0aTVlUlBGQlg3TmNtSXhSV0RVd2g4?=
 =?utf-8?B?Q2NLU0NLK1A2YmpxKzRic1pPdndWbkMzMmxja09QOVFRR3FMakJJVWdUSDZh?=
 =?utf-8?B?T21qSFVkM1cyaDR0QWxVenBBdkpiTGhuQUxOZkpkdTIzVHE5ZVc0VmpZbUZS?=
 =?utf-8?B?U2pUVUQ3WnFjZS9vZjlSdVBTT3FOd2UrYWRkMk5jUVAxVWQ0R2RGZ3F0aHN5?=
 =?utf-8?B?STdQVWtvbHRxWUFqNm0valRtSzE1OHlycU12bDZSMTB1MzhQM2VRb0huMzkz?=
 =?utf-8?B?R1dicmFmck04d3dqQjJPYVExZTB5UEJxZFNRS0VSa1p1dWZlMkhsM1Y4NWw2?=
 =?utf-8?B?OWtVNFpzSzB2bldVM2FweUNCc05LU09DRHBxWk1adkFIUVdoT01sdjdjdzFV?=
 =?utf-8?B?ODgyN1MzSVJHeVVnbFBRc3NJRExtaVRVNlg0djhQNTFNUnBCVzhhUnlIOFNr?=
 =?utf-8?B?QlloTk00bEtrbzlQRjc2cEN0Qm81bTlYZnptU1U1a2NETndpQXYvc0lpSVRy?=
 =?utf-8?B?TUxaZ1RlVUlzdVZRQm9lWW02Z3ZNamh0blZwWGx6bko5QWc0a3dLamJZZ1Vz?=
 =?utf-8?B?M0V3Q2F0L0lCZzE3Nzc1L1VrSUtoVkdxTFVpbmFVNTI4cUsraEZXMlp0cUZJ?=
 =?utf-8?B?d045SXRRSWRtWHFONU5oNTFhSVU2UGhDZjl2WFJBNkNDVDBZajhoNXdTQXdn?=
 =?utf-8?B?TlkwNWNFa2pTNmxvUDkrOW0zWTJkTlc5UWtvTjlsNm1oOXVjbGVtWFdDWmwv?=
 =?utf-8?B?RU5rQXBkV0dGaVZHOEI1NVhYUHZjZDFzaHV1SS91ZlROQVlxNFhmb0QybkpH?=
 =?utf-8?B?enZTMkR4VzRsbDM1dFQ2eTZ1YXFrclovMkIvaFArVHVtUDRoVVJ5NHBZWWhz?=
 =?utf-8?B?N0ZjcmtQdUg1Q0tQdlVxL1Z6UEEreEtGWWNBemI5ZTBmU0FJaU1jUmprNGls?=
 =?utf-8?B?WGZUSmVPQ0owbEU1M25LbzlhU0dlK0RLNGVZNlZZU2EwMGJnc3VtLzEwM1FB?=
 =?utf-8?B?TG52ZHdocGh2S1FDVXc3ZEpHQVJiUVUwRi9kMGY5NjZNWTMwaFR1SWMzNmFa?=
 =?utf-8?B?WU8wUVNzcHFkZTZtenAvaEIvMUV6ZTUxejBDcEgyMURETGJFMjRtTTFuZjVY?=
 =?utf-8?B?SFNGcU4ySDh1QUxWVFVMMjRpWDFvalRjdVhISnNyNk9xdmVBbnBKZ0N6Nkh2?=
 =?utf-8?B?VWJmMzVLMW9aZE1tRXhQa1doNVFxL0FpZGViaFJMdTlTanMvWmVMNkhUYlB3?=
 =?utf-8?B?WWd0VHBRTXczZkJVUGpubktHcm16QVVWQ1VyS24rbFR2ZjV6OWpTVTVrYWxh?=
 =?utf-8?B?bUhSeTJZQThjTXlkUC9IUWlpbitDK21aV3lqdENmOW0zSkxMNDAreGVrZmxz?=
 =?utf-8?B?Tm5JNkNrai9kN0JDcE9JT2xvVUJUcmxYWThsbFB5ODNWRTFrN3d6U3NFczE3?=
 =?utf-8?B?NU1FT25QcmoweXcreWF2aldmdnhmWkkyR3RHM2JPMHdqR0k0d3pBd3d3Q3Vo?=
 =?utf-8?B?RXZTZ3EzN3gvZTMyVVoxM3FRMXB2ZW55OEUvK25iNCtqYjgwWjU4M0QxRG9O?=
 =?utf-8?B?TldMa0lwaDh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJGWGFQM28rYU5UWHlrbjE0UnEzaXUvVTNMOGwwZ0ZFNDliZC95R1B0ZTRS?=
 =?utf-8?B?NFhWRitZMVpndWlqQlg2SjgvSGU2TUhmMGN5Q293MEV4STcvUXZpU2pLT3Zq?=
 =?utf-8?B?a0FmVzZtN1pCZGhSQXJBY1R2b3IwWVIvMURTWFdxdkVIMmdib3N6eFNEc3pq?=
 =?utf-8?B?T3pPSjlvQ1JMYmxOcW1UaE5wVDVvODBSb0hMVnAwb3AyRXRHMm1hcnFsNHJ1?=
 =?utf-8?B?eWhvSHpnSmNOVldGOE12c25PcFZzdzdDNEY0cUZRZnNHcTlyMURsbUxyTzFl?=
 =?utf-8?B?SFFSL1JOOGpLMWREMHMxVmR4ekdoQUZQRjFYM2RES1RSSStvWllGUXY3dGJs?=
 =?utf-8?B?RkdxZE91akc0NTd5WGk5UlJjU0wzRGtIYngzQkpOSkx3K0tSVWo4S3VXOVRV?=
 =?utf-8?B?b1hvWndCaWUxdE9xZndjNTh1UmlnamYyMnM4dG5aajUzU25pcWowNXNDamtL?=
 =?utf-8?B?anYxQ0V5cUwxUzdndVdLblYxaFpxaytwZFRiM0Z2VFJHam9oSitMR09wL3RU?=
 =?utf-8?B?L3FNWURvL095NVUzQ2gxN3dSdlRzQTNPZmltbk1VZmFmbFAwUTFhTWNieXBJ?=
 =?utf-8?B?NDlxdkhlQkpmTXhBOTFaZzdBZElIM0IyMWhUNWt5LzRjV2dna0J6YVJrOEpY?=
 =?utf-8?B?TlE5bWU4eEdlQmpmN1E1bkdldmRHTGc2WW5wVFVtL0p3MG1JZ21tQUdrS0Nw?=
 =?utf-8?B?N0E5cHFONmlSdjRYdmhNSStINWZ1YVVNaXNiZ2VNOFVNWEQ4TFdqaVZTNExU?=
 =?utf-8?B?M0NZVmN4RUJ4bVdhOWs0NGgzK2Y3NjAxcG9xNlJHcFgyMGJZMlQyWlFCcm9Y?=
 =?utf-8?B?UUdWcVdhWlhQdndScENaVlBIbTNCbUpDdUVmbzNvaE1CL2QyRHNyZEpiei80?=
 =?utf-8?B?S2lIVVFZdDNqZ0JiY2hKOFRWcTdCM0w4ME1iZzVWWkdMT1JBbnpQWHBqalZ3?=
 =?utf-8?B?a0NoMGlDaUdEOGNKWmVFTnJWZHZrNGRQeHE4RlJER1VaNXE5ejZMWFU5UkFO?=
 =?utf-8?B?M3lUeERpSERGaHZpWXROakQ5UzBsQ1N6alhmY2M1cGYvWnIrZnkxL0gyQWND?=
 =?utf-8?B?SGlGRkZ4VWcyVlVNQ0NJMjhGZWthS2J5Q0tlVzdXVDdpTFBuUFdLcnRFY0Yy?=
 =?utf-8?B?RXphWEJDRCt3OXRYOXpWOU5CSVhoZElGQkpqVkN5V3h3cGZNa0dob2IxZVBJ?=
 =?utf-8?B?OGFHOFVsVGxlV3Z6Q0NRNE9CeXJBem9SS0pHYzllWGYyV3Zsb3hnamROaDlG?=
 =?utf-8?B?SEl1cGk0RmhuanFVUDhHMTl1R2daOEVTSHBZMWpCL0E2cEhRay9hbHJXZmZv?=
 =?utf-8?B?RE1JTWltNVRsUzI0TnNqWEVhazk1dXFYemNYWXY5N0lDZ2JJL3pqUFN2RktY?=
 =?utf-8?B?VFVCeVMxVDFFV1ZiZFdqeXlwYTltUVFkVU9KYmMvaXhuRC9XOXdwWkxqaExZ?=
 =?utf-8?B?cGh1ZXRLMUNSZ2xoYm1wN2JHTWtaL1cwOUxqMHc0Q3p2YmhYQ1VGbk1SK0pk?=
 =?utf-8?B?TWVCTjZlVFdzYUxRWFFOY2FJL1A4Mk1hOWZhdTFZSFhFZmxFanpuOEFLZ0xs?=
 =?utf-8?B?YVZYMkw0VjZZbXdSUEliSXh2VGJPRnVEQXFDcmM2V1FtU3hKbjZIMDBFN2Vl?=
 =?utf-8?B?V3I5RTBIazFCWlYzc1MrUWRkTUx3dVdMYzBTZXIwNEFZSzJ4UEIvT2QrUmJG?=
 =?utf-8?B?bFNPSlhteWw3dlpON20rRkt3ZCs2a3NIZmZuV2NjOE13TUVuMGowcFc3Nzht?=
 =?utf-8?B?bStqNy83TkhnSytPdTg0UHdGajdVaTR0L29xQW1XVzNCSmJCVS9vQ2h3RmdO?=
 =?utf-8?B?QXZXSjA3akVlbUxwU3B1K1RKZkdzZXY1UW1EUGkrN1ZVWWlrNW1vcS9MK3lk?=
 =?utf-8?B?NFVGb2JqUVdIbS9scnQ5cjVvdEFuVkZTb1BMaTJEZFRvN1RLbk9WSVRBcC9Y?=
 =?utf-8?B?RklwRGJhblEzTEg2eVZuZzY0L1k0N0xZOVI0RVRrcFFDbGJtemQ1L3dVNTkx?=
 =?utf-8?B?VURXSlo3d1hWVGo0TjZNckRyUk5wWWhyajB1S0Z0QVhKK3N4MlJtQWJyM2cz?=
 =?utf-8?B?dVhVaEI2NEVnRXBuTUVKWWdBRFUzQ3cweVh2bk1pQXpKWml1d0t6dGJBWUlC?=
 =?utf-8?Q?oABulhCiKM580adUkBbM4B/H7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1879ff02-e958-4c4c-1440-08dd760da6be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:51:56.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysVHIsQPVUDB45c+Ickd5wMO0qAjWmq3kldshgf1qcPx+VwIp6kmOnaczQJvig3eWvJmpBY76KhMeDkDqzaRNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_125158_773095_773D703A 
X-CRM114-Status: GOOD (  11.24  )
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

Some MSI controller change address/data pair when irq_set_affinity().
Current PCI endpoint can't support this type MSI controller. So add flag
MSI_FLAG_MUTABLE in include/linux/msi.h and check it when allocate
doorbell.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v14 to v16
- none

change from  v13 to v14
- bring v10 back

Change from v9 to v10
- new patch
---
 drivers/pci/endpoint/pci-ep-msi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
index 549b55b864d0e..c0e2d806ee658 100644
--- a/drivers/pci/endpoint/pci-ep-msi.c
+++ b/drivers/pci/endpoint/pci-ep-msi.c
@@ -44,6 +44,14 @@ int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
 
 	dev_set_msi_domain(dev, dom);
 
+	if (!irq_domain_is_msi_parent(dom))
+		return -EINVAL;
+
+	if (!irq_domain_is_msi_immutable(dom)) {
+		dev_err(dev, "Can't support mutable address/data pair MSI controller\n");
+		return -EINVAL;
+	}
+
 	msg = kcalloc(num_db, sizeof(struct pci_epf_doorbell_msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;

-- 
2.34.1


