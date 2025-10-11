Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B19CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DHSuo10YdUhg4gGQkZmTi+t3wsA6hFztdvhq/MxO2wk=; b=MFv2wP1YWaL8bFEDmsJ7Ho1LpK
	6EOmDdAaIEEFzbEfvu+ZY8TY3G3NjIlpuSB8d6vn3iz5XNxx1q+UiggoFzrPve0vpSsZ9tuDP/KuO
	RGgCMxTEOKHRQf3/5J7Mj0IJ84CMYL98tf5ehmIgEMwUylKGWsXISCb3P/5dfORUsjQ02ClFGOv8s
	ZdnbtIa/zERhEQQnPxLW+iDw7SFzW8I47U/px7+Arkfp0LsiRTvu/s/jsaCPLv02TfVrswNqis9AV
	jB9TjBI0R72rU11XPYXcPLC+evfaQK0UufqXeGJ/dCXr9U5ffTEwPSSNfbE/O9R4hfDmAhdUAyU7I
	0+hAlbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Xrc-0000000A75J-2YrI;
	Sat, 11 Oct 2025 11:34:16 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7XrZ-0000000A74f-3yeh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 11:34:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eELqPg8p9N3QEiBeGl5QIwG/7NtM4vmlu3MkrgNiQmlyYlHOSSTICnCk+insKtibt1dOlmGLccEV58xaYqu3F7fGqKmIxtMGQLmoa5bDkR5YhNUPBRZyAqjiPkTq6jG/lTY3JNP4/LAFFqNu1w5baMhgfMODdKaLpCVJ/MNTvrn9aLsbMn0FwS69mWey/kSEjdn6FBm1PbRmIVWmKPZQJJg5srKpSPKxnyiu1LsbvneSOvsjrRtdsNaDWPpgdAvKTUbppqIBHLUho9j55sxglcbfvuqPFC2/qvrkwRWlIlWs3iPIZjwwAVc/wBfOGIhxjA6loNawnbUNHldtcxi+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHSuo10YdUhg4gGQkZmTi+t3wsA6hFztdvhq/MxO2wk=;
 b=wHHSjGYon7oDjJOipLTeilsewGLeY7sfhODvGvYCUtMRJx39ZH5cG1rqHFsKvTX6hUYz/j11+Jfu0y1ThswskxVhT0muUcQA1L8dQR/nYGdBdFrGLseDnG9m3XcfKY7rbk2TY0r4cHWXEC5/IiP8XOLkIHKgbMcLkQ/FFAJt3JcOWdF+qDS8+ZhNityznzm2IwMQy+eTT/EJzmMdBH20jBG8BE2cFfYzNohgYzp4w5RP8MYqjuHohxJXPzKporwVVzcaw0ntyNHStQVjpsN+zH1Fb6PJE8pHct2GTdeJgPX6cSmUw/hKTGCJa89PkImHdE33mp7xBPQ5XaMn3U/gZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHSuo10YdUhg4gGQkZmTi+t3wsA6hFztdvhq/MxO2wk=;
 b=ZdNLrfa/UWjvfddg9MEvWHury86gcdr/wodbWe5cYxODL4DoZsgQpKEkRJfZd5vdi9+qwJaP8U0ypMM2XL0//2bNCzxktdmUXCfO+S0A5BWcIv8V1vt5NU1ErUX/jBECYZUjxhWmqegOY4Dhb7wHCduBqvl1RBCQGr28QWGIxjNniyxVuBs1eUWjcgsnZ9P0lYAcVSMrW4pSr2VcSC7a0g1m7CmJP7f0hUstee1PIIhxuwXCcc8H1nl5wUW7xuPPrtNngow73mar6jDtDTiTa4vVkzbKZVMHTIfghgEpoPZszERbQqR8xYovcSz8bAGr0dKxM8Zm8nd06USjw00qbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9181.eurprd04.prod.outlook.com (2603:10a6:150:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sat, 11 Oct
 2025 11:34:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 11:34:03 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/2] firmware: arm_scmi/imx: Support dump syslog
