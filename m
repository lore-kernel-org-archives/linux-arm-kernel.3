Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52B1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT5neA1u30HZVnukFcxjKJuaBHUsVDHuaLME3TTzW28=; b=fGCLLrvKcMJKcIXl0a3fqvvrad
	ndQQHqqCHo0ZAA0my5fqkPYOsbjo1mdFrYx9A0swxIlGYgxoEj4Fl8vtR2NtmmTLQ1LSvi7/4DNhL
	d3z9wT3Rh9ywmq+tQgQAkVOYZDiGrMe15bMyMn8dT15iH1/6TMrkaZXnLAuiVPh46JnHjxJusZLJg
	oDIXzVkphKCBLXg1dapA3OpQYkwDczv6D7bsw9aAI08wJnYlWM10kVuoLNKdAUMVdF8WKcKcHS3Wi
	lVeaLFdqNmEhsp71Naz6unVL1pDdAJ0d08tBqXhS1AmtR0ymZyhS4AfwK+H1L6J1RyWuKPq4XxL0c
	1OoR6/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5qQ-0000000BuHe-2yhy;
	Thu, 20 Aug 2026 16:42:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5qO-0000000BuHU-3lFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13CBD60A58;
	Thu, 20 Aug 2026 16:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332AD1F00A3A;
	Thu, 20 Aug 2026 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787244139;
	bh=rT5neA1u30HZVnukFcxjKJuaBHUsVDHuaLME3TTzW28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gq6fRyVchssuYp/w09UnjVV7POn/M94fFN0uibkI7nvjq65nbMjAKol64gt+RbcgS
	 0WvC5Ms2fj3rT+hOqjhemztgQ4BQTPrWCPhEozyM0WrVhxStv/WHjvWGmcckh6M/o5
	 kPIn2BZM9AgQtQY+IerbNMnAik2W4aAZ7vLpOPJlAd1DtgfI6Q1PBDIRRefWFJLlb4
	 OOhNBPeLhNXdazsAqushflwLzRviQrXybknH7ELTWTu1MNUAMqLt6kTnNHcIe4yeNW
	 KwJLg206LQcb6Ya6x/JjHJ5NTNl8PL+yTdQjuPZsSu8A3ENllAhXg1qNj8wtcwzASa
	 SbYrgmbrfOEYg==
Date: Thu, 20 Aug 2026 17:42:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <04a6555a-7def-4a2f-b91c-91483f7d3b28@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
 <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
 <630beb10-66fb-4d9e-9b86-df406ef585a9@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IB5beCqjp3sOuuks"
Content-Disposition: inline
In-Reply-To: <630beb10-66fb-4d9e-9b86-df406ef585a9@arm.com>
X-Cookie: Happiness is a hard disk.
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


--IB5beCqjp3sOuuks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 04:42:16PM +0100, Muhammad Usama Anjum wrote:
> On 20/08/2026 4:38 pm, Mark Brown wrote:

> > Is tooling going to pick this up or should this be at the arm64/ level?

> Yes, it will be picked up. The top-level kselftest-merge target recursively
> finds every file named config under tools/testing/selftests, so
> arm64/mte/config is included.

That's good, though looking at the list we have requirements for
CONFIG_SYSFS in other tests, probably some of the other stuff as well so
we should either do something at the top level or decide we're going to
do this independently for all the subdirectories.  Top level seems
easier TBH.

--IB5beCqjp3sOuuks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHLmUACgkQJNaLcl1U
h9BkrQf8CpY8qgC6cPPXtBx5aHrIHhFC3E7w5hF+DfPJQErsBUrZ9Yov5Vgxv+h2
Pz+zK6O4GjjFAlbreWCj1hCsEabFOaLtvgIyc091mDj7bJJTZgQHzCmXMa3iquZA
zcmh4LYZw7BEK4AdUmces5kpevbYYt9RoCPvLp24qu3ezmqp1M8mEOlJ1+PjUNsa
a2qMXhpzw5nK+4SAG293wVhAYToGOvI0f1TqsJPtrca/rCstat3FClFWwD3rtkuo
0bUQmsM2PwUrgBOk0iJsucQpS9Lia160KemuxKYIBDBEqCJx+atsjfwqWG2t5LI3
A62dhkWrWJBP5iJWk7Nq3ylaNVi7AA==
=7UiJ
-----END PGP SIGNATURE-----

--IB5beCqjp3sOuuks--

