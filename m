Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B2ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzqW0UIxkLVwrnz5nO9iomry07WZvBjE99qijc6UKPY=; b=ekaRsp4y+XC29QEi5+yH28+DEB
	O1d2P6SIOu0lN/7YWlD1xv5UUw2n3XmZOxf8KYYgqAZ4RnmJEqBsSaPdkFN7OfeVTz9iPP1LPNee8
	gFSFbA34FkTt+AtUSdMeaqiNMP1r6vLLHv62bMwz2d/DWXnc+QFIF7NWhtcNwhQuVCyg/79DMDLIa
	aJCbh2jqo6PAhobeancPi9JqWkBSNHULSUYvvXt/547ODlmLa1DELixvO6g044HASjMGEqBQ8Am94
	MXkQHEb0cojUhsljPWlIaRS1PTdMNJOPqvC4fGY0TcUjusAbBrUc+a+EP++wdGZbxQX79y+0pudMw
	rhbq4gBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EeD-00000008luK-2x0i;
	Fri, 10 Oct 2025 15:03:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EeA-00000008ltC-2JdZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:03:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so2526197f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760108585; x=1760713385; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzqW0UIxkLVwrnz5nO9iomry07WZvBjE99qijc6UKPY=;
        b=QQfFaI3V6PrkmRwqyF2WM3Kv/jli2PA6GtezvDWrNNONS4OipoVkmHuHgX2vUM68e/
         APH+uJZ40HKbfh9lPCSJKugrJha8Qa6Zdwe/O3WkLkY1jaUMzkvTlldP4FuTLtqZXyvZ
         ucpr/Xg3z2J5shn4bzTrC9EOd3NFWjovXj6P5nLf/wPlLSPyNUBpnkkaxclMAU4NRGyO
         +FYfnBnSXgxWuMdEtOQpASfOW7degaQWZ8tEnzUOw8gWt4+c2rgvE0m9AACohnL4Pu4P
         8fT+p2Ha7UlDP8ud4sqt5zQjdhkRqRYW6lD2GXg4VgwghQhcRYdkn6ovCDni+nphaqpP
         GfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108585; x=1760713385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzqW0UIxkLVwrnz5nO9iomry07WZvBjE99qijc6UKPY=;
        b=XOgOCAD9YGAKgvmOigSHb0OUt3VqArv1YXy85XuriwTrJ1nTQcEMQy3OWxnAYyY5YH
         5jL9mHh1s6YO30ZWqtKA/mIjO6x/2k5pVghyri/cFpdUSGmzftbQpRuJerGwp5q0W1pm
         4kfV+qwCem8apH0qAFGosFzgH9A7jNg72lYjSe1lr4J+WBxEgKaDTUKCOTXgja88LjH6
         TBfgeuJRbrzNXid0nObWbWafWKK+o36IJ5td2+/efrZpphMJu2mDxM01dCsG1MUrHCzf
         jsJuA7rlHVAbyPKLV+PeU4gZYlM1P37MbEu5P6K/OdkLYaylCM7Rnf5c1/rUJGAKN9do
         4ADA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+Jwr5502skG4LV0fWI2sqwqHd8xV1dgYPXSjMpXI+xiqzLG7/apeXjtEcbL+srMycYBup7jbbOG6B6vhaYns@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Frs4HeEExsSm04UG+9LxGsZ4ele8oshM+fDeJOuWXb/dr4XK
	GcbllQpJAGeIbX7HqcAIvnUQPn57uZ+1ay30pEBbfJoWW4mcaWmxoRFU
X-Gm-Gg: ASbGnctl+kcJL9+9VsksXLjWSA+wZskqksw1NCEHlscR08DvTAXcCNLNM1Uga1+VtxT
	OWgTyD8jj5t9DpBWxLKIdlNyg8PWBI/7p6bW14PldK0UuzGdxIxMbxvbJZK5CEh2nuAtj2sGf9T
	j9XzTBwAXv45qIZd3ot07YXswLA2Lc/29ycljrM4vEQq484hAok/y8QopPUt/Qikd+fpp0fvuw7
	P7+rPlggcz8KP9dNPD1q7mMqEt6ODVcIikLjqdqdOAvcwtRJxflneSXzVvG75Cc1jh+k+ui88kR
	44mP0Mc+i426+gzAOiblVJ/BIPp5pFQjJ06RP/HagE/01wkDPW4lhGeaalJX5nbSEejsnTLhPYc
	ac4W20TJcBNlN5bXvyxLnGWzTCtm45Sxwk1aJIxRFFsvF/5FLtFTaBOp0tWYePWksZsTo5dxSw0
	3W2jruCNGTuOkD2JUBgEy/qtGQBoyg
