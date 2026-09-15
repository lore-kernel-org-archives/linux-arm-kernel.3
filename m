Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A800FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLade1J4X8dbW8jjKPA4ezZCb7Mat50pBlK8zjhX+qU=; b=WTVqF5AoL/ZxY08NSrF8QXYP2h
	lzK7Ph7xozIu5C7GVRBvKwGp3afdxylFNXYbGdjJRa4xSi8tLcnZ5AnLIl1/7GFjMxG/WfNLupl+V
	RwjgIdtDwwBpEDk6Q+sSS20OOntPsroEIInm1N3ELobuQiwyTbiFj0Jxuju/hG7khH+x8Dgsh+EPc
	AxAbz20xwUFy5QmxD/QsFtiP4xSimiOIEnKFY7bE7H/pfjQFd25q4rxdgp0aibDfT5pHJftj2Ywcq
	W8VsJnD/germXub0BW6g2TlH2OJsJBstBBfraZ6xNL88lkfDyyapoDeOs28HL6edChDCpi2VkYy6W
	8oZxly2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RdJ-00000006Hda-0Go3;
	Tue, 15 Sep 2026 11:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RdH-00000006Hd7-1bhN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 11:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TLade1J4X8dbW8jjKPA4ezZCb7Mat50pBlK8zjhX+qU=; b=FlA0iblwwPPXDVwOZb0yHPYVEh
	fPz0Zl17IivFUa5DEzHbsuscYhlrDHlQp0HRRpDrj4BptonQOd9BnjqZYBv86IHeEqN6pHH4KIN5/
	vWRGAkbk3qSV86MqYbxit7FSTD3xPtNbP6kVuvQ7M/tmLpstyhMx1C2Ey8BSh5IjD5ZtkWajlVzGq
	59Ys0A6VXj4kLyvkgQs+yeEoUfV4702/FqM0GytND6Qu/e/lJHVhB0j8NaOzRXEQiKjADFCYoRjmG
	TUYdlQvPW5+OzHxScJ3K1O1D9WLqtk0+RHzn3lJATYlMGVvSy2HtEaMmuH8rsHlVLO4rR1KXLUIH4
	UUdmRsLA==;
Received: from mgamail.intel.com ([192.198.163.18])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6RdE-00000006fux-0GLu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789472844; x=1821008844;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=deAw/7TDEohbf1HV3Iyjt4R4cZRwIuWCKoEuiGhjWkQ=;
  b=R4YwD6YXMqAqTlKS1ReJNW45jO7dF3H4YiP9U0iqyWNpY8UuAu4WUTwO
   apiT08BsOpQaw/emQqWhjbOz7BY6C+2mgSzwnxWUEI41qJo1DLT76djev
   5wSgIjMAjWHFpkM30eVjBXnyNXrvA3zTIMoh9N3rd5+pihZxn8lL3/AZA
   W+Fd71pHE2jUmTayckExNF1kT9Kp3cjNu1Kt8mvCAsC2H/ztX2xBauZel
   XJJMzV/VUDkYenFMU6fl5oBi0qaRV4Lte+ZDPAB9DmKfOMjbQ7Sfx00l+
   /fqG+gZRLq883g9q7E9pDGQzlHY3Lt9Ze57JCjueekY5gVq01Ai7sfH8d
   Q==;
X-CSE-ConnectionGUID: f8aqIM4SSYShe7+mH1O7jw==
X-CSE-MsgGUID: Mu+jORJ3TqOr6PVLAhslpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88967171"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88967171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:47:21 -0700
X-CSE-ConnectionGUID: G6cPanw3St+oo08ir6C0kQ==
X-CSE-MsgGUID: Z+tNzAXeQFy/qftCJFxY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311254377"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:47:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 14:47:07 +0300 (EEST)
To: Long Zhao <longzhao@ambarella.com>
cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
    Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
    mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
    linux-gpio@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 13/15] serial: 8250_dw: add Ambarella CV75 quirks
