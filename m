Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B13CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=; b=To5XjpMHzd13lsNst9vnRlC8I1
	sbAyv5gZCCmjRS99TK1FKPKPF7AliYHYyLPP91i85O8aI85MfohdnRxLzIKhu4kxmK6KrwXAsg5aC
	F4QDZLE/aj8SNSdWMUKxeDeMX/bud9hWSa1iTj7KZUhnXy9b6NEusR5hpijk8HseOLPetO2hmjX7q
	iSeFVWNYO3RlVDmVsUk36hyrEg9PmRIYvpB1ZOUf8WonnO11gXoZahGQqMQZke2rWxVLXZGqmEp67
	MdlPynOk/XqFlyeKkEfZgF0xprKWfvyGH9qHSaelt6LUGVNYCiCRfZMmn2IS3G8caGwCe1dyv89nQ
	arRfaapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2jR-00000009UIR-1A7V;
	Sun, 11 Oct 2026 23:13:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2jP-00000009UHZ-1Dpw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 23:13:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso9224955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760405; x=1792365205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=DllvX5mQbzZRpmej46XrJncCttoPGi3+CFBU9CrSYeddC6Vv4uD2wdPu4e9WJFd4nV
         CSF7qlZoaAJ0poqrfoQ6WkawVs7tjW9e1I4xpmSvMHC4Bfgvj6oZ2xHYAuqQvbFKACgR
         kfHXz+e59DBooe2FfzNi9wkGEf68luSvVF8CmPv7fT5jB930sC9J6fOxHkfLrqVXO2+Q
         gq+nPr/nOPwpR1WUUatDjplsHz0YpD6DPClU2qImj8EDR/IuofY/XbHdjGmRgW7MfUaV
         SZ+2iMA8xViU4n36jFUAx3XJKJx0/YEuxu/tBVTGLMHKdyAwSWeK0IIlDIbsixGhc2Kl
         HVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760405; x=1792365205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=RtFg+2wnMN3Y14SVn0GJyTFEitPBLOj2YqsG1TG3px0Bofc45L0ZkZiRj0FYCV7gXS
         ZBoGHJvYQl+ax58Vi14bmSEUC8ReqxA9ulJkap3CW5Z0FUnykW2MMZRd0yldb0qiQ6DS
         hPNH8dkgyaV0YqNKDDsEdEd2Zoc9dZoMsBKYxXIaPiL0/eNSF/+EuaAWEuZgYCZ7Wj2h
         xfLDN5Fk4oKVlds56jTvqzDCFYS1jZqUDpZf9CBGEhZUVo83vuCnfdnIv7+2H0IdlqTR
         UY5OY98Y9jWC0FXsBWFRVM02LyUEsRWO5279v8oha9caMYWx/Npoiua8gUAN8/B4ugsu
         uF6g==
X-Forwarded-Encrypted: i=1; AKwUvByU4eYsVb2zCjwKDqTZ6WJw4GIzltW6qMovR+Lp4O8T82QP2aYWQYqyS5fVUaQKuht3H9pm0nI/nph7dKThFb3I@lists.infradead.org
X-Gm-Message-State: AFq9FYJMTCsGPKp7erbY5sR77fpkQ65gemvrgub/4E4soNrIM0Pkprdn
	/IJTkyhkVcbx4u6aMxncddefA2Jg13QriWqk6vStj3DwtVrSEAJuKwrlmldQhUa40snPaKIQUpA
	9/HHS
X-Gm-Gg: AYBFou2ynGf41SBHZDLKXRBS4GqcmADjeCVpiKQVNr8pP3LN26tuPGaN4ksCGcAv/wv
	SndnN2xzFfss+PlufLWt7qP1ZX3bJbvRzLEPJYhpDOkxxmI+sTS6UBFqrZDY0cEL7LH3eHKMhKt
	NOElnbjtXsXeaVODaF1iedC7RNvKZb31olX4G95mE8q488wIBzrNDftHd2QbyPcJZ1bbsRh4gN6
	hl5izi2390nvU3IEr6lPEofO48YbmH5RK70/RHEXDphKQS2yhj6O4y0D/lnvquWKF/+wU9keh6r
	JTfHORwEFPZ6ihTRsmKLwe3UugQjcDfLsjsPQ+xx+jLt9buyeETp5tseV75Wq91s8WcSVl5KgSE
	lVdCKgtlQ5EgFg/FRwKqqoqaUOLNambkCPWGrPU3xhw3UX263d2g+2UaZlX51ZOrFNxYviNgkwX
	sItdixSyhSm8diZ//x2uM6JkyCg5ngGrb1hrxtfQ1UfD+GiVKsIbjjQmrTGw1Kh76moXq8WUMmj
	bw=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr165188775e9.20.1791760404876;
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea1021sm222382515e9.10.2026.10.11.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
Message-ID: <aswXwdgpWTVoItYy@monoceros>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qngddyqnkwhditii"
Content-Disposition: inline
In-Reply-To: <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_161327_371322_20BEFEC5 
X-CRM114-Status: GOOD (  10.84  )
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


--qngddyqnkwhditii
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 10:48:34PM +0700, Nguyen Minh Tien wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the inclusion of <linux/mod_devicetable.h> which does more harm
than good.

If you really want an include for of_device_id, use
<linux/device-id/of.h>

Best regards
Uwe

--qngddyqnkwhditii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGBAACgkQj4D7WH0S
/k5tCggArhjqsIMxWZn1mdwNpWwWCgDbuq6GCyhWvxK6/4SoEqOcbECNykQJkcqM
gvBI7Zcz8K+t3TTUvkpf5ten3RucpB85MIpw2zPZyT7UNFTU4XpVJ9KXFNT6G57g
GknahtuMpdBREceO6pO3vd/yn8VMXV8clPTPXpgNywW5t6z3QOzEz0IcrZMJb8V6
cSCkPm8gLqPQcJsxc5Jwdjzt/xaeUIEVlS9TgyVY6BrcotwmfGeJsCPubGsR35Dv
rCHn8rkKSLOaUBG2rAWF26nch4TvC8JDsPDVi5/HJBfJhBqHK5hOi/Nri4WSmi8T
kVp10DCvNgThgd+VEI82L4IL+a9Oig==
=gnsw
-----END PGP SIGNATURE-----

--qngddyqnkwhditii--

