Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB95F105F7A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:Subject:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IJm+mKNs0KTRazp7NbSh/Ls5bbV5YPO1smMsqzpWe4=; b=x18N/msEpgc594cY8L9L1BEzc9
	Y5XErIiZSGKvVa3YU7Z8ZUG7PhHMYNlhXA0z4hT1JK4U9FLcVujqa9KxAInAbj/x7GmplrFucagYG
	2uEJ+xFlVPBsrUbnO2yy66BHFEDIWHQ5DgHopNBvV+V++C8sP1ei/FnZsJ5iVL7MLaV2v/J8y2IAI
	JpO1EQ7fyEj19MtnSQtEG3KIGVEzt083oVw4oURXF5YebPtWNBF7Ef9EiSBG9IeR3YMSJ1THOBLpn
	VEDWywGQltpavJGK6DGPd3ZV53mvszwcr2m/uac5hH/K64s3Gs+prYi1yfG/iZJXiA7f4RWhRpW/X
	I+t1dmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12iu-00000000IBG-1IKA;
	Fri, 13 Mar 2026 13:38:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12ir-00000000IAW-2vU4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:38:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-485409ab264so15713815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773409116; x=1774013916; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9IJm+mKNs0KTRazp7NbSh/Ls5bbV5YPO1smMsqzpWe4=;
        b=Vd5ph6s7woQ0kPkGWg2aSsoq/+1O5oo75mtlH97vspR9OSz4PM7QWlj9a9R+o+NsYn
         dUqabQeX+hlWyvMw8QGwsRUCO8mbGUgpm0sWgFhD4z6ruB84IdtQbFa1y1M467bhlaB2
         3Z9ak5bzujMwAJI9lvWeIlKL6BnJR0u8loNPwNfLRzDCdfS5MMl5NhzZKs2pkDbSTiXy
         z6BOIPXTquFpiuuBoRjQtvfm0uFgTimH/ltJ769G4/PKJKfa0vshx9UV6c4MEos2flfD
         Kn5oxA8zUQ+3lnmBCcvvu0J7XWUI5spwSUsQHLo5nqI99ip9shY57VkGapCjjQvSRRX4
         /KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409116; x=1774013916;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IJm+mKNs0KTRazp7NbSh/Ls5bbV5YPO1smMsqzpWe4=;
        b=nUEnup6/NNMt2oaF4N+w9C9E0knoFVyAlA+Pl2JaDFUd6zybhrZP+FVIPQ4hoqSQGA
         AzXvQQ6Lm5IuvF5UaEebL/XvKy3wVlaF4EkxJy82LtUVLpw26KcFAfEJH28kGnLac9rL
         sFXcejf3xXRvnqxkxUQoTvYrXiDrGKo91sjTVufjOHatP0LvgM4xN2fOXGfFM39ALbf3
         HBtUwJ4Z3f9eucqyQGPkxuYItWdSvfzocOZnqAxMDRkGyN8/scOpmr6fDxDC5hmlAQRz
         awZhIsGy89ZONarnWOXXiJQrl2L0MiupoeccteGCWnzcLSQzwodXIUYdjItLOQ0vEAt5
         K/EA==
X-Forwarded-Encrypted: i=1; AJvYcCUb2xV3gtVxJjCl0E0fWMiULCfS0Ogr/g1yk8TFTdK7nvUXyJG8aWv+EyuebhBYzVzjQsku+UQFt1WW8mUZJ5pG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6QMpuJbXcx9zEu4/wYtSJNEt62b1nyqXWAnz+V+Sh/p3CHkoY
	dvlxDAoib2611YwRixD+6R22/o1HWfAHX9ige5+WJAL88Yx9LUZtoNNwWjMSQ/cXz20=
X-Gm-Gg: ATEYQzz7Z2jakVRT/ANXea3z+yzcJIbjs6Y8PdPWZL1aQixMsesB+wUJXiZKDHAFXkJ
	vTi4auNjtkLqXr5d6N7uxEBvZXqdUV5n6m4x3LgG5OS9XyCMIfrcQtehXfRiPEuUu5LbcxcxPUW
	HoCTBlC7VQqD0QscDbxDzjXU/WXm7ge9DTik4/xLvcvJHfl9EYnZj/+NVph75JAv3KS8m+pND/Y
	yLzkWBQ+18+3iDDN19xceJtQlKuGx9ZD2gUaU1iqnCBX2d0gIrA/D2DKOEYvb6OQWW+Ln3Fxp1D
	XxJIjLmEuRGFaqGdhCbsGZvl5nAmT5fKvX0mEuWJF/eRec8NNgEhbOFY/MGy8c2e8BEosLOQgSp
	rRg+qUw+LVhHjjpYPM6SEarKV41QpYgQOVqr9O7B0nPCaUlpRD0eDUc2vpDb+CwctmQVTn8PtTu
	2cjCk4wSHj/TEjM+s=
X-Received: by 2002:a05:600c:3112:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48555b4b092mr59466835e9.13.1773409115669;
        Fri, 13 Mar 2026 06:38:35 -0700 (PDT)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm352579825e9.14.2026.03.13.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:38:34 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 13 Mar 2026 14:38:25 +0100
Message-Id: <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
X-Mailer: aerc 0.21.0
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com> <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com> <20260313-quantum-modest-prawn-896bde@quoll>
In-Reply-To: <20260313-quantum-modest-prawn-896bde@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_063837_752395_DA433CE3 
X-CRM114-Status: GOOD (  15.27  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva
 Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall
 Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal
 Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Krzysztof,

On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (TI) =
wrote:
>> If memory-region is used, require memory-region-names.
>
> Why?

This was a suggestion/comment from Conor in the last version:

    Is this really optional? Shouldn't it be made mandatory so that it is
    easy to tell the difference between the two configurations?

https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@spud/

>
> I don't understand also why this is a separate change, but maybe answer
> to "Why are you doing it" would cover it as well.

I made this a separate patch so the git tree never has any
binding/devicectree warnings for memory-region-names even in-between
patches. That's why I created these patches in this order:

1. Add the memory-region-names as an optional property.
2. Add memory-region-names to all users of memory-region.
3. Make the property required if memory-region exists.

Best
Markus

--1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCabQTUhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNY
PgD/dG12YM5FMmV5c9zq9GvJxbmUXk6S8TLCSlBHnaV51m0BAKJKmAgh9p0rHffR
2XYe9hOtFZ7Oqgui3rMKtB2Gqy4B
=uVCn
-----END PGP SIGNATURE-----

--1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9--

