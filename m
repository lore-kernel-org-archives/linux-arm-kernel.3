Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D6BCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=; b=ilLWLNYn4nbTTCNbFkWpNW4YYy
	VniRoLhoqQWo2PAmvGT+vkGb7BCs3+5RkiDRgi8TdWiQW1Kj9NShwnBFSO0C1L4xzZopUAzqFBkwN
	RiyiB4yIB7fULDCpypPYBfKIk1wn2v2yD4ysd3tk5KxErwkSa9DjNvnqwXL/UwaBTR62zJWjnA2uX
	VgM64EGmMq2qaAZOCXlZ19JUBXBHTVPc9e+osLoqHFzixvq5VxepkF3LMIPfEoEqYONMxM3jfHbWd
	be4THQtmyRs0HAEcNhwM0FB4KxIYhWY5m+tXtl/wsSAFGcIKclKz7XfwZhbHb/kulRPvmgtjHtroj
	DhkMSIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2hY-00000009U8l-3yw8;
	Sun, 11 Oct 2026 23:11:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2hW-00000009U8M-0kzI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 23:11:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso10434775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 16:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760288; x=1792365088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
        b=ITP/2iPw9r4l7aexKdGbVxcI95vBmbkkTkYF/pHTRsKgPa1csNk2nj9+X69prVA+co
         ygQ1McIUWwybCvoFwlsHRKC9+Ayep8W1t9NEg7nuMqHgCFhjwGeGvRkG8o4i98XV6mSx
         tP800DVrmRTXXzsMhs6jAdnbaAtmC5QJR1Dnin50Z57NTpJH1u4JOInB1gT+Lwq4TNwV
         cYJROdvliIwzjA57zhfgS0d+Hb7cdF0Lcv+jLB+dIqFjyAKvkydXGzB+gPeyLfQid0hf
         3Xp5k/s9rfKwr87dFy4A7i5jPUCApL/Ae2Wzxv2HIYvFVrqqln23CrKjwy/xQBqtkIlt
         thqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760288; x=1792365088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
        b=hcjMxLb4enRPYYFSx4ZOWOL9RtM1EVvBVA2rZMmslQVvC8n9MZLqoQJMGh8AEfH73V
         OPcN10bDj3xCQr9rfbiU+756sWEx9BMKL3MDTHFu+A52HsTW/BAgUMiV07aCG/D6BZnF
         yhnVxoN7mFz9Kh676G7u5RGcMuPTiYY4Y93eki7ocBmeaejRKfwhLCME4h/5ouIPEPDG
         pjbW6wFVZxWYu7uxBVtc+n1crFTzdL8Y5toB5iiX/rMKxL1dTxDy284VKRLDOX5sSmcP
         cmyKuVF4F95pAJ1ISrLsM6+kIkqxFjAbWiEtmG/0mKoVV3NeISi+Bsvf/7vrtj7itGNy
         Bbsw==
X-Forwarded-Encrypted: i=1; AKwUvByEO2FVW+9J9xd2EvFqx0hzwnAtY9xjJnBopiqNDhLl22kYQ7Wmx0mv2GerWM7exZ4uK/166kATlUPWWJjtmTgP@lists.infradead.org
X-Gm-Message-State: AFq9FYI4HTHY/xeYOh0voW5+ob701YTbX7Z2+896bQXPUfrRKCJJmrNo
	RX/pADHdjgjz7Qcy1jrVy4cTBa/SNjkuZ4BG0QGYdcP1CU2Tbt3ys+djowG9mlL/BJo=
X-Gm-Gg: AYBFou2pjRX3D3ZWG1/F2HPE0f8ee6CZFEd34ZCKDG7bZstoD9p2l5Ka/ZH7Cl7OJBe
	ZdshioF2hl95nYFFtyA8RgaFRyDPmiyASCj0Az6VhgM4UrWKvER+aC1LUcM76YoB4fPz3+EBhV3
	DfT6ZwPnVmmQJwjdPC1OOlpOxvPOLEEv0x4ueCO1JtEL4sojvRC1AEb7Y+zy5oN4tZNLtg9yBHT
	P5OqzEWp2lnbLvOr/SIxyX23IRGvKKjtJ2dHhEmAVzaefTDUPYobhSlzSHlwnGEdvzVSQFYANqf
	U+I1K0WuYlJNuiCCQwBaIVKyZc1U7pCjrQnsMkT1KPUDVo3PUn8lZDo1iM4wiuvbP9bjbJ6uBwU
	kAceI+lylyCFiSvO364aArHFxv4BimVX56Ci4hPX07PkSYlSD+C4oknA+JEEXQGQR6NngnaA296
	ZEqSq1aIo2oh3sMNPfxQVAp11TSz9vLDpvmcQdTclgq5gfEd8/LRh7JoKfF0dyKlWcXVw/N89FH
	jQVpHmnzZn1lQ==
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr139639115e9.10.1791760288052;
        Sun, 11 Oct 2026 16:11:28 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea0f1csm352115565e9.9.2026.10.11.16.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:11:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:11:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
Message-ID: <aswXWWBwo22nQ4RR@monoceros>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m3vlfuk6zzwkmzl3"
Content-Disposition: inline
In-Reply-To: <20260930092020.1047221-3-y-abhilashchandra@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_161130_246858_9FB569D4 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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


--m3vlfuk6zzwkmzl3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 02:50:19PM +0530, Yemike Abhilash Chandra wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users of this header. You can rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--m3vlfuk6zzwkmzl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMF5kACgkQj4D7WH0S
/k5XkggArZvlARZhA+GPe6GOSLEsUCLiZ9etxb/qZsK3L9ZqKC59PFOjjYYllhoU
Cb0aqC3Bn2PpmjIClk9jpm0jPp4vVz/n2rrV4yD3oR47HhZpd2sUiiMe/zdYzRIm
KH62ybWOVhC9iTey6Mdo6IJT/JCrqAFXlfVz7e7Oew/Rb5O2y3+MJgfWIdSceR2Y
Fx8ivfkzuGIRMLgM6a8uMX0alVKR8l7FpGG8fOK3WV1rTupg2D6XNra2hLdzfmzQ
nTzggHLzsSEeYMzHd5JJgOkDCER4OzXP5RXhysvmggxiKieNcxD+fTuJnd5FW+at
cIgmrrozCEzvFk9S0gyyeY8VGLLV0g==
=ctLP
-----END PGP SIGNATURE-----

--m3vlfuk6zzwkmzl3--

