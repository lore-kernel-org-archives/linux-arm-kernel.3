Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66DDC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRvspEA69QHTSmFYmJ7xI62Dl0Wi2xgTu6YIPBhnfcs=; b=lX/zfifvMrpKU/HUI7ghSUlitY
	N+lebpL49jJQeG5ab+7n4s0U9Rwv6sbVuWTeSVNxbiNQsHr3xl+s67wxpAnPkPpforg6SwtXuN6kS
	imRqeDNaaayXPWxokKsLd2G+8jl1RsSGYtPm+tNzXtxVrMmnKJtC/wOclZz+k8g7PR/STOZak3kwJ
	yXeBHVHXgQwOYoe3Xot3gGJlohxV1NIB6Q9xKxWOPdqDo+UpR3bVF5sOLwkdILltXo7gkEXMsp/bs
	vg+0dTw9DW2T+k6OgFlu7eVRPchW6nBzZPJRR6LTl/185SoIkCk4wkhgJiuIyw/m+m0NjtIu04+wI
	CQOpXK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1CK-00000006FMt-2tSI;
	Thu, 06 Aug 2026 16:44:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1CJ-00000006FMn-3asv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:43:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11C3460AB0;
	Thu,  6 Aug 2026 16:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD031F000E9;
	Thu,  6 Aug 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786034638;
	bh=rRvspEA69QHTSmFYmJ7xI62Dl0Wi2xgTu6YIPBhnfcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Szzky8jcw6zFtAhLVPaVLAFuxxMZPofv3ZGZHH6bnr8pOqBmbRr6bMCTxhYp6mg5G
	 ojDbMzfV2D6J0nvHm9En3hkR5u59YBCSl9mx2OdJhOpoY8/0YnfOxDc+yzAWSZif6V
	 w0zed+Qh1K1XNkvtxBRqVCL7ufwW9oeso1n5TI3tPGZ9wmXPLFCMCmTQ09ljfZ2afL
	 haLU/lSCzB8FJBLjJgwBZvyhVLrCLEGVVOXjQ9piec6RM9S1JK/ocTD/MTpgJzbsoA
	 VFbziWqiSfGXC6OntgIfm4kXDBsRJL2QZ19UZ88H7Ek9+x3d81iyU04Amp01+Z1P9l
	 vDQioT9n+NlXA==
Date: Thu, 6 Aug 2026 17:43:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <90cf17cb-94da-4863-bded-825ea6136186@sirena.org.uk>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
 <20260803-arm64-gcs-v18-3-fd8c40f5ad88@kernel.org>
 <enhoyivbkdaacgyazubgfzftt34xjemtrybvgpuqvr4czjtbhm@7qvrce5lmdyw>
 <6d63905e-8c6e-4c88-b60b-d34ab1401783@sirena.org.uk>
 <rduid57zbypxwiujgfez67walqgqkekhyktkbibtiqcjh5buge@jqqcu52yl5nc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TefLr2w+5MtGYR7H"
Content-Disposition: inline
In-Reply-To: <rduid57zbypxwiujgfez67walqgqkekhyktkbibtiqcjh5buge@jqqcu52yl5nc>
X-Cookie: Brain fried -- Core dumped
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


--TefLr2w+5MtGYR7H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 02:51:55PM +0800, Yao Yuan wrote:

> Sure. let me try delete more next time.
> I delete some but decide to leave the whole context switch
> diffs to help other guys to see the realted changes when
> read my comment.

Yeah, it's a judgment call about how much to keep, it needs to be enough
to understand the reply but not so much it's hard to understand.  Can be
tricky to pick a good balance.

Thanks for the reviews!

--TefLr2w+5MtGYR7H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0uccACgkQJNaLcl1U
h9DVqwf/VH28WuzeeJLJf1g6ppvyuztxnQY2s2uGFVmG4bMNROwZmFsKbAGiiGfw
6rz2VLfqIIK+9OG5UXugJeEy5r9S81sU+d4bGV75GyclY32saJttAWlt7H9Fp/FA
WQIk2/8kSzABeWEmFM6y71bzUycaHT9H9M15O2syMXCJbh5wOd862g1pckqgn1dG
1W2uYvNY7tmo1JAAaXl/5AmOofXusCUefjOSjwh7M06IGsZUNOdTdJTIBpwB2TAT
7myhFyhpUjG263JQPJbgHtzreEu2UN5Jhs97EiL7hDKq1xCPEyBfLQj/fK0yi1f0
aS/WlG/ApWEqLXGvDBoXcIfhtqdq3w==
=QtoY
-----END PGP SIGNATURE-----

--TefLr2w+5MtGYR7H--

