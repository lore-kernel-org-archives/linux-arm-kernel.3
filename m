Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913D9C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R37rfSWOT35+z4ZnM62MFRlgFqjVOW3UhO2w/dY/28Y=; b=oW7YwNOlNeH4G/Pd9jtKGMWv4h
	HCa/BFemim+rc6dnnvUFSkNkHUKysB8Ggc5tAIl3+u2RCFlbcrLqckYVeMl5FlBOG0rtDd+76hBCd
	TebKHdA0uTjsGQyyI/s02jQ0qWCfeDoxeaXJoBCBz0L3fvUhcyLb3ObN3tYHISMbLyVVC80wL2/WS
	ajTjv//kAijjRASQtqxQ9ZNnKL58PprrNPNT8S0ZivvNZ30BFunigiNxyjX5u9dD6CK89Qz4SoMhK
	iyVsSLUmV21E2RT1E/0+BBW3wNmOPl3IkGEz1V+UhJFvYlGduogj8ZLg9pxgCB09fRzjD6snDQuGe
	2oWGKegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFku-0000000AFs0-1rUd;
	Tue, 21 Jul 2026 19:03:52 +0000
Received: from mail-ukwestazon11021105.outbound.protection.outlook.com ([52.101.100.105] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFkr-0000000AFrc-3OQj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwzl2aXY/SuY1Lcc2hu7v+IutqqNNhhKb9lVlr35ws7jQzcKLl8DO4Ss211/jS39+E5m7sWHF2TetE7BVnPkY5TmDmDN9mFki8iZ+sKdmuWt8SPg9DGS40RQjl3WkYvpW349IKpgy3WTYgjCGv9o5Alr4JbvZNlF3WVlKunducE9nTtL7b74xYPQMc+oUEPUS2TyK7sYpVA6j6nHKi+NZTKkygqyjUv3rPattlVv9jqvYkw0NNejktoMqAQi2VTXGpn/yDfNVpa7aGXF15xdJeYc+78cbxtwPWjk6dHcBSnj+2wXDVH0fw6+3+C3ZIg4O1JHv8+UvhhMMB+vyrltXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R37rfSWOT35+z4ZnM62MFRlgFqjVOW3UhO2w/dY/28Y=;
 b=bhDKzz8+G0Og3zdcYqxVHr78Q0lZ6JlGy20kvTnCvaOIUkHNfaS9J6SR5KOfYwLIaCXGZiPsr++DVJM1B6gMxzYPG3PXOg0iF9OXeTKufqpTGlQX5r5BVdgrJOxaXFG0vaaoo03DkITWBOi6jn41I68KJdV8P9IdBLQeulmmXKSwg5HlgG7CqvKR/zVdGtRlxzKpv/Ap61fTUEMA9jltHe0PaNTzL4w5XvxHco25lFChBEwkGdXd0brbiDDJaGFJyH+UZaTNsob07YIFqKfxw3KqcnRwQM1xvUB/4oFuZq7r0SD9boKSRWmgDoaEJEXHbBCGp5ViMP3UlZ0ilwzexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R37rfSWOT35+z4ZnM62MFRlgFqjVOW3UhO2w/dY/28Y=;
 b=O+sgyg1T3enGdX8uZCd5MDtLL0PXbKsuaUbCl2ajIM2c+UAFXvlGPCwwj0yhUsMzDkSaCrh6PRQSA4a+GwA0lBvu1dz9neFrVpKUd3TyhvM2S1z6gIeJHsn6FIhYJqrE7LYUx1xCO//bD5M+XVuLXWn5yX0jdjaSfbQc3p5sixc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO8P265MB7767.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 19:03:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 19:03:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 20:03:42 +0100
Message-Id: <DK4HE3FGL1IC.1ISUZNYRIVVQL@garyguo.net>
Cc: "John" <therealgraysky@proton.me>, "Daniel Drake" <dan@reactivated.net>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Thomas Gleixner" <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712
 broken EL2 virtual timer
From: "Gary Guo" <gary@garyguo.net>
To: "Marc Zyngier" <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260710080958.491620-1-maz@kernel.org>
In-Reply-To: <20260710080958.491620-1-maz@kernel.org>
X-ClientProxiedBy: LO4P302CA0026.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO8P265MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 28057250-e98a-4e8e-b40c-08dee75ac85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|56012099006|5023799004|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XksSIrXznJeI985ItYGuvroznJKPY3ChisJ518w2WEbCByREJGVrDG2O9MIFb4CVD/lD65YP/7QFeVr5w5Mv+gXh9g3qOqgZ/QOvdIX9tkaxhh7HWPj1bFUfHltZZGNeg7qDSwDRCB1k75xVES5Gm9MpuLzUtpWiW9dVt07qkzdgRV2kxKLRmey1o1sshHaZJBCWFjubR+ce5DtCm42UxzDLVCkAtTrRMKNratU1ztLgE5t/RhZlfhUomkQd6Xn/4t8E0uZ5og+lBiEvwFi5KU0J8C5AFokLOwOXotcbOCH2TdmDMoe/3pX1+JWZ6BF+sxC2I1cjmezTFI634vhEABwvkUKtJnZCNOr27TcjOqehMW1nJb3gZ3kLic7PHeb1aNplD/1J6jd9ulmyNWyq2AnPJsQhPGXJJ3/ap8LW82G4Mw7ivcih7NK9D3D9j7XU6Llfchr2I5CAANh/rSbWOy3EDv1LpRhPig0ddSUxfznE3Gw0jiVBdgBhgKYWjjnPnEh1jdwMVkU0r1J2IrNll3ByObLSLkMRG/e67iU/cNEKbKm1YDh6WEePyaYXxKYaRYWYKT5LSglH6vr8WX5jU1RhgfotPaUEpfCCEe48t5ACDaZ/13acWb+kbXrGb29fUYbGo6PVGOhqVbpXaW14GqHoH7iUcQUhSTFdT2KIL7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFqRzRqdHFDOUNVOU1YYzNZbC9teDczeGliUXVQZjhmNkFWQVhqaEdiaFBo?=
 =?utf-8?B?M21GTHJvclJneHhZN3FDTHNGb3lDUmQrcTBLTlZzRDI5cDFyL2d5bEJVUnFU?=
 =?utf-8?B?MUVrSG02aWtuYlRBY2RkWCtWRU1TY3VUZm80ZjE0T2t0eVZyYys1RlkraUQ3?=
 =?utf-8?B?bXVuMjlPRURtUVFBdXpjMlZ4UTRkYmlWQ1VKWSt5SXFxOWttZEZIay9KTUZy?=
 =?utf-8?B?RkVTYStBeVNLN09ubEt4WUNwQkNqOXI0dUZJUlA1d2RhNmdtMmdOYlM3MkRH?=
 =?utf-8?B?czNKNUt0TXZsOXZCZ1BrbjhWaTZwWVh5OWxOK2s3QmFmenV1NWViVGlkYmJi?=
 =?utf-8?B?TkdnLzFCaG1zZ1FBRkFaVkhmcm90QXBLLzNLVkphWG5qaUpxcDQ3Nm1YSGYw?=
 =?utf-8?B?SGJkcXBKZTU3dWI3VXkvQ21MMlljUExsMkJYdU1Jc3gvVzR1ck03YlJib0Zo?=
 =?utf-8?B?UDVWUmg3d1dVMzkrcnNiSEI3OGMzbU8yNVkram5sRmJrTnRtWGlGSm1rU3hk?=
 =?utf-8?B?TXJaN2pEMHl5Kzh0am1YUmVEZjg5STNBcnB3ZHNocFg3RkxkcEFJb1NBNVJm?=
 =?utf-8?B?VWRYVFZheHZQN3FzSkdsUEI5SGorZTNMUHpiL0twYjdzWnA5anFaNlkxeG56?=
 =?utf-8?B?RjFCbTV4bGtHSkx3d1F4VVRZbysxVVhJMGQxQmVXWnRwVVRNUjg0cjh2OEpO?=
 =?utf-8?B?TEd4T1lQVCtZcmJHNzFsaktGSW9peGl3N3NUVzd3bHZsTDhpVWtyY2NHWDJR?=
 =?utf-8?B?RUxpclRPT3J3WUM2MUFFNDBpZ1R6ZzUxY2tjREdGNXJydlN1WkxCMDMxbEhr?=
 =?utf-8?B?YU9wUFY2UFFHV1Q5Vkx4cHVNWDFXNUdURFBNSW5jUTRXbFMxWkd1cmlPSmdP?=
 =?utf-8?B?UmtyUzZKQmJsMXdkRVVRR29hd1l3djJFWnM0RjJpM0Z0QVhYc2hhR3RzV0gw?=
 =?utf-8?B?ZXNyamNkd29yN3gxMWU2a1R6amxZUURlVy9RMUNuOGZxSmVId0ZMVEtKTy9J?=
 =?utf-8?B?WmlRNDJaV1N2Q3ZLQXhhK3JhZm9qSDdhNG5UdjBTUG8yN2dCby9yN0cycThn?=
 =?utf-8?B?QSt5S3RqYzVFbEsybk9Zcmx5eUkwT2w4L0NJRG9qeXc4SFdnTVE2MEJlRldI?=
 =?utf-8?B?ZVV0SWo3YmpGSUQrRTd4cldoanpwWWZOT0ZUSjk3clpxNm1TWGZrQm94NGRa?=
 =?utf-8?B?aUN3WHB0eWczZVVHdUs0UFNKUUZtVjh5WnJFaWhIa0crWW9makROTndSNXZk?=
 =?utf-8?B?bTV6SDF3MmNSL2Z5QzJqb1BzRmZFcDNpWHNBNnlIM0lZRjhFR1AvSGhSUzRU?=
 =?utf-8?B?R1Jaakk5c2tyOVFBc2lsM2M2RVUzM1dFVUpQU2NaaFhtYXdyM21kS3J0UU9o?=
 =?utf-8?B?Q2J6Y2YwMVlXQXJYcklCNDEzOVNaMGFjZC80Z082Sm1ObDFlSzhCQm9yNENv?=
 =?utf-8?B?S0FpZmF4dDBGOThTVG1wNnpoc0xESEdadjBROUs0UFhlbStpc1U0ZU56cE85?=
 =?utf-8?B?K2dld3FJK1lOR1Bnb0M4dU8wR0RSeHV4Ky93bk0vRnlKVXorb0drZkFQcHJH?=
 =?utf-8?B?RzV0Ky9LSkdHMC9tenExUmQ1REpOM3NIL0FwN2JRMDR1Qm8vVHFSUThGTjZE?=
 =?utf-8?B?ZkNFNGZDTzlpWDZxTlF2K3duTVhGU2NKeUUxeDIvUHV2S0Z2bjkvVFhCSmdW?=
 =?utf-8?B?eWM0SGdnMENOOWZoZGYrckVpSXNjcVZ4b2k0alVnd3hNYkxkaFQ2NW1GdDNm?=
 =?utf-8?B?MmQxZTlqRkYrR3pJTnpBR2ZISFZPb2RJZVFQN0hZMVZUcGIyL0hCUlIyaXJV?=
 =?utf-8?B?YzZjLzB6OUZjTTRRUlRIcFZwbWZRRGRXdzliWSs2d2VkNENqWW9mRFRvUFBw?=
 =?utf-8?B?WHZQTkN5eC9rYWNUVVRYc1FSaWpnSGYwU3JXeGtOd2VlOVY3Rk9EdGJiamdl?=
 =?utf-8?B?cEhHdERGUGlzYUJITnI4em81NnMvVW9zSmpnQUY0Sm9jbHRya1dvcG1IM0JU?=
 =?utf-8?B?OGN5ZEJwblF1RnJSYXJqY0FoREtMeitiTHZoSmlubG1NRFl5Vm4yS3BBNGRX?=
 =?utf-8?B?ZDI5TktiaWRBK3pFZ3duTWtYVzVPN0t6dlE1N3FKTW1va1B3Vll2eDBhd2wv?=
 =?utf-8?B?aUlLSGVZUytrQkRnblJDOE4xN0Z4b2J0L3NNVXJpRnRGSXd0SWtRN3ZTYk9o?=
 =?utf-8?B?SHkzMVZYWUlTOXRtSmtMbGcyTUo3SjV5U1c3bnlnVUtJaUQxeEptQVJVTzVG?=
 =?utf-8?B?endyajEvZitRZmZRc21DWW1jbU1IMzhtWWRQZUhHTGU2QlA2OERiOTVZNGFQ?=
 =?utf-8?Q?nAw6zJUdwNeGPuxC5h?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 28057250-e98a-4e8e-b40c-08dee75ac85d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 19:03:42.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pcKRjAJ5XKlTi27h6vql634pA3tuBtaxK96xYRNIN5R0zgudHomLoEFW38BU0Hju7OhYXQnOMd1IEiBNu2zjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_120349_849775_9B7C2D6E 
X-CRM114-Status: GOOD (  26.58  )
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

On Fri Jul 10, 2026 at 9:09 AM BST, Marc Zyngier wrote:
> It appears that the bcm2712 SoC found in the relatively popular
> RPi5 has a broken EL2 virtual timer.
>
> We do not know the reason why the timer isn't working (the timer
> is ticking, but the interrupt never fires), and the SoC vendor
> doesn't communicate on the reason why this isn't working, leaving
> users and maintainers in the dark.
>
> Paper over the issue by detecting the broken HW, falling back to
> the physical timer instead, and let the user know about it.
> Also taint the kernel as the machine is definitely not compliant
> with the spec, and we don't know what else is wrong with it.
>
> Reported-by: John <therealgraysky@proton.me>
> Reported-by: Daniel Drake <dan@reactivated.net>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mark Rutland <mark.rutland@arm.com>

