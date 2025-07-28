Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E013C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo+wi7F32b+OuCkEYGAkvcjZPWwzQp3pYwuNa/dSwo0=; b=h5Tbk0BRexQnTR78EUJYDc71v0
	IkH7J8wKZ9LDwIAe8ZcUFwd0aQBN/L31vuZlPRGaw+kqha84shYWsS8eTt5KpdiJ91pa4d1Dwm1vO
	7twiWBC/XpPM7Xss2yuFuBQFXA4+IRpmRTCT3j3bMl8s5Pvr9VrbvzbePHWsRkBh3cn6g0mswcEQg
	vxXDXUrHYAQnFV3Knyy/FLbAb+NAztQ6T5R/EWWbwF0d28jJQnJxDqxGIAciK8MLDORKBQ7kBobK8
	u0879qraKUsZCUthH9mfbPhed43Pmy99XCyp+2SiB5u4rtzazhzcwLbmoVMu18oXeIb3e8RPGGt1K
	BpBUu1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTia-0000000FHlt-0mRZ;
	Mon, 28 Jul 2025 19:41:04 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQnO-0000000EzQy-3v5w;
	Mon, 28 Jul 2025 16:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1753720385; x=1754325185; i=wahrenst@gmx.net;
	bh=Uo+wi7F32b+OuCkEYGAkvcjZPWwzQp3pYwuNa/dSwo0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eW4PhNDduVgGlWPF63W3EygCvT8WiUB7XgEqZnBJdlLJr/1wHnFNQ+11bQQbljRc
	 QmQJTRLmVETQfcwQgJV1uTHrKBhwS1vxH7HmC5W/hfpNuBoivOKUdavIurkeclRHp
	 gaoAMkP06IVkEe2KPneK6IQ3TwaMQZKmmXYVVFyC4JIkF0wIZr7L95xIOOlSfB2nK
	 vtqU3gYoK3ExLI5NBPGGnXNl00/NQsZH0ggtF1wnPnnjzWhH0PkMGS7zMiiNyHiBm
	 zDfn9SRPE0/IQfSC6rVfo1k4VcLNDXz4NTqMqJ8g1NKf5G9PSHl1G4FH3Whq+WQKB
	 QASPmhHmDMyahxfcUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.143.227]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1u8kjC4C1y-00fcOm; Mon, 28
 Jul 2025 18:33:05 +0200
Message-ID: <673f3f05-53f1-4eb4-ae65-a3cd9ccbd1bf@gmx.net>
Date: Mon, 28 Jul 2025 18:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CfHJDlPwu/n2c3qFUstxfBzfhZVf62Z+IUEFVR6d1N7F9sLtA0f
 nh8QTIxw9nbPKc8d9e4ts3y5pNsswDtSbNiZaKhSaMqXHTRsUi8Y+8QG6UH4K1Uzp/PUZ2S
 2RxW80Yi1bu+98uVTxKVd+IHEkhSHLGj6gBt0G3q07X7n3NIliiUGcGmrcxxmph3T4lG70I
 CoG841gVxNRdlLDHts0sA==
UI-OutboundReport: notjunk:1;M01:P0:pZiR0tDOu9w=;5W7bpfT064OYWsPaFe2RVZv/FN7
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_093351_407965_0D9C372A 
X-CRM114-Status: GOOD (  26.49  )
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

Hi Ma=C3=ADra,

thanks for working on this.

Am 28.07.25 um 14:35 schrieb Ma=C3=ADra Canal:
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>
>  From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>
> As now the clocks are actually turned off, some of them are now marked
> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
> early boot or are required during reboot.
>
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inte=
rface [1]
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
could you please explain from user perspective, which issue is fixed by=20
this patch?

Why does this needs to be backported?
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 41 +++++++++++++++++++++++++++++++=
+++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd68=
5e696b423985cac0 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
>   	char		*clkdev;
>   	unsigned long	min_rate;
>   	bool		minimize;
> +	u32		flags;
>   };
>  =20
>   static struct raspberrypi_clk_variant
> @@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D =
{
>   	[RPI_FIRMWARE_ARM_CLK_ID] =3D {
>   		.export =3D true,
>   		.clkdev =3D "cpu0",
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_CORE_CLK_ID] =3D {
>   		.export =3D true,
> @@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D =
{
>   		 * always use the minimum the drivers will let us.
>   		 */
>   		.minimize =3D true,
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_M2MC_CLK_ID] =3D {
>   		.export =3D true,
> @@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   		 * drivers will let us.
>   		 */
>   		.minimize =3D true,
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_V3D_CLK_ID] =3D {
>   		.export =3D true,
> @@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_HEVC_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_ISP_CLK_ID] =3D {
>   		.export =3D true,
> @@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_VEC_CLK_ID] =3D {
>   		.export =3D true,
> @@ -259,7 +265,40 @@ static int raspberrypi_fw_dumb_determine_rate(struc=
t clk_hw *hw,
>   	return 0;
>   }
>  =20
> +static int raspberrypi_fw_prepare(struct clk_hw *hw)
> +{
> +	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk *rpi =3D data->rpi;
> +	u32 state =3D RPI_FIRMWARE_STATE_ENABLE_BIT;
> +	int ret;
> +
> +	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> +	if (ret)
> +		dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
> +			data->id, ret);
I suggest to use dev_err_ratelimited for prepare/unprepare, otherwise=20
this could spam the kernel log.

Furthermore i wouldn't recommend to log some magic clock id. How about=20
using clk_hw_get_name(hw) instead?

Don't we need a newline character at the end?

> +
> +	return ret;
> +}
> +
> +static void raspberrypi_fw_unprepare(struct clk_hw *hw)
> +{
> +	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk *rpi =3D data->rpi;
> +	u32 state =3D 0;
> +	int ret;
> +
> +	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> +	if (ret)
> +		dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
> +			data->id, ret);
see above

Best regards
> +}
> +
> +
>   static const struct clk_ops raspberrypi_firmware_clk_ops =3D {
> +	.prepare        =3D raspberrypi_fw_prepare,
> +	.unprepare      =3D raspberrypi_fw_unprepare,
>   	.is_prepared	=3D raspberrypi_fw_is_prepared,
>   	.recalc_rate	=3D raspberrypi_fw_get_rate,
>   	.determine_rate	=3D raspberrypi_fw_dumb_determine_rate,
> @@ -289,7 +328,7 @@ static struct clk_hw *raspberrypi_clk_register(struc=
t raspberrypi_clk *rpi,
>   	if (!init.name)
>   		return ERR_PTR(-ENOMEM);
>   	init.ops =3D &raspberrypi_firmware_clk_ops;
> -	init.flags =3D CLK_GET_RATE_NOCACHE;
> +	init.flags =3D variant->flags | CLK_GET_RATE_NOCACHE;
>  =20
>   	data->hw.init =3D &init;
>  =20
>


