Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7867FE9A75A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgIXlYxpapMXx8saiZg4uDRUBgfpi+0JfPftpg1denw=; b=KMqMndfbPsNUkZRBVoPwXGH3gM
	FAqabHeKwuCWTAHEjje6JnqsxOXd3NHsgZwmDTutC8VGGT576dZUjuxp1wK3OflSG7bU1elizcBhr
	M/7SANMyMz382ImxMTBUBU/3hA6FX2dKBrFYA21uA3GZ2ZW+CEih3q1L2Pc55C392/gujdSDrw8Pc
	yciFrBr1mp41C4h965OjxAFpHD61O1enevv47e9bE7v6KbX09kPHIXKvwxRwmtjT1bdt+VSZ+lsd6
	sY+aF36rMh/NOGAE+QQcz5Y2oEBlZpLwOQxLQSU0XDyxqr9xqVfp/Mr55Iy4fNyDHC3I0JxvEwpSa
	N+lzrdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ymd-00000001Bcv-0MfZ;
	Tue, 24 Mar 2026 10:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yma-00000001BcS-0fkP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53C604066D;
	Tue, 24 Mar 2026 10:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3B3C19424;
	Tue, 24 Mar 2026 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774347283;
	bh=zg+WpXDdGHriaE92puEQ+UJjbNTidyzjwpmpPSIKApQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b51RlXF9nyf57uLZAkbmqOzygP8Jq31XRBgp9s9tmXese9E+uvO343l6NDxefnMHi
	 bPlvMTKsrY1PthViKr//5kKovtcT63Cfn6PeBOQGqUL0BT68ItF5U6l6DUXO9R1Cr9
	 /X003u/rLLWXueH2pfXjmONUN5JkH3SYkrb1NwzrQ+JfH11iF7KqBnl09V7f6RTMCu
	 ogj9Mm1uMJhQYC8ujJwuEkaIHhy+ZhBLDFlu6pVrNGTDJJr0Rp/ZpFPhCVj+/V2eHE
	 y2RZnGXEJKtKYIKvGRXh7TtgtbGA6aRkwcdrfPLAVT510XzmP19OsrqtN6gGrim2IY
	 yOF/jVyjYplgA==
Date: Tue, 24 Mar 2026 10:14:38 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jeff Xu <jeffxu@chromium.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: vdso: fix AArch32 compat init allocation leaks
Message-ID: <acJkDv0AT_YqDIF9@willie-the-truck>
References: <20260323214117.241216-1-osama.abdelkader@gmail.com>
 <acJgc9EVRJJOVM0S@willie-the-truck>
 <20260324110512-7a00b224-8c48-445b-93f3-dd9b7a07d3cd@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324110512-7a00b224-8c48-445b-93f3-dd9b7a07d3cd@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_031444_240494_4C4D91A7 
X-CRM114-Status: GOOD (  17.28  )
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

On Tue, Mar 24, 2026 at 11:09:12AM +0100, Thomas Weißschuh wrote:
> On Tue, Mar 24, 2026 at 09:59:15AM +0000, Will Deacon wrote:
> > On Mon, Mar 23, 2026 at 10:41:16PM +0100, Osama Abdelkader wrote:
> > > aarch32_alloc_vdso_pages() allocates the AA32 vdso pagelist, the compat
> > > sigpage, then the kuser vectors page. If aarch32_alloc_sigpage() or
> > > aarch32_alloc_kuser_vdso_page() fails, earlier allocations were not freed.
> > 
> > But why should they be freed? The vectors, sigpage and vdso are
> > independent from one another, so we can limp along with whatever we
> > managed to allocate. I'm not sure how far we'll get, mind, if single
> > page allocations are failing at initcall time...
> 
> In the core vDSO datastore we just panic() if the allocation fails.
> (See tip/timers/vdso for the currentl implementation)
> The same should work for the architecture-specific bits.

I think we should just leave the code as-is tbh unless there's an actual
issue here.

Will

