Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772FBC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIiymNtPWSmafw/vlEzUs3yK38VavdvhdwhqdM6/8zU=; b=hutoclAGP+SF5/NREOHteJQu7s
	H87koBzGwmBKsJpGjQqCzMRVHr+pygBEjQ/+wdW53CFRWW4xaofGtVthZ33lfKVze62U+nBq7OIxr
	EUNTJVL2MF9xYxljTlXDhmSHv8KkHSbgnn6M8QToE/28h1ce/6B/cjUR1EwprkVPQAVw9pFjXFcHG
	nNHSkSTQvjNsElxCgLxrKFCVOKjoiSdcV5wkhqsAUJmqneKF4aEh5AbLZeq/Y4QFbAXQaMLBDy8NI
	aJst7RPO1caHEkCTh/wYvzmK5oTrMiPfpB6Gdli2vNah48vRDX8K/5GoTxWviFXrgxwK3ojvPrf/C
	+jh2GC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1LG-00000005PoU-1BuO;
	Tue, 25 Mar 2025 10:17:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1JX-00000005PZs-1XRQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:15:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so33818555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742897718; x=1743502518; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HIiymNtPWSmafw/vlEzUs3yK38VavdvhdwhqdM6/8zU=;
        b=ekFJBYoMzfSg9Aemziexzz9vcPU5giJPo5XRPpG4HfNIosKTV+BH6Miy4pLMfV/KIo
         JJZ0BC2dULLqWvlfL7lfsCTWkqxK6pdP4LxF8jVo1ZwkZv6oRbPvi8DrBNy7+hEuDkUQ
         ZtUUTmR+Iv77AeYPC39yATl1idJxUsPz/AlTJ69krKVRjCKcg4ECn8B/5Hg2XeHbeKTq
         c6EARZey5r9wAox3w78wqo9cIg3J2ATjzfUoqY0YtRkiknFzlR4y7UZGdFMlhwvgjbz+
         aioHdbGPsBMKJ+MSXhAzVhVX/tdQMNJMO9JW0GgyAlnu4Ca91U68ucSrPpvwOwIqOsY5
         7uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897718; x=1743502518;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIiymNtPWSmafw/vlEzUs3yK38VavdvhdwhqdM6/8zU=;
        b=fsE4jMXUA+leqk84qV/DUt1WV4plZgo7NlvImrp4m2HtC6nCV+2mIWd3c2yxP9xgwO
         CmCLLZpiX0DNU4XP7xgLPgWE8XkyKflSfhWx9LPNzWjYN/HZAcFvEuSdUMSIKhmDft1F
         IOFNvw3SK+fIojr7sAIsP9ErPv3xX88PaJpGZCMx9fScUBCgl1VZGOw/o6vYKTc2yGKi
         VlupxrpDssMLqIzcaWMYKP8t7gpet+XVx5be5bkGxc68ESrKGrrFKYKM6DLlG4o4PH7V
         9FgPz8mIEWw1myXrncuNOmgKTm3qRahgJv00L708oU1+PkjNf4/b2UK8PS+kSaZqVjSj
         B8dA==
X-Forwarded-Encrypted: i=1; AJvYcCXDz4GPI7ZXjNWG2pk0FF2CardlQ5n5utWxJ/MXCw/YzYWVsIPgJBedM/kC+uQ/Dps446wLBweWHVQ41ItYCIXx@lists.infradead.org
X-Gm-Message-State: AOJu0YyEco47wFtVEI9K0cpq8q3Cekbj8tn8iLjV3fQ244WB57UehWIO
	COFynnkYRZdupzLGoXGRfIcwRlrh/W6STtYwM8b462FXcRyGozZDwXecUgPbkio=
X-Gm-Gg: ASbGncvmjBnGt0s72g9ttBpHPZApb4Ar2mwkRy6aKTxazyAIg3t9g0Nb84qzivY+FTT
	HcwaEBRvVQUPWkv/ga5KeLgtTtaE9EYUkmtWyfDguhbqyDvil1qq1Jut4c88uFgcmEvTJ9GpN4a
	sAVKgFtbPvAkun40ZGo2Nuq01IZuUlguKguPgKbdyeFE4llFhzUoq81OhlhFPKW8r3w+g2w+Wg4
	U3PXhWnPu5/5tRoyKTGK/0eCyeum1ny0J1+uuEC4fzleS3BEti8NonHM76j0poPt2FnvZNQy1Nj
	IbQsjeBgfyft3nJVxe5fI3GgXLVtah1Z1sMEuAiycHTk0iLeCw==
X-Google-Smtp-Source: AGHT+IFw2/pNQ5VlOB5j+GWsibTCWxrlkUBFFVpMfhBQZ4qA20RXRLBX1Zd3wl5pSv2Zad5KMtYTBw==
X-Received: by 2002:a05:600c:1f10:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-43d5a32ce3amr105676265e9.22.1742897717551;
        Tue, 25 Mar 2025 03:15:17 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9ec84sm144043865e9.26.2025.03.25.03.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 03:15:17 -0700 (PDT)
Message-ID: <48c082ffbb6eaa75eacbf3c7cbf0e4caec441bfc.camel@linaro.org>
Subject: Re: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 25 Mar 2025 10:15:16 +0000
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_031519_416736_CA4AC099 
X-CRM114-Status: GOOD (  17.87  )
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

On Tue, 2025-03-25 at 09:46 +0000, Andr=C3=A9 Draszik wrote:
> One user of this ACPM driver is a PMIC driver that needs to communicate
> with the PMIC during late system shutdown [1] and at that time we are
> not allowed to sleep anymore.
>=20
> This series address this by switching the code to using udelay() in the
> specific case of system shutdown. This approach was inspired by I2C's
> i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
> case.

Looks like I forgot to update the paragraph here. As of v3, we
now use udelay() unconditionally, instead of the fragile approach
inspired by I2C, as suggested by Krzysztof.

A.

>=20
> Link: https://lore.kernel.org/all/20250323-s2mpg10-v1-29-d08943702707@lin=
aro.org/=C2=A0[1]
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v3:
> - switch to unconditional udelay() (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20250324-acpm-atomic-v2-0-7d87746=
e1765@linaro.org
>=20
> Changes in v2:
> - add missing ktime.h include
> - switch to ktime_before() instead of !ktime_after()
> - add link to user requiring this change to cover letter
> - collect Tudor's Rb
> - Link to v1: https://lore.kernel.org/r/20250321-acpm-atomic-v1-0-fb887bd=
e7e61@linaro.org
>=20
> ---
> Andr=C3=A9 Draszik (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmware: exynos-acpm: use ktime APIs for =
timeout detection
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmware: exynos-acpm: allow use during sy=
stem shutdown
>=20
> =C2=A0drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
> =C2=A01 file changed, 8 insertions(+), 8 deletions(-)
> ---
> base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
> change-id: 20250321-acpm-atomic-033775b051ef
>=20
> Best regards,


