Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15621C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=; b=IZFcv9pufEC63JxSoTyiL5+8gg
	eoTvgN1xDzwCIevtK0rLrWS+f/wTrgKhnrvsAlMmcMKHi9wC/DFM6/v2vbtZE/cBHHRo9PWKVL+SP
	RZDp2dhpkOxAoZ9udvAPxhuV+9eJu6XLxKu9xzN023fNMzb1CsgytVqBlmESUbFRpHSKGf8shj/LZ
	S61jc1rL61Rj47g5skjjL5NRY0WYoSDsqLbpVRmYYAlw/Tv776B9cDV7jacjhYopnsyws3kZGwfKw
	Z1rN+Lh6Y5Se3IoCvhxEHbyKs8fBHtmNnbD0r27Q2bniZXkn5QxarWr6BwOB9eejBoMIf2D04q+Na
	hCirAelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MVZ-00000008JTl-2nmZ;
	Wed, 23 Sep 2026 12:55:33 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MVX-00000008JSq-0kfl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:55:32 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso6666635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790168129; x=1790772929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=Tdi0wcCjMy2WvsCLhkEJwc4KCnocF6q1+Cv3MkMlYwo6JPYU1qEblFtNuyFKLPTyym
         E7sKcCTexbVdP1wijFgrXIha7XGMXpwEjq0/22zf5Lw+Gk8FpVgUOoM3oMSsvFzKKdsC
         3pRWVuB9DGV8/8Ejl9sW8Al6xNLpNjjoLkeW/Vqcn3g6YeGlFj/TzQ1SExYjvE+90hqJ
         8Pvpu/wCowvPcQHvosINcWWuxsspDu/bnoG+rGqEfyo7ewE58SNsF/8MGcCDz7jf2Jru
         M0aex9it7EztosODmFdsDsPB0VO2JviKo72vlQ7ujfc9nYIluDTlGIrtpeuLP20XcY6N
         F/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168129; x=1790772929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=S6KoC9729fzEro4ajLM4/kR7FD6ZfeCbDvlU4MotP025cpQGvqeAMHHbXdbEiOHF47
         D4ONMvSBtuqo8eBD5ezAQxeRO92D8+RA69ymUFnS5VuMVPciQMI74yb/1WOPEzFh1Usn
         lE2hSPQ0BpbY8CYsBtIf3TE4j/k/kFO/nJtE8i+VaqFEOCpP62ubBM4igAdzDEZ2LFUv
         FOXi39D7HWsXVak0IR0CJI5b6DbHWj2I3N3zPs3oZ3/Vp1sOxGtJn1q6/ff7j1JaP425
         sEjRVIt+46KRsRJgnVXiWwhOKRb7EAVCudv4m8FTfzeWA2l462TGoQ64+4z6OaBjrEaW
         jQAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5f1WnNhg9KtjFSEUWGXR3Vpjr7v5C7d2g6afUrO3CUloEVwVBEGZVh5QxAroR5mc+CMSOYFsHO27AguAW0FEd@lists.infradead.org
X-Gm-Message-State: AFuF++mU9jz+YzeztjnTtS7aEN8pYLFKZBIrD3y2ViPz2R8UNFWLlrDm
	oL649QsVqQUXi82SpdHwJsT/kHKeNrbN1NQ+uPtySz9+UFREk7Fujx9Of+WBdmJuQF0=
X-Gm-Gg: AYBFou3GTfC/94qt/OvZdvsk8i36VdEv9zniwh+0G0Cv9yDPBgcyllEWHmiiIWNig5w
	lDeHtD8jTCkZ/UgBcQKWYCDGDVqbg0ZrI1Xh79LYUYQzwVP7Ie7BKMWPTVvimPTdteg/ii8X8fK
	Kg7FjQipwYcUBMNRD5m9q5svNT3M099eoPApveWRZh0LaznjpoT19mSiFZ3BLC6gezjfFjakeqX
	wxfP7cFKIMZXekLKgBSazM/Q4FB+BW/1WmLuE/ZPPh1bgm+4QTqpA0i2zD4HHKAkT54AqfctJ5q
	E7Lk2FmewvX8CWd/B5owe87QqITAp96EfGtTN3mw5iqos/w+m0/t7yrADsCZm830UP3CnZKj/M9
	kiCdxjyU05g7b4FWAYA3e/jJHwUZ2iVh7mUmNflBcfjVhgGiZJnViCXG26eXedk9D9CeIvxw0Uk
	9Mdi+L/EtFkD1eYmzaNL0wiIaocBm9j/5MFbiEIASmCrLk0LpxOBn4AaOaGZhuhgHUNTuuyaufQ
	wx4/CnIF37fO0ZUtLBrpB8KkaXOKlVhngsm5BoYRHZKXFOSaUNKBOH2jcAO
X-Received: by 2002:a05:600c:4505:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fdf1578a7mr31453415e9.32.1790168128729;
        Wed, 23 Sep 2026 05:55:28 -0700 (PDT)
Received: from localhost (p200300f65f19a9046bef90cd97470407.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6bef:90cd:9747:407])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fde1c159esm84444015e9.4.2026.09.23.05.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:55:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:55:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arPMAXs4jjUeu1DE@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p23qdzzba3kphtno"
Content-Disposition: inline
In-Reply-To: <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_055531_238394_7AB6AD36 
X-CRM114-Status: GOOD (  11.09  )
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


--p23qdzzba3kphtno
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
> If Uwe is fine, yes I can take v7 as is.

Fine for me.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

The nice thing is that the device_id structs are not API, so this can
also be addressed later if someone comes up with a clever idea how to
implement it.

Best regards
Uwe

--p23qdzzba3kphtno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqzzDsACgkQj4D7WH0S
/k6svggAp6Jdfc+Xv2nUfAqFVfbCWZPZ88qKW1qMOteW0gWpuiaNHYYP2davG6FM
Wm9f4BcMIVB5SEWCvqqMT+zvwMxy8614yA4/sd756UX1mJZDA/nvw8+ZkMPnkXNa
IBp2GTVwH1XF7O91KL9nZCsC52taJ7wE2yrBojLRNEB/+KIw164n7lbXO3XrBIoE
h0QLxyatblxOchoALTVDIFb9u664jBtlTFzDKepLyyGaeHbSBk+RJ8Uz/v8ls3Kd
3fFPADN4IEJAnHIDOCExNdpreKhCW/1aRhZf5YZJX300ZH3x59s8UKvsg2iYEzm6
BGRNNyDjN4kR+bqzxKfXqWs9TXUpFg==
=Uvoh
-----END PGP SIGNATURE-----

--p23qdzzba3kphtno--

