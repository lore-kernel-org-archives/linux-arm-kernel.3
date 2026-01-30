Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEC9E6BF2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjyJlTp7j4YH4/LWsfYYLt/Sw6nbmBbVnvtCwZ8aFYI=; b=3h4+FUCOLJ2ZLWCOW4jtkgz5Xm
	KwaiFe+q2EbSQHrLwQdTMqoV5E0Ap5hPwmhZrHt+PU3YHnFEo7G7iea5OGNHfTZUkpJg2CZtuhXiY
	nSv1IMzueogSmyxHcq8Vxt3O0Ushf8eXHdc9HljUtmY53ou2JcQ9DYdUqPU9bRTL5dA3xzlqLg0Yn
	OEIlbXPTwm6qLT/3JaKGtrG+6eo4XiKIpZ8eq0zUNXi/Yd+OxQbztWM3H5I3i5CRJYqF5k6EnuEoC
	gC8ND8MfUtG8buEiD6IcR73aAM83t/cww2AUVbspX3BNIKLaNWWSfx+eA+4YsOazemOht1QUmXEIM
	PygcAPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrVY-00000001iyM-2Wu4;
	Fri, 30 Jan 2026 16:38:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrVV-00000001ixz-3RQy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 16:38:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4805ef35864so20002645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 08:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769791084; x=1770395884; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjyJlTp7j4YH4/LWsfYYLt/Sw6nbmBbVnvtCwZ8aFYI=;
        b=SjPRg6xIRx1DRfUM56d7uuYDAjCY52OIVmuqsOZykStaCKL1sn0frWoTFyAgZ1L3rv
         qC1wFNyKvAw8/3bmn7SxeyfgJWUagODc9aRmznzVRtRl2fnIgGMIrvpWAS5m1VJ1QtFR
         VJi8Xaudij/GCTYvS8KMiYwr0Rordy/tK7uBL21smaENMjTdw8Xj6kbXFrRoC54P1BOk
         yGvUqkO3tiMOAXQgtltNJeZNKr0AC+HEkFelvxbwjWy/yNaMDmZz/rn+MjzHFSuNCTxl
         5fafFH7cf/GImisV20b0NFmGSqH9HlAi2GIniWqCgYn7f2MRwFNugLv2Kqd2MxzrUc16
         GXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791084; x=1770395884;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjyJlTp7j4YH4/LWsfYYLt/Sw6nbmBbVnvtCwZ8aFYI=;
        b=K89O1XG3ZFVoOk7BR4YGUi5YKNEQFU6j3R2lM0iNrACMGeA9AbwGN4bUW7L4KX9XS4
         4FUb29Xrrgs3CaUF27enr7FC3IjWgfjBk/fz7Z6sZcQvyLhoCrnjMtOmktKhAKkBNB6x
         yROSt+Sreh+a4vt3QUxbhU/aY5C2bbMqiAtFqimlmFgxNFA95sKf7SSF+p01ncobj3R/
         +dxqo6FWVbyToH0oELDrN9sNC20Yb9CcX3jZzbajUhNwsdRhVLwYNVwHU3FkIuDS3YJ7
         3sXakhegKtbo/FqBsXrfvWkwrfhdTgk/T1pJn+hcbXTA4CDvLtL0fkYhhns/bWmRu2MI
         nkxQ==
X-Gm-Message-State: AOJu0Yw0Bz5fGWbay/uNoF2zrt0kfyAv2HzyEcOpSJPQE1WEhSTu23gO
	zO3k7ss0S3A4Z2rWqxg/SJHcW0sBuCAlJWjA0PdP8j7LG4Imn5rfiPgk
X-Gm-Gg: AZuq6aIRk9OeswUVubC8OHBhZCn3FeF4CmQTJNNBPx8tu+Zf3gcV3CMt3Wu395CIHX6
	5d4nO1kgLPX0xIBEnJ3dTizxO+vYZ/nGLTbe/WQmSsWOIIOefvQVsxxm/NFFL3z2KLYMef6W88S
	mkbz2/bqoFCSFf3674VG44e1ccCz66OGTK8zgvU9u08GP+9OWJqzZ5xFDXIgCYm/oW3IRArBrFF
	2xEHjkcW39ToT2UOB7PKxRWM2zItjC0qbNUsXRy1VrSuofMziEQMZgjQ9F/tjhw9hwo3ZjRXusu
	ppeLu6g4l6x/y6PMKODDczxQ2HU+spzEBrxF1nimnDM7oOanvm21G5GkMkUpn5be5RefSRtB2++
	PiF4uzoUIaJngJtxJIOQVYI7trlZ+UU3kNMClBKVyehBxTLvJU4xG2a2hN/t22iF4yaM9B90zS8
	FaOEhkMJTqwyUDUsZwM9YZYxYl
