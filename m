Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE0C369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuylGPJH0FQEuO6ffp6MdCHfZcakh7pCNzkLK5eiPsM=; b=ckBT5Isx5THGU5JNjc9ot3W5v5
	xbwTxuAA06gIlq9hN9A+0zSr5Q5eaGFQETWQiA4ZlrSpXHBEFGJhko6GOYklCp68exGjdwQgj71v5
	R1yvyhLG9CigBqja6yQ+s2gBpU9IIak4iYlEjawdXU5g//RQDjcPyj0Eopc+vl9zd4rmIa6mMNV6A
	KEIlWSbwyAUDBR4qxBcUATWy862Dq/7dZib85O5SrI/T6Rsd6ZaR1wunB3IFxLOMJd+s5b/F5ZSj8
	uwF1ZJAEBL4RJoVzOUKok2K7nBRfKHb8vp1PlghmNbrAPPeuw6Tnzr8gOXAJSIrMwG1dSmwAkyNQi
	Xysc6PSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j7C-0000000Ft0u-3vmJ;
	Fri, 18 Apr 2025 10:38:34 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iyw-0000000Fs5J-0Apm;
	Fri, 18 Apr 2025 10:30:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so2703531a12.0;
        Fri, 18 Apr 2025 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744972199; x=1745576999; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BuylGPJH0FQEuO6ffp6MdCHfZcakh7pCNzkLK5eiPsM=;
        b=cguUiYu/C+F2fnrazH2Q8d5sZptfZ+ZZRZVTIpwpVLzyOYDTZ3DG7fRMkXqk84a9BR
         CpIPemqob8h5wl6mS90WysRtnQ+fwxCyU1n2/sNd/fTdJZTkqtzHdGhCS97LjNgRDAv2
         GjzFrpVhgfPihmD91DOp3XdN4r2lKSBzp5DUtPMPP2DQ823eIEHb2CUwC8IRypm3F0eC
         0FMedm4jyn9bgi5z1wW7KIIkyQPA2RuNrMC7bP9gioWqW1yTae9j+Qe3jUrN8wzfCRqG
         ifc0yCQ2frMoMzq7loQiXYR+lJsSN8FY2eU5rdn+R1/u/S9oNjpE3Eqcd0bk944BMdWb
         TPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972199; x=1745576999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuylGPJH0FQEuO6ffp6MdCHfZcakh7pCNzkLK5eiPsM=;
        b=NZKVLpDz+WJyXQWfTgSp6vr8wcVE1KFqmB78EjqyXhifWBP41OO2ZvmxAy2p8aTgEs
         tLe5SA73u3RMtSzEKbgp3K+GE63933Me0CKbFH91IgHiAneOQ73mH+aCbSqx8CsWQK5L
         0T/s7134W4T9mEkwAefvSuavN/VZISwPPCMxcKkxROf5GtooTm4/Z38V42asGHZhh7RU
         CrS61bhWQMCJMSvVV+o0enaXrYp5ogUPWGLHyGoy6UMwnaZERT18J56BPk0CQlUKTVE+
         qLSsNdNxSKIcUTfHDQr7kkdZGhrrEaDwBPlMltKBa5M/yAGou5JgPfJCiz/K9/Vf7Xsg
         23kA==
X-Forwarded-Encrypted: i=1; AJvYcCUs28V8RMC9m/ZQrQY1/nsucc/c4Sf7YDrhEtWwOM9YFthSyIBcxaF1tok47II5ghJhKz8M8Mp2JFpiET67/K9q@lists.infradead.org, AJvYcCX6El0iWhB1GNRJazglbB7+eWZSGOJdTfb6R9pINty1/JtMup0jryZl7X3UlXodNnntvbJbezcumkXVSbAnXmM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjQcN74qhkXtTgxW33NfMI1OXxw/m7qQRQw4MZuRVKJuo/Lt7z
	tJ78jZpFEAWJhfsX7q7/oaaTDmB0vLOa4vmNX/CPXAx93YxvBuBRM1vnWv+TRDM=
X-Gm-Gg: ASbGncs7+UCNRZKoHZGgEIy9CepIDbTAeNL/3BuSL2xyDdV5gli3kOCFmsWq7I7Odk2
	3jsFR6RaMla9CIQbm1wOr2DmV9w3DoSQc9Ki2Pb4g0oipLDuEgAN44i8uB4GufKbqtZFBanVyug
	QlrUNPNiw9Oy6S8M8c8tjwHyKZvL7/7ow2ZwLKTianJnevd8SPRpcdiPOOxosvUXDrC6rM17Kn8
	peS+/P/ONn8y5rnQD4SYKZkcPToVsrKz6grJQS0ctOHZjJMOKK/Nn3XIjzqjGbAjMuwRs6TYcNu
	6rwtfGSwWM29/6e1A6pF96Is2rdkWfq6SbfVWcmPH766Oj7SBE8Rn8OboFWRCy1ff1il92xigcm
	y895gtQb5VQiDK2/VizP6Yt0pqw==
X-Google-Smtp-Source: AGHT+IFFL9Q3YUQ1X3zksYfj9ZDiuJHQL5VFIR5ge5yRFXTRl0FOW98z5ZFqj6TYHynzQ6zvhG2EbQ==
X-Received: by 2002:a05:600c:3d96:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-4406aba6809mr18289345e9.17.1744970307554;
        Fri, 18 Apr 2025 02:58:27 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e43sm15984235e9.5.2025.04.18.02.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:58:27 -0700 (PDT)
Message-ID: <ee8a81f72734851fae6fcb2364cbc280469a25a4.camel@gmail.com>
Subject: Re: [PATCH 5/8] iio: chemical: sps30: use aligned_s64 for timestamp
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
Date: Fri, 18 Apr 2025 09:58:48 +0100
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_033002_076117_262AE755 
X-CRM114-Status: GOOD (  13.60  )
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
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

ditto

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/chemical/sps30.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
> index
> 6f4f2ba2c09d5e691df13bc11ca9e3a910d98dc8..a7888146188d09ddbf376b398ee24da=
b7f0e2611
> 100644
> --- a/drivers/iio/chemical/sps30.c
> +++ b/drivers/iio/chemical/sps30.c
> @@ -108,7 +108,7 @@ static irqreturn_t sps30_trigger_handler(int irq, voi=
d *p)
> =C2=A0	int ret;
> =C2=A0	struct {
> =C2=A0		s32 data[4]; /* PM1, PM2P5, PM4, PM10 */
> -		s64 ts;
> +		aligned_s64 ts;
> =C2=A0	} scan;
> =C2=A0
> =C2=A0	mutex_lock(&state->lock);
>=20


