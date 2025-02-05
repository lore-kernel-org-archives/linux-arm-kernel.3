Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEC4C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ+WbB6oPvVImKDErDVjeeJsWwrOEYJW2cG7yx5mx/w=; b=4jVPxvy4rwQ32MfxJwd4vJGbC/
	0GcUwaSb0tMWpbFYxHlYZJ8tUNy4YPZY6DFXTFkKxovrGcOToxqbiKyXrNGzBHzwxrRic39FY948F
	WHXxTNK26MmbW8LCkAqG4XrUYePtziMSyiDafwzcSUTPAukWDc+ESLAYqQWRtn1AX4YZoZdIYmh6S
	9aYNQ8cg+tIazcOq8cHipclJ92Q3/PGt2f0iaFgTSwlgyPxF5JjhiFIHgZz2KAEMvIVryaza/ygTl
	QQYzUTRG7GlMXZbs/Bd3dm+hfNjMUR1098uHqwoXLN5gHt5FOkpA+XHExcF63ireJ8jJjglr5OK1e
	eifDvOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdmU-000000035Eo-3A3r;
	Wed, 05 Feb 2025 11:41:22 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdl6-000000034ud-0BAY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 11:39:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YnyrQ6QDcz6L4tl;
	Wed,  5 Feb 2025 19:37:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 17349140C98;
	Wed,  5 Feb 2025 19:39:49 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 5 Feb
 2025 12:39:48 +0100
Date: Wed, 5 Feb 2025 11:39:46 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, <rafael@kernel.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>, "Claudiu
 Beznea" <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
Message-ID: <20250205113946.00002fbb@huawei.com>
In-Reply-To: <567adde6-a348-41c0-b415-80daf16d3dbb@tuxon.dev>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
	<20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
	<46c8e8ff-ea39-4dbd-a26c-67fcabf4b589@linaro.org>
	<CAPDyKFq40KB6jKapnm0mOkFGB9-7VEGiBhNrVn_2fzrcziq0=Q@mail.gmail.com>
	<20250204143303.0000174a@huawei.com>
	<567adde6-a348-41c0-b415-80daf16d3dbb@tuxon.dev>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_033956_418769_E9BFA74E 
X-CRM114-Status: GOOD (  39.89  )
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

On Wed, 5 Feb 2025 10:33:39 +0200
Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:

> Hi, Jonathan,
>=20
> On 04.02.2025 16:33, Jonathan Cameron wrote:
> > On Wed, 15 Jan 2025 16:42:37 +0100
> > Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >  =20
> >> On Thu, 9 Jan 2025 at 18:34, Daniel Lezcano <daniel.lezcano@linaro.org=
> wrote: =20
> >>>
> >>>
> >>> Ulf,
> >>>
> >>> can you have a look at this particular patch please ?
> >>>
> >>> Perhaps this scenario already happened in the past and there is an
> >>> alternative to fix it instead of this proposed change   =20
> >>
> >> I think the patch makes sense.
> >>
> >> If there is a PM domain that is attached to the device that is
> >> managing the clocks for the thermal zone, the detach procedure
> >> certainly needs to be well controlled/synchronized.
> >> =20
> > Does this boil down to the same issue as
> > https://lore.kernel.org/linux-iio/20250128105908.0000353b@huawei.com/
> > ? =20
>=20
> Yes, as described in the cover letter.
>=20
> >=20
> > Just to point out there is another way like is done in i2c:
> > https://elixir.bootlin.com/linux/v6.12.6/source/drivers/i2c/i2c-core-ba=
se.c#L630
> >=20
> > Register a devres_release_group() in bus probe() and release it before
> > the dev_pm_domain_detach() call.  That keeps the detach procedure well
> > controlled and synchronized as it is entirely in control of the driver.=
 =20
>=20
> From the IIO thread I got that Ulf doesn't consider it a good approach for
> all the cases.
>=20

