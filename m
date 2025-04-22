Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD133C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBFonbp1846gJUgowkmr65IS6mdF3RNeO3rgyd2Q/Eo=; b=KkcpPLYBt9cQjAn/q4aqo/Q0/4
	vJ6rK471+rwY9e2jgM2ZoyhwBqMmoKgxXnMuKDPPDyiVdWSaVZ1K8DE7SXNlHzN2nRHk0u0AR0nFj
	MQD5GSI8vdDWprJF1QF7choRRiC+/XxRxuOFVBq1HxfIgRURmwiX0vu+4kFmv6fM8WE5gPrQttRZS
	cq0Pe9fMAPRvFy9RaDLypVVZDufz04Q7u7gIatJsw38GPsm/hR4gFIVD+tK+0pnwC7YBnV62Y5ABt
	4Ua65DkBhG9r2f9JjJ2kX3huOuRkGhl78ZhMTySgYdEAtpGRs+AzK7BciJ7Pp1TMQyn087hm3hqK2
	cCpj6ZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B58-00000006oTW-4C3V;
	Tue, 22 Apr 2025 10:42:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AX7-00000006gEw-0uT6;
	Tue, 22 Apr 2025 10:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kBFonbp1846gJUgowkmr65IS6mdF3RNeO3rgyd2Q/Eo=; b=0ajUgpR85H/WB0VfM6ExsXsJZ6
	r4c2SR6axdXYi7LGFGDp6+O0HRmFGJFhx+QMDUHgKLoMRUV1Tr5PQnRmRNgra4TMkPJWiinWz1ShH
	0FpICnCOjDKhCwrpEv+oX6tNXPYM+KDuOdyvY8bQZDTasOgWgX1ShFf9xXPHve/SZ4fc9cz2x7VIC
	/EbWB83m8i0f8X0iWBvP4/A9jCjOSKC/BLF6i1Ym5l4LS8UxJ+Gpd/CzbbwMXMrhvvsrPYoWDzVdQ
	dfIsfan5RLo4BsUIXaelLE7IZEa0SKsIZKmIBpyuWO/fZdtsxPlTik9RrxFV+vD8dler1Ljc2B/Q+
	PoV+iNhA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7AX5-0001S6-VN; Tue, 22 Apr 2025 12:07:16 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 2/3] nvmem: rockchip-otp: Add support for rk3568-otp
Date: Tue, 22 Apr 2025 12:07:15 +0200
Message-ID: <6053552.MhkbZ0Pkbq@diego>
In-Reply-To: <20250415103203.82972-3-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-3-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_030717_252213_073C51AE 
X-CRM114-Status: GOOD (  20.29  )
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

Am Dienstag, 15. April 2025, 12:32:02 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> This adds the necessary data for handling otp the rk3568.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>

On a Quartz64b
Tested-by: Heiko Stuebner <heiko@sntech.de>


> ---
>=20
> Changes in v3:
> - rebase on rk3576 and rk3528, changes suggest by Jonas
>=20
> Changes in v2: None
>=20
>  drivers/nvmem/rockchip-otp.c | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index 45bbb6147fb7..cfb69bc58869 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -27,6 +27,7 @@
>  #define OTPC_USER_CTRL			0x0100
>  #define OTPC_USER_ADDR			0x0104
>  #define OTPC_USER_ENABLE		0x0108
> +#define OTPC_USER_QP			0x0120
>  #define OTPC_USER_Q			0x0124
>  #define OTPC_INT_STATUS			0x0304
>  #define OTPC_SBPI_CMD0_OFFSET		0x1000
> @@ -184,6 +185,58 @@ static int px30_otp_read(void *context, unsigned int=
 offset,
>  	return ret;
>  }
> =20
> +static int rk3568_otp_read(void *context, unsigned int offset, void *val,
> +			   size_t count)
> +{
> +	struct rockchip_otp *otp =3D context;
> +	u16 *buf =3D val;
> +	u32 otp_qp;
> +	int ret;
> +
> +	ret =3D rockchip_otp_reset(otp);
> +	if (ret) {
> +		dev_err(otp->dev, "failed to reset otp phy\n");
> +		return ret;
> +	}
> +
> +	ret =3D rockchip_otp_ecc_enable(otp, true);
> +	if (ret) {
> +		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
> +		return ret;
> +	}
> +
> +	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> +	udelay(5);
> +
> +	while (count--) {
> +		writel(offset++ | OTPC_USER_ADDR_MASK,
> +		       otp->base + OTPC_USER_ADDR);
> +		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
> +		       otp->base + OTPC_USER_ENABLE);
> +
> +		ret =3D rockchip_otp_wait_status(otp, OTPC_INT_STATUS,
> +					       OTPC_USER_DONE);
> +		if (ret) {
> +			dev_err(otp->dev, "timeout during read setup\n");
> +			goto read_end;
> +		}
> +
> +		otp_qp =3D readl(otp->base + OTPC_USER_QP);
> +		if (((otp_qp & 0xc0) =3D=3D 0xc0) || (otp_qp & 0x20)) {
> +			ret =3D -EIO;
> +			dev_err(otp->dev, "ecc check error during read setup\n");
> +			goto read_end;
> +		}
> +
> +		*buf++ =3D readl(otp->base + OTPC_USER_Q);
> +	}
> +
> +read_end:
> +	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> +
> +	return ret;
> +}
> +
>  static int rk3588_otp_read(void *context, unsigned int offset,
>  			   void *val, size_t count)
>  {
> @@ -280,6 +333,18 @@ static const struct rockchip_data px30_data =3D {
>  	.reg_read =3D px30_otp_read,
>  };
> =20
> +static const char * const rk3568_otp_clocks[] =3D {
> +	"otp", "apb_pclk", "phy", "sbpi",
> +};
> +
> +static const struct rockchip_data rk3568_data =3D {
> +	.size =3D 0x80,
> +	.word_size =3D sizeof(u16),
> +	.clks =3D rk3568_otp_clocks,
> +	.num_clks =3D ARRAY_SIZE(rk3568_otp_clocks),
> +	.reg_read =3D rk3568_otp_read,
> +};
> +
>  static const struct rockchip_data rk3576_data =3D {
>  	.size =3D 0x100,
>  	.read_offset =3D 0x700,
> @@ -311,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[=
] =3D {
>  		.compatible =3D "rockchip,rk3308-otp",
>  		.data =3D &px30_data,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3568-otp",
> +		.data =3D &rk3568_data,
> +	},
>  	{
>  		.compatible =3D "rockchip,rk3576-otp",
>  		.data =3D &rk3576_data,
>=20





