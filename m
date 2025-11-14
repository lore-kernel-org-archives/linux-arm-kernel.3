Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B5CE8D5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KwM59tVfyflKAhPmZndrw1u8i2PaDEpbrdk1YPSFhU=; b=zjduRVMgLNYr/X2I3rd7TvxkGt
	1epAe03iPmJpvIwqpOvh25soowC0g4bV/uH+TcpOczLfSMoRYKfy036Z2PBjoIpCP34ChhLbMy7ch
	KyLRiRYC9v6eWo5tLIdNWIgCOkZujhY1ZHcllaEarKPbicZNWpr6/iEw1eQtpLw9h2892DacbHirc
	4nyV7n+bGmO2UkEJ6Phq7YlMJCSFugZjBm+3cf3EzA3/8PehTwbQAVvLS+ni5conzHV0FW1veC4L7
	96T7ohwyFnZyX7MOIlz9dApwIvuUBUYr8IAoncjO4M4r6VlahJ0TbAoZvPB4aPMWSsnA4C8OztBIG
	ex9o1ZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxF7-0000000CoGf-32Sk;
	Fri, 14 Nov 2025 17:05:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxF5-0000000CoFk-0DuJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:05:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4775ae77516so24708015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763139945; x=1763744745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KwM59tVfyflKAhPmZndrw1u8i2PaDEpbrdk1YPSFhU=;
        b=m4O+13f0TH/2WfW/C/Ar6ml5vcpTRwawXC7iBcm4h3rVSZZBL0Zw2gjqBHpWsqAv8k
         t/CDGtXBxz4DSFSb16soMz6U2MxVGBJRPkVSPCWrw34Apx0CMQmnDnkMR/g7Nm6zv0SH
         w3BWnXrRsLSOYF75Bh8XAbMJ+zcTgwFzfbY49sTxqVKOzGXmD57ryU9FSuMBPu2c7OMi
         3CCymrlmpskgcpfVeoNIG2owOtBg/Hv60uSYpzSkPH1WRTwj6jmg4CaTNulzBc9fjKkq
         uiGOPUI6cnHLwKZWeaw+xnLKFOw5qsYYRJVOBl9RgCNKf5r3r/sG5BFWkIRC9pSiKisn
         3W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763139945; x=1763744745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KwM59tVfyflKAhPmZndrw1u8i2PaDEpbrdk1YPSFhU=;
        b=GM34Deih/CQM6/xkYClWDb7R9XBDbRn9D4JKkJ/JOZTcJC9aKcYiLwkK9M3xF+AHhl
         ERlSv6bSNwDzscuS0DXH/cxlkEUcbJEWgFDjTgVegbVCDEg5KNfo3kzwu7pvADSwczwq
         oYv8R3SvJ/G7ikHY9K1SBBVhz6NN+eq5/PrlMaGdApDwxr4EAD7+MHnFxM+axQsQQiHV
         5NrZ5hLxwcSjb+TWwmgxvCNhfTpuDS0Z58CQQyrv1c3lyLSY7a7zKmlpsUx+Tehywio9
         cZtlkdIk2m40wCa1jAsnuxlVq1X585x3wsoVKbYRJ76meoELb6gly7ivvjoArDX3e8x0
         JONw==
X-Forwarded-Encrypted: i=1; AJvYcCUghmfrB0E3LteG/u1V9GdqZRbZcauSB39H+eOP2nikPn2V6Lg7vYfuxJwJ8F8dQcw8+7WnbzFOz8RcmB1oB8K2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94BQ6aI2TVYrJESF+9qPVUOUo1BDKEsC0nJzlar7gSDFp9whR
	fbv6NuMz50Rn16jH39ZAIb9vY/OFPWppU4Y4YKqsm+gAiQq8NHirvaFf
