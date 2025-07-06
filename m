Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5F9C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaMWKZFSACMkJF/x1KbPma+33xBrwS00+hXmnNdOlm4=; b=iBnZoW07bdTPzQrdfJVSqwDkXg
	qwPhsu4ji0xxtu6uKzJOwNLCFkElYaTWB6BPFRKoNVJvuMI8eHXuTnO1Fn0WK0fxEqZvvjILzowof
	GK1q/8WnL0cofUP3Utd95g0mBfRW1q/gJ1CugRUK6OsFcXIcI87unp6UazCVPGBc5D/ENSUksBdZ1
	R8dP5AjfLWrBaX07SZsoLV/7odI+N45FJTscagTSD8WqVCZXGABTe8Cicosrp6DBVEvOvAZTmvx2B
	s36xoaQdBkxaD2X5KaRG0lUXbfB9OlGb4v4HycEBt+31JGwXtfQuQ/TWWV1h1Y1tTvpKMtzHTjtQc
	4BNMxCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYWFd-00000000o4i-36Pi;
	Sun, 06 Jul 2025 20:46:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYWDJ-00000000np2-1NJG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 20:43:54 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751834629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaMWKZFSACMkJF/x1KbPma+33xBrwS00+hXmnNdOlm4=;
	b=lOvOH69SMeJW7XSU1i1qeC+GJkPScm498GO4iFaSQnJrYk2vNxV/I7wB1kMmczG+RjC+t1
	sNTvAh2sma9xtPJtUByMPzUQU7sfALHJohE9wBzet0Vi6NkSa3S9lQLkUpZLgFJZjDVCD6
	GU3kiEXwCgiNFzdOqgQS371mJOvFfq2pBWdd3XtwXX2avFcBKiZ3CCGPFEcKieZyuFIQf+
	RGvSp1jXATV3jDDrg1boqA6lqFKQLfbP/ZM1gyO4wLth/d2BMk4vOc2ZuZaM9xIvPRyL08
	hTT/UrHp57vdURrhLTDmiD+T2zAmuGcaWl26379BmLp1OftfaZuRklq7eaO06g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751834629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaMWKZFSACMkJF/x1KbPma+33xBrwS00+hXmnNdOlm4=;
	b=CkG1J0EjBS5wGsQmH1a+QFjhkr4r3k8slMTxfndI7cdIdNcYOoj6TC7QYpZ7wdngy3rrtK
	f3AzK+33Zy0wMeCw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski
 <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah
 Khan <shuah@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, Christopher Hall
 <christopher.s.hall@intel.com>, Frederic Weisbecker <frederic@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Miroslav Lichvar
 <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, David
 Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, Kurt
 Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, Antoine
 Tenart <atenart@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 13/14] Revert "selftests: vDSO: parse_vdso: Use UAPI
 headers instead of libc headers"
In-Reply-To: <20250701-vdso-auxclock-v1-13-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-13-df7d9f87b9b8@linutronix.de>
Date: Sun, 06 Jul 2025 22:43:47 +0200
Message-ID: <87a55hrqws.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_134353_506564_CA305C5D 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 01 2025 at 10:58, Thomas Wei=C3=9Fschuh wrote:
> This reverts commit c9fbaa879508 ("selftests: vDSO: parse_vdso: Use UAPI =
headers instead of libc headers")
>
> The kernel headers were used to make parse_vdso.c compatible with nolibc.
> Unfortunately linux/elf.h is incompatible with glibc's sys/auxv.h.
> When using glibc it is therefore not possible build parse_vdso.c as part =
of the
> same compilation unit as its caller as sys/auxv.h is needed for getauxval=
().
>
> In the meantime nolibc gained its own elf.h, providing compatibility with=
 the
> documented libc interfaces.

I'm kinda surprised to find this here in this series. Isn't that commit
c9fbaa879508 obsolete since nolibc got it's own elf.h?

So this should just go straight to Linus, no?

Thanks,

        tglx

