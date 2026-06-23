Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D7CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJprX2iYCDliqCQPdA9RNcvQAOHfdxkdK/ngLLvJ2is=; b=IleLO1dI4Cx0oE0V1EH9znUqZF
	JgAf8wtZ7zXG7fs27VtRrj//EeIXIT2s8XTdWkjCDC1TAaVa8oq9zdHEr6fVi+QdUw7T6pS0PwJa6
	y36qSDMrOC74/ZmJOOoT2LjqQtgh3yzkUDBtr7FHZ5WGYBh8pJgTeWAQmMZzUYLhZ6BgYgGDtSmkd
	ZVfuG/oSLmTvJvmw1hm/XLI+GddmnGQceVG1ibmb9FVR6OGQKH3oXXNw1bI2Dcw6LEwp8AxVQ2GFc
	wtteOz/WIvmRmPW06c2nB1Ibd8z6k/eHY9vm1q4foH4/GE6fHizQSnFwsuGlKeJKt9xKTTPIxqgZr
	ofPaUrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwRh-00000005uiI-3Evm;
	Tue, 23 Jun 2026 08:25:25 +0000
Received: from mail-westcentralusazon11020115.outbound.protection.outlook.com ([40.93.198.115] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwRf-00000005uhr-0tq0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:25:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZluNfs0+PU0uWxpzRk8ZQu4TykNQMFvyEFMxb/JUWnrPUVUjy0/tCRsD4J1x5STbBjtkoQ3uedl9/QC7ZW8EwK1sXIKIESQsVWa9yfeyu9CTpgsP1YAFRUuzEa/A6vMJtYp5D0coYJiUGK6uPofvWPUiFW6w+96asdjlJJa8TV7ek3RDJIyZ+sCIsSb67Q9Ib+p2m3QUBIq3JXKckbnlq5gd16Ej/YhLFGC0mRNdCxqzU2a4scbvY4t4aiL2hlqu/vDDdRvuu6k497TnCLKuKtrhW3PchZHGnzyLe0yzxqdmqJnYO5zv0IZFIZ1Dbmni1DD7522VAaPjCJscH7M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJprX2iYCDliqCQPdA9RNcvQAOHfdxkdK/ngLLvJ2is=;
 b=TNoFqyv0+v0N2gIx6ptU4yPXx8eDLui+AS3vPz6NOTbvLh9DianKn/qq05DdVwVk7ngIfdJuxKxksHoo2m5Diuscj63I4wekBGJXH3dItYhK9vIXUY/H7iddmYj1c40NiTrFeXl+jpvYw3oTBExRKzs7kHVBIfVjEUa2Xv/VzIOtpVf8x9CAaOKYg1lrYVcKDJeo/2rGnlIo7h9SLjW526vhxY1pf0QNZ0W4T+Twu4Wwu66CjX+F1Sv1mHs9Hkk8U7GSjQLhJN9JEAk8Cx7cdlkLnRGj9kyn8Jw0ZJYeYNlEv/33DKew1MP7vmT8wsQOaOVoVv4bLcFQYDHRR8maRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJprX2iYCDliqCQPdA9RNcvQAOHfdxkdK/ngLLvJ2is=;
 b=pyj5LzDQifKl6XCYMORcail0aDc/D7dQiAkZajgpzGsMazRvLrpEiVeWDCb4mVJVuLsUPaBjuc7rlbXtHjwvbgys9/eXmPjRdSeBr0D3P7rPITLuQGWJ1tmJO3YViRz7gpEi2GiSOhpwiGYcXwW2wQ51Y0+mWYZjdZngD9X6Yf7r2fo/uUpwaJuyZSdsOaF6lwmL45CdjV3+lCG0CZ9LQwGaWiNnw1rhOMXqaOm9zMNwh1HxYYeubNNNIIN3y4x6rJ4MJ1jWsU12qKKNwqIIc90L49kTVyLYdRQgmEAV52ArdostCTfh1R7Wsqoa+HzPzdZF+pf2SnQGrE0eH4NSFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 IA0PPFDC97AC94B.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 08:25:19 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0113.015; Tue, 23 Jun 2026
 08:25:19 +0000
Message-ID: <b3dbe076-03ba-41d8-a5ce-e65ac739147c@axiado.com>
Date: Tue, 23 Jun 2026 10:25:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pwm: add Axiado AX3000 PWM driver
Content-Language: en-GB
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260618-axiado-ax3000-pwm-v1-0-c9797a909414@axiado.com>
 <20260618-axiado-ax3000-pwm-v1-2-c9797a909414@axiado.com>
 <ajlf4t_tuuX-Eplc@monoceros>
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <ajlf4t_tuuX-Eplc@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::11) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|IA0PPFDC97AC94B:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd1d3d9-bd01-49ca-d15b-08ded100f60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: pO7tHU1axgLHyXITLauSRUKTqCvctXs9t8H6PVivJQ+d3AOhqdRNpc8Rigz15vBpercHZx9oS1t1WpvBANpRx7B3PVb6WsuA8VMgeEqTfzDluwKZISExO+RHj3KcuSL2a7rYjMLV1Uc+JOJOHsGxJ/EmConCTg+xt6NFDUovhikFw+y7b0ft19al+PtWuoT+xmDlyMGWpzbxhHq1hrV3rUOrAIyzRn3J2MK0JOrzntOsooi870GvWXFIYwFOxwScu9+jJF9ix5ige31ildSSAZvLKGaH01KRLB3YR3Lh6NeNv7MZOk2etC0+FeNC3tO/3gzigVMec+C26552dOxDPnDpf+hc42Rw2MBD2htc3XKck3tBSPjeNIIgEsdF0jOfJizBX0Yq0Xcf0EwOJPAIUPlBB8qnV63VDb4uAlee1I1NuYmo37O6uGMfiT4iiiv3y7ieBjnYxnoJ1odzK9DHvcSunYX0qcNogtA6hZQ6fqwblnZ2FolsovDI0aE2L9xk4o1XSuTTPNnUhZtpMA7pwa37uoN5wS9rdedd7xsp/nGVBUaevSEeNpqBI708Vr3mfWSpAbrRgpo3zIW3QMqC8ELj0Ib9G1H8D6KIyvAZqyAJHKqcLjYVa0wwMcq1taYg0VOiQkvbprS2NQKmMQEIe0Vb6Caz2gvXz1EyQakmPSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFoc1U4RFdieVAzWXA0K0ppbytRN05vV2pRYnp5YUhwRk1PMG5yWXlNMDBO?=
 =?utf-8?B?YmdTeDVPd09sYzUxY21RRWs3a0xkbFpMbTRCckRDQnlnaldna2lySDZrRkdP?=
 =?utf-8?B?V2p5TlN1bXRFTHB2cGYvV1ZaL0pwM2llc0JDVld6MWNLWDhxbWQ5ZE8yWE1o?=
 =?utf-8?B?d1A3V3A5cDRxU2o1c2p5ZlM2WHB4ZHhiMW11V2pZeE1SMVhqTk16aTZ5VGtW?=
 =?utf-8?B?SHg3MTVTbXduMTg1ZUV5ZnlobFVJSWNTWEcyZ1ZiY3BSY2hjaWZERVY0bW1P?=
 =?utf-8?B?anlCcW81YnhPOFp4WlVFRjVtN0FmelhORTNFWWdyazFYNFF1ZTJoaGRHOHNj?=
 =?utf-8?B?RmNMSXkxdFJmMVA2SHpqUjZvNmxDc2loZi9JR2daUHBlL1pmSkFJY05XRE0z?=
 =?utf-8?B?YUlrazd2VFdnRGRseWdjUThDRThoT3pHend1U1ZmWDNxdCt5bDg2aTZSenJH?=
 =?utf-8?B?NjlWUWx5NzlNc3JHa2dtbVJpdEtJektuZUlxdmJMK2Fmd1o4MkxIa2xLVG9p?=
 =?utf-8?B?eWQ2bFdVYXkyNWZiWG1UaUtpSnAwTjFpOVZING5jVmVaTTVlV2h0SVBQQ29y?=
 =?utf-8?B?OW45clhzTWxOWkhqT21KNktSamhaNjJPWVV0OC9QNVcwNllJNUY1M1JoV21D?=
 =?utf-8?B?NndYQS8rQ1pBOC9nMXRiTWdJVG9VOUR5b3NkM3pNZDZ5eS9yaDg2VExRVi9G?=
 =?utf-8?B?cCtiTkNVa3lpb05lZzBhb1N5ckhuUGVpeGNGL2hXVEdKZ1BSdkFyWnpyOUVF?=
 =?utf-8?B?ZStYY1g4Snd6VUtUNHowaFh5M0V4TDJrY20xOWRXUlBEWURJajAzZWVHRmQ1?=
 =?utf-8?B?b2tla0RpSE9FWkxORGlONkdadmJaaHFMcUZWUlJ6UjdjRGVsK3BEU2NDMHJD?=
 =?utf-8?B?T0JjSWNUYXVqWWxGbHFwMnNRMmZReUpjdFRNYWtmbFk4Vm5mVDZOOUR3bXdl?=
 =?utf-8?B?c3VGaEFuTFIzSGxzTndhYTBnVXlkTGxCSnV0OHIwV1E1NlgzWXorYUpwaU05?=
 =?utf-8?B?ZTU1L05iNlFWd2xpNHp0NVNGaWpoa0txVGt1bHRNMStIK2NmVFJ2UGNoTHNl?=
 =?utf-8?B?aytRdU1hWllLaGVlY1VtWWZkZVJWeFMvU0RPTzBQTkhjMnlFWHNtdEdFNkdI?=
 =?utf-8?B?QW5sWVlYMnYvVitWNk0rTjRLQ1F3ck8zSXZTdmwyczNzazJPaEtDVmYzSzFB?=
 =?utf-8?B?Um1MZ1Iwdy9GSjAzUFcrTWVuOFRlYTluMWlLZTRVL1VtSCtVa0NQRStFR0N6?=
 =?utf-8?B?ZHhtMWVRNHdSUzlxeTFqVVk0U2ppSlo3UWFlenN0TFdyK1FBWHJKclFRd0Er?=
 =?utf-8?B?WHI2cUx2cHJPWTg4YlVObUlCSjFjUXRLZ3R1aXh1R3cyZEZqT3oreHluNDBK?=
 =?utf-8?B?RlJsZG4zNk5vT0V5Q1dZQjYvci9VUEZiQll5QTgzT3l2bDNPdm9WcEhvMXRN?=
 =?utf-8?B?UmdCMXVYdythbmY5aFJLdjlLT3RCUGVsUUxTdnhWSHZ5Ynh1eVA2UWRKR0ph?=
 =?utf-8?B?RWJjVDdwQWNPN3hYZHNlOXZCck5ZM3YwU2lLRDViUEJRNy9PMGhpbE9mcWpV?=
 =?utf-8?B?cWR4SThpb2MxakNhL2R6VlpqbUc5QW82Z2NsWGJsdjJNUEJucVExaXlCa3FH?=
 =?utf-8?B?T0NDM0FxUldUbEh5cE9OYlBZSGhzTXlJZHZwNlllOEVMWDBHa2hiM0RtVFI5?=
 =?utf-8?B?ZTUvZVlUaU9ZYXlGVGIwckp4SFRQWDF3UWc2T2xJSm5LeEp2Nkl0VXUySndt?=
 =?utf-8?B?Vk1laFhNangyOVlQcysrQVFSbXZ4dDZZRlkwOE0wUGNhSEZGS0E1akx3UGx0?=
 =?utf-8?B?RU1aOUpQWThJZDFLdVFaM0ZWaWZNSmRUT1MzaUJxUVlwMGdhVWxDZXRxQWtq?=
 =?utf-8?B?enlySkhJay9WdE1tYlJaWGdJTGZualRNWWN6U1JrcWRuS3BxbjZmQXRkL0Uy?=
 =?utf-8?B?RXhIV3hLTWY0c0VoNjE1RHpkVnVCa1Bkd3lNWC9Ba1pVa21nL21sa3g5QlE4?=
 =?utf-8?B?ZUZjM3VEMEd6MEwzcmFNbW5kTXFieDQ5Y3VLandBRWVuVUdSNU9RTi9FUHdr?=
 =?utf-8?B?YXNQT1V2WlNaUHU1RnBUSkFkL3BWOHBDYmFrZFRhTkZwVThUbDMwTllTeEdV?=
 =?utf-8?B?ZWtLSmJCQ0Q0NE92QUEweDJZcGtHdVFsQUNCcWZhdmJFMWxlRCtxR2JkMlR4?=
 =?utf-8?B?L3pHZEsxVzFPQzY2UWxiOUwvc0dIM2xITGVhY3dYREdLZXBRZWE4Qzhvd3ls?=
 =?utf-8?B?YVNBTkRoZHdlVGJ0dE44SGtra1lmOVNRY1J1azN3eUxZRkhRak1ya2hGalBS?=
 =?utf-8?B?RDhqQ09KckJPYk5mWkhDOWhod2d6cXBBQlJQRUdRV1BDZE1HQzcyQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd1d3d9-bd01-49ca-d15b-08ded100f60c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:25:19.3780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZCIXOQzYisA8iB6Sy8UXQhg9iWBzdA5FcMm80ke1WL7ZCm1S0bvlJyGkz3LYeNKXyZDrlvx1RdYm4OGr4BF8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDC97AC94B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_012523_258033_84E42C2D 
X-CRM114-Status: UNSURE (   7.26  )
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


On 6/22/2026 6:29 PM, Uwe Kleine-König wrote:
> Hello Petar,
>
> Just a very high-level review:

Thank you for the review.
I will address all your comments in the next version.

Regards,
Petar


