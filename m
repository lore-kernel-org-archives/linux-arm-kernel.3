Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35682CEE34D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLV5ulLhdVg2ftls0Im8pJBkD7VEtlgCURwkLWF5u+k=; b=JuGHeL4jl0f8RSPnzbs+e9kYjI
	0dNVCxndU39ASevgtT7thKFBHFlvnETr5BfVULg5/vFVP/ckDghypzQhqc/rIO/+9iSdeQDWccASi
	yNIKM3hqLWUBuTICT2cD/UT/zoIyZhMnvwJOd2r8nkS2RtzqmaL3FGl9T9Ka4UeQi6mo5fZxsmC2f
	+Ks/AYtpoXjTXDkhmz1H2AnAs9VnfbVKLLZZqkGpFui5nNKDFscltlAEVdFt7Kz+JP18qb3pOWSan
	JK9Hl96cJSk7lelQlftNJwVacXEKLR4e8nZOK1z8akRywqw1c9Zn0uMA/aIFtjWyMhfavPWGihLm7
	Ehb7d4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRfJ-0000000124X-44HO;
	Tue, 18 Nov 2025 19:47:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRfG-00000001249-3gkj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 19:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 351A844412;
	Tue, 18 Nov 2025 19:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DEDC4CEFB;
	Tue, 18 Nov 2025 19:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763495218;
	bh=LLV5ulLhdVg2ftls0Im8pJBkD7VEtlgCURwkLWF5u+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN0Ch6dJWqu554qFfFd7advQobZNg1gWL0A+tf5iI8GT64lHAFsR4Rb7yZOLDwwIR
	 Wyy067ong3ccLceG42iniJiAPmdfcJOuMdLNBreRnnqs2KbM1WmrZ27N7C5Y0fPukV
	 B3RNrpTYlktLo4DEOIaEpBednhS/xZjoaArucvjlRo6clBrcah7SrvubrL+9kSmRxx
	 PsVcBRIdEXK6N8y8Q8+UOUg6OgpEU3BJ1vRzZwtNsuG1lteFrtUrfdvlABA2ay9k72
	 9WmYc+Mat9ZD/BPzjF8+6Ay2VtVA0kEtPTYyFhL4+yZy9FYspXxk01bRwDZyimM5VU
	 DO3dXFJOFOkng==
Date: Tue, 18 Nov 2025 19:46:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <d567c3fa-2e50-4ef8-944a-da4222fb96af@sirena.org.uk>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
 <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
 <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
 <CAMRc=Mcafi6+kRX+9sVOLHCegdU33+omLg+aW4RqeiokymxPNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aM9xPQKM74VxiVWS"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcafi6+kRX+9sVOLHCegdU33+omLg+aW4RqeiokymxPNQ@mail.gmail.com>
X-Cookie: Protect from light.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_114700_154227_6C3C14C4 
X-CRM114-Status: GOOD (  12.00  )
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


--aM9xPQKM74VxiVWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 06:27:23AM -0800, Bartosz Golaszewski wrote:

> Oh, of_root may be NULL...
>=20
> Could you try the following change please?

That seems to work on FVP, I've also seen the same failure on other
platforms including Orion O6 and Graviton 3 but didn't test there.

--aM9xPQKM74VxiVWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkczSYACgkQJNaLcl1U
h9BxCQf/TvcoYIbZXiH4sSxaTvyRmoYCCaWX0P5G0lauZn1wuaRwQwiWSl6G1ls2
EO/JYc8hnMEWsVvnMEadMf3mce8so+hpfu3pNT1dE56mvdjtKi4hsgl1t4zdBGMh
8KBUEU1T7p1w9yffhyhVEx6gMJSdqNptauuNhdGHTbjuvUf8mlEkLt6PibGiWIIc
Apx0tuSDZ5Ukthzt1GKXXrgkeTDHCk3vN7ePQZcmiIkRkXN1keffSzVJDMyJWIT7
WzLnN/33WACiMLJHKD60fg6oVljFVRdyul49K1exjVRY6smlU3Ia0X599uu5I+p+
ACqJMb+YPN8x3OV0oSUTRByRCyO7wg==
=jedi
-----END PGP SIGNATURE-----

--aM9xPQKM74VxiVWS--

