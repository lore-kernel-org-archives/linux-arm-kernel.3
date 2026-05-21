Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66431CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMUrl25nDEi3Kq1mfkKWfvdC3P4YU+O18Vu1NBWrWVU=; b=W7bR98RYJzonEXMG2QCv9DcxYO
	W5nIuYutKKyzGar+/4GnyWBV3ZzF4vSka+2DJp9GvVQjM68jIIURNfhdIDxsoYBqhIDW+JzF1blJu
	iXTH5fsNZ8hM9hPCpWQ1ww+gM8aR4U8CGa2gvs7B4qKdWpkQcz8g4/e6V+E2bttTgrMhQpnXSC7Ux
	u8l2BGQCTT0ZkK0sjN49sEiHcDRfGJfNAf9ZmxHunSZ1Li1xEzNCJIQlsJzZyXEYORCnv1JOtSJ0I
	r1tbgeZTcll47v5x33/nLaQFUooGTXrmICost8C6fjnlG7Un6VfycIxvKRVuHFIuK45STRj3HY7Q0
	8vOxHGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyCT-000000070u4-0N82;
	Thu, 21 May 2026 07:52:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyCR-000000070tf-1ov7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:52:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso50924695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779349929; x=1779954729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMUrl25nDEi3Kq1mfkKWfvdC3P4YU+O18Vu1NBWrWVU=;
        b=XcGQfY9UHJ2x0pwiQBkXvshwwbxpyi4DfBg2hHoPgxP0xCk1Gw0jI5lfY/74vk4e9H
         50+nSp2kcBgT+4xpKptgoxpX7n2sYVg3K5SLyPjnsyZ1TYuQqWZXLzlSYtULKLYjyKEC
         o+BnsSpQYqYBJB/G4UWVYInSMw84V1nrw/RUCnQBVse/gDDbnI+2BFW29ei//tFdsDtP
         S9vY/7KWVMJdYUiBqowhfEW1SXbLFVSoRyrPfQPOiGO20/HpEgcCXILZnmtckGVR+crM
         kl0XKnglTv5wQBVMtd+okUv7VaMiaQ0m9a1oByifbcAJdkw8VpmMOd/lYS00RkHAfJpx
         Rm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349929; x=1779954729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMUrl25nDEi3Kq1mfkKWfvdC3P4YU+O18Vu1NBWrWVU=;
        b=janWmgH7I/ZxKqd3NL/QlmRKngroZQq0LN726N2nwJ8a04EMvdZYZVCGXxRTzwC5/E
         8GUT1eVF8lzkX0aBYqS9SFTXVhkdePLa+1CR4h9aF+/zONVr9ejdA5SJX3Mjrg6qAlFo
         N5FnPTAG+5M005Ho/6+4G6hUakykA9idndk4afRpGNdX1lMqcWWjp2KTTuxcJs4DIc0i
         02ubbQuhktxBC1NCm/UvCJlpyh9uOIiNl/fW5PdZVcW5HyvO0e/4S36IssPHE0mVl+hr
         oUrQb/IoYkSp7/Bzt9GGk5JBCyyTO7fHI5KWWg4baq7jRmwGjEVK/vBB7tlirP6npX1z
         qT9A==
X-Forwarded-Encrypted: i=1; AFNElJ/XszGYQLJQ0n7fVkqvrLgig0esyCrv1iHHoypo4yRxGFxKuYP1MFdqEECQK0OD2DlLReS7RW+mcYdY4yhyV0dZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcmq9zpXZVhpkVNQiBTsGVVoBs1HNTYb48a89bWPAznuR7A8UM
	Uha52F1Eas+uLpumdmb4UnLEdpxABBc7iMYQquUpCfyntmJAoVf+Uzc4
