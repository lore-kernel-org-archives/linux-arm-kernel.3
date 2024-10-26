Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F452D10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4srLH1KzweK8wphi046lvXQC+g8tW3Da/fQeMwB13c=; b=Cx8FMUXOqwITI2n1Rrzw7IKPiC
	86MVlZAHdfNOauDuuiiq36pSr1Gap2wmlEKV3+B0ZNQmygfUq6iLVw+ghAbsBEjElZAfJr4nk6Qyg
	FK/7IPDgd4OvFk5+Da7jb/dljVkm7TU5P4qW1ATiSPdCfOyunssXHfJXI1+DNoolddcd5a/O2Qupu
	KF1Us2IF/u71TGGsfvbeloI5CnuBYXLu+CPsfWwSddwzK30C/UHfg0NqmtXVxK5w8qKNdK/Kfyjb0
	rbVQiHbDxmujqM7II7et2zXQgyYzTietM+yJKs8CbgynEx2bZkgoorXOgLObzcj5a3ETKF/+LCvvj
	ZfcWYZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fvi-00000006cW8-3DCp;
	Sat, 26 Oct 2024 12:30:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ftF-00000006c9j-2IIj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DADC4A4081B;
	Sat, 26 Oct 2024 12:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C28CC4CEC6;
	Sat, 26 Oct 2024 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945651;
	bh=aX6mtqMDDuRMLKNNH7o4YnE5my+zUXmBU6eo3tXrXwU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aKWLNq6VAKMcnkpPXKonLpZM86l8AXsgOyZjporptckA2vVeWeXHDmDkAYJy3WPqH
	 5Reo4m0CkJ4qcMV+e+cisDVhG1hqDsmS5SnBG7q92nAIH2ljcsHbEBMjLMiAUK1gFW
	 5c2akkQrwi8hXc5tH0PvsDnSCLhqb5tYu8bzpRDjK0xhk+1I7v3Fz9Yzu9TN+yGRFP
	 xiDQzuaQD/lqUR7VrCm0Oj2v6PzMMCJn80VOFeZtNSoD0k8eptS3KIyoi8l982TzR8
	 3V/5vSnKNs+CqBsiQMLU9O0g35+Qv6o093gEvjzGVk0fLZeie1wdxQmlGfW1/GEWKu
	 NDIfUA6Q940LQ==
Date: Sat, 26 Oct 2024 13:27:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com>
Cc: Julien Stephan <jstephan@baylibre.com>, Mudit Sharma
 <muditsharma.info@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Anshul
 Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit
 Ghosh <subhajit.ghosh@tweaklogic.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "chrome-platform@lists.linux.dev"
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH 5/7] iio: imu: inv_mpu6050: simplify code in
 write_event_config callback
Message-ID: <20241026132638.4ff2c8a2@jic23-huawei>
In-Reply-To: <FR3P281MB175799CC4895C8BC5B645236CE4E2@FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
	<20241024-iio-fix-write-event-config-signature-v1-5-7d29e5a31b00@baylibre.com>
	<FR3P281MB175799CC4895C8BC5B645236CE4E2@FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_052733_802121_8330B249 
X-CRM114-Status: GOOD (  18.85  )
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

On Thu, 24 Oct 2024 12:16:42 +0000
Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com> wrote:

