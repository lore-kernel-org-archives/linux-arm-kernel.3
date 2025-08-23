Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3767CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=; b=PjYI4tGVllaXrEDWVO+H5sinij
	PJuuVWtQI6pLSQRgV5sRfle5/4AtEIpp3Hvjgn8Q8E/wwT/9R/7cqKEoTEqNMUuZ/JTeVF/CTYofy
	zwnNyc4hVR9N+Fq9b4awNDZVdRQRRlXFx6iETu3oBOPFvFsWotPZAbzTNS7yJbY189cUS0JkXkXvZ
	uDf0KLPN9AD68rJ2P3wNXw4wkXjHsOqcCRGzBe7E7eqOxCffX9xDqOF0RhD+ITVE1ttIk/zhDfSQ5
	fARLZTG1+KpQyuKzChSyXUHaaFAY685RPwVtnSYLwmsqEM7NxU2xs6BHpGRKisxSPqNVMoTD+oTBo
	qqgaz2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgt-00000004XNR-31ab;
	Sat, 23 Aug 2025 09:37:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upf0T-00000003qZV-2GV3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 03:33:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b47173749dbso1918800a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755920008; x=1756524808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=;
        b=nnwqJcz8fnrlljOpIy6Io8waQPoK/nOb+OZQuERduL2LmJuXow22gU9Z49I2dV0Lhr
         pBm9dfKwbv3A/yLxGaGx+oTrGpfBTMbvhHw+UHEGhr9KdvtFowJHPB26L/vaQH0Olg+9
         7wAaG4bPK7P25wegfq2yxlohBxi2TVYGTZ0+JWsR6h2gIt51C81c/9daVFdcOav0232P
         ZKbWsAic+EnSbw3zJCIrPMHezsPiKRzInq1JugLB9OiC7D8su1Oua0rpqBLNMXZSlcZx
         RTqX16k4m5mB5jQK3Z4IrWODEjI7RrB4L/JFNe0iAW6iG9zDBs8/SkoJ46MCW+RoHBIX
         NeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755920008; x=1756524808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=;
        b=qrasWY08t7UHlw0ilNVndk3MEzPh/7BWh1BvmjcAm8swqaSp+Njjbc61pBoNmAj+lY
         dWOnSTdStcLLCG53k73mVWOyr5eDSGAcxR6uIinYy55JRSGsTq5vZo45y+4zGlxm+Uz3
         t+/E4GGQqk3r2GceK/uf9iS0QI8X0BkL/Zg4LnV3CQGwwVO0tr4TIf7B9/JEE4TWtNMN
         Y6nw2d3Xr3ynT+1DfYsHexGN1lbAjYANRUq9LyuwbQbEpgoHq1zc6CGWuDAsHoCHINBm
         nJsLAPnTtrM6fIFtBmcw7cxgIMIWFvLqslOgTHcK33tl7QV7P7/kg8nM7lK4gUp9Tkwv
         3iPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrf6PFzPw2I3VPpazFxtp0tXV7ELBsvPIyVYlDi1cfV5Fu4JMh1fXuwAftO8pzpUrvwm3h4mp/9K4jQ0orqrRm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm80AWgeTuUnckAT97xiSv23M3GRCklMvre3qs7GV+wY0HWQH7
	r3UT0AhoLkaqkE7shmSDYBlhdLLQCPBxJtFXYERZJDL9lwdr5v4L1SRB
X-Gm-Gg: ASbGncufwCLX4znzX5EEOrustyG2Yjhyg+e5+AuoVDYwtpxtwrQ7mb4V4q7j347MInI
	JaG3EcYOA+8TZNIOdNYCNJpblC2kzsoH+KHNHVaz3/f8s+P+eR4xBh5NIHIlDyin1IT4Mp7CJc7
	mECdSW49ToH8dg6nSTSH1my+KZmYapCaVDV+Z3Y1FDyWb9VSmdeIAbwcWTdrccVinUXm6Vkcp8T
	fLiCNZqBUyV53wU45/rW3hE/dcf1atXwGoNGbVEhm02M0MDrNL/jOhyC+mxonEGjr4MFeZCKLR4
	6eyzS3TPS4mlq2tuSzSxezc/qIgDsJ2Ot0fiXFK+fWdLZNtKs3kAeDl/MLvggLEa9tM2QIjORx6
	6lEdODQHFOywNreupd5Hk0VdBpvfcI5NjgQZVpEieKR/60RbupeQLHnTzRTQU5HKyp2qPvywkXD
	lWMeovg5iUMCzfk8iM1KS+
