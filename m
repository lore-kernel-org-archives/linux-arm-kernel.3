Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9D5C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk3RmzNM+4HATdUINCImQkM4yBkD8IUy+g/Mgaj5sVs=; b=HtIKdrZdPmKNGWF+DCgi9Cyjpz
	eDJYPDeoDrT0lzLBG6jEQelZUn2VkK/zQ7KxTPwTsZxVKQ/dtwc3VYMtkjws/zLHhYQh3bJR87g2o
	N2nnONn6myOvcDbtM5s3pyYQFncLZplz/awzwnfEVOnGXFUGgY0JpsNCWoEmqKi4X/RoDc/59IDpm
	HHeWgp5pCs0KAxv6XNYVb95GECvcws6xH9jqc0uuVpf1tnyEZwaVVkKqX1KKTjT0XIgaJ+akI7mDI
	wQNK9F6ceqQws1qdMZHo0MCxcYvWEpQ6iHJLK9LajqHVZ3C5mUNtXnjBb5qvPJxyHBuTIsITEZPUV
	Mdn2PEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9Kz-0000000Fb2q-1U9V;
	Fri, 24 Jul 2026 06:24:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9Kx-0000000Fb2U-3zXC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:24:49 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5b159850b16so75079e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 23:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784874286; x=1785479086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uk3RmzNM+4HATdUINCImQkM4yBkD8IUy+g/Mgaj5sVs=;
        b=Vc/PXOwFFxg2XzNDG7nhsY84hxpWbMMalDmey5DOKX7cErskLXd0jzl5GtlzGYMLGZ
         AuDAnaJWwhBLY1LZaCsiFaITKiNZ162Gd3P7Bhy4BwjjnOwXsxgcLES1pa8qfNHzOqWK
         Si/GkLbYdXS/ZgYhRCFBnYsUrzYkwJdyeBsfRV5FoXbLjTwAHSSzePGY2nA63Vxtkx9o
         w14Sua8Wr+5E8STfsrxgwU+pS+M8675MBX7p5/AE5GHL4xQSy2aWF8qUT5SNEvXaee1z
         N8vrlpPBchXwEQhWsyz7xAPKyPomyk5CFrdWop+y6d2uHp7QYAiM0E4Bn279E7IwkEcC
         1Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784874286; x=1785479086;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uk3RmzNM+4HATdUINCImQkM4yBkD8IUy+g/Mgaj5sVs=;
        b=Vm5f980eBPaFQFw2L5C1HUU9/Kesh7ot6tbR8d62SGMM1HSV8ss82CrbLwtXWVWp7/
         3OtDFV6KG+IK3o4giLz/JShY7r4FXhVEkT5O+CSJtz2ePg9arxtkUw1+XWuJUqDkc3Re
         E6zb0d5qJBAVAs1J6IgP057PvxqAGde5pHr1v6zRm0zUavOCstks0s9fwg5xvOCe9ZC/
         ULfthjutq5qeMboolVkW4BOhN3Njiv2jSt9Md6+IGYXYM/g4zaJCg5gyp36icwOsl3Zg
         7Py1ikz0jAQjZMhFEFtCmEqqIUguPinv0j9mD8/146UDTRvfm+WFPVgpV1UYsnrC5Ib6
         XVHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrunKCLDc2mRTWt91dZWBtyuJ+etsYdQvWixwSEvgXtsWsoksTPzHkfFa4noS1wNL+In+/PlUryucG5tV4Be5PM@lists.infradead.org
X-Gm-Message-State: AOJu0YziO1Nw0bORouoQT3KFM4H88pzvVEMzYGqvjfz9fNyQQKkf1nim
	fMc1CNv7FwKVYUl0Gf7iGhk8NyIfbV9etUKobSjiOLyeqGGnCoDvMSm+
X-Gm-Gg: AR+sD13URnU8D/oqgZzZfZSJ9zT24S6tM/2ESJ2xspMJJgk8CX/WGglRUvAACHG7DgN
	g/mUtD9VSwRomBIa7YvnfBSfkbYexT898YE9E1uh/qQ5NhMxfHhbxfJ89EW+cgMYy7NijvGb4oj
	MAENSEQbUqOywNr2uJvx2s5zrUm0T/9Zy73Prae/QQB7zCl71CKD59B2NH0R5H3uWYiq4CEgckD
	k/I/I49BDlhF/0kpOfJlJhM5hBXyqJa+jeNFFLmvkGwfHYYPzH/eZ3klXD0qFa64NN9OKpnnY7H
	Ghstww6kfhs1E1hBG3mD4obuBqhO2JZPRGTup5jJo2a8/vfmIFRL1lhRF0PmUNjAec2/7tCjzdz
	1Lzxk/Ik57aFyDtoR2WFhrySwojWQ6Mhn+cVN7yZYe5JuDz626rgP7K22kmwNNgSMNna1Cf/PW/
	eZsrY1JztBk8h//Oe0yZ5rBSta0RhJip80U5KobBk=
