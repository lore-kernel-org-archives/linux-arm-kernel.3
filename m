Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0035CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTb8znVohmtZFCwn9Sqrd6v8AwR+X9WEr6QdFg4SbiI=; b=rP4DgDUUyQexa+RnOWLk8A/joz
	i4sFqPdZnUtKWkPrEdbFreJjtWDz+4PUntobJ7ajCbmDp2HVfIVVqWpRPgFxTAbjGgFApbpxVO42x
	e6f+r0r0iOK1BolyNoljmSftwHhjJyeHMUw8TmC0lklRqiZ0Z9fA2kxGo3biGBaL+ErA0Gkq83FWc
	qSWX2qDO5WEcrifsUUVsaqqiyvMQ9cYs95nZGDnda9vlFSGi8kAct+fVodGFoL3/f7nYrsu3XioYt
	xBCoe46KPNCVk856vO6jW3gkscD2tvKUZjWJWAe+oehc0q8w4SbUB7Mn/JxduKQuX4tOdLFEdMaX0
	+GC5xrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSmT-0000000DZg4-3c7X;
	Tue, 02 Jun 2026 17:19:57 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSmR-0000000DZfR-1F2t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:19:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN57ZUEZrVqEeoA5bChxxzoQ7losTILSR1Ld1XwWxs7AZSVsfNZ76xIc0lF3LY43IW9Tt4JM0QMCOC+xk76mjCF6MxtfFRbbT9tW46OaOTyTkQcl5HxnXoek8nfYqqzEAIJnRfxVoKxs6lQyuSnoAfL2v6P6IL6GaYJ5OBnh5N5aSsN6YfXvTn+yYnv0vpE8M0uQXu7SsQCBPm1IPzBdDHRwy9hPxrByt+KzS6W6p/q/L1UdwUo8ctrqQ4qRsoMGijwBXdL3UPfLOcBi+M/G9a6Z9JjmQ8ecUMIHZ3dRlHYsGw7tLWsRs9qCGuB7HctsYPMHpc4YO5ww4lhJoB7+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTb8znVohmtZFCwn9Sqrd6v8AwR+X9WEr6QdFg4SbiI=;
 b=MEUopYTTfQ/TbOqKmX8jmzKgOmdcAptk5zyrUvjZlJSfMOSs06vMDKk4lGDW8PFFhU3q77zyW+t7Pi3mkRY50q5XJ5G7nkw/m/x6QthqMw7+DNLHaI9OkhtsCerj4RNJL5O8wmy0EQRPt5XEKMmS/sQq6Z8wMswLLsf+vzFS26crSKA3uLafufkBx7vGV16XSpi2zeEY7dWSXQO+eux8FrM5i9Tpal6MFTmLBw1wa3v/avMh90syRWqQ31+Su646jqdrNh+/Vg2vlh0/0pGFrG0WkkhDHeHoFxTaZYpq9Qd+hJVgkz+JFwybE3EaNBv0tJaZwnEoObTy+J7FJ7hu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTb8znVohmtZFCwn9Sqrd6v8AwR+X9WEr6QdFg4SbiI=;
 b=ajlY7ZqwP1kntEPxiO5SGiBgZET4ncUQIttFqC635ylYfCmNHVhNdVyGmTMsKSTdNM6fmSNcuKl3EJ9ki8VJZ/Juv/N7yS8J32dsT3v9zodmVUuzuB01Gx+RAELLCOM08khyaS6vRLqzWekdYFJwKTXMxQ4YA8N5zHDY/kZ0uUczeM6AE94SYer9HHwjVJQwgRW+glTgvLevuJxZGYKrRG/vAVr3vqIBeS8uUUAQUefo1p7NgxIDGzJFxPuSVKzg06tla527uBk33YRmdObSODV6HZO1hvzt2E6TBG9fwBi5MaSPuiC+dysEJGcjd4T8yN5qUrQhwfFE2DjJE9eueg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 17:19:48 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 17:19:48 +0000
Date: Tue, 2 Jun 2026 12:19:44 -0500
From: Seth Forshee <sforshee@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firmware: arm_ffa: Fix RXTX_MAP buffer size
 regressions