X-Google-Smtp-Source: AGHT+IFNO6qfKHbLRi+OpQWp6841qH14Emm/wJaX729M23KqjGDOidxlZhEBKjGLIE2PeRR5ofMyBw==
X-Received: by 2002:a17:903:320d:b0:242:a3fc:5917 with SMTP id d9443c01a7336-2462ede290dmr67089965ad.2.1755920008250;
        Fri, 22 Aug 2025 20:33:28 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887fc80sm10166575ad.124.2025.08.22.20.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 20:33:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
Date: Sat, 23 Aug 2025 13:33:20 +1000
Message-ID: <5792171.kQq0lBPeGt@setsuna>
In-Reply-To: <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
 <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_203329_583059_F04C88FD 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Guenter,

On Wednesday, 20 August 2025 2:02:58=E2=80=AFam Australian Eastern Standard=
 Time Guenter Roeck wrote:
> On 8/19/25 04:47, James Calligeros wrote:
> > +/*
> > + * Many sensors report their data as IEEE-754 floats. No other SMC
> > function uses + * them.
> > + */
> > +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key
> > key, +					int *p, int scale)
> > +{
> > +	u32 fval;
> > +	u64 val;
> > +	int ret, exp;
> > +
> > +	ret =3D apple_smc_read_u32(smc, key, &fval);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	val =3D ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
> > +	exp =3D ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
> > +	if (scale < 0) {
> > +		val <<=3D 32;
> > +		exp -=3D 32;
> > +		val /=3D -scale;
>=20
> I am quiter sure that this doesn't compile on 32 bit builds.
>=20
I don't see why not. We're not doing any 64-bit math on pointers, so we sho=
uld
be safe here. Regardless, this driver depends on MFD_MACSMC, which depends =
on
ARCH_APPLE, which is an ARM64 platform, so this driver shouldn't be compiled
during a 32-bit build anyway.


> > +
> > +	ret =3D of_property_read_string(fan_node, "apple,key-id", &now);
> > +	if (ret) {
> > +		dev_err(dev, "apple,key-id not found in fan node!");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!of_property_read_string(fan_node, "label", &label))
> > +		strscpy_pad(fan->label, label, sizeof(fan->label));
> > +	else
> > +		strscpy_pad(fan->label, now, sizeof(fan->label));
> > +
> > +	fan->attrs =3D HWMON_F_LABEL | HWMON_F_INPUT;
> > +
> > +	ret =3D of_property_read_string(fan_node, "apple,fan-minimum", &min);
> > +	if (ret)
> > +		dev_warn(dev, "No minimum fan speed key for %s", fan->label);
> > +	else {
> > +		if (!macsmc_hwmon_parse_key(dev, smc, &fan->min, min))
> > +			fan->attrs |=3D HWMON_F_MIN;
>=20
> Above the error from macsmc_hwmon_parse_key() results in an abort,
> here the error is logged in the function and ignored.
>=20
> Either it is an error or it isn't. Ignoring errors is not acceptable.
> Dumping error messages and ignoring the error is even less acceptable.
>=20
The only strictly required key for fan speed monitoring is apple,key-id,
which is why it is the only one that causes an early return when parsing
it fails. If we don't have keys in the DT for min, max, target and mode,
then all that means is we can't enable manual fan speed control. I don't
see how making a failure to read these keys non-blocking is unacceptable
in this context. If this is about the dev_err print in parse_key, then
I can just get rid of that and have the parse_key callers do it when it's
actually a blocking error.

Regards,
James







