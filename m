Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBECA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HFWbJWHwmFBg4kkFv5YA9ZiSIBfPI/b9YiAFZQnrdTg=; b=g09lLqifBJrrCxbmJ5fiQ3Tr1X
	IT2xcjHsDUVtEhkGvKlyLStH5VHq193wDeS2+jeqU6iHJCy5rVlcls4Vwm5OYDaVFe7obtd9BP+9t
	n8DU1SzjYq6YFDFiT5mtLaj1Xroe93XO9a0o6R2rTQvSdQ2ldFYNj9+Nfdsna/5k5ehT9zLv5dq7Y
	1CilsuOsWnbjmC8BI2J0my19gBQ6zPPR7RXS3nGedgwAveJNQ4oWIigyiYvzAXZmdOPvs5FuJGFeJ
	buAO/UVfJV51IEXxQu4vZjz8dgBoA+fc+GQBaqJ4hgO5eePqfVvLtOuMjE8pew+1LlG4XUOLNXhZI
	5hXq4mGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5aI-0000000H6Fu-2PBV;
	Thu, 21 Aug 2025 13:44:06 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up33c-0000000GghN-2sU6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1CAGLdq1aeje3bBRE3oCTP3buVq/1UkVNeIe1dMdctHx0iQ7EpOzW3Dr/XvlmE8hN3/HXDu3hdP2bnOIWTdAbsiL9b808KE2cFzhrJhszNJt295UrC3EI2vY6co1weI3sFDMXo2pSH8mJyhD2FIoCjaIaMBuIhl2r1hScDzDJ3UDSrqsAwQtzsD1eLK+67krGFrdtmmaVGc13NrjigdOIuGhwidT3T1kjvP2iUvHxFDAfftgFJqPxjeN/iNP14iQKDX8nn/Ew4XB+gMd+5HUoS1CgFpyF/PCPgWm2CdQnToO759uqOSdZLUOIuZzp/Jy5PqQhjcJ/HOH10gY6gE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFWbJWHwmFBg4kkFv5YA9ZiSIBfPI/b9YiAFZQnrdTg=;
 b=zC/Xyi1yOy+OTRtRv/EnkeMqccAXo7xuC4/xC6ltZK1IDxnlVtXYmZUFg3dFJll/rhuRp0zNtPB8OeNi9Yd/NHkCjhE0paQBruOPxhXlUxzF/JmSift+SMpLG5Khb56cElo21aMAC3+5d9OrjChGwCHg4kuxC0FBQ0tzEy/S4J30cRD4RzkBTVyJn/l36QX38AQUEKtxPa+im2BZARiSpKObGKxrtkJGRL3RY00dY0rkQh6m0osiw7GCCOL8Tty0fMOQztEL6M4Azb6jHhAK873tsf2jlh1pQbvPGJ+29ZwhhJ7S6tpNS2AbSLjxSckFLDa2e1TYH8UahS3uIuiYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFWbJWHwmFBg4kkFv5YA9ZiSIBfPI/b9YiAFZQnrdTg=;
 b=S9EJEZBR5BDHR/bV5ox++9VDSWaxdg/khBOAFJCotMDvL/McFQvG5di2vDTjUrMAJiqo9eYORcgMmnkulPPa4kPLAyGRMQju4vdtO0jMF/UJ6rQ06kH+DQZVaP+vMb1vNuSIr9hWQJQCWjJPs59rMG8Tbd2mcyqRbh5SGy9HEdrwSjdr6Z9jdnyb1lJAlRNt+85JPwdunFOIAGWaOtY2fzrC2qgQxYTU4+N0TQhOT+wjzQ5cagd/q6hxf+6riWgRaTFG1uJ6z0FKrrr97Ncfkd1KZC/c4YT6m7MdEVZ7hXQmlsfKPpL65eJk8uTuLGoBLPO0b3Rm39x1WPkyHwrjyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB11540.eurprd04.prod.outlook.com (2603:10a6:800:2c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 11:02:06 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 11:02:06 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2 0/5] add imx94 DDR Performance Monitor support
