Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB03EE7E0DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc5tflQ79bUhmMOCZPDFHjXYBcQcDGycOKsVYYk9oQQ=; b=Yeozc88dqkLDnvnJKvlJb8hwQE
	Giq5utfX3axFFzX45SPbW9Gv5JvEdePh5zUpZ3ydagMMmfz0eAyRC/zaeJI1D1j1hDEtocHermUFg
	Yvtdwhu6G0iXtzDya3ZpjU8qiSsOyBJ57y18NRszVHXlUZXV9OGzFL2+j0DmPH/+DTYq4FEMOsAWC
	qQHEpMNUYR4rHTFAMIr2JYs7mwVCDtjW4RnNwJDDdXEkfrxhui5BIqUlHPdXtt40B/22wRY6dju+F
	LHCDPzfP9bPQYV83WYF/4UO3o0Jt1BTpQM6SoF/yrCea9R3GedFAnx7RPT7j5KLdkqr5o753oNt3w
	2n8njtnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmCV-0000000GtqW-3ced;
	Tue, 10 Feb 2026 11:46:39 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmCT-0000000GtqB-0ea2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:46:38 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-65807298140so1081782a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 03:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770723995; x=1771328795; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zc5tflQ79bUhmMOCZPDFHjXYBcQcDGycOKsVYYk9oQQ=;
        b=b9nlVFPYls4H5UTXiGpUEHlZ6BGY5FqvZqMk7W+qYff4CCocXhwVhtquwkqgxAJgpO
         9qw6ONeJJFXTgjHd8s10iRDMVOYH29Gi6KT9DdF4XQ7IKrCcNrAmpsBQQ3xX5siufpC1
         /E0aSBj4fF/dI7nqeJ5mJHDap1hHh74V+2zx1ILPytQS0oyzba+pPffNFtv1wTdW3MYe
         ft7LuKdtDf8PsrOcIwEUYkSbqwg7zm51SAJqj0D9KseevOfqSfYKSU5ddWsWK6iv91rr
         pV+hhBN8vbgL87O1I6Jf4DTmmriwi1HfxZHcbKEgsF4vjoXPnJz6Oy+gvHj2F86jnrhC
         fUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723995; x=1771328795;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zc5tflQ79bUhmMOCZPDFHjXYBcQcDGycOKsVYYk9oQQ=;
        b=HtsGMQYIxDSp7LCadoJZ04s70cAKddVuSr+1TtjwuYJY9bOaRYRA7lDpUJRwShX3rz
         zvIuKAdxbtp1LCJQ5+VXus4u34rtQvdoqWY/sDis4pCVQpoH3Wiec6+2Enj6qiXBTuOX
         /g64ZeyetNV5sBbHURcvnQRV39ZmaOU8qzazLl3XAZuGRol2To3N9Vwapu3vEyfWMMtX
         IYd+r7QcHX/sQft0AFaPa5Gd5rHbURJWmZ/9X82aFmpQO0U9TFV4mJhA1UORbqtPSe9J
         WvwUHQwpRAQkc618xPyE8B6Rxc6KssUSU9niZbaN+ZLoC5UexBZz9AKcWaWi23k7B/QO
         I2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXRPcLmtYf4P6s5mpZL+OJZnbzQzfnEbIxzfrF5OUyRp623rTnCMENAyTQbAyYJFybdqsJjV+8SeqFmAjFvVu/@lists.infradead.org
X-Gm-Message-State: AOJu0YwKIw/jTMLc5iHuU5zcUWorbHcVf5MgYLfNcFd2koB6ZZ2Uah/3
	05+4nOGCVorwvtx80w/g/AGgVAdZuyBFCdoIXhTggL0mcsF6xcVlsY+z5yI0qqUh+wo=
X-Gm-Gg: AZuq6aLyvuj740L0PVMrNE2oz7H1aH8+CjrgL7ykv26x8+7NG8mUk/LDs0F0TowqZ7t
	eiaJQXFQ806eIKRKF6dGCEr33EbqVqAD3ZMLliQYhprP9nQMbxOBICUGrZxi0ny+pjxzDfiZKMH
	009GvSI5UhW2fPNOSvafuklK33imyxME1n27kSeod31DNdRhS06Fa+595G8Wyb5qNyhzcGLxT8+
	SuYL1HR3pnHcSYGuok4x2wenEhaHtm82z00DYRFuTtwgXPywtveWNa4rsCgh8kS/Gs+NLiMH0av
	zBbizwbgmrv3NoJ1KRGSIclq3mVNBAXDIE9StYFh7lxX3eqMisHyVf3EsT607L9BVePVB81QTb+
	TLuypfrD89jT+FJ6ZDc8sjgKEdNkJb+RBdLLK1M5I+sp/Kxpmg0OjL2AM1pqbZeytdnBeD7OCTJ
	theTO8gRrCwVbQrp60Pfuz92jkxjmddQ==
X-Received: by 2002:a17:907:a4c:b0:b88:637d:aa75 with SMTP id a640c23a62f3a-b8edf378326mr922391166b.30.1770723995271;
        Tue, 10 Feb 2026 03:46:35 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm530445566b.60.2026.02.10.03.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:46:34 -0800 (PST)
Message-ID: <81ef51394b2612368bceb81466dbb090260578e0.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>
Date: Tue, 10 Feb 2026 11:47:02 +0000
In-Reply-To: <cf4073c76c2db84fd8fac3e1c2a63918bf9d45da.camel@linaro.org>
References: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
	 <cf4073c76c2db84fd8fac3e1c2a63918bf9d45da.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_034637_347510_C06C2A3D 
X-CRM114-Status: GOOD (  16.66  )
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

On Tue, 2026-02-10 at 11:38 +0000, Andr=C3=A9 Draszik wrote:
> On Tue, 2026-02-10 at 11:30 +0000, Andr=C3=A9 Draszik wrote:
> > Most rails are the same between Pixel 6 and Pro, with the following
> > differences:
> > =C2=A0=C2=A0=C2=A0 * only Pro has UWB
> > =C2=A0=C2=A0=C2=A0 * Pro uses l2m, not l14m, for TCXO
> > =C2=A0=C2=A0=C2=A0 * Pro uses bucka, not l31m, for NFC
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Changes in v2:
> > - add comments for board-specific and unused rails (Krzysztof)
> > - link simple-framebuffer to display regulators
> > - Link to v1: https://lore.kernel.org/r/20251113-s2mpg1x-regulators-dts=
-v1-1-80a70ef42be1@linaro.org
> > ---
> > Please note that this patch depends on the bindings updates for S2MPG1x
> > from
> > https://lore.kernel.org/all/20260122-s2mpg1x-regulators-v7-0-3b1f9831ff=
fd@linaro.org/
> > for validation to succeed. Almost all of them are in linux-next, but
> > patch 1 from that series is still to be applied.
>=20
> =C2=A0 ^^^^^^^
> patch 7

Krzysztof, could you take patch 7 of that series? I expected them all to go
via mfd and/or regulator trees, but seems final decision was otherwise.

Or what's the best thing to do?

Cheers,
Andre'

