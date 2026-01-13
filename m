Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A28D2F35C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ8SVEcYjJKffhGyHXmC99Qj/0CPx8waQRTIxMgjafk=; b=FlNPLC1kH5qeqHTTj+wl+Zto3i
	E7smWB+Jq84TVaOg0sXxMIREnzHrsGBCFdXjYzqaXhkWxieFasmXoczkYukP98cRTd/ajIb2dUFiQ
	jkIUhhUIXruJKDccXO+rI3oTUpqe7VHxiM4x6v3XpawugIHk5cC81xpaSwKalOD2CUllp06QetvDO
	QHaSvJR9TsuLNvhd2qV4fpOQlsnHgN5+xbHotGssdm9xW0wIBK8ri39Rw7Gk04PkB7WWDHo1lJ/1l
	N02oPUbPVuz0M1w8kuR3SYS+Iz2zuQU+KdYccWo8wntxkCnEKcW/WxgOupQ8gK12YGfdArr1myZe5
	pvANZRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjkt-00000007cD4-41Uc;
	Tue, 13 Jan 2026 19:08:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjkq-00000007cBH-3nwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9C0A443AB;
	Tue, 13 Jan 2026 19:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAC7C116C6;
	Tue, 13 Jan 2026 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768331315;
	bh=BlG7Ssce28/FBGer2w45hjxLQrro3n1kR5hQ9PoxQUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFe+UyiAM8nw1RpAZ8dnDlZg7/u+WeSfZkLTq7hnyWk/FNs6VBsAtz048ZbbD5t9S
	 sMryJrpGRz4zXqNq/VugUWEiTtkVm407BclAEbyYBo8ZXLyYcRCP0kTrYmT/vBtZE1
	 ydoUfR7Y75lBJf8cLjhopc9HQWUwMMAGmE5PTe51i5DMO/Qcu8w4IWY/pN19OMiCuT
	 PbHW0nF0dSWtdmm6qJRxA94B4J62po295i/yIZaGjC8D93JhOS4K5ZuanffOipvgWc
	 P3BLm5C3i2DzEKJBiA6O3CrVWchyOJdcHOxkI8+fc0/cSnBSN51m/+k9rPsF0GanYs
	 +/G1hpujfSJSg==
Date: Tue, 13 Jan 2026 19:08:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 18/30] KVM: arm64: Support SME priority registers
Message-ID: <24d06740-f8da-43d0-9e40-81323f6a9237@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-18-8be3867cb883@kernel.org>
 <CA+EHjTwxc=+1TodVR7X96fnKu-mykivdFxMbB5nUrw_h4MGKHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hJ8Uz2qkTdkXhDSA"
Content-Disposition: inline
In-Reply-To: <CA+EHjTwxc=+1TodVR7X96fnKu-mykivdFxMbB5nUrw_h4MGKHg@mail.gmail.com>
X-Cookie: All models over 18 years of age.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_110836_964324_441D3E76 
X-CRM114-Status: GOOD (  13.59  )
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


--hJ8Uz2qkTdkXhDSA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 11:59:22AM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:

> > +       /*
> > +        * We block SME priorities so SMPRIMAP_EL2 is RES0, however we
> > +        * do not have traps to block access so the guest might have
> > +        * updated the state, overwrite anything there.
>=20
> nit: overwrite -> overwriting

> > +        */
> > +       __vcpu_assign_sys_reg(vcpu, SMPRIMAP_EL2, 0);
> >  }

My original is correct here - the action we are taking is that we will
overwrite the value.  To use overwriting we'd need something more like
"handle this by overwriting anything there".

--hJ8Uz2qkTdkXhDSA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlmmCwACgkQJNaLcl1U
h9DLzQf9ECKYlxB9v/nA6ULn595t/Ut+L10MjxH5UG+Bx55K2Z6nM9DNxKzi74iW
92pZ/UIu2DAB+mKumhcHsSGtFvDONyUqeZwfIUE5XYWH+VoBEMQC4DIdYRi2YDwb
zSfvAh2lqiySy9RHeI6orV6dKs9u3HVxF/eb85+XpPbswIiOej4OW5RECEPrPUmC
A4ohL7KRW4flNvHV7WrA6gPpy+dAbkkh2/zP2V1VhwhKydikY7gAEyt5ec2BmK8o
aREwbFcuMiRGJaXWU+LhNmgus3k0YGLjZTOrtd+YmDlwCYv5qTjdbtc4iU82BusN
bjR4dgGoOXiso3+khcbbpEsljh4Oiw==
=Xsd1
-----END PGP SIGNATURE-----

--hJ8Uz2qkTdkXhDSA--

