Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0535E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fCSODvcBdp2PEhtURkA7UUjirAp4XG9bUc5v/PYx98=; b=hiip3FGkPqzeYTumvulyDJFqy2
	WJ+R+hpqr0I3LeFcTtSlkg1RttAMX1LozQ4EJng6Vahlu/jVMa03rIqyzms0fzXfLcnTaEgvdXvND
	rSfobK5C/8oVOImUgM4NhBK0DpumwEnrR9C1kUAcnip22z2aRt44SsOzmVeHoIcnW3HePRpfJXna0
	8fIrC0XUvfktMVIT+UE1pMwid4C+e01RlbGEbnD6WvDX8RZ3M2p9Iog3v1klraa4jGdUJvQtgb7J3
	RrchmNldY8ZqglqEvN6dHsiGOHbGhMskE+XJrtWrYraQ/OFylybQZRziNihmBxvsWr9Ug5CTSUoLK
	t0anWJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLi0-0000000CYle-3ex3;
	Sun, 21 Dec 2025 15:51:00 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLhy-0000000CYlD-2Bkm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 15:50:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so21273225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332256; x=1766937056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fCSODvcBdp2PEhtURkA7UUjirAp4XG9bUc5v/PYx98=;
        b=L0yL4jMuYrYaQiwJ18BOFRfJ/yer+celXyYJgT+dVecfEPsRlAmLpXS8oYJHvrZ0SR
         alewtM7zIPFVYrn+/AJnL00m8CuHjo2W7KeKYrwPoO38mmlqc0OA+EOPT9DeXRriI5lH
         x1IWXf0cfxB4l/w4tQngWHAPY84dpq/cFIuqVJY0+9jjt9mfcGOMEBd68KSkBmUFyPbQ
         w2UCNMsdIFpWNNeW4eHx9K0jqZp1NR3u7orXAMrI7kLKo4UQBPx/cQse1cdl02/HnNQV
         COqPO2R/WXKqrlIhl+KJ9Umd7s5jfMd3+fxorzeMWtyRGMFjkcNhEYPj2x5RwAXuMCjE
         57SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332256; x=1766937056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fCSODvcBdp2PEhtURkA7UUjirAp4XG9bUc5v/PYx98=;
        b=BESeCax3LRWJ6L26FRmzKa1ZHCsda6JOOzRTu868PySeK8CRnBXRIuhXEGPiah4WeH
         RqJ+w9UUVhP27yJ1JdP1BsQb765t6OcLjLvrURdxW1nLDXoOXxZ0RnHHzHOOzzbiVX5U
         ad7H5wBVxOVmR4dXHuNavz0ssme3lmKKYji1KRSvOOmDnKHbh7UXHyDGmX+9Ug1HZjWz
         fBGG+H1mcWwixNgFviouBSyx2gB60UpQH/g0G9FI5DVbG3g0Qa+Sr00boVTu6yITiXRn
         j6MBHVOo6hs1GbnLH88bSnRrs/SNM+Lr4dTI7vMX1dWItPc7vlVpnATaAS8Lqfjx+bWN
         051w==
X-Forwarded-Encrypted: i=1; AJvYcCWt3aeMe7IyPqkwlZaK5XknpdavmGOzH/G2Y3K2Fqwf7pdkqmA8HiyuSHuA4vbvuLkuneGqRL72zqeoieA+LSx/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcbz9FrL0ixOz6JWG2C2BqowNPq9wvZrwpN1a6XOd4g9940yVq
	PKrQRC9V6PgNS8EvOgKsYMA/q/J40DGCfvXjwpAeEffU5NAseLvv+M32
X-Gm-Gg: AY/fxX7jTKw39fFJBebdZkmvXKNHOPLb8Xp0Y/6/vCEJSwG+2zJUQIVpbgPx5QyjiXO
	sosI890cvYyvLtXgZBVSmpqOTUs82efckbEhQbBsBhtAes8zpoR81gjj/eqk8cmfYaZgpWEe9Eg
	iujGIVfzDwnB/83MutuXIpl8LWPXUF4mYxrBdI/Lo0zr6gplbCoDh617iLF0RDOXfY40BUHD6oh
	rUdxQd6/zveMWwXklWbdBCqQNCfmDXh9Oj0Q7dd9AhCQouuiXO+CRtNLTtJilPNbpNTPo08jfGK
	f8bswPrlLMFfRQiMa0Nv98ft0mDFOZivwgRZ0h+7GuLqWDsUfl5nERFxzzC0Q25YHSSXm6ftQIN
	Uo3stlGxBm4/r13k9xNI9uTEoh/rDYeSSzI0Lbrw6bIUFn0Q4FDAITljL5ySRZ6BEa4jI27g4w3
	ae/rk3oseku9BqhsyuWbiFVwLhTeNSvVeWGHivw2fEMlo3HNCuNtNczesxk86MonLggCq5IoFTi
	FJ5PA==
X-Google-Smtp-Source: AGHT+IEbzuiMyIUOvROlypd6C5VqTcqsXBg5CYHBj3GvTOlnnKn2/wIG/gIMrEnzDQVWqbyemA9QRg==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr82073325e9.34.1766332256115;
        Sun, 21 Dec 2025 07:50:56 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a40c5dsm79185175e9.6.2025.12.21.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:50:55 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] spi: sun6i: Support A523's SPI controllers
Date: Sun, 21 Dec 2025 16:50:54 +0100
Message-ID: <2391651.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251221110513.1850535-3-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_075058_596489_09E91FDE 
X-CRM114-Status: GOOD (  13.25  )
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

Dne nedelja, 21. december 2025 ob 12:05:09 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The A523 has four SPI controllers. One of them supports MIPI DBI mode
> in addition to standard SPI.
>=20
> Compared to older generations, this newer controller now has a combined
> counter for the RX FIFO ad buffer levels. In older generations, the
> RX buffer level was a separate bitfield in the FIFO status register.
>=20
> In practice this difference is negligible. The buffer is mostly
> invisible to the implementation. If programmed I/O transfers are limited
> to the FIFO size, then the contents of the buffer seem to always be
> flushed over to the FIFO. For DMA, the DRQ trigger levels are only tied
> to the FIFO levels. In all other aspects, the controller is the same as
> the one in the R329.
>=20
> Support the standard SPI mode controllers using the settings for R329.
> DBI is left out as there currently is no infrastructure for enabling a
> DBI host controller, as was the case for the R329.
>=20
> Also fold the entry for the R329 to make the style consistent.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



