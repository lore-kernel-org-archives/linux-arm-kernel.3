Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3087ACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=; b=0BuyMANtUsnyoP3DxtVzIagKqO
	B1Nwrsad7drOxBxbqb9ayxDlITF03wl2LcN6IeJWh/IkRSAAEsaGphVfoa7qmOfhodXyIQTTsZc1I
	i6GoEn7BigXWKkucNKtn5AU/rRHPnfPeQ/Ssm7dW7ZlmMIjy7nzFduRCHkWCIoBpgnS9AmSRRuwl0
	gz4yrMvF4I8heYVfMzVDDIMiH27XE6tFONBebXRiVTOeCGmOyBNhGamVh40ivRbgKXe/ewEruq8nF
	Hf85GgavenP+udxqha7BVqlpgrZFcSBuf2c2LbRqs4NNH1zCBLhZi+xilYFoy63pg74SCTS3XcmFL
	vrAoUgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNpQ-0000000D6HL-0hAH;
	Mon, 11 May 2026 10:25:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNpM-0000000D6Gi-2VVg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:25:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3901416e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778495130; cv=none;
        d=google.com; s=arc-20240605;
        b=hCM4/mkSK44QffJXmaThwFdiALONczP6N1sBwevv14Y8xVwXCtMz4QcffoxZVa/tmN
         wPvxMVjnut5EKJhJYVDUGSBoVVO0Ggb85FN5/PFKTEX+NMVqQMROO/QQihzGqAi3QGqg
         X+hi1XR3Y+h/kCJ3cxzxNs5U5JA4UDVhZFBGG+FUAuKIHWAW19n3/c7LPfy55niPycSa
         KDuySh3cGQkvtRTiAo3/CAGlj9sgch1Q/TbpW+EPaycQ+hHMH1aPNbzJZMjheDQ6GCvo
         aGPreLZYjzH0P4DSPO+Y0o9zmpPq9XOlNwf88lbUOwRpE7SLHbNdDRXrWRv0OuSCqqAw
         zDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=;
        fh=q0x4JADWQPWfUJZFUCmMwiDb+LKR46xGfGPIp9Scum0=;
        b=MFVPZcky8veM1v+PbizxZsWux8qgfGRGlU/J8bRMDvn3uYAh1rEzAu06kmiKikbvq/
         QoBmbpsTbf4hTT2iQhZa35E116+KOYlsnHWbzNlH7DkF6AVLblRc+r9pre/9JprTHDwa
         cGanJxbLiAoALfvqHiSuwlyTG3WOo9uAtj1qJZ9/5Yo9mkDhyAWi9DXZU4mhGFBl1cD8
         2z80UYkrJEG4QzlD4yesrbCkPivYCSqxHUJC5SijNNnNHzIxQ/Wpjo34CJlVaL1/7Vae
         JrnkS5quKkuu97Te7Y93x6IX9jisLDe3xaOpMmBUW6sGUnAMVvMcU6fk2XfXA7a68Ydg
         MSzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778495130; x=1779099930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=;
        b=XdAD6uMHNqtrpoEJgbZ5JS+TexY0V9njkCOrT5RcoOMh1rrSL/4fe/or8nvuCTp62M
         eagxa83aQUQS5RYCaV1NQc5czyDqtVreXEzGKe7kKkndvG5XH5Mz9gfh4Gyf3ooE5FZu
         jmuWrJ5hanlHLmtrFnQsLeBZDbF1lbzJulGxH5tz1j3a6J4m8UgbP8l4kIgGrUsooPc+
         QCkb3oKF0moCTLAvqtCaA3lSk5HgTgozQ2kpjTcDDaVEnKun+CQ2edRt8WHuFvSKnCAb
         iCta20PxsrrJjtL/5tg3U8TVPrQiWjEQGGBLPSSxb689Glc78zgWaHnRnAuNv86EoT5n
         3Ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495130; x=1779099930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=;
        b=p0SVLhAr0CIJUOZS6zfhZ/KSNTtvmMtlESV4jd0GwnGoIVh80QS4QbZLZZ1yl8z5a3
         ZRaBrYFsmLHp9xyY/l1SLSBUxPdNwxB6+iuSYO4DrxBLrZ2Av1xvcr9UUv2M0936EwsT
         qkdOtsGABn61iHguvNOVWgBfuG9J9r44flJ50+wauXxewQEWAG5l+XpEm69uhciSYNWj
         hNPJbZeBdoq+yZJNMLJwg1l4UgplKin1uXDM41U1ncZqwWnzXhJZjPlUCNjOPu+uxh98
         vWTUK79rgAD4AD00uahCQkMKtgAX7jrgd3iDeS1xgDGVgaiudbh6En5xaw5GFJzCHFdr
         T9oQ==
