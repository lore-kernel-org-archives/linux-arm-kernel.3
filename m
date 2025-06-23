Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCB7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfsu3f4XruekbOAR8OM/UYe4Ua7I9QrG82j1peoX5cw=; b=tkpnG0ePPoOA/tZvwY6IQ7Gv1S
	h3lmF+sxBeFA378a/yjsJPUE34Zrhd0sQ70AtDiwdNQYlaIwLIITXfU+fuQNeECKHapsroRp50kMH
	Axd7Vk03WUuYuEhUFRV9GA4oNDq4ZVnZU+tsWboFBhVKN/cRMnKDpyht2Dtt5VmZfS83BjH5U7uXP
	AouMK6QctW/jYQiRhtbkxUPRVgJYZOQBY2i6rLoIIqI4CiipNNaDMxkbWrD4HayObxGU2lSqkROVB
	ymyxD30j6eNvOn9f13GI0AFqtXnhnCUT5ZXuN/EvenPtGqvJG7Mb/VYYJqcrlBguBeDVZvEMJMeQ6
	6JUb6JzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZL-00000004FDL-3oQz;
	Tue, 24 Jun 2025 00:31:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi0v-000000031GZ-1vF0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BC055C5CAF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BA8C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688352;
	bh=fVhp0kk7yln1GhbmDbmrjitgG6RCsk2hQ/F1Nvr6mtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JZnNZp+LLaJ8KO9x57Tz/ajV6KNYO9yexAuAR2XDfO3FnBSTEJy1LAEHQAEE5PU3v
	 IKuE08Arh1w6G5+Dp93vf0uq+M0OaaSBUvYMMGXYIp/OvXyRZPjVdvpeCK1PzC4hws
	 D+SQrWRLeAeh73wOUaqE7aQ8CBqTCY6vllWRZlB9gyqFja2uLt/azBgVmT5BBRg8gJ
	 zN0LCza166nQXqN0ZpKe3RUiuLlvtLCWQQqZsQ5zxn8LzyQgHfcHZ21aZMi9Kiuivt
	 BKTyoxUZyYLWxGSyLwHwVA1eyTRF6iSBFqjUybBiggvs8EJmVnUa3IIefyAX2iB5Z2
	 FqHgeS5/ZAOxg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade48b24c97so744780766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:19:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRDp5OJv0PFIw+pxQr2hrYd8CkS1leMboxesGP7akdRWRJSx3ViO8Rb+8yzvDxrR5M5AHj75kzT11VIChwr4CV@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8RhcIHQU0qf44BxMHcBayycQRfux/+p21ss+h7UA3tPXqHtC
	TyIk5kkLBvnK8JFhG2iq7uc2hDWxLHrPnXkq1N/ostpP/CVwKFO/0vlQfPswjKLjgTWK9/Zvoyu
	c2upY9Q1ZVXu9gWg2a3t11OCZEaHqfQ==
X-Google-Smtp-Source: AGHT+IGeXE26nG6p38Uwsxy/FoXelv+Ic5l+L6Q9K3HztXzstCPX04+L+Jc0Grcp9OXJDzvM7GKtblQieEdXimJfEws=
X-Received: by 2002:a17:907:7b96:b0:ad8:a41a:3cba with SMTP id
 a640c23a62f3a-ae057bc88cemr1354358566b.43.1750688350806; Mon, 23 Jun 2025
 07:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com> <20250613130356.8080-2-james.morse@arm.com>
 <20250617170323.00006688@huawei.com>
In-Reply-To: <20250617170323.00006688@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jun 2025 09:18:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+vA1AR+P0se3njU-_P0cjBM1h-4YGAShFZ-gy53SkZfw@mail.gmail.com>
X-Gm-Features: Ac12FXyYCMsH7OEBDSoHPIw_JXHCyml3peBYjUguFKyZJOLaAbRm95SwgGPeNzY
Message-ID: <CAL_Jsq+vA1AR+P0se3njU-_P0cjBM1h-4YGAShFZ-gy53SkZfw@mail.gmail.com>
Subject: Re: [PATCH 1/5] cacheinfo: Set cache 'id' based on DT data
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071913_575151_6DB4A4BA 
X-CRM114-Status: GOOD (  42.51  )
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

On Tue, Jun 17, 2025 at 11:03=E2=80=AFAM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 13 Jun 2025 13:03:52 +0000
> James Morse <james.morse@arm.com> wrote:
>
> > From: Rob Herring <robh@kernel.org>
> >
> > Use the minimum CPU h/w id of the CPUs associated with the cache for th=
e
> > cache 'id'. This will provide a stable id value for a given system. As
> > we need to check all possible CPUs, we can't use the shared_cpu_map
> > which is just online CPUs. As there's not a cache to CPUs mapping in DT=
,
> > we have to walk all CPU nodes and then walk cache levels.
>
> Is it ok for these to match for different levels?  I've no idea for
> these use cases.

