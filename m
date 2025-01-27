Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DC7C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgw5atZnPYRYHUYuPOpqkvnycbeqzoNPhN2LOmdLk3c=; b=zAgYC7gdXtVN6+rx9B0WOdX73P
	6YhT8Em/IPzWpNRENbVrAFVOybA1Luxi3JSEXOekpVsnRYyDrHLTymt4hXXRevvP9b5jbxMLBloSY
	lH3okzZsAbZJ49DocjgccZd6t/+iKfQVcCE3Lcv1609yRYBfbC8gR0X3gwX13dGl8LQdm9VDJ/q3f
	y8hl1PzcXDfwmHql0HRpFEStBQ7l8NYn1cmqbvbgB0khaMk5gDNn4d5NcgyiEc7OdndR/OSH3x0cH
	GVCp47+K2ROnARpBJf6YXvTi4bJ0E11IChngW2BLs1leMwzgiHkay2U3g6Kbktjne8rwyX+mFbSHn
	Q9j9ThjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRvs-00000002m0C-39hD;
	Mon, 27 Jan 2025 16:25:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRuX-00000002lnX-1ElS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 16:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C64FA4187C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 16:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07478C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737995068;
	bh=P1XAvO3VDlbIoA2FFuYha3SIR6cyChDAtMKtoP6rroo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ud9wuQDBCD+VNndwuXVUkXuOV/EbvHeRxA0Sd1z9ru/nfg1dGxb1vG29TrHNGJT19
	 MKr+FyS8/3tkrdLl2tX4GLOxIEdPEPQhOruKO6RLDHaZqPpDgq3SL4Vp41bG/OmF0t
	 00307Vn8UaQfjz+vX1PSJGUPzh2Yg1/4LLSj3Mugl8KrTpe6ccTaYmFlR48Donu6XD
	 TSsAtR6Xr1UTesEDOZjYSgDiWzD3SgyT/VOpEEEeEn+H3s0LikY1eRP1XkcgeFV1dR
	 goym7egsufaC+Ry3GG6K/0IL/Y+C0k15DkN6bO+HVyHHeckw8cGSjMhhp+QIbNvOTy
	 +lid0z6K1NRMQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53f22fd6887so5181349e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 08:24:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlDvtb1YHWI4Q2jXGpj0S78oKEATvWkgSWyPugVw+EBCuU6q9lxJr6ypOj4s9YOKDwSmJR4CSIxQjWdiFPLcrr@lists.infradead.org
X-Gm-Message-State: AOJu0YwpnLDNCN3BjaTNHBCOk9wyJ6s67vWXeKcOvh7f3txuKcRmnWpX
	nhdR8c/ala1sbmG12aK5E2ypD+CglSYzh2ASOpH4kNoxuxbIRrEhGoY3cJltT0R3Qad/VtYDZpv
	zJcu0XfliG54FCXxSaVjFL6LHTw==
X-Google-Smtp-Source: AGHT+IHO7xcGOPrToRZlwr3nuIUx/JCC3FFTG/RQH5LwAJUEK267HLoXlDeEikLsLokRDuugPuNKRciTbG4rkyqs+/k=
X-Received: by 2002:a05:6512:108a:b0:540:1fd6:4e4f with SMTP id
 2adb3069b0e04-5439c246c5fmr14519142e87.22.1737995066304; Mon, 27 Jan 2025
 08:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20250124152008.313-1-alireza.sanaee@huawei.com> <20250124152008.313-2-alireza.sanaee@huawei.com>
In-Reply-To: <20250124152008.313-2-alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Jan 2025 10:24:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFjQeaoGn5PRn1=P49mag-Kyik7EwtsOU8fcdvYhPcOA@mail.gmail.com>
X-Gm-Features: AWEUYZnVRYg0HjS13AR3X4YMrcQBzFYQx47bdwZghD62tZ_Wvr7bmwA4jHcafg4
Message-ID: <CAL_JsqKFjQeaoGn5PRn1=P49mag-Kyik7EwtsOU8fcdvYhPcOA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/1] base/of/cacheinfo: support l1 entry in dt
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jonathan.cameron@huawei.com, 
	linux-arm-kernel@lists.infradead.org, shameerali.kolothum.thodi@huawei.com, 
	zhao1.liu@intel.com, yangyicong@hisilicon.com, rrendec@redhat.com, 
	catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_082429_465967_4BC24E6C 