X-Forwarded-Encrypted: i=1; AFNElJ99Xgxa12iVjdAdWW7sFShKGmDZ5BkrhyKPUu9GEECEqZJy/C0WUt+/vM7CPL3kjLVa3COyjO1vIsDUkhGB2aRR@lists.infradead.org
X-Gm-Message-State: AOJu0Yywo38qIyZE2LgnY91Xs4+skry/PVckGynXWfdwm0GdPJi9rLSc
	yVn4jof12w/uCYOtwDbFe3BIHTfuyTjegapAJ3I+zsnN7clQA18hOVp46ZI596p33kGtUQMbpGI
	9QSPggfQmvvM039O86ZkUrYr7zH6QSC+JyNwyBfXH2g==
X-Gm-Gg: Acq92OEFHTVNoFS8T3JPk+FFt9k1T3TeKT2SXmh7VKmPbJhUdsykp7/0ebTdLEy3B/r
	h2KpmagG71XyqO0F7f8X9WCtBpxsVJoUUnfjWRfCEGs/00ukTtJOBf+S3f8YqI4wYqmg+Uosltd
	jOcmm/2ha9wDBkZvflQgZtrq+hGUjNQghwQ8mTfW5urRDYTrKSdKd83zxb7/gP7DgtDwTHa3kkF
	xTfBc5v3B3s1IGGh2i6WRcUTyj/ZbJBs63CZ25vUSPjGlhh1Ozs3NTcTgOleHJuzblyFWGz2+fw
	+VBOXE0B
X-Received: by 2002:a05:6512:3c97:b0:5a8:750c:2f79 with SMTP id
 2adb3069b0e04-5a8b6c9d7f4mr2454726e87.3.1778495130112; Mon, 11 May 2026
 03:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-7-ulf.hansson@linaro.org> <CACRMN=cowCsGb3x=tPOWLYdittwLCsSb2N2SXVPyxBRHThGAVg@mail.gmail.com>
In-Reply-To: <CACRMN=cowCsGb3x=tPOWLYdittwLCsSb2N2SXVPyxBRHThGAVg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 12:24:52 +0200
X-Gm-Features: AVHnY4KccwKVfW4opInH2wvv6H4LV9YYk-FND-WFVqnl0G_Vxtf7tdTrxriZmx0
Message-ID: <CAPDyKFoxJ8AOyqzbEQc8x-e5fRf0p3faE23PRNcbA4aPSY_cdg@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] pmdomain: core: Add initial fine grained
 sync_state support
To: Saravana Kannan <saravanak@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_032533_704498_0B48B738 
X-CRM114-Status: GOOD (  50.45  )
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