> Hello Julien,
>=20
> good thing to know, thanks for the patch.
>=20
> Acked-by: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
Applied.
>=20
> Best regards,
> JB
>=20
> ________________________________________
> From:=C2=A0Julien Stephan <jstephan@baylibre.com>
> Sent:=C2=A0Thursday, October 24, 2024 11:11
> To:=C2=A0Mudit Sharma <muditsharma.info@gmail.com>; Jonathan Cameron <jic=
23@kernel.org>; Lars-Peter Clausen <lars@metafoo.de>; Anshul Dalal <anshulu=
sr@gmail.com>; Javier Carrasco <javier.carrasco.cruz@gmail.com>; Jean-Bapti=
ste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com>; Michael Hennerich <Michael.H=
ennerich@analog.com>; Cosmin Tanislav <cosmin.tanislav@analog.com>; Ramona =
Gradinariu <ramona.gradinariu@analog.com>; Antoniu Miclaus <antoniu.miclaus=
@analog.com>; Dan Robertson <dan@dlrobertson.com>; Marcelo Schmitt <marcelo=
.schmitt@analog.com>; Matteo Martelli <matteomartelli3@gmail.com>; Anand As=
hok Dumbre <anand.ashok.dumbre@xilinx.com>; Michal Simek <michal.simek@amd.=
com>; Mariel Tinaco <Mariel.Tinaco@analog.com>; Jagath Jog J <jagathjog1996=
@gmail.com>; Lorenzo Bianconi <lorenzo@kernel.org>; Subhajit Ghosh <subhaji=
t.ghosh@tweaklogic.com>; Kevin Tsai <ktsai@capellamicro.com>; Linus Walleij=
 <linus.walleij@linaro.org>; Benson Leung <bleung@chromium.org>; Guenter Ro=
eck <groeck@chromium.org>
> Cc:=C2=A0linux-iio@vger.kernel.org <linux-iio@vger.kernel.org>; linux-ker=
nel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-arm-kernel@lists.=
infradead.org <linux-arm-kernel@lists.infradead.org>; chrome-platform@lists=
.linux.dev <chrome-platform@lists.linux.dev>; Julien Stephan <jstephan@bayl=
ibre.com>
> Subject:=C2=A0[PATCH 5/7] iio: imu: inv_mpu6050: simplify code in write_e=
vent_config callback
> =C2=A0
> This Message Is From an External Sender
> This message came from outside your organization.
> =C2=A0
> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
>=20
> Remove useless code in write_event_config callback.
>=20
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 7 ++-----
>  drivers/iio/light/apds9960.c               | 2 --
>  2 files changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu=
/inv_mpu6050/inv_mpu_core.c
> index 5680be153127711777b6074da18a7a0f86211d6c..21ebf0f7e28fec302cbf8ab89=
0fc53a3de6f36cd 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> @@ -1176,21 +1176,18 @@ static int inv_mpu6050_write_event_config(struct =
iio_dev *indio_dev,
>  					  int state)
>  {
>  	struct inv_mpu6050_state *st =3D iio_priv(indio_dev);
> -	int enable;
> =20
>  	/* support only WoM (accel roc rising) event */
>  	if (chan->type !=3D IIO_ACCEL || type !=3D IIO_EV_TYPE_ROC ||
>  	    dir !=3D IIO_EV_DIR_RISING)
>  		return -EINVAL;
> =20
> -	enable =3D !!state;
> -
>  	guard(mutex)(&st->lock);
> =20
> -	if (st->chip_config.wom_en =3D=3D enable)
> +	if (st->chip_config.wom_en =3D=3D state)
>  		return 0;
> =20
> -	return inv_mpu6050_enable_wom(st, enable);
> +	return inv_mpu6050_enable_wom(st, state);
>  }
> =20
>  static int inv_mpu6050_read_event_value(struct iio_dev *indio_dev,
> diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
> index 3c14e4c30805e1b596ef2380f94e6aa3e92082b1..3a56eaae5a68f2891d061871c=
7013f0b5447bb47 100644
> --- a/drivers/iio/light/apds9960.c
> +++ b/drivers/iio/light/apds9960.c
> @@ -762,8 +762,6 @@ static int apds9960_write_event_config(struct iio_dev=
 *indio_dev,
>  	struct apds9960_data *data =3D iio_priv(indio_dev);
>  	int ret;
> =20
> -	state =3D !!state;
> -
>  	switch (chan->type) {
>  	case IIO_PROXIMITY:
>  		if (data->pxs_int =3D=3D state)
>=20


