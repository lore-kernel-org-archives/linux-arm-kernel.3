Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C7D41157
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6xP0z7VSk2PX08NHCWjLNjWjyYja/TjFH9sLJ+xnhk=; b=Gc265HTcvSrmtEozzdvNrrN1i4
	ln3g7DRmvpKSh2nt4ms6IgsN6+GNeEaM9PEMeBqR7VpCDYvRUP+XTDLHRuHePlvi1nl2J2B4JQrwA
	nkJCaQfNdK4kZ554ERdWZYGAQqYYd2rDcAoARIwzZeF+vVCQOxnE5e4Ptat/vINF3YVIywklej54e
	6b7uMboVw56v78GSiXg0zfTFCefEE2SvQNn9AYSBMdlqpvarUzgJo7D0qoXUt4CnJI5UL7HSNnN6d
	xSn2sHtZh5n3PRyg5rl2S7Fy8Ksh8P7pWba1ldh9tmdJh9l35F2Epq8OG6PjfyF6eoOaNGg4d1CgG
	XzsYJ3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKBv-0000000C7Rl-3mZr;
	Thu, 15 Jan 2026 10:02:59 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKBt-0000000C7QZ-0XsS;
	Thu, 15 Jan 2026 10:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HK95v0b7ShulxvlXtZWTSMCgs098mAD/JjTBTRhx32xKw6Chp1MUZF55UZJSjlbIUOsLl81QZNM7XCiDArSK76v4mmnB4TAJ7JyHj1S8X5HUWX6HWPi+yQPU6XAm10RIQU/Jfl1b2BmdEYz++TPExYdXcL0EFr92fRWempzBVzh6+5iKMK4RetjLbRoUBEmoBcmEZ6iYZ8jBoxQimlWyb28S4APULgNkNXuoaXSK9VZUt3Wts9HryAdgevjkHnN189Itf5e9YnGOEXe/WzyrVGgsjO5Oi5D0pHcvZWueexUDo8l4ZTvob2i71pI98FXwr7d4+DqjQUNtWyX1mezq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6xP0z7VSk2PX08NHCWjLNjWjyYja/TjFH9sLJ+xnhk=;
 b=s6i6qPAhWM38G9dqM+tMeioLdhZVMe2zQCWYN8mkt4Lab6rNRVqOZJxP0qUKmtet93gcqigLfq2lKvlDFWSh6v1CmnwFrYNLptwbue0dzb3s4IhxaXAV3BkHcJ/N3SqmF1YhnODWt+d817U0uslkiDU8cfQX0BKZqtqZBbpzqW7vPI0XeKt4IlQ5qhg58e/fKYcuVITbBSEZ0VT9rl6S7+DG+kYgwdZ0aR5FjpNWmbDBFbRaz6j6nQjbXjU0XGuYGodCHEyHAFuENP9rMJGUvg8ZbWW1SQS/Tw8ZT5cjiftq8f9zFT0WsclTSPchWRQ7rfO0wDEtFylnv5mpqZ2GjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6xP0z7VSk2PX08NHCWjLNjWjyYja/TjFH9sLJ+xnhk=;
 b=L1Q6/WSIkQ4toJS60DOdjsg3s3QeMxaMmeyv7pRGgYpxTEMBCH0XqPPENLZ5+Tkg0nC6bqZKWTg6klcr32/xk59OuqtFkRnwKFb4e92VTOpjzXSVgdhf4wkCO+Quf4Ozno00/9wep/yAWFVxVE/r0zro1d/HVtLneM0yl6M35nQwGzdPaKEnbC4jWJGzpfV+aOHkEFXMb59KjK4FjVc65ZXDDq4T61OPRkCmxj0zqVXbnaf2oh2etKYPng5MQHnHkJhrcZyX+i8OXTyt14rvhOLOfBgcOqCNF9qcjh268817PvhuywvOZ3O8CqHJN5qdbuPAgRksjLdFxW8+Rx4YYA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYPPR06MB7970.apcprd06.prod.outlook.com (2603:1096:405:2b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:02:46 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 10:02:45 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] phy: add AST2700 usb3.2 phy driver
