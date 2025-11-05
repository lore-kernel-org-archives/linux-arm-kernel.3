Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E4BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=; b=AgmACVAQryOYgGAl9vUNQk57b/
	tk6/8VCd1N304yZZ2V/SasLugFmeEBCD1JXn7oERzU44/VxNo+W/56+AcY7jgIz3t8G+SbiMtFiiv
	igO3c9m9xM8wngoDvn814USnBaKJdBoNWxS3vfDszxA0FV+sAP9TKgwbYzIhNImR1dAr9+efolHf7
	3xTMMxtXbYaL/FCS2ySlXEw2Dg0VfBMHtXy0uMgnXBcWaK1aoqbXR/MqXyo+aljhhm2Bvw+qk8H4+
	oLnzySc5gONBQKouOhVgOSooSA3rZaZGVmWSQKdS18kamHHCszro0jlH4WQoiKcM32ZUdJDSGPi8w
	4wPamBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgjw-0000000E6Ua-3NFp;
	Wed, 05 Nov 2025 16:52:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgju-0000000E6Te-1Pwf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:52:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso1675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361524; x=1762966324; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=GieOOprjK5I6Sta4p8T2L45iyTVa25DWchJGuXKNJwMq1riXK3doOn/nO3el70HJ3J
         Kn5MnT5joFFfvyxiQ2abFvlK1nXJoseLjOnKVYs1ojyidRKVp4/CIYK/X8Ha+k7/DNfH
         eyf3IPTxCjoaeOw5NHPHmoTlWRj/JfaSyLhHyXMnUJaKBAdfefNx/zRqBLDjjKjJEz5t
         qgFJ4KgG1NZ0XjzOhVQRnjoAZQgsEa2XBpU48oqzth2jU7mp2tDXbtvrUR7kIf6WwpJV
         6tWnzRuEGQMz7agF4yWxE+I1+qHbrUVHQ1VTO1eSZ6rQf+21R3MoD59x/B7fnniUAFc/
         vhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361524; x=1762966324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=DHb8RlteLv1KN6K+18XcDUswHG4GcVVM8uD+BAADl0GkXhEF99Jt+4lp2oIG4Cb7Nk
         cHH+BnOwOd1DImEk+HUD87meazq3+LZoOvzdHGipBMP5iHIjezYtB/E4hrMjsduj5hvI
         AOQTWisNvp6bnh47iamUtoyM/wAW9Ds5KjAcYIZftq7ODIeMF9TdHPKulhGumopor/ED
         L8iA1nfJ68yulcdyGE06dF3zl3k6/aLapE4pMb9A1H++y6xpUnaJ0uQEmEJ4TOxBbNPY
         S+EuWXpC0LM5HxhvZjbhouMY+p6N2VeHC6dGYN/ATMCwvv7L+Oq+FdCYM5QR7o5WBjTA
         mmbA==
X-Forwarded-Encrypted: i=1; AJvYcCUz+VmamNJ7347VIEtN4FidL52EjpdyExlAFj5VWdfrt78Q+RVUqPEy/ZcyswueqwgXDlyMQfNkwkOAtggdyoHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8eZvdp44kOe1RYRIOjWYcL7WaFmfX5SnBhaGlqKIR3Ko5cftS
	ZBo6K2GP61ZQWSWDGuAGr2oJTo3+6Ak7b7n52s5rw9j67m+8wWHjJRoR
