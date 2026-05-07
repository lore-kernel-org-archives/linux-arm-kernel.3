Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689D4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MirORJ/xODrUNsE9K1GDry31szTlmO/Fh+672eoJv6Y=; b=o7tSydtEyX1CGvFNowFe4K51D9
	CnKMBbfc9kp0l2ofX3GfSWwPLGPC/43O1C8rrjcxJO9HDSSnxPXvBz7tRssaCyX3org/FJNbAt/Px
	zb7gbv8vdCyfLhATdrEIkybuDIoDtZ223wIupMZhe3v9gVt+Ta6xArIEq82LPN86OP3pCAzTFFuG7
	zyLF3rRavm/PpLnQVSW/QADlDLQxvNwt35yNsD3MOSTMNS7e9fBPgwDtIrOObCnt/xcUUXlIMb+tU
	yWrqMU82S+eE1a5URbRkvTO/Tx5hv6jsQTu0wc5h88USmIkF/BYu4Z6fa3QCSCwSf/pP+4JBbCF8Q
	DjNsthhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKywo-00000003vjP-3yiM;
	Thu, 07 May 2026 13:39:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKywm-00000003viH-0Vnp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 13:39:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso668814f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161161; x=1778765961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MirORJ/xODrUNsE9K1GDry31szTlmO/Fh+672eoJv6Y=;
        b=MN5GkFGg6Iq3V90Lb5on8mdtk0XkOm5IftZVKbmCV865D+si/6hvGkEvHXfG0Zac12
         LIhf5uBrQQrar9VTF4930mok5qm1JzfGNmZsUk6mZ9UwkN1MKJMXGqWa+D4bQIslVYrI
         PO8Sy1g8kEv5vMGdAz9/Czs2V95uRG06IG9LUiPDzy//YlYEnUs45Ywzh96rQjtxg8oh
         QfHxiWsz2YEx19UOz/GiXY/1HycIZGoMJ+ijNsViWgqXPisyvYi2UYnqha2yyGIuOur6
         T9rD19D5n6J1eUaaVdR56bZSe5SHrJ713r3m/y17C0xG8p/snDSk58rQypBfdUUbO/PC
         knPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161161; x=1778765961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MirORJ/xODrUNsE9K1GDry31szTlmO/Fh+672eoJv6Y=;
        b=LvALUWu30FC2y3gR9sU9HTKn3iZk7YFCu34hoApiKfMIbbw8KZJnvm3h1Ko2REmLXl
         T7RWsNtwzZDz60S3DJFA86RRlKK4pXm8STzC2vYS/x2ipCygDri2n14MkN8Evt2XN0Z7
         4aCIIoK1l+GbpTJcqSWSjw/KKWYTGGT/z5lJ9GeKidVg4fXDDTNrFzO1by/E3ZBGF/dj
         Sb7FkaDfizFtIkj8P5LJqR04FvyznELdNOx9av2g9FsyDXJWuJYBNUFVEg8kWcnQZIeI
         QboYsEMxyhqNvr7O0MDBXtYO32zQA2/6rOUxcyaKEekY6GuUE++hU1GJipOiYpX5CbaK
         +JKA==
X-Forwarded-Encrypted: i=1; AFNElJ8RRGYPVOU1bMjQE/VTJEClocxFJS4iR3XevmnWMh1As6jutr03d5ZrZbp2pOtemxoZaMo89+LSQWPHXx0y+jP/@lists.infradead.org
X-Gm-Message-State: AOJu0YwfOif0FbuZFwqL7+28FLOC0lENiq7awhWsGuWLmL3F9zm4vhca
	PiWZH/50WHRzkvhQib9XdLz8ODS9XM3VjuaJTDYC7B0Ad5mu/9ioPm31
X-Gm-Gg: AeBDievjUtegvwQBBhlz4rgZbsMWTEJQkbXECfhJSrDkpJJjQdxWRY0r5PRr9YnmNDC
	Gl6Hr0Kojb3C4LUyjXF04b57L2KgzRRE2tcCc0p7vSlghUEzwSWS3NQCKpcVt8tKdfoYFDyiMWu
	l2Yx9yGGycSBGaR6yjKxAtJ6jr0QY0wVDcbxtFEXUbOADa9JRZRbevtqMNxhfVe+gea2JWq4PFo
	+1yj9JPSUZDs6lmk5/KBBhTHJC91XKJlFCLY+E1X4X5p2ARHloFgHetsNRDNqaAWVUQmKEaNrOD
	aFY1oKH4hvFXxaeslgl1WVx4bYxz1wuW4EJlkEN6ACY95FxqE2QyCIKU2fF/guV2y3SdLCSyfSU
	4Gp0UAvrRnSSJjXaJ/JbUaSbNk+qMcoUybjVo0VbnihmBPHeGio4AzL4jM6Nanp/lht/dNsLiGj
	6nRwAniLuAT7JI106lOg3zlItyaUQbPncC7QVSV80LSbvzvMFBNfsJoXBz3eump1vVq8u82unzV
	zyml09U8hzwY92YSv3PX9y4
X-Received: by 2002:a05:6000:200b:b0:43d:7b85:6c95 with SMTP id ffacd0b85a97d-4515d5c567emr13185884f8f.33.1778161161071;
        Thu, 07 May 2026 06:39:21 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02802sm20939063f8f.17.2026.05.07.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:19 -0700 (PDT)