On Mon, 11 May 2026 at 07:09, Saravana Kannan <saravanak@kernel.org> wrote:
>
> On Fri, May 8, 2026 at 5:39=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > A onecell (#power-domain-cells =3D <1 or 2>; in DT) power domain provid=
er
> > typically provides multiple independent power domains, each with their =
own
> > corresponding consumers. In these cases we have to wait for all consume=
rs
> > for all the provided power domains before the ->sync_state() callback g=
ets
> > called for the supplier.
> >
> > In a first step to improve this, let's implement support for fine grain=
ed
> > sync_state support a per genpd basis by using the ->queue_sync_state()
> > callback. To take step by step, let's initially limit the improvement t=
o
> > the internal genpd provider driver and to its corresponding genpd devic=
es
> > for onecell providers.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >
> > Changes in v3:
> >         - Addressed some cosmetic comments from Geert.
> >
> > ---
> >  drivers/pmdomain/core.c   | 124 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h |   1 +
> >  2 files changed, 125 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index ad57846f02a3..c01a9a96e5c2 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2699,6 +2699,119 @@ static struct generic_pm_domain *genpd_get_from=
_provider(
> >         return genpd;
> >  }
> >
> > +static bool genpd_should_wait_for_consumer(struct device_node *np)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +       bool should_wait =3D false;
> > +
> > +       mutex_lock(&gpd_list_lock);
> > +       list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> > +                       genpd_lock(genpd);
> > +
> > +                       /* Clear the previous state before reevaluating=
. */
> > +                       genpd->wait_for_consumer =3D false;
> > +
> > +                       /*
> > +                        * Unless there is at least one genpd for the p=
rovider
> > +                        * that is being kept powered-on, we don't have=
 to care
> > +                        * about waiting for consumers.
> > +                        */
> > +                       if (genpd->stay_on)
> > +                               should_wait =3D true;
> > +
> > +                       genpd_unlock(genpd);
> > +               }
> > +       }
> > +       mutex_unlock(&gpd_list_lock);
>
> I think I understand the intent of this function, but haven't dug into
> genpd code enough to comment on this yet. I'll come back to this
> later.
>
> > +
> > +       return should_wait;
> > +}
> > +
> > +static void genpd_parse_for_consumer(struct device_node *sup,
> > +                                    struct device_node *con)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +
> > +       for (unsigned int i =3D 0; ; i++) {
> > +               struct of_phandle_args pd_args;
> > +
> > +               if (of_parse_phandle_with_args(con, "power-domains",
> > +                                              "#power-domain-cells",
> > +                                              i, &pd_args))
> > +                       break;
>
> Why not use a while or a do while() instead of this infinite for loop
> with a break?

I guess it's a matter of personal preference. I'm not sure the code
gets any nicer with a do/while, but if you really insist I can change
it.

>
> > +
> > +               /*
> > +                * The phandle must correspond to the supplier's genpd =
provider
> > +                * to be relevant else let's move to the next index.
> > +                */
> > +               if (sup !=3D pd_args.np) {
> > +                       of_node_put(pd_args.np);
> > +                       continue;
> > +               }
> > +
> > +               mutex_lock(&gpd_list_lock);
> > +               genpd =3D genpd_get_from_provider(&pd_args);
> > +               if (!IS_ERR(genpd)) {
> > +                       genpd_lock(genpd);
> > +                       genpd->wait_for_consumer =3D true;
> > +                       genpd_unlock(genpd);
> > +               }
> > +               mutex_unlock(&gpd_list_lock);
> > +
> > +               of_node_put(pd_args.np);
> > +       }
> > +}
> > +
> > +static void _genpd_queue_sync_state(struct device_node *np)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +
> > +       mutex_lock(&gpd_list_lock);
> > +       list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> > +                       genpd_lock(genpd);
> > +                       if (genpd->stay_on && !genpd->wait_for_consumer=
) {
> > +                               genpd->stay_on =3D false;
> > +                               genpd_queue_power_off_work(genpd);
> > +                       }
> > +                       genpd_unlock(genpd);
> > +               }
> > +       }
> > +       mutex_unlock(&gpd_list_lock);
> > +}
> > +
> > +static void genpd_queue_sync_state(struct device *dev)
> > +{
> > +       struct device_node *np =3D dev->of_node;
> > +       struct device_link *link;
> > +
> > +       if (!genpd_should_wait_for_consumer(np))
> > +               return;
> > +
> > +       list_for_each_entry(link, &dev->links.consumers, s_node) {
>
> Couple of issues:
> 1. I don't want the frameworks to be so deeply aware of driver core
> internals. I want the driver core maintainers to be able to change the
> devlink implementation without having to worry about going and fixing
> all the frameworks. So, please add a for_each_consumer_dev(supplier,
> callback) and for_each_supplier_dev(consumer, callback) helper
> functions.

I understand your concern and I like the idea. However, maybe it's
better to get this landed (the series is complicated as is) first and
then can continue to improve the code on top, with helper functions
etc.

>
> 2. This doesn't ignore "SYNC_STATE_ONLY" links and that's going to
> confuse the consumer count/check you might do or at the least waste
> parsing those.

I am not sure I understand how I should take SYNC_STATE_ONLY links
into account here.

At each call to the genpd_queue_sync_state(), we walk through all the
provided genpds for the provider. No previous state is cached to track
consumer counts.

>
> 3. **Device** links are not the complete list of consumers because
> they can only link consumer **devices** once the consumer **device**
> is created.
>
> 4. What you really need is a for_each_consumer_fwnode(supplier,
> callback) that first loops through all the consumer device links and
> calls the callback() on their fwnode and then the same function needs
> to loop through all the fwnode links and then pass those consumer
> fwnodes to the callback. And inside that callback you can do whatever
> you want.

The ->queue_sync_state() callback is invoked *after*
__device_links_queue_sync_state() has been called for the device,
which is also when the conditions for calling ->sync_state() is
checked.

If there are problems with not yet registered consumer device links,
why isn't that as problem for regular ->sync_state() in
__device_links_queue_sync_state()?

>
> 5. You might want to add a for_each_inactive_consumer(supplier,
> callback) too to simplify your need for checking if a fwnode has a
> device and then checking if it's probed.
>
> Thanks,
> Saravana
>
>
> > +               struct device *consumer =3D link->consumer;
> > +
> > +               if (!device_link_test(link, DL_FLAG_MANAGED))
> > +                       continue;
> > +
> > +               if (link->status =3D=3D DL_STATE_ACTIVE)
> > +                       continue;
> > +
> > +               if (!consumer->of_node)
> > +                       continue;
> > +
> > +               /*
> > +                * A consumer device has not been probed yet. Let's par=
se its
> > +                * device node for the power-domains property, to find =
out the
> > +                * genpds it may belong to and then prevent sync state =
for them.
> > +                */
> > +               genpd_parse_for_consumer(np, consumer->of_node);
> > +       }
> > +
> > +       _genpd_queue_sync_state(np);
> > +}
> > +

[...]

Kind regards
Uffe

