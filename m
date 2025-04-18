Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C2EC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtxUdRpeKm+ANCEaoBOMbDJKRr89yLjZTB6s8COjTOE=; b=zubAfcb+xNypjweDCvW2URu7sB
	ZddF8Cb0EPG4nG1hFxYGFBr4cTe2Hg5WDQblpIAexoYkoUi0soik47rzqLz9EimpOT2BZ+9WhadLf
	0ADgxSJrebGRbpk2NO0arRwZ61DcZfv7xBCNFUH1d+t84Uzb1wMoDrMQaZiypIcS1QvI67+lO+c5Z
	FUiJNkkpmYyGe28H+BlvD4BtFP3Lq+9HylcXaeiIgyimV+/vvBYInp57UkoGS+0iiwE/QUlz7UhG2
	jf2lh1WCuQkVt1KYcunIZUIt9FqFeFmA8QwlMqBGxwhOpmks3qMjZBEW8NzPkn2Ih7DWz/FMEmxxh
	WceaxvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j3Y-0000000FsUL-1TNi;
	Fri, 18 Apr 2025 10:34:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ius-0000000Frei-1oXh;
	Fri, 18 Apr 2025 10:25:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-acb5ec407b1so261843066b.1;
        Fri, 18 Apr 2025 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744971949; x=1745576749; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wtxUdRpeKm+ANCEaoBOMbDJKRr89yLjZTB6s8COjTOE=;
        b=KzVxaGXi/ejxF5IRf0L6kNJG1MHSFf4/ucaSluMnXPgEuwBGJqQkx/rnu8w4Gzor1u
         aCcaB62unrfOjzWXeC5QhQgHO3RpiXflO/MkaK2c9dAj+Qw7imNWlysEZXstp4wxOGF+
         epZ7mIjPWsucp3qzgQjZ0q018niJWcl2GYR88p4YlyleO7JRTfFo4lh6gmFRAyk959Zi
         9ZaznfA/rFP2LscfHLkOqLLJnE0FB2cFaboobKyQm0WjdF2r/7bZxhmsdfYIOvM5fMsb
         lkJvJMHa++jQTx8QATGdxHlqkjBdpyWzCPTa+6IOJRliM3zjA/PQ0PJbvP0Wml5hp8Zf
         2qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971949; x=1745576749;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtxUdRpeKm+ANCEaoBOMbDJKRr89yLjZTB6s8COjTOE=;
        b=F2ygBlmOXM2/UmioEb/uVBxXvw1/gI4MvrDPpNpgaNeMzTMOgoF1TGf3qZYLpgBWt3
         mvKKuknik70Q2OASn3WDi9J/tf4uClWU1dlgZ6YWEXsOAJalEW+MlNiU+ZOsQdsmosKF
         3ZwK4G0OWiYBCS11MltEUYszjzT9w0+TpThkSgV+F52H5rwUH5+TGHgGUGbh91TIZ+L6
         dkMlAdWeqrYpPNCQ3hT8tsa8inUqRVmrmug1SeQv0+RIrNNgR7NRl7QZx/lkivW6iKeN
         CtRsvZDy94dS+/cHRHKqkgu2R5gudaqTnOdd24iThx7t/lPUmUoFfqnAng+qqIMM7D/u
         Z+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK63KxU+kaewNuCvZCp/RHdqlz6XPwt+sBLNYmncrKTQaGfJ8yyQV6x/u7n3hgK+65qoovayKUy+4E1JjeoLRk@lists.infradead.org, AJvYcCUbMZgL57BLplcWaD8ORsMGR+sl+T+LGa/XoOMu50skYuGnhs7ANW8N+FW7OvPJNFDBWWsrMkaWlE3gkoVJZo4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZM/Xr1Aop63sx47eH4qKYgz3eN6CaxvbM9wV88SJe2adALHEV
	tU51HzQQ7mOvelpUxFeW3+z1gx+T5kEqZ3P1VD4K8camIXnQFeyRb0nQa3ENuww=
X-Gm-Gg: ASbGncvEJfhgqU9Pvq/jWttlvAXKpKQKi+aZaWa0eV/CGqbRWMUAfujdwe+8xIY12u0
	SCO10G252d99g/7+2P8POL4SuKLdOSK4yLqUSazNkUqWRzwVL4YPtcCDfylGI9bURvkJj1zdbyp
	iompSTlUeZkWZgBq24qnckZfpZkT1dCXofaV+XoLj6Tc5BuM/S1Et2xvlwinyLiwr/kx/49hqrx
	j6H6lBlcXCPKNl9F0p+YG0oCQ6iD5BgOm0z6v/DfzX+++dtz5hFxMFmV5YFBrnc1tm+bcGtt3qW
	fHLvNKELlD6Mspvzhb5ZcBeJRZFW8CNFm0QUxXbwKlXXbcgeVCXvNfTprfChP2NyaVoIfA07ySQ
	WjbCgjfbYOraK+hA=
X-Google-Smtp-Source: AGHT+IE/FfCxx0tPuZ6qCUGNp5eZ3+6ZBuRbRtb7Q9/Aksg04+VnflJ6AYoHrsoEeblg0HGcmX6ZpQ==
X-Received: by 2002:a05:600c:a088:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-4406ab9767bmr23956205e9.10.1744970284863;
        Fri, 18 Apr 2025 02:58:04 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43be53sm2249042f8f.41.2025.04.18.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:58:04 -0700 (PDT)
Message-ID: <a1ce36c3dee60d3fa2a8b864f55371b0298d83fd.camel@gmail.com>
Subject: Re: [PATCH 4/8] iio: chemical: pms7003: use aligned_s64 for
 timestamp
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
Date: Fri, 18 Apr 2025 09:58:25 +0100
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032550_466036_EF2206DF 
X-CRM114-Status: GOOD (  15.79  )
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
> all architectures.
>=20
> Also move the unaligned.h header while touching this since it was the
> only one not in alphabetical order.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

With the tag:

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/chemical/pms7003.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms700=
3.c
> index
> d0bd94912e0a3492641acd955adbc2184f4a11b3..e05ce1f12065c65d14b66ab86e291fa=
b47805dec
> 100644
> --- a/drivers/iio/chemical/pms7003.c
> +++ b/drivers/iio/chemical/pms7003.c
> @@ -5,7 +5,6 @@
> =C2=A0 * Copyright (c) Tomasz Duszynski <tduszyns@gmail.com>
> =C2=A0 */
> =C2=A0
> -#include <linux/unaligned.h>
> =C2=A0#include <linux/completion.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/errno.h>
> @@ -19,6 +18,8 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mutex.h>
> =C2=A0#include <linux/serdev.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> =C2=A0
> =C2=A0#define PMS7003_DRIVER_NAME "pms7003"
> =C2=A0
> @@ -76,7 +77,7 @@ struct pms7003_state {
> =C2=A0	/* Used to construct scan to push to the IIO buffer */
> =C2=A0	struct {
> =C2=A0		u16 data[3]; /* PM1, PM2P5, PM10 */
> -		s64 ts;
> +		aligned_s64 ts;
> =C2=A0	} scan;
> =C2=A0};
> =C2=A0
>=20