Yes. The 'id' is per level, not globally unique.

> >
> > The cache_id exposed to user-space has historically been 32 bits, and
> > is too late to change. Give up on assigning cache-id's if a CPU h/w
> > id greater than 32 bits is found.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [ ben: converted to use the __free cleanup idiom ]
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > [ morse: Add checks to give up if a value larger than 32 bits is seen. =
]
> > Signed-off-by: James Morse <james.morse@arm.com>
>
> Hi James, Rob,
>
> Mainly a couple of questions for Rob on the fun of scoped cleanup being
> used for some of the iterators in a similar fashion to already
> done for looping over child nodes etc.
>
> > ---
> > Use as a 32bit value has been seen in DPDK patches here:
> > http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@ar=
m.com/
> > ---
> >  drivers/base/cacheinfo.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index cf0d455209d7..9888d87840a2 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -8,6 +8,7 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> >  #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> >  #include <linux/cacheinfo.h>
> >  #include <linux/compiler.h>
> > @@ -183,6 +184,37 @@ static bool cache_node_is_unified(struct cacheinfo=
 *this_leaf,
> >       return of_property_read_bool(np, "cache-unified");
> >  }
> >
> > +static void cache_of_set_id(struct cacheinfo *this_leaf, struct device=
_node *np)
> > +{
> > +     struct device_node *cpu;
> > +     u32 min_id =3D ~0;
> > +
> > +     for_each_of_cpu_node(cpu) {
>
> Rob is it worth a scoped variant of this one?  I've come across
> this a few times recently and it irritates me but I didn't feel
> there were necessarily enough cases to bother.  With one more
> maybe it is time to do it (maybe 10+ from a quick look)_.

My question on all of these (though more so for drivers), is why are
we parsing CPU nodes again? Ideally, we'd parse the CPU and cache
nodes only once and the kernel would provide the necessary info.

Take drivers/clk/mvebu/ap-cpu-clk.c for example. The code there really
just needs to know if there are 2 or 4 possible CPUs or what is the
max physical CPU id (If CPU #1 could be not present).

> > +             struct device_node *cache_node __free(device_node) =3D of=
_find_next_cache_node(cpu);
> > +             u64 id =3D of_get_cpu_hwid(cpu, 0);
> > +
> > +             if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> > +                     of_node_put(cpu);
> > +                     return;
> > +             }
> > +             while (1) {
>
> for_each_of_cache_node_scoped() perhaps?  With the find already defined t=
his would end
> up something like the following.  Modeled on for_each_child_of_node_scope=
d.

That seems like an invitation for someone to parse the cache nodes
themselves rather than use cacheinfo. Plus, there are multiple ways we
could iterate over cache nodes. Is it just ones associated with a CPU
or all cache nodes or all cache nodes at a level?

That being said, I do find the current loop a bit odd with setting
'prev' pointer which is then never explicitly used. We're still having
to worry about refcounting, but handling it in a less obvious way.

>         #define for_each_of_cache_node_scoped(cpu, cache) \
>                 for (struct device_node *cache __free(device_node) =3D \
>                      of_find_next_cache_node(cpu); cache !=3D NULL; \
>                      cache =3D of_find_next_cache_node(cache))
>
>         for_each_of_cpu_node_scoped(cpu) {
>                 u64 id =3D of_get_cpu_hwid(cpu, 0);
>
>                 if (FIELD_GET(GENMASK_ULL(63, 32), id))
>                         return;
>                 for_each_of_cache_node_scoped(cpu, cache_node) {
>                         if (cache_node =3D=3D np) {
>                                 min_id =3D min(min_id, id);
>                                 break;
>                         }
>                 }
>         }
>
> > +                     if (!cache_node)
> > +                             break;
> > +                     if (cache_node =3D=3D np && id < min_id) {
>
> Why do you carry on if id >=3D min_id?  Id isn't changing.  For that
> matter why not do this check before iterating the caches at all?

You're right, no need. There's no need to handle the id in the loop at
all, we just need to match the cache node. So perhaps just a helper:

static bool match_cache_node(struct device_node *cpu, const struct
device_node *cache_node)
{
  for (struct device_node *cache __free(device_node) =3D
        of_find_next_cache_node(cpu); cache !=3D NULL;
        cache =3D of_find_next_cache_node(cache)) {
    if (cache =3D=3D cache_node)
      return true;
  }
  return false;
}

And then the cpu loop would have:

if (match_cache_node(cpu, cache_node))
  min_id =3D min(min_id, id);

Rob

