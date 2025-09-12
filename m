Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE2ISEvWqh9sN8UYw61P33fDsnFm1/nb1kUiiX/ifUM=; b=C4258uw0HL5kDtAPpRJS9IA4Ld
	tQv7OnGTYPRmDCS4tSy+m6ViJlbMFRl+BHBTDjGuYdrpVDdYaXd4ov6Vkaw2YgDbClqxymuYcInTv
	+nBAL3pKb0s1qqQyPHiLAomh3KCMctQ43Onz0btD+879YH/5Qw/tV/r8/DUZtq8thMl00Rlr/j3S+
	/7fZReI5FL1gitd2pgAtcnYYsn5g3wcJemKrTEPvriRC2TjEW/6cr2vX5q594aVOyzj15uUdh4GqR
	/hMm7cNuLlETuv/6CNUJkZpNqBQWyi2bwgxiFr221u1u09zMNe/zky2yBva0b2id1VyfiZUQCYKaF
	GqoRNOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0E8-00000008KeI-2xi0;
	Fri, 12 Sep 2025 09:37:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0E7-00000008Kd8-1qoc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GE2ISEvWqh9sN8UYw61P33fDsnFm1/nb1kUiiX/ifUM=; b=TKWgCRGDn8spOI5yOU6/nmBhAl
	AExy2wjDAMKXXLM5JgxP/QB9Cw8Y+DaWSyvaYadjYx6muPWpji3UPhXxvWt0zIRv2CmM8Hh1wZ1vX
	tCCs2vYU19r4O24QCuKNtQBnusZVCHbtC6TkcYNHxfVWX1N2ntpcXPoVaLZ6p3BIUPLCulXmgq8jt
	cWGyYYhnwYe4calXY1T7lNqDNis8RAoNaHmVZ+ZHksIv5iAUxwYmTZ/31O5LVPkofVWwqvcZGI6Ol
	v6Ncr0XnHkSK3OL6s1DvROaQYnG7o1NhKgQEEQVJZUMV7OjRo+OTlkYC+FZ8u3SO3XodzPcT43RUE
	K9Xw+W8w==;
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0E3-00000006J4u-0D5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:37:54 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58C9b0xv1357625
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 12 Sep 2025 02:37:00 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58C9b0xv1357625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757669821;
	bh=GE2ISEvWqh9sN8UYw61P33fDsnFm1/nb1kUiiX/ifUM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=jxIBuKWBOuwi8Xn/pfTljgb3zhi4Bf+6TpFn4wY12CV2bo/HBYvEFlNNTSG8fPcmd
	 Jj/Tfu0GL4cwgOIGmCy3Nn+jkWh8vnC8zuP/GErTXN0RQ77TNqxFkI31NPKxEScs+g
	 3vOnPn4RJLBqsy4KnA1eIay9kM3VJsautov8wGzn+movTKqUP1FRL6RWjeOsUKd4W1
	 PzI9yWN2VGly1IKj7GF6C15ow1c72iThcEsS5Y7nUNwJIqldXBZ/Cz0CDjQetsdIXJ
	 cSf1aezna12azQgXZfQWWPOQrMR8BIbyp5qTPTfw3ynfjS2Z5IuCtNAHsMLsakvOcZ
	 RcYRHWLQ0/FWA==
Date: Fri, 12 Sep 2025 02:36:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        ksummit@lists.linux.dev
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com> <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com> <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
Message-ID: <0FEA041E-A07E-4259-AFBC-02906D122C3A@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_103751_487316_AC56A1AA 
X-CRM114-Status: GOOD (  31.59  )
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

On September 12, 2025 2:32:04 AM PDT, Andreas Larsson <andreas@gaisler=2Eco=
m> wrote:
>On 2025-09-11 09:53, Arnd Bergmann wrote:
>> On Thu, Sep 11, 2025, at 07:38, Andreas Larsson wrote:
>>>
>>> We have a upcoming SoC with support for up to 16 GiB of DRAM=2E When t=
hat is
>>> used in LEON sparc32 configuration (using 36-bit physical addressing),=
 a
>>> removed CONFIG_HIGHMEM would be a considerable limitation, even after =
an
>>> introduction of different CONFIG_VMSPLIT_* options for sparc32=2E
>>=20
>> I agree that without highmem that chip is going to be unusable from Lin=
ux,
>> but I wonder if there is a chance to actually use it even with highmem,
>> for a combination of reasons:
>
>I would definitely not call it unusable in LEON sparc32 mode with
>HIGHMEM gone, but it would of course be seriously hampered memory wise
>without HIGHMEM support compared to with HIGHMEM=2E In NOEL-V 64-bit
>RISC-V mode it will of course not be affected by these matters=2E
>
>
>> - sparc32 has 36-bit addressing in the MMU, but Linux apparently never
>>   supported a 64-bit phys_addr_t here, which would be required=2E
>>   This is probably the easiest part and I assume you already have patch=
es
>>   for it=2E
>>=20
>> - As far as I can tell, the current lowmem area is 192MB, which would
>>   be ok(-ish) on a 512MB maxed-out SPARCstation, but for anything bigge=
r
>>   you likely run out of lowmem long before being able to touch the
>>   all highmem pages=2E This obviously depends a lot on the workload=2E
>>=20
>> - If you come up with patches to extend lowmem to 2GB at the expense
>>   of a lower TASK_SIZE, you're still  looking at a ration of 7:1 with
>>   14GB of highmem on the maxed-out configuration, so many workloads
>>   would still struggle to actually use that memory for page cache=2E
>
>Yes, we already have patches for 36-bit addressing with 64-bit
>phys_addr_t=2E Patches for CONFIG_VMSPLIT_* are under development=2E
>
>Even with 192 MiB lowmem we have being using up to 4 GiB without running
>into problems=2E Could you elaborate on why you think lowmem would run ou=
t
>before 14 GiB highmem in a VMSPLIT_3G or VMSPLIT_2G configuration?
>
>And even if 14 GiB highmem would be hard to get full usage out of, for a
>board with 8 GiB memory (or a configuration limiting 16 GiB down to only
>use 8 GiB or somewhere in between) the difference between getting to use
>2 GiB and 8 GiB is quite hefty=2E
>
>=20
>> - If we remove HIGHPTE (as discussed in this thread) but keep HIGHMEM,
>>   you probably still lose on the 16GB configuration=2E On 4GB configura=
tions,
>>   HIGHPTE is not really a requirement, but for workloads with many
>>   concurrent tasks using a lot of virtual address space, you would
>>   likely want to /add/ HIGHPTE support on sparc32 first=2E
>
>That is an interesting point=2E Regardless of workloads though, it still
>would be a huge difference between having or not having HIGHMEM, with or
>without HIGHPTE=2E
>
>
>> When you say "used in LEON sparc32 configuration", does that mean
>> you can also run Linux in some other confuration like an rv64
>> kernel on a NOEL-V core on that chip?
>
>Yes, boot strapping will select between sparc32 LEON and rv64 NOEL-V=2E
>
>
>> Aside from the upcoming SoC and whatever happens to that, what is
>> the largest LEON Linux memory configuration that you know is used
>> in production today and still requires kernel updates beyond ~2029?
>
>The maximum I know of for systems currently in production has the
>capacity to have up to 2 GiB memory=2E
>
>
>Cheers,
>Andreas
>
>

SPARC32 has a 4:4 address space=2E  You still use HIGHMEM?!

