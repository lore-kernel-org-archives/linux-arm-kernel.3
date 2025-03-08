Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4BEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4BDdolMJwhTmd3sg9nav24+PSwSQ3Or8NtyKYxub74=; b=OwlsyzaF/fc+9dU1Aks7eadMXo
	Fhji/Lcxc625mD+AbsEDKbj+sE6edEKTv7wHO/A4HVp1FZ2BnoN+6nH00spsNnJ51bInrrLvSbKVA
	qqhwUtmdsUPdz4r2NFacsewGoBlDr90+XYEovgdc6kb4Xps2gGtGdTf8Rugnf8vyTxvldeHQZaDzg
	kLlslptqX0m4+oxS6m5LXrmlY6i/kHI4lH27bnWAPBrAUJpd03lcyd2elJpfDj+izjrhvVBvitduu
	/jYA2lf0+VNdhpGvL6TVc0xlko7mBqYKv2QMFCl7bHn6xQ854er8bZ8v17MJfUGB/ZQTpkobNOQuj
	t1lsMOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqx5C-0000000GrnZ-2Njd;
	Sat, 08 Mar 2025 16:31:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqx3Y-0000000Grfo-3Sdy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 16:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67570A459DF;
	Sat,  8 Mar 2025 16:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0032C4CEE0;
	Sat,  8 Mar 2025 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741451383;
	bh=SdeY4HUDR25gSwHntex8TgQMRjhWp1R3x/osJlwkf2A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NSzp+BIy+RyYAh5eXPfpEeXytNRO+Yn6QDm61AqJR8JPEZz8lPYUdH5rwAtQ05Xgi
	 nJ52JT45pfwi6qQmjNAQl3PQm42j3TaIFdCd9qBeOGwEiLP5I4ChuxG/eiUIvHz+gf
	 vFNeOPjjYakfsWHf3baQaOKsl1voaEzszbfYyZf3MV94dErx1nbWai2CFl3Azkw15j
	 rPpzaDB7MAis2oreAPGOwD994ClDh/BRvfWkNboiV69CTNipPu/XspI5zRPgzAWTgR
	 owYLqgaQkKxX174yazNjuFoEFyme0FYmA2oF6DDFWudPFsQy0VFIbtdTW9FkcU73tW
	 wdzVAijHUAy0A==
Date: Sat, 8 Mar 2025 16:29:28 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>, Dumitru Ceclan
 <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, Matteo
 Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman
 <alisadariana@gmail.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <20250308162928.72bd1d1b@jic23-huawei>
In-Reply-To: <54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
	<e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
	<CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
	<54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_082944_993109_98BA58DD 
X-CRM114-Status: GOOD (  47.82  )
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

