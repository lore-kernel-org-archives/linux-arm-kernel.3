Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00201EDEBF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYCoMox874UkG41AFwcqLA/NfPlaOlGxygnVG+NrNEI=; b=jteVeDoiVLKYtPfgTOmMHaxTGQ
	/B4rwcLrNYBYjyvMAJ2724HqyYhBWLWjrNVzptfSLv0ZTpAOBbHrV3AWuVu03mZJT938xGTFpLFVn
	QQzfp0zUT8YqKbRnfMiM4167K5eBj2OLM9Yl7qS6TPiWbDlEua1JvXmP79hkCrNSbL6jwmSo9kPGC
	8CDgqE4nfJTSr84tPcXIe7sPOHe7yBkf4Esr1N1A/mWfAsODxZ3OpKP82EfiPBJ1jmtWNvsJHOpDP
	op47PeGwwnvJRf4qxIw65R4M2WMRSj4sXkCh0qoP0LKCH+OdwEd2HD6CqQ+jOSoQry0V5hFpvU3me
	LHmaNESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWrY-0000000FwFv-14mG;
	Tue, 03 Mar 2026 21:01:04 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWrV-0000000FwEp-3Ybp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 21:01:03 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623L07cW3276874
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 13:00:08 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623L07cW3276874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772571609;
	bh=VYCoMox874UkG41AFwcqLA/NfPlaOlGxygnVG+NrNEI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=J04tWHXJRQ4G1vgUJxAr5RbvTbGLR/cHWVslG2ysvgZVqum75IEoDC6dtGc3RlEKN
	 gUgGPOAd9MXe8CpG/crlLctiNQxJBMOT+cXYXjrFtYd/ntsm2/P8UIzdSo2DMS6ark
	 Vu3+lFth/GOPA8muhWjcE1ynqs1UpAoaFJpUajmj+BiMnuK0U4mSRCtSZ1GIIeuvIa
	 mZ97PzkWn/kLprWX0cl5Mi4+xj7F5yQHjWd+WIjcipqFzUiIDQhiPDGeAseJOqICmR
	 WDrvasLJ1NsDoRQE3mNCnwQHbwWCc38WW8I2ZcCDD1Zk0XtigDVyZiABIDdAPpUE/W
	 EQp9NarHAcRQQ==
Date: Tue, 03 Mar 2026 13:00:02 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
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
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
User-Agent: K-9 Mail for Android
In-Reply-To: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
Message-ID: <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130101_890674_3276974B 
X-CRM114-Status: GOOD (  17.53  )
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

On March 3, 2026 12:50:33 PM PST, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Tue, Mar 3, 2026, at 19:11, H=2E Peter Anvin wrote:
>> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>>>>>
>>>> The thing about gettimeofday() and time() is that they don't have
>>>> a 64-bit version and libc implementations are expected to call
>>>> clock_gettime() instead=2E The result was that there was never a
>>>> patch to turn the off either=2E
>>>=20
>>> gettimeofday() is currently the only way to get the timezone of the ke=
rnel=2E
>>> But I guess this is a legacy thing anyways=2E If you say we should dro=
p it,
>>> let's drop it=2E
>>>=20
>>
>> The time zone in the kernel has never worked anyway, as it would requir=
e the
>> kernel to contain at least the forward portion of the zoneinfo/tzdata t=
able in
>> order to actually work correctly=2E The only plausible use of it would =
be for
>> local time-based filesystems like FAT, but I don't think we bother=2E
>>
>> A bigger question is whether or not we should omit these from the vDSO
>> completely (potentially causing link failures) or replace them with stu=
bs
>> returning -ENOSYS=2E
>
>I see no harm in keeping gettimeofday() in the vdso when
>COMPAT_32BIT_TIME is turned on, as existing code will call it
>no matter whether it's in the vdso or the syscall=2E
>
>Equally, I see no point in having either version of
>gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
>disabled, as clearly anything calling it would pass incorrect
>data for times past 2038=2E
>
>Neither glibc nor musl support actually returning the kernel
>timezone to callers of gettimeofday in modern versions that
>support time64 syscalls=2E
>
>      Arnd
>

That wasn't the point=2E The point was what kind of error behavior we want=
=2E

