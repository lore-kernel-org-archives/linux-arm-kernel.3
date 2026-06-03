Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C0CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=; b=gz1imWN5eekLWd1hHI2OL25M8A
	8kd+PsN5WF6cktERGe1Taft0RmHawvd/KPevW3g9Roo9TwPqBX+sVMa3CJyE3JYINQ1sSXmPnWivg
	hkBYWTRRmqcWgZ6+hMrIDwuRGnHHMRlzNkNJBRjKXr6bPpQCowQKwuC07Hnozj5tK1p3PGlCw9hsu
	AQvDSmwSWrmuxZiE6UYp/fQPSp3+ozFOAnr3t0xYytoxDse5ppNkLv09KAs5KjbsL35IluuCmccJJ
	Kyw1SSrcd+MtAjMqowdLQb1NiLtyvnNiKbnd4W/rL40BpBsL4fIK3lnCxnEWttP/pJf9z5lOJTNZW
	++QKM3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsX9-0000000ForO-3WfU;
	Wed, 03 Jun 2026 20:49:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsX7-0000000Foqh-3oFb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 20:49:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so4526389f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 13:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519788; x=1781124588; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=;
        b=cO5txT+jISTitN8b/ByPlJZgcpNDu3eJD5msjDP9Ft9qPCNmIqxssgwlvd5KQfu/WL
         D+dausTDmlm1KVCrUO2h6BS2UHqLxfWuoPWX8UgWZp9iRjtKYdYCJyDjWhaQuu8Nj7qf
         0M78E4o2mg0mGBX5bldO4N4jsrCOu2vhOVlI8W8Tl4ujV0NGKutwbOWfEyzAGBWnPxlo
         F8l8fyCe9uvelxIyB8dliri5BmrJrAEL4mZMRkJimDvZEnp/uED10SSVMNfi2sCbmdj0
         8mb1jFh9i9S7vtKOJhfOXHDCGO8utaZ20s/wDPoDOJ6xpVhnjNhZWa1d9YOYgMsaReiQ
         5nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519788; x=1781124588;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=;
        b=tMdODvVDlGM2kk0viMFXs4nExs6tKHHu1kUpWlvSVi66GeMItVBEZfyZd+9nfp/zgQ
         YctoNXoVWJxgiDlYwxxHpWVZlZB0abvHy1OYtYwX9jJZICZk5AX3HvvTZ4hopGI/l6pG
         4GThbvqdTDwM2sHCq/hMVj/6c6uy8zlMpdgNMfqTGcasiugEBLkeHsyPg+kEhggDqLBL
         IPGla8x918odEu02gOvn3IIqO5NSvKt9kEGa6rO3dUZsEOCODgkHPlTStvQD0P8yQ+fK
         ML42lmfRPxxMjW+QPd2IDQY5zK8J3sIi91duKcb+DHZ63idyHxIjdnXBWYuqVFL/ScKC
         N2Ow==
X-Forwarded-Encrypted: i=1; AFNElJ95Tu6J9nYicVxM7ykWOMXGQJ7xiliBal9zdnQKefYJLQSwae9Arh4a9An0kKRAwPJsqAofmu6rQFeMCCW420Bm@lists.infradead.org
X-Gm-Message-State: AOJu0YzWzX0rheKrN2ShaidxKy/tQS4O8zco3aklCnn66BLgN5SAocAX
	7rmEfRWZ2yOHnS4JqALqI59FhYZqwMibC2JmYjbPpTMkeB8l8UNno4dK
X-Gm-Gg: Acq92OHaAIJ2MqmizPEWyn4DPumVpwNTrFWOvrPWlYJHVwYNkuvQba90e5lRxTaqLOk
	sfsq4mg2KEoODKePtLmUDPMfA+SHXrwTF7i0DM69V34IR/p3/dciY32k1y3oC/L3fI1X9HNzk3K
	9I/45uZKD8ArsCpX8X7azAcM8RHnerphsVZPsE3JdTJfRhHNFHhygNeLzHwMvLL+wK13aL9fozN
	uBpnn5yzWLCK+M6IeaT0UgWhB/5Bx0rGKXx3m5t35xivQyzjYx7yVjsg0+Pb3kxGkRFduHiraHP
	8KgBG2e0Ily9v1D8ybdj8f3jdOz9f+jHj24aDQieWAHy0s5eD9Noy1G4Iml+3XRGUb940XY2Dhu
	1jIbc1OiDL8JxHo1YtXllq7DRluyawS9Kjz1TTxihdyiKnI9g9+dvx8T/gJUFsTGWN+1aUdSuZ5
	2wu0wlWQgL0GZE0N1ZhFp7fDIf1EeU+UUx+o7U/ewUmPoYLrM=
