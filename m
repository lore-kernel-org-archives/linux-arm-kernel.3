Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012E0EFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljHNVjrQPTeL1smxXsNRDrNvvI88tAHz0REgyCrUbZE=; b=xFmk97I4e2/v6wy32ozIlWM7e8
	BnEMqR9oFOkBoPLwWiXxO0sDZegfoKEjeqt160xYPwigBqx3wUeH7OauFwBwbuO/FJyj/clMT1449
	rXxhCZ2tJIyVQaXkKMor4/jxwz+yO4UqzjROrAlSHB7EojGJ0AX1MhV2nt0U6z+IdclozPENpM7pZ
	ddRJMoAfKJgmKHkC8Ev+/uI6lwYIxkfNZQ+Zv6vyovkcjjUtE3qit3T16793PSQO05+un2Q5JyYZo
	MQyUiyl9RA7Zi+9Mn6+8l0HB/H2XyZUNjuSrLYUenaK2gP0fli8lYEPRxgCGuYS6nFGufo9BcE4VY
	CbBxdoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxr0m-00000000LGK-2rQD;
	Wed, 04 Mar 2026 18:31:56 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxr0k-00000000LFY-12CE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:31:55 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 624IUfCb1282071
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Mar 2026 10:30:41 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 624IUfCb1282071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772649044;
	bh=ljHNVjrQPTeL1smxXsNRDrNvvI88tAHz0REgyCrUbZE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UBcPyiSjjdnc8u1gNm87gwC/Er0xhMwNBV1m2zZ+o+XgCspHTxXnYoyIzHym2/l4v
	 LAMVfwfC9TEBHNfDK3cZDDckk6EZTO3c4wMWGYx+aIeWu3wwSMTg1BF2mr0c9hua9m
	 hhochLIfnTPq4UNrw53Y3+7EdXSR8kyrwSdK2afFrW0Cgn8gQjyS1qCvj+mlcEDaIL
	 skh1+MAfpYjdw6H15iV6N/LRGfuX+6a6/KXr6dR+//0WTs35oexlXE6fzobAf7zMuO
	 prQ2ReLjhkk0x5duyIKv/HxPQuZFYCs8H7lVT7hdsyqeAsQ0nhyDT+NmofYCM9ChyA
	 jIXH41IMvCKGw==
Date: Wed, 04 Mar 2026 10:30:34 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
User-Agent: K-9 Mail for Android
In-Reply-To: <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
Message-ID: <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_103154_308710_C6D4D68C 
X-CRM114-Status: GOOD (  23.92  )
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

On March 3, 2026 11:35:52 PM PST, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssc=
huh@linutronix=2Ede> wrote:
>On Tue, Mar 03, 2026 at 10:11:52AM -0800, H=2E Peter Anvin wrote:
>> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>> >>>
>> >> The thing about gettimeofday() and time() is that they don't have
>> >> a 64-bit version and libc implementations are expected to call
>> >> clock_gettime() instead=2E The result was that there was never a
>> >> patch to turn the off either=2E
>> >=20
>> > gettimeofday() is currently the only way to get the timezone of the k=
ernel=2E
>> > But I guess this is a legacy thing anyways=2E If you say we should dr=
op it,
>> > let's drop it=2E
>> >=20
>>=20
>> The time zone in the kernel has never worked anyway, as it would requir=
e the
>> kernel to contain at least the forward portion of the zoneinfo/tzdata t=
able in
>> order to actually work correctly=2E The only plausible use of it would =
be for
>> local time-based filesystems like FAT, but I don't think we bother=2E
>
>sys_tz is currently used by a bunch of drivers and filesystems (including=
 FAT)=2E
>It is also used when writing to the RTC=2E
>
>> A bigger question is whether or not we should omit these from the vDSO
>> completely (potentially causing link failures) or replace them with stu=
bs
>> returning -ENOSYS=2E
>
>I am a bit confused here=2E You mention 'link failures' and in another ma=
il
>'weak references as fallback'=2E Both are things that happen during linki=
ng
>('link failures' could also be interpreted as failures during loading)=2E
>Somewhere else someone also mentioned the vDSO to be 'linkable'=2E
>But as far as I understand, only libc interprets the vDSO, it completely
>bypasses both the linker and the loader=2E And libc already does graceful
>fallbacks to the regular systemcalls if the vDSO is missing completely or
>lacks one of the functions, as both cases may happen on normal systems=2E
>
>What am I missing?
>
>
>Thomas

Weak references would be a way to work around the link failures=2E=20

At least in practice the RTC timezone should be managed from user space=2E=
=20

As I said, managing time zone information in the kernel correctly (beyond =
"right now", which can be dealt with by an external daemon on discontinuiti=
es; maybe systemd does that) would require far more than settimeofday() pro=
vides=2E

Downloading a binary zoneinfo (TZif2) blob into the kernel certainly isn't=
 out of the question and would solve this issue correctly once and for all;=
 a single zoneinfo blob is (currently) slightly below 4K in size, and the s=
tock interpreter is about 14K, which, even if we can't strip out any additi=
onal functionality we don't need, is more or less a drop in the bucket thes=
e days=2E

    -hpa

