Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A85CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv669uPkHrSvw8LzIPDONi9ciYMUaJTZqlDY6Vg+I9o=; b=aIgrGCCVclMVQ9m7f5LhoaGt8b
	VJrMDcpNcaJWUFdmHG5MdULxaMjh4QkcpxqbbRBPjz4yBCA1boRMvZJ+6oXtmLKYrHbvh90mnI0V2
	qBvudzZ3fjTd103HXUKgX22ebGqalyJyaOhljQGuZsbCIZQ6P/P0AqEAq7OJ+JKX4nlxUgf7gCHzP
	2ruIB68OWWWJkqq2oexyykpVMlKJhCicAm+jwKaZrN40+cHPz7THL+JAy8uF/Im2G2MbIF+5y5GfJ
	Y9PfLFthdNFo3g9B1Usitj7tY60o8xu7jp9eWVCLIqofKijmGoim9pPsfM1T0ThJ6KLn1OEQwDy5R
	t+RZ13ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINrO-000000053Rh-1Jb1;
	Mon, 10 Nov 2025 09:06:50 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINrL-000000053Qj-0Glp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:06:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-591c98ebe90so2874855e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762765604; x=1763370404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kv669uPkHrSvw8LzIPDONi9ciYMUaJTZqlDY6Vg+I9o=;
        b=Feimv3oODWKCWTgDDSCaXPmLf2Z8lV+dv0eikM37IS+v1tBPuC3F3apAzwu/M3rQ4Z
         eekM9PBH/Ufo2GnPR2TqydpIgHpUEFYbmCID+X61/Zc4U3yh/VqMxebKp/Ncr1b3/VHZ
         DpTxBgiqwvcwUoGpCwPAzfZ705ZuTItsxSBO3Yz9hag9tY6Zwhn5Z328lXO7CkqVLsFF
         8ZCF7mGFMuJNk45TDgzL+EBo4cPiNqS2kMvu4VpIf4az7XTN/KICjgqsLFiWzCoc6u5k
         947CichLe3C1B0GHdX1ri97s8FCqbueUp6PF9TIODW2s3NA4QJsZzSw9hRTnzHi1SVk/
         lPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765604; x=1763370404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv669uPkHrSvw8LzIPDONi9ciYMUaJTZqlDY6Vg+I9o=;
        b=YT7uPCaxW/Yx9G7vFO92Mgq6ZHRtUdKCgwfFPQ3dPuZF45YbyqI4sGzSIE51DPyZrA
         3aq0tgwnO4FNQJZeoNwDepTaYgHY48Bx5MWyWirqbdvOnwPud0d9RDROkdSgDDc0Cb8x
         viCXP9Vs7UYdbA8uaH2LP4C7bO5I7fFbpDqEVQHgU/F1MY96NehbP/n/kWAVI7f1ncZ/
         QQk6qh3vrorpGxs3kfNl6NRBe/El44kIJRbAFyfc3KSyB7dgY1a0YZQBw6LdoCNfBk5z
         YNb46H1KJ8wgd9ifZCBa/+OutLefmoeq2Re5vdFkqGulNRNwU4717BdBbAywFNH9+eiW
         IxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeTSzqhsYUTKCTrXajKIVw1LADpMLumPL25tX+uzYHsuMgSjAkiNNDracjHM/+PC4wWPrKyMqbZDJnd8bt73jY@lists.infradead.org
X-Gm-Message-State: AOJu0YzAAjjTWe0dVFgjl1jrgittKbnX1ULRkSFpEgix4ZtO0JaxbtLK
	fxKlHa6mEE7rQ9ynNkVkLXnasSU2f1eA2LTmPYzdvBMJZ4xru9MDkZ+c
X-Gm-Gg: ASbGncsG8jLyb0wjlPKWaj5kqyp/L9GpaJmq8qUD0ZuKmGmkyYGrPezuxE1xkEeO8K4
	9TCaDFIZqaUQ9Wp91KOoxz4Vo34018nAGu4d2aVqZ6Y60az5aUTVBd0s5DO0q4QTUPQ0rzGTOhd
	xgUN+q9OlbWsiSY0yVTVIVVmGQ4zTeJTCA/vZ9rEKcjp0sVywJ41fGpAKvKpoeYXmVSmR/jG8/X
	+o+p9VO99n+eZyzz88cpgwXOCOCZ2j0piQ0D8QrO4Idbr/HZ/rIUwbHhuw/9BRrQua6YOtJ6fQH
	Wb34Xd1t6/DNzHKgzREAuFK/61HgNynq2cp0PTJiFMkL5/a1Tewkgg4J4feHdo4KfvGjR29tkBW
	hhv8J+rxLIp/XB15IR6FnhtxEZAhOrVPv9tvJQjjniUHwDrpNI3dw3b1vltkj8kIhfoAyd5rgTp
	gsTMZzfBd98EEhsYqEqvvmTGmc+5Ff4pCfqxT3