Date: Thu, 21 Aug 2025 19:01:48 +0800
Message-Id: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJz8pmgC/3XMQQ7CIBCF4as0s3YMkLa2rryH6ULK1M6CQkAJp
 uHuYvcu/5e8b4dIgSnCtdkhUOLIbquhTg3M62N7ErKpDUqoTgyyQ7Z5bNGYgN6+UbZm6VU7UN8
 R1I8PtHA+vPtUe+X4cuFz8En+1n9SkiiQjFZKk9DjeLlt2Z9nZ2EqpXwBJYVviqgAAAA=
X-Change-ID: 20250815-imx94-ddr-pmu-14df6248e65e
To: Frank Li <Frank.li@nxp.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, John Garry <john.g.garry@oracle.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755774118; l=1259;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=CGbPKL0Sx+xwjuWr4k4iXbtZZfl4/6L9kmWP1HBjMkk=;
 b=MTDJMBk40a8q6iKqyjKkpHvRXCNhtTQwm8KKQT/sh5cr1C/vi9d63ZGCposJ3MKTJBnmctBY+
 wRGsz4xJXNiAT2XDgGF/jroNjjoEQyUCKSJmJTzIIFB0eIZ3CBLs0Ua
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB11540:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e83d62c-2d07-40b8-9074-08dde0a22a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WS9UR0ZqUUtKQVU4L1dhYmlhN1dmNzBkaHozR2NvNWRUZVBSUy9tUllESUtJ?=
 =?utf-8?B?UFV2b2VZVjEwRHE2QmdPL3Q0VFd0MElRTU4zWGpkWFNkOG1XYWRqUDVPeGV0?=
 =?utf-8?B?ZXQzM2J5cjFadjV5eU5tem93Z0ppMUFxdzY2QUp6WVcvaUJrR1loYU1Xa0Zq?=
 =?utf-8?B?OFdhbHdmN1RBUjNkV09zbTNPczQrOHdheGxJTmVWaGU2MzVrRHpSd2QxQ3Ar?=
 =?utf-8?B?UDhwNGRndEE2dXVpQ2ltcUFQajZWNm13RVRUaFFGSlBVWUwyM1crYUo0T3Zk?=
 =?utf-8?B?NlZSOXQzL0lUN1htVFhzR0xMcjIyeGZvamMydWZvbmlsZGR5cmYzbUlWalhw?=
 =?utf-8?B?cENtUXc1SjhqeEtOTTdiSks5RjNjZmtzemlJbVZIazdZRHdVTUdoT2lKUlgy?=
 =?utf-8?B?UTdUdW0wSFdZUUNFNVZ2bVNGLzJuQ05aSUpZU3plRlhpekJUbmtmZG83V29Q?=
 =?utf-8?B?REVQTmh6VTRqbUxXWVFuRUVuVEFrV2tSOXJVYzVoUnhWdWVoOWptb0hrb25w?=
 =?utf-8?B?OHpuNDZQeWdYbXNqNDNZcVY3cWdpV3VFTytjUzFLUDNSRFpHK2tHTVdlQ3J2?=
 =?utf-8?B?U2RacGE5L2lVTkdLMW9DZ25VZEx5YkVPczJoT1hjaGVvbkZMeWw1ODlMSlVR?=
 =?utf-8?B?Z1JyRGdzSlBBR0FwdkZ6RFI2aUFWVFViRldncCtRakRIdVhSTDFpVnJvRjNl?=
 =?utf-8?B?QThESWtyMyt1bC8vY2RmVFprbXV5bGZsT1hzeWV2c1dxenhoeHY4WEd0Mi9X?=
 =?utf-8?B?N3laZm9jZXdXM0NNZG9Va1IzZWx0VHowL004UWpRb015UGR3Mmt1L3gzYUFE?=
 =?utf-8?B?SnJyWnM4SjlMQzhoUUdYZ0ZNS1RpOEZuMXJpemx1bm5tYTFBWmw5QnZXK09a?=
 =?utf-8?B?Y1RoMDRBV254VlZ0SVo3MzZNcWYwZ2xuTk1xWjlqS1NKTzZKS0lvODRVL0RP?=
 =?utf-8?B?L1NjaUZGY2NzWXkvTG5ybVd5TENncHhJRnA4c1hNSUZGNnZoYXJpQnczd09S?=
 =?utf-8?B?ZC85SXByNlhWNVB1c1UzeXhoNE55UEM2VjdZbUNRcktsbzE1VWFCRnRid2Fu?=
 =?utf-8?B?ZUJFMHJtREJEamVhTkdNdEFldDZJREovU1dEWjRLQjBCbWZJT3BGNG1rSWFT?=
 =?utf-8?B?T1NvTjZQTncxOVR6ZU5aUGtRdGdvN3RZLy9KOGYrMU81S2ZlMDV2ajNKWVAw?=
 =?utf-8?B?UEVMU21wRHB1R3hYZUpHQUdKVnQ1OUswKzAzZkFFOWowZXJEbTlaeUFZNG05?=
 =?utf-8?B?T1JrdDdnZEVzVFQrcXF2RGw2ZHJWU09lT2RWSDRLN2VLNTFHUm1QRlFKOGxv?=
 =?utf-8?B?VlRuWU9lQVdQa0tPRVhMbU56M3dEQ3piUnVyTXl0WDV6MGlaMUhjWWhPVXBt?=
 =?utf-8?B?c05PTGVDanE2KzJWMGo2dmVRc1MzUVRmRWR0R09URDBDQ1JPSXF2WlkxeGpn?=
 =?utf-8?B?K1oySGQ4aTJnd3I0cGFYbkUvOU5nL3lHdDAzTWNueHpUYzdNNG9OaVI3dVpX?=
 =?utf-8?B?RFVMaVZtdFFFUnRSS3M1WnhMS01BNGw2RU9zQUJZOThrWHE3cDRoYTNvYlpp?=
 =?utf-8?B?b0VBWjBSVEpDNWk3S1JCSWJIZ2lhVHdnZXJtSmpJU3pFMXorS01ORkhGWDZo?=
 =?utf-8?B?RkhhaC9ROUVGdVA1enZuUFdVMFAwZmI5VWt0M2tjRVBlMG1oMTNGRWRkbERO?=
 =?utf-8?B?ZDhGVThPTXF4T25jczU5TnFjTUczY2Q5SWRRdTdMVVZKeE9VZnpqdmViOWNz?=
 =?utf-8?B?eG9aUVQwQXB3dHV4bi9ueE90Z3kzOHlaY3RaNlJSbTlWSWo4M0VmM3hHV2wr?=
 =?utf-8?B?eWRLcEpxZWFXVFdJM1AxVmg0b2MvRU5wMXB4aHRyTWVmVlpxRk5UdUZkcXla?=
 =?utf-8?B?NW5manJGVU5TcjhwTWxoQW9ZMU1LN0pLV3RZMDR6L0hYZEV3UWYyWFBNb2JO?=
 =?utf-8?B?UFcza2s1ZnZwUXVtSVIvMzk2aWdOVUdJeVRHMXR0cHBKeXNiTnFRTEVHUHdY?=
 =?utf-8?Q?zP2ERJ+tr9VyaHlNHYFZTATNJr+Xxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW90S2RudHZxVlRQSG5VNy8vaVh2M1ZhTUpQdmJ1Z1paRjgzWi92YXZUOEEz?=
 =?utf-8?B?d0lLaWs0d2JhN2ZqOEpuSU5NSkxkZVRkcThHOEJrQTdBNzNuUkxyL1ppUUR4?=
 =?utf-8?B?TVBZUjduQ2NYT1diUlo4VkNNQVVvQjhSYkE4TUxGT01PODJJMlFZOGl5WmJG?=
 =?utf-8?B?YjFIbkdBY2RQNi94RkF1dHdPeS9nZFlWdEU5ekdndnM4Wit1K3J4cTI4ak56?=
 =?utf-8?B?ajhISmZ2YjV3RGxMdVF6QlBhTXNGb0FpeXNMb2RsZWRZSndCWEhWWVg4dzNX?=
 =?utf-8?B?V3gxM29DVXZYaHVPOUE3SVltV0NmWXo2NDZBMnE4ZWhEZE5SbXlYOFpHaHNK?=
 =?utf-8?B?WlJSbkwzUGNPUGExOVhNSGt0aXVHL2tWOVl0eEx3V3lvTk04UWkwclNzUERt?=
 =?utf-8?B?SUhEeWszOWgwMERldC9XZFFZbnlJODR3QXpwaFFZeElweTJKbDNxaVp2Y3FX?=
 =?utf-8?B?NG53L1gvR2lyakpVVXZvOSt6TzU5QkIvZkhwcm9pclZwa2g3VXhTeW10Q2FJ?=
 =?utf-8?B?UlhQWitGV0lITU1kbjRPdXZYTnVOTUh0NFZVR21qNVRPaTNOOTA3cldPeVNy?=
 =?utf-8?B?QjlLOWZiTUMyaFgrSmxzUEVSNjFla0dvZHU2VEV0aEs5Y3I0V2o2Q3FhbXky?=
 =?utf-8?B?MWhQRE43eTdoNUlWR2VpcFNUVVBRdGJjT3VUNUtoY085TnV2Rm52Y3VVOW9B?=
 =?utf-8?B?a1VKdVpiWll5ejgwWkp1VVlCQzhFSDR0SExCWDlWdElNRWdZaVluVEVJRmlJ?=
 =?utf-8?B?dEEzYkJXUVloNHZHLzVIYnQyNVhZQ2NGYS81YStIa2NmNEFOVUxucmQrdjJK?=
 =?utf-8?B?RnkzYVhOL01DcmVhdGxIcEl3cWtIZHZWa2JnV3dBOWo5STRBckJ2eGg2Mml4?=
 =?utf-8?B?bnJ4dVZGWjJLdkwyQkE4SUhUVnNnZ2tjUDgzblhaNW5FS1F2aVBPd1Uvb3R0?=
 =?utf-8?B?YkRPci9vR1ZDY1ExL0FTNG1HeHpQZTBWTkE3NElGUUY1ZW9DMVhqVFhBclUw?=
 =?utf-8?B?ckd5MHJkcEJEdW9US2hWQmFvcWR4L3lzc3gycitOenRTS3lOd2o4YnpPR0t5?=
 =?utf-8?B?R01zTGhvYU03bVRLcTdPem9CMTcvUmNPcnp2UUxWUVNRYnRNKytBY2NSbzBp?=
 =?utf-8?B?OGs2blU4ZTErampmV3hGYnNUeHJLNnRUdUpUZHhxYm95Q3pKbUtueEhvOWJN?=
 =?utf-8?B?NjZIbnhCNXdtUHBhN1ZLbFNKdDlabG90MTV2VXk5QWpGciswMU1URG5MT3l2?=
 =?utf-8?B?RURTVTlsK21ZcVdIcHRjQ3orMnhuVFJ4MGVSa2c2SHpPd2JiMkFEUVE3TmFu?=
 =?utf-8?B?VTF2a2UrR2RNOTQySXVwbEZLOUhVcVRJT1lacGtwZzNGQzAwTU9RZWtnV1Rp?=
 =?utf-8?B?SUFLZVZYMEh6MTE2eWZFbWplU21NUndJazBFMnZjTllFNmh4NXNsaVJQd25X?=
 =?utf-8?B?ZHYzY21KZWdFdGpJOW54YS9FN2lzQ0owK1kxMkdFM2EzaHY0MDIwMmJLSDZX?=
 =?utf-8?B?MjRicHQ3NFAwcTZEbWJUQ1FtZ0kzZWpjTllzZm52MnNXVjZHRzVnSXdtaGsz?=
 =?utf-8?B?MzJpOUN5dnh3VWpjNlVtWjF6NDJUb2NJMU5rQzNodnViVUE2YUF0eVpMSHk5?=
 =?utf-8?B?dU9MWUxkOERBU2d4UEViL0ZYeEkyZHFiTERNRWVjWnlTcjVUY2g2Q2ZPMFUx?=
 =?utf-8?B?SmxaSmZySjN4L0NlUkdzOUZtQ2NoNmRoYVNWNEc2bGlMbGVBWXdPWG5pMUVY?=
 =?utf-8?B?QWYxYTBUN29PSnV3M3Q4Q3o4bjZHNldBd1NyMk9IR20ySzNob0FDVkE2Q2dZ?=
 =?utf-8?B?Zjk1OVJUUmtrazk5N0ducHgwNmRSbW9NU1JYbSs3QTdObGRtand2MnJ0dTBY?=
 =?utf-8?B?Y2tFdG9PUThEZThqekRjdmc2Z2Rwa05wVzd2M05mbzZvTk9YTDlKaHR1Rk5x?=
 =?utf-8?B?VmJiTXVvcnpaaTFNeHhUUmorNE03dG8wejRJc2QvbTVRK3k2VWxIbGRid1Bn?=
 =?utf-8?B?b3o5WHY3S3h5b1laTTdST2t6VkRGTnVxVTh3amVMRnFVUUlhbUYwVWdZODcy?=
 =?utf-8?B?T0FqNC9KbTRZWExibFZVaDRiTXdTcWx0RTFRNXNyNEtXa25nVE5lZTQ3V0xr?=
 =?utf-8?Q?/11u18ObjisLTxmpA51rvbLUp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e83d62c-2d07-40b8-9074-08dde0a22a76
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 11:02:05.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OJ75bYzCl9OJDvugGzqGacYAhCQW/T4+IGkNgMCQK+QU7wGr5yFl9sGoU1Ob+Sh5MJU2rmNUtw5Y9bs/LjUNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_040212_744288_9BE1A641 
X-CRM114-Status: UNSURE (   9.65  )
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

