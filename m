Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1603ECA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAW2ULjFPf5Zf9gIiW3qrbqOsQCJ1tcABHPn8lB8mHo=; b=R/5mf1HouGeC4CO5luSyfMN6Wn
	oac8Dj1MCS3U5nN7fGG+k93frc2Lf4yKxyLRo2dtOR7OcYrtG/7qUn4vYD01Si8Slu4JGwFrRbi9S
	iP159HV5IHlQ6DwYv2sPnO8DjMem3+NPGJfwnEskYEVhec2RpDtOGci9zNKzoRWw3EI3qyM6Wlv9b
	q/pJxViVudxWGEA9KKTKTV2tntwgLX31auoNf5/aetO/GP4QjTX2nzMJEhWczvg2IE1I5KXjsk3Ww
	cTxCkU9kcuQwA9Zy8hR0KcCy8qNml2NxZ9WP2/fkOthqsmjJAG4oq1hlnqD/usrk68VhaEgEKfrBx
	D2UK+OGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNP-00000001Yxx-2kNB;
	Tue, 02 Sep 2025 19:09:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQDu-0000000HLwf-2RfA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:34:55 +0000
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19761C77;
	Tue,  2 Sep 2025 14:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816052;
	bh=SfU1BmkFn+/uikC+Ti2+q5KjRSs4erXTxBfEJyRqQBU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ekd3L/fcwqGdOgNIo1NDy8RQ5jXMDUURTxhOT6dRqGJyWAZYYHYyNEiYpKlA7ocMu
	 tLdfone79FcAzKJAS5yKc0nOBMeuCW+x8qdiYqNn3cedCzK5nOaGNhWNCmhLE538OY
	 LlD/k9j31WKrarI8sIiqSO62z0B21NvJo3Zyn75M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250819024413.GJ5862@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com> <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu> <20250815103205.GJ6201@pendragon.ideasonboard.com> <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu> <20250815113633.GM6201@pendragon.ideasonboard.com> <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu> <20250819024413.GJ5862@pendragon.ideasonboard.com>
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from mbus_config
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>
Date: Tue, 02 Sep 2025 13:28:37 +0100
Message-ID: <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_053454_769030_E852C34D 
X-CRM114-Status: GOOD (  32.08  )
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

Hi All,

Quoting Laurent Pinchart (2025-08-19 03:44:13)
<snip>
> > > > > That would need to parse the endpoint every time we start streami=
ng, it
> > > > > doesn't sound ideal.
> > > >=20
> > > > Perhaps not, but does that matter in practice? Parsing the endpoint=
 is,
> > > > after all, fairly trivial. The advantage would be simplifying drive=
rs.
> > >=20
> > > It's trivial from a code point of view, but it's not a cheap operatio=
n.
> > > I'd like to avoid making starting streaming more expensive.
> >=20
> > How cheap is "not cheap"? I'd be surprised if parsing an endpoint took =
more
> > time than e.g. an I=C2=B2C register write. Of course it depends on the =
CPU...
>=20
> Still, it's not cheap, and I think it can easily be avoided.
>=20
> > > > Alternatively we could think of caching this information somewhere =
but I
> > > > don't think it's worth it.
> > >=20
> > > Drivers likely need to parse endpoints for other reasons. I'd cache t=
he
> > > value in drivers, like done today, and pass it to a get_active_lanes
> > > helper.
> >=20
> > Then drivers presumably would also validate this against the endpoint
> > configuration, wouldn't they? That's extra code in every CSI-2 receiver
> > driver.
>=20
> Why so ? The number of connected lanes can be passed to the helper
> function, which can use it to validate the number of lanes reported by
> the source subdev.
>=20

Apologies if I'm interpreting this wrong, but it seems that the main
thing I'm reading is that this is not the correct place to implement
this, and it should be implemented at a higher level (e.g. in v4l2) that
lets all MIPI CSI reciever drivers use it?

I have noticed that similar functionality has been implemented as part
of __v4l2_get_link_freq_pad. Are you suggesting that I take a similar
approach and resubmit as a new series?

> > > > > > The function could take struct media_pad pointer as an argument=
, or struct
> > > > > > v4l2_subdev pointer and the pad number.
> > > > > >=20
> > > > > > I wonder if any other parameters could change dynamically but I=
 can't think
> > > > > > of that now, so perhaps just the number of lanes is what the fu=
nction
> > > > > > should indeed return.
> > > > > >=20
> > > > > > > +
> > > > > > > +   return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int en=
able)
> > > > > > >  {
> > > > > > >     struct mipi_csis_device *csis =3D sd_to_mipi_csis_device(=
sd);
> > > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4=
l2_subdev *sd, int enable)
> > > > > > >     format =3D v4l2_subdev_state_get_format(state, CSIS_PAD_S=
INK);
> > > > > > >     csis_fmt =3D find_csis_format(format->code);
> > > > > > > =20
> > > > > > > +   ret =3D mipi_csis_get_active_lanes(sd);
> > > > > > > +   if (ret < 0)
> > > > > > > +           dev_dbg(csis->dev, "Failed to get active lanes: %=
d", ret);
> > > > > > > +
> > > > > > >     ret =3D mipi_csis_calculate_params(csis, csis_fmt);
> > > > > > >     if (ret < 0)
> > > > > > >             goto err_unlock;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Thank you very much for the help!

Best wishes,

Isaac

