Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E02E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKe02bjTsNdy/iHEZgHbj7335sDP42YvxaNIb5u2PL8=; b=iyKySTqqGKxRJ9u4b/T2yslsBq
	JNdxwsrkiBiNiSr+Sge5xLzHJRP3yaQzoDR57flfoWxvuOxiqIh5/eM4ZFKjyt71MThHGh2lJyUdx
	sxAjaiKyKzHsdJyFe3cKCwejd/BnHhqDhkAyg3irBm3w/KI66Zn6iHk4B5hblrCFbR2v+HP78x53m
	8hqkeZC7UNRCmz28HfxNUubKCsRBH9xv7EjCO/T0n6qwfDcln6IZ6Whcsanyph4tZZYtXi7q3zvok
	VpCz+TQ+uCiYbhFI76U10W5Owk5sKAkvetB+TDcphtXjBCGosfAlpjKcT4Rz+xi/MoF33TIIX8UOT
	2A/rzgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uu4-00000007ktX-17lZ;
	Fri, 01 Nov 2024 16:53:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uj9-00000007iYI-40RN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1712A44779;
	Fri,  1 Nov 2024 16:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BA9C4CECD;
	Fri,  1 Nov 2024 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479342;
	bh=eYks79MFdCeXodwGGFKWKp7Y3D0VclXHgXCntP1ZON0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dlWLeQtokne+QgI9Z+5Asb5yiBmPqRnDRQRBU7GjWr5Mfm2Sc/dJDHE74H/EuhrER
	 1FhjTnmZTpSzhW6ji5fqrdinVlh9VAqUP87j2Y01K7QB3wpW4XuovFc8DA+mhMBXVZ
	 ahm2BHoQMgbFh+M0DAb4cD4hjMPBRwfOs3xlHkjHBUejSZE00z6q6BJ/+IXUciBQY9
	 l1dsNGbIJC0mozF+H3D6dBoWWNyouhae6p7mpnBTVLq7qgHEgzUFIpOtbGoM9lEqtL
	 t2D1zzku7zqY3mR0U9CDrUJCExfRAcztBuTVLB7aHrs2xCl5xz9obFRFabcYRJeFUf
	 M1FQzr3pUnSVA==
Date: Fri, 1 Nov 2024 16:42:10 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Hennerich
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
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 14/15] iio: light: apds9960: convert als_int and
 pxs_int to bool
Message-ID: <20241101164210.4a33197d@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-14-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-14-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_094224_087926_7B64F342 
X-CRM114-Status: GOOD (  15.47  )
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

On Thu, 31 Oct 2024 16:27:09 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Since the write_event_config callback now uses a bool for the state
> parameter, update type of als_int and pxs_int to bool.
Applied.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/light/apds9960.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
> index a7f0cc99f236685900f89fbc48de3be0e9a40704..7b3da88885693c488807da459ceaa1cbb3881bcd 100644
> --- a/drivers/iio/light/apds9960.c
> +++ b/drivers/iio/light/apds9960.c
> @@ -133,8 +133,8 @@ struct apds9960_data {
>  	struct regmap_field *reg_enable_pxs;
>  
>  	/* state */
> -	int als_int;
> -	int pxs_int;
> +	bool als_int;
> +	bool pxs_int;
>  	int gesture_mode_running;
>  
>  	/* gain values */
> 