X-Google-Smtp-Source: AGHT+IEvrfkr4Hs8ezky5ByztyOWOZT//8TlXER1hkPoQxMLvS/Q90qX4bw9OAGlwL9NvM581MF52g==
X-Received: by 2002:a05:6000:186c:b0:3ec:c50c:715b with SMTP id ffacd0b85a97d-4266726d746mr7684721f8f.19.1760108584000;
        Fri, 10 Oct 2025 08:03:04 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm4665031f8f.8.2025.10.10.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:03:03 -0700 (PDT)
Date: Fri, 10 Oct 2025 17:03:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <graeplkpsgbolpnnq2pndpdb7fymyy7zvm37osbdtre347tns2@mjbgzwterefv>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3cjwywdpcegtiyhc"
Content-Disposition: inline
In-Reply-To: <86bjmeyh5m.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_080306_647072_F6A5F74E 
X-CRM114-Status: GOOD (  63.12  )
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


--3cjwywdpcegtiyhc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:18:13PM +0100, Marc Zyngier wrote:
> On Fri, 10 Oct 2025 14:50:57 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > On Thu, Oct 09, 2025 at 07:11:20PM +0100, Marc Zyngier wrote:
> > > On Thu, 09 Oct 2025 18:04:58 +0100,
> > > Marc Zyngier <maz@kernel.org> wrote:
> > > >=20
> > > > On Thu, 09 Oct 2025 17:05:15 +0100,
> > > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > >=20
> > > > > [1  <text/plain; us-ascii (quoted-printable)>]
> > > > > On Thu, Oct 09, 2025 at 03:30:56PM +0100, Marc Zyngier wrote:
> > > > > > Hi Thierry,
> > > > > >=20
> > > > > > On Thu, 09 Oct 2025 12:38:55 +0100,
> > > > > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > > > >=20
> > > > > > > Which brings me to the actual question: what is the right way=
 to solve
> > > > > > > this? I had, maybe naively, assumed that the default CPU affi=
nity, which
> > > > > > > includes all available CPUs, would be sufficient to have inte=
rrupts
> > > > > > > balanced across all of those CPUs, but that doesn't appear to=
 be the
> > > > > > > case. At least not with the GIC (v3) driver which selects one=
 CPU (CPU 0
> > > > > > > in this particular case) from the affinity mask to set the "e=
ffective
> > > > > > > affinity", which then dictates where IRQs are handled and whe=
re the
> > > > > > > corresponding IRQ thread function is run.
> > > > > >=20
> > > > > > There's a (GIC-specific) answer to that, and that's the "1 of N"
> > > > > > distribution model. The problem is that it is a massive headach=
e (it
> > > > > > completely breaks with per-CPU context).
> > > > >=20
> > > > > Heh, that started out as a very promising first paragraph but tur=
ned
> > > > > ugly very quickly... =3D)
> > > > >=20
> > > > > > We could try and hack this in somehow, but defining a reasonabl=
e API
> > > > > > is complicated. The set of CPUs receiving 1:N interrupts is a *=
global*
> > > > > > set, which means you cannot have one interrupt targeting CPUs 0=
-1, and
> > > > > > another targeting CPUs 2-3. You can only have a single set for =
all 1:N
> > > > > > interrupts. How would you define such a set in a platform agnos=
tic
> > > > > > manner so that a random driver could use this? I definitely don=
't want
> > > > > > to have a GIC-specific API.
> > > > >=20
> > > > > I see. I've been thinking that maybe the only way to solve this i=
s using
> > > > > some sort of policy. A very simple policy might be: use CPU 0 as =
the
> > > > > "default" interrupt (much like it is now) because like you said t=
here
> > > > > might be assumptions built-in that break when the interrupt is sc=
heduled
> > > > > elsewhere. But then let individual drivers opt into the 1:N set, =
which
> > > > > would perhaps span all available CPUs but the first one. From an =
API PoV
> > > > > this would just be a flag that's passed to request_irq() (or one =
of its
> > > > > derivatives).
> > > >=20
> > > > The $10k question is how do you pick the victim CPUs? I can't see h=
ow
> > > > to do it in a reasonable way unless we decide that interrupts that
> > > > have an affinity matching cpu_possible_mask are 1:N. And then we're
> > > > left with wondering what to do about CPU hotplug.
> > >=20
> > > For fun and giggles, here's the result of a 5 minute hack. It enables
> > > 1:N distribution on SPIs that have an "all cpus" affinity. It works on
> > > one machine, doesn't on another -- no idea why yet. YMMV.
> > >=20
> > > This is of course conditioned on your favourite HW supporting the 1:N
> > > feature, and it is likely that things will catch fire quickly. It will
> > > probably make your overall interrupt latency *worse*, but maybe less
> > > variable. Let me know.
> >=20
> > You might be onto something here. Mind you, I've only done very limited
> > testing, but the system does boot and the QSPI related timeouts are gone
> > completely.
>=20
> Hey, progress.
>=20
> > Here's some snippets from the boot log that might be interesting:
> >=20
> > [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> > [    0.000000] GIC: enabling workaround for GICv3: NVIDIA erratum T241-=
FABRIC-4
> > [    0.000000] GIC: enabling workaround for GICv3: ARM64 erratum 2941627
> > [    0.000000] GICv3: 960 SPIs implemented
> > [    0.000000] GICv3: 320 Extended SPIs implemented
> > [    0.000000] Root IRQ handler: gic_handle_irq
> > [    0.000000] GICv3: GICv3 features: 16 PPIs, 1:N
> > [    0.000000] GICv3: CPU0: found redistributor 20000 region 0:0x000000=
0022100000
> > [...]
> > [    0.000000] GICv3: using LPI property table @0x0000000101500000
> > [    0.000000] GICv3: CPU0: using allocated LPI pending table @0x000000=
0101540000
> > [...]
> >=20
> > There's a bunch of ITS info that I dropped, as well as the same
> > redistributor and LPI property table block for each of the 288 CPUs.
> >=20
> > /proc/interrupts is much too big to paste here, but it looks like the
> > QSPI interrupts now end up evenly distributed across the first 72 CPUs
> > in this system. Not sure why 72, but possibly because this is a 4 NUMA
> > node system with 72 CPUs each, so the CPU mask might've been restricted
> > to just the first node.
>=20
> It could well be that your firmware sets GICR_CTLR.DPG1NS on the 3
> other nodes, and the patch I gave you doesn't try to change that.
> Check with [1], which does the right thing on that front (it fixed a
> similar problem on my slightly more modest 12 CPU machine).
>=20
> > On the face of it this looks quite promising. Where do we go from here?
>=20
> For a start, you really should consider sending me one of these
> machines. I have plans for it ;-)

