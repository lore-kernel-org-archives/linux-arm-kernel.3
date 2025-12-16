Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75624D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lsgj8OuzqVfDWSQO7R1AiBs/4NDQw6VrhmnOAUFhsI8=; b=XyZGYX3VoGXoeDbcqB0+Q9YrJ2
	ACVBFg+znP+j6NApNHBnUCt6TRplYv2uNBeiFLcaDKs9pu6F8IEg6Szkm2eUjeV5pTmXfdvaUF278
	Igv4SZ+3gRpeCW6WjnZ7R/OG2UbnZpqZJE+GkFaKTDKcL/LD9lBT3tsamvX63y1qQXITmB178GwNe
	P+6nG+O/7LetpW2GV9ww/d1pmiJiZe4YWOILfl9etpBkwdTSkTWraZsAEU6jdcxjfyrRXbbSfqitx
	KqRSomGgqpMHl9J4Cqf21yyQBh1NL3rejyK9/sX8QDweha2PPOyXIoi6IhjZ9SeoyWsrdJOyIdXgK
	xdeilxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPK5-00000004pyO-2r01;
	Tue, 16 Dec 2025 07:18:17 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPK3-00000004pxx-06Cp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:18:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 692C41D00149;
	Tue, 16 Dec 2025 02:18:13 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Tue, 16 Dec 2025 02:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765869493;
	 x=1765955893; bh=Lsgj8OuzqVfDWSQO7R1AiBs/4NDQw6VrhmnOAUFhsI8=; b=
	Ee+eWgIyyqGFQ2U++/CCQfKtX1+PBraLcFgCVSjRTmiHVd4v7cOAtqBISMUoZK2I
	/unVBNqkXUnAo7v369WXoBPr0PMwXRuymkveGrq3/4hyg/HDDDldn+AZ4gEMTPke
	jlQGjyCfSBTTKOmXCBALCZDeoqXO+363SVyzwOOvqz4ls3WkQCmjf+EpkjQDqxNL
	bEX5I4P0cn64xkyMLObLbRJ1bTLyOqOm+6GjWUabXIV8TU5M2u2xjqUG0zrjMk/F
	XWfYbYtd3GZQAf+CpHhWPdzk65twJNyidxo8Q/cBubC1wTyQidS1LPywta+9WRs6
	lcEDtPrH3vFA3d6P86j8eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765869493; x=
	1765955893; bh=Lsgj8OuzqVfDWSQO7R1AiBs/4NDQw6VrhmnOAUFhsI8=; b=E
	tukkHQ2YrviOGwMTrESN0wNEloj3aeZqQbLr5m6puuJ5ls/S8ly/IJ2/jPpxYaoQ
	FOlokDEf6OBcrJxWI9qtK9FbviUhH6FbGM2btFX2zMomhj8GV/DTVN6cAkI7LKEz
	CDCKK/8+ZhJkco98/VDUhHfGe1CYXUZGchJnXRQUyJfucLl6ouC4ZcA44FrlAeMc
	a11nOuMUC2dWY9McsBz6hkvr6Vti9DZ0s+th5ATlUEQTtuAmWjV7VbRFm0xt4eiZ
	qjk44MfELfAwYmjf4GaY0/qnwbElMv1QYaidkugtcju4rBcekQf9lebRnA1ymIdF
	Y0/c1Ug9lJmoPVU09EsFA==
X-ME-Sender: <xms:tQdBaTqci9f5MQlHxVNLOJ8o4-osZO0LrQ-E5CCFtSc5XiW3P4PLRw>
    <xme:tQdBaYd01GHiuDnL59bTT7eecpJrOZB606OKWEPhNrYM--rla-ekOotP_0zXNG-lK
    q3_mZxvmcwmffGz8_tZ2cLokNiu0tNjZEtNCMOrVLKxyMHu-mr_Wlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefledtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpth
    htoheplhgvohdrhigrnhesrghrmhdrtghomhdprhgtphhtthhopehirhhoghgvrhhssehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehjohgvlhdqlhhinhhugiesjhhmrgihrdhush
    dprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrmhgv
    shdrtghlrghrkheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqphgvrhhfqdhushgvrhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tQdBabqlVGzyMXgvvDrOHVcNHcJCijQBB5LAKg_b-DLBZOfuODTprQ>
    <xmx:tQdBaRqqHyE3Pe5XM5WRM1GI1r6iILCQ6rZp3-7EjY-468z95MXsjw>
    <xmx:tQdBaaYZCmxy8JbVSwHT030E9CdK0dcvgOAGorPfCoOvqi-yTLtFyQ>
    <xmx:tQdBaf_vE98Sq-O-6NLIrSl9uRm1QVQeW6NdnKv5GYmQJOvX-iUtIA>
    <xmx:tQdBaQ3RztgEaVGa-htyM0sa-EZ0bLG4Hgv81PlMDG2VRjOJ_LPsefWQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EDB30C40071; Tue, 16 Dec 2025 02:18:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV8M3mJaQpUZ
Date: Tue, 16 Dec 2025 08:17:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Leo Yan" <leo.yan@arm.com>
Cc: "James Clark" <james.clark@linaro.org>, "Joel May" <joel-linux@jmay.us>,
 "Ian Rogers" <irogers@google.com>, linux-arm-kernel@lists.infradead.org,
 "Linux perf Profiling" <linux-perf-users@vger.kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <67bafe7d-6761-4b1c-8742-628513e7e8bd@app.fastmail.com>
In-Reply-To: <20251215164920.GD681384@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
 <0076b248-9b23-408d-9448-701df3c8d952@app.fastmail.com>
 <20251215164920.GD681384@e132581.arm.com>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_231815_370010_E5FFCD10 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, Dec 15, 2025, at 17:49, Leo Yan wrote:
> On Mon, Dec 15, 2025 at 01:22:04PM +0100, Arnd Bergmann wrote:
> As discussed in [1], I would prefer to drop these headers, but Ian
> noted that this could break builds with older toolchains.

I didn't find the reference to breaking, do you just mean it
would break when falling back to a header provided by the
toolchain's own asm/unistd.h, or a problem with the modern
generated version that is solved by using the old asm-generic
file?

> Generating the headers dynamically would avoid maintaining duplicated
> copies under tools/ and no need for periodic syncs.  However, this is a
> quite big effort, not just perf, we need to update makefiles to the path
> of the installed headers.  I'd like to hear opinions from tools
> (perf/bpf/selftest) maintainers before proceeding.

I see that we do ship the sources for generating headers on
most architectures in tools/perf/arch/*/entry/syscalls/syscall*.tbl,
the only exceptions being mips-o32, mips-n32 and x86.

I would also point out that s390 no longer needs a custom script
as of 6.19, since the last incompatibility between the s390 format
and the x86 format of the tbl files got resolved with the removal
of the s390 compat mode.

>> or we just stick with
>> the old asm-generic/unistd.h copy and use that on arm64 as well.
>
> I will proceed this way for now.  From a maintenance view, it is a
> pragmatic solution that only requires reverting a few patches and does
> not introduce any new code.

Note that if we ever need to update the
tools/include/uapi/asm-generic/unistd.h file for new syscalls,
that will get harder in the future once we remove the
kernel's own include/uapi/asm-generic/unistd.h. I'm sorry
I never sent that fix after the previous cleanup that introduced
the common script.

     Arnd

