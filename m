Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9899ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Cru0KQXdUgkdgtaf3ule6TMYGc98I0BCcQuHfuD5Og=; b=2LCTclesA58sbTwFZexwkTBChm
	qEkNpnKC5YF+6zfibk5AGiuNh0BL5nRRo9d2cCZs+Vzxo53+XtgF2QcB+y2XZjVVXQ0yKIC3ENAeV
	Dx2WRZOAjsc51/MXLDrmC3JfTetr8HtookOuIKIFr62BpnSuLBPtjtqqev+n1rhfp+cC78mtpC1J3
	Ox4ISYDMlNU71v+RyJOWR4S0K31kwwflFuehGhnzUG0bVaP1MkH6yr6UpG0eyDL3hDaSfXcq2ZpXd
	2w9tOLKfzVR2amYH6iC64UPWGyDeOFlPi/H4Ivlp+FjGMYOnhcA8mQQ7kt38GLlKwxJx3Ylr7kXvC
	txOhbseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWga-00000007yKs-2qeg;
	Mon, 25 Aug 2025 12:52:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVJT-00000007jMu-3rhE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A53D60207;
	Mon, 25 Aug 2025 11:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13ADC4CEED;
	Mon, 25 Aug 2025 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756121074;
	bh=XFCAtpJ/d92BaV2RcCmleQHUp/r6mqPPDKzSnsbrl8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ojMEJtVlaHdhwhg3QiH8bqRwbUWNBQRFRH5BtImPXDFnLkv5odG0KffEEct+EESFE
	 Q0SYEmrpBSdkhcIbbvZOY303oFUEcqz6i+Xq1zGnt4YYqEhsq5LqlOzpo6XydJUmsr
	 lZUraNH/7jNFVIQTohJu/0Xc9OHWuKoTUmhbT+sMEeRvZwUP/6LjiCxvnakdNQb2ET
	 UXVB9Vp5YvzhlEYT0lOWjZ0N+19LJJSSLYekOcmq4fowV3dh5GyH05fyoVNxOAjogP
	 PWzT3rdK/0hFbWUoQk1tcOf9nyuO2jsBLewpg7T697upcvAoMmOZk4GV9opPMqxCwq
	 JdbjyVmlkAljQ==
Date: Mon, 25 Aug 2025 12:24:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "O'Griofa, Conall" <conall.ogriofa@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Simek,
 Michal" <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, David Lechner
 <dlechner@baylibre.com>, Manish Narani <manish.narani@xilinx.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH] iio: xilinx-ams: Fix AMS_ALARM_THR_DIRECT_MASK
Message-ID: <20250825122425.4c656d31@jic23-huawei>
In-Reply-To: <MN2PR12MB4223B775F240DFD91C6131138B33A@MN2PR12MB4223.namprd12.prod.outlook.com>
References: <20250715003058.2035656-1-sean.anderson@linux.dev>
	<MN2PR12MB4223B775F240DFD91C6131138B33A@MN2PR12MB4223.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 20 Aug 2025 12:31:12 +0000
"O'Griofa, Conall" <conall.ogriofa@amd.com> wrote:

> Hi,
>=20
> Good spot, thanks again!
Applied to the fixes-togreg branch of iio.git and marked for stable.
Thanks,

Jonathan

>=20
> Cheers,
> Conall.
>=20
> > -----Original Message-----
> > From: Sean Anderson <sean.anderson@linux.dev>
> > Sent: 15 July 2025 01:31
> > To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>; Jonathan Cameron
> > <jic23@kernel.org>; linux-iio@vger.kernel.org
> > Cc: Andy Shevchenko <andy@kernel.org>; linux-kernel@vger.kernel.org; Si=
mek,
> > Michal <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; Da=
vid
> > Lechner <dlechner@baylibre.com>; Manish Narani <manish.narani@xilinx.co=
m>;
> > Nuno S=C3=A1 <nuno.sa@analog.com>; Sean Anderson <sean.anderson@linux.d=
ev>
> > Subject: [PATCH] iio: xilinx-ams: Fix AMS_ALARM_THR_DIRECT_MASK
> >=20
> > AMS_ALARM_THR_DIRECT_MASK should be bit 0, not bit 1. This would cause
> > hysteresis to be enabled with a lower threshold of -28C. The temperatur=
e alarm
> > would never deassert even if the temperature dropped below the upper th=
reshold.
> >=20
> > Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> > ---
> >=20
> >  drivers/iio/adc/xilinx-ams.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.=
c index
> > 76dd0343f5f7..552190dd0e6e 100644
> > --- a/drivers/iio/adc/xilinx-ams.c
> > +++ b/drivers/iio/adc/xilinx-ams.c
> > @@ -118,7 +118,7 @@
> >  #define AMS_ALARM_THRESHOLD_OFF_10	0x10
> >  #define AMS_ALARM_THRESHOLD_OFF_20	0x20
> >=20
> > -#define AMS_ALARM_THR_DIRECT_MASK	BIT(1)
> > +#define AMS_ALARM_THR_DIRECT_MASK	BIT(0)
> >  #define AMS_ALARM_THR_MIN		0x0000
> >  #define AMS_ALARM_THR_MAX		(BIT(16) - 1)
> >=20
> > --
> > 2.35.1.1320.gc452695387.dirty =20
>=20
> Reviewed-by: O'Griofa, Conall <conall.ogriofa@amd.com>


