Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C774E9A75C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDhRwz+/ka+KYkzmF/0m24euohcc4CWkhVsPfLwqmgY=; b=bWw1WN4p7gpjjN35t2kIsns784
	y4eHYN889DmJeJ3ixNdGnFQHFABTP48WkrX9lccmEhamuEj6ceTQuwV++Etvmzolthwm84jnBXsOR
	nv07O+O36vPVhGHKnOBw0UN2LttIAbr6QDD5+nLh89vsSOGTIAIvOsa97jLjfeff2+km1STD/EIJP
	NHubjb2t1hCXXmcd98CkCPE8iqMLnugLatgqK7T8OXCz0lvu8m6n5AM6Xq5SCjF1IwDSDVyWQbyaQ
	ZOrdLmbrcK6NBnNa+KYEBX//mKJ9pfVVBh7CUvbFnfnssAmFYrqTJI41kXoXdKBE3dSzwVaFwLhH5
	HfVuHANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yhb-00000001BHo-3EUo;
	Tue, 24 Mar 2026 10:09:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yhZ-00000001BH3-1Llb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:09:34 +0000
Date: Tue, 24 Mar 2026 11:09:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774346955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDhRwz+/ka+KYkzmF/0m24euohcc4CWkhVsPfLwqmgY=;
	b=FRNp2XIAFuvjxFIrdjAa3SBTH7lLUiD6XV6NrwG8gIdSM0vArCI9w9OEVMpTBi87r46nnw
	H+/cppOqQ1/4P4GshUBQP6+4M1MFCrajlC0Z2c5a7d82oySbpMqQbuuqegBiXSsstDr/cl
	XC4skgZR2NnFXL4xXRYRpSaMPv8MtfUSrDdDDGzefi8gyuNT77zLCEqiTqFVngoa73xuwe
	vu3ZR1PlB0BXnUKpvHAvynM3j0h3L3A8ne3EcIM8k1QNBt2zdOcZ0124jwD3+Qx+H/p/B6
	/Db0UYkHfZUkrCGpmsv+zmFvy8dKMi5AxiNtbJdBCwN3esCUXd8YZqgipWVnjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774346955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDhRwz+/ka+KYkzmF/0m24euohcc4CWkhVsPfLwqmgY=;
	b=6lts3i46kaPHm1L0yZrKLoWQU7Mla3Fzah1+WF2rGA7Eb2S1nOymrm2JQYBOg7Qw988JVw
	uWODnGHa+iXZEyCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Will Deacon <will@kernel.org>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jeff Xu <jeffxu@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: vdso: fix AArch32 compat init allocation leaks
Message-ID: <20260324110512-7a00b224-8c48-445b-93f3-dd9b7a07d3cd@linutronix.de>
References: <20260323214117.241216-1-osama.abdelkader@gmail.com>
 <acJgc9EVRJJOVM0S@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJgc9EVRJJOVM0S@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_030933_507338_7E44EECD 
X-CRM114-Status: GOOD (  13.44  )
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

On Tue, Mar 24, 2026 at 09:59:15AM +0000, Will Deacon wrote:
> On Mon, Mar 23, 2026 at 10:41:16PM +0100, Osama Abdelkader wrote:
> > aarch32_alloc_vdso_pages() allocates the AA32 vdso pagelist, the compat
> > sigpage, then the kuser vectors page. If aarch32_alloc_sigpage() or
> > aarch32_alloc_kuser_vdso_page() fails, earlier allocations were not freed.
> 
> But why should they be freed? The vectors, sigpage and vdso are
> independent from one another, so we can limp along with whatever we
> managed to allocate. I'm not sure how far we'll get, mind, if single
> page allocations are failing at initcall time...

In the core vDSO datastore we just panic() if the allocation fails.
(See tip/timers/vdso for the currentl implementation)
The same should work for the architecture-specific bits.

Also I am wondering again why the return values of initcalls are ignored.


Thomas

