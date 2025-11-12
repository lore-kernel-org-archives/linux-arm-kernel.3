Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA248CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e7UHGUmDYcQhNsSPVKW4gMNpdPma6qhwILpFnadrWE=; b=x6pbzIFKjpIZlSJf4DcdMSk9sn
	ieE06gYi7bI4vQdNU8tEQPYJM+UHSBFjVuGw1fBQwWV6Z0SUtoZb8r5q3nYk86tXsr/Tl8yP+76cA
	iCwOEz8B0bsbJN846RmAuXRSI78oL7Wu5cdb0VRDhq9S1kFpp+05x4WZgm5H/uL7awjKtocGvbEJP
	zqW9cWp1fRqfg13+KhH5sDgXq4M2jJchUENndxYNmtQ00wvbLjFtaUSHLC7XcjYvBTzpIzAXfGAGd
	/cRdNTHLh+NBTobgcvtxI4MpNUakY9BQqAKAgpPcNkBqVVy9QALdUgjAkEX0mOqiWsbPlHTeDk7Gb
	8uZmKg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9kq-00000008lBu-2rbT;
	Wed, 12 Nov 2025 12:15:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9kn-00000008lBI-20yV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C9BE44660;
	Wed, 12 Nov 2025 12:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48254C4CEF5;
	Wed, 12 Nov 2025 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762949712;
	bh=LvobtyzxlyPW6gIKJxQAWAM+dxTFPbpGzV/jL86QCLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prAb0eP4AcbTYSrYYW+jPicB1nCpcnL7P97XANaRsiFnojz1LNBQGFDSgqL8dHh3B
	 cx/voQvFyQNak+DarWcaqx6Hwo9IGzFtHbfa9XC2PFj7+seYWykiYXA70itm8zVLKT
	 SUNZASy6DF0eWSokGheOXaGSkTZa1wPLVLtluBAvN79H8hsDZBjNFIycLB06U+spuD
	 nxQUETKLzI0akNDsPuJaCt7qdMXuKTNag2cTCm40AeaUHxTlRQ4KBQbFGTEOFxWutE
	 y9Jpzy78lQfigxl871pKJCCoyuPw/C98pJBbZzqYzwCz1SI2VX9pZnUtgPEICDQp+L
	 Z/vn5/gj36XMw==
Date: Wed, 12 Nov 2025 12:15:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-ID: <af8f3543-4af6-48d7-a55a-bab24b6c7c7a@sirena.org.uk>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
 <175859026716.374439.14852239332989324292.stgit@devnote2>
 <aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
 <20251027224347.4c887cc956df63602f377550@kernel.org>
 <20251028084222.a3c1ae97d125d9bd88fc565b@kernel.org>
 <20251028105549.ae94e8eeb42f4efc183d2807@kernel.org>
 <20251029004219.dc9cda0eb56ae46c55855844@kernel.org>
 <20251029114317.167b7d908533385c1c9e6782@kernel.org>
 <20251029172004.a0aca144735f20a6a59d2aa6@kernel.org>
 <20251030090952.befea7f0cecd5518c7fda02c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cP5LvKoSdHfjRefq"
Content-Disposition: inline
In-Reply-To: <20251030090952.befea7f0cecd5518c7fda02c@kernel.org>
X-Cookie: "The Computer made me do it."
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_041513_563034_C56BF8DA 
X-CRM114-Status: GOOD (  16.14  )
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


--cP5LvKoSdHfjRefq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 30, 2025 at 09:09:52AM +0900, Masami Hiramatsu wrote:
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> There is a single step execution code but only for default overflow_handlers.
> This is a bit strange becuase other users can not set it up outside of
> the arch dependent code. Even if it can, it is simply redundant.

> So I made changes below which allow users to set its own custom handler is
> compatible with perf default overflow handlers.
> I confirmed this works on both arm and arm64.

I think everyone who knows this code is really snowed under at the
minute - can I suggest posting this as a fix for now?  This is still
broken on arm64, we'll need a fix (or to disable the feature on the
affected arches) one way or another for v6.19.

--cP5LvKoSdHfjRefq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkUekcACgkQJNaLcl1U
h9C16Qf/cGOgECwcc5I4jFkLHhS2AK4mgV7AWZ9YuvlpINTMhR0OvSRr3zbp9xKa
82Qnc28I4WwMg1h7715oStzw77gTfADaOQWrwXKW277LgR0koUlvmCeCphL4jOLM
gLOpy8jU0ZjFrlY3Cvepm8xk5eZtGCDnlJWKJ50ZMolCzUs+YYK0l0adx9kfTiqY
XjBAIJEOD95YAMJgTfp5VeUqwnTqie555SL5mkT9BQzhsNDMqFbUpSlDBpkAzWoQ
Mz+jgpvcfJO5N9wmB3Jt31d4415sfLtMn2ka1/Gzh8Hqr6jvwAIdXW48wX6LiPMz
+X5qczEDyGpOlL94BtgksbrjfJ1+9A==
=RYDB
-----END PGP SIGNATURE-----

--cP5LvKoSdHfjRefq--

