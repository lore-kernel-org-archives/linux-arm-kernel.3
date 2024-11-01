Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B48E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK9lIxl5s0kPcApnpULcGz3PPtUGD5qO/HsuObIWX4k=; b=2WZdCqOto4IEP7S+vh9vGe8Pb6
	KSRjzHR/JxakJWUUeE3vR/9spo3cmocXR7vRCuG/9cgk39Vwu42IZAqZ7oWGAPDLmFPoDkcmDYYt0
	ZnK/V3HWk/OgBYrF5ENghyGjv0erlhy4rqO80m4JNnTvgmaAwYq78/rjO9gNy64LjYWj9uHDugmQj
	fiSYiEIJb55rv8rSWWYADSdjkbCvhBetYJV5z7CodLPV99MkVj8B1fYuctEgSzQDiFLKYvwF8Caq+
	zGL7M2Cv0kymqasWIjraWOH2cQDPCG2ncqfy7AwsoW+PL9saAhrWyS3zqHmjt5Hlqq1xl3J6bvvqQ
	r5d+apTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uk6-00000007ilT-1pfp;
	Fri, 01 Nov 2024 16:43:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ucl-00000007hVG-3zHu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27C465C4C12;
	Fri,  1 Nov 2024 16:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5961FC4CECD;
	Fri,  1 Nov 2024 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730478946;
	bh=VAe8JaPazApSPoTOUWuTu3lf+OPBhaGqX0zo7n9+08M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X1tpwuz/azyd+hEHYQjWyu3g6WzlxirePGr5tCzhPoWJyPcCzmsEvwV5GXsMRiwNa
	 vlsRjpdYWH3r9cTrFOMjThIeBCPTmSrYRXty9uluBDplvDMsRjzeVBufZIv23P8Py5
	 B7z70h1jPSyqTn6Og+yxxM/Tsp42XQ3+MjY/4Ls2AIA8SfGIUxy4UOBUr+IYDTPa5V
	 aVTDYB2GetSTplCXpGubAh0HZbMfrkG/YtEAt2E80CgPtLFf2CYFwUvcnRW7i/BlVU
	 9+Zvvh0KxeSd6F46d7hxskBtXy5cumZz/EbDo5FuUh1umx64DRth2XtYdUIki3KtSn
	 RvS3gzWoPPEgg==
Date: Fri, 1 Nov 2024 16:35:35 +0000
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
Subject: Re: [PATCH v2 10/15] iio: imu: bmi323: use bool for event state
Message-ID: <20241101163535.644a006f@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-10-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-10-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093548_109727_1EF4C9FC 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, 31 Oct 2024 16:27:05 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Since the write_event_config callback now uses a bool for the state
> parameter, update the signatures of the functions it calls accordingly.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied.
> ---
>  drivers/iio/imu/bmi323/bmi323_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
> index 76a88e1ccc1d89988eb52d6b1be8da0f5005f0e6..161bb1d2e761688dd740635f8a2830e9562d1b59 100644
> --- a/drivers/iio/imu/bmi323/bmi323_core.c
> +++ b/drivers/iio/imu/bmi323/bmi323_core.c
> @@ -467,7 +467,7 @@ static int bmi323_feature_engine_events(struct bmi323_data *data,
>  			    BMI323_FEAT_IO_STATUS_MSK);
>  }
>  
> -static int bmi323_step_wtrmrk_en(struct bmi323_data *data, int state)
> +static int bmi323_step_wtrmrk_en(struct bmi323_data *data, bool state)
>  {
>  	enum bmi323_irq_pin step_irq;
>  	int ret;
> @@ -484,7 +484,7 @@ static int bmi323_step_wtrmrk_en(struct bmi323_data *data, int state)
>  	ret = bmi323_update_ext_reg(data, BMI323_STEP_SC1_REG,
>  				    BMI323_STEP_SC1_WTRMRK_MSK,
>  				    FIELD_PREP(BMI323_STEP_SC1_WTRMRK_MSK,
> -					       state ? 1 : 0));
> +					       state));
>  	if (ret)
>  		return ret;
>  
> @@ -506,7 +506,7 @@ static int bmi323_motion_config_reg(enum iio_event_direction dir)
>  }
>  
>  static int bmi323_motion_event_en(struct bmi323_data *data,
> -				  enum iio_event_direction dir, int state)
> +				  enum iio_event_direction dir, bool state)
>  {
>  	unsigned int state_value = state ? BMI323_FEAT_XYZ_MSK : 0;
>  	int config, ret, msk, raw, field_value;
> @@ -570,7 +570,7 @@ static int bmi323_motion_event_en(struct bmi323_data *data,
>  }
>  
>  static int bmi323_tap_event_en(struct bmi323_data *data,
> -			       enum iio_event_direction dir, int state)
> +			       enum iio_event_direction dir, bool state)
>  {
>  	enum bmi323_irq_pin tap_irq;
>  	int ret, tap_enabled;
> 


