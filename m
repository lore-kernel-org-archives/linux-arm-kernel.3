Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6946DCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 22:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=; b=I/YuB7Hux1Bojmib3FjrYediwW
	yPYCftif+2f9i47OvGli9UFn7N6wr+XfqbuqcfDstFWK4EKlSuiDcWcA/5ZNpuV/nvMXGEh4BUzvv
	Dv9y1z2wDfVKpaGJWY/I1n1O9EeEe19jcFBV5512huRopXCAsdchhGMlYIbj0MTGy4VYisxkzX5zn
	haJVl7VrjgiCqWQ0sURNBGkRqonttBiQupg3xRfllZMmxPquyw0V8GtdHTQUU4dsaJSDCGmP8oMpM
	Vi3gLI39UvK8Eex1ANmXYBFYXI2fOv0e4wq9Q3IAW012E/9IGutZWG7AeuiZqcYXgjdPESldEhNWa
	YY0wg8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb8L-000000054bF-2Npv;
	Thu, 30 Oct 2025 22:28:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb8K-000000054ag-2k56
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=; b=ZHcRccLFsgXObaVXCbM74bH/5S
	0h/PlXx0XV0bA0J59RErtIbgaNDKkXRutdV1N9fESlab33Dye3/BiaVuVFt2UmS4aoR+HFpG6tS3B
	+o32u5NZGz0gVUkOS91KtNYB6HhQg8rDm91N6Mqds4xVPOuNTSbfWLsBQ/keRtuT7QwLfzTBkR7dB
	PxkMYqCaKC62St19frsJGAY3hsqUlRgw0ZoDaiU7QS9Ooe7M7OrADG3lzYW1W0guHGP0QvUjrHrv1
	ErEj26J18aW5mXOSrFdrbfcA0ERo4FbxGCrgXU65yp9P8UlN8Jyz++kR9xlCr0uvp4MhLVm95HJEg
	Rs8rpRxQ==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaGV-0000000A7ye-1Uc0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 21:33:07 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so2995941a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761863313; x=1762468113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=;
        b=UHzZzV301LsfsvQdFaf42w3xZT+y8ii52pRjujDfYfmBhBcOpbNV79iEvtmYdqIWXi
         fzdSLC/K95ANVWmlZoqQ2fhQ3MllJ/P1i7NLxUCc+qJGJPJywTocvzo6FnW9VmEXB5Gc
         QH1v2dAHnfc3d6skzHfS5go5gZdE/9ZTYIGxoldT30cfprkB6U/+VX+yNzSFJvOYDYJ7
         E4zj6N+xuvr1oSH7DmnhIYMEgQoJi8j0Z7O9DFCMufZCaGqRNw/ueL3KfzDmY52TbpBr
         7OaAFapVbwpnJp+iXPJFQcVm1cwzmcznu6p0E4szXGEr0MtDuWkcDsdqU1rvSHt+4BNc
         E7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761863313; x=1762468113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=;
        b=LOZhVWusi44C4XPc2CmO1jGPuBq5DVOlbadWONbEHK6cO946f5pYLpnBfICSI/r6T4
         eobpsQFzSeFvPc+cfh4PEszelqYbQNPTDbuB25wnL54dq2mY+HecQ+ow/AyCWk9BdoAB
         Ml2wqbnUs5GT4WaFV8O1AUyPVt8Zaqu4KU65/5d7AJQO5QPzGdJWz4Kh2t/dY8f2Oc55
         Ff9Zx29i88YUEkqMG97vKSI2+f3ydp6DSk7FZ3vi664NJ+a3VhG45zhaVcCBTTjt1J2F
         ZTViwEX6kXkVywjOhi2pAsOtJECz2gxpzWNejcYsA7PqYccVO8agG004Z1bd3vM9QqV4
         vrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCV2970ZR/AS7vnmXDwXWiGdXEFJNNRu3uaxnB/3FvuLszIAvK0HxisojR0/SM9aU5Vd2ywqrP+ysGqtbt+rgT@lists.infradead.org
