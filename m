Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10536CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tes9eETmhbrfgk7DfFhxjNPU/OcGWQZ/gxVtYb53dAs=; b=U9DBhecmaOpqK5PAi/oaO6HwKs
	ifhYaHTJMRMvyEVSUzGgV0x9IN7Ge7lLZuT/z+qdsGZ18mHV/hdz4byn2Wfji7eBwDsRb/Uk4I1sQ
	puqWufHcjJsFkdzajEwA3+MBs8CE5UEMaoWH4tTdlQqcQhqNX9oaint+U3X/iF3lQy3FToMGFSkf5
	pneuPrSaoTaotJj3hobuazpgMjcBml0t3nUF0zUPIsDTtuAGJOh5Txn4Cti21i+hFIZ6Le0r9y82C
	xzmKZeTXrbYa/zdmmyvkJo52q4+AMYUrD88lkoJi0tvdDE/Vs3VZjIWP/sJ3Fzk85rnfMh+WilMWs
	Bsh6dlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSc56-00000005sgN-1mWw;
	Thu, 28 May 2026 14:51:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSc54-00000005sfl-0fpW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:51:31 +0000
Date: Thu, 28 May 2026 16:51:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779979886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tes9eETmhbrfgk7DfFhxjNPU/OcGWQZ/gxVtYb53dAs=;
	b=HQ+ecjefrhd3lKo7MeHDceYtACK026uCjbf8UALWbQ/+35vdGKaVpFiGU4woUFbHWXfBeM
	5tjZ9jrXOQOoqaTQG5a/b6jHNqMiTqr0qqNlVydmxNAoPSwDt/oUZE0Vfe+jPgzwcapJMn
	aicr1TsHin+oCcoopW3W/6nELXTACXHoR82yyUmaoTociOHgmiSTu+3u1ReKsMTEkhALxT
	Gygk4jplKr+IHFFpLO8ECxXBZ+TWwrwDiebG3GhMk1iVpm96h1ju/uoFYsWfDpXrEBwrMA
	Zl2qgUgHzAYn5NJuptua0lMfoVZn2zQDFeBxtz371ZO09OHKFlrZoTGjajIFWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779979886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tes9eETmhbrfgk7DfFhxjNPU/OcGWQZ/gxVtYb53dAs=;
	b=EcyQZcyvPwqkHd0bsycUUrYzpTPcKbm8V+X8RafeKTe+8lwAhygLrg9Uc9VH4m/j4HDMeE
	oxoP4RPvZDUcwWBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <20260528145124.v9o6OcOc@linutronix.de>
References: <20260519222524.886454-1-longman@redhat.com>
 <20260520061920.XCqBHe0x@linutronix.de>
 <a5251664-2c15-4a8e-906b-d204e10c38be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a5251664-2c15-4a8e-906b-d204e10c38be@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_075130_339925_2DE74464 
X-CRM114-Status: GOOD (  11.21  )
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

On 2026-05-20 17:01:00 [-0400], Waiman Long wrote:
>=20
> On 5/20/26 2:19 AM, Sebastian Andrzej Siewior wrote:
> > On 2026-05-19 18:25:24 [-0400], Waiman Long wrote:
> > > Commit d8bb6718c4db ("arm64: Make debug exception handlers visible fr=
om
> > > RCU") introduces debug_exception_enter() and debug_exception_exit()
> > > where preemption is explicitly disabled. With a PREEMPT_RT debug kern=
el,
> > > the following bug report can happen.
> > =E2=80=A6
> >=20
> > What kernel is this? I have backport (which is being tested) for v6.6
> > and v6.12, the patches are from v6.17-rc1.
>=20
> The kernel backtrace is produced using the latest v7.1-rc4 kernel. There =
are
> a number of changes to the debug_exception_enter() and
> debug_exception_exit() functions over the years, but the preemption disab=
le
> code remains since its introduction in v5.3.

Let me look at this again.

> BTW, what v6.17-rc1 patches are you talking about?

https://lore.kernel.org/all/20260528144825.850351-1-bigeasy@linutronix.de/

> -Longman

Sebastian

