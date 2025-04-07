Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35755C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=; b=UufV2hjBUyOA2e7fUiiF9tFpYU
	5PYYvRC4odsqRG0RCRM9o9d4Ao/Ihh9Fxklabl8durwToEr6bPN6pbgHqBZk4FvuV+D48O/Q24TTc
	tc6RtpvsGbS2rEflaWQBnx0hHL28VuD7CsBScPBZc4+wapf1F6eEkA5Sh8AGq144Su32Q6Gd0WHyj
	SXBGF+zT/4QUkQnRxM31+60Ifcsdr38CE2t4HNvRMlrS1hvVNN5GCL8dhkNfH806WlIJi0OZfHXER
	QmmlFzGh/DayHsPDaU1gwAbmBm3+Wvv3fRGGYMb1axkJmFODq0q5+MNss2X9Nl5x/+zM71wQPbpM4
	SUea3FNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJb-000000025QT-27FS;
	Mon, 07 Apr 2025 21:47:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s8N-00000001orE-1gLc;
	Mon, 07 Apr 2025 19:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=; b=WNfTXju/J+uQEFb71+wGkU7uTO
	lEP6eHOaRDzTh3qLjRqAfnGM6fHND/o3GN8b+yXKxHdSx0nvDr6EGDcrDq6nJW1p4bZuwS8z7AcOm
	2wWmNDtURDi43mPRmnKRM6+h6F02F25Rh6Xi4PJ6As8/s6KKopMqqKYT6g1TxNuwnfAsa5yPZxF1W
	DYQ51qMzX+brwujfsaXQYLZ52TK0/zmwATyhtb2fofpXR7XJyJdco80PCkVrVfLitc/TaZNiA7KKT
	j506dIJnR170KpmTofNel0cdtsCivy2FC4BYqGIhOCVhEw13ujtG0VWB7bAZqxvrzI5NAPlsaF/FE
	tO4ok1fg==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s8K-0000000885B-0kXO;
	Mon, 07 Apr 2025 19:27:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37D604421F;
	Mon,  7 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744054065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=;
	b=Gi+8MJKk54bvu0U11jHOJw08NvtnpAzunZzJXO4mlFlnzsLVy8DFQIv5f1cwemOl31f/in
	yXq1Um8EF62nuW+7K5/FANGhJKfIDt3FpxkAeF2Uw52NGHGgsgSLt5hId5UF1i3v6U7LiQ
	QV71SvnJzRB4Bv9Y0pBT6LtPqcjAci3aXj9uPyPUUIhwMeK2lXlaYCBe0svd+nHK7Htak4
	/9HotCk7aCwdmAu+N82j0bdVIG/9XNextLdkUXD3MPHCRUDF3rNzBb5f+B2kzx0rN1agcB
	y2M7EU6B7HGxiOcK1BDKg9fGTg+UZIk8/GVGNr8AJuzWT4pQ2/Cw+JF6m2DEKA==
Date: Mon, 7 Apr 2025 21:27:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250407212739.1e991b6a@booty>
In-Reply-To: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
	<20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
	<a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeefpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_202748_372309_68140329 
X-CRM114-Status: GOOD (  21.60  )
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

Hello Ilpo,

On Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Mon, 7 Apr 2025, Luca Ceresoli wrote:
>=20
> > This is the new API for allocating DRM bridges.
> >=20
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >=20
> > ---
> >=20
> > Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> > Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platfor=
m/arm64/acer-aspire1-ec.c
> > index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16=
a4c813fc16be997b9 100644
> > --- a/drivers/platform/arm64/acer-aspire1-ec.c
> > +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> > @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *clien=
t)
> >  	int ret;
> >  	u8 tmp;
> > =20
> > -	ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> > -	if (!ec)
> > -		return -ENOMEM;
> > +	ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> > +	if (IS_ERR(ec))
> > +		return PTR_ERR(ec);
> > =20
> >  	ec->client =3D client;
> >  	i2c_set_clientdata(client, ec);
> > @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *clien=
t)
> >  	fwnode =3D device_get_named_child_node(dev, "connector");
> >  	if (fwnode) {
> >  		INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> > -		ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
> >  		ec->bridge.of_node =3D to_of_node(fwnode);
> >  		ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
> >  		ec->bridge.type =3D DRM_MODE_CONNECTOR_USB; =20
>=20
> Hi Luca,
>=20
> It took a while to locate where the code for the new helper is. I suggest=
=20
> if you need send another version of the series directly linking to the=20
> commit in the cover letter so that it won't take multiple hoops to find i=
t=20
> if one wants to review the code and is not having all drm trees easily at=
=20
> hand. Here it is for the benefit of other pdx86 people:
>=20
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b=
715ea3d1ba537ef2da95eec

Apologies, indeed you have a good point. I added the link to the cover
letter so it will be in v2, if any.

> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

> I assume you want this to go through the drm tree where the helper alread=
y=20
> is?

MY best guess is that drm-misc-next is the appropriate branch, and it
is where the helper is already present, but I'll let maintainers decide
what is most appropriate.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

