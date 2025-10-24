Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eobTyNbgdaBwAwEiZHahTMq7EmahxJNZU5wb3fwH3f0=; b=KushI5D4mDpZhdaQvioGCGJsSJ
	YeoHe8BLLxKkX8ktaU6CGW9shM+m01kG/I4mDBO/ty9ydQyz4Q6frceFSxuoqxgi71tcx0I/UrEeD
	qmynb0HLVjnCSoaaKz8PIllTLj/t3QI4wR1LatJypkbQDBnjHMP4l1f/eA0O3AQk40/OdXvq4zu13
	4UUIH/EIIhELiCFAx2dc3G7UF2cgdvvYZoauZMWZcxltO7235aL2Unc+yLZ6gUctFrvAR+9um66zy
	hl8uYJQBdno4pR9akgHmA0FSzQYMwB4jrXdBjk0MS1sZlKPhI3XTLSTQ7UIL9+87jbYCkIykdzDpz
	r2TtgR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCPNQ-0000000AYVW-24d7;
	Fri, 24 Oct 2025 21:31:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCPNP-0000000AYVJ-05jZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 21:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20307604DD;
	Fri, 24 Oct 2025 21:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2417FC4CEFB;
	Fri, 24 Oct 2025 21:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761341469;
	bh=a5nWUpgjX/SlORZFuatSeSBNce6QWI/+338uOL8xONg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyL8oXeaWrFMDlD9J8tvQ+EpR0SEF9YQaVtb9n7hr8mf6qkeMarkAs63/SjVBsxbU
	 lIEcBEySOLQ9o83+yugk/MKmKn4Xd8qmMN9m6KaB6aGgQ788ff7+1w5nZioSOTWNgi
	 a2x52tiEce1NT5KTnI3PltTCiDs3m6FgoJWutnJaSWdE8ogTJ0sE3aJb2NWzWMNG9D
	 ebtrFBA/pQNapiMmuyFZEwfpxiSeE2esfOqgtSdy9hFPzn7pSpaf+BRHvXEsnFu38o
	 nInC9D/uAEmsBA2FUMjt6fgTVZXRBs7Tm1uoQ+6i3SS1r9Y8+/pVRlBQtwDQ7l+9hK
	 srfU/xPq05sDg==
Date: Fri, 24 Oct 2025 22:31:06 +0100
From: Mark Brown <broonie@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
 <175859026716.374439.14852239332989324292.stgit@devnote2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjZBpNS/k9vJ6kRK"
Content-Disposition: inline
In-Reply-To: <175859026716.374439.14852239332989324292.stgit@devnote2>
X-Cookie: Don't read everything you believe.
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


--fjZBpNS/k9vJ6kRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 10:17:47AM +0900, Masami Hiramatsu (Google) wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>=20
> Add 'add_remove_wprobe.tc' testcase for testing wprobe event that
> tests adding and removing operations of the wprobe event.

Since this series has landed in -next we've been seeing hangs on a range
of arm64 platforms running the ftrace tests, it looks like it's all of
them.  Unfortunately the systems lock up with no output as soon as they
start trying to do something with wprobes:

# ok 19 Generic dynamic event - add/remove kprobe events
# ok 20 Generic dynamic event - add/remove synthetic events
# ok 21 Generic dynamic event - add/remove tracepoint probe events
# ok 22 Generic dynamic event - add/remove tracepoint probe events on module
# ok 23 Generic dynamic event - add/remove/test uprobe events

the next test being add_remove_wprobe.tc, which doesn't seem to
complete.  Full log (for what little it's worth):

   https://lava.sirena.org.uk/scheduler/job/2000440#L1860

I turned on -vvv logging and that generated the rather spectacularly
more verbose:

   https://lava.sirena.org.uk/scheduler/job/2000676/log_file/plain

(in a somewhat processed format unfortunately.).  Looking at that log I
do notice a bunch of "unexpected operators" reported by the shell, these
systems are running dash not bash, though that doesn't seem related.  It
looks like the script hangs in reset_trigger_file while grepping the
trigger files rather than actually trying to do the test.

Sorry about the delay in reporting this.

--fjZBpNS/k9vJ6kRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj78BYACgkQJNaLcl1U
h9AkyQf/e3e7F7Pk3OKUC6Sce26wTUo8MDGLo0PgSFK+bCCeLWau+ZqDOUr9a5mZ
dge4XBD6WJ1HMCDcU3qLdCXrHwmspyDA/LijDx/TcmChx1qnWYJtT/CfPLoSP9Y4
fs9A6ckI+P3ZO82/4bEwxMu9e0vDsKKOikzoOdZn0O8iTMauwpqbot/if0oMIPPA
ddHn84SkdqyXCjJe8KOEp3cfYIg/D3oa9h/mJJVaJWaz/H8C97jkkZgiob6Xcem3
TzjGQpLtFx8wbERoS6c4NtI3SfCZkBXhBaVEHcAl0/iv56xnedDn/JcCEkIVxqE1
E97DvONInVFwS/6rrs3eTE45VFAeHQ==
=/RTT
-----END PGP SIGNATURE-----

--fjZBpNS/k9vJ6kRK--

