Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F73CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNKk1kU6SOtjUkITv/KCJkuTdw/0nVnpYUbhmN061yY=; b=kf+szERHJ9yGDc6KrhEkXauhCs
	+38E3f/EMxMa16TMcI3nZV+JrH4KYVzLRUyPe8CM2mJ6ATEJdafKSfBQwnvJCVYdZftW05ykU7byh
	Gder5/Lz8ulc10JlT/mxyWMdNKMepIGf2tBFGPgOIp/WjRnosC5e9gD3brsY7nYqhyQowjoqXKJKQ
	wgZpub+tNOGwHUwFEm6xze+iRm1TTB07j9Q3y8MxerUPDVeEbOgEdts6UysMeF8ZFCTpx8sgc40eC
	AVwq1D4OAMJaC53zpqf6yqoRSZL4Wqe7dQLYbPjLpdRVYKHiNJgDhSenV47NyLxNd+KR39eft6f1g
	tG1XOMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sii-0000000Cnpn-2sKt;
	Thu, 25 Sep 2025 20:37:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sif-0000000Cnlm-2EBQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:37:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27eed7bdfeeso2269125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832656; x=1759437456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNKk1kU6SOtjUkITv/KCJkuTdw/0nVnpYUbhmN061yY=;
        b=Ssag8JyN0bNv9W8uQYdwpeFxrBTz1bN8uBaUBw3RMvxwpZhkDDvHY27JOCGQV4Yktz
         iK7tT+hlP1lUJW5H7vR9dx5k4Eh04C7uIVCDebpnMJidDVsBJOREtjRXz2ktJYNJBVh6
         PoUIwRcqG5Q3XmjTxKtUTMoAMieWPKwgYmh2fZKA9NJFevCYzVwYaSDCBy1OrrtacpBG
         UeG+iKGLepx/1jTUZpAxFS/Z8PC/Ov4xTnT3CaZvFJrfbpRRldFp4snXzPOLfKneAwr8
         JZIXli0zpJkaVEe6/eQCslzU7NKM9A9HCrMV8i4FA2sLaBfGgUNVmGqFjShx0OnWoj2f
         QgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832656; x=1759437456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNKk1kU6SOtjUkITv/KCJkuTdw/0nVnpYUbhmN061yY=;
        b=UeJQS+5dS+Ns4z+AUfPQZNaez0CkBhFgErH5U0l/v92xkAXkQEN57MSZl/Mfxo4CTX
         KJpAeCtYWsWEUyl7zecPmXihC21qhBahTX9WwOlGyO2NZ2+ZAHmz9Xj7Y8oIOzAZnlpS
         a5/MzDIsaCNt2y2AiGLBbLcHMc/Cspi3jfH7wRlJKiLbtX1NUs9Py1nI0KCtzpSrlRL9
         gshaOaGLbFppPRL4r1odcVEjWgFrxvKiopoc2/UI6GKKqYYe/4c4Hjh1vswNCYnnODce
         kVdPYepe7eyJOhzmCqBeUvONnWyDb9xF+/p7ryhdMb+i2XIL/6HWLniPAd4ryZ5SQtlM
         K5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXgsNc4zY3VYfunTseA9yVMBxtxM4J7BngiDD05UB289Vaz5xf6w7R9KD8w72C8YIzos3vHq38lGZosmJJEP55D@lists.infradead.org
X-Gm-Message-State: AOJu0YyumSacOKOzmOPJcxLEkJ628uH/lIszYdBUXIF2p0t5tQWjfzks
	eoKGHR0VbQ7ceK/M10MotDKS4c6rZwVCDCtjGpt1W8cfz/NQkmYBQHpj
X-Gm-Gg: ASbGncswIblaBsVnj5RN9zZ8JpJGF9HPx6m6Ve4W4+b5xTGWlRlWkt8/JD0FlWz0gZC
	xDjU9Hc/4Mafbyf0nSULuTrYaM4IelEm2EtFo2SyFh71pTaaUrkzRGTpUIj9tL9Zc02ttJuNyvs
	LRTMk5UDOk3yJ9DwmT5aDZlSQFWFdbe62uDb28vzXyGqcthOKlTZzuMZqYtPPeUmTJ2Aa7tdtjb
	RjLbsdlt2igd7npro0Us06pnDJvPwWPSYrKY0SO4TuUZgjuDtm0KC5KcAAK8CThrJ8IVt0pKpI9
	pnDBdv9bsHhpK7N6oS44nkBV+hVF+XyRqYyyov0cGMoL9cx/Bo0CKlQvXJiaTX2Fky7QlVWThHk
	AnqdWXuWU67tDtfdfF6q2DSGJTOfkJ3X8oVP+/LqD+menTA==
X-Google-Smtp-Source: AGHT+IGdaPC8LUhy5y9eJbG77kWOllABnqIUJud8kZmzafxvaX4bFrJ9tXNvo9qzIrnH2+Si1arwcw==
X-Received: by 2002:a17:903:1b6e:b0:267:99be:628e with SMTP id d9443c01a7336-27ed6abad48mr50663105ad.2.1758832656340;
        Thu, 25 Sep 2025 13:37:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm34135455ad.25.2025.09.25.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:37:35 -0700 (PDT)
Date: Thu, 25 Sep 2025 13:37:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
Message-ID: <89dd04b9-e261-4bdd-83ab-499e46fc9c01@roeck-us.net>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-2-svarbanov@suse.de>
 <20250925-outlying-causal-015d8ba33c53@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-outlying-causal-015d8ba33c53@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_133737_581108_F1904CAD 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, Sep 25, 2025 at 08:40:54PM +0100, Conor Dooley wrote:
> On Thu, Sep 25, 2025 at 03:04:13AM +0300, Stanimir Varbanov wrote:
> > Document dt-bindings for Raspberry Pi's RP1 ADC.
> > 
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > ---
> >  .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> > new file mode 100644
> > index 000000000000..5266b253fd2b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rasberry Pi RP1 ADC device
> > +
> > +maintainers:
> > +  - Stanimir Varbanov <svarbanov@suse.de>
> > +
> > +description: |
> > +  The RP1 ADC is a five input successive-approximation ADC with 12-bit
> > +  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
> > +  and one internal temperature sensor.
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-adc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  vref-supply:
> > +    description:
> > +      Reference voltage regulator 3.3V.
> 
> Looks like you're missing the io-channels-cells property that allows
> this device to be a provider of adc channels to other devices.
> 
Only makes sense if the driver is implemented as iio driver.
Which would be fine with me, assuming this is a generic ADC.
The iio -> hwmon bridge can then be used to instantiate a
hwmon device if needed.

Guenter

