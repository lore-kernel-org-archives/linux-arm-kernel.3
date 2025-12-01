Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF69FD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CCD1VvObMnq+O2yBhn0MH7XGXbmxdQVGh3Xz9iGxMQ=; b=Gu/Xziz8Wb+TwW27dMZqNtkT7k
	5xiwXk0pWnBfOEAvaHomDHc8Pb6yrpuFrZucs/z2PkjryVub/BqPfAaDLMBAUPsqzU5bDjwW3Zf3L
	Qs2Uz32Dg8ZFsOJKYzZoVewvHJE7zq5K3xxgEWLIaEn+CrdBUsg8hf2kPQe0DVZc2v7yEjdzJQy2l
	tV7c1MLIXy5VxcSsMDA9OW4oAgnrtEaHmFLTwrYhkr+kInB6ji8ULkJffu6hsrEgmnfhdz8hbfqua
	8MrZMaX6c5SFWiEvRbZHF3eWTThslS2Ftggl7eyW51twU5veV/AAHywmqiH1RIjnCc2nIza9kUSLl
	/f2dx7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Mw-00000003asM-2EWj;
	Mon, 01 Dec 2025 12:51:06 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Mt-00000003aoI-42Yd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDcPFzGfxju+dbiKMUhH7hvrJuTw9Y/htZlUF2rxF55GbhhUvC9rk30rs3O9zswvMZvCWMw1Zh6M30vYTQoMGWGpcwTOrmbpBa23BRimbumOHvomMmmfMvJieXUOwxFT9Z4Fy0SnkCrgiG/3Qk536IBMzM/SQhislgYoc9CG7EDe5tTkfqDmJWuhLmTu4nH3ND5nMFWNxhOT8Xogs3TaBZVRq8BXTK1j2xWvIWp2/yGzewXfrnnbuxSvz9rcsGTGk18ycHjdCdAoBCwCCRzBhd2LduT9PKfmablSGHph8fk83RXFuZXx/A52tqu+y69kgLDpJuN8yF739EtUTBmmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CCD1VvObMnq+O2yBhn0MH7XGXbmxdQVGh3Xz9iGxMQ=;
 b=S5CRoLBcKEU5SETEiIy7ePfe26thkUpxbOG/g3WKMDIyAvW2dXfgGr63KRACWvdOyz0mmqGxOGqEcCC8f3MijEPTd2P11QcGuXLL6YGRKVGaTMwSFodHMe+3tjROe38NTEShfTgKp06aGDnBpqi6OI4VRrOiY/xb5ok7KAppARov6LivLzHZj8s3vXQjraGDd6adcEDz+uz7dsf0cOYfi5pTsc11ZvtJ5IORsr2tQSYj0euVohpNScOYLpbkklb/RSPMlRieYzbH2QKphRyCRaydPesgKd2I09TMPWrEOKSVrrUrf3XJ+Ncz1rHa8V3/kpiqgCO6IMOtrqKgM9LEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CCD1VvObMnq+O2yBhn0MH7XGXbmxdQVGh3Xz9iGxMQ=;
 b=3JazVKTPa1em6Y80zjs/pfum0xTWtStHicQt0awTfxgHSXehIpYLJVI6ni5Qy0IyrzGQnBhqlv749P9ni/swMeBssLuLgt1FwQU1pvuGKwUgE1Bhd4lkNLXwJcm3+XYzFXFR6G3ejYzxCc2gsvGpxQUG25IalZ4mvLUZmP1g4chC49lPERvV7TiJWq78QunwB3Qb5oR6ORMtHSuaF+qZTIbBo/pGNJ8+zP6CzN2tDV3EsUKIPcbDlb/BDIjhjRvoX5GFCEAMh9BzQNr6bdmdLBNavOtgOysIbUlKaeuyPVim2FYdTgtV4aJXlZ6DFkRni3yN477gOfcs9M3q0mwPig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB10410.eurprd06.prod.outlook.com (2603:10a6:10:61d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:50:43 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:50:43 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 01 Dec 2025 12:50:28 +0000
Subject: [PATCH 3/4] rtc: zynqmp: rework set_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-zynqmp-rtc-updates-v1-3-33875c1e385b@vaisala.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593441; l=2487;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=+TsfrjZ9ly6KMwwyOJc68+nygxm6J76vRecaAk6N5X4=;
 b=kYnRCaLwa+dGY+mZyZuexlhjSe10hyfHlcR9dPSoQflh08cO7gB2i2Wgz/h9MY34li1OolW4r
 A8vj9MnOQ8cDGpp7OQv4YFQo2+uXkTl6YiI2vTdeyCTLwzDYXALK7tA
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GVX0EPF0001A050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::49f) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DU4PR06MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: 268b2643-7ebc-4461-0d52-08de30d83d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2Yzak0rSFY0NDRQL3Z6dkM1SEVpMExDWXNLa255dkhWVDZIeUhuTXpEMjFk?=
 =?utf-8?B?cFRzNW1IMXhUd2Q0RndidmVxU0xWMEo5enFlNC91WWtyY0JUbDk0RVpuZnNv?=
 =?utf-8?B?ZlZrblhlS2JFQkhRQzhTemhXbFpoa1ZDaERrNmM4N0paNE94SW1ITFdOc01l?=
 =?utf-8?B?b1JXbkFrb2kwSTVMZ0UxMFhEdXJuYk5NSG5aYjRFdkJiQTJoNVlGVS95bXRL?=
 =?utf-8?B?bUhsaUp3V21PdmtNdm9qUVdnMStMRjZtdXQwTjBDR1N2T1MreEcxQzR5cWp3?=
 =?utf-8?B?cDlaZDNGQVFXZXdqOEpCeVBmYURFcFdhTXNVMmdldURBa3l4cm51M1hWbkN2?=
 =?utf-8?B?c2FncHNzRzFHWDNESXhBSWtPK3lZMXZzcitIbmZvbGppNkQxem5Uam9QTUh1?=
 =?utf-8?B?am9PdW02WURsMldWUnI4L0ZpY0E0cW5DMDQ2QjdDMC9sSFNhVmtWamNjeUFz?=
 =?utf-8?B?T01yTCsxRWE2b3pveHYyTmNPY3ZVN1UwbUE3QXBvdGZnYlhBUW1HWTlvdG80?=
 =?utf-8?B?ZlVxQ092c3JaUU1tUXVMT1hXREY4UFpUbmxra0tzbTdsVU9XN2xLM1hrYU4r?=
 =?utf-8?B?UzNOb0xXMWZwRUxjTnRkZHROZTB3b0NWOG5oWWlLUSs5UVdoc2JmSElkblZv?=
 =?utf-8?B?cGJtRnk3TGpPR3FVRlRGNFBCbWk5dzRPNXBKYmFZYVFycmlvbWsvV0lpejgy?=
 =?utf-8?B?OVJveU5rdDhXRmw5ckRycVRhWjM5TERabDBsRGFFTTZ6NXpBZTMvUmJ4OCt3?=
 =?utf-8?B?c2pCRzhULzV1SEZQWjkrQ2hQY1BUS2psMVdFemZsZzUyVlkxL0c1WDFvNkM3?=
 =?utf-8?B?bXBGc1YxOURESVJzSE5kcUViMm51Nit4OHdhOUFVSVBxd0JHMmRKb3RPRWlQ?=
 =?utf-8?B?cXlFS1pCMUVnSkJTTjNqMEdYNGtCU0g1RStheGdGUWMvdUFYRjkyNnoxQWhK?=
 =?utf-8?B?dmRCOGVJY1llQjBXdEZuZFVEMEMzV05tNjltZktMb3V5RklxZW9OaW83N0E0?=
 =?utf-8?B?MkJVeUZzQ0l1eHU5QnZFYjZZMzVTd3RTQUZEbk9LQ0t4N2JrTElhc3M3UWh2?=
 =?utf-8?B?TFhOQ09hZmRBYUtiZFdpREcxandPOXVtaWtkWllueHRJc1d2TEp3TXprM3lF?=
 =?utf-8?B?R2UzOVllWGpMOTJYQ3hIdHlkWFNTVkJuSVFhOUsrUExQeGZzVmk4N2NqLzVY?=
 =?utf-8?B?dmVGaUk4SFJRUFljaVBlMUxiUDRkTG4vOVd5NE54Q0JqYVVrdG1oanduaDBt?=
 =?utf-8?B?ZFpnb2hGM0RzR1ljZmdqekFwOC9zOEJWYWRoMW1EU0NMZGZ4cGRhd2EyTE9z?=
 =?utf-8?B?UXJZejVubCtLMWQ2dUNqZ3lCczhQU2UxSHV5WjRRcElxaXhCMHJUdFVpdU1U?=
 =?utf-8?B?VlRxYkxHYmhRTHpOa1VISHNoTU1FTDVIb09aZmpLK0FydkljWnUwejdKdnE2?=
 =?utf-8?B?ckQvTEpJTUNZMnlDKzZzRGthK2NkZ01Ib2NaWmZYbVl6b1ZlY3kvWjNkZFJz?=
 =?utf-8?B?SGw0NTUxajE5M2VaL3NIYWZpODRma1dzbkpMUEpLRElpSkFTVFBwaXRLR2t0?=
 =?utf-8?B?MlJLekhNT3hTdG9MMy80ZXJwN2lrdWJxd2lsZVhpbVF6NXVFKy9yTENJb1FP?=
 =?utf-8?B?UEpZVE1ueUh3R3BQVUNIU054Wno1NW1FN2FiM1RVQUl5Y29qSjlGak1ZK1JY?=
 =?utf-8?B?SWs1N1VIaVJZUFd0eEhZdkNvMzhsV2lSUHpGVncrMlVkcVZ0emxjZkZIdE0w?=
 =?utf-8?B?dVZkeEhrWXB4VCtTdy9pdzNMdHR1bFBRdDI1RHFhY0hEbmx2RGxrdXNWRG8z?=
 =?utf-8?B?U1REc2EvcHk1UTh5b09UZ1laRUtZVkZ2b2lZcnVLQ3YyTWRkTU82eE5QUVd2?=
 =?utf-8?B?ZkxDWHVGQkJvUXVWNFJQTGw1SjBLUXBVWFBsS001cEhwT1NRQmt0VCtCOXU4?=
 =?utf-8?B?anFRV2QwaHl1V0JFQjZEU0RoZ1kvM0VmejNXRjhHYU5JUklWcllGU0tVMURY?=
 =?utf-8?B?UU9GSThwQkE4RkFPRlNLQTQ2eEdEVlEwMUpvdFZaS3MyQTVoZE1MaDdUU2sw?=
 =?utf-8?Q?ubhr5c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym0vL3Vyc0k1dWpWWDlhdzB0NDd1OUlVaW1DTjFlZ0Z4dE9TbWNhUWthMnQv?=
 =?utf-8?B?TG13M0JFQVFKQnNMNE5NNHdVTmlEUnh3R1g2UmtDc3c2ZUVnSHdGT0JOSThl?=
 =?utf-8?B?ZjNoa1VlWlRYMi90UXU3NVZ2ZkFPTHdrdS9KVjdsSlVFTkJOK0d5cGx0MC9v?=
 =?utf-8?B?dHVLY0dvUW9oaml3bVduQ01yOE16YVBxWmdQUmdodEQzODgxTlJpbEZTc2lL?=
 =?utf-8?B?SGE1MTdkdmxkVkNzNE9CUkZjVTYzdm0rMlNiQyt3WXRvNllMTE0vbTdtZUR6?=
 =?utf-8?B?YjZ3WVJldi95TWVMcGFTb1J2MytNU1dEazNvOEl4U25YYmphUHQzcWh0Z29L?=
 =?utf-8?B?VUppd0RRM05KWUI1Uk1oSTZjSDBmbkFEWlQrZHA5SzdJMGRTa2diZVBUZEJW?=
 =?utf-8?B?K25FeUdlZ1ZTc2YyNmJkSC8yU2twUWhacElhTkxmZnBRanM3MzJmWTBqUzBW?=
 =?utf-8?B?SGRtV2VlMGl0Mm5OOE1RWGpvZHVoMlQrdFdqSi9pdnNQbjljdzNVYlFQUndq?=
 =?utf-8?B?NWpSSjRvaWtsRTEyTjRjRTNFZGJYWnJiSlZIbU1vU1ZBZWdzVXNnYjA0ZnZX?=
 =?utf-8?B?d0t6SHAzTVBlNjV5ZlQ5K3phYkRQS3hGUGwyZngvcHNtVm1RanJXMldTZjJO?=
 =?utf-8?B?bk4zblV1S2Y2Z3hZS0cwVjBxQTEvNHlyR2drbXhobEdWbFkrcVRaTUxxbjlH?=
 =?utf-8?B?K2UxcVpJS0x2MUtrYjFtWi9nbGN4SlhKUjhTblo4V1lPdWhlWW4rQUk1MTdE?=
 =?utf-8?B?ekVZMms3VG94c3NkOWtKWHd1Z0ordnB6YjZyZkdQeEx1aDZGOWxZUVI4azdw?=
 =?utf-8?B?TC9iTlMvRW4vS1c3akh5YVdkLzlhdlYraEVWY2Jiem12MmdEcklXcWdtYVlP?=
 =?utf-8?B?dFdnTHpHTjMvaENtMmFVZnpBNnh3YmowSzJxbE9JOVRIdUhscmxMVVNJelFk?=
 =?utf-8?B?bXZUVkg5a3dPVnRRNVZ2cWE0TStWUVVxUERPVEpkT29qb21aNjhrKzBoV1Zi?=
 =?utf-8?B?aHdYREtqRkJIekkyUTUzRmJNTHJYMmNTZnVkN0hJMWhCMTVwNlVSYVIyZ244?=
 =?utf-8?B?NXFEc21DUXVQUktYRGcxb1M2ZW5pYmErbmlqK3NhR1ZuL1RmVk1abGMrM3B4?=
 =?utf-8?B?QlpyYVJ5WkVMc2E0YkZRN1hvTFhsMmhLYy9rMWpoUFdzb0l1TzVxOHNFNmcw?=
 =?utf-8?B?QSt2WXpxNG9vckhGajM3RmVheUtrSjByUzhaWVhJMGVMbHZvRFQ5WUpHd05G?=
 =?utf-8?B?ZDVwTHoyd1Q0U3g0QXJVeHdOM0NHeGhxSExHMFRNVlpYbVhqeWFBbG9BVXBt?=
 =?utf-8?B?VXQyRjA3aE13Q29xUVBOaFN3VG1YOWU4aEZ6dXIvMG9jVTh1VlhHRkM1RUNu?=
 =?utf-8?B?NEt1OVN0UXI1OWJCc2tXaXBGeFMxdlRiZ0JVcjFBS1Yzam9NNWVURXN5ZDBN?=
 =?utf-8?B?QjBUakxHeFdkVlNFU012R1F3U3ZGamFSNEkvYzJWRlZCd2wxdy9VNG5GdVZE?=
 =?utf-8?B?czRoYWxManZ1TU9pSVhZRU93ZVhQbTZiZFV3V0lFYXRIVDR4WUZYdUdKSUNO?=
 =?utf-8?B?ck1UVmg3cWY1dksrMUg1SCs0SmpXekFNTHVKS1VhT0pXbnFSenp2UHBucUFJ?=
 =?utf-8?B?b0tvN2MwcU5KWTZDeDRFTHdPTlhqZmFXelp4RkxKN1BDQVoyYjM2dnByeXl6?=
 =?utf-8?B?S1pYTHpHZXc5OHVuUy9FZTBIc1IwL0lMTEFHM3lKMFg1ekNjdXNyaHlGOVE1?=
 =?utf-8?B?c043Tkk3NDQvcy9KdCszYzl3akh1emMreXN2Z1Ziem9IUjNiVFZWWVVvaVpT?=
 =?utf-8?B?elBETWhvMXhVUWtrU1dvNE1Jalhuc2g2VUpFTlNVVzZnZVg0RW9QOGZyVGtC?=
 =?utf-8?B?b2EvaENqS1lrbDI3MGgzYzZYTHFuNWRjRXJMakxMYSsraUVSQXRlMVNaZGxp?=
 =?utf-8?B?dXkyUEdVQkNjekJYcHp1RzhsRXE2UTZ1allzYWVtV21Eb3dYcGZyc1g4ZHdI?=
 =?utf-8?B?aWZlR1VGcTczSTlpdFQrb3EvM0txQ3JhNGdTZW5aOXVBVmhkZGVuTWhHWmhj?=
 =?utf-8?B?cnZybDA3ZzhqNlQyTStBSFg2SnZ5aUdzc1FvV1QwSWhreXk3WS9vaU5PL3ZX?=
 =?utf-8?B?NmprckRIaWJTUmVvSDdEaE5Sb1E1OGFHb0Z4RWw3NkZxMUZxSXMrRmswQjkz?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268b2643-7ebc-4461-0d52-08de30d83d10
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:50:42.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJ5gpKe9BwPOIPbgiLf5hKafEKgMHlN7rOI4ywKf0jxNKE8etAb+/f9o6pP1QHQZtzGnLHnnubZskLDvXWyEtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_045104_021004_011E8FD0 
X-CRM114-Status: GOOD (  13.30  )
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