X-Gm-Message-State: AOJu0YyXt1gOlptbeJDsyNzkZuf8YToTdFxjRD/v0+DesCzwlPJeB7kM
	B2mmjGlVfAfiAoTECGFds1SZ5QE0lWXdyqL7vTX9WkZd7FYIuN8CMJlDZFFNPD6StYc=
X-Gm-Gg: ASbGncsL47BeFdX99lJLaMpE91y1Tg0LTk8tPaaX2Db/iFmH17iILJwn2LP478WnOni
	O/mpv1Jas9bIZwBvPlgmfn4wfp3FggF3RBbydEk2XBfiYyLKB3uciZcCxb+eiFovAcKbPlT9yjw
	okPqVlkEsQD7Sr6FTMDox6XFs0cgC0w71ExeFmOq2hv8JvMyfbBZg38ka2XiZkSsnTitDHBoqkG
	jRXgaDN86NHbBkK7CdhndePw5eN/dayXqCQaEa9d0UTti71pfb+oIVfd3RuvTMlN9I5B5+/VKRx
	zw2onSdiAPRw6rwCJBdGi/8BLU9OmIPFMNssyTQQ+XfPhKN+rupsbVBEpACDHK6L9oukE9G4HNb
	Lqbc8fGRb7cCnClcZ4ruPVjEN65cfmY7m4pMbJNSCxs/hZ4g7P/eqp0btFPq7+kHz7YWMIoymu+
	hHbfCFyw==
X-Google-Smtp-Source: AGHT+IHJSQvJu6sueJxCiUL+EQWJpzwZ/WTHJR+xaALkyTaBAgSDfM7hwfeK84Q5Re4DmoCk0CX88Q==
X-Received: by 2002:a05:6402:440d:b0:639:f7b5:9c2d with SMTP id 4fb4d7f45d1cf-6407704f19cmr962096a12.9.1761863312684;
        Thu, 30 Oct 2025 15:28:32 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6407b439363sm86845a12.32.2025.10.30.15.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:28:32 -0700 (PDT)
Date: Thu, 30 Oct 2025 23:28:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] pwm: mediatek: Convert to waveform API
Message-ID: <4lhh35sxh7dkmn6iqpje3zojea4qqc64nes2npkuxgqsucusah@sclwr7uokzq5>
References: <20251013114258.149260-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmymtir4yxpkn2ip"
Content-Disposition: inline
In-Reply-To: <20251013114258.149260-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_213304_291697_A9EE5D72 
X-CRM114-Status: GOOD (  12.31  )
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


--rmymtir4yxpkn2ip
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: mediatek: Convert to waveform API
MIME-Version: 1.0

Hello,

On Mon, Oct 13, 2025 at 01:42:56PM +0200, Uwe Kleine-K=F6nig wrote:
> Implement the new waveform callbacks which makes the usage of this
> hardware more flexible and allows to use it via the pwm character
> device.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks
Uwe

--rmymtir4yxpkn2ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkD5owACgkQj4D7WH0S
/k7yEAgAoj8oyEvLV8k3Yq3Ir8m5016o/vQbhThpW9TRHRhr5SKtxVfa07ZM7yWC
Aho8ZW2AwOIuNRnr6bUs2k5O/lSg0UBZU7TMY8AVXbfBF8hj6bcoNWbV3LD9oGTC
3B37fW+mlwT61d8Op6o4r9aO0zO9sQgMcyUbGSCiHWasEaD14xnCFGpHP2aTwoJG
WSC635SJj7uTVzsuWFAdf3QQNR7CLCVSuMn4ko6mYtGevLy8xapCfMOfdlQXEHMA
GpOj+H+G57dNpleEGxa6QSMoQ1uMwyCPC5tIAIgJ40xjIfViQBuQAOF7BwXZXPYs
8oKuk9iEEHkCM8kcKPSZCoCKcRgaXg==
=0ccV
-----END PGP SIGNATURE-----

--rmymtir4yxpkn2ip--

