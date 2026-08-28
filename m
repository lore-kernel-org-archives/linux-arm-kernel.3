Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF6AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FYIQ42DCGzI9ZW5t7HWRgY12JIQOn4Qff8BE8HFkZc=; b=Cf539uGNsq6nup0+8hirISZkzZ
	5RPtEI44xbVqVdA0j/K3MZBoET2NSsGIIYX9qESkfYMPKe3avDlbKyvY7ouB1YXgQmggzbYHs8e6u
	peVa3cnPzL0W9bdqtZD5/DM1oRxG0WIDcA60xkZSU8HnmNr7qWZjBhm0+iJtQs7K4b2hz+Fk/nPhV
	zkiHkMZY2OS/kwBduhdrBrZQ29uoBcc3uGnvwRhH35X4cqSRe6DoSLMhm4/h7bVSML3xQZ9icygWl
	bOl4AlxGtBZYVPsX4dnNOvjK05Sjdnm+q8ozP9ULfIt+iI20oByLz3VFmi2xZYCrZ3xecNfq5B9Ul
	NtKTaXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwbt-00000005oqB-27xw;
	Fri, 28 Aug 2026 13:27:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwbr-00000005opm-1oTS;
	Fri, 28 Aug 2026 13:27:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B60CF40890;
	Fri, 28 Aug 2026 13:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8891F000E9;
	Fri, 28 Aug 2026 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787923626;
	bh=+FYIQ42DCGzI9ZW5t7HWRgY12JIQOn4Qff8BE8HFkZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lkBlJOVXHDxt+3hZwt6gBCc7+DagH0ifqyudSYMbP8+Gz2cWqLvk6x1RlZR58OmG6
	 qPC0j7hAP5Hd4qf+NHc6IIySvwjtaZaoRHsis//w54P0ERk+Q2zvjUMoaeVQsXLCQZ
	 Zx6odVBiYNueTz4YWsa1AcUUy/b+tz6N3nyUlZ6TRNTSysjh7uJGzErYvvk5Iu0G9J
	 0GDO6yE0cQ8SVMNmjJ0np3Qo94BOgK0rbwlM3Hd60ToSnDgp9D/qH7Q/xndWPUrm+Q
	 vtQTN7V2w6mqlSZvvRb3wSYoQJRe9kGdrX6Tu5vKu+9Eaewy/de7VLBNahXEhXWl+Z
	 RSm77pw+QMBtw==
Date: Fri, 28 Aug 2026 14:27:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "debug@rivosinc.com" <debug@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"bill.roberts@foss.arm.com" <bill.roberts@foss.arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Shadow Stack Locking Semantics between arch's
Message-ID: <c4ac49d9-1fdb-46c4-9303-f17a517ac4c1@sirena.org.uk>
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <01b0fe86d5700847f78b0e6f839119f54ac88b04.camel@intel.com>
 <apCvGct9U1yprAUE@sirena.org.uk>
 <f2819c4f1a86845b5b2f2b6f0e03f4c334e84eaa.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L1v0x8HM/zJNwKCv"
Content-Disposition: inline
In-Reply-To: <f2819c4f1a86845b5b2f2b6f0e03f4c334e84eaa.camel@intel.com>
X-Cookie: Subject to change without notice.
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


--L1v0x8HM/zJNwKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2026 at 10:37:45PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-08-27 at 22:41 +0100, Mark Brown wrote:
> > On Thu, Aug 27, 2026 at 09:27:06PM +0000, Edgecombe, Rick P wrote:

> > > Hmm. I can't think of a reason to lock writes and not lock shadow stack too.
> > > Given likely no one is doing this, I wonder if we could change x86's behavior to
> > > match the others?

> > > The API would makes more sense to prevent disabling shadow stack if writes were
> > > enabled. It could return an EINVAL regardless if it is locked or not? Is that
> > > the arm behavior (forgetting about locked)?

> > arm64 currently treats each bit independently for simplicity.  The main
> > use case I see for actually doing that is for preventing enabling writes
> > or pushes, though in practice I'd expect something doing locks to just
> > fully lock everything after having enabled the shadow stack.

> Locking writes as off makes sense to me. But locking writes on, while leaving
> shadow stack unlocked. I'm not sure why you would do that. I thought that was
> Bill's scenario.

Yeah, it is.  I can't think why someone would ask for that either, but
equally it's more work to explicitly have a list of combinations we
reject for policy reasons.  At least on arm64 each permission just comes
down to a separate bit in a control register so they're fully
independent all the way down to the hardware.

> > > > It has been on my list to look at this
> > > > repitition at some point, it had been held up by the clone3() stuff but
> > > > that seems to have died a death for now.

> > > Oh? What was the blocker?

> > Basically the glibc people weren't convinced they'd ever want to reuse a
> > shadow stack at which point having the kernel free and reallocate each time
> > is just as easy.  It saves having to handle corner cases with threads that
> > didn't exit cleanly.

> I thought it was also because they wanted finer grained control of stack sizes
> too? But yea, if no libc wants it, it's a hard sell.

They'd rather have just a size control for that, probably a process wide
control would be most useful since it's likely to be the same number for
all threads.  I suspect the main use casse would be someone trying to do
green threads, where there's an extra real thread being created.

--L1v0x8HM/zJNwKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRjKUACgkQJNaLcl1U
h9AyUAf9GIV9Gka3OGQ62/nBYTo22uygHAaR+VThEC2Gy9E1mnzyyoDFDcMpGKfq
FTQ0dN/MSRCNUCayYOB9BgR0VWFlUbxPUkqU+nemTJC3LkTv2BU+sZg2WqG/1aVe
NVkES2ZbFx2+OtAKo5nu8aNUwbxRknniwDRmV401BnGnpEX8Bh2HPyK5puZ5Z0rf
Z36MHk8Wya0KCYtiipFxd6rBahozcDQhX6C4RvML20EjPIBAMMtMOTPA1p1RiYdS
azcc6OVruCJNDvTy7JOVPzoK2jAx49oV3hF1cY2xABzmXrL/cURqIjEcdBi0ONfY
Px37thtnUk0aubSa7N6rI9FPbjgqow==
=s+DF
-----END PGP SIGNATURE-----

--L1v0x8HM/zJNwKCv--

