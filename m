Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7722BE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k43J5anAB96Ch7IfLVC26goHMZDYKuV3hVA5bdHwPjc=; b=xrJovdxfxa0h9fi2dMurzM3JUb
	iBGnAfpqWoKEGE2kzBFoJX+cSy/MDzGEmRRTB+DcJ6a37FThzE22IlPwK/5b5SDr8nj24LKF/e3HO
	I/Kc5JoSiHtqf7SrhikVHpQvspukh9lxvwxDk7lccEj1JIHuzIiDncClopvyF/38TcH4f5y0O536J
	6tELa4NfJU80b6oCSEom2sPBlSdAYy3vOcB1v15IYkHnvgI4buUL3zECj6IWcGmKylD+k/vwCMirf
	pdYeP3M2cdQszHe2GQtrTQPl824msrbd2gxKH0jRbPeQ3gEZXb8T9p7K24dTrzal1srbE1/bVL2Wa
	cv96Jg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAam-000000011d9-0awc;
	Thu, 19 Dec 2024 07:05:04 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAZd-000000011Ik-0sQi;
	Thu, 19 Dec 2024 07:03:55 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id A81192003B4;
	Thu, 19 Dec 2024 02:03:49 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 19 Dec 2024 02:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734591829;
	 x=1734599029; bh=k43J5anAB96Ch7IfLVC26goHMZDYKuV3hVA5bdHwPjc=; b=
	oY/eWZPR2hoZOZEID//SUz40plFO0YmL/cDeTW7TVToY9wBGdc79QSqYm/3ZddWP
	+Th5hMXNmlvbAUs4xZsNDVpDtdM7JfAg3wPu/DpEK8xbSRjPm7xvrGYBe+D/RPr5
	uhBvghppkGDojAe9Sc7VdMaJzJvwWDn2yP1SzDpqjgeylzcD5rHha+sBf10Z8MUY
	zjfm122PgsBOKR0kHiwP5TRV3NXqtXgI94ycCBwNvW6SMx4sNtkjl2NCTDuO3GEu
	iKfUTsB4AbJSooNGUEabOjQIahs4jCKEhxVyNGATifNR+f3n3w+MTX/xutBM/8gb
	UBxrEYQCQfco5c4mIW21CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734591829; x=
	1734599029; bh=k43J5anAB96Ch7IfLVC26goHMZDYKuV3hVA5bdHwPjc=; b=x
	mVIewcrb+S5H9Li9t0EtG4J0oD/8yiqFu1YmmnOqwRgrgp9J5yPMWL8Rvxl1fuoZ
	NpoDGZDH8YCBHIu2prkjS8vgZ1vqCIabCOCUlGvuAIufD4Ous8eQIININ4VO9lVw
	5oZ77qqHBP1sYs1oduV+I8oTsihoTp8mJ8JBNCfft4os1YlVvfssjYddbR05S5qa
	jp9Onrs43lK4MxJGpdF3toNCpEh2AI1l/M1u8wIZnvPb613KhWovocwi+UBYD+wH
	5hhbjShUCWAzYPLG092kKaKD6vRVVA1SH4DmfNX2Qj6+vDBJR3iQl+bz4MrGsA3l
	xjUjyx4Pe4xatF866CFrQ==
X-ME-Sender: <xms:UcVjZ08o9oSr4vC-yWs_0rkX3tF_de-kiIiySpphPyx8XsVfKRVEXg>
    <xme:UcVjZ8s_0LfBT76dpGaKaKC5xNr7F44n3_6mhljodlJWfmRa80fVfIJed_f2dC3Ra
    cfcwMot3wYtb8tzXWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleelgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhope
    hvihhntggvnhiiohdrfhhrrghstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhi
    nhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthhhrihhsthhoph
    hhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepphgrlhhmvghrsegu
    rggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhi
    drvgguuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:UcVjZ6Djfy0CqQN4vTzFpZUghuE4c8_GRSujiFZOpqKobULrY7d6Fw>
    <xmx:UcVjZ0cXWSJU04bKlE7dy4vLBmwTvHF0ozAlW27OV-4AamEkxEZKtw>
    <xmx:UcVjZ5N3kO7cMmjcmc96BjTIos7f-PzF-xBfcJV5KR5s8w423K77xQ>
    <xmx:UcVjZ-mXW5UA98QDpStGWiYswp6ZnLl6BM4yXYMLy5PwKkxQmfIdZw>
    <xmx:VcVjZyNnjyvt_EgMYqaOa0zhC1TPcMH5UJqxxwhazRVa7nzB-KExPgbA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 84E632220072; Thu, 19 Dec 2024 02:03:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 08:03:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Conor Dooley" <conor@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Russell King" <linux@armlinux.org.uk>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>,
 "Nam Cao" <namcao@linutronix.de>
Message-Id: <0bdeda72-73e6-4749-8d54-66c7614a6f83@app.fastmail.com>
In-Reply-To: <20241219072552-7cd4512c-4f61-408a-9422-167a6f2810db@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
 <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
 <20241219072552-7cd4512c-4f61-408a-9422-167a6f2810db@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage implementation
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230353_965998_382BB840 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Dec 19, 2024, at 07:30, Thomas Wei=C3=9Fschuh wrote:
> On Wed, Dec 18, 2024 at 05:35:31PM +0100, Arnd Bergmann wrote:
>>
>> > There is precedence in providing 64bit only vDSO functions, for exa=
mple
>> > __vdso_clock_gettime64() in arm.
>> > I do have a small, so far untested, proof-of-concept patch for it.
>> > This would even be less code than the ifdefs.
>> >
>> > What do you think about it?
>>=20
>> Yes, simply exposing the normal time64 syscalls through vdso
>> should be fine. I think this currently works on everything except
>> rv32 and sparc32, probably because neither of them have actual
>> users that are able to test.
>
> Should it use the specific _vdso_clock_gettime64() naming or leave out
> the 64 suffix?

The VDSO function name should match the syscall name, with the '64'
suffix. Any syscall ending in _time64 uses the __kernel_time64_t
derived types, while the corresponding syscall names that don't end
in _time64 take a __kernel_old_time_t, which is defined as
__kernel_long_t and only 32 bits wide.

      Arnd