Thread-Topic: [PATCH 2/3] phy: add AST2700 usb3.2 phy driver
Thread-Index: AQHchSVBd3VHfGuCIEmizn/UMqD4DrVS/zMAgAACMhA=
Date: Thu, 15 Jan 2026 10:02:45 +0000
Message-ID: <TY2PPF5CB9A1BE61EBCDC6C874A89ED6EC5F28CA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260114-upstream_usb3phy-v1-0-2e59590be2d7@aspeedtech.com>
 <20260114-upstream_usb3phy-v1-2-2e59590be2d7@aspeedtech.com>
 <20260115-jaguarundi-of-optimal-fruition-09d32e@quoll>
In-Reply-To: <20260115-jaguarundi-of-optimal-fruition-09d32e@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYPPR06MB7970:EE_
x-ms-office365-filtering-correlation-id: 39465c4f-28da-4079-5218-08de541d3b36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N3h6TmloRzVJejdDMGdJQTZSSXY3WXV5SG9XUlhGS3FnRnpaQUFWaFV1bytv?=
 =?utf-8?B?S3lqa3cvbFp6bllxNUhEM2pIWkYwVFZmUzIyeHRyR2poeUFYcEwyeUZWUG9h?=
 =?utf-8?B?ZFM3RFM4WVBjQkNUaVJGajJpMzlXQXRLWWNvK1BXQ2ljRkt4cjVVNk5ZTkdL?=
 =?utf-8?B?SFJjTVFwT0d1QmpaR3hlMGVSZEswS290MEdxRXJqUjdYYUkrdE5zWFVXZjVm?=
 =?utf-8?B?TGJxVElJUlNyTkxVcm1yL0xkTjhjUytqSndDUjBFcnlpaE9jOERTRkhVdkpB?=
 =?utf-8?B?aDlSSGZIUjNodVNoTHdYS2xXaTd1OWNwS2l1U3hjRGh6RCtVUU1qYVRDdGFW?=
 =?utf-8?B?SzRvRnNJUWY0TGl6c1JLZkZ3aHd6dkJsYlMvUFhuUXQzbWp1NHJkYUZxaHAv?=
 =?utf-8?B?RzRIVHNNdFh4Sko1V2Q2RGt4R2ZhMEdDVXhucmRpbjIvNG1YbXRONFdGWUR1?=
 =?utf-8?B?ZE5DMitOSXhVanAzS1VTNjZkWjR3Y1dWSXN1VHBzN1UyeFl4d1ErVWNQVmZ5?=
 =?utf-8?B?NzhSK1JHOTAzY3FGanZqbXJUdGwzdVBzN1RuR1VJVWVRM3dMaDlKVDlIQm5a?=
 =?utf-8?B?RHEwTVJ3dys3UWtvS2JIb2RJbFQzZU1XaFE2ZytMc0dFUUVlTnE0OG9tNG5I?=
 =?utf-8?B?R3h2MUhxWGxrcUV1Sk03dTQ0a0c5dDQrL1dyMzYrVzdqUnFMSlFrYlhKVWdE?=
 =?utf-8?B?QVo3OTNiYkYyUVg1aWxwM1ZLTXdETHN6NFBhcXkwVnhOdUNTTHpkVFdTQ3Mw?=
 =?utf-8?B?TjE3dzBpRXh1QmhLeGVSZVIyd29oNEQzaHlucnZwY3ZOOTRac1Y3SndQc3hR?=
 =?utf-8?B?U2R2OUowYlYvQmRSWnpqZTQ4NjI5aC81S0JGZDNjT3FtbEZXWmVvVHRDdHl0?=
 =?utf-8?B?cy9xeXo0TS90SC9WSDhLbEdEVE5LVmVVRzZ5a1JvRTBjRmdVOG81VVBQV3M0?=
 =?utf-8?B?ekhRWFVOR2x4SzV4cTdUYUJmaUNTR3JmZkpEUEk5NkZKRHdCcFJkb0JKNFRu?=
 =?utf-8?B?YlE5RU5RY3NYbnBRN2t1b1dnd215MFl4MjlHTHozdURYMVc0STBwc0s0S2VY?=
 =?utf-8?B?NVNrUFR1WE1qTnlHM3JuRWt3eHB1Y2VPRGpBcWpDRVlnR3c3UDVjdFY3OSs1?=
 =?utf-8?B?UEo0cFZFNk5SZmpsSllrWW1RUE1qL00xOWQyUzRSYUoxcnpqUnJwNTVScWRJ?=
 =?utf-8?B?dDg2ckJibHVDRUFzd3hMQ0pMTndYNEQrOFkwTHpNckdqZDFjZDdPLzRIY0tU?=
 =?utf-8?B?UzBFZU5tUmo0RnAwcmZ0UG9ROGlTRG83dm11UzJrbGpTM3pIOUNZeWxoQlMx?=
 =?utf-8?B?NkkwZUg1L2VvMGlwSTJjbHNGbFN4U3I1SXFpY09CRFd1cyt6aFYvRVE0ZFlx?=
 =?utf-8?B?ZFhhWDhCc3NwUUR0RDRnTmsrOWRFTHEzbER5VTlIWmZXemRCZEovRENHNDBx?=
 =?utf-8?B?OFVzek11N2NSUlBaNGVhUzZkL1B0MldxQzIzbzIySWMyVVo3eXVHL284UHcv?=
 =?utf-8?B?TkxPZHZENUgrdmhVbTFSdHBDbkFYTk15NC9NNThGb3lQdTIyRUIwc29jMHN5?=
 =?utf-8?B?cGhsVWRrUVN0RFVSd0FLZWJTdU9laGNmckI5UXg3ZjZNZmdETHRPSnpvZTMv?=
 =?utf-8?B?THMrWTJ0cDB0RTdZSUg2VHVNcjY0OTdlb25STllScVJWeDRzS21QTU1iK1ZD?=
 =?utf-8?B?MFZlMW94aVNXeFBEVm9UMllYZGlCWFZFdWw4U1VWcjhjbm1qeW9Cb0x5NTFx?=
 =?utf-8?B?UUt0enZ1U2tsZE9DcW1oY2ZZR2hZanI1MUZjZVl5a0piZllVTFdhWDFJK09w?=
 =?utf-8?B?Vi9wdzRDbmtpVDBPVThLcjRnaEpsS2Q1UnFNKzlvNmVISGxwaXRsQmc5b055?=
 =?utf-8?B?c3hKZlhCTWVyWUpJTW8rVVJKVHNSSDFPbmx0eXhDT3drNEJLZlZveFFUaUor?=
 =?utf-8?B?VkJ0UE1lZStOUENyaWhTKzVRZzlOMlU2byt0Q2dHTHFMWklhSmd0ZVBJMWhh?=
 =?utf-8?B?MmdOQlVWZ1dLcVY5d1dFQzNMekx0ZnFHbTZyTGtPUFlRUFRUQmR0L3drVE0z?=
 =?utf-8?B?MXBxWWxkdDZFT0NyQld0Wmw3TSsyM2t3dzVBQWpuWnFHcE1NQWw0VEJTNHBG?=
 =?utf-8?B?UzhabEh0R0dOM0FmNlByczhyM1F6cTVmQlBjNEZqNVZ2K3NvMmlEdkVhUlQy?=
 =?utf-8?Q?eXVn3s7DGgiUBHVBtWcvdls=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STM0cWZmT3RZcUZlcllqV0xTRmZRbjdzVnQwSjhDWkRpcysyVE9zeXBkMFo3?=
 =?utf-8?B?M3FWd0V0MzEzWTNXbkpuRktvRTFnTmhLUEZhZkM1cDdCVmpudEtYTTFOS1hY?=
 =?utf-8?B?cjBRY2R6SWhnekxyU0JYTHBEa1piMGNWYktISGZTTFUvblQ2ZWRhNTV3NFZU?=
 =?utf-8?B?Z3Z6bVorS1B2N1FSOStINXJIajVERmh4MmEwdUxXZ3RuNURQZmMxbUs1OXJW?=
 =?utf-8?B?b0gvS2pRSTh0NHBWVTZGWXRKOHQrVWx3WXM2MENic0dFeFp4cks5aHNCd3Bq?=
 =?utf-8?B?dWkrSUpnNUZ4NEVVRTZFdUR2cHovZ0ZFejhacTJDNHJEYUFMamRHalJtM2kz?=
 =?utf-8?B?b21ML0lNazNvelVsTS82NFdYK3ZleXpIL2JVRXQvUGNCOHdWdkp5QStvc21w?=
 =?utf-8?B?a29MSENRZmxsMWRWOC8vWHE2WHdiRytVMzgzSlJidVRzWVY5Qi80ektQRFdy?=
 =?utf-8?B?YTl5TjhaMzhaRTFwdnlINm5rS3ZHTXNoM0cxRVVSODNDZlN1YjdLcVZ2MG9p?=
 =?utf-8?B?akoxZytIQTZzcG5ub2xDakRpSG1DT1ZGMFE1SGtndTZTQUVPMWZtTXk2MXps?=
 =?utf-8?B?TDVQaTVlQUQxRG43Z1Z3djlsU2tPQmpxMEhBTkl6OEk1cFpzTjJLdXUySnJ6?=
 =?utf-8?B?V1FXNWlleGRBUE1RVXRmc1dGQzFOZkhtT0FoczNYOTFxUnh2bURVcXRKeWdt?=
 =?utf-8?B?SUZyelhyV0FQVHdnYUt2ZVYyUGhrWlpVeE9kM0ZacWhsbDY2dDVvbXhDdm5t?=
 =?utf-8?B?c3BwS2x5YmIzYXpmTzgrczRuT2F3TC9ENWtEaWlEWXBCTUJTMk9icDd0cU5q?=
 =?utf-8?B?aDZkVHlvbWVESURycnhkcGtVcndoT3RTajZ6eE5FOEg5UGtrT2NLcW12djJZ?=
 =?utf-8?B?ZDhUTGExWWdQNEhNaEN2djZaV29RQnl0R2pVdU12ZWtFVWVoejMrNktBTVda?=
 =?utf-8?B?dFRxUzZpTnBmQXIvaTNlZUE3dVNQdEVraVI0QjB2Umd0a1RhUFczNHY3emQ5?=
 =?utf-8?B?T0xURU1wS01iS3dLMnNQYmEwaUl4L29RNjNzZGFYc0tjQjJPb3J2ZEN2d09w?=
 =?utf-8?B?Wi9XaXQ1ekRRcVBKbytiL2FEZFFPM253WDUrVy9lc0ZEZmNpVE5SWnJHb1dO?=
 =?utf-8?B?djl2ZkhQSU56Tkd2VnM4MUwzOTVwVkJyMGVPeTBUN1pmbzhvRlZJa2hETER5?=
 =?utf-8?B?OVZyVFJYN3g5WSthZ0owdWMwb2pObE5yVUYyenpKWHhWOVR4VGZPQnJWbFgy?=
 =?utf-8?B?T1FaeUlGTzFkWllMYkxxMDhGTUtxKzQ1NURaRjIrTUFCV0o1MkJoakpxaHBY?=
 =?utf-8?B?L25XdGJOcHA4dFlEZVl1M3ZvNXQraGxvMDdidWM1V1NScXRSK2JPYWxPMHA2?=
 =?utf-8?B?N3R6RmNWWU5kdUNPM1NBaTlrZmovbUpaOGhGOVFMUjcyeTdQTFFSZC82ZFcy?=
 =?utf-8?B?ME82eThuSjd1bE55UHlLZ0RhSjhDSFg0N00xdkRWcnZZZ011NnJ4VDBoUzNW?=
 =?utf-8?B?YnZqLzJKak5nQXIycjN1M0dWRnBVUnB4aEZNeDIxZ2NVMWJ4RmZPa09zUFNa?=
 =?utf-8?B?aU9iMk55ZU9GWDhVcW5ITzdkOWRkMitSYitPZEFEeWFvdFVFaHpWTUlxK0xY?=
 =?utf-8?B?M2s4YXREcTIrN1Nueld6LzV6aGRhU2ZpaWp0ZkVPYlNMQ21xVjFjZjZuWFF6?=
 =?utf-8?B?bTZFQ3Y5eWRCd29DUjRzZnFGVW52Q3dVakROaWlRL0pGNFcxaTU3ZUNmYUV3?=
 =?utf-8?B?SWIrUkdZWEFrWUhPQWMvS2FXNS90bXFFckhiY284ODZwTmRCMUtKRG9INEJL?=
 =?utf-8?B?SUxFMklYaG5lVjVHSGh3UEZyeExsTDFhOFFqSDFSR3VqWnJyQ2RhUVNULzlV?=
 =?utf-8?B?TjZtK2ZNdUNIWHVYdjBDVTJOdC9xeTJBcWRWMDdUcmhseXpFdUlMVG1JOVVU?=
 =?utf-8?B?bFhPZ2dSRitxdmhoMkxpb3ZkWWFtVXd2ZDhYd2RiS1hnR1Y2T2Z4dXhPd1hR?=
 =?utf-8?B?cTl0QjhDTm5WdmcwQk5DSXluck9DbWdFd2tQMVJETFUzOHM1M1ZFbEZVaHhw?=
 =?utf-8?B?QTV6aThxSUNDVmNPVGhGeTZYclZ0eFhwUXhXK1F0V3lCRHdXZjVRb1kyTGdV?=
 =?utf-8?B?QWFMRXRiOEtxWk9GWjIrTTZlbWd4Y3A4YmlMWEU3dS82SERKRW5kaU4xaHph?=
 =?utf-8?B?WUhnSkhYR3haanFLZ29aVmdJV09UTjlwZmltWE92REJTYmZxODQxeFZWOXE2?=
 =?utf-8?B?eTNZeWhJbElsVitTZlFXc05EcFpNVVVnVlhUcnltWEhzWG1nR0lMYS85UXZn?=
 =?utf-8?B?VHZmRXZWNytOZWxCMlFxanBLdk5vN0NBT21vQ3N1Qzlkb0hmaUE5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39465c4f-28da-4079-5218-08de541d3b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 10:02:45.7268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UeW/tnQElKbkLHw5FDEDq0hzbKSeAWdvH8fV9TbMQ8kdndMKQiPoZ9rFmZAdsmrzOuRLVYN41XxiPATjHKBjN9loWMumv3RkNMGhzYhTm8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB7970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_020257_469162_6704823F 
