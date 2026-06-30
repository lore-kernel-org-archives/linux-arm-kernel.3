Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C4FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LdR2VibH2njnBU1uMocI4RPYCENH1tmdqLS48/1hGo=; b=sfB0qfaMvip/MK16H9J7SSnyqz
	oRxaWx1pbcERILtRf7aTIxv/TOaabHd1h2Vz0LYBxOe/SfcvGCgGEvaX50pAMNATheGalQsx0YYgN
	2/udxCfcYP/bcWgPwwD2DO6j8eodBZXuDrzlNiFW12VeJtzNKAcbD3Gus0ujGHXoiyQTlObgK+451
	6eF4Uj6VceZ4MTeVIURF1GJnOF6HhLnJUWZW1JpbjPSs0VK/P8IBtpHcbZSA9QNOILFk0DnXRHzgS
	eprklUZZIgIHhk9piyG0i7Ei2A4emtNDoX0wYvbCtQsiUpQHLTxbUy5pW5f8YuE6TCbHvgaKUBw0G
	uTJKcPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYLD-0000000H8Zy-3XWe;
	Tue, 30 Jun 2026 13:17:31 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYLB-0000000H8ZQ-0F9E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:17:30 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B019FEC00B6;
	Tue, 30 Jun 2026 09:17:27 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 30 Jun 2026 09:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782825447;
	 x=1782911847; bh=4LdR2VibH2njnBU1uMocI4RPYCENH1tmdqLS48/1hGo=; b=
	WISo7c+kpKV/nDh5yqQVPHu+c6g1rKFZM6Dae3bT2ElcSB32bHiHAi3sDJyNG2j5
	77ogskDL11g6tnQKg2CksDeaNZt0Bc9iRHF9JKbsM/Bra65ApmNTmgSWPNCgMkYI
	yMvyRQfOPT/8pUEcScN/jF1vH70x5ntGIeifFsoU0QdsLGHQFP7dfq0s/e8jXIAK
	Ty5HAF7AGOusNNLI2h89cTnfQsI3VBQEhLYV0zujPtxQ7nyoJXhl/LCIWdxsbmiP
	2chi6r8nAEc7eU7v487lw992yjmjfOmo8gTeArcMZQXj+x4PVPbpvmpaoc0Clyre
	OzRIaSeSqhRGdO7MEImG0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782825447; x=
	1782911847; bh=4LdR2VibH2njnBU1uMocI4RPYCENH1tmdqLS48/1hGo=; b=R
	zmWZ+ZshVCb8nMtSffsknxV+SylqMf3qhC3YgzZF6QD9djKhoDQQesAdbdgENJ12
	doHte+3Of3YE2nwuDq/rz93rYg8KuDttuWi1NkGq4wYCagNjiQOg37GCmy861Swq
	cXQFNZMwzAhRjRe5jECnjqD07xFI2pNgIsfhMhBevux3kxi/nF9kM70RLyCZAwty
	T+cWzfNkkFYdVGifENXXTZ1PHKIivwIjjMmrQmAuTXWVOY3iNOEezwEmgXELFBaK
	sxkCmkgKULqYSedZ7/CzCkKmcnXUpDZLWXZbv/klqIhy60CnfhnMBl8M7/pHcAbR
	rTq2MqfnJJ5JFfZI67HIg==
X-ME-Sender: <xms:5sFDavS71utmq9yzuWzZsNDxBe71ZnZrxkkGEyBmFxbsxJ4cn7I10g>
    <xme:5sFDarkSyg9Li02US6EG-qUs51lbo0df0ElbnJafdL9a196f9RbDmnybEF_ebM5QI
    wBVdljj0l5T2xs6B8oG_lSX8Q1MgBudnD73Ad0IuUVxyya0uDrXIw>
X-ME-Proxy-Cause: dmFkZTF+NSnu+XaOspE2EihAi3NXS0A1r/m8N6lhdEMhD0xW2+drSOkZ9tBmgDcRwUzvdo
    fbt9CkRI6f0YJAVEYT0rbp/vQpJri2O9Sm8bYbXkc6i7B6SllqtSf5YBNdpvpzOMVdXPHo
    o7N5gCjwFrRUJXZ3ks3+akis0HfacElviYZrR1oqy5QCkPBJ4J1s44pu8+qfLZ1vz4dWkp
    zrp7A/wycXK65nL/2bNbmldrKAgL0uveO8Bj2e3Fjbc5bgFxzQ29X3dG6Ye/+jqlnpzPqc
    +SiDsZb9ec8Jq4g7MzCHMaoVbk3jxvjn3s80dBpd0ge/BOmK5cKZZ2RVuxIN2QABFXBfmG
    5kGcc8bX8B8F3Ckx66skCWUtb5d3A4quZ/B7La/HXlANAvu1G+JPQ1QN11mKKTOC1oR29z
    iJKln3+yTtbSsT/GJJ44BaLKFukCfdNW9YjOxuD4jMEIjG4VdKtC6lLKbOCw3M6hnEpVjM
    V+eQwt8ala5H2xQv9bfHqm1JOCdBsUcMto9OhOW9mrsZtjTpqDoF/1Ni+XcK4wdThLNSi4
    3Gk8MDuK3sI7umIyHFlZP1Yki2GFoSx5jnurMr/h4Hp7OLKjlS4EeMqREWoc3jSpXPWJJZ
    JXlWfmDjBH66SygB3F3PK3FtPAnhI4f56UvXC0MtkBTIUNbT2qQTSX+1Nf8g
X-ME-Proxy: <xmx:5sFDaqQcINTUh7B0nwmgxo9m0oJWuch2SY5GtFFIpxf_TLExRFAFNg>
    <xmx:5sFDaibJjF4RD04j7mFk3FUHKtqvddnNvah6NSdg8Jmb-DlaE5N_Og>
    <xmx:5sFDanV3y3vIyOk_QBnSyKd1xsVYg7wYLjV7lXf_iqMYiEuB1I9Eiw>
    <xmx:5sFDanXuVsgENA-PnojmDfkGI3iOqFr6uC5y4PlJV88_NqV8t1-LRQ>
    <xmx:58FDaoyuiRZyNi3pfjiAdFEgVVf5SFfYa7o-Jjr-fZmj6n6f8IqCoDxN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD88C182007E; Tue, 30 Jun 2026 09:17:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALm-NtMBapr3
Date: Tue, 30 Jun 2026 15:16:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-api@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <965a922e-e7f2-4399-8c63-a5f4bbd6b338@app.fastmail.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
Subject: Re: [PATCH v2 0/9] vDSO: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_061729_161578_89F5DA6B 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, Jun 30, 2026, at 09:38, Thomas Wei=C3=9Fschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality. This is the intended
> effect of the kconfig option and also the fallback system calls would
> also not be implemented.
>
> Currently the kconfig option does not affect the gettimeofday() syscal=
l,
> so also keep that in the vDSO.
>
> I also tried to introduce some helpers to avoid much of the ifdeffery,
> but due to the high variance in the architecture-specific glue code
> these would need to handle they ended up being worse than the current
> proposal.
>
> As a side-effect this will make the self-tests more reliable,
> as there is now always a matching syscall available for each vDSO func=
tion.
>
> clock_gettime_time64() was only introduced in v6.19, so libc implement=
ations

   ^ clock_getres_time64()

> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

once we have consensus on my patch 1/9 comment. Thanks for
continuing this work!

      Arnd

