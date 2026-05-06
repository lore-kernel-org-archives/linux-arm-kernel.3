Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A431DCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46CESI8gTfm1HFq1A3EofK7nPUb8vFHRCindwbSLaKo=; b=Cj6ZGtARi/hnx+fnLJKwuBH0s9
	M3qN/ezG+6d7dkxbozyu6AgD21uVziS69blxP+AEMBRiGoO3zmzX6jmKYWg8lgjzTFJY9Jktz9umA
	uIeSEOmAPBFvsVvH7dLsOrRSh8jJUTlLmePPtpJl/xmypMfKb5XMAJgIeTzaYjaF5Dq4M7SUc9Fsm
	FP+VfQnQJrvke90/ezOevEwC5bCOmPw6FPsi/d4JoTg+0s5v8SNJy8swKqarzJ40GyZIdBhMpfubO
	NfXrOeDz6G5kxudELraEd1JRYp/Ks+jBlQFSm8WtZiWbp1CoSls5KtZfS7G3I3GK/gYW+7Ta05Hfc
	eV8cT/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKddM-00000001Be1-3OV6;
	Wed, 06 May 2026 14:53:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKddL-00000001BdG-1OC0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA51E4180F;
	Wed,  6 May 2026 14:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CB1C2BCB0;
	Wed,  6 May 2026 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079233;
	bh=iGeZEs7tmL4/Bkc+Vu171PnBQsEvMbUsJhWP2fZbvEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D9H/3V35Aobn4QmBiV3joX2pHhDLIEJ+RBY5fWA1GH7pasmhjb4uLKDVRPN+F59eb
	 9RefZ+mTsjqzTfLFnGRdAzL5EjuoZmm4zqTLAxLzqFxvDsFJvWh85VfMncsJb2f6M0
	 M4K+IH63+dZka5XYC24lWJTENNsZpJtzNM6awxHEVijwL1KRqny4n6qEn0daE4AVnj
	 oFCEMGIwn7XTNpJJ9dLPHUlXYKvLJTVheypPIfhriQ/AqWCLw0N5WGgehhJaHyBHq9
	 ppjV6DLAuITB3xYbHNc3lWhiaF8MQQHs3Vk4uROL5BuvntUIaxiQs7aTaB9aOoAgCl
	 9sbg6D5RRXm3g==
Date: Wed, 6 May 2026 15:53:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Angelo
 Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 09/10] m68k: stmark2: enable DACs outputs
Message-ID: <20260506155342.7155bf43@jic23-huawei>
In-Reply-To: <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	<20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075355_597974_8CBDECB4 
X-CRM114-Status: GOOD (  17.76  )
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

On Mon, 04 May 2026 19:16:47 +0200
Angelo Dureghello <angelo@kernel-space.org> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  arch/m68k/coldfire/stmark2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
> index 30da9bcbfd63..8fdfb9415cd7 100644
> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -137,6 +137,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
>   */
>  static int __init init_stmark2(void)
>  {
> +	uint16_t val;
> +
>  	/* DSPI0, all pins as DSPI, and using CS1 */
>  	__raw_writeb(0x80, MCFGPIO_PAR_DSPIOWL);
>  	__raw_writeb(0xfc, MCFGPIO_PAR_DSPIOWH);
> @@ -149,6 +151,12 @@ static int __init init_stmark2(void)
>  	/* CAN pads */
>  	__raw_writeb(0x50, MCFGPIO_PAR_CANI2C);
>  
> +	/* Enable DAC0 and 1 */

If it is useful to have a comment here at all I think it should also
mention disabling the ADC inputs.  Or take the view that given
well named defines no need to have any comment. 

> +	val = __raw_readw(MCF_CCM_MISCCR2);
> +	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
> +	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
> +	__raw_writew(val, MCF_CCM_MISCCR2);
> +
>  	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
>  
>  	spi_register_board_info(stmark2_board_info,
> 


