Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB587C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laPzi6AI5df0hYY8xCpaxh0N0Q/AFGk3Kz/EhxGguPo=; b=WyX4x+c6nQTXOf/r0hOow9fobo
	HPeDwppuOtjS9EcTfxzbn5487XXNtTVk92OTilhcQvTwi1ycgFDniDmfPTS0yhyEKsbRb0Umepkj+
	02x/SwPT2I3GPoO9dnyfaMg7tHMfu+8jn6S2qYhIBHV5h/bpfHJ5KO+tG2t6Tx0DTBgIj0MSTtc11
	MYQMkUDvei0cpRq1+pzJDRMY4nxBzTuhJNxlOA6P+F41r0fo98zrm+akEL0BZ+t3U5o0rsMWWxBq1
	bRxuqmoEQ+VDLtwakvRvnyXJu5/xXLX2kej9S1qBDsJSPFChRVypunLWHVA1BT4e68frWwULlsQkv
	4P2+KhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5et-00000006Fda-1CUR;
	Tue, 25 Mar 2025 14:53:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Qx-000000062xh-2L1Y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=laPzi6AI5df0hYY8xCpaxh0N0Q/AFGk3Kz/EhxGguPo=; b=awm0vLSh7x14LzdGXXY3y647uM
	76lUhNIZcMqok7/yCQITG/ntbOMDpI/tN1VTfizBzQF2ApBNpB/mhP+S9kJ37k7I2ZkiH97WrK6Gq
	b923Hxp9GJLoxrV0c67gnHMp8GjdNTY3sKuOqmmkAInAZnkSBuCbaa8lKxTlAItbzlrnk5Bhsd7V9
	mhEtK4jH+UpwajcSw2/vxYc9I9hK91KPPQDDBSi37MGfsZOt8txL38n3spgAnPcZ/iTmZx34R8KcQ
	NnB56jRiO0d6XhALC3Qs6K8gaGZJuuyUcxXy7xtwX8oHermRMSZ++vL1w1DPy1uL7bMDaVOpNlKQw
	HX/A+e0g==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4Qu-00000005T0k-1uLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:35:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65FFF44288;
	Tue, 25 Mar 2025 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742909704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laPzi6AI5df0hYY8xCpaxh0N0Q/AFGk3Kz/EhxGguPo=;
	b=mpCSdXTo+eVQSvjH2mkqzNcJ3dA0St0l8cbiIWzog554Nstg13Ec+f9qeBFJZJya/rr6D/
	PFmcm9zItkOtmf2lnVqHpcBqL2bFJ9zJl9wLDPMqcr8JeyZMO2J4/pCwm7oNanvkarN5D3
	45OsuA6Y5Tldb2CzDwrr76OueVSWySifM9qRKj0caKixcai5PUiN45Cm6eHCixQOcc8AVr
	Flp1Zyez1cNCQlvZgzSN9YqzI1K4nKlo9Xbvn+6z+XdcWYZmBOAB2nytcm4Hy8LLI8bpU4
	dXIpO9aNq/GNYIFKuhA7TXj87qWGUeOxsckPFdbNQ939OzmXCp1fYpi1Y9jABA==
Date: Tue, 25 Mar 2025 14:35:02 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 8/8] net: ethtool: pse-pd: Use per-PHY DUMP
 operations
Message-ID: <20250325143502.515e0bde@kmaincent-XPS-13-7390>
In-Reply-To: <20250324104012.367366-9-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-9-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_133508_590450_471854F9 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, 24 Mar 2025 11:40:10 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Leverage the per-phy ethnl DUMP helpers in case we have more that one
> PSE PHY on the link.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V4 : No changes
>=20
>  net/ethtool/pse-pd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/net/ethtool/pse-pd.c b/net/ethtool/pse-pd.c
> index 4f6b99eab2a6..f3d14be8bdd9 100644
> --- a/net/ethtool/pse-pd.c
> +++ b/net/ethtool/pse-pd.c
> @@ -314,4 +314,10 @@ const struct ethnl_request_ops ethnl_pse_request_ops=
 =3D {
> =20
>  	.set			=3D ethnl_set_pse,
>  	/* PSE has no notification */
> +
> +	.dump_start		=3D ethnl_dump_start_perphy,
> +	.dump_one_dev		=3D ethnl_dump_one_dev_perphy,
> +	.dump_done		=3D ethnl_dump_done_perphy,
> +
> +	.allow_pernetdev_dump	=3D true,
>  };

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

