Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7021CC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1apLwXpfvTkWHh+6/5h2TiHju9pcs5d/PyiuJeHcyg=; b=qbteaJ8gnPqzcfxQCbG9EsHwcO
	HW+22Pw381lOFPC+BDqHu7kSYOvcgZznR7ivw5zSBgOK4tkAZDWfvpqLkHVRZ2BDYvVftQHZYfZnL
	2PIh75wpcKXEEJ97EbjYyKrcF8s84Cj4xf/ERgH7FwfPTW0r+TxrbKUa7tFezHiZtg7jiPhqK/PH6
	XnhXA/X8lWCnzBwN39DWTL9pwK52Y4VQB8sYH7rFiS5GLEcZjRybRTc5/NqoX32fxI1Zqf+lGpRKT
	ZlUlHixs+QY4Bncs9EnGoZNuObdPf4a3OfxNeok1mp6U7Zwq8jfAge/NxC1hXpfdediQ3hvpWh/uL
	6IWe1zIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trv3b-000000050be-3dd8;
	Tue, 11 Mar 2025 08:33:47 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trv0a-000000050H2-2iPS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 08:30:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E359D442D7;
	Tue, 11 Mar 2025 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741681836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1apLwXpfvTkWHh+6/5h2TiHju9pcs5d/PyiuJeHcyg=;
	b=kIvSIzH4kJatWgUgEJ/ehWNJgd5eY/pHjJ8Eo+UBMSKZ7o/Tu1XnxNisVpdGgkl4N2SZH3
	Y5p07kTQhnaD7ig2BQG6R8hVVqEVK0emh2Rfm3CoN/ZMKgHcvceKkY/0NFjRkgdqhzhMq0
	Bj7L70Lt/SR289hrtzbhqbTHuazZzueaurhmFPpYD/P+7j0VJn/9VhK/81LJ5x60IIe6Q9
	CiSUTVOXh6wh9oN2OP5qYp4eOGxHHYujfg9Wj9xKmOA5WLJh95DnfRdngPP0iglYgExbG/
	B6mD58s9tWiDnas9fiDHZs10Xlu1gcCcLbzzg2UmOBS9WWCJxC7ZoFAcbfyprQ==
Date: Tue, 11 Mar 2025 09:30:27 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v1 1/1] stmmac: intel: Fix warning message for
 return value in intel_tsn_lane_is_available()
Message-ID: <20250311093027.4546e766@kmaincent-XPS-13-7390>
In-Reply-To: <3bc2cc11-3a87-479e-a0e0-c593e3214540@linux.intel.com>
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
	<20250310152014.1d593255@kmaincent-XPS-13-7390>
	<3bc2cc11-3a87-479e-a0e0-c593e3214540@linux.intel.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddujeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeegiedrudekkedrvdefledruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddukeekrddvfeelrddutddphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohephihonhhgrdhlihgrnhhgrdgthhhoohhngheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoo
 hhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_013041_317960_A5993A7C 
X-CRM114-Status: GOOD (  22.29  )
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

On Tue, 11 Mar 2025 13:33:42 +0800
Choong Yong Liang <yong.liang.choong@linux.intel.com> wrote:

> On 10/3/2025 10:20 pm, Kory Maincent wrote:
> > On Mon, 10 Mar 2025 13:08:35 +0800
> > Choong Yong Liang <yong.liang.choong@linux.intel.com> wrote:
> >  =20
> >> Fix the warning "warn: missing error code? 'ret'" in the
> >> intel_tsn_lane_is_available() function.
> >>
> >> The function now returns 0 to indicate that a TSN lane was found and
> >> returns -EINVAL when it is not found.
> >>
> >> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
> >> interface mode")
> >> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com> =
=20
> >=20
> > This patch is a fix it should go net instead net-next.
> > Could you resend the patch with net prefix?
> >=20
> > Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> >=20
> > Thank you! =20
>=20
> Hi Kory,
>=20
> Thank you for your feedback. I understand that the patch is a fix. Howeve=
r,=20
> since the code is not yet in the 'net' tree, we are unable to apply the f=
ix=20
> there.
>=20
> I'm not sure if there is another way to handle this fix other than sendin=
g=20
> it to the 'net-next' tree. I would appreciate any guidance you might have=
=20
> on this matter.

Oh, my bad! In that case you are right to send it to net-next. Sorry for the
noise.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

