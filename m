Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9794DCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L3ENmwia8OFs6OsDhpyNjE3IVbTnnsQkQTojBKEZdI=; b=uAkC7Ba3itr/F99Um2/ZYxTpVK
	jRvD/Xkx+fiOB/bGAo5UZ1LYaz2sS/xHkwakJ+y19819IYr8N4AcEl9pq/o5KcBuVOiKugathHbKn
	2KPas6wEKWVzvt3YeQ60jS8E4TqYO+2tsb2h7pC9l8oy0i5ZPGBEdM+ZbfxPqhqr0AG13UYC0Ye8u
	rfiO4Fm9HkajsspgMfFDmnh78zYbczHQezNtvhwwPl3oBEd4r6mB2LTu0+5eV1JjesLm+0+AFcdqQ
	lDXMjFiZNuwmIhxQP8XhiEqMKJVhtZWhlr8GKzKalD8smw0MYPKWx/z2cHxgrH7jriCBImZGueZNm
	E8Sh1ArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVoY-0000000Dkhw-27Ss;
	Tue, 02 Jun 2026 20:34:18 +0000
Received: from mail-francesouthazon11011011.outbound.protection.outlook.com ([40.107.130.11] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVoV-0000000DkhX-3xkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+t/UB3Wyh0BjxkWoEVP+7irfXlqeajz+92fRlycngWa4O5J3xLboRYPcjspA1Csj1S9BxJYSuYJaERFR9oEnOEsuO5vd3XGsbPETOLJmXHTM1XOvqwujNm1As7gY6f8AKAojLbz+ZXMepSR1N6kxxBuohcIPE7dRHllc+tPKtA+LseuoUUg3SzDHCn3rPWrfaEFfoORNkkur+zPYdsOi85oACN3HX1sI/RhlHm2B2Akspan3V9cdyLydm+S8GQi68YACpXwuR/ssYF8aC9je0auTGZ4l2E1Ca4l7bzTPGymFMMKx7tNtUsYloqOMPCVekAJ+Byp8zCWJPCtKA1umQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L3ENmwia8OFs6OsDhpyNjE3IVbTnnsQkQTojBKEZdI=;
 b=hiAfgininEj80lJDkkKgR1Ye8jDPAjrQcebufIs+Cj6b2lp41sbE1+Kfhejw9J5Dsxmjp8DvPR+dU9voCwwc73ZNoQhiihmT9bfcWJi/ten7TSIW2Jo6d8M8NJmevPKhxKVWusX2c4N6Zlr4cV+01S/UatfTzfnzOkqWx58dDiuckXL0rhtyW0/lYTaV5bIwhp3hrVKuQ6grfPwtjwQ//vC3O6B9AaLbOyQAkXsEV8mI1bUvA4w7qo9r1d+bO+3q/ezEiNu3UaMN1RddR9yDyRl9RoK8flGWc25g1x8hu33Ub8iL4XLFwIzx4ORadq2DQEuh7zvHfVPt3P3giSrFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L3ENmwia8OFs6OsDhpyNjE3IVbTnnsQkQTojBKEZdI=;
 b=AO2UFN+z/eYSnuqpoR8QnXnJ5AtKFlQ/AJ7+iKbGHHs1jBSi881mHQi2KsafdsLBnAnyr8dzsgFN9iJ0qLs+gQbZb+STOQuBo40pJnnU71mCwzfJZ441SyDtn/ZHAmttpevnhHwsOx9+MxsSb+QR8tnUSFVbBL7KVrW/FWW+rHeuWv18kaR0c7aHJwn36KlAcQ8/22f17nCQLbjzxSpfoxjciAHzsX6yDWI7xkpFnnkHH7D0/MOmVaepeHKBctxhus6AhzmUZlMKlrC3cb/zbh6T+1YAcqzdhc8k3VRzo8YuoNEzhw4y24LzHfOutja4Pu+G9rY+cj4Ss/80G3UF5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10716.eurprd04.prod.outlook.com (2603:10a6:800:270::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 20:34:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 20:34:11 +0000
From: Frank.Li@oss.nxp.com
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
Date: Tue,  2 Jun 2026 16:34:04 -0400
Message-ID: <178043243547.3896293.16230082324945471525.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
References: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7e4cdb-285a-48c0-2638-08dec0e64dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lvn7fAxa4sacL9ByYmU/GPhbasgTvcJLxHRaKuvI60u5XEmqLCRTqL72W7a+3WBblQMtc/xUR4YUZiJKCe8n+9HIOdRuC45nAQ/tVqWZytfaLkxFI818Mh+ubfUe37Ph4CnU64sQdMNwcRpfoOJYH/0egMWuO9Rt6XkRNx54iA1TZsb4gMzjVV41Muu94874tB2KBmMqDM9u5TDSg/XQ9wQnUIrEVl+o8T9LhUOiG0ysx+n9hWi41yV7j5cCrn2Ty2QAnJP8NP7mGHeYKdDMUo+pNVAv/yYE051QnDCFChu5shX26dmPxKvQL/gJ5eYlmcOkC/p50jiRmAC9niEhxVzuSrWlTELQFLfMpZcobj08yniWjYkpdNLnknf+Y3yvOUbDirL5eHWz9onNW7J2aeVxmFjP9AHyPpvQyI4O7aemfm/OKc1Uunsdhb4wwn/w6SK3rC5wrJKS5gYdNjQKdVAfHRSyEE5iPQi5y9/ujwNnjrMPQAwNwe1rSx4HqqtLEDf12gWYXxotep7ubpEn71/47JFtCMhk6EjXwlc+HEfVMpRDOtdUyz7+Vp42DcDPtIRtZg0zFjZSqC5pFYnnZ34t7prjiweC4/lrYp4qcLgbC2AL8OR/oz9PgAdLpbjuPD/229juLlf58sEFNw7yn+FHYQS9FTb9955+mIcBduJUIxq9r9skF27zNgdWZe/E
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzJ2NElnZUxJaWZTR0g2Q1hGQWxweGprY3hrdmxWOE5oVjdxTmMxSlMxQXl0?=
 =?utf-8?B?V2duR0J1K1NtcmJwNE5OTUYyWHRhMGJlQklhVnJFcFVmbGhnaTBIRGxxS1FI?=
 =?utf-8?B?UmpWYnlYSWYrWERPWkJEWm45YWhFUWFpWjYxTGYxNEFQRDlSaWY5QnJIVDA3?=
 =?utf-8?B?MEEwdk15U1NqUjA1RUdBMysvU0pMZG4zMC9JeXJHUjcrdklaeTNkdzlmOVVI?=
 =?utf-8?B?Z2RHZWJoaGRaVU5RUVVXeEE4c0prQXlJYXV2RC9mM3BuSTNxRGFoakNrcjkx?=
 =?utf-8?B?S1k1bUFhdWxTcTM1TXdrenhFZTZtckYvYklnMXNFYlNpUXRLdUFwemc0QzRw?=
 =?utf-8?B?c0ZLV0VjdW5QQit1VEczQklwQjlvTi9kZW13UytuVlpTdEtMTmtDQkJ6cG9q?=
 =?utf-8?B?d3RHSmtlb3oyZEV3U3A3WTB6WC8yY1VscEtNWFV4WnVQOUxRdFRGUTlkMkpL?=
 =?utf-8?B?bmM1UWlnMENwMHJEQi85VXhZVnJHRmlqZ0FtV3JJZjdzWmJ3NXNydE56SWhX?=
 =?utf-8?B?LzBZeDQ2c1BMK3JES2xrd0JxOTZ4TldrelJpN01OZHJ2VDhKU1pzSEcwUkFx?=
 =?utf-8?B?bUFycW5IbTFZS016VEVHckF0ZGdXTUhXbkVGc0RTYStJdlEwYWRNUS9GWG00?=
 =?utf-8?B?bWtPUkM4d3ZsVjlON3Bjc2RJcEw0SGcydWhpelBRajFFSzFIUFZheWR1ckdE?=
 =?utf-8?B?Mi9PSUlKRjRaeENwT0dzK1FXU09qN0hzdUdnc0MrdzFxeDlScjN3c0VWV2tQ?=
 =?utf-8?B?aVEyWm1RY3kyVVJQUUd2VTBEaVIyUTltWVVsc2tCcGNOQkI1d3MxVWwyLzZC?=
 =?utf-8?B?NWRQcnpvbTBUVmtIMWJoL0lZeFZTdis3NVBOclM0d2VzV0tqUlBBRXIxM1Br?=
 =?utf-8?B?RVFRbVIvcnZNNkI1REtxK1lSb3RhMHhuR0E1SjZWaWxJb1pTMitLWndCeGRK?=
 =?utf-8?B?cVhWMTBReUZZY0xoQWZpK0JRYkpHQ204WUdGNCtuMFhhY01UL2NiRURWYnFh?=
 =?utf-8?B?MmN6TEFnVUtVYlBEL0dXWXZKaEwzU2U5RjIwZVZreWFyaW1hVzJYazdkYmxS?=
 =?utf-8?B?MStIL2x3ZnJncUNuc2VxdlhQdjV6TVpzWFM5ZXpObjl5dFVDRW9kdzhzcUJP?=
 =?utf-8?B?UTV1THhCeExWTVdFN3R4Q2Z0K2FhNXR4RnNHTWoyazZ6OStpUUhMVmk4cFVl?=
 =?utf-8?B?RXVQWDY4aGxqTE95SkU1cW9TaTh2NVJLMnByOTQ4NmRPU0JHS0NPYTAzTCtz?=
 =?utf-8?B?S01HRE9ySmJMeklIRjNpdXhnY2dEVlJWUWJsdmpJMnVVcHJXZzEyNTVXSlRP?=
 =?utf-8?B?KzBSbjlBZjlJUmhwOGlLTnVEZVlLTGlQWTIveTJLSFF6S3RUU0tvdmFmb3dZ?=
 =?utf-8?B?aGpOV2Vzekc0QnBCaUo1Z2oxR3pHZ29oanpNcFc4UjQyOThXYjhJSDFrL3Rn?=
 =?utf-8?B?UnNIRkE2dWZnOEZiTng0ajNJdnMyNm5WdmQ5SVFNdEZ1V2owN3ZsZUcybVE0?=
 =?utf-8?B?eTBjUTJuc21WdkFyd2FtQm5wcDJ6ZjFkLytTbytLN2lCakFiY0JGQnp3Nk8y?=
 =?utf-8?B?K3dma2cwa1RJaXZBU3ErS0dwQUhJazlsSEZFaW5xZ2tvdmpLZzZCaUVieXlJ?=
 =?utf-8?B?cllPaHFidGpuSENobmhnbGsyY0s4bVhxbmZMQTZnK21PdlVDdi9mQkJOQ3pk?=
 =?utf-8?B?OFZVZmdLNDNNTTJNd2VmL25OZi8wY2E4QXRaVVZ5SU54ZzNUcGNaOTJGeW43?=
 =?utf-8?B?U09kdi9DRnhYMnBOdU5LaHcvb1lubWpQUTNYOHMrV2RacVpNdkhiTFMyWE1Y?=
 =?utf-8?B?R0RWalhwQjF2cUp5L3lING1wdnlYcWtic3F2bi9Oajl4YVlReXdYTzJtYmN5?=
 =?utf-8?B?V0ZPSUhCcS9STG9qUVYwUE9KdW5tZTNHUkVWVC9CanBWcDBXQ3loa05Kc1c2?=
 =?utf-8?B?TjE2bmNobmdybnliMlVKQUN1WngxOUFzMkpONi9lRmJiLzU0M1J3Z0djVUF3?=
 =?utf-8?B?dC9kQkdYUnVNWjJabVprOGVwaFZyMXJTUVR3bCtUTjZScHY0QlhmZ1cwdU41?=
 =?utf-8?B?STdBTE82NzZLdGdLRjJSTjZrSGYxVUE5WVErU1M2VVpaOVpPR3NBVkM1Lyts?=
 =?utf-8?B?RnRMRk5OVjV3c2lPQnNQUUhUekhwVkgrUC94a1BETHR1VGVJdVhZZmhIbUhL?=
 =?utf-8?B?a3Bta21iaWorNmxyVC83KzRGaEhXcE9KcmNQYXdFR3NXQndHdkJscy9vWEFO?=
 =?utf-8?B?ckQ3Y2FseXUxU28yUU5FTytTaDBTWUtPRFdJUWZpc3BXNG02bU1RM1pFcmlQ?=
 =?utf-8?B?aC8yUk16dVNZTkgxT2F6K3pkZFUraFRHZm02S2hNWlRuM0pIYms0OTNEKzFn?=
 =?utf-8?Q?xHTr+0/eRbz2/fsYBd3JBnIqjO4iQnTS/nPUD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7e4cdb-285a-48c0-2638-08dec0e64dae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 20:34:11.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YoZi2iYDu2lJ6kGFbnt6vVuvVUYWOuGdghh434HQPzQF/zcHWGWEN1AVgAeze3fr7L0Y7IobaAYzio9KgpB/6Awpw77+8Wt+QXSUxtjnt4g0QtK3b5+ybO0XDpwpsPp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133415_989542_D334976D 
X-CRM114-Status: UNSURE (   7.94  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 24 Feb 2026 16:25:23 +0100, Nora Schiffer wrote:
> All modern TQ-Systems boards follow the convention that mmc0 is the eMMC
> and mmc1 is the SD-card when both interfaces exist, reducing differences
> between boards for both documentation and U-Boot code (which uses the
> same Device Trees). Adjust the recently added MBLS1028A Device Tree
> accordingly.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
      commit: 5859223a5834eecfe671e897cb2fe27686a0c218

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

