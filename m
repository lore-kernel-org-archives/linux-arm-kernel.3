Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3EBD33995
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaPYz53ew2gx95k4ULY/j8X206olAgthkt9FCNBp5/o=; b=YzXis4ofTJk9znUhHzl4Q4G7wJ
	JrkorYVhCAj3ITZ5HnTAT2ixNFoKjZKm6GdE86484dPe4uOkC8xaaDEs2CLK0XYFlG93cbRBH0UQB
	kddrzCZwh/V8XACxWh82oygBwXtfVac2nrxk/7Zk/qPyIxeXQn8XQquXnPSaJZGW58GjK6Wfv+76U
	yVowDGaJQMpBYmEuz5UVuDxurPzZRIGwuZrpFEdIB1b7IdLjANdNERo/IL6TGMt+ul4AiP98cGS/X
	s+OrL8EKvG2TNaa0l19UITbuF631bPcGUgTHYgi+ygr1k+Up/INlUXF7Rc/JescGNKsuMlTZJD8/0
	0nRXB5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RSt-0000000BGym-0Hd0;
	Mon, 28 Oct 2024 15:15:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R3W-0000000BC4a-2BWK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:49:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so42811425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730126955; x=1730731755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CaPYz53ew2gx95k4ULY/j8X206olAgthkt9FCNBp5/o=;
        b=h8V9yl7oGVdsriPKIzMcSZv6Gyl9efks1LjGOSw/K7Kb0JiMbpXK84b3VPTyuM5IyZ
         ECkG4fC8shznQcLnWyEzO3dsbI5cupG/9+UaRS/l64v0O1Og1hFSlSkYmQlr/dwlYmj3
         piu5hvAkx1VR+ZBUlnaHrrJl+41DJfwBZ3015/TlDsefIlPyATkdurPsa12He5j9GXMd
         FZD6S4TB5Wbpc0akzbOdayVUn7pn9ik49/LbKAs5UpF6s7uurrLe3UYN5BvR6e4Li2A7
         1jbQ+tEV8Fjy7JgQs2p4mWVEKAmyjnGXybMBQAITCRSJDjz8CzUVAeq4YSAv3iCTyKtF
         R0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126955; x=1730731755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaPYz53ew2gx95k4ULY/j8X206olAgthkt9FCNBp5/o=;
        b=ZGzYoMzfA1Oga1xZyg/ob7QOn2PuWKHDWUCEIG2U2Ebous2kVTowYuazLFpwMd1OoH
         fiZqqCo0qmhox3UTx/Sd0ybGZvuve0x7oSODULD/iOP/wMZnkn2z1lvKQZcegnfQwUwS
         57fADQY2LogqI/nqVfJzWGwvNlInkhlpKuPNeu4NIqVcZiJ6jw6G+mIlQugGry0vPdmK
         rG6LXxea7lIHu0IIOKXxHqm8Xuno7bR222YIyS2VVUlqUZptHzLbC2xNVOcffQy3e5L6
         nZ4ofIsFAoJrouxOa1xZGUQW9x4G55vzcrWnWye79f0flpR9hGtHtRNEqnn61uWQvkay
         wTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhh51+aLScEFL39PSoeGrJpIWyhMxkzXyXJ7Drp3Fd5lWpjv/ld40d45oZtHimoL44uZjjaNYoKqpMWcMilBjM@lists.infradead.org
X-Gm-Message-State: AOJu0YwEOk9sNWzmyZWGiBzPjThbXI5FwuDRTgKSwDEL2FOJFCXd333/
	cKdDfl5mNYEQpYhV8ZollF+bbAUHK1aIBykkA44CXhF06PM5iSt36cvtjvTthBw=
X-Google-Smtp-Source: AGHT+IFxXNoJjvvEWI7EdoBlBRxvjVqId7VO2o8bkZtwJXZ2oUgS7llQBk2awnVf3u386gmvAmYDFA==
X-Received: by 2002:a05:600c:4ec7:b0:431:5459:33c2 with SMTP id 5b1f17b1804b1-4319acacb31mr91712715e9.17.1730126955302;
        Mon, 28 Oct 2024 07:49:15 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:9c1b:19fb:62cb:cfc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f689sm142187985e9.16.2024.10.28.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:49:14 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:49:13 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v3 2/6] firmware: ti_sci: Partial-IO support