I'm quite happy with someone else hosting this device, I don't think the
electrical installation at home could handle it.

It has proven to be quite well suited for kernel builds...

> > Any areas that we need to test more exhaustively to see if this breaks?
>=20
> CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> this distribution mechanism (or the other way around). Another thing
> is that if firmware isn't aware that 1:N interrupts can (or should)
> wake-up a CPU from sleep, bad things will happen. Given that nobody
> uses 1:N, you can bet that any bit of privileged SW (TF-A,
> hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> around this).

Okay, I can find out if CPU hotplug is a common use-case on these
devices, or if we can run some tests with that.

> The other concern is the shape of the API we would expose to drivers,
> because I'm not sure we want this sort of "scatter-gun" approach for
> all SPIs, and I don't know how that translates to other architectures.
>=20
> Thomas should probably weight in here.

Yes, it would be interesting to understand how we can make use of this
in a more generic way.

Thierry

--3cjwywdpcegtiyhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpICUACgkQ3SOs138+
s6FDJw//Z8EjXFjdge1TNXnkHtxQK8LSe6eRlQEihBDapQ4FQ6BAOb8NAFUtFIXY
vxrW11tX8O5PayMJWl/D2Z6cetmE3/rMkCydpfDrtujbI4ZvtxypIP4c7bLqqtSp
DA5fCfzGW2CrAAZLKCt7kQUmFweJcMb/gn1uKOZfTmbveK59bO/08gTBb5FTvkfJ
Lptc7t0iuHsvAZThG6IdNKPlFjQRo7Y3fYrDOQODyr7k3vbnriVPb7d4VqfXShnv
ZpUXwLwieLxR5DtMTYucJ1rzlByUCRFRRKW/XFpi/AiZrgjRV5yX1URDq/eOSYRm
mJmfO2e15SwgsiQR0BDj2e0esxwTM1p4lsPvkS/tag7v9HchNXLVbaGWu1J1//Lb
9tIOnwA+YwEeu6b964cxcKWJ8Zal3H/wUTVzxOuyMmYFCl98AetlW22P/41IQIci
+1FkFb8NckVhkK7+WF+WuvXbJVpiDZuYhTK0gebLg8OjwF0iSCbDUht1mp88wIkF
M8hme8FQWI40P+9cTQZWiWHsrsWYVUY2f3jN5bJEroXH3yB/HYPhg338WXDUK2IE
wGLb63qfKxEEita5KJ0anMKIG0v9ka+FFRB4FNgeAi7oV78APjcRXGVcHN5LK5Jh
rIjE0ozAEbuF5FFfqaaTaAK/V3gYh/A1x8WylRwbHusveJzX8Aw=
=Pxmi
-----END PGP SIGNATURE-----

--3cjwywdpcegtiyhc--