X-Google-Smtp-Source: AGHT+IH2Bad+qTl99d6KPJeCk3sJy+GS6VSBYjrpF8xVgr/9IQeDjmTmz+kfeOOZUKCjh1vpE36b/w==
X-Received: by 2002:a05:6512:61a1:b0:594:31af:4de0 with SMTP id 2adb3069b0e04-5945f0bd59bmr1813454e87.0.1762765604346;
        Mon, 10 Nov 2025 01:06:44 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a01fb14sm3744501e87.39.2025.11.10.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:06:43 -0800 (PST)
Date: Mon, 10 Nov 2025 10:06:41 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 0/5] I2C Mux per channel bus speed
Message-ID: <aRGrIRNgNlRqDLzr@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N/hTo/3gW1AqHJcu"
Content-Disposition: inline
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_010647_129714_76547F59 
X-CRM114-Status: GOOD (  28.96  )
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


--N/hTo/3gW1AqHJcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, Oct 20, 2025 at 09:17:23AM +0200, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v3:
> - Return -EINVAL if channel is faster than parent (kernel test robot)
> - Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd95=
6@gmail.com
>=20
> Changes in v2:
> - Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golas=
zewski)
> - Removed idle_state from mux core (Peter Rosin)
> - Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a61093=
0@gmail.com
>=20
> ---
> Marcus Folkesson (5):
>       i2c: core: add callback to change bus frequency
>       i2c: mux: add support for per channel bus frequency
>       i2c: davinci: calculate bus freq from Hz instead of kHz
>       i2c: davinci: add support for setting bus frequency
>       docs: i2c: i2c-topology: add section about bus speed
>=20
>  Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++=
++++++
>  drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
>  drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
>  include/linux/i2c.h                |  13 +++
>  4 files changed, 324 insertions(+), 22 deletions(-)
> ---
> base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
> change-id: 20250913-i2c-mux-b0063de2ae4d
>=20
> Best regards,
> --=20

A friendly ping on this series.

Thank you in advance,
Marcus Folkesson


> Marcus Folkesson <marcus.folkesson@gmail.com>
>=20

--N/hTo/3gW1AqHJcu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmkRqxwACgkQiIBOb1ld
UjJBVA/9FekIGivuFU6wWlAnooD4cBtWh+Jfox7uf+UfY2IOlmHIdcYoSlV47Fmb
Z3uCe0KE/ZC8uaSMHiVAYiLoWP5Oq7vWcI7Hs7rCllsctRMt3RHd7PAEpn2m+SrL
U2w086QVnQe/srRRHPuACYrQIw2Rzs6m13CwsVY9dgnJZ4gp8TMWd1ublGyFfmF5
8vASpAJNf5wb4YArKjLZC5y7tX0mN7MsxDjSzrH8H9Sjn3jzIdq/vlsfudLof3gh
rlIuetHCo0OUQB5SOEtnP+pu8j31ULTPmevcMtNOHG25TG+zOwnLCu65gF/DcZAm
AXvLpSUjmfZCZB57I1gn71j+7hKbRE4ibT0tRGxKxcqTpC8sfiGd2++dTubn6QCd
xcj3/km2CKJvKl6V0jHtVdaOLSRQttfE0mQVzuUoLegOpHOXw4RSTA0pDBpIj1mE
+ivVa33rMlzjrHxpMYtoNWWBmA38n7Sm361WBysD//Ucnv5/b7Xkc5gLJGybBNHB
8eMB8TKSTJYLAhDejCl9CFslIzecaMf68Iu48Wiwz3pQ9It4i3bjQ77FeuZIqRNE
L4MGB4MN++mWXBu2/WQTLrG3YwfhUL0YlFEZh8wkYrrErrzGPaAxH9tGTZc0QAEu
lNg8KXZSNhLEtBjNZLstbqdSJNHMKLGhmUwOZb1s2BSgPPoJjQE=
=iKc4
-----END PGP SIGNATURE-----

--N/hTo/3gW1AqHJcu--

