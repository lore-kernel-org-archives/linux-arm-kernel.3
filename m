Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80597CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=; b=eH7EaxIXMfL/EKUjsUFRYvPwmZ
	uDbw7+qVX5fAHt9TC9JOPk41V+ca0T/1uAc0f9rkjTjc32txoCC3ev7HWWoxCep5Ov+xL5Qk6WKdu
	haLpbYdXcpNN0wATLojR/D9t+wWd5GvFBvQ16DnGapz1rsvOAuMfgIDhGzy4vQAXZP4ycBKUbHr2c
	PBHYJK1012F+QbIrWvNT9F9JM69M87QoDOii8hb+V3En2TLs1QfxiuW7rtWgRUA864Dk+40pizrxW
	QEOjBe4rYOK8PIpjadeB0OVyOoy9fPwGHy3O8n03GpkEu25RrN4795WiY24HtXVoDpAZnq5g7FTjk
	DPE+IBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNd4e-00000006YeB-0Zde;
	Thu, 14 May 2026 20:54:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNd4b-00000006YdX-0KM6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 20:54:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso74160195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778792063; x=1779396863; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
        b=djar2rh8PNIvaRNQtZent4zcDnTwilV58Yn0+www7QhcyocrPxxJc3/RbNB4YsUauB
         s7IBjP1QWnqQL205yrmIGURgRxd/NlnG+esKSk6T/p7Q/quQZia98S9BloX2CkYNlu3e
         5Lt+Tfjl+bEbBzNVOivFgY/a5qV0k5mJ2JR6IenptNm+ZQTBykddjY7dKfCPazvIcbTH
         MstGSggaIMscKlR9n/oLgpDmZptAhFMMNAnxrWt7wH3tWq7jWs8zcbjEEZ12yhpdWq8o
         WRxVR6Jrp2rk4ltbFhQ0FEVuKVxkZa0m89ui3QcO6dgEMHzl6lZiqmeLBCZneYATBRkP
         ddAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778792063; x=1779396863;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
        b=iZcbCXxLqqODVwWJoeVhL/m92XA2MlRGXoDMibayzoIDRVw5sZuL204tFM4vdLFWga
         3j9Rvg1Y646rz2yZvq9QeXu9S4cuqtquHw3VC7zKhR1FXO6ewue3x4SRE5WXE6rYfxIJ
         6grLpn80RkNsA/KnKueHFn0tIzjhPSP7vs+3UG0MgvYlZSKHDl/HU/S40M20BJQ92R7O
         tyNheO+N1/dB/Zwkggh3S4pGoB9cXg852sOiXTuCMzaLCUIrCLDaY4ySaakzczarVhSh
         iv81bnF6LAh5WMpxPm54eZYel9jQ9kjcbmg1YowoVNpBKsoWi2w25LS3UQH+jAGAu3NL
         DNCg==
X-Forwarded-Encrypted: i=1; AFNElJ8Uw2HsY9rQCXyIvTzOjtXSu4jKjpq5BoZjDoek8ir9QZ1LVIo4gtVLoYRDl2i3+xfc4ObKIuZRqDcygnFTy/Dk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2heXiIuNq5B8wmTC322Qdx6d5BvomW79cFitVrpZnFLjRyzis
	i3i19385eKKClvS2lVf/bYaqZ9BFRkachrigYmKamR6KKCr/bY3Zy4S8
X-Gm-Gg: Acq92OEN60ItthicAMUSJpG2ioKA8KA+hXgNyu4jBH58tpYTtIzvtP4sWfB9CvQnHqR
	chy0rSHyJBSBMdKcyOlSVSH2nJhJLui4KB3FXVqZgZb1FAkiNSFEKi/P//650PakVYiOCc+CnOV
	stZZJ+Oq9+qwd69xD146Wp6Hv0yNoYNhC1gwmAF6rQqveKdXfQhIzDAyHa+JlSu7TkUVNPcWYzN
	nPZxCb1yQCw3stP7o0a68ABk2cMmV7NoiR3MQp15+3Jz0G3Y1vDJM+PSYagohwjxS6OWUpLwzuK
	21ZWOeyWedCnnFWN8iPGYapxMAtpD0sRcS2hSJxIrNTmi2EmEvKRtjW2n+eelM9nXL4DF55TnRB
	axp1+MpLVmn6WMTwJAfrlT8e1ROec8CyqtrG+22x71BJj+sasiTJR8V3Kb8qXVYP4Sy77oEDrTU
	g1wDeCHzu1RK3p2TZvEsl8RjF885l/ajxnOLgX8UWieISSdA==
X-Received: by 2002:a05:600c:6995:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48fe6322219mr11555345e9.28.1778792062912;
        Thu, 14 May 2026 13:54:22 -0700 (PDT)
Received: from strix.localnet ([197.250.51.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm14608105e9.10.2026.05.14.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:54:21 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock and reset
 bindings.
Date: Thu, 14 May 2026 23:54:08 +0300
Message-ID: <5993526.DvuYhMxLoT@strix>
In-Reply-To: <20260512-musket-gaffe-376f0450a610@spud>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
 <20260512-musket-gaffe-376f0450a610@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6267680.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_135425_136297_FC59AB53 
X-CRM114-Status: GOOD (  10.39  )
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

--nextPart6267680.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Thu, 14 May 2026 23:54:08 +0300
Message-ID: <5993526.DvuYhMxLoT@strix>
In-Reply-To: <20260512-musket-gaffe-376f0450a610@spud>
MIME-Version: 1.0

Am Dienstag, 12. Mai 2026, 20:02:03 Ostafrikanische Zeit schrieben Sie:
> Unless you want to model top + matrix as a single node with two register
> regions, then list it all. Hiding the relationships is ill-advised IMO.

I actually like the idea of modeling it as a single node. I'll give it a try.
--nextPart6267680.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoGNnAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiz5AQAIUbXFrbsjS/R0yXIQdA
b1difyWEbPGIi5HfSb1sf542X+XVqCXHizeLtRKZlWwCyj0sk9jpqYoRVia5j6dF
ybEknbcJ9zAS2119flV9HxmkGicslIwemmhu+gwZfN/isfPCu4qvc1Ka1Qp9Q96B
suf9ksGMyQw3RQ8QFFymslUufSQDTmkZNZNREBUaUGrlJh0bu6Mm1C3VNtmEur+5
6iHFmf9W1oGmxl9GPVygMFbt3agnG60QySBNj8YPpiBu0ga/9a1ljEszdQc+CgQz
Rqq3nF6yoFZjJpIAfFzkmfi264LwqW3GQigKv6399wxlyVWCrwcH+d64yZwpuFM6
lU0rCRX5D3LpehfKfgrPUtGLOTyW3/x26tTWGKooWKJf9e3+AdjOZMlsa464R2pW
rElZEhBYB7wT5NHyr/zpQIje/3PNGMd9UvoggGsS+rMx2/5BrSOlFGGf7kKhquUk
aF6IV/9pxSZfHJ7v/HYX6NnoBT9L+FtK6bHtX0rgNP65fI9v4kRN4Lj4JkI9Nsa9
eZTciGlEz61crCNgczdNgfxhzvKC9RiJtjHHX9iD/wvLVyZhf5B5BcTdu2liw1EP
TnLsYySz/XcMP3XIlZmQg4eB+oeAy1FgIG3JOIW8nBrtkepBtJyKiBQVvz85tU42
G2m9j2RBmGrgURCqe8LoW8J6
=xlqn
-----END PGP SIGNATURE-----

--nextPart6267680.lOV4Wx5bFT--