Date: Sat, 11 Oct 2025 19:33:41 +0800
Message-Id: <20251011-sm-syslog-v2-1-v2-0-f43a3f6b32e4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVA6mgC/x3MPQqAMAxA4auUzAaaQBevIg5iYw34RwOilN7d4
 vgN7xUwySoGvSuQ5VbT82jgzsG8TkcS1NgM7DmQJ0Lb0V7bzoQ3I2Gg2ceJF6HooUVXlkWffzi
 MtX420sySYAAAAA==
X-Change-ID: 20251011-sm-syslog-v2-1-51c0da2fe1d0
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Frank Li <frank.li@nxp.com>, 
 arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760182435; l=1664;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=OIOtvx4vNVaSU3SPdqra7c7tHzTMAhXSwDWBgoN4KfM=;
 b=XNTI19RlNnqU3wOUfROmkicwhWbKbrBxiBL4QPI8EEoCz6tomoXdJtIBYzSCduREEFYSphhrd
 4V3PTFTYTlLDNXGuqygoUyW4sbRiFXEqMSVL97jVRw2BjnjGHchclne
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9181:EE_
X-MS-Office365-Filtering-Correlation-Id: 24976ccc-93bd-4c9e-91f4-08de08ba1440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em5LTW5xVmp2SWtLMWZCbXdVMVh2MjBocGZscTFDdHlrVzRhdStVSElvejgw?=
 =?utf-8?B?ZVAveGhBNmUxNjZ1akR0dlBsSlcxSlNqdzFVTy9ua1cxemtCcW81bmlBVWdP?=
 =?utf-8?B?RFFZeEI5cnVlcHhERXJjcVdielpNNXo2YTM2ODVyL0RiQVcra0FZTzNid3pG?=
 =?utf-8?B?Zkg2cUJFQi9NQS9TTkpTUzdSK3NsUURnT2JPWVF1OWJ4enhSYXE3ZjlQUUZu?=
 =?utf-8?B?bWZPWmc2QmFOeHppRzNBTjlzOGFGblMrTUtwZTJyWExXTzVxUEplZnBtVERu?=
 =?utf-8?B?Smw3Q25uejBpUklsT21Oc2w1TzBRSmhCWklvV1IzQU1CK243ek10Rmlhak1v?=
 =?utf-8?B?N2tWcDFZa3VLT3ZNSG5RU3dJRDlDZi91ZHlmQ0oxcURmSml3NW4zc2ZxSCtD?=
 =?utf-8?B?Z2liRnFHWGFBSXdKLzFzNEhUcGd2OGVPTlQ3WDBBU0xQKzZvZ2dJY2o0RHpO?=
 =?utf-8?B?OCtNTFRZOUozdUdRdVRMOTlUdmZONS92WS9LRGRlRFZGSC9pQUlDTnJ6ZE1D?=
 =?utf-8?B?amVOTlMzQ0toK2FiRUNTUnZuVFA0b3k3dklWZkhPYzFUUlo3MjFpZStVV0gv?=
 =?utf-8?B?NGNYa2JWVk1sT1lJZGs0ZUJyUHg1YzQ0WUlTZkpRamN1UU1GY2EzTnd1OGxI?=
 =?utf-8?B?T09Hbld1S0gxUStPMHB3UThHM0x4S2NWRFljb2UwV1pJK2FVN09MZFo0N05N?=
 =?utf-8?B?UjJWRUlreElzU3Fqc3lWb0JoS3lDKy9yKzMvdUR5a0dKS1ZBTFNYU2hTd25l?=
 =?utf-8?B?UDRBaVNrNWcvOXBBOTQ2bE5IalUrMk0zRXNqM0xFWjQwNFBRalE3NHJXUG84?=
 =?utf-8?B?ZzMyVEtrSzY4d0cvZzdIY0ExVHZqUGVBUjVOdXpzb2Ira00yS2ltMkRvSytY?=
 =?utf-8?B?enNnNXVVQXJSRDZlVjZMWHdnYWtzZWtnR1hsNmY3VnJQSWFTTm1WWU5sV1ps?=
 =?utf-8?B?eTJvZWRQQ2E1OURmL3NrZ2laUmxCNkcvd1Rzby9LZ1NXZDNkeWFoOG81UEFY?=
 =?utf-8?B?SlJ5dnhsYjUycW5pYlg4WVhWKzgzWGs3NjFaMkNvUFJqOXVRRHlSKzVvN0xq?=
 =?utf-8?B?UnFRU0h6YUc2SXV2SFlvNEFFTnJaME41TzV5cnZoVnhOcGQweXR3RU5DbDVn?=
 =?utf-8?B?a3g1NUxsczFCMmQwWWFLSUxRRmdmamh1d2lkQjE2dFRXSWFabk9yQ1VyUWta?=
 =?utf-8?B?YkRjQ3Y2TWNnWXFpOFoyQ0U5U3VKQlFDUjVEeUYrWnJFV0ROMWFONk1JV0FD?=
 =?utf-8?B?aXpFejRsWGRWNlRSVHIvSzJJZXUwY3NNdlhUTGYxSmFvSGpSendhMzZHc0x2?=
 =?utf-8?B?MGdtNGl1akRYdS90OWxHNlF6ejVBVkhWYnUwRXljeG9FV2xSVDViZDNDbHV1?=
 =?utf-8?B?VUNOQkFmcGhZTWV1RjVRMHozTGlIenRWc0ZyK1BBNzQxVGYxWUZlbjNzUzNC?=
 =?utf-8?B?bDJnU2s5OVlOaitIaWJFUXNsbnB6TkRSZTA4QTZjM0FjT0RGTjVJeHRLS3VU?=
 =?utf-8?B?MFdyck1qNEZGa2lPL0lwV1BDMW9sdWkwQkF3TVNHeTd4SVh1Nmx6VmVWMUUr?=
 =?utf-8?B?cUdONkJtQ2d5OXdyTnZXTnBNOXJFQVNNYzVXaUdOeGQyM1BRSUlhWEZSSFhH?=
 =?utf-8?B?UWZvSmR0WGxTcjBiWVU3NDRuMzFsa1BXNHcvMXQ4amJaRXN3bmZrY1lLaHBB?=
 =?utf-8?B?VnRqUFlRcld6aEo3KzBFTUJpL0U5OS9Udi96TjBwVUZ3YVFscjNUQndoRDIy?=
 =?utf-8?B?NzVmeXoySlNnTHRDVWlQcDlRVHY1NlR3cmNsaExWbnBDb1AzRmhwRmswY0w1?=
 =?utf-8?B?cUNLV0lzOVpUenc3NWFjSDdTWlU5WklyS3BpUlRtZ3MxcTZZd3NjdzRmeldL?=
 =?utf-8?B?UHQrVE9uaHA2eUFWUW43Vy9mNzg1NFJWNCtiZmpldkE5VkVIWFZsWFY1RjdN?=
 =?utf-8?B?bGJxTUZqcWJ1NnduQmZKejRnb0RLb2kyRktoaDFLWmx4TzVDVXFia0pwOEVR?=
 =?utf-8?B?NW5RLzBGb2FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlBrTDZGVHRBcGRma0pUV3E0S1h0bWpUdzhTQk1aTW5HVHdMZWZrdy9mZ2d4?=
 =?utf-8?B?VVY5SkwxcEJ1c0xWbHoxSU4vMTJNYndtSFJZamNCRVRqS0QxS3FjWWlZSTlW?=
 =?utf-8?B?cUNjMGFVcmlkYUhUOEgrYkZMZmx2ejNIV2t5eWJaS295aDBNeldFcjBsVlZO?=
 =?utf-8?B?bUdCN1FsamtqTnhERFVIc016ZmVVT0wvRWZSV3Q1RmhlZTBPTkN3TS96UW15?=
 =?utf-8?B?MDVzWlhJd3NOOHRaV2xNaUtsaUNJMkUxSU9UK0NTWWdtL1ltQ0lxSmg5alNt?=
 =?utf-8?B?SlhXN0ZiMWJpR1BFSVMzR1AxWTRvRnRGc25QTkVkbVZqL0JGaW1WSVBKc3pk?=
 =?utf-8?B?U3NYOHBYaFhUL0xrdkNnM25oRzR4cFM3dEM0MnZOVkJialZXLzI1Q1VFN01R?=
 =?utf-8?B?aWl1cXVWMjh2K0wvekVqS2pORXpKODgzNVBuNzdvVXlQZkU3aEpVVFRJeUQ5?=
 =?utf-8?B?dkNaRnUyQVl1YkRWZzJDOWZ2Umc3TEZ3d0NPVWJtT0hCZVJGTUZJbnFEL3ND?=
 =?utf-8?B?WDNqMFJaUXN3YWExMzhUSGFBUFNIaXQ0a2xRUEh3UFpNamlyNFdmdnhIOFpq?=
 =?utf-8?B?MGVndWw3M1hHRDVVOHV4c0lidnU2THhHTkNHbXRXcTYrNGoxc0lLQURlQkNP?=
 =?utf-8?B?SWc1cG84UGhTby90ZnNDTG5tQW51dHZjRkZuZ2lPZEpnd0hTczdQeHQxLzZ2?=
 =?utf-8?B?YlN2SXEwK2MrbjM3VWxPdndqWVNOeVczNDVxWWN2M2paRE5kQmVvT3dHWXEy?=
 =?utf-8?B?M29VSG5sTFZZNmFqQk43Y1g0bUtSR0Via0lpT3lQdER3R1h0T1dSdmQ3N09C?=
 =?utf-8?B?OVRjSHo4QkNNaXJvejlBSzBsSVM0RVdNaTQ3QllYTFJQaUExT1hnVXZWYjY1?=
 =?utf-8?B?WkRDTC92WGZvRkw3RmIyQXA0QXR1N040RU04OVVHUFBMOEpKdzZTRTZBbTd3?=
 =?utf-8?B?OU5sUmU4NVNsMUE3aXpzR0FrSUtLMTZQZ0pkTEIydFQ3aUNmUEJJOGJNbXYw?=
 =?utf-8?B?NG1tMlkzWkN4a3EwK3l5b3JaaUFqWkJOVndxMnZjTG5TeisyV25iNzZPUklj?=
 =?utf-8?B?NzNlUGo3SUs0MllKZjdLbW1Ld21BTEQ1S2ovUGpjbU5JQTRXaXV1YlJSOTJl?=
 =?utf-8?B?Sld3VUE0eXBYWXZBbnBLWmlYdUprWm1LQTZDNWY0SEMyTEFvMVhNMW0wOXA4?=
 =?utf-8?B?UFZyQjlwb0x5NGJoRi9TajlQU1Rwc2ljaE1wWUhMa1M2aUFaYUtqeEhkR1JM?=
 =?utf-8?B?T2ZHNktJQlBNa3B2OWdjcHJSUWtVclRTTVFqanloeENqYjlPZzBtWjQrVWFm?=
 =?utf-8?B?M2tvc2lYMXVnNjFjTHpJd0hkVUE0WEc4ZzExd0ZjZS8yMTNPOURnc3QrOWlD?=
 =?utf-8?B?TUlyNlhOY1dnOHpaYW5LeXFIVjJjUFVhT1hJbnFmUDdncUdyMXJOQm5veDBM?=
 =?utf-8?B?U2IybVYrbGlJSUdDS0p6M0EvV0VlMDZwN1NUMTBoVGxKN1JDWnVpV2ZHZDVM?=
 =?utf-8?B?OVprNTlaeWJGZTdqREhaSVBhUVNXMFZ3Q0tmckE2ZHBOOTQyTjBEWURRcFV5?=
 =?utf-8?B?cmZVM1RBelk1OERrSHMvRVFPY3pnV0xVaHZveG9lUlpUdmpZUkd5M01uT2lX?=
 =?utf-8?B?TFVOWS9GbXJxZE5vWEhBeHRYdnVnekJNcjJBdTNYTm9MdjJYaGwraC9SMGhF?=
 =?utf-8?B?aGlpNTlQYnZ2b1BlWW1mUzNBL2pxWHJkQnpLbmt1ZXlCUGowb09jWmxCc3JT?=
 =?utf-8?B?akJ5ZW13d0JKTi9BYWRSOW5tcEZ0d2RPNGFpY2k5RGdpYThmMFhPMXNJZ29u?=
 =?utf-8?B?bVVheXhabGRjdENSUElMMmxaT1hXOEpxOGlCc1ZRUXl6TCtYUHlZM3VXZzB0?=
 =?utf-8?B?UmtDWU9zZ2MyQ3R6QXh5eEZmYUR1Tm4rUVlqRVkvTGwrNm5GZ2d1MlUrQVU1?=
 =?utf-8?B?WmNXRlJrR3JpK1d1YUQ4eGpoMnJZS3pKT2NKVVdlSEVzeDA5RHNPT3ovYlFQ?=
 =?utf-8?B?WWw5L1MvUTduZ3JvRDRrb0pSQS9zZTdJQUZSSGt2Z0tiM0s3bTVwU3BnRGFs?=
 =?utf-8?B?OG1HVmVUT0Z6ajFvWU5HOHRqemVGZ3ZEN0lBNGxNMHIyZ0lqSVhxcE1JQktn?=
 =?utf-8?Q?HCfR08XVyKWweD5Cpq+/zv5vC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24976ccc-93bd-4c9e-91f4-08de08ba1440
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 11:34:03.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZM6Ej/PFZrkbTqCLVaDjofyFlmldQpH+ItxUczksq/SXl3+76vQdG+CjwHw/z6RT52PL6JmghFV5JpnkL1Fbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_043414_007428_4AA07150 
X-CRM114-Status: GOOD (  10.26  )
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

