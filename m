Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F397C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hreWGJW327siB34AYC2ydDe4dYtnM1KvCcF89JQYlb8=; b=K8aHRKaqDuuSpOy2xat8aMDdWu
	KBw23Oq/I+7vRJiR6kzIf6maASEGQVTfJvm/vUWhBvoAYI0QW6DT4JUhSQlm98rgftIH0iJhvt0O9
	B9gZPXeiBHPuY3PN2CYuznSdOXmkLAXPPfy4LTNP5H8oCz5JUj8GLhdFVSq8xZ79fNxx7yzOfU3ig
	igd+iDoFaDbW4bqOwo/bwYTV/N3MDI5Ag1dJICmGduM/z2cRo4vDK00GeYnvCb1zHUOE8DIhpY/Zj
	Cd2creYyv5I31lovzK92vrupsSPTVA6MW5l9G90tVtMM+bX8cXgnP6R8HulOJAmBJbhURS9DCfxLV
	auSHkECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmelx-0000000F313-0Ckb;
	Mon, 24 Feb 2025 20:09:49 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeiq-0000000F2QV-3Im7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18C7F6115A;
	Mon, 24 Feb 2025 20:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92A4C4CED6;
	Mon, 24 Feb 2025 20:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427595;
	bh=MQRG0wCElGkAgnXGUfFa/phfVU4AAiqsQ2KYJcjrJs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5PSnbYP4YgwsftEmZ8YZ825gzDSojyh/8X2Q6bWNmKvJU/Gs+oWMwashqIOOBqgk
	 UX18EdBSEGTcVGe6M95Pc/nRJ+Ne9x95agmGRhCS0+A4oDBluqiYzjRVfVrw7ptYrt
	 ihkDswwM1AGmZQw5+5d8TTbmsZopkjNKjOX7avQocLHqWQOiSxsD4R1h5MeNxVEmwL
	 JsunjM8s8RUSDEUUIKJiAxnBeCcbLFgx0wO7HGi51S9UqgTzmWKMT4csXhinjLDaIo
	 Lhkg2kKDJi8B3cv2pHQrKJV213a8MFaqNkvy8kt4KWNiuTZOkEldGxNH5oICFMA9lR
	 Tyv9VTeskbPxg==
Date: Mon, 24 Feb 2025 20:06:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Zheng Yejian <zhengyejian1@huawei.com>,
	Martin Kelly <martin.kelly@crowdstrike.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v5 4/6] scripts/sorttable: Zero out weak functions in
 mcount_loc table
Message-ID: <5225b07b-a9b2-4558-9d5f-aa60b19f6317@sirena.org.uk>
References: <20250218195918.255228630@goodmis.org>
 <20250218200022.883095980@goodmis.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1RTCqJAl8VZ6A/p"
Content-Disposition: inline
In-Reply-To: <20250218200022.883095980@goodmis.org>
X-Cookie: Do not flush.
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


--y1RTCqJAl8VZ6A/p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 02:59:22PM -0500, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
>=20
> When a function is annotated as "weak" and is overridden, the code is not
> removed. If it is traced, the fentry/mcount location in the weak function
> will be referenced by the "__mcount_loc" section. This will then be added
> to the available_filter_functions list. Since only the address of the
> functions are listed, to find the name to show, a search of kallsyms is
> used.

This breaks builds with ftrace on architectures without KASLR, one
affected configuration is bcm2835_defconfig:

/home/broonie/git/bisect/kernel/trace/ftrace.c: In function 'ftrace_process=
_locs':
/home/broonie/git/bisect/kernel/trace/ftrace.c:7057:24: error: implicit dec=
laration of function 'kaslr_offset' [-Werror=3Dimplicit-function-declaratio=
n]
 7057 |         kaslr =3D !mod ? kaslr_offset() : 0;
      |                        ^~~~~~~~~~~~

since that happens to enable CONFIG_FUNCTION_TRACER but doesn't have
KASLR, we don't have stubs for KASLR on architectures that don't have
it.  It also looks like from a quick glance at least RISC-V will fail to
link since it only provides kaslr_offset() with RANDOMIZE_BASE enabled.
This all feels a bit footgunish.

--y1RTCqJAl8VZ6A/p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme80UMACgkQJNaLcl1U
h9D0kQf+LOWnc5+uG7Nh+lw1IM17Kz4TpwJ61yMifGEeuryxBvycLlVXCTeHEAIq
c7HSB66JzXtv5G9t9gzAkbeVmqYDVAtbhytC3F6yo8X/qpPncogEWepaMByDvprX
HCCFf0oSdJlk2RPmofn2aVfzCcuAomhv2d96jBz73PlJ44WSxY8LdHmAgCoYcFvd
LL5HefmNAKADaNA5Kp6zLspUNtUAsuwMH/ki69FVNctvN19ZkyiL7m/+nsV5uPCv
41qzmSbcqPcNVsCqNocD4fefEk2HZARIqg8TGX0QhliWO0vQkrW+7z97xs1o8zcM
o9EInP1vqJLx6DQQ0u2h3xxeLNEekA==
=pRxx
-----END PGP SIGNATURE-----

--y1RTCqJAl8VZ6A/p--

