Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADFBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 21:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dK3+vVfqOJwgcvbSOXlTrXE17g//6OeCs7hq/OKo4hU=; b=ox9rj2WuTt/o81ePQvHiD20BIg
	PnSfH4BiWaCP6B6fT5sSxOOZ3MZOkKQ5GRSL5HFSQCy0T6HcBc3VNlGfy0j6tJrPNdLdutxA7oLHx
	ykBvsHminjY2h4MRsar/r34t29pqrnJAT/fo4ZPk8Klc0f4e7uorXCkC2Nf7jvIYU22pqvSUSi1qs
	jQ2VFHwTX8rOHBK1rUj4Bp9Cj1vNaWZZQIdt4nYsGQBPHPbphzfggLwnUa4VBAMSi+2kdCXc9CNs1
	k/Nl+FQG0o+xvZ5vwXqfzK1hKZhbvXRluH+w8oyMHyH6D5wqBsYOtMtwm7kY8q/7hK4zm9zEtRKv2
	bAunmSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZySH-0000000D1j3-0CVE;
	Thu, 10 Jul 2025 21:05:21 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwlk-0000000Cnvw-3gMX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 19:17:21 +0000
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 56AJGXME778639
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Jul 2025 12:16:34 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 56AJGXME778639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025062101; t=1752174995;
	bh=dK3+vVfqOJwgcvbSOXlTrXE17g//6OeCs7hq/OKo4hU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=H+2YFCTnw5z6ZLmuZ9B1BVWch1D/9ZhhVQGNSyZbDzQrCCeVVzHocaCB1sQi4QU9r
	 0C7ngFQOxCuhCK+pcoHRI+6BB6C8lJ+vTL5qIPXuMNidq+Mqe4sCI6TX74RFBOwba2
	 vtVKDGjVg5M0FIXvySLLNsmT+JOjBN45GKe97AOAYfPpsWgNXzUPSepEbr2jmaRovM
	 ck1NS7DVSImoOUSNby0QoW+XP/8Z1TSEFUdvPKEwZdEV6dfXhdXJMi717yROJRIbEJ
	 d1PaNAZeAHojU682AVXBZ2cfMBYha32WzVsXtbTSuT7T46yVhu/ug35jtxbCOVOA2K
	 +zI/CfaUj+IPg==
Date: Thu, 10 Jul 2025 12:16:33 -0700
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
In-Reply-To: <68701051ec185_1d3d1001d@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com> <20250625085204.GC1613200@noisy.programming.kicks-ass.net> <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com> <20250625093152.GZ1613376@noisy.programming.kicks-ass.net> <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch> <20250710105622.GA542000@noisy.programming.kicks-ass.net> <68700a5428a2f_1d3d1008b@dwillia2-xfh.jf.intel.com.notmuch> <575B5DF2-AE1D-43E9-9A4B-09FB78EFFC43@zytor.com> <68701051ec185_1d3d1001d@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <4CA4EB2A-8F45-4596-ADB9-B0C2307316B1@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_121720_909956_B189C124 
X-CRM114-Status: GOOD (  19.00  )
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

On July 10, 2025 12:11:13 PM PDT, dan=2Ej=2Ewilliams@intel=2Ecom wrote:
>H=2E Peter Anvin wrote:
>[=2E=2E]
>> >> > In the near term though, current CXL platforms that do not support
>> >> > device-initiated-invalidate still need coarse cache management for=
 that
>> >> > original infrequent provisioning events=2E Folks that want to go f=
urther
>> >> > and attempt frequent DCD events with WBINVD get to keep all the pi=
eces=2E
>> >>=20
>> >> I would strongly prefer those pieces to include WARNs and or worse=
=2E
>> >
>> >That is fair=2E It is not productive for the CXL subsystem to sit back=
 and
>> >hope that people notice the destructive side-effects of wbinvd and hop=
e
>> >that leads to device changes=2E
>> >
>> >This discussion has me reconsidering that yes, it would indeed be bett=
er
>> >to clflushopt loop over potentially terabytes on all CPUs=2E That shou=
ld
>> >only be suffered rarely for the provisioning case, and for the DCD cas=
e
>> >the potential add/remove events should be more manageable=2E
>> >
>> >drm already has drm_clflush_pages() for bulk cache management, CXL
>> >should just align on that approach=2E
>>=20
>> Let's not be flippant; looping over terabytes could take *hours*=2E But=
 those are hours during which the system is alive, and only one CPU needs t=
o be looping=2E
>
>Do not all CPUs need to perform the invalidation for L1 copies of the
>line?
>
>Not trying to be flippant, but if wbinvd is only a one-shot per Peter's
>proposed policy and the system experiences another CXL reconfiguration
>event, then looping is the only option or fail the memory plug event=2E
>
>> The other question is: what happens if memory is unplugged and then a
>> cache line evicted? I'm guessing that existing memory hotplug
>> solutions simply drop the writeback, since the OS knows there is no
>> valid memory there, and so any cached data is inherently worthless=2E
>
>Right, the expectation is that unplug is always coordinated and that
>surprise unplug is unsupported / might lead to system instability=2E
>
>

CLFLUSH goes through the cache coherency protocol and is therefore system =
wide, which WBINVD is not=2E

