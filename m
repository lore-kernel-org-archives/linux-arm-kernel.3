Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895CFF46126
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibUEYe4GutvPEuyapGFe2ws3ChvH52UKKu92kP5Juwg=; b=vv45iX+ztXJ9mwEcOPgFzwpYzx
	wWIZ7Os0OkxiX8cY8OCV15dgSnFFCHHLWrEtIPtND7zD/JvjIqgTboaALLw6uyNKeh9qhjAs3LkwV
	u3isEAlBKTSpRpRQQLpXWBhCWM8kqxHqAzWNwEjKvRz5m5x6a2GUcvYLVUm862dfg+26CqgglaY1s
	lOab2kokvQN7rd/JbM4nmh7BH4OtWWYdW6a52Sq6dynoY0e3o+HsYGVktLjfd19VcqkwZcnPadSkY
	2NxNlcaLuQFCUqE10oNbfjyB7u6Y8jKrC2eZ5/2ZQwy1SPYB47wTsi+fmbZ0ye+fdHug62ujEI2/P
	9jycu9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fxf-0000000Gtmb-3z7q;
	Mon, 23 Mar 2026 14:08:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fxf-0000000GtmT-0TqW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3559860123;
	Mon, 23 Mar 2026 14:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316AEC2BCB1;
	Mon, 23 Mar 2026 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274933;
	bh=ibUEYe4GutvPEuyapGFe2ws3ChvH52UKKu92kP5Juwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXO0PCmwrRlPmNBfdqj+2xY1tZ8lfmetGhg534KH/K5FERePA+ZTQGECkMUmKsePd
	 KfSbiLUlfWmtRkU0Oekn2bqZavw3y9uvwwqwaiW5Qlj9u+euHwMV/AQT1yJbfZ9lFv
	 tgeGj9D+RcLHfJnX2mnMwP41/AxcYi/SDEr878+iziQff9Wvi+L5XJ3GFcdfzRSuGd
	 e4maIyyjnFFISi7jL2BFppVjuidaQeZJ1amNUNtHuaiccZnpIxawfhwn6sLdMe7sSo
	 28EQRgmvkwKBy1ZSwPV8tIjvDfow/lP6RcGPrKDsfP6jwFEQPjStc1ZeY7YEJEat5g
	 /ddfhR4bHEpnw==
Date: Mon, 23 Mar 2026 14:08:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v7 12/41] KVM: arm64: gic-v5: Sanitize
 ID_AA64PFR2_EL1.GCIE
Message-ID: <aa0085c6-6b5c-45ed-91af-55fc68939fe9@sirena.org.uk>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
 <20260319154937.3619520-13-sascha.bischoff@arm.com>
 <3be4971e-31a4-4033-9583-88d7fc96104f@sirena.org.uk>
 <86y0ji4pu5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vd+FgqXVSRBWfKWZ"
Content-Disposition: inline
In-Reply-To: <86y0ji4pu5.wl-maz@kernel.org>
X-Cookie: Avoid gunfire in the bathroom tonight.
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


--vd+FgqXVSRBWfKWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 01:50:42PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > I'm seeing a regression in -next in set_id_regs on a range of platforms,
> > including physical ones like the Toradex Verdin AM62 and i.MX8MP-EVK,
> > with a GICv3:

> What CPUs do these machines have?

The physical boards are all running shiny new A53s.

--vd+FgqXVSRBWfKWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBSW8ACgkQJNaLcl1U
h9DZtQf+OZCVNVbOqhkxeUB5zWWSOVy3pZGFgtFTYQydWn2Z6+S6Nyzwc4TPcN1u
SoeQ/qHxWFQnl84KR3Ponu6jdImw/2WYjmhHCe3vhg6cFmxXbILMahCjTf14wQs6
j4iwRDBaXHuh0+8D553n0BMKY0CmXsmJH3Fvb0lD+74m+HvxtgxFBR8FDhQTFD7R
4w9hUlxiPpYT3iyRf0oUZeZi9UTl7xXizHN/uiVxLrUdFU7lzlCkqncX/c4IB48l
lSdUd9MiwXY7IQYCeb+qD4F7X+BpSAk0dEBOn0YxH/8xa37HDRoiSDF1q+ye3Uz7
6X4yALlwL5PlkjlzgEGsel1UaD9T6g==
=7vYS
-----END PGP SIGNATURE-----

--vd+FgqXVSRBWfKWZ--

