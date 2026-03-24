Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B556F54ACB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLVGad9QWVh7gR2MpCHFceNfqBerepoUF3mi772tBw0=; b=Gi5DIw93Z9+WUk21PbE0XT+bJm
	hPZC8G4TZnQyga70TrsA7S3glW7k9t64V7/TObsRuNGltnheyezsW1oJPoqrAiDLrspOArJjIKEHj
	9YTRmvSUu5ERmeCe2cxt7817ddFIkPzqLg56UWaenfAkZX4qgsY1mfXSV7Oh9ksmdBKblC/pvKU6S
	8UsOX8JW5HMSLrr/DZIg1td6Qtlz4+K19WYVYkCGg3rwCDMB+sH/oRLya3wVsLsxFdGsZNaL/pV3C
	ksXThNt4Eyk/BFPIGjH287Yw8jql6Nu7CK7GglR1fMFNc0E9UAfsaJV8ZLl+MIjHfhRXvEoRxt8ro
	wJW/UHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53BK-00000001hPu-21FR;
	Tue, 24 Mar 2026 14:56:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53BI-00000001hPQ-30HX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D6040200;
	Tue, 24 Mar 2026 14:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F802C19424;
	Tue, 24 Mar 2026 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364191;
	bh=jqt0+iHaBhTs+/uQV5esdkb26UOg4Aqfep49wdige64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsBC513eseXrSA62sIrshbevbDZFymxnJwjEp48xC2wtdLTdDdQfOxM5qyBabEM9y
	 LSQ1b6xsz8xlI598EflNB3MoLQ4q/dEsvQiAO6IAfA77n/2sI00osF+ngoljUZP3lj
	 SpFGOxr9NhZIt+6PvrRKJu45JaHmnEUSi1rc1Vsf0rGCs/R4kaZT+qAt9aNsN9vr86
	 kOWC3HMzvW04Vgoy8qp5blwbmRdVI4Ngf1k1F6BfBjuKWx8WI9f7tWGBGeHhWW4QsI
	 rnHOwHROJrfIm7LR3T77dVT6+25zZfjM5gRFYwS9E9mpdrIErkuzjNab98SVxVApMd
	 la8aqMbUp1L4Q==
Date: Tue, 24 Mar 2026 14:56:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 28/30] KVM: arm64: selftests: Skip impossible invalid
 value tests
Message-ID: <546c1fc9-995f-45e9-b330-e7a911fe8d16@sirena.org.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-28-43f7683a0fb7@kernel.org>
 <0f8d0966-4e05-4d5a-a523-098b3dbcf7d9@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ZNS4L2H5GKx15fP"
Content-Disposition: inline
In-Reply-To: <0f8d0966-4e05-4d5a-a523-098b3dbcf7d9@arm.com>
X-Cookie: Forest fires cause Smokey Bears.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_075632_771248_0C8045A0 
X-CRM114-Status: GOOD (  12.30  )
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


--1ZNS4L2H5GKx15fP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 02:54:54PM +0000, Ben Horgan wrote:
> On 3/6/26 17:01, Mark Brown wrote:

> > +		default:
> > +			*skip = true;
> > +			break;
> > +		}
> >  	}

> I hacked up a quick loop to check what this function is doing.
> With a mask=0x1 I see some value returned that have bits set
> outside of the mask.

Thanks, do you happen to still have that to hand?

--1ZNS4L2H5GKx15fP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCphcACgkQJNaLcl1U
h9BLbAf/ebAp06o9rTWWi16HumPClxLSFzlzTKPTm2R2MXa5wHA3m3E1Cit9UBKt
NI/cqi4+wgO7D11xFAnfhiD8f1ikM91fzsP2wx2DTyhbutXQsooqJt7jWPYDj5Ph
UDCeY7IZUIJSkskkeTnrjBTovL5mCGpeMZ70OuenynhBJ8sXdjYy56z36pNgDHb5
0lqAx9ZIUZ8MHRQ7fpGvxSoB1o2EEGvoVVwBgOHcXpYRgrAB4klD9Y0tPBsDsYzj
L8dAqlMBSt6i6b+q6eZz0aqmKhfzqQsPYPWATGBoGSun70R22KNU7XPCYtaR8IJs
Q2Wj1aP1+2dhbfpO0oot5eG9ERiR/g==
=guob
-----END PGP SIGNATURE-----

--1ZNS4L2H5GKx15fP--

