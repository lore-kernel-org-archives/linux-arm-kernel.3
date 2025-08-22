Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CCDCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3v0SnafxKU18FwdsFkXkfhEoVhOWX6Xg3ytYgsgU7E=; b=NfFA+XDg4m6Ixi3wVLIPlQeG1u
	7s2SOKqa52aGZTeSy6uwCnrfnAgCEc8xWBXdiCUMSr47xoJ983bfUhnt/FHSnREavSS4yIyBKhQfW
	hsARtiBGX/IJO2G7RmiC8TBMY1eX+d75So0Kjb7GoV2mhc93lfLYA9f8JPMkPTvtNMa7gh8hq+som
	phhcH4bwI7u6dbZJbw+tlA5rmf4VNF5CWj/mtjR/USbtIgwZ1FgQg5RMehN6M36aXRdXOJ2h8qOgV
	pkFdv36+TT31pv+8HR5QJFWfZzLrNjNd4Bra5Wu+Pmrsiy1tPT3ayq69U4YGdCW8D5+WjuWGE5lqE
	rO5wftzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPr0-00000002ILo-2lXX;
	Fri, 22 Aug 2025 11:22:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIBf-00000001LxB-0C68;
	Fri, 22 Aug 2025 03:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h3v0SnafxKU18FwdsFkXkfhEoVhOWX6Xg3ytYgsgU7E=; b=JnGFbqu5Ndr8S9F320frIyc9hW
	SxH2JFxRaSp/65JKR8YRAa3czIdj05h0VkOKXHewPe7zpHcGoR0cLFOevVQnkeoTCClDXNu88Yd9h
	UMnEsRaIcBNsfJ3PZSL+62xGz0mrRb2wP1vxwo/UsBNiCQ5tsKOrXtMvvN93nCDPJnDq35Zgn0K7n
	B94tI8iVZ04ZEZYQM3eW5nRc3cEm+7ws8sSavAiiyi4sl2GrAaT93I9b2djm4HPgpI8pDK8PbZ0Ae
	mYsOI5mQkD//kiiaDubrRhkZHlYbnuAgcQfZ+S/yxwvfBas96gKL0MWdzd1RmlHBlGaSXnWU+2Yoi
	IrOzZcRQ==;