X-CRM114-Status: GOOD (  25.50  )
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

On Fri, Jan 24, 2025 at 9:20=E2=80=AFAM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> This commit simply assumes that CPU node entries may point to a cache
> node that basically act as a l1-cache and there are some CPU nodes
> without describing any caches but a next-level-cache property that
> points to l1-cache.

This commit message needs some work. Read documentation on writing
commit messages.

Why/when does describing L1 cache in the cpu nodes not work? That is
the assumption in the bindings. If we're changing that, there may need
to be a binding/spec change.

>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/base/cacheinfo.c | 54 +++++++++++++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index cf0d455209d7..d119228fc392 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -83,7 +83,31 @@ bool last_level_cache_is_shared(unsigned int cpu_x, un=
signed int cpu_y)
>
>  #ifdef CONFIG_OF
>
> -static bool of_check_cache_nodes(struct device_node *np);
> +static bool of_check_cache_node(struct device_node *np) {
> +       if (of_property_present(np, "cache-size")   ||
> +           of_property_present(np, "i-cache-size") ||
> +           of_property_present(np, "d-cache-size") ||
> +           of_property_present(np, "cache-unified"))
> +               return true;
> +       return false;
> +}
> +
> +static bool of_check_cache_nodes(struct device_node *np)
> +{
> +       if (of_property_present(np, "cache-size")   ||
> +           of_property_present(np, "i-cache-size") ||
> +           of_property_present(np, "d-cache-size") ||
> +           of_property_present(np, "cache-unified"))

This is the same code as of_check_cache_node(), use it.

> +               return true;
> +
> +       struct device_node *next __free(device_node) =3D of_find_next_cac=
he_node(np);
> +       if (next) {
> +               return true;
> +       }
> +
> +       return false;
> +}
> +
>
>  /* OF properties to query for a given cache type */
>  struct cache_type_info {
> @@ -218,11 +242,23 @@ static int cache_setup_of_node(unsigned int cpu)
>         while (index < cache_leaves(cpu)) {
>                 this_leaf =3D per_cpu_cacheinfo_idx(cpu, index);
>                 if (this_leaf->level !=3D 1) {
> +                       /* Always go one level down for level > 1 */
>                         struct device_node *prev __free(device_node) =3D =
np;
>                         np =3D of_find_next_cache_node(np);
>                         if (!np)
>                                 break;
> +               } else {
> +                       /* For level 1, check compatibility */
> +                       if (!of_device_is_compatible(np, "cache") &&
> +                           !of_check_cache_node(np)) {
> +                               struct device_node *prev __free(device_no=
de) =3D np;
> +                               np =3D of_find_next_cache_node(np);
> +                               if (!np)
> +                                       break;
> +                               continue; /* Skip to next index without p=
rocessing */
> +                       }
>                 }
> +
>                 cache_of_set_props(this_leaf, np);
>                 this_leaf->fw_token =3D np;
>                 index++;
> @@ -234,22 +270,6 @@ static int cache_setup_of_node(unsigned int cpu)
>         return 0;
>  }
>
> -static bool of_check_cache_nodes(struct device_node *np)
> -{
> -       if (of_property_present(np, "cache-size")   ||
> -           of_property_present(np, "i-cache-size") ||
> -           of_property_present(np, "d-cache-size") ||
> -           of_property_present(np, "cache-unified"))
> -               return true;
> -
> -       struct device_node *next __free(device_node) =3D of_find_next_cac=
he_node(np);
> -       if (next) {
> -               return true;
> -       }
> -
> -       return false;
> -}
> -
>  static int of_count_cache_leaves(struct device_node *np)
>  {
>         unsigned int leaves =3D 0;
> --
> 2.34.1
>