Date: Thu, 7 May 2026 15:39:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <afyU2Doug7zK_p2r@orome>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
 <20260506125015.0108ef44@fedora>
 <20260506-golden-python-of-aptitude-ff972a@houat>
 <20260506170515.2d8511c3@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="asfzz3x46tacowfj"
Content-Disposition: inline
In-Reply-To: <20260506170515.2d8511c3@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_063924_185028_4B391C49 
X-CRM114-Status: GOOD (  48.40  )
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


--asfzz3x46tacowfj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

On Wed, May 06, 2026 at 05:05:15PM +0200, Boris Brezillon wrote:
> On Wed, 6 May 2026 15:12:37 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Wed, May 06, 2026 at 12:50:15PM +0200, Boris Brezillon wrote:
> > > On Wed, 6 May 2026 12:08:24 +0200
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > Hi,
> > > >=20
> > > > On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote: =20
> > > > > From: Florent Tomasin <florent.tomasin@arm.com>
> > > > >=20
> > > > > This patch allows Panthor to allocate buffer objects from a
> > > > > protected heap. The Panthor driver should be seen as a consumer
> > > > > of the heap and not an exporter.
> > > > >=20
> > > > > Protected memory buffers needed by the Panthor driver:
> > > > > - On CSF FW load, the Panthor driver must allocate a protected
> > > > >   buffer object to hold data to use by the FW when in protected
> > > > >   mode. This protected buffer object is owned by the device
> > > > >   and does not belong to a process.
> > > > > - On CSG creation, the Panthor driver must allocate a protected
> > > > >   suspend buffer object for the FW to store data when suspending
> > > > >   the CSG while in protected mode. The kernel owns this allocation
> > > > >   and does not allow user space mapping. The format of the data
> > > > >   in this buffer is only known by the FW and does not need to be
> > > > >   shared with other entities.
> > > > >=20
> > > > > The driver will retrieve the protected heap using the name of the
> > > > > heap provided to the driver as module parameter.   =20
> > > >=20
> > > > I know it's what dma_heap_find asks for, but I wonder if it wouldn'=
t be
> > > > better in the device tree and lookup through the device node? heaps=
 are
> > > > going to have a node anyway, right? =20
> > >=20
> > > I'm not too sure. Take the PROTMEM (name=3D"protected,xxxx") dma_heaps
> > > instantiated by optee for instance, I don't think the originating
> > > tee_device comes from a device node, nor is the underlying heap
> > > described as a device node. The reserved memory pool this protected h=
eap
> > > comes from is most likely defined somewhere as reserved memory in the
> > > DT, but there's nothing to correlate this range of reserved mem to so=
me
> > > sub-range that the TEE implementation is carving out to provide
> > > protected memory. =20
> >=20
> > Maybe we should be working on a dt bindings for heaps then? Something
> > simple like we have for clocks with a phandle and an ID would probably
> > be enough. In optee's case, it looks like it would map nicely with
> > TEE_DMA_HEAP_* flags too.
>=20
> Sure.
>=20
> >=20
> > The only two that wouldn't be covered would be the system and default
> > CMA heap if not setup in the DT, which shouldn't be too bad for this
> > particular use-case.
>=20
> I'm not opposed to the idea of describing the association through the
> DT (with a <phandle, ID> pair). My main fear is that it drags us into
> endless discussions around what's considered HW description and what's
> not (PTSD of all those DT-bindings discussions I suppose :-)), which
> ends up delaying the merging of Panthor's protected memory support.

FWIW, I plan on doing exactly that for Tegra. The way we wire things up
there is by referencing the protected memory by phandle via the memory-
region property (and a memory-region-names =3D "protected" for context).

It doesn't support passing a specifier along with the phandle, but maybe
that can be added (using something like a #memory-region-cells property
to mirror other similar bindings).

Thierry

--asfzz3x46tacowfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8lgQACgkQ3SOs138+
s6G3+g/9HA74siLrq2Ig7isjRJFtRcHmFnjq8EblmmVUlYSar61ejku2o14ju81i
ybe025hgJcVIPKuiYXscduXk8eOdVzix8Os/oFh3ZPHyMP0tuG8zC1HNjqsnLWPd
eha1cnD27rsFPgnSmhFFIYiThWDUzf2ynteIeul4Ax4z1LL1oqSpD3WH+9brO9fC
aUZOdU16WSEK6O5Yx/g8zX3id2trZzYfWCDueg0tGGLwcMvfXTuuSbz9e59C5EBj
SyMPiOrwT+EERP4FUfqPEnbt0CLnjhZnxekp//Lv2DwjzSSNIlFoeTczP/qjoeTf
iIf4FfLI1FA4zODWgX+OWlD9iq1QyDEIjzM0EHsSz9Fr1QTZeuvEN8C4gwMF8ZJP
nfejV/U9HvsE4jOuv25o6XSpVUXVulF8cAmWSb2gzEe0L2r3S7SJvc5fin5zY+ui
X4VlDMkw1XflRl+fte35xoi829RIFJkYC8drCV/mrP/ORzUwa/cO1MDhn7yougGH
bEoX4HFA1dl+rscnYASEUeoQP+1z+7IMdifsCZTMRUkPEOPmYXqVSIQkFEL/S00Z
46wlyQT1DP+De2fxipN4WUpaKmS61pjCibQYO/RO3sRSXUEUt/Hz2MabLrSy9QHx
J6PCv2dsBoF9pjVW2+kRPnxCm4AsjRJ3lQFHjh5HIZHWWs7ir6A=
=H2su
-----END PGP SIGNATURE-----

--asfzz3x46tacowfj--