X-Gm-Gg: ASbGnctUljQmNgiSmAl/UUFMht0xrPKWiCCEnD3q5BwV++iWxPMxFO62RxiGbTd1o3Q
	j+i7kx7bB/wKqBjtM5jodduTRwGppyst7e64SSfZRa8mH/ncHGNx6KpKyw9M/WHNr8rOESJ80vQ
	M2C1chxCMcM8Lz1vbxBMgxsWh01JBheCi3np0Z81+YuQqqm2gDe6XXCkE6xORlMErzlImDi/6Mk
	HiN3MzCUsrn6PvzuURCpYLBc+p0As+o+gBsJF+TDVkOdnc1Jnln5fI5iht/++ImoFonUyBpuNS8
	xK3RGZCF36Un1foWTqNREaG3rBMt1IBe3XKlDf+pyp3Aq3abwZIqc3cEXYXkYts1LHISzhWdJ7L
	mA+E3EvgagsAojTfBaFjjhwZH7DKAhk0qydw3YahBXCgyAgZ27uycuOY5fYhxeuW3WTxp/fVjOM
	jye1yETUmp6lGNxYIkzK/i7C1QyJGSmvVeNQbeAJzWlAmmkSGRAw/FB69pA1OxiEY=
X-Google-Smtp-Source: AGHT+IGSrEjb8JIidJB59pBg9e6FGeWjjYrJDuFzsyaK55oGlWsIWqJPZRjSrpRNuZji3S2HxrhhYA==
X-Received: by 2002:a05:600c:3586:b0:477:7b16:5f87 with SMTP id 5b1f17b1804b1-4778fe121famr39351005e9.0.1763139944999;
        Fri, 14 Nov 2025 09:05:44 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779524d2ffsm20720795e9.3.2025.11.14.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 09:05:43 -0800 (PST)
Date: Fri, 14 Nov 2025 18:05:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] ARM: config: Enable EXT4 for Tegra
Message-ID: <nsrxdywn7xlcd3j6ztsrcraxqwfgenqdwwjtezzzmjyscnuoz7@uku62g4lk27s>
References: <20251010103613.236283-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wedxe3auyivqakp3"
Content-Disposition: inline
In-Reply-To: <20251010103613.236283-1-jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_090547_110637_A9EE097F 
X-CRM114-Status: GOOD (  15.44  )
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


--wedxe3auyivqakp3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: config: Enable EXT4 for Tegra
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 11:36:12AM +0100, Jon Hunter wrote:
> After commit d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> was added, when using the 'tegra_defconfig' kernel configuration,
> mounting an MMC device on Tegra20, Tegra30 and Tegra124 boards is
> failing with "unknown filesystem type 'ext4'". Fix this by updating the
> 'tegra_defconfig' to use the EXT4 config options and remove the
> obselete EXT2/3 options.
>=20
> Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/configs/tegra_defconfig | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--wedxe3auyivqakp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXYWIACgkQ3SOs138+
s6EAGQ//WwdO/p02HDYI2AI7kanr+7xqXQuVLjXVjZcwUvDE4vIY7OKhLpsVruvs
QqHBAdvUleObU4OTlDiT+xi2U2tOljSpfjE7at69uErc0hGzQIXCSTYBBi7KhbtS
Mk4ff3RUwr31zsCKQ4FlPYeYmikQgA5EhO0At+Z9axf+HSth72RyjqSH7mdgDyQj
TFHucPa4IM6cK0qaKlXDNVn5lRvIm6dkDCa0sgGiY4XkivzXQbucStabb1Kq0euw
wOSpm76OzTU3AJuG7GfqT9MmozKuathnZ3QE42l0Wc/dE5yzPR9aT3tVInMWUr8z
KvkcQqn6nzGOVn3tQqOKZA2b97HZc/ItHokQ/E3+jmaRD7YOOiXH+Nju3yFUbPXt
x+7iv//eZT3ioMF1oRwHkQL5GGhwxmcsP1UbrMcpkNWBePRywinAz3f+Rq8XO+Mf
SW1pnjzwQOLmFs3IyNkhjf1rR/C63YNdj1ORJhR6m4A0qs3r+QQiK+ve3KYIvLJZ
xtuSgyleYLY7Yq6kXdsvaglNZWYO5quyRAS0U/L41ofr/NaHPZgu5pwS9Z8c1T1N
Y/hGNXyDeO/QI0ZXn1HKeY1vcTUISb6nZAM9PQvNCy9hUrJHnIdaWAP/erYwL0Yb
F4q7t2cl5z6hejctzIeVG1lKtFZPjQ3uOg4pe036EHPZAw5QyRQ=
=vZ5G
-----END PGP SIGNATURE-----

--wedxe3auyivqakp3--

