Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E110D2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV0lBLqUhbRGXbbqopf6xRDXiTg4koFgUnIUJCqwVao=; b=38Ze1+YCqL9dgWKdO3+zYrGjd8
	EvyzwCtmChHuHu0w0KfgznrHarsPEquH9JoeazHsRRir8gEOt7YT/MM7SpNeMOnz3RAjI17K+zcUV
	sb2vzypRMNvIKbgrIWwSh4JWF+vDVPAchGHMcDkEkQbRvq6Kcywa2SchkXaBX1F8g9XyxrrJsstMr
	gl0gaVUB7WMudieX3COKvvdyHPpZuLAVj8lRDjjYMYdZEu1oUo+xGcGew5pNuF6kJxgKibxCje3Ui
	RmT4stEJHeQFCEVdkJxcvkjcZDtwxiG9FolkDAggnXG69qQlXj0hsWUbEDN+5kKzpQdWMG7IaT4fE
	93+APhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5k5P-0000000EBFl-0uIU;
	Tue, 29 Oct 2024 11:08:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ji6-0000000E5Ef-3XYj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:44:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314f38d274so69760735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730198648; x=1730803448; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uV0lBLqUhbRGXbbqopf6xRDXiTg4koFgUnIUJCqwVao=;
        b=Ru4cpRKJt74z6XwH5Qo3urBEPyIM9k1WNWSATfmSrN4oji3iLGxBZKaWe8tV8qlDOE
         mHM3R9IAsrGUZ5eqO77seA2W3T/F2IycSaVQ64j0ewAQ4/UGJuUq5RUlJmekIelHQyG3
         Pidv+YllZmqHCCrGs0W2UQP7ey/KRmMyskJBw/ZRB11dqHCWTEdFoSfWzYoCc8m7TFUz
         EwI4LtvWK3hodO4QJ8VbOmQjczrqyRMXvRXXBqVuoVYdZKrEaY8Hc1brXLhnUPtstNbq
         ufFOWqsmi9O0mw7tPH56OOpoM4Jolkj/mST44qER19YydasCM+f9y111Gc4W5To9kGCL
         5Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730198648; x=1730803448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV0lBLqUhbRGXbbqopf6xRDXiTg4koFgUnIUJCqwVao=;
        b=N22aqLVYt7OOhHTsWbcgSAbEIRaS6InG6/t1Tw2m9ApsY+ZHO2+7x8zpJ4TyhXf5AV
         ObeNjbib7fI0PCQuBC8TLz7zpvhO9Cx6NG0/NucZ+wX9A/3jexPhljjK6VjkGRIjY0t3
         BDS3gY8qKeBegNzwSFoTkVVjIvSMBwqhgMy/X4eInhSnUVVYlg0uWLyRrmWfOnevW7qA
         1iXdZMde25UenZ+YzZz5jX6u9FghR77JAZoYJw+4gQFAhht53kEad+djAk+S+WrYF9FP
         B1k0YsyTWqWosqK0gZdtNUAXDSftvLsi2EMduc2JUzSzzZrbv46X82OfeJKQ24cKXHLt
         nlpw==
X-Forwarded-Encrypted: i=1; AJvYcCWCC0mnKj6Qua5w+Iko2JKAHKrMHPjMteU05IlRrDOUo2ioebf7vsON5GEMsHGYXV7etZPdvaSrDC/3PNJ6HnDw@lists.infradead.org
X-Gm-Message-State: AOJu0YzBOaY2onPcMV8E+VCcDhVFKsxam0t/fxIYboPUguvHSmGphpXw
	tPEUFvpnwyslowKpgO/Y83fnvAcm4EySC67ZfkTPRcJp13E+pJrGPUabcRdwhF4=
X-Google-Smtp-Source: AGHT+IFDd9toNEVebdV6GM2H3JKBp+TnL/N5UFyps7M6//NaEXMseAjAq8HwH15HVV5Fc5y5sz8WpQ==
X-Received: by 2002:a05:600c:3512:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-4319ac9a785mr107122565e9.11.1730198648310;
        Tue, 29 Oct 2024 03:44:08 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b92f11sm12079610f8f.101.2024.10.29.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:44:07 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:44:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding <thierry.reding@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, justin.chen@broadcom.com
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
Message-ID: <7aok7zs7whxfg3bhv7koxfxq6qhgv34b7kg3mh526z2cf7e23l@ffbsxqdqjis3>
References: <20241012025603.1644451-1-florian.fainelli@broadcom.com>
 <20241012025603.1644451-2-florian.fainelli@broadcom.com>
 <20241015163200.GA1220909-robh@kernel.org>
 <252b6f39-3b06-43b7-b227-1c29c1c12bd5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4cvjuzgzwtcm6jma"
Content-Disposition: inline
In-Reply-To: <252b6f39-3b06-43b7-b227-1c29c1c12bd5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_034426_919182_ED54A1F8 
X-CRM114-Status: GOOD (  18.77  )
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


--4cvjuzgzwtcm6jma
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
MIME-Version: 1.0

Hello,

On Tue, Oct 15, 2024 at 10:07:10AM -0700, Florian Fainelli wrote:
> On 10/15/24 09:32, Rob Herring wrote:
> > Another thing to consider is for any PWM controller with more than
> > 1 output, you might want this to be per output and therefore should be
> > a flag in the cells.
>=20
> Yes, that is a good point, this controller has two channels, so it seems
> like increasing the #pwm-cells might be the way to go.

So the idea is something like:

diff --git a/include/dt-bindings/pwm/pwm.h b/include/dt-bindings/pwm/pwm.h
index ab9a077e3c7d..d18b006a7399 100644
--- a/include/dt-bindings/pwm/pwm.h
+++ b/include/dt-bindings/pwm/pwm.h
@@ -11,5 +11,6 @@
 #define _DT_BINDINGS_PWM_PWM_H
=20
 #define PWM_POLARITY_INVERTED			(1 << 0)
+#define PWM_OUTPUT_OPEN_DRAIN			(1 << 1)
=20
 #endif

and then add support for that to the core and drivers? There is some
intersection with pinctrl (depending on hardware). I wonder if
abstracting this somehow using the typical pinctrl properties would be a
saner option??

Best regards
Uwe

--4cvjuzgzwtcm6jma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgvHQACgkQj4D7WH0S
/k4+iwgAjc7XEedu+25b7SNYH5vkBjaMm+K01V70SIUTshAMpLovuNsjbzQq6gNo
SJIwRMnsjcofeOlME5jeQYNZFA+M1nq9cihDvbUntoS2ylkwgNhFggKKQPXQ8goB
uPGWeRngZsmodqIRBw6nSQgGXlELsQkBchj3pM9XjlOKApNq1SKu9VqgQVY/C/ku
ObxIaFk4POIAW/W4VUm/sTpP7do75qWVemdrckfEs3orE/1x8w+9JKEYqQmus8vQ
yeVPDEVIFAnI1rx7qXUOH3ojZRhAsom35euFMSY0oumokNN0VUQdkB0ZVPr7O4fn
0On/5fTjF4nnOTVxM1IrMrqLNz9fvg==
=tPDq
-----END PGP SIGNATURE-----

--4cvjuzgzwtcm6jma--

