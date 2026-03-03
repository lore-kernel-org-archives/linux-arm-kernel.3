Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90908EDEBFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1r1C1nkJC8myDUqBbWlJuno+S+Hsv+z3MI/a3FcqHc=; b=bZ2p+c7sLjNUeCE3QRRz5Ys1bR
	hgYPl0Sekq1LQ5W4IMY9kciuyRhUT/W5OZGULzzurvQvlll6s2KeawOq4V4hzGC7LDKebq7Z8g3J2
	BALiqJVClN+GkCWscNQNZc5/D7cQxntaJKsTWB4ZbaxZ7wzqjeCt1Gnrwy4r/Kt1TrSS2P0hNbhg9
	80fzUxTG12xnQ4yKFAQmS0V5ezX5pUqS+BeMUmIBmV0sXhaCdpfyvSoAnvNU8cTnUeqBLHbPWiGsc
	nxl8ToqRjcExtiQRsY1xatsA7B32SlWhxgj9i03V6zD6vu2FcXqhIG/YyYcjlGck0lASG9aoVOxtt
	xYh17mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXgU-0000000G0Nd-11U6;
	Tue, 03 Mar 2026 21:53:42 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXgQ-0000000G0N7-3dpw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 21:53:40 +0000
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623LavOS3436858
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 13:36:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623LavOS3436858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772573825;
	bh=D1r1C1nkJC8myDUqBbWlJuno+S+Hsv+z3MI/a3FcqHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RLwZ/rk8vaq6V4tFXUGKShs9EBYHpeXArYtAO8GRTPF0Qb9ckRJAy3tcD5EWeuBHX
	 vr0OB9eU7N3DVYjRVanoVDfqhq4F+AkTzExopgowDGEFypgJWOgNXBkU6FNdThL97f
	 Lw7JtD6O+ENFjRKkORJY5LGdYpcgeiUuBzkeJbD5nNV5qeKq9oq8xMw9GJMwXTJY58
	 GQjC3/XyTBNrpt/UhJOXTqWbTWEJKRY1JmqsyxsLflRD6J85F4d6toUWrWmiKQly38
	 ciLSIrOtlh968Kr67YxA/mjWIPI5I11u1R6hN8+kq3t5kAbHjJDAA+e6EhT7AmEGux
	 lOCVXVCJis+ZQ==
Message-ID: <0d2d834d-0f3c-43bb-9530-da6c2492763a@zytor.com>
Date: Tue, 3 Mar 2026 13:36:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
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
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
 <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_135339_340124_BCC83043 
X-CRM114-Status: GOOD (  11.89  )
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

On 2026-03-03 13:27, Arnd Bergmann wrote:
> 
> I see. I would argue here that a link failure is actually the best
> case then: the entire point of CONFIG_COMPAT_32BIT_TIME=n is to
> enforce the fail-early case, as opposed to silent data corruption
> after (now) 12 years of operation.
> 
> I don't think there is an actual link failure here, as dl_vdso_vsym()
> resolves it at runtime by glibc (when using time32), while musl
> doesn't use __vdso_gettimeofday at all.
> 

Well, the former is a link failure -- just one handled reasonably gracefully.
A library that really wants a fallback can presumably also avoid the problem
by provide a weak reference for the fallback.

	-hpa


