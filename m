Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA40EF48D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UarNnN2KNK2j0++meMQ9ppJ7gBS1qqj3ee9dbEJEimM=; b=UD1sXAkTHJeMVQmMO7JChwhXOV
	Z1t1MDZ896Cgook/vtOYXDa0KpgZnwvYVuY1zyxYLhta6DHdWSaSzlh5HzQvoRJjFRIf1CNunba/p
	SsK8bwH7DifKwMSK9nB7JxbljNIMDf+WOXs7waL8s41Tq8co6JTUJLjr5cAAUNifZ3T0mUmlhHZJ7
	IFQ+1KeQzY6NIAI/4zOFOrd4uyE8DM9UMwNp30mPV+3i7B7z009j7lhkBT20Wqb0uLP1KjDrB9gN1
	vvKptLJ/S2EM12zhIzOBIHDeQgC43ZyLlU0c7FJKHAJ6eL79cNZr36YAhODtHs9++BGlNSGbjJzhx
	l7N92m1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrunw-00000006GWd-1820;
	Mon, 16 Feb 2026 09:22:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrunu-00000006GWF-0w2C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 09:22:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59e62a3ee29so3082939e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771233723; x=1771838523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UarNnN2KNK2j0++meMQ9ppJ7gBS1qqj3ee9dbEJEimM=;
        b=D70O6zjLHxvBAr1tbJOqWRo7UHyFBx+oxwEgZpBsB92gA6qA305WPKbXuzgZCdsx9d
         HrjC+pMQYIR2DdF0qIc4bdHurRy6xRpNc7va9rHmqdFtA0oFDbI71iZFX4yinfBP+6Kt
         3cImbeC72JHO+eqxZ2zZ7xkg//vSooSbj+FFbvW5eDNn0nRxXn65iUrcq8LxhhmdxfD1
         tGgUzT8Ms4R2ihMys/X0VwGL0bqH1+udaROhLlI5w1eEy78VO0NLtlSNUrXhPOib4/uh
         zkwKVu/r4D4qUrxfG0nY6S7zCTEL5gmb4HFiCmDf1wKEib+k/GK0IyNlw/8kioKFsUDx
         6XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233723; x=1771838523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UarNnN2KNK2j0++meMQ9ppJ7gBS1qqj3ee9dbEJEimM=;
        b=K4Ous33m/nOGRzRqtDOxQz+h3/3PXEUC5wTIyMMnbEwKPpj9fPFecNpXC7Zn+KzFMO
         pEzkDkNyOXj90tkhbLDG0uvxvYOCXBcKopYaZizvUdqRkTf/vrQwc4roraXTChKZkwiD
         IWWJdXhUw99wR6pZ1r+UlTy5bsltKYBSoj/OcmWw35XZWxayOgu3qHsgvlyu5jz+kwNl
         g2wY+CEfNxZ8oQJ+z+w+UageQe1nH3HQjKjMBF7dgUz4xgxrQcmzhjh9+02Nd49kIHZj
         xNfFcu+PXBR1D/zjuxqEIuH2iXxGwWOFqdqRUtlK9rBREoFaZTrFzK+JtFT9+Hy6DoeI
         1wbg==
X-Forwarded-Encrypted: i=1; AJvYcCVzaGzpVuJ1giiodEF6wGukCIifd+FWnARqdWUuzRH3UJo0ESqm4jDUSQNWlWWdkBgGrdu1EcFQ2GIHypkCU5Sv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5RrG7P7fIcoXASMOkLjfkptNSHw8faR8//lWOQBs/556ZOgzR
	f2n1NVrkZKHfrEkKlGGRFxtyhrjbzKQcHHqGl+pcSGElmuKkjthH01LT
X-Gm-Gg: AZuq6aLL+UDpY8lxFoM7/wysHCez108Og3mmDfHmEeJMIvcKpY5cLhQajd5j8waxeyf
	y/dupc6TDIZ5Glqym19usNrIBkT8cOtsslaefEXyzi+dwTgtsr5ErqSHPJtFBmQGrsOgHk+lM8g
	rbY4aMnc14IUP3212eAckZXIrx9rTjTpeTm/yy1FNdgazJVqW4yL83dwfNYEKz5IKB0ke1m8v/Y
	p2BouLozHHGCV1tgnkyHuqQvXifGzDIoV4UDtZRymM5KPRARaB05lOH6mozjpqhW3u9gaq+V9d3
	RlFsV0kaYds3BKQindA6GJ41qCZ2R9wEG/A1SVXKgAX8pc8XLH+KCcbU/us3Ehs9psFG6XGCIAk
	aRWkqKycDu83jVF89CcaDBsYHowLFE2wAD15U9ZqyrKmEsmYMDS8RZPDNz0qJloWC+Re8QG+Bx5
	3+TcFMrIr8YIr6GCQwYGXWAPNxqerOtDPQ8zEGDtqxRhnKM8GLl8R6Utz1k8Eux31ffNf5cRE=