On Wed, 5 Mar 2025 12:54:33 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> Thanks for the review David.
>=20
> On 04/03/2025 11:25, David Lechner wrote:
> > On Mon, Mar 3, 2025 at 12:32=E2=80=AFPM Matti Vaittinen
> > <mazziesaccount@gmail.com> wrote: =20
> >>
> >> There are ADC ICs which may have some of the AIN pins usable for other
> >> functions. These ICs may have some of the AIN pins wired so that they
> >> should not be used for ADC.
> >>
> >> (Preferred?) way for marking pins which can be used as ADC inputs is to
> >> add corresponding channels@N nodes in the device tree as described in
> >> the ADC binding yaml.
> >>
> >> Add couple of helper functions which can be used to retrieve the chann=
el
> >> information from the device node.
> >>
> >> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >>
> >> --- =20
>=20
> >> + *
> >> + * Return:     Number of found channels on succes. Negative value to =
indicate =20
> >=20
> > s/succes/success/ =20
>=20
> Thanks!
>=20
> >> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> >> +                                         const struct iio_chan_spec *=
template,
> >> +                                         int max_chan_id,
> >> +                                         struct iio_chan_spec **cs)
> >> +{
> >> +       struct iio_chan_spec *chan_array, *chan;
> >> +       int num_chan =3D 0, ret;
> >> +
> >> +       num_chan =3D iio_adc_device_num_channels(dev);
> >> +       if (num_chan < 1)
> >> +               return num_chan;
> >> +
> >> +       chan_array =3D devm_kcalloc(dev, num_chan, sizeof(*chan_array),
> >> +                                 GFP_KERNEL);
> >> +       if (!chan_array)
> >> +               return -ENOMEM;
> >> +
> >> +       chan =3D &chan_array[0];
> >> +
> >> +       device_for_each_child_node_scoped(dev, child) {
> >> +               u32 ch;
> >> +
> >> +               if (!fwnode_name_eq(child, "channel"))
> >> +                       continue;
> >> +
> >> +               ret =3D fwnode_property_read_u32(child, "reg", &ch);
> >> +               if (ret)
> >> +                       return ret;
> >> +
> >> +               if (max_chan_id !=3D -1 && ch > max_chan_id)
> >> +                       return -ERANGE;
> >> + =20
> >=20
> > Should we use return dev_err_probe() on these to help with debugging a =
bad dtb?
> >  =20
>=20
> I am not fan of using dev_err_probe() in a 'library code'. This is=20
> because we never know if there'll be some odd use-case where this is not=
=20
> called from the probe.
>=20
> All in all, I'd leave adding most of the debugs to the callers -=20
> especially because we do not expect to have bad device-trees after the=20
> initial 'development stage' of a board. The board 'development stage'=20
> should really reveal bugs which prevent the channels from being=20
> registered - and after the DT is correct, these debug prints become=20
> unnecessary (albeit minor) binary bloat.
>=20
> >> +               *chan =3D *template;
> >> +               chan->channel =3D ch;
> >> +               chan++;
> >> +       }
> >> +
> >> +       *cs =3D chan_array;
> >> +
> >> +       return num_chan;
> >> +}
> >> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIV=
ER"); =20
> >=20
> > We can make this less verbose by setting #define
> > DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
> > EXPORT_SYMBOL_GPL() throughout the rest of the file. =20
>=20
> I am not sure what to think of this. I use the good old 'ctrl + ]' in my=
=20
> editor when I need to check how a function was supposed to be used. That=
=20
> jumps to the spot of code where the function is. I'd like to see the=20
> namespace mentioned there in order to not accidentally miss the fact the=
=20
> function belongs to one.
>=20
> OTOH, I do like simplifications. Yet, the added simplification might not=
=20
> warrant the namespace not being visible in the function definition.
>=20
> > Also, I would prefer if the namespace matched config name (IIO_ADC_HELP=
ER). =20
>=20
> I had some lengthy discussion about this with Andy and Jonathan during=20
> earlier review versions. In short, I don't like the idea of very=20
> fragmented namespaces in IIO, which will just complicate the drivers=20
> without providing any obvious benefit.
>=20
> https://lore.kernel.org/all/20250222174842.57c091c5@jic23-huawei/
>=20
> >> +
> >> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> >> +                                         const struct iio_chan_spec *=
template,
> >> +                                         int max_chan_id,
> >> +                                         struct iio_chan_spec **cs);
> >> + =20
> >=20
> > There are some different opinions on this, but on the last patch I did
> > introducing a new namespace, the consensus seems to be that putting
> > the MODULE_IMPORT_NS() in the header file was convenient so that users
> > of the API don't have to remember to both include the header and add
> > the import macro.
> >  =20
>=20
> I do like this suggestion, and I believe this would be the balance=20
> between getting the benefit of hiding part of the symbols - while not=20
> unnecessarily complicating the callers. I know some people are opposing=20
> it though. My personal opinion is that having the MODULE_IMPORT_NS() in=20
> a header would be neatly simplifying the calling code with very little=20
> harm, especially here where including the header hardly has use-cases=20
> outside the IIO ADC.
>=20
> Unfortunately, the "safety" seems to often be a synonym for just "making=
=20
> it intentionally hard". As Finnish people say: "K=C3=A4rsi, k=C3=A4rsi,=20
> kirkkaamman kruunun saat". :)
> (Roughly translated as "Suffer, suffer, you will get a brighter crown").
>=20
> Let's hear what Jonathan thinks of your suggestion.

For this particular case my intent was that all the IIO exports that
are suitable for use in simple IIO drives will be in this namespace,
we just haven't started that conversion yet.

As such, having it defined from a header for this helper isn't a good
thing to do.  Generally I prefer to see in driver code what namespaces
are involved but do understand the other viewpoint. In this case I
definitely don't think it is appropriate unless we go for a specific namesp=
ace
for just this helper.

Jonathan

>=20
> Thanks!
> 	-- Matti
>=20


