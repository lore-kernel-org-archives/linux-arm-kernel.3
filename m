Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73342E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHohLpEhtpxFvhJqHUJd2c8SRnX7fTxEEqKNHD52Jlw=; b=zFj9gxrw/Oq06nU4YAj2MHouo8
	kA00aCTB/ZqzIRy8nVwkOMVtSMcu0OSDN9reIokHP5tv93u8Uoy3jtUUQ8fB+Ov1TEgEN/jX2EOsS
	FPMVN5bWNqsNDuqdJzcQkZEUlObpi2hnynX3mXMQoT0Qg6AC7pD2Bv/B4ihjl2iCXqkpH4APClKDh
	bUNcRAUBHHXj9as0Wt32zdLh29YQZv0DqR7SJoUP42H8FMRFkHfjUIyoMINM4Vjmk9+GkIrKftxam
	IEpgAbsPBu7sjJJYd1etzLZO9QpaCWvre94tKN+YlHsYhjDp1TCIVXngeR8tc+BmhpKaY85rjTWAq
	DIV0ysVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6usR-00000007kg6-0Zua;
	Fri, 01 Nov 2024 16:51:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uiL-00000007iN3-3Gnv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34F90A44733;
	Fri,  1 Nov 2024 16:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3B2C4CECD;
	Fri,  1 Nov 2024 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479292;
	bh=RnVmu4KMn0cYcEtJmqOHewUj8MapyZAuXdZ2ik2BBwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FH1q8YKCIGY6guripygnr5/X3GiZsfOtWqz7B5YyRdEvi8alczpqthsNyfSEUf0QE
	 YzPta1HyOjTt0iwV6ZiaRFc/LWdu+oebKdb7Vf/HU8ceebCZDvSdPhdIZgmVHJWpNF
	 CLNuIm9LO+SzfRdv3Xe+9ZNj2teoce5Dhx4e93vAu8wKuVO/obJOETKj2wOz6jWNN7
	 tz79KaeMKPC9QDSpUeIegKhgfvMTg6DX1VpOvI+6O0gec03aeih35q3Ke76Vhbv7dy
	 ptiYxEM0cX485g/gkeSLwRNLiMVLcHppe+BF3g0GWoz69Mpcp7c+yMzBrdctpinnxu
	 GDm7jaLHfT9hA==
Date: Fri, 1 Nov 2024 16:41:18 +0000
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
Subject: Re: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in
 apds9306_write_event_config
Message-ID: <20241101164118.687be624@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_094133_914089_6700E8CA 
X-CRM114-Status: GOOD (  14.39  )
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

On Thu, 31 Oct 2024 16:27:08 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Simplifies the regmap_wite if branch in apds9306_write_event_config.
Applied.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/light/apds9306.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
> index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a630d42fe9b90438dfe8 100644
> --- a/drivers/iio/light/apds9306.c
> +++ b/drivers/iio/light/apds9306.c
> @@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
>  		}
>  	}
>  	case IIO_EV_TYPE_THRESH_ADAPTIVE:
> -		if (state)
> -			return regmap_field_write(rf->int_thresh_var_en, 1);
> -		else
> -			return regmap_field_write(rf->int_thresh_var_en, 0);
> +		return regmap_field_write(rf->int_thresh_var_en, state);
>  	default:
>  		return -EINVAL;
>  	}
> 


