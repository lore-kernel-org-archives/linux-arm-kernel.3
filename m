Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831D0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfGXlQMIJZXRSzz9b3y/679wpg6DJoBY9Odmd3DiDb8=; b=FOjBucHHb2nTUrmlQr3RBVh9oL
	ZpAK6a5AM1cyIDyfAJ5w+stQcIxKwmIZeusj9gHaLs/8rShSReVH7pMnicUvopQ0im5Z08VVzwSpF
	7p9HqeQmR5T/nvrO1LlD7/qMoatswpe+7AgKlKBWuZHabvwyyMkR5yfeqE5+co5xFPXv7YUiJICy7
	6wtjYFOT4q7I9heWmVK1vwP+mQLuEJSk462tTy1FpR/pElzwRgmGlg682AMG1BFnOfeaZfSiJyLro
	rMnAcTNUPsdrdoTjBdnaarHa2xhW2kYuiOYBKbv22z94PkWHcgXordsAkxlseN9SO+A2A2WrfoCTV
	BnMphoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toixH-0000000G1VQ-1vsB;
	Sun, 02 Mar 2025 13:02:03 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toivi-0000000G1P9-3D7l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:00:27 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30737db1aa9so33091171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 05:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920425; x=1741525225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfGXlQMIJZXRSzz9b3y/679wpg6DJoBY9Odmd3DiDb8=;
        b=Ff1ZJTKv4FHLLMsmabtEiY65wyevcZycrDaV1i7TDsZ13SoUrQyoZTwUUNU9/ZinhQ
         miVcFlHRTsSEC5pcgKjG56bJbVuxo1oFcp0zeTkcnPW0M1X71kyeIav+QLWKn2f0gXZN
         CII6qw0zczJ+pxN7I+ELSCnuudYjF/f7DrWaMzGXohhCAeUUsXa6UwdhvxVSgSAdjtw7
         +31L0Rse9ca0+fEQdNFa++1BAtnbmLi1j0LxF6zfMwpPoptxsufoRpSZbDBycaFWMbk4
         dZXIP8iiOakie7XTCvq1FronSimtXDeDvCN59gJR7YOmSLv4XHLvovtwevwyZ5LZMZ24
         F0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920425; x=1741525225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfGXlQMIJZXRSzz9b3y/679wpg6DJoBY9Odmd3DiDb8=;
        b=MF7OxfIHO+2UcI91IIlFOu0V2qbh++R+RUAbJt2U1GSXxKXTBFfQjBgFQ1VyXXfAtx
         99X4djgavgA/R0osu+QMvPQDdrwsr1MNcJBGNoJ832Y0DZn0IIJtZkICXXWFKc8kEawV
         4fSx7hIind+NcJAw/xPot0HKJ3pwYb8zKjDHkx93m0KJN938k5L8GAJRIVEAPVK6WAAQ
         6aBFzH3SFBokwLBnhtPmnJf9c+eIoCzEzshSFDNoTUoo91pCjZc6KeHzf+uUSalhihM1
         jB0s1aw0QcGVIgWsc9dSITr8MM0kV4e6RWcC+DfwgzHp2IbAUt3WyvtHd9hsCl107a7E
         cs0A==
X-Forwarded-Encrypted: i=1; AJvYcCU934DGKVSU7JWUjrCLht19TZFo7X6bSstvzbKkNUQfoNhjt9aJtUDibE1dNe5rTfmczB+4kzlLNSiZWWmtKQm8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/dMSlLp8nQ6VYjojUsmtqRjEgHg2zIH9TrlGSSjO916cNWha7
	yEsVRmp3KAbs4QNkw1bZnXBne+O4S8/a6PQQp4cChaqW4jv88wRa
X-Gm-Gg: ASbGncs6LygaJJJsQlm5+N+L7UMkiO4MKgotSno5Du4+DLV88BiIcd172gyLuR5WVad
	sY+EPT1duxiFZWjsDtU1SQzXmunHLQsH4VYVnBTOIYD/aU09WpuNr/H40dsKsrTIm6eW+WVCLkr
	2eFu+4043pkrI9lc8rfzrdgKL0ONNe4ySLYS3FoHvsV3JHlTn4hgbsmVhmV1vWsj0D0O9IEXMky
	Ikw7iUJfSrbSaOr0eR5rsuGtFUMGS1VefRJlGh7z0UWN1hNtQY1mSH/m7d/Zc+QgtVXKD8yrVXP
	2As2k60MuP2TQ4W/pBLkv2xw660wHtoKfU/xdmbUxMMGxTS8S90DH5lSXeuboReVwG/JcRjNLJw
	gnqrqE+lXf88a3m9UVfemlvEtBQ==
X-Google-Smtp-Source: AGHT+IEJBMocHt2Jgr18dEspZ7moKiOE2FRAdMPLkXLThDcOzKqgxp1X7Z/SUDkFQeJFZlY+0pzPtA==
X-Received: by 2002:a2e:be15:0:b0:300:26bc:4311 with SMTP id 38308e7fff4ca-30b9326afc7mr48040971fa.18.1740920424456;
        Sun, 02 Mar 2025 05:00:24 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30ba19df7a0sm5519091fa.34.2025.03.02.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:00:23 -0800 (PST)
Message-ID: <f8f7154b-460a-4ca5-b31b-746bd23a3d61@gmail.com>
Date: Sun, 2 Mar 2025 15:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <20250302033507.7c166743@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302033507.7c166743@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_050026_839904_E4052F67 
X-CRM114-Status: GOOD (  21.70  )
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

On 02/03/2025 05:35, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:33:16 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
> I think it's worth exploring if we can tweak this slightly to make
> that something a driver specifies.  Either skip the unspecified or
> fill them with default values depending on a parameter.
> 
> Would make this code cover the existing cases better.
> Might be a little fiddly as we'd want to maintain ordering so
> the code would need to index slightly differently. I've not tried it
> so maybe not worth it for now.

Thanks for the review!

I don't remember seeing users which would have benefited from this (but 
maybe I just quickly discarded them as unsuitable for this API and 
forgot them). Anyways, I think it might be cleaner (from the caller's 
perspective) to have own function for supporting such cases.


>> +
>> +int iio_adc_device_num_channels(struct device *dev)
>> +{
>> +	return device_get_child_node_count_named(dev, "channel");
>> +}
>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> 
> Maybe one to promote to a static inline in the header and avoid need for
> the export given it is very simple.

Makes sense, thanks.

...

>> +
>> +		if (max_chan_id != -1)
>> +			if (ch > max_chan_id)
>> +				return -ERANGE;
> 
> Might as well combine.
> 		if (max_chan_id != -1 && ch > max_chan_id)
> 			return -ERANGE;

Ack.

Yours,
	-- Matti


