Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20665FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5jttNPZKFxy6e3UDlTOBng4frqdcf3GdkXXjwI4w+M=; b=kCmabTPtBoZpll4OFRLAA9EeCn
	AtRpTxUvGl3VHg5hlrnyKW3LE4Pgt5DFO9LAU3EpzgsAfn7x1/n/PICZWGkrnaeeKEh7FIN4nDjJb
	+8K76iiJzrzvtUgPFKvHwkPLl2QKIAUaMKOzPRvRSCD5eE24kZd+h4sAM2B0zITvx7LBaxjMeDQ1h
	YGdTJGHbbZscd+WpZrMAjt+TSZyz7RFEf0rPY5Ka3td4aKlRZA7KwzdP4cjCsPOQ4NbpaHcnBKVcL
	U8E38trA6z/Iz0vXc4vSCzHxPOApbnlO6UYMy/YZqVdL0uqaOty/OtWbWOS+xeQ/5bYQ/67nrBH2B
	ERCD7F1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycAm-00000004Uig-2rhT;
	Fri, 06 Mar 2026 20:53:24 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycAl-00000004UiK-0AZJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 20:53:24 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 626KqRb51958825
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 6 Mar 2026 12:52:28 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 626KqRb51958825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772830352;
	bh=t5jttNPZKFxy6e3UDlTOBng4frqdcf3GdkXXjwI4w+M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EQ2m+UyIgHt4NPpBkDK9oDRl5sriE4QzwZICCF14NYbr9o9jnA4P5x6Ki7PI/c1Pq
	 MuB2CVSSZ1iN8/dlczEbnC0/V+ODW0STv+tMDFCGAqTNta3kvUwK3wx7igCIxtYepf
	 WP4Xgt2sBbl4oyXlo1NEh/P7iQ1F8nGYKsh0x45/4ix+F4yHgCtkuzJkzYrwYPKOfj
	 ZGBQDFMVCSRv3f1XvPA5D4Ut5gSR5N9/iNyb0omf0tkCFi13Z6kw+SSDHf0RObIZBO
	 eFidDjr3ZT6lb7idOI/GLFTlUAcnpNsbe7YnJMV2SZmCjXKy6cCOrXgsYEUmxi7GJ3
	 06pqSMGXttJhQ==
Date: Fri, 06 Mar 2026 12:52:21 -0800
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
In-Reply-To: <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de> <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com> <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de> <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com> <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
Message-ID: <F10E5A68-4D63-41A5-B281-3AD52FF6F6D8@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_125323_086985_92DB8716 
X-CRM114-Status: GOOD (  17.40  )
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

On March 6, 2026 1:42:25 AM PST, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssch=
uh@linutronix=2Ede> wrote:
>On Thu, Mar 05, 2026 at 03:57:59PM -0800, H=2E Peter Anvin wrote:
>> On 2026-03-05 01:24, Thomas Wei=C3=9Fschuh wrote:
>> >=20
>> >> Weak references would be a way to work around the link failures=2E=
=20
>> >=20
>> > I am still not sure where "the link failures" should be coming from=
=2E
>> > The only sense I can make out of it, is if somebody manually and dire=
ctly links
>> > to vdso=2Eso=2E Like in the following example:
>
>(=2E=2E=2E)
>
>> > This actually works on glibc (not on musl)=2E But it is highly non-st=
andard and
>> > relies on multiple implementation details=2E Furthermore it can fail =
to run on
>> > systems without a vDSO, as mentioned before=2E
>> >=20
>> > Is this the usage pattern you have in mind?
>> > Do you know of anybody doing things this way?
>> >=20
>>=20
>> Yes, and yes, I do=2E
>
>Thanks=2E
>
>Do you know why it is done this way? Are these applications public and
>if so, could you point me to them?
>In case we stub out the vDSO functions with ENOSYS, would these
>applications be able to handle that error gracefully?
>
>Personally I am still in favor of removing these functions completely
>when !COMPAT_32BIT_TIME=2E
>
>
>Thomas

I think I agree with you (and sadly, no, I can't point at them directly=2E=
)