Message-ID: <7l5ok4bufvewoimrecm5pajlqqmqg75rjthivdufoqhphfgiy5@xo7f3rrdr3zs>
References: <20241012-topic-am62-partialio-v6-12-b4-v3-0-f7c6c2739681@baylibre.com>
 <20241012-topic-am62-partialio-v6-12-b4-v3-2-f7c6c2739681@baylibre.com>
 <20241025174204.xwmsn2arcy4q63xu@reaction>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xq2jo632shlb63xp"
Content-Disposition: inline
In-Reply-To: <20241025174204.xwmsn2arcy4q63xu@reaction>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_074918_932152_C89AC4C6 
X-CRM114-Status: GOOD (  29.89  )
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


--xq2jo632shlb63xp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nishanth,

On Fri, Oct 25, 2024 at 12:42:04PM GMT, Nishanth Menon wrote:
> On 16:39-20241012, Markus Schneider-Pargmann wrote:
> [...]
> >=20
> > The possible wakeup devices are found by checking which devices are
> > powered by the regulator supplying the "vddshv_canuart" line. These are
> > considered possible wakeup sources. Only wakeup sources that are
> > actually enabled by the user will be considered as a an active wakeup
> > source. If none of the wakeup sources are enabled the system will do a
> > normal poweroff. If at least one wakeup source is enabled it will
> > instead send a TI_SCI_MSG_PREPARE_SLEEP message from the sys_off
> > handler. Sending this message will result in an immediate shutdown of
> > the system. No execution is expected after this point. The code will
> > wait for 5s and do an emergency_restart afterwards if Partial-IO wasn't
> > entered at that point.
> >=20
> [...]
>=20
> > +static bool tisci_canuart_wakeup_enabled(struct ti_sci_info *info)
> > +{
> > +	static const char canuart_name[] =3D "vddshv_canuart";
> > +	struct device_node *wakeup_node =3D NULL;
> > +
> > +	for (wakeup_node =3D of_find_node_with_property(NULL, "vio-supply");
> > +	     wakeup_node;
> > +	     wakeup_node =3D of_find_node_with_property(wakeup_node, "vio-sup=
ply")) {
> > +		struct device_node *supply_node;
> > +		const char *supply_name;
> > +		struct platform_device *pdev;
> > +		int ret;
> > +
> > +		supply_node =3D of_parse_phandle(wakeup_node, "vio-supply", 0);
> > +		if (!supply_node)
> > +			continue;
> > +
> > +		ret =3D of_property_read_string(supply_node, "regulator-name", &supp=
ly_name);
> > +		of_node_put(supply_node);
> > +		if (ret) {
> > +			dev_warn(info->dev, "Failed to parse vio-supply phandle at %pOF %d\=
n",
> > +				 wakeup_node, ret);
> > +			continue;
> > +		}
> > +
> > +		if (strncmp(canuart_name, supply_name, strlen(canuart_name)))
> > +			continue;
> > +
> > +		pdev =3D of_find_device_by_node(wakeup_node);
> > +		if (!pdev)
> > +			continue;
> > +
> > +		if (device_may_wakeup(&pdev->dev)) {
> > +			dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO=
\n",
> > +				wakeup_node);
> > +			put_device(&pdev->dev);
> > +			of_node_put(wakeup_node);
> > +			return true;
> > +		}
> > +		put_device(&pdev->dev);
> > +	}
> > +
> > +	return false;
> > +}
> > +
>=20
> What is the binding that supports this? I just do not think that
> scanning the entire tree for vio-supply implies you will get thr right
> property here.
>=20
> Just giving an example to illustrate this point:
> Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt says it
> needs vio-supply -> so i have a node with the wireless supply as
> vio-supply -> Since we are scanning from NULL for vio-supply, we hit
> that, that is a bad choice for enabling io-retention.

There is no bining that specifically supports this as I think it is not
needed. The devices that are capable to wakeup the system from
Partial-IO are all powered through one supply line that is always-on. It
is called 'vddshv_canuart' and the name of this supply is checked
in the above code as well. Yes I am using 'vio-supply', but only to
search for the potential consumers of this supply.
So wl1251 will be skipped in above code at

  if (strncmp(canuart_name, supply_name, strlen(canuart_name)))

Best
Markus

--xq2jo632shlb63xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZx+kYwAKCRAkjLTi1BWu
P5akAPkBBA8XP72OHJ8p/zMDU3gXL2huEO4vEwmxe1IyxQoJxgD+JMD6nnbu+xSY
BpaZm8rb1PNiiWmGX4Nzl30WM0rIrQM=
=ak4k
-----END PGP SIGNATURE-----

--xq2jo632shlb63xp--

