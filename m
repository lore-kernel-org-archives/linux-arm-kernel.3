Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA106C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 05:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQh1DInxbfOA81mONPPipgpqdwiFZ+9PeQ0qSReXUEY=; b=eq1t7p3MCx6l28P0WFgmnXVXK7
	KPenni+ty4vG7GZCLqrgWRTd3in+qz87kJNrAP/0sj+Yt0kZ635vUADHT9hRsqAmsLCwjT908lPHZ
	yoBckcd0D7lwKiOWBv3UX1Ts7sp50bOby5QiYlg9f2CO7bRT6bnvRUOWIIHb5ojvcvyEfu7Q6nwOb
	RM+VKiimjGdhjqtCCWDYiBP1OuChtjid7mwuX1wZRJH3qA1DxeEwrKOrU9JLJs8fRC9AGf1H3wo9w
	FkRK5bcSsoG3TauAIlEPiIbcSxK/VY5KzeNxWsezfQJDx5BTrIL8HX2EcqUckaEGB+2ArulQe+RnA
	nyTEyHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZk3B-0000000Ak6m-25zN;
	Thu, 10 Jul 2025 05:42:29 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjtc-0000000AjLj-0LOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 05:32:37 +0000
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 56A5VD0w409123
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Jul 2025 22:31:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 56A5VD0w409123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025062101; t=1752125475;
	bh=CQh1DInxbfOA81mONPPipgpqdwiFZ+9PeQ0qSReXUEY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UZtpJDyY0O7zpLI46+afIFDPGTxicGDP5fvGUB8m4RMhn9cHwI0R+GHNT0AKpxNfx
	 t6Pw1pdlDE+7fB6TOn/GWTKlrd0SXt6e6wUteOoCiDCqyhEkAh9A1GbdtI78ilGRSq
	 d+cD61d6QF539bDzPSi4LXpUhpF3mJyZOq+NMUXTlPpvdEy6oYdjcX56K5wyPmDIG7
	 0EoDScUMuLImo9dLMrbgJhQPPugqNm64uHQRAL6lw/17BNapD7Otf6phO1a5PZDcxn
	 6NItttWq5qkxG0SToUdZnGvrCIAUhgHWZdX89R8kylXPNXMBH3XlLDcdQe+toELCEb
	 vwu2G4cUcFKLA==
Date: Wed, 09 Jul 2025 22:31:11 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: dan.j.williams@intel.com, Peter Zijlstra <peterz@infradead.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
        linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, gregkh@linuxfoundation.org,
        Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
        Yushan Wang <wangyushan12@huawei.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
User-Agent: K-9 Mail for Android
In-Reply-To: <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com> <20250625085204.GC1613200@noisy.programming.kicks-ass.net> <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com> <20250625093152.GZ1613376@noisy.programming.kicks-ass.net> <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <3EAB3F81-D98C-4E4A-8E44-DB067547B318@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_223236_114075_BFAAAF68 
X-CRM114-Status: GOOD (  30.29  )
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

On July 9, 2025 10:22:40 PM PDT, dan=2Ej=2Ewilliams@intel=2Ecom wrote:
>Peter Zijlstra wrote:
>> On Wed, Jun 25, 2025 at 02:12:39AM -0700, H=2E Peter Anvin wrote:
>> > On June 25, 2025 1:52:04 AM PDT, Peter Zijlstra <peterz@infradead=2Eo=
rg> wrote:
>> > >On Tue, Jun 24, 2025 at 04:47:56PM +0100, Jonathan Cameron wrote:
>> > >
>> > >> On x86 there is the much loved WBINVD instruction that causes a wr=
ite back
>> > >> and invalidate of all caches in the system=2E It is expensive but =
it is
>> > >
>> > >Expensive is not the only problem=2E It actively interferes with thi=
ngs
>> > >like Cache-Allocation-Technology (RDT-CAT for the intel folks)=2E Do=
ing
>> > >WBINVD utterly destroys the cache subsystem for everybody on the
>> > >machine=2E
>> > >
>> > >> necessary in a few corner cases=2E=20
>> > >
>> > >Don't we have things like CLFLUSH/CLFLUSHOPT/CLWB exactly so that we=
 can
>> > >avoid doing dumb things like WBINVD ?!?
>> > >
>> > >> These are cases where the contents of
>> > >> Physical Memory may change without any writes from the host=2E Whi=
lst there
>> > >> are a few reasons this might happen, the one I care about here is =
when
>> > >> we are adding or removing mappings on CXL=2E So typically going fr=
om
>> > >> there being actual memory at a host Physical Address to nothing th=
ere
>> > >> (reads as zero, writes dropped) or visa-versa=2E=20
>> > >
>> > >> The
>> > >> thing that makes it very hard to handle with CPU flushes is that t=
he
>> > >> instructions are normally VA based and not guaranteed to reach bey=
ond
>> > >> the Point of Coherence or similar=2E You might be able to (ab)use
>> > >> various flush operations intended to ensure persistence memory but
>> > >> in general they don't work either=2E
>> > >
>> > >Urgh so this=2E Dan, Dave, are we getting new instructions to deal w=
ith
>> > >this? I'm really not keen on having WBINVD in active use=2E
>> > >
>> >=20
>> > WBINVD is the nuclear weapon to use when you have lost all notion of
>> > where the problematic data can be, and amounts to a full reset of the
>> > cache system=2E=20
>> >=20
>> > WBINVD can block interrupts for many *milliseconds*, system wide, and
>> > so is really only useful for once-per-boot type events, like MTRR
>> > initialization=2E
>>=20
>> Right this=2E=2E=2E But that CXL thing sounds like that's semi 'regular=
' to
>> the point that providing some infrastructure around it makes sense=2E T=
his
>> should not be=2E
>
>"Regular?", no=2E Something is wrong if you are doing this regularly=2E I=
n
>current CXL systems the expectation is to suffer a WBINVD event once per
>server provisioning event=2E
>
>Now, there is a nascent capability called "Dynamic Capacity Devices"
>(DCD) where the CXL configuration is able to change at runtime with
>multiple hosts sharing a pool of memory=2E Each time the physical memory
>capacity changes, cache management is needed=2E
>
>For DCD, I think the negative effects of WBINVD are a *useful* stick to
>move device vendors to stop relying on software to solve this problem=2E
>They can implement an existing CXL protocol where the device tells CPUs
>and other CXL=2Ecache agents to invalidate the physical address ranges
>that the device owns=2E
>
>In other words, if WBINVD makes DCD inviable that is a useful outcome
>because it motivates unburdening Linux long term with this problem=2E
>
>In the near term though, current CXL platforms that do not support
>device-initiated-invalidate still need coarse cache management for that
>original infrequent provisioning events=2E Folks that want to go further
>and attempt frequent DCD events with WBINVD get to keep all the pieces=2E

Since this is presumably rare, it might be better to loop and clflush, eve=
n though it will take longer, rather than stopping the world=2E

