Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52580EDEBE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zVA5SdbXqXmCBN/Z5gDUy/tneGY24otJLTMGQOtDJc=; b=xrEyyTnsZp/qxla1H4OO24uYom
	obRitBj1TrkSZklpwVkvdRSvJ3R2vGZrGkDwnw0ZHVC2Qcy3QUsyJRUUoOcKCdPq6fUj09+JxLMOB
	UBYeNWwGrYUYiJTWkovco5EBSz3rqbHw541Zaa1A1Eqz9DqIhfmDmtBNIbz9RmzWLOAfvPGFWdhW1
	8g8Dq5V/NJ6yAaVsxd9/8WXm8R8FCV5Nx7zHqyLLs3I66GtQXHFWCA1pyKCgIW+eN4ob5NLtXlVGW
	5HL3JXjvxImzUegYwhP9EwFCKQVpJeBjn8hyN+H5hFvyqvCAkHlqkY4Th+U+aZgswhva8UaR37NZl
	An53KqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUUt-0000000Fi4X-33DZ;
	Tue, 03 Mar 2026 18:29:31 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUUq-0000000Fi49-2CES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:29:30 +0000
Received: from [IPV6:2601:646:8081:9481:7d9f:6fce:330c:4416] ([IPv6:2601:646:8081:9481:7d9f:6fce:330c:4416])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623IBwxb3007270
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 10:12:19 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623IBwxb3007270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772561541;
	bh=+zVA5SdbXqXmCBN/Z5gDUy/tneGY24otJLTMGQOtDJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDipitNJ+TnURncz+4axXj5t727f1dxWqKkdtf58mQoedGdBe2o6JBVgdoP8CO7Ry
	 9CB3uFtQMRRW/yGu8Wm5Nr3ezlS0W7fWzd4ec6e+CvnVrSml2ZkMkpW+vdbh8cdE4A
	 UWnWgRW5FF9zmA6VgvCm+uj0SnRi673RqA2gPwRn/NJknbzRxdD/hYAo9y3Ucezhr6
	 yRzBTg3CHgnlPltD5GKLMqCzYLrOu80yOIJAODFtsiiesImNH+wMjPboHoThWc7fx9
	 1tt7EA7eKrLMpdA0tuDDV81GNoJTInNE2aLg9ZprcxHpNhQk18AhMWWmmMkbRDsUvm
	 OxPHbOmqHIh2g==
Message-ID: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
Date: Tue, 3 Mar 2026 10:11:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_102929_580930_7C3622F7 
X-CRM114-Status: GOOD (  13.78  )
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

On 2026-02-27 01:34, Thomas Weißschuh wrote:
>>>
>> The thing about gettimeofday() and time() is that they don't have
>> a 64-bit version and libc implementations are expected to call
>> clock_gettime() instead. The result was that there was never a
>> patch to turn the off either.
> 
> gettimeofday() is currently the only way to get the timezone of the kernel.
> But I guess this is a legacy thing anyways. If you say we should drop it,
> let's drop it.
> 

The time zone in the kernel has never worked anyway, as it would require the
kernel to contain at least the forward portion of the zoneinfo/tzdata table in
order to actually work correctly. The only plausible use of it would be for
local time-based filesystems like FAT, but I don't think we bother.

A bigger question is whether or not we should omit these from the vDSO
completely (potentially causing link failures) or replace them with stubs
returning -ENOSYS.

	-hpa


