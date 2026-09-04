Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7923BC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjN1gkM3/MJ3iD53susk88E53ze4Bbb7Yo3K3aqlx7E=; b=ioQ+ZMlOgzbf9JTFD1f82fhQYe
	JHq0yAUemj2XdyFdHrlDzdRI79+QbRiF5z3usdex/who2tCn0twsnLFgYYpHsXBTOFr6bsAa23Dhs
	hcPckn0VxWj8hWDoLtdO/Hf2CG0252gJJTAszBnK2T64M+zOXWB/Sn0dm0MQHoxDDWMTyK34MBt6p
	VXZA7kbrWGfK0XGO9B8zVAJo36vdKyMB8Dqq6abUVSR2+ETXWF1c4K4sYLXpq349Bbl9Z6s3bKGCb
	JBEsFWGYd09CPcJSt6oAVF4TLyZbnxhXHwE5XYFwovxigdKe1jxBOqRf3/sL/zSfoySumxvYSjWwA
	deaio5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XuA-00000002umY-3Xi8;
	Fri, 04 Sep 2026 17:40:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xu9-00000002umC-0Nqk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:40:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AAD1600D4;
	Fri,  4 Sep 2026 17:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D071F00A3D;
	Fri,  4 Sep 2026 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788543644;
	bh=VjN1gkM3/MJ3iD53susk88E53ze4Bbb7Yo3K3aqlx7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gXIrg7GmobYPdnyckJvRGQzs9/B5pfELcXUk/lYcSM6f0RJOmCjpfqxjspCfhJDr8
	 BJUv69D+L1NfImxzer1lyZ1/+5IiGW3sleYy1H4n/sK9az1Mxnd5iNa7qvFkjuobTJ
	 a39a4Hk/Ek6KWdmJTSrwPvnTT86/tW+V2c8SR3N3gYQazpSajL5c3OxAq6J6rJZ7pv
	 xB9ErA04HEEvCeKtOAzjMpNVzz0tDQwi9gmTK9eBjLGV2SK/ZlQJVvT3H/LRxFlqcP
	 npo/nwTVxe0LCncH0ttWplJqa1JPrHfPwC7J/7rnoh0HmyQCU3+hmcsSOoeDpQcPx7
	 RV942uW+Ywd5A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 66B941AC52F1; Fri, 04 Sep 2026 18:40:41 +0100 (BST)
Date: Fri, 4 Sep 2026 18:40:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <apsCmewuhD9UZWT4@sirena.co.uk>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
 <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
 <apqrky27mJmUV9UA@willie-the-truck>
 <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
 <CA+EHjTx87SnshzrUF69hGTSA9JmjW9oKbx+GbKjx5W+gnWYRgg@mail.gmail.com>
 <aprJv4vkguNJb5vG@sirena.org.uk>
 <87v78l3yrg.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rBn5QobMDx7UT59k"
Content-Disposition: inline
In-Reply-To: <87v78l3yrg.wl-maz@kernel.org>
X-Cookie: My vaseline is RUNNING...
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


--rBn5QobMDx7UT59k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 02:57:23PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Marc also started out with a flat no and didn't mention anything
> > positive about the hVHE part so it appeared that he was objecting to the
> > whole concept of the patch, including the hVHE aspect.

> Then you should read my email again.

It is true that you only explicitly mentioned nVHE which doesn't exclude
hVHE, but the silence on hVHE made the position there unclear and the
tone was rather negative.

--rBn5QobMDx7UT59k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbApgACgkQJNaLcl1U
h9CBkQf+M6gAaAslxrZd1oYFC/YbkP0vFgitN4ZJT1Xrtve/CiKxqhVlngLT4E22
3eS5rCMou3UAKB2lp+fa3VpeOv0fw8VBRupb6hMPXlpLeUrmI0CDNNc7XJSL/IeA
5jcwd4ftTBGkkE1p/nAQWDP2FjXtVr22qYTHo3rz+1aNED02060rrrSZMJc+7Y+m
gduUnHyYroKnIYBf0kO1uhydZsJ92/zbV8MjqcUnFJPUmbzEEfcmxvofn0GD147a
i95yeBKGDfrK7C5ymNMvfmCq7Hz9oT9/3gFpf0HwVpRxzsaEGWDif/ubHH5vRzbI
a5QzuIRqkbOVIBSQdMB+3Ef/cyjmeA==
=q+Ne
-----END PGP SIGNATURE-----

--rBn5QobMDx7UT59k--