X-Received: by 2002:a05:6000:4308:b0:435:a370:2d71 with SMTP id ffacd0b85a97d-435f3aaa9b8mr5238517f8f.33.1769791083315;
        Fri, 30 Jan 2026 08:38:03 -0800 (PST)
Received: from strix.localnet ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm23794050f8f.10.2026.01.30.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:38:02 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
Date: Fri, 30 Jan 2026 19:37:53 +0300
Message-ID: <1848649.VLH7GnMWUR@strix>
In-Reply-To: <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <20260128203455.38569-2-stefandoesinger@gmail.com>
 <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8678641.NyiUUSuA9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_083805_880829_BAEDCAAC 
X-CRM114-Status: GOOD (  24.48  )
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

--nextPart8678641.NyiUUSuA9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Jun Nie <jun.nie@linaro.org>
Date: Fri, 30 Jan 2026 19:37:53 +0300
Message-ID: <1848649.VLH7GnMWUR@strix>
MIME-Version: 1.0

Hi Linus,

Thanks for the replies!

Am Freitag, 30. Januar 2026, 12:07:41 Ostafrikanische Zeit schrieb Linus 
Walleij:

> The practice to run 32bit kernels on 64bit capable hardware has been
> pushed back in the past. When you say "they run aarch32 mode only" this
> sounds like a choice, not a mandatory demand from the hardware, i.e.
> it *could* run in 64bit mode.

I think ZTE could certainly have built this board + software in a way that 
runs in 64 bit mode yes. I am pessimistic that we can do this ourselves with 
purely software means.

> We can see why the vendor does this because the board has only 64MB
> of memory, and 64bit code is known to take up more memory.
> 
> What we recommend is usually to run a 64bit kernel with a 32bit userspace,
> so the userspace still isn't too demanding in memory.
> 
> Have you been able to try this?
> 
> If it seems hard we might need to bring people in who can help with
> enabling 64bit mode for the kernel.

Andre Przywara suggested switching to 64 bit via the Reset Management 
Register. The RMR seems to do nothing on this hardware (https://
lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099787.html is my 
reply in the archives).

We don't have board schematics or datasheets, but I guess AA64nAA32 is 
hardwired to 32 bit. Maybe a GPIO pin can control it, but it doesn't look like 
it. We also know of no way to reset the CPU without resetting the rest of the 
board. (since RMR doesn't seem to work)

In my previous research I came across the suggestion to do an eret from EL3 to 
EL3 and set SCR_EL3.RW to 1. We'd obviously need to set ELR_EL3 to point to 64 
bit code. However, I haven't actually seen a working example of that and my 
own attempts just ended up locking up the CPU. I don't know where I came 
across the suggestion the first time. All I can find right now is this 
article, which is clearly AI slop: https://www.systemonchips.com/switching-from-aarch32-to-aarch64-on-cortex-a55-challenges-and-solutions/ .

Do you have any other ideas we could try?
--nextPart8678641.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAml83mEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoiQBgP/inD0NVE8ZPvrLCZZNaC
9eG1g7nkKI+qoYBWw1PN+34G1G32LTc33gaw17rYkTEnqQUNuQRs3JInJFY4eQez
cCl9WsTEJDVarV/7bIzE+38yHlkTBqSIJLawQeK2JiME1hqL4gIZga0iZtsmBzqJ
Jv4RKpJGkyrKQLEb+CtauiGR1OVw08QzvhkgA8KbiRMSCjE+EXHZU7mCPnfi1sdT
cPvOxeqp+OKE5M6JRrP5pXOebaukeuqgv0TJn7gwWQdKNgdhfsqLzuESfjfETp2/
XbGAk9qEV9e4Y20TiljThnOmRqdgMjzqQ1QzmAbifKSJ0fXg31MeSONe2gaHMG0Q
CsCbLDqP/1yKSUc1adPzkGSdyT/NVwoKNvJoSyyQU2KNJE+o/S23ahc1qsiLqZIz
Vpo3K4OfJaF8fvb4bDze8k2UapgbDbOUgPk+rcB3ywEqWl9rsB83Wu0JnhbQOjxA
vxQqdgZ5UrpdLEhxupakM6n/JzOXU7Yt9sOadkq42bqCjjMXKduofPlD/+/yfxGU
aDg1L6kZzybebN4dz66sAncH66RdKlxaI3v8KyutypvHLEW7vnDDLU3gA6gGCloM
ws1EvO91MrJ//JCJMjyWIZ/cXnWd7029fNdMMdP0s3cm9NxyS2qHF9ADvOLooDXy
js4qcdOpszjzpzQ8kMApBrSU
=2FI0
-----END PGP SIGNATURE-----

--nextPart8678641.NyiUUSuA9g--




