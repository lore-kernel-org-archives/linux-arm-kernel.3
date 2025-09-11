Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45320CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1t1MPpU4c0NThNtsOWMYS2juC+Nx+a+3da+ILeo3Sqw=; b=tOCrxueaUHh0+Tt6OQZDMcsDVW
	5CoJpRVlRhwdkf32hxxOcO0aRO7SkI8S2eSi5gYm38kYaTfVUQkUvjI4VNfkf7FSchGHnj9z/p/ge
	8uN7bkv7OfjRebgeIao6WLtpQ1pjB1Y7LOwXXx1j2v0wGcIWTjCj7trwFSkGn0JKstZRxx9ob52eH
	PIWTElo8RBJVkArtYOA7c0YA7cyR86zHZzcPHayJZjV75CUKBOL9ynPpMJQUkBwbXFSNlfGRkO1ea
	Zf7xKHofybIX12AaA+1oQJbqcsZ8Z/iKGUCQDP5nQzwSuZraZY8O6svEvX/3cnXRNhArKIkwU9uaH
	1ziQ/Mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfd9-00000002k11-07GO;
	Thu, 11 Sep 2025 11:38:23 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfd3-00000002jqj-0WNB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:38:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgoykvytH6nKQVlWJeMgqWrj+ryiXcqpr1TI8NfICsR9dtUbvhS6DxCQ/5qiUShTa5mInBPvAjAg41keI2iaFAMXYm1CW1J4seEjRqxPyuiyOAx36VcWi5SA3VSLWLm3xDd8DlxRspbzGEbDi4VJoDvBg6PcEMH19xgWdqKJ8YKHlCCKhP156h6dfmhwct00rKOY+F9/2F2AMWqrabxrYt2OY6loNOp2+hhcS5PVXfDbyHRa+1lzbfUrl0t+EAIAQHtMSFyy+LdVwrO1Zm7zbbcG37S74XNUTJkL/SrIk71Hdr9mY9ssx7bO10cTcJSLT+NqncQU6CpE1aimn4Ou/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1t1MPpU4c0NThNtsOWMYS2juC+Nx+a+3da+ILeo3Sqw=;
 b=N+1rdcayfoOzck9pDR7PlF0xZR7GjloirRD57kgQdHLuCvwDNx6pc+iODWxU1jLdsoOCW9RcBWSiE4vnoSl0ElPPV93H0vfaqkizMiacp/nFUObHT43l46lLHNpsUWBWG8UpGOr8apNcNjTQ+19UJPRU2RhYY6L1ZT3Ru5roZaOr2rPCX/oSL21EehYwNWhN6msgBNUK+71CmOVHxhL8eK1HgHx9Ca7/I9EnTdNa756E9/qkwcYMgNFtb5FzQAw9t6f18stKErTTwu5jR3+WWLUBxE2aDfEd3I7NfmyPxgY4TViia4p/m5PZIKjHQE548hf3kVZnls2xJFclv14AwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t1MPpU4c0NThNtsOWMYS2juC+Nx+a+3da+ILeo3Sqw=;
 b=V+faZBpbpUQerId4jCdWGg28pAezApOoLAAFX3nntIwVFS9vmYzKwyV1ChPONXCoUwWvv1Ef39P+Gn60C0jie1q+899m2dRI5GUyQ/sZOWUFg156BVLC8XyqNnFiT5RkjsRUiYK5t60LuX9UGM1VV31S+oY+DmOYakLxYpR+yMFt5khyXgXpdMt/6DLhvUinAcievH0jbv5Z+SDjPj4DUm4ZxQhWDXKH/kiJvGoU0khXd1NXxgMv+ipuqU12LJ3Is+9ZAto49813rGZS570+nLPAdt40LqVQe+PPDyWJc5DvfLJb3r8WpeCaPgO/tzBHeNVwJjFSlIRM86T5yZdVEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 11:38:09 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:38:08 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] arm64: dts: imx943-evk: Add display support using IT6263