Message-ID: <ah8QsECNLte8sHib@omni-lfn-logwh>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260602-fuzzy-adamant-catfish-3afaeb@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-fuzzy-adamant-catfish-3afaeb@sudeepholla>
X-ClientProxiedBy: MW4PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:303:b8::7) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb16863-1f7a-4066-3ae9-08dec0cb2632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: KofbKHxoRqosYUt0FD+XFap9rrLw4F1nkmlpi5+GwtN/pqhk+u62MUca4GMuUCebehn6I38M74JHr40KxP2gs05M4XdMsQx7r9Mv58Ziyt9qNG99zAu/ZRNLrDc76O+b8f2IRtpvcXDxtRRBweALKygM41d+D4S8OfwGdUdbgfJh/s8tmCrtQgkOpU3poTicVgrDzTDh4f3++NSCjegvyYNuHoQjtj3dfJglfN+CRiqljrYhfm8XMziDLXGRIdPUaZlIRZyy8gAVdU36RCv3fxPBhnTvPuX5ufWPPINoJXZKdifLLh+kHRjJy+MydSfftfimcj1fAu9bhFSjPQHmtjViViJhJ+sMw2OHWdaCeS/pqOyB7wstBAx47fc3dPM4I5TQEY1+vtsiSM3E2UwAYgj1erQ488xERTFIWZ9ca0TfezZsEbdwEmmDdcD/59Rp+AXI+pPnRLzZYgyZ39J+TVkB3mRcjxhpNg/fmG7yk/JxrRNxXXwO+ZVJvAN2ArnH81FxXAgFJd+jYyIcf45YVP8j2KoXw0O6JsHBQSXfiIBXs2j7mKZtrzHaMofapLsIltt6WPIBZG5Y3Vfwxr32XksiaidSZ43/Q/qMYVC9p7YPC7rwKq2j5BN+0vgyLtBH/AkvgReB+QJ1wCmqBB6RBG+qGKOFU9nrez85c3baHRqakn8/B7CfSkV8UK8YHGPu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EtKlUuTWskxav4pzaHBQUqZZTUuIW5Fxc0B2EmQW3jkUpOq4LIuWH6w1I40X?=
 =?us-ascii?Q?5PPGburEyFeOkWep0HMSDxHzYOnRtIn6q5RtvYWHRttGfhE0FeRuIIYcZlge?=
 =?us-ascii?Q?8v9NQwOBr5HzP3e8qfj6/ch6gM6TPC47AWHE2TWREP/FqwogQee9G/12LD90?=
 =?us-ascii?Q?02fxaCwZv0gePDFING6DSqLDPwBiHBRbEXKiPKMwszw1cECb/Qnll1cHmkGu?=
 =?us-ascii?Q?v/ra3s2g6O7oJ5buQSBzMJ+1+mHLkhLA+r4xZRnly5T803dJqEgpA5uTshJn?=
 =?us-ascii?Q?pS9FeGHNWuQdvnxn9SD1S8Lx+emawwwySyEnU8mgH4s5HUOvVNWvhC/ICY2X?=
 =?us-ascii?Q?7qpjPxsGd+5veJGI5jiSKPvaucWNWniLXEemMzBSMw6tdkUwrNDTJmjE8CWI?=
 =?us-ascii?Q?Kxc7FSGkvNJLlDjXsEUSjFZGGtUVYKzvmBqxHJsBhSiLS1tit/icQEp880vu?=
 =?us-ascii?Q?0rD/5yJwY3SHDl2XmH1x7kgoCzUCdtd1zApLeoieDFCWL70cedmryrjDpa/J?=
 =?us-ascii?Q?B4XNr2UytQhSbfOhhIT9PrxCMV+RSmx8V4NwxqdrBhIeXhDabbu/tIf2gMXX?=
 =?us-ascii?Q?db9jo1nqgOl8WtWKtY7kZJLx/B7c0ak2zZDB2GRGhB8XYaxAZG05G0BJbuWI?=
 =?us-ascii?Q?Hy3SQUbHn/tkO5ohqRvvu2KfQKA/u301kIl8xLco2HerByDclz15s/Fzzt+9?=
 =?us-ascii?Q?1EONXtA+Q5sEmsuCZXoPieyrKFWyVdBM1TVz3z5kClzTEk6HVAmK3z7xj6Z3?=
 =?us-ascii?Q?F/ND8MdufhcaugMLdudLeXjsg4yEHfwZp7ulw4f9JrbQ3TgCuM2EeLCRZLjb?=
 =?us-ascii?Q?y2beYyMUZy/VPckrg+YJFseselyfeeucOAVq4dECC9WRKEk45oLkVEwPTBna?=
 =?us-ascii?Q?yoj0/qx5k2pb7iBXaW6N9AR0ZTnuhbmPQqTXXype3u1/b5jSHGdicYxeI34i?=
 =?us-ascii?Q?kO8sEOk/BgdobFdW28NTxzvnoHBreG5Z4acXuYxJkRPI5iI+NtEvNfcuolr0?=
 =?us-ascii?Q?JZ+fHjk9n/Zd5yCftUCQvGvog9gmc9JpcvSx8htsYo02+NVNjDU0asOk8zox?=
 =?us-ascii?Q?oxeePr/xDR7mkBWuE8maROM5owTwz+qA4Btumh203D1Thh/Z40Th9FpVnmy+?=
 =?us-ascii?Q?IU04Kx/oJlpVahyJne1/b1lt+qKzdrgGsbkip7tj2e+6WJrocxH23o/resTM?=
 =?us-ascii?Q?NgQGmeE6HgPSnM+BRF0EZjwil3vpxBE1t0wd/f8uITzd63rYkIwhCAGHpV1T?=
 =?us-ascii?Q?tdm8oRNwkqFbPsVLULPScQGVHSU7XRHOaXxPHcwp1BTSzDtvAO+sH/ykZYFc?=
 =?us-ascii?Q?YGvRKCge8Ds4AJt/xBxO4Z1DcI/G7S20p/tRy3dybxHR7Y4YcseTW7bmjkyJ?=
 =?us-ascii?Q?nAt5wth9GvmSJzhP0cGjuemsvqmf58zngWedcyRCjLM3xgxY3iMxINfU93/I?=
 =?us-ascii?Q?ZUhAIAZTUMbfj0whBF2VlwqZX1ePNYZlv/WDPiuzrfZLFiIrc7DnqbxhxN7q?=
 =?us-ascii?Q?G3KkBoTr2D6qZ6V2m/HPqBQieMz98kkwNkMjaWWE4e8UZM9TJJTEKOj4V4WY?=
 =?us-ascii?Q?zKD6gSjbYhfaMC0ywP8zDCFXdtOf0BjdXJYMATYvEgLEKyQCzvkMdYvriv27?=
 =?us-ascii?Q?WcE9zlcsM4KyhTglz3LYMsuCVmy7NHQ5ootkWuM+DDnwuFx67+HUGReilKgY?=
 =?us-ascii?Q?BiaJdMEXzFcBLpUGEnbi14fREwmHmLMQkNOjtazttC+6t+5PTM+fISUB+kdI?=
 =?us-ascii?Q?+hKp6WfqeQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb16863-1f7a-4066-3ae9-08dec0cb2632
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:19:48.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYGY1Q7NxdszTOztA8DHTT7XGw9QUsL6qxEYFXgC3CiApcbU1cLYBA97O6ULrj8e6mt70lZFVdTWpjeRLzBH4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_101955_349005_991526BD 
X-CRM114-Status: GOOD (  33.67  )
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

