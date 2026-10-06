Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36015CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5p+OpphxSVpMgtxT944ASlf3h3HGnIn0+AZAZYBx1o=; b=zpCm/m/jR9NB5vT8DcD3cnkP7c
	d45vWNI3K6nbkMBnzd/YKt+IZmyEN+UOlL6AIvi3cAd6cQGXJSpGDN9jktSWhAgj3/o/nno9Hkgmf
	SkO7I39jt4wuObjC9nFgyw4WbgRx0ENiqcSVNq0FaO8/mwXbOjy3k7Ac/v1eZr/ab/A+XF6Dv4Uia
	vZoSLfEFCfCNgTL7Vm2fVSEniuHNsjH/ScmcJb7sW6OSs7DyNZj71ZK6VWAfnbBeVY8VKj8wZo8Zu
	j6U9VHxTUd8K3IY9R49YVc7+5ssY8YPytO4G/MScmUCkIpsMQdiiWCrICJLRVhvlRhLlkceT8hfvO
	XyFd58Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3oZ-00000000g4V-3Som;
	Tue, 06 Oct 2026 11:58:35 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3oT-00000000frX-0sri
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoqQMgPoFg+FJcMAvC6T7BdkU6G1bGkFXCD6oW1IkdzSVR6ITpXOprdUWFeydA7NnccoxOo1MesuTD0jCVNfZPoSo6XhS2TtzRZf5TFUn9wXlVwbm0R9CXlvWB/dcALBMvKOfhyADPdXCObqAqazfDPkOa2WsVtr4mE1Vp0NHPPuGJKpPFCwEIcgyD68IKq7BjUX4D7yq5jtm/Emt6dVokZCoGIiH2q8Mgk0mUzsQRhQvWZ1K9apl7DFMz1+mVXGYafyheDM38fXRT2BGo97PMGAiFMtGDsyHGTN53GCfLnaiUY+GkFrqZs3IGOYpcGD8vyA6AwKPkNeBfd2qUGGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5p+OpphxSVpMgtxT944ASlf3h3HGnIn0+AZAZYBx1o=;
 b=A0llbtC2oRwP2CW9ouFtIbkgptZb3VTzc90gq86IN7Rn1t2opAyodeZZlBo4S6l2mRtaZLoVLc2HlaKlPeoIwQ7XuMIkdxBewJZ594mWvCl8PdlZZoCunpCPc3WEMx1E4PMuKGtzoObpmAWLJk2dDmytPbfYNP0TUK+YU+5HzmBu1vBCnGVz+YAkAPyKQxquqAzuvNURX8bD0fLl7lhg3NWY91VwEpmvis17n2dC1KWqV0FlnTBqsnjsXePF4fyBJ7RCfE+0F80YODWrfPBwK+kF2t+74fXWdydkXg2vyxJcIYHx3fR87jtHr8EN/PgL5WmGCNfEfd0aP9Cf9dGFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5p+OpphxSVpMgtxT944ASlf3h3HGnIn0+AZAZYBx1o=;
 b=dR+96VcSGNlYNPvV09t6hCWkILE9yKdBubvSMYUe3+/h4Yr6Xroqwspzd+EW32G7NIErNZdY9PsHNYY6L8LPdX/30jf3iOx1L/LpmUQaTJFcMuKV+kltY1l1KCMx3GadjufIZk/VHlPLR1AhFlCW63AN55k74RG2OJkvhuyfOj8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:18 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:18 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:27 +0200
