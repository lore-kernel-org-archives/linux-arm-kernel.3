Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF950C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIOxtXonhRWejNWq5rxRyT2kvdpRAuigNbl7XmTldVo=; b=VuPvNyMmfE6BBrggLw0EzxGiIr
	5LyzlBVF7jO9b/3wIveqM1V3OsoQwjDLGDo5h7fC2lFbR3oBbN/N+uDn7nNEh6b2q3olhg7TZNjeJ
	Uo612MLxyRZsTdo0+So6pMZ8gyjXqPXtmXeTZsOHLP+RBzrB7L5SskIsoyKFXHAV0t4nro8CAQ9Bz
	mvCu7WXrieaj3mMpevE/niwIMZ6EW1TDDsLE+1a/Oajq+6D+dcgdlMsQJB67oMkJVCG07Y+/3IvdM
	BnjhAOwFxmgIt/cx9zwYL3uG0qTUewH+It/WEfZF8kwY3ING0uopoaiEfUyd9ilMfBAqBfgrho/e6
	cXXM5yLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbhu-00000002UMF-0dWc;
	Mon, 10 Mar 2025 11:54:06 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbEv-00000002QNq-12rN;
	Mon, 10 Mar 2025 11:24:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73C8843281;
	Mon, 10 Mar 2025 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741605844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIOxtXonhRWejNWq5rxRyT2kvdpRAuigNbl7XmTldVo=;
	b=DnjZuGuxEwPfPqwor/sH5Pai+QeBH4BGQz6SCaIyuecx+hsULkaMmRZ24I9+i1YqAFsiEC
	88/Ot/2+dooGKqzx/g7D+5Lglw5VLxEK0gkrEOPY1+OKpvolevV4NeZcZDJNu3I7TtspQ8
	J/wFp7NguwsuDNj5GMNyhkDnnsXgy8lO0uCYMPDR82VzmOWKureunDkzhhbvzW6+hBCw4k
	iuGaf1RSN9GnEjBjNvnLPPKbh9T0Rzwr6Gn5Lr8zwmCI7vGhiGnBakvIVjlclwTOO7Fra1
	dtqVi4uUqoN/SxwTVUoFsMx8XuEv4pnkXnKuWPhvhqKqvxMIhs3ioV/+sI8Gxg==
Date: Mon, 10 Mar 2025 12:23:58 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Binbin Zhou
 <zhoubinbin@loongson.cn>
Subject: Re: [PATCH 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <20250310122358.3c07ed18@booty>
In-Reply-To: <Z86gCjzuC5UFZBIL@smile.fi.intel.com>
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
	<20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
	<Z8sqJhbqEBla_Ch7@smile.fi.intel.com>
	<20250308003425.7b89bfb6@booty>
	<Z86gCjzuC5UFZBIL@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekieegtefhgeelieehhefgtdekffevgfegvdeggeelkeehjeetteethfevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhuihdriihhrghnghesihhnthgvlhdrtghomhdprhgtphhtthhopehluhhkrghsiidrlhhusggrsegrrhhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehrjhhuihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepshgsrhgrnhguvghnsegsrhhorggutghomhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_042409_596421_461EA8B4 
X-CRM114-Status: GOOD (  23.68  )
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

Hello,

+To: Alex Shi, Yanteng Si (Chinese docs maintainers)
+Cc: Binbin Zhou (contributor to English version of printk-formats.rst)

On Mon, 10 Mar 2025 10:17:14 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sat, Mar 08, 2025 at 12:34:25AM +0100, Luca Ceresoli wrote:
> > On Fri, 7 Mar 2025 19:17:26 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote: =20
> > > On Fri, Mar 07, 2025 at 12:19:08PM +0100, Luca Ceresoli wrote: =20
> > > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/v=
sprintf:
> > > > add %pC{,n,r} format specifiers for clocks") introducing them does =
not
> > > > clarify any intended difference. It can be assumed %pC is a default=
 for
> > > > %pCn as some other specifiers do, but not all are consistent with t=
his
> > > > policy. Moreover there is now no other suffix other than 'n', which=
 makes a
> > > > default not really useful.
> > > >=20
> > > > All users in the kernel were using %pC except for one which has been
> > > > converted. So now remove %pCn and all the unnecessary extra code and
> > > > documentation.   =20
> > >=20
> > > You seem forgot to update translation(s) of the documentation. =20
> >=20
> > I'm afraid I don't speak Chinese. :-) =20
>=20
> At bare minimum we can drop the same line in the list.
> Also in such a case we may ask a Chinese speaking person to review / corr=
ect /
> suggest the changes. I would not leave a leftover as it will be forgotten=
 so
> easily and documentation becomes not in sync.

Alex Shi, Yanteng Si: what is the process to update the Chinese
documentation after changes to the English one, considering I don't
speak Chinese?

The documentation [0] seems to imply it will be done by you after the
English documentation update, is it the case?

Otherwise, for this simple change, I can add a patch that looks like a
somewhat correct one for Chinese:

@@ -523,9 +523,8 @@ clk=E7=BB=93=E6=9E=84=E4=BD=93
 ::
=20
 	%pC	pll1
-	%pCn	pll1
=20
-=E7=94=A8=E4=BA=8E=E6=89=93=E5=8D=B0clk=E7=BB=93=E6=9E=84=E3=80=82%pC =E5=
=92=8C %pCn =E6=89=93=E5=8D=B0=E6=97=B6=E9=92=9F=E7=9A=84=E5=90=8D=E7=A7=B0=
=EF=BC=88=E9=80=9A=E7=94=A8=E6=97=B6=E9=92=9F=E6=A1=86=E6=9E=B6=EF=BC=89=E6=
=88=96=E5=94=AF=E4=B8=80=E7=9A=8432=E4=BD=8D
+=E7=94=A8=E4=BA=8E=E6=89=93=E5=8D=B0clk=E7=BB=93=E6=9E=84=E3=80=82%pC =E6=
=89=93=E5=8D=B0=E6=97=B6=E9=92=9F=E7=9A=84=E5=90=8D=E7=A7=B0=EF=BC=88=E9=80=
=9A=E7=94=A8=E6=97=B6=E9=92=9F=E6=A1=86=E6=9E=B6=EF=BC=89=E6=88=96=E5=94=AF=
=E4=B8=80=E7=9A=8432=E4=BD=8D
 ID=EF=BC=88=E4=BC=A0=E7=BB=9F=E6=97=B6=E9=92=9F=E6=A1=86=E6=9E=B6=EF=BC=89=
=E3=80=82
=20
 =E9=80=9A=E8=BF=87=E5=BC=95=E7=94=A8=E4=BC=A0=E9=80=92=E3=80=82

Can you confirm the above is a correct change?

Luca

[0] https://docs.kernel.org/translations/index.html

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