X-Gm-Gg: Acq92OFb1ZL205UDoPqXcJ1b8IcSwp8xWC9RiuDRgGbt4eXmy3nd4IGqDM4kydONiiB
	wHDjaghkUZ/9YfNR4GkCz8DLtg4gDZImoDDU1ScIIaEdHLFTfKfZMwOQBBkIBKWPu2NeunAFbjD
	ZBg84B9+RHYuKaOaEXiRcF8K6TArtTFH06K4MQAkKb9suetyQSIWMeEUFMR8FDqtDZbQK10uRLY
	Gw6y19DES/w4nvzE4/qw0sj2Dov+e7ndyki3fjeW21w74IAx7XXA+yb2u7zxTflp6sZRln4IaEx
	JRnEv/Mf9WtRBQw71mMD7KDarpjPwbmu6NUDzDKN+7pW2CObaY6uATXCZpzo/5O4XE5yLXohlwD
	8kOv1PjFNBo4B5aIuzhheFpY7/BaJQWZCm5g8m2nPG9C9Soaauov2+g/5hX0eWoeBJXKmwC3E5n
	j99sgRUjnhuID4obXgFct8s1FZ+LRojmaBI6qtCP/PFGgvLkp4bCVzwVHNlFKQWD7DfOx+KQ4lE
	bYbNicCZ3nmCg==
X-Received: by 2002:a05:600c:8b45:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-490360341c0mr24368705e9.2.1779349929073;
        Thu, 21 May 2026 00:52:09 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cf23bsm715799f8f.5.2026.05.21.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:52:05 -0700 (PDT)
Date: Thu, 21 May 2026 09:52:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
Message-ID: <ag65LXrLLbbeTbTb@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krmmkipqxg3oqi3l"
Content-Disposition: inline
In-Reply-To: <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_005211_488049_EC70A101 
X-CRM114-Status: GOOD (  12.93  )
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


--krmmkipqxg3oqi3l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
MIME-Version: 1.0

On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
> On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
> than the PSCI SYSTEM_OFF call, whose firmware implementation is:
>=20
> __dead2 void tegra_system_off(void)
> {
>         ERROR("Tegra System Off: operation not handled.\n");
>         panic();
> }

Ugh... sounds very familiar. We have similar stub implementations on
Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
seem to have proper implementations for these.

Thanks for doing this. I might want to take inspiration from this for
these older Jetson platforms.

Thierry

--krmmkipqxg3oqi3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuaMACgkQ3SOs138+
s6FV9w/8DRCSz66gVJF4N5xzCi2lxEIEK+/vKp04alHhNYSDgZWEhz711gr77nPk
23QWW7KrWzLpZOXMosGXjLpueVHFKG33h2Y2DFU1R9F/OBmo+dKXrUa1IYL8ZSfN
XWrIj73/Tz69oz0IolCgu+d3KABjueFYtVaKLK/wowfKA20rqRtU738i31R3paGS
OVc8DJdjr/KoEjbD9uWVji+nBJ589U9LE0KXFecU5O78CmQcIdcLlwoxNO770/Qz
nasdyLEs04OK/26z0tKVDTZayLjtHVOq0/pYQboaLhnNDuwL01TeOKc+//PytEO2
upOwtaigm7v0UZQTRko6b/4y7s5jC5UgY6Ww7P1nRKSLz6C80ZoyOaC4YSCVgrJo
vyQR+L1l6mfR3cePUbEx9/EV70A84T3je9CIZfZK/n+OP91wTKbf6giSzE+dEt32
zavGXDz2/4dGo/WymGxeP5iVGdeRoMCqdbEwgI2ie0CXEHm/jSY0OtNpy7iVlhEC
qETtwmlg20xgSMQ4eYw4NEJhV/6Fzi56rs3v7arDC5tRB6gtj13Ykmfjh9f3aMXe
Zpzpx46jqSsf3A2mtT7dX3KIdL9EcKrj0HFtIbXPIdJkwiJ3UK/WPfSrMCLmJaAk
m14wdYqrwoLn/hBcFDmpr5jZmalP268Mz/pBGQm+w4Vr/F8NQyY=
=1p0U
-----END PGP SIGNATURE-----

--krmmkipqxg3oqi3l--