In-Reply-To: <20260915-cv75-v5-v7-13-3297d3fbc9c0@ambarella.com>
Message-ID: <4eca948b-ebf7-ee86-78e8-af886f19ed0c@linux.intel.com>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com> <20260915-cv75-v5-v7-13-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-710529132-1789472827=:1365"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_124724_487848_3BB7AC10 
X-CRM114-Status: GOOD (  20.66  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-710529132-1789472827=:1365
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Sep 2026, Long Zhao via B4 Relay wrote:

> From: Long Zhao <longzhao@ambarella.com>
>=20
> The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> licensed block. At the register level it is close enough to DW APB UART
> that a full custom UART driver is unnecessary: reuse 8250_dw with a
> small platform quirk.
>=20
> Quirks:
> - keep IER ETOI (bit 5) set for RX timeout behaviour
> - skip set_rate; baud clock is managed outside the UART block
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 5fba913f3301..19431c476c55 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -43,6 +43,9 @@
>  #define RZN1_UART_xDMACR_8_WORD_BURST=09(2 << 1)
>  #define RZN1_UART_xDMACR_BLK_SZ(x)=09((x) << 3)
> =20
> +/* Ambarella IER: receive timeout interrupt enable */
> +#define AMBARELLA_UART_IER_ETOI=09=09BIT(5)
> +
>  /* Quirks */
>  #define DW_UART_QUIRK_OCTEON=09=09BIT(0)
>  #define DW_UART_QUIRK_ARMADA_38X=09BIT(1)
> @@ -60,6 +63,7 @@
> =20
>  struct dw8250_platform_data {
>  =09u8 usr_reg;
> +=09u8 ier_mask;
>  =09u32 cpr_value;
>  =09unsigned int quirks;
>  };
> @@ -572,6 +576,25 @@ static void dw8250_prepare_rx_dma(struct uart_8250_p=
ort *p)
>  =09dw8250_writel_ext(up, RZN1_UART_RDMACR, val);
>  }
> =20
> +static int dw8250_ier_mask_startup(struct uart_port *p)
> +{
> +=09struct dw8250_data *d =3D to_dw8250_data(p->private_data);
> +=09struct uart_8250_port *up =3D up_to_u8250p(p);
> +=09int ret;
> +
> +=09ret =3D serial8250_do_startup(p);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/*
> +=09 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> +=09 * timeout behaviour.
> +=09 */
> +=09up->ier |=3D d->pdata->ier_mask;
> +
> +=09return 0;
> +}
> +
>  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  {
>  =09unsigned int quirks =3D data->pdata->quirks;
> @@ -606,6 +629,8 @@ static void dw8250_quirks(struct uart_port *p, struct=
 dw8250_data *data)
>  =09=09p->serial_in =3D dw8250_serial_in32;
>  =09=09data->uart_16550_compatible =3D true;
>  =09}
> +=09if (data->pdata->ier_mask)
> +=09=09p->startup =3D dw8250_ier_mask_startup;
>  }
> =20
>  static void dw8250_reset_control_assert(void *data)
> @@ -879,6 +904,12 @@ static const struct dw8250_platform_data dw8250_intc=
10ee =3D {
>  =09.quirks =3D DW_UART_QUIRK_IER_KICK,
>  };
> =20
> +static const struct dw8250_platform_data dw8250_ambarella_cv75_data =3D =
{
> +=09.usr_reg =3D DW_UART_USR,
> +=09.ier_mask =3D AMBARELLA_UART_IER_ETOI,
> +=09.quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> +};
> +
>  static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data =
=3D {
>  =09.usr_reg =3D DW_UART_USR,
>  =09.cpr_value =3D FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
> @@ -889,6 +920,7 @@ static const struct dw8250_platform_data dw8250_ultra=
risc_dp1000_data =3D {
>  };
> =20
>  static const struct of_device_id dw8250_of_match[] =3D {
> +=09{ .compatible =3D "ambarella,cv75-uart", .data =3D &dw8250_ambarella_=
cv75_data },
>  =09{ .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
>  =09{ .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_octeon=
_3860_data },
>  =09{ .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_armada=
_38x_data },

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-710529132-1789472827=:1365--