X-Received: by 2002:a05:6512:ad0:b0:598:8f91:6d0f with SMTP id 2adb3069b0e04-59f02837b34mr3533006e87.50.1771233723135;
        Mon, 16 Feb 2026 01:22:03 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568bb7sm3132045e87.25.2026.02.16.01.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:22:02 -0800 (PST)
Date: Mon, 16 Feb 2026 10:22:00 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] i2c: core: add callback to change bus frequency
Message-ID: <aZLhuIfP7rh7o3MH@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-1-fb2cbf9979b3@gmail.com>
 <aY8HfN3c3qcVbOJj@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1s4Vai7zOQ1kU7EG"
Content-Disposition: inline
In-Reply-To: <aY8HfN3c3qcVbOJj@black.igk.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_012206_287115_3B52DF62 
X-CRM114-Status: GOOD (  20.12  )
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


--1s4Vai7zOQ1kU7EG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Feb 13, 2026 at 12:14:04PM +0100, Andy Shevchenko wrote:
> On Fri, Feb 13, 2026 at 12:06:50PM +0100, Marcus Folkesson wrote:
> > All devices on the same I2C bus share the same clock line and the bus
> > frequency has therefor be chosen so that all attached devices are able
> > to tolarate that clock rate. IOW, the bus speed must be set for the
> > slowest attached device.
> >=20
> > With I2C multiplexers/switches on the other hand, it would be possible
> > to have different "domains" that runs with different speeds.
> >=20
> > Prepare for such a feature by provide an optional callback function to
> > change bus frequency.
>=20
> ...
>=20
> > struct i2c_adapter {
>=20
> > +	int clock_hz;
>=20
> Why signed? Even inconsistent with the parameter of the below.
>=20
> > +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optio=
nal */
>=20
> It's already a huge struct, can we make this compile-time chosen
> (when I=B2C muxes are not required, for example)?

Hrm, many bus drivers (k1, jz4780, stm32 to mention a few) already have
the clock value stored in their private data, so maybe it is better to
have this value in a uniform place in the i2c_adapter struct and make
those drivers use it instead?

Best regards,
Marcus Folkesson

--1s4Vai7zOQ1kU7EG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmS4bMACgkQiIBOb1ld
UjIochAAzvzsvYXR0NOI143dfUe5xvJqZCtvPGYgopBVydOd6J6rG4V/WRA2vqJU
JOO2f9+Ry9gQEGYKKhbUNMftM8mUqS3ePmOBe1CWKf064HPGOYENXEBTl1yHzHWT
qzMXoi58M3OMDxiJEysPSVG07ivJjwd8FOdCLOjCK6u9o+PKJ8vOP04ii85YGoF1
vFg8Xv1GlrNC+tCYojbzng7ItEhrkDhHjDsJfRzLwcK4xQV+eMqWaufRGxz49Bov
wLhKIDCnltp2EkSBpgHC8MJgwB7VAowwf1JI+fyq0YqEZJj67P2FqX+K8dsJ5Lso
5fva5ROMuqXcR/DNhTQVPpwUtwQ2RTFGmBO9pPSMZEwWzWM3rvtYK1H4KpKMb/go
rtc9x+WeggLeDTPnGcWGTNdQL3TuOfF+X3sJ7VWXhVVsz4x5SmekacvveUmO0QHg
7gdbtURVmqsexkBjX4bfD3TgPipjoHrKIr8MEB0afrOQ4F79U6iPfRgsWJ6FSeGt
9qQdC7JrVjWWlAIRAYHqWl8nsoRaKCYundYeKPCd95+QUUouG/XiluOp6uxIeDbA
2pqA1ALPLsEug11bqjWj5jRWwACBPXS8jtiuMx2OPkTYxq2+AZGmX6Jb26BAZy+b
8vtZNaqteC/g2YcjyNoyQRI+GmVPrzK40GW78RtZ6WrDBj54rAM=
=MC3m
-----END PGP SIGNATURE-----

--1s4Vai7zOQ1kU7EG--