The i.MX94 Soc has a DDR Performance Monitor Unit (PMU), this will
add support for it.

---
Changes in v2:
- add review and ack tag
- improve some subject and commit message, fix typo as suggested by Frank
- Link to v1: https://lore.kernel.org/r/20250815-imx94-ddr-pmu-v1-0-edb22be0b997@nxp.com

---
Xu Yang (5):
      dt-bindings: perf: fsl-imx-ddr: Add a compatible string fsl,imx94-ddr-pmu for i.MX94
      perf: imx_perf: add support for i.MX94 platform
      perf vendor events arm64:: Add i.MX94 DDR Performance Monitor metrics
      MAINTAINERS: include fsl_imx9_ddr_perf.c and some perf metric files
      arm64: dts: imx94: add DDR Perf Monitor node

 .../devicetree/bindings/perf/fsl-imx-ddr.yaml      |   1 +
 MAINTAINERS                                        |   3 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |   6 +
 drivers/perf/fsl_imx9_ddr_perf.c                   |   6 +
 .../arch/arm64/freescale/imx94/sys/ddrc.json       |   9 +
 .../arch/arm64/freescale/imx94/sys/metrics.json    | 450 +++++++++++++++++++++
 6 files changed, 475 insertions(+)
---
base-commit: 2a2b302fb15ebea4da71e3fe2943e61a1c83cde9
change-id: 20250815-imx94-ddr-pmu-14df6248e65e

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


