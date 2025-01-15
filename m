Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14414C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0bl6y0YBn/kdTJqiabz3QWmzU2o1jrN/faqMQfvqdo=; b=RMLTiVt2yUMHVcsW4eQLeMgAPm
	AMQ6Fa5abh5oN0SE4nZKxjaNOpkmudSpbVcfLROMTBN5yVSbcBAKC6yGDrJRtPPO40Cvw7RpRy6zx
	Mv7+PwApE9olKboEJ7miGRyqCSOexxPOs2kB813hGF4ahApXo4SvqLlaepJnD5yko08uGHVi8LZRE
	ltpu8gvnSmrJS9e0OJIe2689cr18/4lst7yii5Hb4Z67BlaftXdzorCu0MUmLmUD+aG9fTAhrHKx5
	dsiPHdToa9HnwTldEBNt4i/z8ZYu2ywgwNOsXO/ZGiTaCQgo4uKtuT1ZOqdLp7QIoeMrPDUYF5lbq
	J2perj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY32p-0000000Bv0D-3w1v;
	Wed, 15 Jan 2025 13:02:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY30U-0000000BuZB-0xgt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F93BA41FD3;
	Wed, 15 Jan 2025 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11807C4CEDF;
	Wed, 15 Jan 2025 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736946025;
	bh=U0bl6y0YBn/kdTJqiabz3QWmzU2o1jrN/faqMQfvqdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJZ7K9rknsXfd/r00PhA3uD9zyHTyHpUiyumyM5Qz0IXdyH7kux5pU0elQmREeoL2
	 iH/jZ2lMokG6eTZzJ3d5co7HIiBBEdMF+yW2K4zxnnWih9M/dY7Dzz0xGd9OOOQ582
	 g4D2OcbUoiPlwW51z+31BAyM5V8k04g5WmKdhlRcHhNoaRDQwEfMf/sD2RfwGqKcaX
	 P83ahgQs4u+7KQWZFrzu0q5wdhiGinhqpnpeJLIwpvYENXvPzHvXw2mas4H6TBO6ML
	 gwznKmT67Vipxys3QGrAy87h6xI3r5BhgPrQVUn75oF+VuU8p7A+O43JsY+4D5H0Tc
	 7bHnxb3Dcs8GQ==
Date: Wed, 15 Jan 2025 13:00:18 +0000
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, oliver.upton@linux.dev,
	suzuki.poulose@arm.com, coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg
 file should be sorted
Message-ID: <3b0afabc-49a7-47cb-84bc-5d1017693be3@sirena.org.uk>
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-5-james.clark@linaro.org>
 <87frloqjso.wl-maz@kernel.org>
 <760969b6-18b7-42ac-9524-2f1f845b3703@linaro.org>
 <86jzaywtea.wl-maz@kernel.org>
 <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
 <b4082b98-e234-4825-9935-971a630f438b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FA7VJeg3rZaKM37v"
Content-Disposition: inline
In-Reply-To: <b4082b98-e234-4825-9935-971a630f438b@linaro.org>
X-Cookie: Phasers locked on target, Captain.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_050026_329558_C0C103EC 
X-CRM114-Status: GOOD (  13.96  )
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


--FA7VJeg3rZaKM37v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 15, 2025 at 10:43:07AM +0000, James Clark wrote:

> Actually I updated gen-sysreg.awk to fail the build if it's not sorted, was
> just about to post it. I don't know if a build failure or a warning is
> preferred but I can do either.

A build failure is probably safer, people are more likely to notice it
and warnings from things that aren't the compiler can get a bit shaky
with tooling sometimes.

--FA7VJeg3rZaKM37v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeHsWEACgkQJNaLcl1U
h9AKiAf/T0593rB+5OtpW6l8XdCx2oJ9KJOa4vmhVmJ7ULEl4UHP7PW3IhIt74dD
l1ALeGJsqbZN0F5ZuqCMZnIghZuEyp5MmiRTGI8BCvXwCUsXC53xzPJJrE675KvF
eb3HGQ7ZWEGIX8IqRqfJGwKwULLn3lxwCIg8ZHNoo93XyhzakKDfdA8Gn+0EoTye
cdLFS5VYYEWyAXgmzWxwOMORUCC5EA9Zi5K7AhL5tRf3g7j291NsZyEb0BiKg6pM
H+r6FCSi4SyjIQrqnczzEgUdW/yeiYIvWP07nPElK1qE3tOfOiQ5NncFaWPoPpml
LK1E81LY1CQXLzJXJL/JnDNvGkBDMA==
=a7cL
-----END PGP SIGNATURE-----

--FA7VJeg3rZaKM37v--

