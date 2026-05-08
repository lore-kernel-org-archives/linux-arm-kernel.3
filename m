Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91DnOEsESl9n56x9D1JdIK8tPvACUPqjGkRz4xX4jI8=; b=ofU/T7jkWrSdua9qvuUF8FJtaH
	+mhfwStqtN+bg7DeRbfejad9zDFICDinN3f4fx+zp/8ycgsZ5OXovSpsZ7x+gg8tO9PjlxRiqeJiH
	TsU4zMsGYYTUOOdAujWw5dVebx3kyXDeCN1inYebG75Yv37aJBlvha9Ls3V9T9M+gw+DuEJU+8SxZ
	1FPBI68aGdm+S3v11g01yjMJCNB9rigQxo5BI9/zzkRfE/59CAmiR+Z3oQJ2gt6/KurnIeX4+GfPC
	aYm8QlDKx1N/eImRG1EXTqY2XS+qohXvJmoM7+9+TvZfUcVSOujg5B61E9/RQOEbXajCo1YRW+Cib
	LPsrPEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLH84-0000000645Z-4AyN;
	Fri, 08 May 2026 09:04:17 +0000
Received: from mail-australiaeastazon11022096.outbound.protection.outlook.com ([40.107.40.96] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLH81-0000000644v-03Tk;
	Fri, 08 May 2026 09:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4Hj/zcTN+AM/VdiOc8MlaWLWy6ebKAQLKrnNmDAWQg8FTynxSDaYmv3ebfbKD0scHxceygKucpWfKgyv+VaVaoLFWqAEo5f6cHilH7mzqGHuQIEzeFxQJYCqf2WLCn7IbyYG3csP6MOBere5Z0XRjKiOHMRgaV1+LGxDgt6D241hNWlNgbizTjZLlB0QOTFk4z/ma3aJKnhwL81+RXr3U0OSZ12ZMSphFWhByCSRi/Q+JAj37glDqjGDFUKilBU2hhbzIJDxHixhz3VoolF0xSG0/2H58vo4h6+GPizK3GDQouW7Zmpf5VK5gfrEvcLH9UZVjLnDdthl6IAHyN2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91DnOEsESl9n56x9D1JdIK8tPvACUPqjGkRz4xX4jI8=;
 b=aa8KthnDZTE84ea80PZ9pIgsxxoP8aqbvqA9vtkllzG1ejOBlPkUsAJ4sFH0qt2k1wRx1IxmHXQSfcPKcHbPkubJRqmOJ/D5+F5vBxBSQZsToKds3wP14iA9VOuw18qKppS+J/z0DmiN2IClyPsYnk2csUbHM3xew4gBJdhUlIuPmdmTdGteKATDIhw7ejbEWeQxInG/0UxzCGmpjhgaeYkFXmhiteG1oGC2FxAJVeycJ1ZWV2h0UScFHbJlTykE+6Tso/zpbVpgJiuDd8GgL21KiDdzpm7cTMMJjt+hy0wJmkuFjZBKBYKlX23f6ra+yN5IMdb9p1uBfCRGjihumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91DnOEsESl9n56x9D1JdIK8tPvACUPqjGkRz4xX4jI8=;
 b=E8Rj3/fPCDTG0ZdZmI4YqeU5pRkOhg1o7rRyCAgvO8ze7vEWnPgodTglrYeXZsGUMdsl8X2IM1+WTpY8z1x8/ES4KrVlfXvnoXbKMln3q5XSpftj9eIfIseGGstbrpIlbQB32+Ptc9mwBvfcOi+qce12cGnMIt7Zg9lRA5Vv62GCedOz/2pXMiJ/fEYwdjSCd206AaVpgdS2L4dLH4JV+E4Z4k9hee46rtzFmiU3WEW+Dil2qwf/WEspJnWZpObMR1hP9DAy0igOgbh8sGaIAq8Ny+e5B3zHrUde+we4y/hDWzn2tfpYmw3icbZrPwKrMve0wWDhSyY83eUEO/Rx9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=symple.nz;
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by ME3P282MB1090.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 09:03:45 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:03:43 +0000
Message-ID: <dadd5c46-3486-43ea-be89-c7fe92e21d85@symple.nz>
Date: Fri, 8 May 2026 21:03:29 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
Content-Language: en-US
From: Simon Wright <simon@symple.nz>
In-Reply-To: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DSSP221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:3d5::14) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|ME3P282MB1090:EE_
X-MS-Office365-Filtering-Correlation-Id: a0186295-9a19-4c37-7159-08deace0b23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|7416014|1800799024|13003099007|4133799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: gGfDyeUtn3xmuUv0mlJVyt2SMbaN8WGyxn5HpBLuKW/TbMQr8sn6+pHwdYGtSwHqFOcWYqCmdttFqKWIcPKjI0iYIZNOeWZrVrf/y/qd4UPndEPI+iv8oTkmI3AQMC/O6Nw+/lY26OSPq38OqVD0ZWfrW+IFNjHyBNb19mRlnQM5kNM+CEjFrWdKxWtPfRF6LZhZPgm456y19ylTKvdww8YuJhoz/rUCenT90ctf631JTyI83+L3ALEaTJpE1mI6uv2qJ7I0LGVR1LnEXDQ7utCg32xxCa7iqAlxqxEPxBuyH0w60dY3x3ZmD28OWXfFkZnBcBmy5ENCnKkgolldNrE2siPwF/MwwKZdNu/xMWv91XtOifB24GoJoEWNAKEP3EwgtIqr6wACm8sk0Wzjt0tD9pMdfxYHW5eYFtNURk87Em9dMhRiHblDnoa6wBFp3BKLzdz9LsiSCn2Zml8JwRXtpyHJzD4fYKf1CPMy55699H4Vt7MUxW2E3IzEViegd3pjTCLLsRn5HuIytQoe8RhXBxMFnEnTHyRWQ1f8N+ffnLlCgMoWvTxl7C0Y1NCXBngalxW/jl7eTs8Y566OvXHtACw3w/N3fjdQ303AtUv/31vsbNF+hMSMJh6I1PCO/qHG+pQZpaNax8kb0mSm+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(7416014)(1800799024)(13003099007)(4133799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFBvbHUxTnFhTGw0cU9HbkRvTFpFbnpocm9aWGQ1a21xVnVFUjd6S0JpdkJL?=
 =?utf-8?B?cGFhdjd2TUU2QzE1QlJ0QUlFUFVwQktLR1VzWHJoL3FaMFliVkZpQ3BpNEtx?=
 =?utf-8?B?YnErajZpVnhMK1YwNVh1NS9aWFdvWTNKMm02Q1MySlJCL3ltdEl6TG9Db1dN?=
 =?utf-8?B?TE5samZKbUJacFpiclVvcytoUGhTcHovbHFKMnd0dTdGd2cvUW5qZ2d5MlZP?=
 =?utf-8?B?cUMvTldTS0NYUFpMdWQ0UW5EdllXQjR0ZVhKeDBEMEl2Q2dxTlJ5YTBCS28x?=
 =?utf-8?B?R2pweVNKUnBSY1ZaVllETDMwWHdQTkFqYnJwVllQSllXTzNiUTJ4VHhKS2E0?=
 =?utf-8?B?TlBkYUxTcUZSQjJXa3N4SmMwQkVQSkNQbExmS0Q1UjkvR1ExNHI0ZXhQSE4z?=
 =?utf-8?B?WFpIR3NXWHovbWdBRXEwQjE1WGlnWVBBcjh0VFFvQmJ1bmN5VUgwZTZ1N3dh?=
 =?utf-8?B?ZXR3WXhVS1BZZ01OaWJWMGNqNFhNRjh1NkpBL1B3UG5abkxpZmlIdGxpTWdr?=
 =?utf-8?B?Qy9xLzNlR2dXM3ZLODJWdDNHaWVUN2hPYlQ3SzRKYkRGMXkxMlErQ3FxYm9k?=
 =?utf-8?B?c3I2SlRhV1RSeUVSaSt0anZpWkRoRzNXYjVhSXo0Mjg3WTJqTHYxZE1QQVA4?=
 =?utf-8?B?eFpzcUc0Q2I3cld0RENRcnB0N1FzMzZVdzluM3UxMEZucUNiTE5SMlJGMnpj?=
 =?utf-8?B?bndxRXJhTU9vZGI4bDZJbGNMVWs1c0VITDdPdFlSanU4dXlmYkIxWlZhUjRm?=
 =?utf-8?B?b1luWW1Zc2FVRUxMU2lMUC9ueUduWU5CR05QYyt6aFNqOWhoSlBwelI3VS9S?=
 =?utf-8?B?ams5VGxIUEdqVGlxOFpSQTYrVHRYUmIyMUIvOG5tMkcwL1VlQkJTR3hoczRZ?=
 =?utf-8?B?U0p5ZVNadTcxaDdTN0RVS3drVmsvOEdMby9oSVFpT1ExbFFNdERHUGR2ZThN?=
 =?utf-8?B?Q0FpbW1mNVdiRHRWS3FxeHpBUEUyTlJZcG1PVXUwQUxQdHFBTy9RWmV3ZlMx?=
 =?utf-8?B?U0QzK0YrZzl2Vi9rNS9nNEVEaHNaRm1JQ2p4eitRWkthK2FJNFEzbDBaYS9C?=
 =?utf-8?B?MDhmU25KK0VndjZNNU9CZjgxMnQ3SUNudHRROFpXVEJ5ZzdZa1RQRFZYZnlu?=
 =?utf-8?B?S1NjMGR6YitWanN5RFljOGhrRXhhd3ZWbStoYS9XS29WZElkZGNPY3hNM1dy?=
 =?utf-8?B?Z1V6VThob2lZSTdsZFVTZEI5U2RQSWhzMGcrZ0U4ZGZMaTJ2eUdiUm9jb0Z1?=
 =?utf-8?B?Tit3U1ozMkMxcFJ3dUZ5SkJybVpvazhka3Ryd0xpeE9OUVVRL3c4RVZQRHdL?=
 =?utf-8?B?QVFPdCttaTBEZ0VGUGRjOXJLMVpUYUNWVEJMU2xrN0hIcWt3bUpRTStGU0RN?=
 =?utf-8?B?ci9vc3ZQOUdpSUhISWxYaDhvdTVrSVI5ekdjY3hDYkw0TWZDWlFUUWkzY3ov?=
 =?utf-8?B?TmZCS3RZMjZvUFhrbVQ5YlByeldNcUVhUkZaZmJEQlhmYW5hTzRDa3pEVTNj?=
 =?utf-8?B?UlJ5a3BTRUNaSEtvc0RObnROTnZiY3ErOTd2Z3pSVms2MklMNENvQWUvUktz?=
 =?utf-8?B?Tm0yUmszNzkvd1RGS1Rsd1NOUGU2ellISEpXM1VPblhKS2NITFdzWFpGVEZw?=
 =?utf-8?B?VGl6MkYvVkZacUdybmFwbEdoS2JFRFBnZzRsa1ZtLzRyTHd6cUpUeGdBcnBv?=
 =?utf-8?B?UGtZZlg3TGFPRWhBQ080dmVjQ0J5MnoxNzJtZDRob0RES2VTdUJWM3RVSXRs?=
 =?utf-8?B?QXh4cHBmL3FWMXNjYkdVaTM5c2dadCtKZkFtV1ZmY0J4bUNXZzJWNFJnb2R6?=
 =?utf-8?B?S2QrSE1kQ3JxS0ZWOXMxdGgrdEpIOFdFSUtlMXZjakJHQ2F0dmlTY1ZvNUFn?=
 =?utf-8?B?d1g4UGVWRU5BMXh3dDk0MkRiRUsyM0ZTYklzdnNZR1V6K1lETUkzUEpER0FL?=
 =?utf-8?B?cFZaTSs4Q2lpYytndlFaUU16R3ByUVp4L3V2eVIzNEsrRGhhcU1ldUVvZEdh?=
 =?utf-8?B?anB4OThUeEV6VW9sTzMxQlB0cmR2alVKV2NhRklGWkpacVlWQ0x0cU5nc2JV?=
 =?utf-8?B?RXFnemZPem5PcHVhNzQ0YmFHd1MwUTJlTEZpOVc5M21kT3BXY2ZaUFJiUkli?=
 =?utf-8?B?R2N5cGFOaXFvOG83ZkNsODFja1dLekZLTGw5RUg2dmZmY1RCY29SZDhFaXZp?=
 =?utf-8?B?OVk0ZUFXQUZ4SDBNLzNZTVpOaGdXemtpT3pMbjJzNXpDanZObUxnaDB2cFMr?=
 =?utf-8?B?a1RTcVhFQnJRTXdBQkQzRUg2SUtiUGVrTzZ2TkxHN3dPV1JubEMzaTc1ZWdG?=
 =?utf-8?Q?6gRj/YP100EbFgs1Nd?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: a0186295-9a19-4c37-7159-08deace0b23e
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:03:43.4876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lbYmswGYhO17NxiJuHgHKxS4NL/ha/FLrfm5LbNl5gsbjZ9TH7C2yCyzjLmgGp4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB1090
ln: failed to create hard link 'reaver_cache/prob_good/20260227_124856_768935_57D7D58A': File exists
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_124856_768935_57D7D58A 
X-CRM114-Status: GOOD (  21.16  )
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

Tested on R76S (RK3576) + LG G3 OLED at 1920x1080@60 bpc=10
(tmds_char_rate = 185625000): phy_configure / phy_power_on /
atomic_enable consistent end-to-end, no rate recalculation drift.
Matches the cover letter behaviour.

Heiko, Vinod -- any chance the series can be applied?

Tested-by: Simon Wright <simon@symple.nz>

Regards,
Simon
Symple Solutions, Dunedin, New Zealand

On 28/02/2026 9:48 am, Cristian Ciocaltea wrote:
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
>
> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
> calculation and synchronization issues.  Specifically, it fixes edge
> cases where the PHY PLL is pre-programmed by an external component (like
> a bootloader) or when changing the color depth (bpc) while keeping the
> modeline constant.  Because the Common Clock Framework .set_rate()
> callback might not be invoked if the pixel clock remains unchanged, this
> previously led to out-of-sync states between CCF and the actual HDMI PHY
> configuration.
>
> The second part focuses on code cleanups and modernizing the register
> access.  Now that dw_hdmi_qp driver has fully switched to using
> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> and the restrict_rate_change flag logic.  Finally, it refactors the
> driver to consistently use standard bitfield macros.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (6):
>        phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
>        phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
>        phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
>        phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
>        phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
>        phy: rockchip: samsung-hdptx: Consistently use bitfield macros
>
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 215 +++++++++-------------
>   1 file changed, 92 insertions(+), 123 deletions(-)
> ---
> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
> change-id: 20260227-hdptx-clk-fixes-47426632f862
>
>
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: <linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFFEFEFB51
> 	for <linux-rockchip@archiver.kernel.org>; Fri, 27 Feb 2026 20:49:16 +0000 (UTC)
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> 	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
> 	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
> 	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
> 	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
> 	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
> 	List-Owner; bh=Ywd4nVTaesoZ9f/oRKu2xquW31o52EzvH6PggS2DIuY=; b=j/lxIwygT6ELX9
> 	QE4bInNEKLy6Q4slo+6T/r/kAeI+wNaYkSzqgLXJEscAMQtrus+adIdPOaL7GZ2IkbAd8RcVdU4j9
> 	uX5XMp7/ITC/8tA/4fbQMpj+0DiQJuSOe4mfEMQx3v7hnsb1kiFYgQWCOdy6U/zr6RtAlrrVa5WtH
> 	xu9XxBU9eqvpRmEAFS+fCZgIeb2lMqXHZ4NA4/pQLDEGN43Z4/owzoVcuqgbGjCvC9c4VfUrqUrSA
> 	tj/YDJr0SNYK4ZOKt1sVO78NRvcFhkl8ChuuV/iO5wrS0w565H6YGiFuJh1kQAYaFkwG7+Zn8DNF5
> 	fFppXc21VbuPRSwYyI+A==;
> Received: from localhost ([::1] helo=bombadil.infradead.org)
> 	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
> 	id 1vw4lg-000000098cW-05gk;
> 	Fri, 27 Feb 2026 20:49:00 +0000
> Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
> 	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
> 	id 1vw4lc-000000098ZS-2DwJ;
> 	Fri, 27 Feb 2026 20:48:57 +0000
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
> 	s=mail; t=1772225331;
> 	bh=bUeULh1bnVKovxRmlxehE6KS7aqNBCqPFyvaWOEsoaE=;
> 	h=From:Subject:Date:To:Cc:From;
> 	b=ekEaWw1uHuEz0iWpTlf7zG60N1dzqsUimUI0n7bx/xvqftKi5TS1D3FCMNmggdH15
> 	 nip240uzI3bC+sOV8/OHY8BKzO+U3KESiaX+LJuDTU5hdz/nyF19JOtVbOpEUwy2H2
> 	 nFG6mRz4JB6hSMOKVCGAxx27/gF8KCMaI21JIexzBmepPZApw6kf+9mFzcd2NqJPpe
> 	 kLTjON2UczI2jLr009ZWvx9fb2AVXa6s6axkOohMwRy+ggic0yZzQ7Pxjjdm6IZqcQ
> 	 ZtkEM8UHO29BkkEAX61miqbj6HTB7BAWlet6Q1SF2oqLc452ZSEViEuj67tw8dzuBz
> 	 E7iPV6xRgfL3g==
> Received: from localhost (unknown [86.123.23.225])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
> 	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
> 	(No client certificate requested)
> 	(Authenticated sender: cristicc)
> 	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF4D717E0E67;
> 	Fri, 27 Feb 2026 21:48:51 +0100 (CET)
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Subject: [PATCH 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
>   transition cleanups
> Date: Fri, 27 Feb 2026 22:48:44 +0200
> Message-Id: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
> MIME-Version: 1.0
> X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBuoSTS6SrSIGmsoTDRCCO+et
>   Hx8/guRg3CEoXoh8CNRLlfQ1hUs++w2RlmLgRrSDZHBffV3wuU80EriiMoo0roj22uCcvnAfyj
>   TOOX8AXle+u9hAAAA
> X-Change-ID: 20260227-hdptx-clk-fixes-47426632f862
> To: Vinod Koul <vkoul@kernel.org>,
>   Neil Armstrong <neil.armstrong@linaro.org>,
>   Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
>   Dmitry Baryshkov <lumag@kernel.org>
> Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
>   linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
>   linux-kernel@vger.kernel.org
> X-Mailer: b4 0.14.3
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3
> X-CRM114-CacheID: sfid-20260227_124856_768935_57D7D58A
> X-CRM114-Status: UNSURE (   7.77  )
> X-CRM114-Notice: Please train this message.
> X-BeenThere: linux-rockchip@lists.infradead.org
> X-Mailman-Version: 2.1.34
> Precedence: list
> List-Id: Upstream kernel work for Rockchip platforms <linux-rockchip.lists.infradead.org>
> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
> List-Post: <mailto:linux-rockchip@lists.infradead.org>
> List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
> Content-Type: text/plain; charset="us-ascii"
> Content-Transfer-Encoding: 7bit
> Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
> Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
>
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
>
> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
> calculation and synchronization issues.  Specifically, it fixes edge
> cases where the PHY PLL is pre-programmed by an external component (like
> a bootloader) or when changing the color depth (bpc) while keeping the
> modeline constant.  Because the Common Clock Framework .set_rate()
> callback might not be invoked if the pixel clock remains unchanged, this
> previously led to out-of-sync states between CCF and the actual HDMI PHY
> configuration.
>
> The second part focuses on code cleanups and modernizing the register
> access.  Now that dw_hdmi_qp driver has fully switched to using
> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> and the restrict_rate_change flag logic.  Finally, it refactors the
> driver to consistently use standard bitfield macros.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (6):
>        phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
>        phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
>        phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
>        phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
>        phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
>        phy: rockchip: samsung-hdptx: Consistently use bitfield macros
>
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 215 +++++++++-------------
>   1 file changed, 92 insertions(+), 123 deletions(-)
> ---
> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
> change-id: 20260227-hdptx-clk-fixes-47426632f862
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: <linux-phy-bounces+linux-phy=archiver.kernel.org@lists.infradead.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D410398AD
> 	for <linux-phy@archiver.kernel.org>; Fri, 27 Feb 2026 20:48:59 +0000 (UTC)
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> 	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
> 	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
> 	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
> 	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
> 	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
> 	List-Owner; bh=c324XN03PoA1rraJ+VV9Yfc0lnX3AkSpF9xHmfHI2Uc=; b=aTzKex1omAyuFL
> 	6ssxrkQBX8aNauOphSMRtLUHi7gaYYX8hBEmLsN3BQpo2//ODwY72uHzTo0s682gBT+6OQK42ltgf
> 	7rkCcxaIcVIuYIOMyD0cwGdVTVB4zXapp6g9uTVDlwKBJmJeTRWJFJFTPr0X4L5E2tzoZ+3H3yNzR
> 	kJqpmj9lVVE5UDflVckhQhImOTJdXGyqxptH+Yz2qZijDxp554oddwvnOAii/xKkAQv4nwS23h/5R
> 	CrPiaPT3d0/Z2mtZbkl7rqYarf3D+Qg+Pei5yOAuVw3DTlocsu9nEpM3+biDUT7yO2T0N5c4Lq8yy
> 	BNVFkTqRDzWU+QPFJM6A==;
> Received: from localhost ([::1] helo=bombadil.infradead.org)
> 	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
> 	id 1vw4lf-000000098bn-1y20;
> 	Fri, 27 Feb 2026 20:48:59 +0000
> Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
> 	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
> 	id 1vw4lc-000000098ZS-2DwJ;
> 	Fri, 27 Feb 2026 20:48:57 +0000
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
> 	s=mail; t=1772225331;
> 	bh=bUeULh1bnVKovxRmlxehE6KS7aqNBCqPFyvaWOEsoaE=;
> 	h=From:Subject:Date:To:Cc:From;
> 	b=ekEaWw1uHuEz0iWpTlf7zG60N1dzqsUimUI0n7bx/xvqftKi5TS1D3FCMNmggdH15
> 	 nip240uzI3bC+sOV8/OHY8BKzO+U3KESiaX+LJuDTU5hdz/nyF19JOtVbOpEUwy2H2
> 	 nFG6mRz4JB6hSMOKVCGAxx27/gF8KCMaI21JIexzBmepPZApw6kf+9mFzcd2NqJPpe
> 	 kLTjON2UczI2jLr009ZWvx9fb2AVXa6s6axkOohMwRy+ggic0yZzQ7Pxjjdm6IZqcQ
> 	 ZtkEM8UHO29BkkEAX61miqbj6HTB7BAWlet6Q1SF2oqLc452ZSEViEuj67tw8dzuBz
> 	 E7iPV6xRgfL3g==
> Received: from localhost (unknown [86.123.23.225])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
> 	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
> 	(No client certificate requested)
> 	(Authenticated sender: cristicc)
> 	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF4D717E0E67;
> 	Fri, 27 Feb 2026 21:48:51 +0100 (CET)
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Subject: [PATCH 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
>   transition cleanups
> Date: Fri, 27 Feb 2026 22:48:44 +0200
> Message-Id: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
> MIME-Version: 1.0
> X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBuoSTS6SrSIGmsoTDRCCO+et
>   Hx8/guRg3CEoXoh8CNRLlfQ1hUs++w2RlmLgRrSDZHBffV3wuU80EriiMoo0roj22uCcvnAfyj
>   TOOX8AXle+u9hAAAA
> X-Change-ID: 20260227-hdptx-clk-fixes-47426632f862
> To: Vinod Koul <vkoul@kernel.org>,
>   Neil Armstrong <neil.armstrong@linaro.org>,
>   Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
>   Dmitry Baryshkov <lumag@kernel.org>
> Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
>   linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
>   linux-kernel@vger.kernel.org
> X-Mailer: b4 0.14.3
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3
> X-CRM114-CacheID: sfid-20260227_124856_768935_57D7D58A
> X-CRM114-Status: UNSURE (   7.77  )
> X-CRM114-Notice: Please train this message.
> X-BeenThere: linux-phy@lists.infradead.org
> X-Mailman-Version: 2.1.34
> Precedence: list
> List-Id: Linux Phy Mailing list <linux-phy.lists.infradead.org>
> List-Unsubscribe: <https://lists.infradead.org/mailman/options/linux-phy>,
>   <mailto:linux-phy-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-phy/>
> List-Post: <mailto:linux-phy@lists.infradead.org>
> List-Help: <mailto:linux-phy-request@lists.infradead.org?subject=help>
> List-Subscribe: <https://lists.infradead.org/mailman/listinfo/linux-phy>,
>   <mailto:linux-phy-request@lists.infradead.org?subject=subscribe>
> Content-Type: text/plain; charset="us-ascii"
> Content-Transfer-Encoding: 7bit
> Sender: "linux-phy" <linux-phy-bounces@lists.infradead.org>
> Errors-To: linux-phy-bounces+linux-phy=archiver.kernel.org@lists.infradead.org
>
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
>
> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
> calculation and synchronization issues.  Specifically, it fixes edge
> cases where the PHY PLL is pre-programmed by an external component (like
> a bootloader) or when changing the color depth (bpc) while keeping the
> modeline constant.  Because the Common Clock Framework .set_rate()
> callback might not be invoked if the pixel clock remains unchanged, this
> previously led to out-of-sync states between CCF and the actual HDMI PHY
> configuration.
>
> The second part focuses on code cleanups and modernizing the register
> access.  Now that dw_hdmi_qp driver has fully switched to using
> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> and the restrict_rate_change flag logic.  Finally, it refactors the
> driver to consistently use standard bitfield macros.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (6):
>        phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
>        phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
>        phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
>        phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
>        phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
>        phy: rockchip: samsung-hdptx: Consistently use bitfield macros
>
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 215 +++++++++-------------
>   1 file changed, 92 insertions(+), 123 deletions(-)
> ---
> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
> change-id: 20260227-hdptx-clk-fixes-47426632f862
>
>