Date: Thu, 11 Sep 2025 14:37:08 +0300
Message-Id: <20250911-dcif-upstreaming-v5-8-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0033.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::20) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccfee84-99b7-442f-4bcf-08ddf127ab31
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEpoWGhkaXA0eDJqS1dtb0ttNjJXQkNwQjhZYWFvSkpJVG9DQ2xBNVpaRDdV?=
 =?utf-8?B?dnpDVDdXT2pTSSt0TXdUcmtiOUJtSHh2RWd0bWVqRm95c1RmY0tycUc4MEx5?=
 =?utf-8?B?VExXSHRrVHVRS25KSDhCd2Q4dW94L0FpTEJ4TXg1QnRoak9obFhmek0zdW9O?=
 =?utf-8?B?dE4wVEtxdXF2TlNFVVhzY0JPY0xrWjRzbWMzbmhVeFhNWkF0ZjJHMFU3TFpF?=
 =?utf-8?B?MHJHa2c4bzdLRjZXazFZLzdhK2ZlZC9tdVF3QS9OQ3lVMnk2OGIrOWlkd2tS?=
 =?utf-8?B?dVI4Tmo2amE0ZXA5MWZLTGVRWEZ4Z3krV1paK1dNY1hvaVZtU3ZvaWlEQTFp?=
 =?utf-8?B?ZDVzUjVHNUxmbUFyazlFUWVwVHd4VXhXZ213S0ZxOFM3azBUY1FkeXBiUFlm?=
 =?utf-8?B?eU5ZL0pQTndGT0xTc05NM0s1dkdYZVBSbFp4SGg4Rmk3RVBzeDc5ei95dW5O?=
 =?utf-8?B?cmY4dWl6Vi90eTBTTy82dDNLeDZ1S0hzN1hEbFRaQUVISkYvcThvWS9rUVZR?=
 =?utf-8?B?djdlQ0VUVTdJUk16SC8waGxNT3lJd3hiR1ZlajNXRWxocHlYckZUR2hKejVz?=
 =?utf-8?B?RHlLR1NJQ0N2MlZJR0RCeEQvOXhmUWZVK2d1aDZlTkVqakdqMGluRFlPVmtM?=
 =?utf-8?B?Ynh1RGxjcmVDWTQwQzRpVlJBKzdqVitPZ3Q1dkgrT1pUU1NpNmFGNGQ3RFFE?=
 =?utf-8?B?SjhNMzB1Ny84RXlWZnFVbzRnWmE2Z2dSTmw1SUtFSElPYkY0TGJibEFyamRG?=
 =?utf-8?B?N2VWcnkvZTZORW9lTCtvZWVlRDBhVWNzek1vL0JyOEJQdHlkcm9hY0F0YlB0?=
 =?utf-8?B?b3BYeEE0Q09sNUdhZzlGc2pURnpLa0xJdFNxMG5ZTXpvUVRKNngvV1dxZDA3?=
 =?utf-8?B?b0oxSEZ6VHZZbHBWSSsxUjRUZU1GVjk4aXMyZk9tTEJ2MEJnVFhpa00rOEhS?=
 =?utf-8?B?V1k2ZTQzcjltV0R4bjZpZHNqdWEyMkxuVThQUW40d29lQm9pNkduWDhwOWNO?=
 =?utf-8?B?MUhlMTZ0VG9YcUZZN3NkeGE4QzQ4TW9CQ3g0ajVnLzJsR3VSc1d2Y1lxUXl6?=
 =?utf-8?B?S2dUNFVGemdXb3lTVTd2WUdQb01KUlpTb0tHMks3K2czRGkvdmc1RzROUFhG?=
 =?utf-8?B?SjBSOEEwSDlrMFpaWStvdnF3dFIrSlBEUks2cFNyRDVrZ3lxa2hydXlJbElp?=
 =?utf-8?B?azhhT3ZRVXJ6c0JXMGo0RDBwSmxOMzBuYVUvNzdxUFY2OTQ1SnpzdnVUMG4z?=
 =?utf-8?B?SWM1RUQ5QmZSZDhJZE5ZS1M1NFJCWEhsYTJHa2ZtL3FmcDgvOWc3WjFXVnhp?=
 =?utf-8?B?U01NeXlZK2VDMHJ5ZGttTW14ZERlWnNYOTRWaTNZWFJNTWZEN0JVdmJOUnhs?=
 =?utf-8?B?MUxWM3FxOWFMcDFheWdmZ2lOZEd4a2ZLbUVaWjdqdDd6d3RHQ1JNSlBhZ1hk?=
 =?utf-8?B?R0hyUjdyYjZWWTM2c0lRRTJXbzM0Ny95R1RQT0pxZU12VDBxN2hRQkFaN2Y4?=
 =?utf-8?B?WlJ0NDhxTjJ3NEQyWi9FSU85Y3FqYXZmcW8wMGxvKzBTRkptcWN2aklqVWRN?=
 =?utf-8?B?Q00yd3phM1k5Z2x6TzEzeEhWelZmakE3OE1nVjJucE1QNHd3NnZoNVdSMi85?=
 =?utf-8?B?U1FZZU9PMnhVZ1FZMXhnSTdIcDRGZStnUUMzNlZMUlQxdUtlbU1rcGpvdGRo?=
 =?utf-8?B?VTc5RjZBU3oyMlpGMkMvM2ZjOUQ1ZmdHQ1YvTThPbVp1ZklrWndoWmIzeU81?=
 =?utf-8?B?Ym5QU2phQTVQTnMweEhPWjgxYUpZWGZRaWxndUhvUGU5WncrTXhpeW94akZI?=
 =?utf-8?B?NXhtaDk4M2ptLytPdHBubjhzQkJOcXliYVlSLzVmRU9qNFAwWW82Y24zZjdZ?=
 =?utf-8?B?S1dmblQrNno2d0dURVBQWWhBU0xzdjNnYTIrVndoS1dRWmNIYU02RzQvTlND?=
 =?utf-8?Q?/jmvgnSXjkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVES2c4UTVkNGdtTGJIVGh2MWJsbEl3OWRhQmZDdmdwU0VPaUNERkdlTUNC?=
 =?utf-8?B?WllKZ280emlmMUN6aEpSVWx0MHpnSDYvbEIra3RObkNPbURMb1dRWTMzMklU?=
 =?utf-8?B?Yld5MWlsWHUzZWlPa2ZCdVIxVHZKY0o5ME9FQWlTcVFDU1BDbXNWL2pOcGJl?=
 =?utf-8?B?d29IWEVXdnpQbldTd3ZnVWUyQ3d6eGI3V2RaNVV6cjh5OVlibCtMcEZJNk8x?=
 =?utf-8?B?MFJUdEpCZzF5VWcrNUVWZlBJYnQrQkFRN2NUaGVtYTJ6VFVVS2wyd1Zzc1lI?=
 =?utf-8?B?VDY4VEt5NGRHM21YSUxPaURRclFIMUFUSzRpL3hORHlieEdxbDcyaGh2MHVt?=
 =?utf-8?B?Uk0velFHT3hmM3pWaUtHTTNaYkU1a3hmSUJ1SSs0ZDU0UjRkc2ttcTlFRDMr?=
 =?utf-8?B?Vk0wWGZZMEIzbnlSTzZUNGFDa3pJUFJicDRMUmlnYzhWdEhrM3plV3U2cElF?=
 =?utf-8?B?RDNQMHlqcFN1VkhnN1FiZVBTZ0hvVW9iVzdFVVJ3a3dvTXVpR0lMN1NYV3NC?=
 =?utf-8?B?TWs2NlB0UUpzZ0FjY3B4Y0g4SXk4RERsNWp6czVsZVQvS3F3VXd3NWhFZXVY?=
 =?utf-8?B?WTlpa1FvR2gxcVFrQXFlL3BGSERJamVld3R2dDVIaWZ0SnNZSTdaZktGRTh3?=
 =?utf-8?B?eG5qYlhJUDFOZ2xRZHRWMDNnMzlOWXpmbjhieEVWQm9XUTIrZDhxT0lWUzlP?=
 =?utf-8?B?U0hYeVBDZnBJRW40RDJZb0FLRmNRTC9XcDhQaXV4SWZRNFhGSWRwUUsydVM0?=
 =?utf-8?B?VTVmSDBqZnFDYnVJZUhZbUpFS1QzQ0tJNHBBWUtzVm5scU9qeTdJdzlNNlVV?=
 =?utf-8?B?TFJPMWV2Mk9BMllQOU5aa0FDa3FhNW8vZ1V2dmVSRFdQUktnSld0Y3NOcFZu?=
 =?utf-8?B?cHErb3VrQnRmVU5TOHRoczFySmRPU3Bvc012YmxSckpTRnpZRVNBVGJ6NkxP?=
 =?utf-8?B?OEpoOENqbUU5TGpodHljSnJWM2owUE9yN1dyNlN2Rzd4UlplVFJUc0JhYW1G?=
 =?utf-8?B?TUF3NExMOGM2MlgxS2R2SldxRnM4azUyQmJaYkdiZjF5aitQZEdCL3d5L0Zr?=
 =?utf-8?B?d3h1ajVhc0lPQ1VWcVY4dnFIZWlSQnRaSXRZcFdycndJT2E4WU9zcUN4TUgv?=
 =?utf-8?B?SE15dVh1MXRieThQcUFBUVFUTXlSVWFxL3ZsSkdZZVBKcDY5R2tGWUU5WFF0?=
 =?utf-8?B?VUwzK3JONHpOaURTTitnL0NwN3JNMnAvaytYTG5kTXJubDFNRm5kYVBzR0lY?=
 =?utf-8?B?Myt6VWU0YjlZWG5OTHBiNmxQRCtLYTkvbUU1bjBSb3BUY1lkbmlyTVJ1VDhY?=
 =?utf-8?B?NkdsTFN4SXZLUk9iMG40ME55WElwTFJQS284anhiK3NvY0o5TkgrTUNXZWw0?=
 =?utf-8?B?SjZLckJDdkVHZ2hDL0ZXazNBV2JONU9CY3lwclR5cGdtb0ZtYTkxb3hsWklF?=
 =?utf-8?B?cm01ZTl6clZBa3N0VEZrd3ZvRklSS2FuSDhhbklDTG1rOVdKSm5vQ3pYK01i?=
 =?utf-8?B?a3I0Qng0ZVYrZkU4bXNtbFZBSGpqZzBXaGZsV2FpUmhLb3Vldi9GUHJRcWNO?=
 =?utf-8?B?QjNBemVSU2tmVGVTRU9FY3NGSnI4MGg4UWdCZlZETkJHcklNSmhBVW9JcXhD?=
 =?utf-8?B?QjVaSlRDYW9EUUxpVE9maVJpWTFzK2NBVUdWZFVTakZSTG9YTjYyd2NVVUtX?=
 =?utf-8?B?RU9MM0pqOEwwNUJSdG5DTm15dVFZYkZyQnQzMS9yK0RmT0VmY3Q3QmQ0b2Rh?=
 =?utf-8?B?Y3lFK0ZtSmZ1cXRqcFd5bW4zWU9rS2hYazl2cjdwVnA1UnIvRGVVOThoVTJD?=
 =?utf-8?B?dDhHV01EYStQR3crUlhJeXorU0FLclRxTWZONVJIY1d2OFBXeFl4dllSTVF1?=
 =?utf-8?B?TzNtQVpMc0c5RVZGM0IyT1R0c2t2bkU2MVRueEZ0dlYzMkFYT3RSSGEzWlAx?=
 =?utf-8?B?N0d6R1lRSzI1RXQzcGw5K2grQ252eWgxVGYvME56NkJCSlBqMmMzdVBNOXMr?=
 =?utf-8?B?M1hrb1M2NytneFpTWmpIaEtnTlQ5VVE1Ry9rR1pweXREeDhCUW12WGJMbzNN?=
 =?utf-8?B?RFlHN1hyV0VIQ3ZQMElOZEgyYmN0SWhHRXMyRzNodVVRcW1icXVCa3h1aHlk?=
 =?utf-8?B?YWQzRDZYK1dHcGtrbjMyNGY0a2RuTTFsMTVqRmZKU2J2R25nejNYNExXS0Q2?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccfee84-99b7-442f-4bcf-08ddf127ab31
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:38:03.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gm4axSuzXsKl60u1PuZSEVUfYDLzGvHd6gHA1f+aVZkwSFyppSzoizYuf4h1klm9fwLS2oqWkZNmkwukn2N/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_043817_184044_D93D87C1 
X-CRM114-Status: GOOD (  11.27  )
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

The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
the default configuration for the EVK, add support for it here.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 121 +++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..5900ff355abc2afcb8334d9502c9ee6739ce36e3 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -34,6 +34,18 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -127,6 +139,115 @@ memory@80000000 {
 	};
 };
 
+&dcif {
+	status = "okay";
+};
+
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;

-- 
2.49.0