set_offset was using remainder of do_div as tick_mult which resulted in
wrong offset. Calibration value also assumed builtin calibration default.
Update fract_offset to correctly calculate the value for
negative offset and replace the for loop with division.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 7af5f6f99538f961a53ff56bfc656c907611b900..3bc8831ba2c4c4c701a49506b67ae6174f3ade3d 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -208,13 +208,13 @@ static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 static int xlnx_rtc_set_offset(struct device *dev, long offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
+	unsigned int calibval, tick_mult, fract_part;
 	unsigned char fract_tick = 0;
-	unsigned int calibval;
-	short int  max_tick;
-	int fract_offset;
+	int freq = xrtcdev->freq;
+	int max_tick, fract_offset;
 
+	/* ticks to reach RTC_PPB */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
 	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
 		return -ERANGE;
 
@@ -223,29 +223,22 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
+		/* round up here so we stay below a full tick */
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
 		if (fract_offset < 0) {
-			fract_offset = fract_offset + tick_mult;
+			fract_offset += (fract_part * RTC_FR_MAX_TICKS);
 			max_tick--;
 		}
-		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
-			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
-				if (fract_offset <=
-				    (fract_tick *
-				     (tick_mult / RTC_FR_MAX_TICKS)))
-					break;
-			}
-		}
+		fract_tick = fract_offset / fract_part;
 	}
 
 	/* Zynqmp RTC uses second and fractional tick
 	 * counters for compensation
 	 */
-	calibval = max_tick + RTC_CALIB_DEF;
+	calibval = max_tick + freq;
 
 	if (fract_tick)
-		calibval |= RTC_FR_EN;
-
-	calibval |= (fract_tick << RTC_FR_DATSHIFT);
+		calibval |= (RTC_FR_EN | (fract_tick << RTC_FR_DATSHIFT));
 
 	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
 

-- 
2.47.3


