Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EC6C83F24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHHMCaeqa3ItN0IdhB57c8hhMJMuVoReCsE7UCNIal4=; b=Ve4DeGJHtFswS5jZWFFewE6jP8
	4V3QS74oLZRbJcQupYVMBG955+Q5NNRd5U52mUCjoJnqtZ3H1K6Jxyxg0AaxfwNL4JkRU5y8vUC5O
	20qKnQfGizjxQmU1Z40YDf40ZLj00qIcquAsPOGDL8UecpdqmJxjMufTJ0StjuDzSFqa5DOdOlxBH
	tWgOFzOmgRorrpLO8JmF8h/EKwzOjKwPXvxk1gkrEuFQ0MgincspryQehoOxbwULAxbQMGCRCzeWj
	es2JA71P4+yX4xwHHxIf/Dztk9PPe//PB72u8DVTClIHh8XEHsyQIToQbmIBpuMkSxqjl7E+chwhj
	Cp/5HigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHy-0000000Cz0y-2h1I;
	Thu, 10 Jul 2025 20:54:42 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwRX-0000000Ckwz-1MTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 18:56:28 +0000
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 56AItXe4768856
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Jul 2025 11:55:34 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 56AItXe4768856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025062101; t=1752173735;
	bh=VHHMCaeqa3ItN0IdhB57c8hhMJMuVoReCsE7UCNIal4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=frt+T+ZaeHOU5+grV1JCbpKos7M5bBqjph3654o1y7phYKwQfJ56+GDy8KNryK8B9
	 XF2XuNuAABlhHhXW6fYJQLupzUof4nSKjKrhEjsEL35qhyfZVmkeQZVTH89pnSOq+U
	 kBtp64m7He32K7XBQnvn/+b2ktp+IKWKSyCA0ity2XZp1oE453fLiVLHeHJcG4u0q4
	 0G//nuisw6F0H9abazQkXmJZxXo+Sa2Lnk8gPh0vCepk2mHF2Uw2+NhXZh3+A/cCO6
	 uFIYPUSkQ8VouPb6FPWHZ2tDFL2g//rbNfp9FYNLkTeM5fCaiDsWlNrZNlmTJ0g1D0
	 XYwyrqszcEIDg==
Date: Thu, 10 Jul 2025 11:55:33 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: dan.j.williams@intel.com, Peter Zijlstra <peterz@infradead.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
        linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, gregkh@linuxfoundation.org,
        Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
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
In-Reply-To: <68700a5428a2f_1d3d1008b@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com> <20250625085204.GC1613200@noisy.programming.kicks-ass.net> <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com> <20250625093152.GZ1613376@noisy.programming.kicks-ass.net> <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch> <20250710105622.GA542000@noisy.programming.kicks-ass.net> <68700a5428a2f_1d3d1008b@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <575B5DF2-AE1D-43E9-9A4B-09FB78EFFC43@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_115627_358007_2D64F4CC 
X-CRM114-Status: GOOD (  22.07  )
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

On July 10, 2025 11:45:40 AM PDT, dan=2Ej=2Ewilliams@intel=2Ecom wrote:
>Peter Zijlstra wrote:
>> On Wed, Jul 09, 2025 at 10:22:40PM -0700, dan=2Ej=2Ewilliams@intel=2Eco=
m wrote:
>>=20
>> > "Regular?", no=2E Something is wrong if you are doing this regularly=
=2E In
>> > current CXL systems the expectation is to suffer a WBINVD event once =
per
>> > server provisioning event=2E
>>=20
>> Ok, so how about we strictly track this once, and when it happens more
>> than this once, we error out hard?
>>=20
>> > Now, there is a nascent capability called "Dynamic Capacity Devices"
>> > (DCD) where the CXL configuration is able to change at runtime with
>> > multiple hosts sharing a pool of memory=2E Each time the physical mem=
ory
>> > capacity changes, cache management is needed=2E
>> >=20
>> > For DCD, I think the negative effects of WBINVD are a *useful* stick =
to
>> > move device vendors to stop relying on software to solve this problem=
=2E
>> > They can implement an existing CXL protocol where the device tells CP=
Us
>> > and other CXL=2Ecache agents to invalidate the physical address range=
s
>> > that the device owns=2E
>> >=20
>> > In other words, if WBINVD makes DCD inviable that is a useful outcome
>> > because it motivates unburdening Linux long term with this problem=2E
>>=20
>> Per the above, I suggest we not support this feature *AT*ALL* until an
>> alternative to WBINVD is provided=2E
>>=20
>> > In the near term though, current CXL platforms that do not support
>> > device-initiated-invalidate still need coarse cache management for th=
at
>> > original infrequent provisioning events=2E Folks that want to go furt=
her
>> > and attempt frequent DCD events with WBINVD get to keep all the piece=
s=2E
>>=20
>> I would strongly prefer those pieces to include WARNs and or worse=2E
>
>That is fair=2E It is not productive for the CXL subsystem to sit back an=
d
>hope that people notice the destructive side-effects of wbinvd and hope
>that leads to device changes=2E
>
>This discussion has me reconsidering that yes, it would indeed be better
>to clflushopt loop over potentially terabytes on all CPUs=2E That should
>only be suffered rarely for the provisioning case, and for the DCD case
>the potential add/remove events should be more manageable=2E
>
>drm already has drm_clflush_pages() for bulk cache management, CXL
>should just align on that approach=2E

Let's not be flippant; looping over terabytes could take *hours*=2E But th=
ose are hours during which the system is alive, and only one CPU needs to b=
e looping=2E

The other question is: what happens if memory is unplugged and then a cach=
e line evicted? I'm guessing that existing memory hotplug solutions simply =
drop the writeback, since the OS knows there is no valid memory there, and =
so any cached data is inherently worthless=2E