Received: from mail.manjaro.org ([116.203.91.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIBb-00000000mN1-0SDd;
	Fri, 22 Aug 2025 03:11:29 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1755832276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3v0SnafxKU18FwdsFkXkfhEoVhOWX6Xg3ytYgsgU7E=;
	b=m/iT3GelGjtSI/56+p2/pI2ZDBaFTJ7bOFtj2h4mIKJrOkKIsUixAMmImGhx58H6Kpom9P
	0kjf7V9Cz4BvIQhdrME3LeVF1ug+pkOLdLLaK4h1xXJ1mnbgLZphRvhFolYEQZVdgXIDOZ
	5YbIYKb2OETmV2JXYGzl4fWBWbbeLv9/WwhwfrXzd1xRAxj/xMwjp5EhTFUuTXm4vrJxi4
	zkqKUSMvdUclVn77aLLOvXUCdkJae0rh0T/BCkJg3SkK+76Muj1wWdtRfASRRldKQAExq6
	lUaTRuIYgIXsTAVu5rpJcQ4ugqB6Q0D9CDmguShjx1mXZm3bWHL8me4+HOScwg==
Date: Fri, 22 Aug 2025 05:11:15 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Diederik de Haas
 <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 1/3] thermal: rockchip: unify struct
 rockchip_tsadc_chip format
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-1-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-1-c7e2d35017b8@kernel.org>
Message-ID: <2bc3023e4b6e15b388f8765551018eed@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_041127_484178_22FEFB3C 
X-CRM114-Status: GOOD (  10.15  )
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

Hello Sebastian,

On 2025-08-20 19:40, Sebastian Reichel wrote:
> Unify all chip descriptions to the version without any empty
> lines.
> 
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/thermal/rockchip_thermal.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Thanks for the patch, it's perfectly reasonable and obviously correct.
Please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> diff --git a/drivers/thermal/rockchip_thermal.c
> b/drivers/thermal/rockchip_thermal.c
> index
> 3beff9b6fac3abe8948b56132b618ff1bed57217..7b18a705dfade6fa7318b28c2b57544a4446c1cc
> 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1098,10 +1098,8 @@ static const struct rockchip_tsadc_chip
> px30_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* 2 channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv4_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1109,7 +1107,6 @@ static const struct rockchip_tsadc_chip
> px30_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3328_code_table,
>  		.length = ARRAY_SIZE(rk3328_code_table),
> @@ -1122,11 +1119,9 @@ static const struct rockchip_tsadc_chip
> rv1108_tsadc_data = {
>  	/* cpu */
>  	.chn_offset = 0,
>  	.chn_num = 1, /* one channel for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv2_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1134,7 +1129,6 @@ static const struct rockchip_tsadc_chip
> rv1108_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rv1108_table,
>  		.length = ARRAY_SIZE(rv1108_table),
> @@ -1147,11 +1141,9 @@ static const struct rockchip_tsadc_chip
> rk3228_tsadc_data = {
>  	/* cpu */
>  	.chn_offset = 0,
>  	.chn_num = 1, /* one channel for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv2_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1159,7 +1151,6 @@ static const struct rockchip_tsadc_chip
> rk3228_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3228_code_table,
>  		.length = ARRAY_SIZE(rk3228_code_table),
> @@ -1172,11 +1163,9 @@ static const struct rockchip_tsadc_chip
> rk3288_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 1,
>  	.chn_num = 2, /* two channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv2_initialize,
>  	.irq_ack = rk_tsadcv2_irq_ack,
>  	.control = rk_tsadcv2_control,
> @@ -1184,7 +1173,6 @@ static const struct rockchip_tsadc_chip
> rk3288_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3288_code_table,
>  		.length = ARRAY_SIZE(rk3288_code_table),
> @@ -1197,10 +1185,8 @@ static const struct rockchip_tsadc_chip
> rk3328_tsadc_data = {
>  	/* cpu */
>  	.chn_offset = 0,
>  	.chn_num = 1, /* one channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv2_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1208,7 +1194,6 @@ static const struct rockchip_tsadc_chip
> rk3328_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3328_code_table,
>  		.length = ARRAY_SIZE(rk3328_code_table),
> @@ -1221,11 +1206,9 @@ static const struct rockchip_tsadc_chip
> rk3366_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv3_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1233,7 +1216,6 @@ static const struct rockchip_tsadc_chip
> rk3366_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3228_code_table,
>  		.length = ARRAY_SIZE(rk3228_code_table),
> @@ -1246,11 +1228,9 @@ static const struct rockchip_tsadc_chip
> rk3368_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv2_initialize,
>  	.irq_ack = rk_tsadcv2_irq_ack,
>  	.control = rk_tsadcv2_control,
> @@ -1258,7 +1238,6 @@ static const struct rockchip_tsadc_chip
> rk3368_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3368_code_table,
>  		.length = ARRAY_SIZE(rk3368_code_table),
> @@ -1271,11 +1250,9 @@ static const struct rockchip_tsadc_chip
> rk3399_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv3_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1283,7 +1260,6 @@ static const struct rockchip_tsadc_chip
> rk3399_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3399_code_table,
>  		.length = ARRAY_SIZE(rk3399_code_table),
> @@ -1296,11 +1272,9 @@ static const struct rockchip_tsadc_chip
> rk3568_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> -
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> -
>  	.initialize = rk_tsadcv7_initialize,
>  	.irq_ack = rk_tsadcv3_irq_ack,
>  	.control = rk_tsadcv3_control,
> @@ -1308,7 +1282,6 @@ static const struct rockchip_tsadc_chip
> rk3568_tsadc_data = {
>  	.set_alarm_temp = rk_tsadcv2_alarm_temp,
>  	.set_tshut_temp = rk_tsadcv2_tshut_temp,
>  	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> -
>  	.table = {
>  		.id = rk3568_code_table,
>  		.length = ARRAY_SIZE(rk3568_code_table),