X-Gm-Gg: ASbGnct/a5n7ri9J1vNI1hjTlsLKnnrSV3bdIfcIHJzQYoZcgy5+hoQ8Tn90p7ZZcwU
	OZjH2HPf0Zvi/MSrDY2Qn8SDqxy+4JcvKxCz0qPotJLltjhkcSL6VGNKVDzWRY30AFgGd81Lmbv
	ACiXuWNhqbd0IsGe8CPqEfL3cvEI1ZlDfBrqeqOAXDf+a4zfYo5iSocOg0AQXAtDgr84qZGsV3+
	egGVMIJWuk18M4a3DykzQl8f7z3SAgb2jk2CY+DkDQ+SHgPB8MD8AXldTTvGVtukyVKfohLS+hu
	rMx7edL+vO0Y8Z/nuawuPjaodwdzGnbwvY3DDArzgeTwGxU4/9xgwZevJrv9xjpfi4bOlwtlGN3
	3XuC0Q1gi9U+YOKoc0u75gwsZfjrSUzxKWLhqYzdQy+It8Nc+2fDsNLzD/symnsibyhrUcBC/LP
	EJdFNAVWOwxI45NOMc/hdt+n/NcsoeApY/2IsqdaEpF85z+FaIayChyKNtjgSFjsI=
X-Google-Smtp-Source: AGHT+IF1eT04urNHEfsD9kdCj32CNL1YcHJ6oGuMVK3cU2BLT/aQRFRmm7ox5OYZe77ML31HK9v5ow==
X-Received: by 2002:a05:600c:1c94:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4775ce23efemr42468465e9.17.1762361524090;
        Wed, 05 Nov 2025 08:52:04 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce210a7sm59725725e9.12.2025.11.05.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:52:02 -0800 (PST)
Date: Wed, 5 Nov 2025 17:52:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykyajizgfjgayrmb"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_085206_400483_0D7CB0D5 
X-CRM114-Status: GOOD (  21.67  )
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


--ykyajizgfjgayrmb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Several drivers can benefit from registering per-instance data along
> > with the syscore operations. To achieve this, move the modifiable fields
> > out of the syscore_ops structure and into a separate struct syscore that
> > can be registered with the framework. Add a void * driver data field for
> > drivers to store contextual data that will be passed to the syscore ops.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> This change is fine with me, so I can apply it unless somebody has any
> specific heartburn related to it (Greg?), but in case you want to
> route it differently
>=20
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

I have a few follow-up patches for the Tegra PMC driver that depend on
this. 6.19 is what I was targetting, so if we could put this into a
stable branch that'd be the best solution. I can set that up via the
Tegra tree if you and Greg are okay with it.

If that's all too complicated, I can probably wait until the next cycle
to merge the PMC changes.

Thierry

--ykyajizgfjgayrmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkLgLAACgkQ3SOs138+
s6F0Lg//dTn1/PUCYHRhF8cm1xB6JKggiLC40TRct49fcf9eF5gAdCqXm44qKoaF
67aqiXAiwzovTctJIu3rz8p71/FeXp/qGWDdPm/+wI7yD+BoCcVO0nmvXuPwCzhd
ZMwqeaRVm57JX4M9S5BdkOGtDLgAjyZ/6Qq/2isiQSPiWWl/IT3YiLyzw8vq8mcY
VoepQGK5hm7CHFf8FOBs+sMt6q5JJDm0VjNi+seVcCNg9U25GaXCRc2D9ztAqRib
3768/KMhlftnoJKsizCwWq2Gyw0Se7ifz66djjf51sHd064LLDv7OZpfeGyiFK01
MvVGXoPFuIJB0yqIoMRBbeRULm4kq+dkUkt1JWwYAMw9ZJnhXPJJI8bal2IASj8/
E6NADiYd9HS8kAXWYvLkm0xHv4FN5WXWG2a+Gf6K2vpBm07zG2xnI+eVjYQSnb9W
O9TcZf3jDWvgEQ31plH5JFY32sI4vjLAdcKS2oRfkbxFDJvTS+RRjj3EPqFshNXf
B5E6pXTCltOkUepuhbGDzIifVWzYgg/GyXNfwzdnJUXcAz7QPPJySfMraf/dn+8S
hggVgAivRFDEtaNEqKU6iqoePR3HIUJe/Ebjrb199RV9t4FcnVYOpviJRf5EWpsF
2YEUJPiA7neiac9fPLwCoRh33bJTIzanmWVxmFF1nQ2vozIt68U=
=3Mmd
-----END PGP SIGNATURE-----

--ykyajizgfjgayrmb--