This is the patch 5 and 6 from patchset [1] with switching to using raw
dump, per check with Sudeep and NXP i.MX SM firmware owner

System Manager firmware provides API to dump system log information.
So add the interface for Linux to retrieve the information.

In patch 1, I drop the two structures compared to patch 5 in [1]:
struct scmi_imx_misc_sys_sleep_rec
struct scmi_imx_misc_syslog
No other changes in this patch.

In patch 2, I switched to use debugfs to do raw dump the syslog, compared
with patch 6 in [1].

[1] https://lore.kernel.org/arm-scmi/PAXPR04MB845937237E3C1AF5A2ABA8FA880CA@PAXPR04MB8459.eurprd04.prod.outlook.com/T/#m6ed303ac9c584c6e2ab39f89359f3131b
dfcc9e5

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Rebased to next-20251010
- Patch 2: Remove the IS_ERR check for debugfs_create_dir per Dan Carpenter
           Change 'return 0' to 'return devm_add_action_or_reset'
	   Drop the size check
	   Include 'linux/sizes.h' to avoid build break
- Link to v1: https://lore.kernel.org/r/20250910-sm-syslog-v1-0-5b36f8f21da6@nxp.com

---
Peng Fan (2):
      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
      firmware: imx: sm-misc: Dump syslog info

 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 83 ++++++++++++++++++++++
 drivers/firmware/imx/sm-misc.c                     | 38 +++++++++-
 include/linux/scmi_imx_protocol.h                  |  2 +
 3 files changed, 122 insertions(+), 1 deletion(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251011-sm-syslog-v2-1-51c0da2fe1d0

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


