Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A71CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV+ZlAU4OBnFEg107R4rtfdkFCn9kcPxLlA51vyMQP8=; b=Sw8yrl8DAXyigcTQ8Lz88IhnZh
	G4KCsrsQ2Z5WfFLqn9HjBltY0y/vsLxBavg9ljKRNPXs7PdQTBbMLHTJYjyGeo3jDzvrn9SJTIBz8
	M/IJ90CV+LdcR8rvdax42gPYCgBndQ30YQMhQ2HqennhaueUPXJ7GV5KLF0EJlLJt6EJlmMDG0e+7
	YDcL5e4nqOUd4dH2u3naMu+pI+aweyztBcF/mYbHWq4DrOr4U1/1XUCs9RhNHQ1CQldzX4mQPp1BP
	7dbmnDyA2PoO/xxIdzOxo5ly+Q2kBYzZOaMSA0MDgDl+xskOieNqU0VC3DMkojZ0RYyb231M2z7yN
	dWv8Y0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNY9Y-0000000Bt4h-2GBF;
	Mon, 24 Nov 2025 15:06:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNY9V-0000000Bt4E-3pe0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5659240764;
	Mon, 24 Nov 2025 15:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CB2C4CEF1;
	Mon, 24 Nov 2025 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763996798;
	bh=GTAFpH4TJSYDJC+6zyiuuCI/A3Ih+shkhJTdyMtqR4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLUhEunI/PKycRbjz1yN6hgMVJK8jGCFGoUwM59UdyObThw7ePnfya50lykNV0/oN
	 CvSMy3yKFQuFljVU0rBrSkOVl8jvBUiaYivMt8wpbI3ILAGFU3brRvMz91s84Q2bVj
	 q4HJzJVhfExlwk3jAIAJtksbTs6CV6eIuhk4iSK8ipOk1Z2I32VdK6W0CSS2T06l8R
	 3p81c97aN4MFID/lJ+tdNduzQ1KtUWYpJWUl4lRSuau08LzHjzUe67FU2MJBiUgscp
	 hl1BRbPqZrMKCMvbOKYJS+d683sSsnbIGjS7KXou2RK6aruIWnNcFJNInJxAs4w7+h
	 6YT8deCN9pVCw==
Date: Mon, 24 Nov 2025 15:06:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v2 29/45] KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when
 interrupts overflow LR capacity
Message-ID: <499fde92-c6a9-413f-88fe-771be267e0c7@sirena.org.uk>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-30-maz@kernel.org>
 <CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com>
 <86cy5ku06v.wl-maz@kernel.org>
 <51f5b5d7-9e98-40b8-8f8b-f50254573f3d@sirena.org.uk>
 <86o6orr356.wl-maz@kernel.org>
 <342302ba-5678-408a-ab63-1a854099d4a1@sirena.org.uk>
 <86ldjvr1kc.wl-maz@kernel.org>
 <86jyzfr03h.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZrY4YkY6KfCCWCC+"
Content-Disposition: inline
In-Reply-To: <86jyzfr03h.wl-maz@kernel.org>
X-Cookie: Single tasking: Just Say No.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_070653_971134_D614833A 
X-CRM114-Status: GOOD (  12.09  )
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


--ZrY4YkY6KfCCWCC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 24, 2025 at 02:12:18PM +0000, Marc Zyngier wrote:
> Marc Zyngier <maz@kernel.org> wrote:

> > Something is badly screwed in -next, and I'm not convinced it is KVM.

> > 	d0f23ccf6ba9e cpumask: Cache num_possible_cpus()

> > is my current suspect.

> Confirmed, and the fix is at 21782b3a5cd40892cb2995aa1ec3e74dd1112f1d.

Great, thanks for checking.  Unfortunately it looks like that missed
today's -next but hopefully it'll show up tomorrow.

--ZrY4YkY6KfCCWCC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkkdHgACgkQJNaLcl1U
h9AW2wf9Gx09NFZkbOxrWK1ZCPVMxa5QkABW1zwg+HvlAZuCBTPi6h72caAbxgrv
l3VT6gtzb7r0v91RX2qHIqDLFALkYgnHvkDNcKo0vMNSi5MgfZYxP+s0faHHD6Qy
77Ya8IbOqnB8y872kIqYyGluZaPZFWm+BLQPjgcf8dDp70P9p2FS1NLiHa+1iy1j
n7ZVAJ7f8cY0XFE9xpYdubh18g8JFWtqFHmthbvRjn3Cxczw1JO7l/YrjpTkq0Z0
LUisxUstkAykqVck5iLrqma7jhr+sGEksbaz5m4tDj7tpZyjZBDdtSIUSqDq+y8d
iH9d8J4cy4V7D7B9CzZkjFhu38k76A==
=ljRj
-----END PGP SIGNATURE-----

--ZrY4YkY6KfCCWCC+--

