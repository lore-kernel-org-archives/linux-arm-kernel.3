Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F321BE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKVZ6gnaghV+4OuvPE0MfgGwA+znTse9G/0vYKIzuzc=; b=LPTZur5MDInTwQtGf62rg2/jXp
	I/LbI9nHd60VjtBpLaku6hDxAXg9svk6jSwj5IjHZHmupz4H0Ci7qRxUm6hmbC2t6Uq33Q8nZs6Dg
	UlgJH/bElctuxunlWtu3GbQrzNvB97qqL5RLILWlhFsKuDQBpcij0m0WLnGPCytUGjPosyYoaTocq
	yNLDKtjs2XJbLRaOhhacMMl96pDsO20IuhWbEQ0tkH0EftLfMzURXa/xD3iIT5ZdDDFPKt9F0RU/H
	GZLgAPLu+NwjItyi0SMCstZN4xbzySAp9Bi2BUNKkxDfHVQrcs2DHUBdQKjecGFd4cskweHrAzP2J
	qiqSjqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY80X-0000000Fyvb-1Z8N;
	Tue, 23 Dec 2025 19:25:21 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY80V-0000000Fyuf-0htH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 19:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MKVZ6gnaghV+4OuvPE0MfgGwA+znTse9G/0vYKIzuzc=; b=cK5j6/WJxuN6PUjAGb5ilVl03d
	yAfLxWN6svhzkrUr9lZKZJLo2EfAKVNMdTrpd8umBGeroEYFOEH9bU8tsIvhhy+rEKQqtYJW9j668
	OjXdinWl0UXznZcP0+b1HO1/TAIH9+O37NaoAdhvUWeNiF+XXzbXZhZUiOX0IYkCMooyzh/bAqyZn
	HQQ3a1JzDng4lcTG4H9+yZk6TYqHuQQeihYnubj8eClYvPM0iiGrzRZ4ckg8yQ0QFbcP5nsatLdSY
	E+jrPYAI0agE6GKt50OuVMTbkPbM+PoerV7ua/tAHe/N5HZ7WowbGLxKIybesFvqLIntJFQjd04Ih
	6Ysq7I1Q==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1vY7zk-000000005Kw-26qy;
	Tue, 23 Dec 2025 14:24:33 -0500
Message-ID: <a060d8ec023cb7b8dbec0cb4105d03fb24c57a3d.camel@surriel.com>
Subject: Re: [PATCH 1/2] arm64: efi: Fix NULL pointer dereference by
 initializing user_ns
From: Rik van Riel <riel@surriel.com>
To: Breno Leitao <leitao@debian.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, puranjay@kernel.org, 
	usamaarif642@gmail.com, kernel-team@meta.com
Date: Tue, 23 Dec 2025 14:24:33 -0500
In-Reply-To: <20251223-efi_fix_619-v1-1-e0146b8b9d73@debian.org>
References: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
	 <20251223-efi_fix_619-v1-1-e0146b8b9d73@debian.org>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_112519_216640_5556F5A6 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2025-12-23 at 02:55 -0800, Breno Leitao wrote:
>=20
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index a9070d00b833..55452e61af31 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -73,6 +73,7 @@ struct mm_struct efi_mm =3D {
> =C2=A0	MMAP_LOCK_INITIALIZER(efi_mm)
> =C2=A0	.page_table_lock	=3D
> __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
> =C2=A0	.mmlist			=3D
> LIST_HEAD_INIT(efi_mm.mmlist),
> +	.user_ns		=3D &init_user_ns,
> =C2=A0	.cpu_bitmap		=3D { [BITS_TO_LONGS(NR_CPUS)] =3D 0},
> =C2=A0#ifdef CONFIG_SCHED_MM_CID
> =C2=A0	.mm_cid.lock		=3D
> __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),

Seems legit?

Acked-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.