X-CRM114-Status: GOOD (  18.04  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gcGh5OiBhZGQgQVNUMjcwMCB1c2IzLjIgcGh5IGRy
aXZlcg0KPiANCj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDM6MTM6MTFQTSArMDgwMCwgUnlh
biBDaGVuIHdyb3RlOg0KPiA+IEFkZCBBU1QyNzAwIFVTQjMuMiBQSFkgZHJpdmVyIHN1cHBvcnQu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNo
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waHkvYXNwZWVkL0tjb25maWcgICAgICAgICAg
IHwgIDEzICsrDQo+ID4gIGRyaXZlcnMvcGh5L2FzcGVlZC9NYWtlZmlsZSAgICAgICAgICB8ICAg
MiArDQo+ID4gIGRyaXZlcnMvcGh5L2FzcGVlZC9waHktYXNwZWVkLXVzYjMuYyB8IDIzNg0KPiA+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjUxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9h
c3BlZWQvS2NvbmZpZyBiL2RyaXZlcnMvcGh5L2FzcGVlZC9LY29uZmlnDQo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi45M2JiNWE5MTM2MzMNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9waHkvYXNwZWVkL0tjb25maWcNCj4gPiBAQCAtMCww
ICsxLDEzIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiA+ICsNCj4gPiArIw0KPiA+ICsjIFBIWSBkcml2ZXJzIGZvciBBU1BFRUQNCj4gPiArIw0KPiA+
ICsNCj4gPiArY29uZmlnIFBIWV9BU1BFRURfVVNCMw0KPiA+ICsJdHJpc3RhdGUgIkFTUEVFRCBV
U0IzIFBIWSBkcml2ZXIiDQo+ID4gKwlzZWxlY3QgR0VORVJJQ19QSFkNCj4gPiArCWRlcGVuZHMg
b24gQVJDSF9BU1BFRUQNCj4gDQo+IENPTVBJTEVfVEVTVA0KV2lsbCB1cGRhdGUNCiBkZXBlbmRz
IG9uIChBUkNIX0FTUEVFRCB8fCBDT01QSUxFX1RFU1QpDQoNCj4gDQo+ID4gKwlkZWZhdWx0IG4N
Cj4gDQo+IEl0J3MgdGhlIGRlZmF1bHQsIHNvIG1heWJlIHlvdSBtZWFudCAnQVJDSF9BU1BFRUQn
Pw0KDQpXaWxsIHJlbW92ZSBkZWZhdWx0IG4NCg0KVGhhbmtzIHlvdXIgcmV2aWV3LiANCg==

