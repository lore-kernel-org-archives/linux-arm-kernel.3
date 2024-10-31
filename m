Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF62D767E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zkuoswXbu0x76VZ9dkSgVo5XUz825DeoWuELNa3+zU=; b=snNIzBucemcyyUGDwyn5n9jle+
	3Q669dbYSA+I2TzBJe6F2oRN/SByXi2g/IDTxmLU+i/b37p8KM0eYgAKOraWx8dup/qKr2mQVujgm
	cxgyD8w1iMb430lxDWs7S/33UHCOW1hiwjXM813/zjsqoBSdDLvVB5F6tJmAOiIgacutqs+80dczN
	wFXdqKdCj/IRFwncrbBmzIBvgIW1Tpj2pOctLpA2z7RzPeoS1BF9IygVbSGWgbx4hlx2yFBljsOXK
	/yBCmCpo95pbTJ0xeXfaHEcvRXINsJ//h88I2mZkhW58y/exUtGTDwIKgidCtVUZRGGYhZjOyMQVR
	s8oqj9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YDO-00000004DJl-1z9f;
	Thu, 31 Oct 2024 16:40:06 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Y1V-00000004BJO-3JUQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 16:27:51 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7180f2f5fb0so571930a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730392068; x=1730996868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zkuoswXbu0x76VZ9dkSgVo5XUz825DeoWuELNa3+zU=;
        b=uH4n2i1hU1b/p6ra3+xEwtlXQA6bWyZgtnj9jhSuC9WWwZ4e4QoplDs/fFAR9telog
         86vCnphYC2wnzdMbl+HbDErop6VMD8ORhDQSAelpaFDe1KbKowR6n6hc3zS/s45j0FDm
         1nFNF0sZzG3GltFb9ZoYJsh2AZae9ZOZ6I8sS1QZStByUgHrKRgyCJ4TOyn6v3uAHrDA
         VosYeJ1gM9RJb+cJ/JqYIKV1tGYz+r8ueqFnOqXHgWh6Ba/tRw52l/lyK9VufD2U2X57
         pDWa0KSoEiw57R+3ZUciquzDnM4x8Wk5zAGqlORH1+6U9f4pICGNkR8Uy8sF/0ZZUhpY
         RX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730392068; x=1730996868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zkuoswXbu0x76VZ9dkSgVo5XUz825DeoWuELNa3+zU=;
        b=MMGWETwgTemDMpFwVOdvNA+GyUX+31hHv0tJbcaNApBoiOM9lahzQRrzMh7KCPj2pO
         V8INPQ+VtGVlpAyLCISSCReBxNyFrX0qNgkjZvHOOLNUst3DfWEABIua99b+feAQyA1e
         1NDxtreV1xejgUk4M6MDJCcaPPff1h9K+E7V7RkvJMLz8uo8EEzM05gr5t9dL6sCUjgE
         UcSkqthzaHfkmf4/7mP3UizAud/Yo5qx9RYF5x4efc6P/sm5/70n8EvpTQ94TLRdfSOr
         udDmJ1yO0pv16HmWF3Om0tXfdX7jCreheqMTigqAdVZ3nnlMMYavEC/SikSBvOPJiOKy
         eY4w==
X-Forwarded-Encrypted: i=1; AJvYcCXiCoc1WxqJureAck4ConPyOhki9TLB53xadsXaRJ7zmqjkBW47NiJC3sUBG8bO6/khMepq6VcenA81tTaEfwQE@lists.infradead.org
X-Gm-Message-State: AOJu0YyqGVbxVFU8uDsyhObVav+oH3H/x2oVcAfb8rGc1oDpgaGmrZA7
	wc6KBJg5QqaDRJ+sylHoqrTT9OKSjDLsk2JTYMzZCGEH9F/e+r3joDIU+UcBydU=
X-Google-Smtp-Source: AGHT+IGn3VcXN2vRbd8Rr0640Qt+w79Jerb9SkZNzmKhPFUbewiTnVqw/wQKsRc9oFeGGtT+FubdUQ==
X-Received: by 2002:a05:6830:4123:b0:718:43b6:b0a0 with SMTP id 46e09a7af769-7189b4b76edmr3540707a34.4.1730392067759;
        Thu, 31 Oct 2024 09:27:47 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7189cc69b1dsm402044a34.18.2024.10.31.09.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 09:27:47 -0700 (PDT)
Message-ID: <ef4fe230-b7fb-4f7e-9173-ae85d305e9ae@baylibre.com>
Date: Thu, 31 Oct 2024 11:27:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] iio: light: adux1020: write_event_config: use
 local variable for interrupt value
To: Julien Stephan <jstephan@baylibre.com>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Anshul Dalal <anshulusr@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@amd.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij
 <linus.walleij@linaro.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_092750_159666_BE93F94B 
X-CRM114-Status: GOOD (  17.33  )
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

On 10/31/24 10:27 AM, Julien Stephan wrote:
> state parameter is currently an int, but it is actually a boolean.
> iio_ev_state_store is actually using kstrtobool to check user input,
> then gives the converted boolean value to write_event_config.  The code
> in adux1020_write_event_config re-uses state parameter to store an
> integer value. To prepare for updating the write_event_config signature
> to use a boolean for state, introduce a new local int variable.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/light/adux1020.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
> index 2e0170be077aef9aa194fab51afbb33aec02e513..db57d84da616b91add8c5d1aba08a73ce18c367e 100644
> --- a/drivers/iio/light/adux1020.c
> +++ b/drivers/iio/light/adux1020.c
> @@ -505,7 +505,7 @@ static int adux1020_write_event_config(struct iio_dev *indio_dev,
>  				       enum iio_event_direction dir, int state)
>  {
>  	struct adux1020_data *data = iio_priv(indio_dev);
> -	int ret, mask;
> +	int ret, mask, val;
>  
>  	mutex_lock(&data->lock);
>  
> @@ -526,12 +526,12 @@ static int adux1020_write_event_config(struct iio_dev *indio_dev,
>  			mask = ADUX1020_PROX_OFF1_INT;
>  
>  		if (state)
> -			state = 0;
> +			val = 0;
>  		else
> -			state = mask;
> +			val = mask;
>  
>  		ret = regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
> -					 mask, state);
> +					 mask, val);
>  		if (ret < 0)
>  			goto fail;
>  
> 

Instead of introducing `val`, I would rewrite this as:

	if (state)
		ret = regmap_clear_bits(...);
	else
		ret = regmap_set_bits(...);




