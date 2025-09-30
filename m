Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C8CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHXUDcxxXHuG+QuKboAmtGnABHPWqlK2tu98XAzbCUw=; b=GHBp5zH+3p8byY+xJFGgQAX8dY
	dXhsiDgaSJi4wzCCRI66mMmPffs/NCTnb+t8tEHxjkAF9Bceve8BT943LCt79OhyTe9RN8x5evcYE
	N/9cu+WXyN7M73WK5aZZ5zernaaY7nkRK8/LLwV5aKSfrQrERwPSgIz4w1k9OoG5tt2iP1Uz2euez
	WOZRSrg4MLEcfjD2E4OlR0BRRrKuVwKHeDFgaAnQEjR0K4+mfIE+5OQAULyyljpavJgRLU/xGoqpp
	jO0FBKd0x36A+08+dwoI2x9Ncm5ofDisyNUV7fOOjrl26wup03Y9Pi8Ud16zJ5SE9BoybyxCsol9O
	WvmT15PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UC5-00000004P8s-2Brq;
	Tue, 30 Sep 2025 06:50:37 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UC2-00000004P80-2xLj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 06:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLBiZ31Mktmn4wzEepz0lQ4oZjE8ovYK1a7V2E9+bMj81K7wipKPZY7GYRM+uC8tGfiUJiAjGctCJTK6WPa8Ky1FYifUJxLjeJENXRTyX7Tec2ivvW8l2uOhbhxYJiOtypB/2gNQYAr74x4GJTcW8td5cew97nRoJmgl4GOAseAy4XABb9ddukLuNoiCaLHbdg698529kNmW7Jv/pqeypufxTJT5sVkVYSmhEb3ixEdzQJBroA9KjzjWGF74Ss8bVodJO1mQNYQ67hwvImKmMYTHMSgcnuE5AL+InHR+RT431sh3jM6NQCcITtGrQ0/sDgRcx6/t+e7uDrav4R98Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHXUDcxxXHuG+QuKboAmtGnABHPWqlK2tu98XAzbCUw=;
 b=iJgOsat9STZpVZC/jGbX0z/qOy3NIZOUgyCLYthhEk2mcfR8VVRC4MI+IxaRBgUAAB8N/Mx6kL5+OFVaR4zV1osCBtvvZdz4mzL3WVYEH+AMujcc1R7nW2NoUS1D+T1ruNqWZzeMJe2RaHN0Wn1QlHrLWVdGoTGMaQKVwmbgHf1BnCtzrPeGwTWNFNr1hLe+3LjWbUHfoHcVOga2iay5+7iQCLQKs+YBWJeAsUGWwrvEfHyo6zxTjYRze7pIAhLWg3ok9UpIzzTZA9gdsQHryItaGL31oISziuUcfLLtwr76KV0Aq5ul0jW2fGp6y3MrjSQg+nXic7Et23PALVVFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHXUDcxxXHuG+QuKboAmtGnABHPWqlK2tu98XAzbCUw=;
 b=M5vQRlWZAtudZdscFjMoyOgi6WAxGKw6UKFquTiIpW+XtK8+iLG3BcmBL7Wjui3U6+Eb6BUlKDObvPSfdIfA4eRRx4j+W4/FdPQ7M9FMW3WFn6TG58KQOng87iELJAu8FVWWxAmbBpQF2eMLuZfwDLJMQNy0772Kd70VLdEXeIdiY1HaMKLmDvC1VHN+L+CCd+MvyQCj24sujrTEthv/k8I3atsBGvTU8irUFjiNlqSH0Um+JJ18RL8PESzlG4XRQFNvalqVkk9+jBM9vfhFL3uvJf/58CUR0d1Ipnn68lPIwitIg9jvoxJsw89kWuVJ/3e3uJ114GSC0WxAgTmPlg==
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:297::14)
 by GV2P195MB1940.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:50:20 +0000
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56]) by DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 06:50:20 +0000
From: Teresa Remmet <t.remmet@phytec.de>
To: Janine Hagemann <j.hagemann@phytec.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Jan Remmet <j.remmet@phytec.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
Thread-Topic: [PATCH 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
Thread-Index: AQHcMdYtB3+Lei5E1UGrosfjT8+1q7SrSUuA
Date: Tue, 30 Sep 2025 06:50:19 +0000
Message-ID: <04cf3e10e3e1048844d06f08c5e90a9956e53b24.camel@phytec.de>
References: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
	 <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-1-d5d03ccbfca1@phytec.de>
In-Reply-To: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-1-d5d03ccbfca1@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1228:EE_|GV2P195MB1940:EE_
x-ms-office365-filtering-correlation-id: ca17fb98-f76d-4e03-89b7-08ddffed9f40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WXYxLzM0dm9mcmxLTjNsNnowc0ljb1RHdmZ5N0RZYnN4ZVo2SzVRRmNPVENU?=
 =?utf-8?B?a1FvR3RwWkdtYWx2SlVldHczclZHRUphOUdGRDZuU1hQR1VEb1FjczRNOEFv?=
 =?utf-8?B?Y3pFdkhiMUlkS1NCaHZpRXFka0VzTzdOdWQzcmtuMGt4MVBTVnlGbGlJZVhI?=
 =?utf-8?B?ZS9EYys4UWNJN0FUK1hSNmxYR0RSbmhGTzdkL05ueXhTa3FtSnF0MDZkS3ZO?=
 =?utf-8?B?TjVnR25lTEJtNkFKNHQ0dEZMWVp3UDBaREpXQkFka2h0L255eDhnaHA4Lytx?=
 =?utf-8?B?cDFxVjcybVRoSEJYczdMWG9GeDcxVnR0RTBiakRMR2FnYnQvdzE3UmZ5cU9s?=
 =?utf-8?B?Q2pWYmM1Y0RRNlJTS2V5TU5jREt3TFF6WnlFQ2hIZkhSZ05iamtpVS82a3Nq?=
 =?utf-8?B?Z1o2WFRiejdPYlJYZkJUN3djV09GL3dHN1dpQURXdGMrQ0xYMXNudW5Ua1Bt?=
 =?utf-8?B?MGFpcCtYcEhpbCtBenFSbUJoSlJNZWcrVXBLMHFsTTBLS0Z0S01jdTErV0Jv?=
 =?utf-8?B?cmw3ZEpLb1FzODduS0d0S211c2pXcDdvZExaQkFjTEJpSU9UaEJ2cFQ2K2lN?=
 =?utf-8?B?THFYU0Z0eVovNFg5UFpCcVQ5VjAxZnpNNHMvQTI5T1NvVzZraFQ2VXg3azRy?=
 =?utf-8?B?Qk1CdEZONkg0bTNhQkZyUXFYSG5jRmd4MGFPd1VFQmFqci9CcjA2MVQ5QjZu?=
 =?utf-8?B?OHk0WFk3SkRFSVUzRXF1RnVlWk9GS204a3JUZWErMlJ5V1Yrd01ISE4vaTEr?=
 =?utf-8?B?UGhVVWlpbGwxYzdlNlhCL2k0TGlKTEVxMjVQcXEwN05GKzRzdTE1bUovb01K?=
 =?utf-8?B?VSs2VitDR2poWXBWYVB2ZlduKzdDREgvRk1vQUh3eXQvT3QwWWRWb2Y2bVFy?=
 =?utf-8?B?d3FpQXZnd015cFZpa1VWOXVIaFdSbGZTYUtub09sekxEVTJxcUYySk9vTWNI?=
 =?utf-8?B?VkNlVDIzVnFNZTBQVHNINHB4cG1HN2krb1dYQ3lCS01BR1hTYWZVMXlteTJ3?=
 =?utf-8?B?WVAxS1VmYStjVGNMSVI3SHJQVDkvQXB1VEhpMHNCMzVOVERXK1YvRjl5NUJU?=
 =?utf-8?B?ZWE4d3NYTEZpM0t4QWVqRndnbitWeGM5S0d3eXluSXpkM2pRazIrSXpjb2hJ?=
 =?utf-8?B?TWx1ck50emVqamFpcEJyWXYrSlhwZVBMa1hyck1RSnNWeXhacFkyZDJYMFc4?=
 =?utf-8?B?aGI2MzJTdUVkUllORk5SMmRxV0ZBSWp0d1RKUlNNa2QwcmdHZGFlU0J1cXpM?=
 =?utf-8?B?TVFjcUxYN2JoRGFkSi9yNnBIUkhVTzJYRk1nNE12QjhLNkVUek91WHV6Sm9m?=
 =?utf-8?B?dGtyMXlrckYzTGdVakZleXZyMkJON0ZLelNwMFRMbUZYMlBDTGpSYkZrVnVW?=
 =?utf-8?B?bmErZHNwTHRHYi9BTTJHSktjbDRaLytkVStGVEtPdlFtb0g0T1dEVldvYmVX?=
 =?utf-8?B?bWtvRWlmYlV2U29oZDJZemdEcGxJSjI3Zk5lRjRSVWNXMC9pVVo0WCtCRUtv?=
 =?utf-8?B?dk9LSDFZcnN2bTNrRUpBK3ZmMFdTNEhCR1g5c2VrVjM4R3QzSmowZ0RuaXU2?=
 =?utf-8?B?Q2UwUmdoaVRiVDN6YjlCNGUvSGh0eVJoU3hIcHNiaFlKdlZlN01BY0Vyd1Rj?=
 =?utf-8?B?QmhlZWhMU21uSEVtdDdPcE1aUWhwVDB1bGN4WVk5SXM3VW95YWtLNDNFU3Iv?=
 =?utf-8?B?Mk1BellkUWowWCtZa2l5NjJyYzIwNzFndDAxdnRWZmhmdkRRQk12Wjc5Q3JP?=
 =?utf-8?B?UVg3ZnJEcGJJa21pZlROR3lLOTllVXd0blZoTnd1N0dSWXFPeGVrMEQzVUZp?=
 =?utf-8?B?RGx0eUxGdHhVb1NiYnFGL1ZPSHBtd2RzeGNTd05RcU1zeHZra1FxNGYySjVQ?=
 =?utf-8?B?QkhVQUZaZXBzK2JTbGVZQW9qL2lkME40Zk1pU2JlL1Qrcmh1ODQ1Z1g1MmNq?=
 =?utf-8?B?TVhyL2cvWC9LdjhTOG5uY1hIQVRFMTZnTTZQYUN5Qk0xb1pIZkhZTnYzcEpN?=
 =?utf-8?B?elN0OXYxeHpRT0dQc0tlYjljQ05tT05YN0Nmd09CeDVuZEE5UUFWTzdtTjQ0?=
 =?utf-8?Q?44qZBz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1228.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjlvTWJoYUYwSHdMSzJuMTMwWDhPZDBSSUh5ZFBCaEdpbWdUM1gxUG1XTU4r?=
 =?utf-8?B?ZkM1c0dJQzA0NStNNXRpNGpXQTlsVE9jdFF3S3oyNlhtb2RQNzF1OXlPR1BV?=
 =?utf-8?B?MWtUK0JRMjZYay9tQUVaYms4bHB2SXZ0aEoyTnkvS3NoNStZWXlQcUFBdkhR?=
 =?utf-8?B?bVFjMzY5RURBNDhEKzFka0NvUHFLUE03S056Z3BGK3k3N3NqNVNUSS9uV0xW?=
 =?utf-8?B?NFR0ZzMzdUlNUTVsMDd0UmJaSmU1emtUeStQYStZakwvdWpxMlJqRUVtL29Z?=
 =?utf-8?B?SDVGbkVMeU1tMW9YMnNDZVRKZmd2ZExRRmJmTXU1Y0M4YmozWFZCV1hyZzlS?=
 =?utf-8?B?QjVYSS93dGhFaWtNbDFZRXh1WW9FOFJxbkZ3WlFRczVIYkNhYndOeENuQkcy?=
 =?utf-8?B?MHFCaktEeGxuSUdGMlMrVkx6dWxuMDJlUEMwRTFTUjM5aktSYzJzWXNFd2xx?=
 =?utf-8?B?NmM5cnU1cTIvYXhNZGJhdXY1RWV1SVl4TWVHUFVVR0hFK1o4N2pRWHR5NTRz?=
 =?utf-8?B?WTJkVmVZa1preUtqVmhVZUc3MUZFTDVoODJscnJjemhISzdkKzNtMkRXdkk1?=
 =?utf-8?B?OGk3R1BJVDRHeldRSU8rOWZYY3FrK0JBQzA3MHhabldPRTd5U1NOTXVnY3dQ?=
 =?utf-8?B?K1N6NXBzRjFhYjB1RnlCMDNrdHNidGFaMjFiOE1UOWRWeXZJako2Mk1iU3Bt?=
 =?utf-8?B?dnA3OUhyK0VwMHpFdHQ4R2NjZUZEU1VTNnFQd1RISkttT1dnYjJZNkQvWld4?=
 =?utf-8?B?VHRyWFlVczkyL213eTZKTWE0Mmc5M01VajVKazhIczlNb1BmR1paZURXNFUz?=
 =?utf-8?B?TkZ2QlVXY0toMjIxRkNwa01tbGJxNTRUZUpBRVFnMFhtSytLcldtaFZSYnpw?=
 =?utf-8?B?V0dCb3VDR05UWldXUXVXQlFLVjVqWXRhcDl6TjFvVzNhVHA0WjFqSk1McjVM?=
 =?utf-8?B?ZEdHS2Z3RXpJcHd4UnlwYjBwT1ZqWG5ZdVpRMXZ3WW9wQzVWd2pWTTloalZ0?=
 =?utf-8?B?eUY4RXlaSzZSbjVBbTZEM2V1MEd6NmZNZDcwUVRuNU93STI4UDdxVVp4dW0w?=
 =?utf-8?B?eUR5MDJndHFiN1FOeXFoMEhKUzJ0dG9IZ2R2MkVTa0ROV29yZXlFV2VGMU9O?=
 =?utf-8?B?WUdmUi82UnV3SG40WU8vQUxWNlJTejBaaFRCbm8yRmIzaDh4VnQ1VVM2VHph?=
 =?utf-8?B?TzFFTjdrbGx2Qml2bDNBaktyaVlrVlZNZDlKK2N0T2VNdSs1VVVpVXNCc0Fz?=
 =?utf-8?B?MHp2UGtSdmxuTW8zQWlQdjFabGtzdVpVTkllaEpxMkdKMC9lRVdtbXNtcDhP?=
 =?utf-8?B?WjBzWGpoQUVYWG5RNndweW00cjNCMGhOK1FQUHRPL2xMKzJBQTltRmpYQzBt?=
 =?utf-8?B?UXNlUitwT3BrQXZjVGlYNnk2MTI4Y3BNS3JOREZ1Y05wNDVNVmFWQkovYjJE?=
 =?utf-8?B?T2FLWEFEYjFnQktEa2Q2N3lCalM2V0QyZlkzNHRyT2ZXaTFGcE8xZDZIZVF1?=
 =?utf-8?B?UUhydkEyUmpkUEZIdU1uSDE0d1ZoOGlBMXlwdTJ1aWZtMUt3SWYyL3RLemlW?=
 =?utf-8?B?bmh2Ymo5UzhhMDI0ZHJJSnhFdVQrbDdjR21VQVJ3SFd2dTZoR1dHNlNKMUVy?=
 =?utf-8?B?R2paMVZVZnp5YXhNQURKcU52Qng4eVFJNlg4K0V0dzdZeUlDSkVmeVBDZlgx?=
 =?utf-8?B?b3pvSGFVRlJZaXZ3WEdqM0dZVVA5SEM3Q3YxOUMycUdqV3g5dE9yQmJBREl5?=
 =?utf-8?B?WXRiRE9lSUhVT00xMUp0U3p0VGdrdW9IOXFpWmpDTDM2Yzg0TWdSNmdWRnJo?=
 =?utf-8?B?WnFwUG8yQzBOaEh2U2s5a1BXYWZaVVhPaGdZZnZTSWlReThxL3hKSlB1ZUlu?=
 =?utf-8?B?eFEvMm15VkMwUzF4dHA5TkFNY2ltbUVETG81dThLRWhkaXZMdHpHUGhlVVNx?=
 =?utf-8?B?bTlITHUybk5DLzZDS2YwT1Bsb0JUR2JoL0tVOXFJT0FQOVcvWjFtSUhaZ0FI?=
 =?utf-8?B?VE5TWFBkakM1OTJyWEg1YklkTlNkeGtZZEY5UTBIeTNLTHdVUzV4RVU4bmZO?=
 =?utf-8?B?UUdCcTR4R1VyNVNaU0hVUVZORGY4SzBKZlpGNHdDSFpHeXkwdTFxUWpJWjBx?=
 =?utf-8?Q?FeBFdryzrvg22KS6gwj5ziSXk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19A2ABF6137B844E9E83F905AF654274@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca17fb98-f76d-4e03-89b7-08ddffed9f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 06:50:20.0116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sFbm79F6ZFmbNICNpmAr6jxKXwarOPqo/SF805TK1WWRpvauHrp5y5VLIAN4rlUGTvyImDhlbxs8WCt8yN5uow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB1940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_235034_925168_E5FED6B3 
X-CRM114-Status: GOOD (  12.94  )
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

QW0gRGllbnN0YWcsIGRlbSAzMC4wOS4yMDI1IHVtIDA4OjQ3ICswMjAwIHNjaHJpZWIgSmFuIFJl
bW1ldDoNCj4gVXBkYXRlIGxpY2Vuc2UgYW5kIHJlbW92ZSBpbmRpdmlkdWFsIGF1dGhvcnNoaXAu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gUmVtbWV0IDxqLnJlbW1ldEBwaHl0ZWMuZGU+DQoN
CkFja2VkLWJ5OiBUZXJlc2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+DQoNCj4gLS0tDQo+
IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXBl
Yi1hdi0xMC5kdHNvwqDCoA0KPiB8IDMgKy0tDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXBlYi1ldmFsLTAxLmR0c28NCj4gfCAzICstLQ0K
PiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1y
ZGsuZHRzwqDCoMKgwqDCoMKgwqDCoMKgDQo+IHwgMyArLS0NCj4gwqBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Y29yZS1zb20uZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoA0KPiB8IDMgKy0tDQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXBlYi0NCj4gYXYtMTAuZHRzbyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItDQo+
IGF2LTEwLmR0c28NCj4gaW5kZXgNCj4gZTVjYTVhNjY0YjYxZTIwZTljMzBjOWU1Y2EwMWE2YWU2
ZGE1NzU5Ni4uNTk1NWQ0OGUxOWFkMDAzNTAzOGVhNGFkNzgzDQo+IDhiM2UwOWQxMGIyZWMgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2Fy
ZC1wb2xpcy1wZWItYXYtDQo+IDEwLmR0c28NCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXBlYi1hdi0NCj4gMTAuZHRzbw0KPiBAQCAt
MSw3ICsxLDYgQEANCj4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlUKQ0KPiDC
oC8qDQo+IMKgICogQ29weXJpZ2h0IChDKSAyMDI1IFBIWVRFQyBNZXNzdGVjaG5payBHbWJIDQo+
IC0gKiBBdXRob3I6IFRlcmVzYSBSZW1tZXQgPHQucmVtbWV0QHBoeXRlYy5kZT4NCj4gwqAgKi8N
Cj4gwqANCj4gwqAvZHRzLXYxLzsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItDQo+IGV2YWwtMDEuZHRzbyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy0NCj4gcGVi
LWV2YWwtMDEuZHRzbw0KPiBpbmRleA0KPiBhMjhmNTFlY2U5M2JhNjJhN2E5OTkxODI2Y2NhMmVj
NzRmNzA0YmEyLi4xMDU5YzI2OTkwZmU2ZWIwZDdhY2RhZDRkMzMNCj4gODY5NDRmNDZlYTk5YiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJv
YXJkLXBvbGlzLXBlYi1ldmFsLQ0KPiAwMS5kdHNvDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItZXZhbC0NCj4gMDEuZHRzbw0K
PiBAQCAtMSw3ICsxLDYgQEANCj4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
DQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlU
KQ0KPiDCoC8qDQo+IMKgICogQ29weXJpZ2h0IChDKSAyMDI1IFBIWVRFQyBNZXNzdGVjaG5payBH
bWJIDQo+IC0gKiBBdXRob3I6IEphbmluZSBIYWdlbWFubiA8ai5oYWdlbWFubkBwaHl0ZWMuZGU+
DQo+IMKgICovDQo+IMKgDQo+IMKgL2R0cy12MS87DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9saXMtDQo+IHJkay5kdHMgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9saXMtcmRrLmR0
cw0KPiBpbmRleA0KPiBiZTQ3MGNmYjAzZDc1ZGU3ZDZkM2ZiYjFhZGQ2NWM3MWZiZThmMjg2Li5j
Y2JmZDY5NzM3Njk2OGU0OTA1N2YxMDI1NzENCj4gYTBmMDZjYjE5ZTcwMiAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXJk
ay5kdHMNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJv
YXJkLXBvbGlzLXJkay5kdHMNCj4gQEAgLTEsNyArMSw2IEBADQo+IC0vLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9yLWxhdGVyIE9SIE1JVCkNCj4gwqAvKg0KPiDCoCAqIENvcHlyaWdodCAoQykgMjAyMiBQ
SFlURUMgTWVzc3RlY2huaWsgR21iSA0KPiAtICogQXV0aG9yOiBUZXJlc2EgUmVtbWV0IDx0LnJl
bW1ldEBwaHl0ZWMuZGU+DQo+IMKgICovDQo+IMKgDQo+IMKgL2R0cy12MS87DQo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Y29yZS1zb20uZHRz
aQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHljb3JlLXNvbS5k
dHNpDQo+IGluZGV4DQo+IDY3MmJhYmE0YzhkMDUyN2YyZGUwMDJkNDlhYTk2ZDMwYTZhZTIzNzMu
LjFjNDcyZTkwMTJjM2FkMzQ0NWZjMGIxN2UwMw0KPiA5M2E5YzBlMjQzMzI5IDEwMDY0NA0KPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Y29yZS1zb20uZHRz
aQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Y29yZS1z
b20uZHRzaQ0KPiBAQCAtMSw3ICsxLDYgQEANCj4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wDQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb3ItbGF0
ZXIgT1IgTUlUKQ0KPiDCoC8qDQo+IMKgICogQ29weXJpZ2h0IChDKSAyMDIyIFBIWVRFQyBNZXNz
dGVjaG5payBHbWJIDQo+IC0gKiBBdXRob3I6IFRlcmVzYSBSZW1tZXQgPHQucmVtbWV0QHBoeXRl
Yy5kZT4NCj4gwqAgKi8NCj4gwqANCj4gwqAjaW5jbHVkZSAiaW14OG1tLmR0c2kiDQo+IA0KDQot
LSANClBIWVRFQyBNZXNzdGVjaG5payBHbWJIIHwgQmFyY2Vsb25hLUFsbGVlIDEgfCA1NTEyOSBN
YWlueiwgR2VybWFueQ0KDQpHZXNjaMOkZnRzZsO8aHJlcjogRGlwbC4tSW5nLiBNaWNoYWVsIE1p
dGV6a2ksIERpcGwuLUluZy4gQm9kbyBIdWJlciwNCkRpcGwuLUluZy4gKEZIKSBNYXJrdXMgTGlj
a2VzIHwgSGFuZGVsc3JlZ2lzdGVyIE1haW56IEhSQiA0NjU2IHwNCkZpbmFuemFtdCBNYWlueiB8
IFN0Lk5yLiAyNi82NjUvMDA2MDgsIERFIDE0OTA1OTg1NQ0K

