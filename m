Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E4CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ7GCZyUQ06AYLCgiBy0Xwfy+0Jo93S9ayLySNkfnfg=; b=jhFGhgkbFZZmO3BdPSmeQtvnBn
	j/779LHtV82ndANCTZDK2Jep0y8jeZXTq5YbdCkEe5DlMIqj8J69JyNjmHafjz9BMa88rVb873hth
	1EmU5peU3Kw4dzWTgB9KCTzPsy9wj/n2K06OZJNv5aGsU7CYcABMkCEsgcb5XD48aoSqhMj1xTdPx
	RagteBMqAWX40wyfidkxI+t28E3R6/tnxPV1XllQ5BF9p0R8wOpkMFVABx93YS+XW5k6cBgcjCiNj
	SFcZo3T1sdIua2Jbhe2EG+YXBiy8SMNjhrdl9VBjhy4RdIJwKk1wNe9D5jAQ+0uu/sFonMJU7VbmR
	nM0pqFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHeq-00000000R1i-3WsJ;
	Tue, 21 Oct 2025 19:04:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHeo-00000000R0o-1GA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E36EC45159;
	Tue, 21 Oct 2025 19:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB262C4CEF1;
	Tue, 21 Oct 2025 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761073455;
	bh=KQ7GCZyUQ06AYLCgiBy0Xwfy+0Jo93S9ayLySNkfnfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blllrBLD2H7ce7gHB0WQr5plPrbizlNv0VqjVI9vaywwvMUIkLmjMMU54xyNELBUm
	 XwjucDKYE3F9YCn0X0tchYfG2/hgRkEv36ASC6s2rpXkbtepBDxb/csNBzlYEaCOsH
	 XdUQAlGp8NM9SjQbeKvf6NHjSQ4zSxgr0glKpCpeBKYXgb+5cEcrvJD5uJiHR1zS2C
	 Z6BdtyTJ3ZSA/zy5/D9Q545xZgwazb25/u1G/38HvcCnmLuWWnuQ7Q8qXYsckD8pf3
	 W6vKNiEQvOU61kHKba/2ulZ/l3j4oQordBqIQQaLWoG4NquRjNGEqKzAvL5G58THHu
	 xGs+fZ/oO24VQ==
Date: Tue, 21 Oct 2025 20:04:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	Mark Rutland <Mark.Rutland@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 1/4] arm64/sysreg: Fix checks for incomplete sysreg
 definitions
Message-ID: <0ec40909-7ac7-4e55-931a-ad51a2e39726@sirena.org.uk>
References: <20251009165427.437379-1-sascha.bischoff@arm.com>
 <20251009165427.437379-2-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xza11lcU7Zj4m7Qw"
Content-Disposition: inline
In-Reply-To: <20251009165427.437379-2-sascha.bischoff@arm.com>
X-Cookie: Accordion, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_120430_353445_67FC3733 
X-CRM114-Status: GOOD (  10.88  )
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


--Xza11lcU7Zj4m7Qw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 09, 2025 at 04:54:47PM +0000, Sascha Bischoff wrote:
> The checks for incomplete sysreg definitions were checking if the
> next_bit was greater than 0, which is incorrect and missed occasions
> where bit 0 hasn't been defined for a sysreg. The reason is that
> next_bit is -1 when all bits have been processed (LSB - 1).

Reviewed-by: Mark Brown <broonie@kernel.org>

--Xza11lcU7Zj4m7Qw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj32SkACgkQJNaLcl1U
h9BQFgf/cXubnfy41U65GJJw3zBqgsTUgAmc/G1zDDoYxN41qy8RjEZM5nAwyr99
jyUVxJxmP3WD4++94cxSF99/+mddf4Ah93kj18UDBLRlqRJBypJifkG+Qvz9ToM2
nADMKTWjXNUXrD+DMd7FMTwS3wlEf0J1VT1wiFxuOHkSrddqJLF0z/5ODI1FiV+/
U1kXyGzSohXhBE35eyhJY+KwBP9PFOE6xJcdHqSoTLmhjH8yO/RJrB9UHRsHDukn
YOnkdD0ia/gR5hgSXuYnSyUsc2BwC7ZTIspc8dK0YyFo9p7PF/sB85UBDVMDcVAh
VhuRuO6P5jQG1JdJM4iqNey46ynDyg==
=uzmW
-----END PGP SIGNATURE-----

--Xza11lcU7Zj4m7Qw--