X-Received: by 2002:a05:6512:3f18:b0:5b0:1bef:2e9a with SMTP id 2adb3069b0e04-5b2b2f6c64cmr1248999e87.33.1784874285299;
        Thu, 23 Jul 2026 23:24:45 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8cd32sm1402967e87.11.2026.07.23.23.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 23:24:44 -0700 (PDT)
Date: Fri, 24 Jul 2026 08:24:42 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 2/7] i2c: mux: add idle_state property to i2c_mux_core
Message-ID: <amMFKitmfeGqMxXL@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-2-a5010d623a57@gmail.com>
 <d76f9802-5da8-4058-a6b6-4a782c1f2e3c@lysator.liu.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tTt7g7QxyG1DLvq9"
Content-Disposition: inline
In-Reply-To: <d76f9802-5da8-4058-a6b6-4a782c1f2e3c@lysator.liu.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_232448_023153_284520CC 
X-CRM114-Status: GOOD (  21.50  )
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


--tTt7g7QxyG1DLvq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On Thu, Jul 23, 2026 at 01:04:11PM +0200, Peter Rosin wrote:
> Hi!
>=20
> On 2026-07-19 16:59, Marcus Folkesson wrote:
> > Muxes treat their channels differently when idle.
> > Let the mux core have this information to make it available for
> > internal use.
> >=20
> > Possible idle states are:
> >   - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
> >   - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> >   - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
> >   - <n>: Enable channel n (starting from 0) when idle"
> >=20
> > Default value is set to I2C_MUX_IDLE_UNKNOWN.
> >=20
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>


[...]

> > +/*
> > + * Mux drivers may only change idle_state, and may only do so
> > + * between allocation and registration of the mux controller.
>=20
> This is simply not true. It is a limitation imposed by your series.
> The pca954x driver has a hook to change the idle state at runtime
> (the change takes effect the next time the mux is deselected).
>=20
> Cheers,
> Peter

I see.
I will update pca954x driver to make use of
i2c_mux_set_idle_state()/i2c_mux_idle_state() instead.

As the state may be changed in runtime, I will also verify that the state is
allowed for the current clock configuration in i2c_mux_set_idle_state:


static inline int i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int sta=
te)
{
	switch (state) {
	case I2C_MUX_IDLE_AS_IS:
	case I2C_MUX_IDLE_UNKNOWN:
		for (int i =3D 0; i < muxc->num_adapters; i++) {
			/*
			 * idle_state is incompatible with channels that have a
			 * different clock frequency than the parent adapter.
			 */
			if (muxc->adapter[i]->clock_Hz !=3D muxc->parent->clock_Hz)
				return -EINVAL;
		}
		break;

	case I2C_MUX_IDLE_DISCONNECT:
		break;

	default:
		if (state < 0 || state >=3D muxc->num_adapters)
			return -EINVAL;

		/*
		 * idle_state cannot select a channel with a different clock
		 * frequency than the parent adapter.
		 */
		if (muxc->adapter[state]->clock_Hz !=3D muxc->parent->clock_Hz)
			return -EINVAL;
		break;
	}

	muxc->idle_state =3D state;
	return 0;
}


Best regards,
Marcus Folkesson

--tTt7g7QxyG1DLvq9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmpjBSUACgkQiIBOb1ld
UjL8SBAAn9sqiep2ZxOIZiVpcYjHr3PN9JfZ5tyUvL3BoL6EVfw2m+AD78GkB2Aw
WM3WBkbEhA76yCcRYo4FDe3CmxJEaTzLzhGMoka+CkiMIJVQf3naFrhrJjcvD+bn
i99rZc9nsdPj51hafKHsA2smbMZVyYo6Om+oB5x8hY1uHLlHFStjJryg4Ew8JRIH
nLLAq/ezARds3v8KW9me8232YLZu4hotfQHP9+GJC/b3Xc0R9qNvlTqk5GQ5F1fO
oIs/Zj1aEy/KSpr2JDlpeNbFI0ogCkecrnnB3DSScau3cFao/CEUwu/bArYw/FlU
lfYpECOzt1QhBvzUR9T8be4QI7Tdxe3eLx6DQof8g4taL9nn/P2rTwiEbhHC4px/
kidsEltAj6m19DS3yWPbIsrQCOFy/UhsIX7TH2bci8hzcNXoSUZbnspT5fhkIhuO
JN9s2RrbO/YsIDAhiOWl1jbOM3/QJn8IvTCnYYhmRgnnnxy9f3dJWjcFCAo1148+
1++pE1c8Bec25hstlRNJk9+3ezhFYQNWvbG5TZgrQvGHT7I4uLuiFpK2MOG7P1to
RwZgF35SoabaucJsoRy2DxGYnNrxovPEufrKLJN9YB7D8xfohsnkQ1C4QAYokjcq
AmfIjfjVvK2EPceSpV6mhfOgRrC1ylfbf64SUlDNRdByvnbANiA=
=l99G
-----END PGP SIGNATURE-----

--tTt7g7QxyG1DLvq9--