Subject: [PATCH v2 13/17] ARM: dts: samsung: exynos4210-origen: sort
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-13-e8e86a3c8c1f@axis.com>
References: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
In-Reply-To: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, waqar.hameed@axis.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3932;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=DaYtl3gAOpmcudyLZsqwuWU+FH7+McQd6ybF+24p3gw=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI/B9EisdBCDNgPgYNBflOBmOVLGOjl9/RdB
 O4hGV0s6nGJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiPwAKCRCwB25JC3Fh
 a8B/B/9E49DnVFKr9UWesMn/r+XRlwo5dqMNKXKOLIKW3G/Bnzzu4z40hKucin2Ru2zbWiG5A+6
 p0xeClKLVIjubCLwfDQEGZkroLz8ygkPHjcmAbzn4No8exdSy8HtYgcDmnMq0P20piK1mMUGTFe
 3pmQt9SoKSi1BqSYVuwE3eQVafsFLnwCEL1moUmx/ghJwFoUYcLv39tw44SomtlZ7JECnZUI1ts
 0A5okDDkuPwt8kdbz5F/Fb5c64n0x09ZNz0PJOK0ZU/DDrFfI6FIoG2yMvW3FLk880ljnSoO317
 ewx2o6gcRALPuCHCTOlp+UDZbuxMdtZRW98DtwLAizDTIenT
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: GV3P280CA0069.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::30) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffe496c-331b-470d-bbd3-08df23a11c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: LdVQsf9jS2GrojOxjpQGwZbrhw+WlsE3Vf78cjDPxwNqk+aGKLcdVGNMFtWJvBBfNMpw0Vgs/WMjsE+U+2Ven2OMle1IQMGsxIayFKMjEaOr0QCAHoYYzw7hm+Qb8jc1qrqIFOoR+EeEgfUI6/E7nij+PmtCvx5eR9YO0JPuXYMTlRAsFLjUCBJYxeUFUwpobmJ5xF7aZSTLlOsQcTsEpMwi/PfyCVSBmIODIK5h0NByVSMTWWZnuSXdZ2uqH7KJbBAjPrU5WssUKSGDu+xvU+jCNgtUwJivl2OTSqWsbtORlMPyOsO9vfQ3B6AQznrkriQ2ju8X3O/6G0q3uE/xWjpqYc8FBeJkrTEhjgRpBwtZDJWtN/qLRgh6AT9SsjqSDdkpDa3p1mOalUR++TNbVWJ2TK2KYXHuCO70otbd0A4xCcrlFJkKMajMt+flukF4uwvf3h23hMI0z1CHmxyaL17l8E/z/8lDTm2uGVprk1NrI/w2d89R2lE3Uv8ErGK2upf4TbBO1lVrMhhrhIa3lQGul2QUNxwmPU1uMQ7L/1dwZgZ+X38eCWFssRosPNTA2GZm7I7s6DgIp1F2hxzqhrHE4nFjUGbjbsfWUhnknMg3KoIOPn9Xm6HUuvuEyZs29yLNwty2+QV/NbbhnPSxqCTICWaviZwmOzjRojyj4Jk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVlEaXl3L0ZIaW9HWjlYcDU0VnpTeGpmT0hnTUQ5VmR3SFFmNk1tRkJic0RV?=
 =?utf-8?B?NWdxZkMzd1lqbmxxNWtCbnFWQjI1OFRGYmtlbUU0SmhLSUt3UXhUQmNoWnN1?=
 =?utf-8?B?M25wdjNZaEdlZkpicEFlaGFmamtTY01Sck1CbXVSTU1HbnR2OEdXZlRTUC9r?=
 =?utf-8?B?TStldVVTbHlQVlQ0Zjd4RXkxeUF2QUlHNkhlVGVoUFdRdlFOVmNnWlR2ZnJa?=
 =?utf-8?B?YkVpNUFiTkwwVXN5VjdnQkRGY202UXNUa05hWW00YjNZN0R6ckZBSnlBbm5O?=
 =?utf-8?B?dEhZdGsrcHphMEh1U0NrY2FYL1ZnanZJTVRaaGtQcjl5UWdHbmJiMFFuZVZt?=
 =?utf-8?B?ZERGOW5yT2c0Uzl3WENSRnRHRkt1cU12YmtXUnE0dVcrc3BWOXhJaTRxalFz?=
 =?utf-8?B?QVpxL281c0dHQ0Joajd1MFc4L0FIS0hJaStiZlF2bVluak8weGl3UzZNQVF5?=
 =?utf-8?B?amIyUFo2TXd3ajhOK3Q1cmxXMmFVaXdjMmJsQjlCSk1HcncyZkJhT0JpMVlM?=
 =?utf-8?B?Y005SUhWOG52VE1peFMwZVRxQWN0eUlJR3FRdFQzalJKWkpkdjBRdW5jbDVL?=
 =?utf-8?B?djlOR0lGVjVYVzhnZiszMDREWFd2WUxzSkRWaXVWMW9ReXp5ZHQyeU03b3kv?=
 =?utf-8?B?NnNaYndNVkhvV254Y3VsYUVnM2NrdGd3cDVNT2d1aHIzekYvNC9RSWNPK0FQ?=
 =?utf-8?B?U3U4bnJGc2lObndLdUlsYjB3M2lTQjZKeWdySkNkd2NLTi9sNGZHTDJDZ3J4?=
 =?utf-8?B?WHY1ekozL2M1L2I3ZHVYamJZK05xQUlNZUV2VmpUVC8wRU91czFnVTBSdi9Q?=
 =?utf-8?B?bXc5RnRpa3lxdmZPSFBDQjJBTHA2dHh4VEppeURGRTJmdTBmYU00UHVQL1NH?=
 =?utf-8?B?Y1MxalpZWmFxOVFseFN3elVORVcvTEwrVjhMcERyNWhIOXlEWTQ5N25NMkEx?=
 =?utf-8?B?WVhzZDlHUCtoSTFoODRDN3B4akJVN1lBSnd6V3lMUENuQUN2SUpqT0xtdGYy?=
 =?utf-8?B?QWxFWmZaVUJWdnZyZ3d2WVN2RXVGWldTMklYTS9xU3ZYKzJWSm44N1kxM0NP?=
 =?utf-8?B?Mk9kdlFMNFdlVFVodU9OUDV6SmF0UGYxeThZMU9YK3ZQN3dKSS9EVlptSENC?=
 =?utf-8?B?THNwWDZyRTNaVTEyQXF5anNkbTJ1a3FhN3FTQWNBK2FkWC85RXhMOFVXSFhU?=
 =?utf-8?B?Ry9lRXhxYUozQktqUzdGNytUTGg0dGJBOU1OT09XenJzVHhUUkRLTTcwd3FQ?=
 =?utf-8?B?R1dhaXpmMnJuS0YxdUhkYzBGSDFGVjRVTVl6QmZtdXNTL2xlZHdkOStqZ2ta?=
 =?utf-8?B?UWtveFJOZlF5MkVJblZnK2lFU0F4bzhMbHpXU0VGU3d5NUQ5Q2k1aEcwT0kx?=
 =?utf-8?B?OU1zTTI3RWcwVFpSdDJDOG1iV1dTU2FsRTBiTkFIZkUyeDR6bnNQSE90T3p2?=
 =?utf-8?B?Mlp5c0lLbFJMTENzRXo1dFd5ZmlQbWZTZjZHOXVGelFyakx6ZWU0em9ZTmZK?=
 =?utf-8?B?aCtadXlFUUMyVjUvQTFmaWlIUmc1VHdkZ2ZvY1JhdEtjMHorQkoyM0duMmg4?=
 =?utf-8?B?QVliZDZ2ejZSZ2VlcjdwN3QvS2VlMm0vVlVJUHFaVUhNbmxZc0c0L1A0eldP?=
 =?utf-8?B?YUJiSjdrL2V2QXNXQzBLMXpjeXJKaWp4ZlV0YjdzUTBhYndGZlVkRG1wUnQr?=
 =?utf-8?B?UEE5MG9uVVJoUnJwSkp2WHk2ZkRoMFgxN2hRbWVJdWs2Tm11V0VvdU1vQjNP?=
 =?utf-8?B?M0xEbjU0RExXekI4RWVQdHJ5WUYyOEhGZ2xPaVhNTWdETWREaXZxdTZyWS9F?=
 =?utf-8?B?UVRuYVVQUGhZL2FNUW8rcUsvd0E2d2R0aHd6WlhOVmZvcGFBRHhmMFVUZStp?=
 =?utf-8?B?c0hZemxSNnluc1NlWU04NDBEbVk0Q3JqUnB2TzFuNWZXdUNoRFZvbkFhbzNU?=
 =?utf-8?B?TnNaYlJkcGdjUmN3SDJYSk5adWZKUXhQUEt3QWNhKzg2Y2dyYkQ2NWZFUHRa?=
 =?utf-8?B?SjNPWEVUQ3piZXhLNTMra1Yzd2xYK29pam9IU0pORGJRcWxtcjd4WEhFTURI?=
 =?utf-8?B?TFBLenNVT0w0TDZIZ1pDdGF3VkY3RXBNRjZJa1ZDdmNkOStMc3crblphSGFC?=
 =?utf-8?B?dWI3czduTnZmdzhDbkNwbGVWVWZ3cnNmRDdhb3lMUDk2WTVvU3ExejJKUzBa?=
 =?utf-8?B?SzZrN2NGOTJVS2NDS1hodDAyaEJadGEvNFBQL3pOdytjWEVTWkx5NlBWRHhO?=
 =?utf-8?B?bnJGWk5zL3J1dG95YThYS09LdDduNWhqUllSNGd4dUI5bS9MWlZmRFkvNVJ2?=
 =?utf-8?B?OEdSQS9VaVVoNEN4Q1lOMVgzNEdIVkcvZ0tCbU4rODNkTGNGVGROZz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffe496c-331b-470d-bbd3-08df23a11c84
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:18.6900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g90rVo7iUx0pGkTzQKaMC0sr0Ws0GpGT9t50PiJ6RL3p5y2+7pUleLDr4K7T0b2asgmAo+quKoeJIw1BdQ37YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_045829_272852_ED2CAC60 
X-CRM114-Status: UNSURE (   9.81  )
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

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-origen.dts:171: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210-origen.dts:176: [property-order] property 'samsung,i2c-sda-delay' out of canonical order (should sort before 'status')
  samsung/exynos4210-origen.dts:178: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'samsung,i2c-max-bus-freq')

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-origen.dts | 30 ++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-origen.dts b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
index f1927ca15e08..78c77d00d138 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
@@ -55,41 +55,42 @@ gpio-keys {
 		key-up {
 			label = "Up";
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_UP>;
 			wakeup-source;
+			linux,code = <KEY_UP>;
 		};
 
 		key-down {
 			label = "Down";
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_DOWN>;
 			wakeup-source;
+			linux,code = <KEY_DOWN>;
 		};
 
 		key-back {
 			label = "Back";
 			gpios = <&gpx1 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_BACK>;
 			wakeup-source;
+			linux,code = <KEY_BACK>;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&gpx1 6 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_HOME>;
 			wakeup-source;
+			linux,code = <KEY_HOME>;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&gpx1 5 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
 			wakeup-source;
+			linux,code = <KEY_MENU>;
 		};
 	};
 
 	leds {
 		compatible = "gpio-leds";
+
 		led-status {
 			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
 			function = LED_FUNCTION_HEARTBEAT;
@@ -118,6 +119,7 @@ pmic_ap_clk: pmic-ap-clk {
 
 	display-timings {
 		native-mode = <&timing0>;
+
 		timing0: timing {
 			clock-frequency = <47500000>;
 			hactive = <1024>;
@@ -142,6 +144,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -156,11 +159,13 @@ &exynos_usbphy {
 &fimd {
 	pinctrl-0 = <&lcd_en &lcd_clk &lcd_data24 &pwm0_out>;
 	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &gpu {
 	mali-supply = <&buck3_reg>;
+
 	status = "okay";
 };
 
@@ -168,23 +173,25 @@ &hsotg {
 	vusb_d-supply = <&ldo3_reg>;
 	vusb_a-supply = <&ldo8_reg>;
 	dr_mode = "peripheral";
+
 	status = "okay";
 };
 
 &i2c_0 {
-	status = "okay";
-	samsung,i2c-sda-delay = <100>;
-	samsung,i2c-max-bus-freq = <20000>;
 	pinctrl-0 = <&i2c0_bus>;
 	pinctrl-names = "default";
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <20000>;
+
+	status = "okay";
 
 	pmic@66 {
 		compatible = "maxim,max8997-pmic";
 		reg = <0x66>;
 		interrupt-parent = <&gpx0>;
 		interrupts = <4 IRQ_TYPE_NONE>, <3 IRQ_TYPE_NONE>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&max8997_irq>;
+		pinctrl-names = "default";
 
 		max8997,pmic-buck1-dvs-voltage = <1350000>;
 		max8997,pmic-buck2-dvs-voltage = <1100000>;
@@ -334,6 +341,7 @@ &sdhci_0 {
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_cd>;
 	pinctrl-names = "default";
 	vmmc-supply = <&mmc_reg>;
+
 	status = "okay";
 };
 
@@ -342,6 +350,7 @@ &sdhci_2 {
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
 	pinctrl-names = "default";
 	vmmc-supply = <&mmc_reg>;
+
 	status = "okay";
 };
 
@@ -362,9 +371,10 @@ &serial_3 {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &tmu {

-- 
2.43.0