Maybe true (I'll let Ulf comment!) and I think the solution proposed here is
not great because it is putting the cost on every driver rather than solving
the basic problem in one place (and there is clear precedence in other
bus subsystems). Ideally I'd like more people to get involved in that discu=
ssion.

Jonathan



> Thank you,
> Claudiu
>=20
> >=20
> > That IIO thread has kind of died out for now though with no resolution
> > so far.
> >=20
> > Jonathan
> >=20
> >  =20
> >>>
> >>>
> >>> On 03/01/2025 17:38, Claudiu wrote:   =20
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL=
}),
> >>>> clocks are managed through PM domains. These PM domains, registered =
on
> >>>> behalf of the clock controller driver, are configured with
> >>>> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, t=
he
> >>>> clocks are enabled/disabled using runtime PM APIs.
> >>>>
> >>>> During probe, devices are attached to the PM domain controlling their
> >>>> clocks. Similarly, during removal, devices are detached from the PM =
domain.
> >>>>
> >>>> The detachment call stack is as follows:
> >>>>
> >>>> device_driver_detach() ->
> >>>>    device_release_driver_internal() ->
> >>>>      __device_release_driver() ->
> >>>>        device_remove() ->
> >>>>          platform_remove() ->
> >>>>         dev_pm_domain_detach()
> >>>>
> >>>> In the upcoming Renesas RZ/G3S thermal driver, the
> >>>> struct thermal_zone_device_ops::change_mode API is implemented to
> >>>> start/stop the thermal sensor unit. Register settings are updated wi=
thin
> >>>> the change_mode API.
> >>>>
> >>>> In case devres helpers are used for thermal zone register/unregister=
 the