On Tue, Jun 02, 2026 at 05:51:10PM +0100, Sudeep Holla wrote:
> On Mon, Jun 01, 2026 at 03:45:10PM -0500, Seth Forshee wrote:
> > Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size
> > during RXTX_MAP") caused a regression for some FF-A implementations. It
> > has the effect of passing the size of the page-aligned buffers to
> > FFA_RXTX_MAP, which may be larger than the maximum size supported by the
> > SPMC. When this happens FFA_RXTX_MAP will fail with INVALID_PARAMETERS.
> > 
> > The following patches deal with two distinct scenarios which lead to
> > this issue. With FF-A v1.2+, FFA_FEATURES can specify a maximum supported
> > RX/TX buffer size, so patch 1 decodes this field and honors the maximum if
> > specified. For FF-A v1.1 and earlier the maximum is unknown, so patch 2
> > deals with this by first attempting FFA_RXTX_MAP with the page-aligned
> > buffer size (preserving the behavior introduced by commit 83210251fd70).
> > If this fails due to invalid parameters it retries with the minimum buffer
> > size from FFA_FEATURES.
> > 
> > Testing was done with FF-A v1.1 and v1.2 implementations, both of which
> > reject buffer sizes larger than 4K. Both implementations were tested with
> > 4K, 16K, and 64K pages. Without these patches, probe fails for page sizes
> > larger than 4K with the message "failed to register FFA RxTx buffers."
> > With the patches probe succeeds for all page sizes.
> > 
> > The patches are based on for-next/ffa/fixes.
> 
> for-next/ffa/updates has patches queued for v7.2.
> 
> > 
> > Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> > ---
> > Seth Forshee (2):
> >       firmware: arm_ffa: Honor maximum RX/TX buffer size
> >       firmware: arm_ffa: Fall back to minimum buffer size if RXTX_MAP fails
> > 
> >  drivers/firmware/arm_ffa/driver.c | 51 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> Wondering if these 2 fixes can be merged into one and simplified something
> like(untested) patch below(rebased on linux-next or for-next/ffa/updates)

