Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0C9D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bR8Mb3uKs3M91//xj6Xv1cYsM6TR/kZBrDJlOfS4Qo=; b=OuckuYh7nxgiNAlpiSPno3daaE
	2LsCEjFd6yiCpmEsjyDSFwDwpGQwPwb0bDmhXmymxao4e2kUHIOV74oiVL28tkRw+KbJ/8om3uvVS
	6w4V4epvYuiwuat7tPU+Hrnylh/1NmYEt8TH4q2CR4srgt4Ffxzgn1tBLQ6T7Bidj5cE4vh9FYIlF
	Nc47brIj8i3jBC9++iorEYx0WqY+QOJ+4wZ4W5IsgLS+dKCEM8db4EDlOEVk4z0bodVnstmbLhS9Q
	RA+Kz66GgjJSdwla+a5QrIK6m0Yv+6kzU9u7vTap/Ey1EMD51nsCM+4/ZfxonG4CCMzK/FYcieF1Y
	MuGcZmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pv1-0000000EDMO-1ggX;
	Wed, 01 Apr 2026 07:23:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pv0-0000000EDLL-0ELX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 07:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+bR8Mb3uKs3M91//xj6Xv1cYsM6TR/kZBrDJlOfS4Qo=; b=M6/i9S6CMUUEWyhUYtSWoKFMLY
	ZHiuBYLhfWNlnhKE1w5d1pZ7QRWWQqU8yu1RJ9c1AzOB+c2o0fVBjQRAHUs7U+kQLJ3Y77FEv+O1q
	cjuudqu6EFOf14MZL2sZxO2/3LxcstTJ2czECSYK0HAbfvURLNmKXw96CoyH48xfOV6Uez3RP0AvP
	0ujOfpkhY2BQyS6jJ8KV4wdIg0JX7VlXabYvzgCE4teSVCrL0qHtT6eNoSrts8jRvCyUQ3z9MX/FC
	2Jkbx9v6Xnbs3bNgUrLmWKQiueuw4lVKQN6jDSSf2WKLFrBR6y0uIGXVkj/vAF9v4YD0apn9GeWUd
	1/4jAq7g==;