X-Received: by 2002:a05:6000:2990:20b0:460:e2e:6e25 with SMTP id ffacd0b85a97d-460219363dbmr5503550f8f.21.1780519788018;
        Wed, 03 Jun 2026 13:49:48 -0700 (PDT)
Received: from strix.localnet ([197.250.226.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm11286220f8f.35.2026.06.03.13.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:49:47 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3 top clocks
 and resets.
Date: Wed, 03 Jun 2026 23:49:41 +0300
Message-ID: <7973709.EvYhyI6sBW@strix>
In-Reply-To: <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
 <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3972897.kQq0lBPeGt";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_134949_970207_60A33E92 
X-CRM114-Status: GOOD (  19.73  )
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

--nextPart3972897.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 03 Jun 2026 23:49:41 +0300
Message-ID: <7973709.EvYhyI6sBW@strix>
MIME-Version: 1.0

Hi,

Thanks for the comments!

Am Mittwoch, 3. Juni 2026, 12:14:21 Ostafrikanische Zeit schrieb Philipp 
Zabel:

> Is this delay long enough for all potential users of reset_control_reset()?
> Are there actually any at all?

You mean drivers that are in use on this SoC that call reset_control_reset? 
Afaics not, they all call reset_assert/reset_deassert, or only ever deassert a 
reset that is set on boot. It isn't called at runtime and the only driver 
calling it that is in use on zx297520v3 is stmmac, which only calls it if 
assert/deassert aren't available.

I implemented the reset() callback because other drivers had it and grabbed 
the magic usleep(100) from ZTE's USB code. It looks like I should just /dev/
null it.

> I'd move the spinlock in here ...
> 
> > ```
> 
> +	/* This is a special case used only by USB reset */
> +	if (data->resets[id].wait_mask) {
> +		return readl_poll_timeout(data->resets[id].reg + 4, val,
> +					  val & data-
>resets[id].wait_mask, 1, 100);
> ```
> 
> 
> ... because this might sleep.

Ack

> +	return val & data->resets[id].mask;
> ```
> 
> 
> This will return a negative value for bit BIT(31), I'd wrap this with a
> double negation.

Sounds good

--nextPart3972897.kQq0lBPeGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmogk2UbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoig7IP/0VOIVlPzWqCbTORa8Ag
o4V6xlbD01NZlIPog4nma5eaAeHlu186bslT26PX+RvCITgO9h6jVYMMw/x0ENgL
zx08FDGRm/yjN3a8OStSgVEIZszr+wJcVdT8m2ODHG+yxLRwAJOBMEpL8oHJ8K3V
FcbhrWzibd5kcCqcE3iODoIzs0yE1seUWsNOPRT9cgrzDekdYufZd7Ytj5doT2Vw
FJwnjvxCpoULJP2OqbZaKu2eAuyBnhd/o96l2SMkz8l/d6AIgnv2cw1RdqmxiUsj
4KDDmNcutHqS5HSg4SowO4pLX/b6vlMzNGjZrjpKgnPLOCqLgCSNLkBWRSA/xRwB
VVthQxmH+JmO6s0h7MxiPEdYD9DCQznvxKW5GNpHFi8KotZtFUOaG6ACCK7o/zwA
VXAr8LA1EMZY7M2ar+Z/Lu0YC73I8OACijBtuDP4/O9olftuXDamnZcumL+j2wZv
L6Q6/RiJBPG588d+5PY+FsSfX9COQbOpL4IzvT6g8LvjF4wkR2m+2zwzLZlSkj/v
p86aL5HDAlRInf/kTP3tt6hz6ksWJN0PdozFM8hLVGBRDG5lFZ/gF6O7Fdxg+0Bv
hyceItcgi/00qhno/ZOXr0I3pqHCfMjVBO5lzeY+X16VfUVCiY8bIcAbVu0SllEg
CtjIia7y5d3THiUTfJ7sfbEs
=x7MD
-----END PGP SIGNATURE-----

--nextPart3972897.kQq0lBPeGt--