From a quick review, yes, I think that looks like it should work. I'll
give it a closer look and some testing.

Seth

> 
> Regards,
> Sudeep
> 
> -->8
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 0f468362c288..5ffe21c568b7 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -32,6 +32,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/mutex.h>
> @@ -59,7 +60,9 @@
>         (FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
> 
>  #define RXTX_MAP_MIN_BUFSZ_MASK        GENMASK(1, 0)
> -#define RXTX_MAP_MIN_BUFSZ(x)  ((x) & RXTX_MAP_MIN_BUFSZ_MASK)
> +#define RXTX_MAP_MAX_BUFSZ_MASK        GENMASK(31, 16)
> +#define RXTX_MAP_MIN_BUFSZ(x)  (FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
> +#define RXTX_MAP_MAX_BUFSZ(x)  (FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
> 
>  #define FFA_MAX_NOTIFICATIONS          64
> 
> @@ -2101,7 +2104,7 @@ static int ffa_probe(struct platform_device *pdev)
>  {
>         int ret;
>         u32 buf_sz;
> -       size_t rxtx_bufsz = SZ_4K;
> +       size_t rxtx_min_bufsz = SZ_4K, rxtx_bufsz, rxtx_max_bufsz = 0;
> 
>         if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT) &&
>             is_protected_kvm_enabled() && !is_pkvm_initialized())
> @@ -2132,15 +2135,18 @@ static int ffa_probe(struct platform_device *pdev)
>         ret = ffa_features(FFA_FN_NATIVE(RXTX_MAP), 0, &buf_sz, NULL);
>         if (!ret) {
>                 if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 1)
> -                       rxtx_bufsz = SZ_64K;
> +                       rxtx_min_bufsz = SZ_64K;
>                 else if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 2)
> -                       rxtx_bufsz = SZ_16K;
> +                       rxtx_min_bufsz = SZ_16K;
>                 else
> -                       rxtx_bufsz = SZ_4K;
> +                       rxtx_min_bufsz = SZ_4K;
> +
> +               rxtx_max_bufsz = RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
> +               if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_min_bufsz)
> +                       rxtx_max_bufsz = rxtx_min_bufsz;
>         }
> 
> -       rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
> -       drv_info->rxtx_bufsz = rxtx_bufsz;
> +       rxtx_bufsz = min_not_zero(PAGE_ALIGN(rxtx_min_bufsz), rxtx_max_bufsz);
>         drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
>         if (!drv_info->rx_buffer) {
>                 ret = -ENOMEM;
> @@ -2156,10 +2162,17 @@ static int ffa_probe(struct platform_device *pdev)
>         ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
>                            virt_to_phys(drv_info->rx_buffer),
>                            rxtx_bufsz / FFA_PAGE_SIZE);
> +       if (ret == -EINVAL && !rxtx_max_bufsz && rxtx_min_bufsz < rxtx_bufsz) {
> +               rxtx_bufsz = rxtx_min_bufsz;
> +               ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
> +                                  virt_to_phys(drv_info->rx_buffer),
> +                                  rxtx_bufsz / FFA_PAGE_SIZE);
> +       }
>         if (ret) {
>                 pr_err("failed to register FFA RxTx buffers\n");
>                 goto free_pages;
>         }
> +       drv_info->rxtx_bufsz = rxtx_bufsz;
> 
>         mutex_init(&drv_info->rx_lock);
>         mutex_init(&drv_info->tx_lock);
> 
> 