Tested on my RPi 5 and this does make it boot again

Tested-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
>  drivers/clocksource/arm_arch_timer.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/a=
rm_arch_timer.c
> index 4adf756423de9..7b4a98df6962b 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -1090,6 +1090,27 @@ static int __init arch_timer_common_init(void)
>  	return arch_timer_arch_init();
>  }
> =20
> +static bool __init has_broken_el2_vtimer(void)
> +{
> +	/*
> +	 * SoCs described here have been found to be broken, though no
> +	 * explanation has been volunteered by the vendor. Let the user know
> +	 * we're papering over the vendor's lack of communication.
> +	 */
> +	static const char * const broken_el2_vtimer[] __initconst =3D {
> +		"brcm,bcm2712",
> +		NULL
> +	};
> +
> +	if (of_machine_compatible_match(broken_el2_vtimer)) {
> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> +		pr_warn_once(HW_ERR "Known broken EL2 virtual timer, ignoring it\n");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * arch_timer_select_ppi() - Select suitable PPI for the current system.
>   *
> @@ -1115,7 +1136,8 @@ static int __init arch_timer_common_init(void)
>  static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
>  {
>  	if (is_kernel_in_hyp_mode()) {
> -		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI])
> +		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI] &&
> +		    !has_broken_el2_vtimer())
>  			return ARCH_TIMER_HYP_VIRT_PPI;
> =20
>  		pr_warn_once(FW_BUG "VHE-capable CPU without EL2 virtual timer interru=
pt\n");



