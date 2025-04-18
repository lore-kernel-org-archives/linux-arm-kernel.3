Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D5BC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JnbYNgpq8QEYxht1353W0il/coYdog3puA39+m94LY=; b=AqK6BdH8/d//BNJvZxY8+EHISa
	3dTWocxsQhHRMW0ktVb2BcjMGuSdcqkJcSB4BBWPLgKIcfCy/SjmdfTVlM9UeAYublgAl5hRteIq8
	8F0TFQSi+gH+3lO+cVmf0T9LvGvh39pLwV8pr/v4KromJBAf/EqhSKlvAk1jm6+RDKy/Y5l76kOg+
	jrvJnMTfWgxtZMZKINSK4EB1QTyizpKkb6HX2AikZBDu6GoRxpkFj9RSAT1brHfPaLOxh1/4FhRqa
	B25z9memUag/PaF9mrVVvDUvSFOVJWhNJI6z+OBnTV7wftZDH3dmiDsRgQ9U+GucOnyLXYZ++w0Vi
	mzXcBK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isI-0000000Fqww-0dVW;
	Fri, 18 Apr 2025 10:23:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5io5-0000000FqXu-2JHO;
	Fri, 18 Apr 2025 10:18:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ee623fe64so1488613f8f.1;
        Fri, 18 Apr 2025 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744971528; x=1745576328; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6JnbYNgpq8QEYxht1353W0il/coYdog3puA39+m94LY=;
        b=fSt+Lo99VC8+HznUG155bvcRutnBNau/htnSLTNKGpMNxLzcuKVCtg6QL7OilzO+Lk
         x+KSVgEecIYZPyNqLnXIruxy8IHTpBISaWEmnFE/8R4YStvA90afMSJTrHmBUg8i/DvW
         PsytImgD66lgCprD5qTRqY2i6Zk8UX1eDN+W+UVzcJTnEakR/0XTLjJ4s5t/ErSLvpsR
         acZsnXWlkq/Ll42XIH+CUADuex8KfCwHgWtQ/eZrSOmK8z+t6ZnHAKW94K+pVHAhwCbB
         VwEBLTc+sUZ9gV/KM7s0ECN7utfC/cKkCIYInNDU4Lx1/Bvs83bDN7dHm3HXIaqXDKH0
         jI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971528; x=1745576328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JnbYNgpq8QEYxht1353W0il/coYdog3puA39+m94LY=;
        b=mrOSmAwLSO8F8jOvmST6BjBMiwTzn/PR4Vu9Koc6HDmiKwKvIzM7Zm+doCYsZbGl8h
         A2401FwqkdHqWfrRcaU8cTgbPpoJSWzE7NYbQZCImYsJpTeH4DyfEQsKyPP76sBPSs9V
         ee+WeEaT41qtO3KvnE2vUYZFuiNhWR7SqyJUhXeN0y7/u8srKBLeh2rp/0jntzDVcshJ
         dGEtJGwMRBrC8wjRnhIO6PNK421ccoYqq6cYadaz38pxX++ftMBXnPWUMPbTUKOwgvkj
         UmnjmZb6Hc8YM4eWedkpBXbpryn1fW4kDS/0xDlG9H0ISJkNLMThERNvVw7ETNPMHVJR
         12/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVA07RZnjEnYxK35Etp//kaXp2+iGWYyJX++RRoUvZFG/ul1JCiGtgHDK9yUeg2AlGWkuhE2POo9IoKJ2H9ilq+@lists.infradead.org, AJvYcCW+wx7kq8/S6P+kxm1Oyo8lO7HZHlEJ0tepa8nNUpOSNkGpvzFDcObEHX5GC0IRcWVMwLJDqqYJlW0Itwm8qNw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+WV+HwdNxTx82ND0HfYJx7xfVmcmc3Ak+c+HeYyWefuh/H+C8
	RGgjh+C39vXFICxWk5dw+1pLBq0dw2O7ao1uTt1oChuNnCgpAbBAjMOq1FV4
X-Gm-Gg: ASbGnctLeg3jgbQ4OaYXsN4596vumGpbpgTBMwI9xPBt4qumqVtoyG7Ex8RolL+3aG6
	WuXYiAWPY5vA+8JgNdb2tWCpAjnBkq2i0YT3/H6Si8FGDlTlZxL2YnePomffrZw2uDHfBPLs4qt
	Qps89MY0fRYsvqtrLeHT+21zdcJwMgnmL7A7sMiEBblBy8XqRccU/dHxCeG/MDRALgIpAMy5CY0
	xG2OwLhKBxGX/7BpJUkx0MA65Dbx1EEMOqp5NA3PopEbkA9oLQ1IRQ59ATxxoxrmG/h5c+wAswb
	LlkG3/TGGKq7UxJ8KkIeGphKVnNkSLlAqPTw9/nMuJuxnwOgJPwT8upO6xUj+DryiPsMnuoOtkq
	t3iUBy+cmQzuIYXU=
X-Google-Smtp-Source: AGHT+IG9XuTCmPLVk2umtFfxUnIxxKIA2Xaugc9G5OZzls8mvgzpV5pXnzR7Jt8N8XgwxqLl/robOg==
X-Received: by 2002:a5d:648c:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-39efba2638cmr1792786f8f.3.1744970208853;
        Fri, 18 Apr 2025 02:56:48 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d07csm2323159f8f.58.2025.04.18.02.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:56:48 -0700 (PDT)
Message-ID: <d3800b1fc2430d897750541219e39fd43216b199.camel@gmail.com>
Subject: Re: [PATCH 2/8] iio: adc: mt6360-adc: use aligned_s64 for timestamp
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,  Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,  Andreas Klinger
 <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 18 Apr 2025 09:57:09 +0100
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-2-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-2-eafac1e22318@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_031849_585087_30BCEA7F 
X-CRM114-Status: GOOD (  14.05  )
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

On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> Follow the pattern of other drivers and use aligned_s64 for the
> timestamp. This will ensure that the timestamp is correctly aligned on
> all architectures. It also ensures that the struct itself it also 8-byte
> aligned so we can drop the explicit __aligned(8) attribute.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/adc/mt6360-adc.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
> index
> 4eb2455d6ffacb8f09a404df4490b5a11e49660d..f8e98b6fa7e923c6b73bedf9ca1c466=
e7a9c3c47
> 100644
> --- a/drivers/iio/adc/mt6360-adc.c
> +++ b/drivers/iio/adc/mt6360-adc.c
> @@ -263,8 +263,8 @@ static irqreturn_t mt6360_adc_trigger_handler(int irq=
, void *p)
> =C2=A0	struct mt6360_adc_data *mad =3D iio_priv(indio_dev);
> =C2=A0	struct {
> =C2=A0		u16 values[MT6360_CHAN_MAX];
> -		int64_t timestamp;
> -	} data __aligned(8);
> +		aligned_s64 timestamp;
> +	} data;
> =C2=A0	int i =3D 0, bit, val, ret;
> =C2=A0
> =C2=A0	memset(&data, 0, sizeof(data));
>=20


