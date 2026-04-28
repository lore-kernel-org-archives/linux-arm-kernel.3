Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C891CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZicstlCEy3IWZiOQN/EqQrzbm+06rnQtEWNLsCVGooE=; b=T9qhKqxPzc80HrdIzIGZogZd96
	k2vowGGxA0ayiprPKow1zPsZJp7FMJo9YL39/e2xhyJKZ/se8Af14RhnBU3BlzXNmx7gFBfkOo1F1
	Rv/z/z3NcF48QZwF0peWiDrkPq/Qh6jsyX93kv9K43XxFYd92dcjsnOu9xfKPAmPis4A7bs8sMIGe
	dbrAyKLtuQxrrLK3MGCY0C2ffJgGRMCh4BaieXOssQ3Vcbq21J7tPvii8qIF5oWykwpyWlLYFTdoG
	2ZniIONRyn7pTpqPqoEn/LZj/6cRJJCOSybSDpMoVoZEzg7upbk65yvD9Y3dWA90uMa5+k+YRLvJL
	PXB2V4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHrpT-00000002bwy-0vUj;
	Tue, 28 Apr 2026 23:26:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHrpQ-00000002bvl-1HkI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 23:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93CED40B54;
	Tue, 28 Apr 2026 23:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F957C2BCB7;
	Tue, 28 Apr 2026 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777418815;
	bh=ZicstlCEy3IWZiOQN/EqQrzbm+06rnQtEWNLsCVGooE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxMMgw6br9IYs5kUlF1aeVc43ekD0MINnQFVcc3+dfepsNX1bn3YwkAhj376oIxEr
	 pMzBVcM6hwG5KQG/OPdsBJqpF6d2RyOFweZNGgE+eZZrJTAX+L3quYd9SNuBvP2310
	 y4F9vXe6rAE8WoohyUS8w8Amw5Y68T9AK8rfq+9Zpb8Xcjvm2sx9FKKOADhwzzpTeU
	 Va90VfwICsFOlsmymfyKcuXPVWB95ABgTCeTKUcE4HCY6nAbhAXkjMECdLYSI9hx4o
	 79HWNmb1vfuvClF5kLMBrzOCEZ2CyVYBm+pI+jYb0vfCay1z6iGMm4SKH0a63oqNDo
	 Jhr5RBFgh6diA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0E7F61AC5842; Wed, 29 Apr 2026 00:26:51 +0100 (BST)
Date: Wed, 29 Apr 2026 08:26:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <afFCO2BpXZQW695O@sirena.co.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
 <aeud4Hqxq4PNitMc@arm.com>
 <b94bce09-69d5-4454-b4a0-81612f286f0a@sirena.org.uk>
 <20260428101513.GE16537@e132581.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pCVtL2GPjLu+SJ3O"
Content-Disposition: inline
In-Reply-To: <20260428101513.GE16537@e132581.arm.com>
X-Cookie: 667:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_162656_371262_AF1C95BF 
X-CRM114-Status: GOOD (  13.91  )
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


--pCVtL2GPjLu+SJ3O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 11:15:13AM +0100, Leo Yan wrote:

> > It's not glibc specific so it seems reasonable to keep it in gcs-util.h,
> > even though we don't currently have any nolibc stuff that uses ptrace.
> > That said this isn't particularly strongly held opinion so I don't
> > *really* mind either way.

> Does below change make sense to you?

That looks fine to me.

--pCVtL2GPjLu+SJ3O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxQjoACgkQJNaLcl1U
h9D+Mgf/egrEQwsX1P3T4kqHQcwCAKPkC9IlRDqUTJ+Va678AdjBDlbahJ3ebpzM
1XHWOpofkLnm0Rrngp9tCcta37e9xapMRRvIjRT9aPZf57rbwIOiIsecNOr96v4Z
bKXKw4yeALHiRvfkHa61gm7JDn0IG2PvRYkStDH0I9AnDEf3//j0bbquOitFuRS8
QqOD59Uh0nMsnnj1Ms7Y1OFzyXgFQk6vyZjN6oTfaXL4PmPM+GE+W4DSo8EaCZsD
jU8VEBMeWezzSa86urtGanZWgrG77VlDcCTlV7kT9lwcnd0zFkrrMlVLuUFFj8sl
vC0Tj2ZlO1/rfrkvrVxdSXDYmJX7Cg==
=HRmc
-----END PGP SIGNATURE-----

--pCVtL2GPjLu+SJ3O--