> >>>> struct thermal_zone_device_ops::change_mode API is invoked when the
> >>>> driver is unbound. The identified call stack is as follows:
> >>>>
> >>>> device_driver_detach() ->
> >>>>    device_release_driver_internal() ->
> >>>>      device_unbind_cleanup() ->
> >>>>        devres_release_all() ->
> >>>>          devm_thermal_of_zone_release() ->
> >>>>         thermal_zone_device_disable() ->
> >>>>           thermal_zone_device_set_mode() ->
> >>>>             rzg3s_thermal_change_mode()
> >>>>
> >>>> The device_unbind_cleanup() function is called after the thermal dev=
ice is
> >>>> detached from the PM domain (via dev_pm_domain_detach()).
> >>>>
> >>>> The rzg3s_thermal_change_mode() implementation calls
> >>>> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
> >>>> accessing the registers. However, during the unbind scenario, the
> >>>> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach=
().
> >>>> Consequently, the clocks are not enabled, as the device is removed f=
rom
> >>>> the PM domain at this time, leading to an Asynchronous SError Interr=
upt.
> >>>> The system cannot be used after this.
> >>>>
> >>>> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These w=
ill
> >>>> be used in the upcomming RZ/G3S thermal driver.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>   =
=20
> >>
> >> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> >>
> >> Kind regards
> >> Uffe
> >> =20
> >>>> ---
> >>>>   drivers/thermal/thermal_of.c |  8 +++++---
> >>>>   include/linux/thermal.h      | 14 ++++++++++++++
> >>>>   2 files changed, 19 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_=
of.c
> >>>> index fab11b98ca49..8fc35d20db60 100644
> >>>> --- a/drivers/thermal/thermal_of.c
> >>>> +++ b/drivers/thermal/thermal_of.c
> >>>> @@ -329,11 +329,12 @@ static bool thermal_of_should_bind(struct ther=
mal_zone_device *tz,
> >>>>    *
> >>>>    * @tz: a pointer to the thermal zone structure
> >>>>    */
> >>>> -static void thermal_of_zone_unregister(struct thermal_zone_device *=
tz)
> >>>> +void thermal_of_zone_unregister(struct thermal_zone_device *tz)
> >>>>   {
> >>>>       thermal_zone_device_disable(tz);
> >>>>       thermal_zone_device_unregister(tz);
> >>>>   }
> >>>> +EXPORT_SYMBOL_GPL(thermal_of_zone_unregister);
> >>>>
> >>>>   /**
> >>>>    * thermal_of_zone_register - Register a thermal zone with device =
node
> >>>> @@ -355,8 +356,8 @@ static void thermal_of_zone_unregister(struct th=
ermal_zone_device *tz)
> >>>>    *  - ENOMEM: if one structure can not be allocated
> >>>>    *  - Other negative errors are returned by the underlying called =
functions
> >>>>    */
> >>>> -static struct thermal_zone_device *thermal_of_zone_register(struct =
device_node *sensor, int id, void *data,
> >>>> -                                                         const stru=
ct thermal_zone_device_ops *ops)
> >>>> +struct thermal_zone_device *thermal_of_zone_register(struct device_=
node *sensor, int id, void *data,
> >>>> +                                                  const struct ther=
mal_zone_device_ops *ops)
> >>>>   {
> >>>>       struct thermal_zone_device_ops of_ops =3D *ops;
> >>>>       struct thermal_zone_device *tz;
> >>>> @@ -429,6 +430,7 @@ static struct thermal_zone_device *thermal_of_zo=
ne_register(struct device_node *
> >>>>
> >>>>       return ERR_PTR(ret);
> >>>>   }
> >>>> +EXPORT_SYMBOL_GPL(thermal_of_zone_register);
> >>>>
> >>>>   static void devm_thermal_of_zone_release(struct device *dev, void =
*res)
> >>>>   {
> >>>> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> >>>> index 69f9bedd0ee8..adbb4092a064 100644
> >>>> --- a/include/linux/thermal.h
> >>>> +++ b/include/linux/thermal.h
> >>>> @@ -195,13 +195,23 @@ struct thermal_zone_params {
> >>>>
> >>>>   /* Function declarations */
> >>>>   #ifdef CONFIG_THERMAL_OF
> >>>> +struct thermal_zone_device *thermal_of_zone_register(struct device_=
node *sensor, int id, void *data,
> >>>> +                                                  const struct ther=
mal_zone_device_ops *ops);
> >>>>   struct thermal_zone_device *devm_thermal_of_zone_register(struct d=
evice *dev, int id, void *data,
> >>>>                                                         const struct=
 thermal_zone_device_ops *ops);
> >>>>
> >>>> +void thermal_of_zone_unregister(struct thermal_zone_device *tz);
> >>>>   void devm_thermal_of_zone_unregister(struct device *dev, struct th=
ermal_zone_device *tz);
> >>>>
> >>>>   #else
> >>>>
> >>>> +static inline
> >>>> +struct thermal_zone_device *thermal_of_zone_register(struct device_=
node *sensor, int id, void *data,
> >>>> +                                                  const struct ther=
mal_zone_device_ops *ops)
> >>>> +{
> >>>> +     return ERR_PTR(-ENOTSUPP);
> >>>> +}
> >>>> +
> >>>>   static inline
> >>>>   struct thermal_zone_device *devm_thermal_of_zone_register(struct d=
evice *dev, int id, void *data,
> >>>>                                                         const struct=
 thermal_zone_device_ops *ops)
> >>>> @@ -209,6 +219,10 @@ struct thermal_zone_device *devm_thermal_of_zon=
e_register(struct device *dev, in
> >>>>       return ERR_PTR(-ENOTSUPP);
> >>>>   }
> >>>>
> >>>> +static inline void thermal_of_zone_unregister(struct thermal_zone_d=
evice *tz)
> >>>> +{
> >>>> +}
> >>>> +
> >>>>   static inline void devm_thermal_of_zone_unregister(struct device *=
dev,
> >>>>                                                  struct thermal_zone=
_device *tz)
> >>>>   {   =20
> >>>
> >>>
> >>> --
> >>> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs
> >>>
> >>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> >>> <http://twitter.com/#!/linaroorg> Twitter |
> >>> <http://www.linaro.org/linaro-blog/> Blog   =20
> >> =20
> >  =20
>=20


