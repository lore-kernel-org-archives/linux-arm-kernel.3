Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD74FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfN7jN8OQzYiImZnTABvy7SyEvQVUmOK9CigANHmlX8=; b=dMMYlPBouJq1yoGWZq372MaUxM
	TBw8UQdRq0n2Jp2FonPevRfFlxJfUtFIcdB+7k5vMM1Plmn1V7tZ0+xrlQSqQgtm5ui3S5BKRz6Wu
	4KvoOAZEl5CwoM7tWEouFjiLv0mwXXsKuzbECnmO8O1YBWK6tZLfjDCAq4jY+zAi1dlykW6rHudiX
	siq+yfZDF+2jcIIkR3PC3AknXif05+Us+hlTdNIzOjATRo3AdTv/4PL+1srBlxoSgYqymjEubTTFn
	mEkuCPY6UE5dYM7UrQlEIdjpt7PI7pkjECzTN77QFyW3u4ovjX32DM/1asmoToJ1QJKaxf7Dmja+Q
	ylohG4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIDv-00000000RfO-4BPi;
	Tue, 04 Feb 2025 12:40:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfI8J-00000000R7l-3KfH;
	Tue, 04 Feb 2025 12:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MfN7jN8OQzYiImZnTABvy7SyEvQVUmOK9CigANHmlX8=; b=U81UbmLQ8C7ne/P9TVd0h+Q6HP
	Q+cL6LjtoKC121SjBMjAh49lwsPgcZfTeWwr1oefrZKLy2CG5FVIuY2sI7G5P25uEX5wKJcIiCIbk
	26QKH/+0z0q+eaISd1u9ypedGPLTHN1jzvj+pZqkwYogHOe7K+9pyq5co6a0yuwUicQjlHNmEmJVc
	tWBCS0KbYFtbxhoJ/nwgPOX0qjWjqHinW1lAi7B3uHzzDRSSPe4SZ3S3Gzk17f7ZAYC08qpX4TwJj
	qfbc9jfFgkd+Rk7L84iJnbhcC61BX1Sxkh1PAXEd2i+wFNfampTFrBCyxqgqOBYRVedIViMuOWoOA
	6KihiyCw==;
Received: from mail.manjaro.org ([116.203.91.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfI8G-0000000GInP-24GF;
	Tue, 04 Feb 2025 12:34:26 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738672453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MfN7jN8OQzYiImZnTABvy7SyEvQVUmOK9CigANHmlX8=;
	b=oYG3nLfwwS7fdhBxqZAxFHstXJ01m4J1HTG1edyhS8fN1bJZuEY48Dvml8RG5aeKuaxyXN
	HeBqsipmiPAxGFwUcY4XCVpFZnVrHxEdosBZR9l60C1njDSjM6TgqiS37hTGDVYL9kVXE1
	+HFS8z5HwxxRNEGMIRX5ZMbfvmAt38RgnRfrtkc55Ro7dWiQYURjX1Vwt/olz1l5I70f9d
	QBF8/xwpaqc8JTIip75wmmWWx6gVBi6pbumR/WvZl9l9jJVi5kVZpBwXH5RycVr2mx/q0t
	61YkSKMs6eXniMNR9LgtMgnoQJEwL4XnVpoAKjBmI81p4qjliJXobBbhTUn4PQ==
Date: Tue, 04 Feb 2025 13:34:13 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT
 reset
In-Reply-To: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
References: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
Message-ID: <709ed6c2097f494f1ed6e5b08f55ef87@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_123424_755115_9100712F 
X-CRM114-Status: GOOD (  15.73  )
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

Hello Alexey,

On 2025-02-04 10:02, Alexey Charkov wrote:
> Radxa Rock 5C supports both CRU-based (default) and PMIC-based reset
> upon thermal runaway conditions. The former resets the SoC by 
> internally
> poking the CRU from TSADC, while the latter power-cycles the whole 
> board
> by pulling the PMIC reset line low in case of uncontrolled overheating.
> 
> Switch to a PMIC-based reset, as the more 'thorough' of the two.
> 
> Tested by temporarily setting rockchip,hw-tshut-temp to 65C to simulate
> overheating - this causes the board to reset when any of the on-chip
> temperature sensors surpasses the tshut temperature.
> 
> Requires Alexander's patch [1] fixing TSADC pinctrl assignment
> 
> [1] 
> https://lore.kernel.org/r/20250130053849.4902-1-eagle.alexander923@gmail.com
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> index
> 6e56d7704cbe0dc06242cb39df56b2fc9d6bc774..00b2d87a6bce4af883a3e7c7e606ea5b96c68b19
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> @@ -873,6 +873,8 @@ regulator-state-mem {
>  };
> 
>  &tsadc {
> +	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> +	rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
>  	status = "okay";
>  };

Looking good to me, thanks for the patch!  I just went through
the Radxa ROCK 5C schematic and it all matches these DT additions.
Thus, please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