Received: from mail-francesouthazon11011064.outbound.protection.outlook.com ([40.107.130.64] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puw-0000000HILN-1bBw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmePp2jhVyl9z+g0PbhJbKxyQXKUYO2jvy9NAXhmpLGN2Ndt+vIxxvDZqHAbWped/5RzhnQzHtgsGtwE9wuqRJk+jLzCCLVZLtOfRAMFWtN1osk1H2YKfZOcPGEykYq7nwb8uoAIYq5c15kqPhK+BTuVieC8F6l92roFD7uAbOibD0lRun63ooPODhImePJTC2Ta73USaJBNVxIuBiHFNgp9A7lkqQLEBTudM2b7VCgi6ZjY3xqETLxx99NTCbpXWy+KLAg8PE0OOz5iWiwjUBJ6UUHSu2cEfss9wod0oBWQinNnglhKODDsG06dDvfefldMZ3qzvZEPvf6HMRZ/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bR8Mb3uKs3M91//xj6Xv1cYsM6TR/kZBrDJlOfS4Qo=;
 b=RbfQy0CcGyFTHeoQIZfJ9nAk2gQJA4yMneeJ4sLiflKKT7WJzTiBmUeaoV1RrD+9+r/EAPaKikl7DLH5zpr9K31vFFM3+PTeN5tx+7YIIsbCpzdo1Ki0sYdz9VnRhB7LsRZVwYqaQKu5w7m+Ga6M+M1P/BYdq/cuwsTJFCkb/BMQ+6LMwqoRcEh3omPd74Y6XXOuAn/bbMrQl2xg2hW1RMwbnD62fW2ubDDR7a7KwJLurSQ7+41M18Q0dgNwEmcaRCSmpWhys9B4G97hH6+u34vBEeUuKICp9UWhCX3UzzAJclpKMPxS9zb9iz3fW36E89Qbn3l5MLXAnUfG2TFyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bR8Mb3uKs3M91//xj6Xv1cYsM6TR/kZBrDJlOfS4Qo=;
 b=gqmEcnO2wcghDztkz8ah9dDPjkn7Gg6B8hB2XQHsnJmaMZ3zU3X5x5BrZMPDZuEAJvXKYOffSyTjmN/bt71sXnQ+pzRuRl92nQWNlgEybFZlm+UD3hXKnlHWQoETnaXWmjjWAOA1hOu/LgY7RWm8tkjbEVhYudMGHLcfSPBGtJ93rprCOv4psIMXnOLDmtz3lDkghVFSiv9CqNZ7uedrpdBwTdOjOKAqa78w4vKqD/3x8N+A6BBNKdawQHvbm0nhIFhMm8ReNR4FIfpleUSpYbbYqTp8YSM8q6vszzuaWh4GCDwO8Q5trytcJVgJnELVYHnkl1P3MSBB6Iv1ap7/Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10563.eurprd04.prod.outlook.com (2603:10a6:150:221::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 07:23:00 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 07:22:59 +0000
Message-ID: <40dcbb9c-15ad-4765-9f7e-40a571f98fb5@oss.nxp.com>
Date: Wed, 1 Apr 2026 10:26:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10563:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a5a436-e7a0-4bc6-efe6-08de8fbf809a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2aDtgr1ax5fRV0xVoQ0f90YuyAu03eOw9mxuo3SnQ5zcDZDYj4CXHAMUMYPiaSSOuTANpxplRX/8H+l/752+g3ZvHBDKxpXbq3sNy6ujQaBaIQQNM5DLhMKQi5UmEWVFNnKxrPDi+xcIfYkGkduBPyTkEkNj85BwtJiMav8lJQ04u5mhNvXvuywX6jQdrZg3I/6J9E5eXiYh5ZzNtxvdM4UIRHb0N/ogUK2Rgknegy0rwUo0MGAghXNguN9Ya5vWztyc1hqanBgHDYE/N0FCn+fNLpcUoFWAzH8MT8YesVeyM2iv1yTZE/beIDO7BL/eIwoiQ6phlTmzzjdx+NALHKJd9w5eU13m2/DUVqaUKkymduCQpx28sb2tmlbKeiqq3rMp4jdZvL8hVFQSBqeEv/5Y6zIeAH+Z6rSPtjaq6EH87NYLuM507DVpQZN7KxY02v0ZJm3EHjYcpecE5sy4FFgBYBn8iINgOGug2wTb8NjhjKwSUMwALAkG4p6+pkXbPdVFZelZX08y7Nt3Hs9QEvAENP3hRWJgO/WPfmdvOFFGtLLgjHndFWnecyAl1F099yVvkeZdlLqr88Ld5acueiIlKhceUeF18csAC/tVPKQpZ3AN/0RcwPrgax/BFIz0/dkaL7ueKHYVqGMYNWGJYkBTVTDhLFG1qYhFGfoIT1dNLvAvbrGtJWLIIaH+wMpEjLeKoaHCUf5tyE/sq109p48C05gwpZZWpotkX6WiQEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJTbVZUckxRUzJOSW9IeFF6NnNwUXZNcVFyV1gzTDM0UDNRSWlSVkJQUVFP?=
 =?utf-8?B?RDRLcnNtbWNnU2xjZjZXL3RtcW5TZU9SalRQNDM3Zml5NUQzUmRoVTRYRXV6?=
 =?utf-8?B?Qng5bzkrNHBVM2Rqa0dhcmlTMDZldUhFRTZYR0JmRVBZc2g2VUdnandkR3pN?=
 =?utf-8?B?M2VITXlBcDNrVDl0R3hrSXlpUGJTNEMvZ09HKzJKd205N09YeWFhRnRRTEhR?=
 =?utf-8?B?V2o5NkZOdGdzSGdoNlhTRGlqRmdPNjNHMnBIRGVoUFJvbWhybEJuMXA3SStq?=
 =?utf-8?B?MEg5Y29nRWhmL3BqV0VoTVdTMVh3a1UwS01yMmQxd0JIckt1S2F4ZnBXb25Z?=
 =?utf-8?B?NlREZWp6eTY2dGxRbW1ESHNYcHdHVWVyWmd2elVQRnBiM1c3VVFZUzlYQ1Fk?=
 =?utf-8?B?MTdPczM1czVFTlRDeDc0TXBwcEthN3Rtc2N4alVqT1NkTlRQL3A0SGZYc0pR?=
 =?utf-8?B?U3pJWDhXUGtHZ2lQTlpoNENUcjRUeXpxRWdldE5nZzBnR3B1RnVNb29ZTm5I?=
 =?utf-8?B?SE5pcFpHR2paSUIrQnNOdlU2K09VOWpETVdBM3JTY0wrcENQY1J6aDVyYlRz?=
 =?utf-8?B?b3FSQUNhc2FoVHVibFJrQWo2N1RnL3FJTHM4a1UzN0V5bDRDVlkvSFgzSnp2?=
 =?utf-8?B?YVU4RWROaUtiV2JBRm9pY0pKWVZsVHlMUEVMYmovZ2xHbGc2R2ZUamlCaXBJ?=
 =?utf-8?B?dXRjcVh3WGhxN080WFo4cFAzUEZ6dEhHUDlWZENPcTdVR1VqUkZYVWxBakZD?=
 =?utf-8?B?VVZCSk1WV1NHV1p2NHZxckhGMHdDZXdWNVZMM1lyNTF5bW5YNCtZU3R5N3BP?=
 =?utf-8?B?cGdRN3FiZmdnNVd0bkt6TlkrWEluUEN4QkJ3UndpeEFFZFVwQkozb2FKejJY?=
 =?utf-8?B?VFZhMkg4QWNHbWRQSnF3L0xXMmpjQjRJRHZTYmE4YmV5Nm5KQUhUK3hCRWwr?=
 =?utf-8?B?Skl3bXhuYnlNRmFJTWVYT2ZhbW5wOFBHamk2enZVdFVwSlhHVXJTc3RZY0dS?=
 =?utf-8?B?WGNWL3BWS3l1TGljOXpOL0R6bW1qZHBuMVZwdW1OQ08wd2NVRysrN1J1N0F0?=
 =?utf-8?B?Y0JhS0RvUGx4TUtDODhYYzBBdXI1YzZCZFMxeU1IWDUvWnV3b2J2dGJHMTdO?=
 =?utf-8?B?cmZHT29oc0o3OHltaVhIbEliUG5xeWRySGJDWllHR0ZiUjM0ZThsRUJaS2JU?=
 =?utf-8?B?L2lORmZNV3VuQTljNjRObVVlSVUzSDVsYXNpMitDcTh2VVo3c3dEem5uRldX?=
 =?utf-8?B?ZnlEckRkOFdmc1pXa3pNbFFRcUVQRzdDM0tjcUN4a0dBNlBoc3hwYjNGdTZv?=
 =?utf-8?B?bjFwcVFmeDYyNnhrNy9GSW9JZTkzQy8wL3RNTnM0NEJsV0crNGdyVThyeEpv?=
 =?utf-8?B?b3ZsNzFQbGQ4VXBjVlhZcEtkOG0xNXVpQmhKN01JdUwzdUZCUmFadWRWR2E4?=
 =?utf-8?B?U25ITDhhdHlvTlpOV2UxeGp1eER3bmRYWmlQWjdIVnNpYTQ3MUxmekxVZzgz?=
 =?utf-8?B?UkF2eWJ5RGYyRklqVmNiVjVKMy9XLy9IeFRoNnBHZmJVNmxvcEcxS096QUxM?=
 =?utf-8?B?M0VnK0k4QVlETnNuVFVIQkFKTFEyWmJQL0lkRExXUHhSUEh1WW1IUUxQUVo5?=
 =?utf-8?B?c3pyUWt1b2paOWE0cXgvRTB6L25XdXdZb2N3YzAxV1B4dmtvQVh1ZlBYVkQ4?=
 =?utf-8?B?TjBOa3ZVSjZ6NXJKa0w0Q011QUZnaEIwMDBhTWNPSHA3TkRKRnpESlE5bi9C?=
 =?utf-8?B?NmxGenRVRHRmSUZaNEZycHh4Rm9oM25KaU56bytLQjdQV1RZU1dSTjJIbE1P?=
 =?utf-8?B?UE0vamZiL0pvUXlrOXpQMlhGemVsRitvYnQzaHhQNEVacXN0MXVCVSs4UzVF?=
 =?utf-8?B?YU43a2VUZm45d2NweVRnUlA5YVlrWDFnZ0thMi9Yci9yV0daeUVjdTJwWVNN?=
 =?utf-8?B?WVpnQ3JpbFpDN01pOW5KVkp5a2Y2Y2ZUNW1vb25oU0FxZStMWHM5cGtieU16?=
 =?utf-8?B?RmxTQUV4YXNQMHd5Q001N3BiVm5tTE1INDRkejFkL0NtcG1NdmxIQm5xN2Ux?=
 =?utf-8?B?UldpKzdwZzhpNEdiOG9KZ1drNEJZTGczWDF1b1FVM2JsZHVZQjRITkRmNzJS?=
 =?utf-8?B?MXdiOEtvZnB2UjlBdDJ0NGVVQkZTbUNIakJlTkRCSDJGTTFjZjZTSE9iYnU0?=
 =?utf-8?B?L2QxcGExSm1qSEw0YUNaWmE3OW5pNytobll0MHZyNmo3bWtzeUIwM3doVEV1?=
 =?utf-8?B?a1RDeXUvNnpFdjZlWjQ1aUZ2U05uOFhucVJHTWI0VWxEZmdsYmJRUGtWNlhI?=
 =?utf-8?B?UHFKSDc4VFBLb2Y4OC9BUGJiMlJCKzJEcE1kMEIxU2pFUEw5VTZJUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a5a436-e7a0-4bc6-efe6-08de8fbf809a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:22:59.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrclxXPVegfdkvTOE0Mvha4QEUMxtbKCPu4giLxdKdgUrxfHAV7kaxj6om0J9dY5rJz1oriZkPW2C04x7Qy/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_082310_640639_2CDB1960 
X-CRM114-Status: UNSURE (   8.48  )
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

On 4/1/26 09:40, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> SION is BIT(30), not BIT(26). Correct it.
>
> Fixes: 7ece3cbc8b1ef ("arm64: dts: colibri-imx8x: Add atmel pinctrl groups")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

What is the general attitude around using symbolic macros for pin config?
Like here: https://www.spinics.net/lists/kernel/msg6072866.html

I think there are useful to avoid this kind of bugs.

If I get enough Ack's I can move forward and replace all magic numbers from imx dtses.

thanks,

Daniel


