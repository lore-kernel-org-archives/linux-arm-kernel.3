Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A16C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sRNUDR6BGPZ0oT2ok7Rny6ujm7T4UE8rOOtHPjQVRI=; b=4yibOiS8M90kyX5H/T3pmN1ja6
	yqckBYBqhUhZGdYk9BoXZU1R6nGe9PTFKIdKANYCdMwiAjzYyKji5m8phMhHSrUHiKOghpgmUU0IP
	4Zjin5e4i7t7UVpJdw3Rr2oMcxOD9tzJWLu/0fSNyxD72kryRA56fEoE2fgP532DT0un/Pd9qagbU
	2llg/sr6XMzhl27ecya/bRMIXQrem0Kp06WLKH6Qa7eMc1qMw/3U0o02+ui8zotP0V6JGJFVQoqKa
	JaFaLq1/4vCN6ukH4eFwGan60zMIU9b4YDA6ziBeMKmos+hzAWls0ALQVtuSzOvRmIwKM+jv08ll/
	KsItDieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitjq-000000073JO-0BJ9;
	Thu, 22 Jan 2026 12:24:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitjn-000000073Ih-1PSv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87CCE4052B;
	Thu, 22 Jan 2026 12:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D93C116C6;
	Thu, 22 Jan 2026 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769084674;
	bh=UJUvp+7GyqS1uy550kFefEcVuGXyfuC911Lc+u7GvDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYjcO0H1WIL6gJTC3GKryp+fmOIsr5XYsbHBHHy6mP2c0gisB5bNeEUXEGlAb2LWJ
	 zMQKgmdOipApvVZO5zwikAajfAUiTBNCPgIaWqkiyMEdShaLeX7ZJtgDt+6Yf39Uz1
	 lS1wF7Vw3OLziqRpIKBnRsNG81W3MBJlaOC4wbeijSdd5pccAncc+eT0QFTsrM4VtX
	 ++8QxAU+BrkFg0fNPSiPgqXKeo9Eyq4zXx+PIi+IkNJOtrUzvWW8KkTw1nfQu8iZ6I
	 3bXGJZeZ0KOooOdOkMYmpZwqVWZFURGwbut93FYuuiRKJrQge3AA3AF/wFBhaF/WXT
	 CMFjgA8vCYAOw==
Date: Thu, 22 Jan 2026 12:24:29 +0000
From: Will Deacon <will@kernel.org>
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	steve.kang@unisoc.com, jeson.gao@unisoc.com, xuewen.yan@unisoc.com
Subject: Re: [RESEND PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
Message-ID: <aXIW_U72IIEETsi0@willie-the-truck>
References: <20260120060619.469565-1-zhaoyang.huang@unisoc.com>
 <aXH8ppr2bdc-lWUH@willie-the-truck>
 <CAGWkznFBLDr44tTCME1RVNTZ9SLDZA+By0eoTQ+-HrfnTBAoqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGWkznFBLDr44tTCME1RVNTZ9SLDZA+By0eoTQ+-HrfnTBAoqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_042435_392621_5ABEAB73 
X-CRM114-Status: GOOD (  17.68  )
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

On Thu, Jan 22, 2026 at 07:39:34PM +0800, Zhaoyang Huang wrote:
> On Thu, Jan 22, 2026 at 6:32 PM Will Deacon <will@kernel.org> wrote:
> > On Tue, Jan 20, 2026 at 02:06:19PM +0800, zhaoyang.huang wrote:
> > > diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> > > index 18749e9a6c2d..9717568518ba 100644
> > > --- a/arch/arm64/kernel/hibernate.c
> > > +++ b/arch/arm64/kernel/hibernate.c
> > > @@ -402,7 +402,7 @@ int swsusp_arch_suspend(void)
> > >   * Memory allocated by get_safe_page() will be dealt with by the hibernate code,
> > >   * we don't need to free it here.
> > >   */
> > > -int swsusp_arch_resume(void)
> > > +int __nocfi swsusp_arch_resume(void)
> > >  {
> > >       int rc;
> > >       void *zero_page;
> >
> > Why does is the '__nocfi' annotation here rather than on the
> > 'hibernate_exit' pointer?
> Our first try is to have the callee function(swsusp_arch_suspend_exit)
> waived by set __nocfi but failed. It seems like the CFI watched the
> caller of function pointer and plant stub code.

Thinking about this some more, you're right that the '__nocfi'
annotation has to happen at the call-site, because that's where the
check takes place.

I did start looking at what it would take to emit the CFI type prefix
for swsusp_arch_suspend_exit() using SYM_TYPED_FUNC_START() but it's a
bit grotty having to offset into .hibernate_exit.text when jumping to
the copy and, given that trans_pgd_idmap_page doesn't seem to bother
with BTI at all, your patch looks like the simplest point fix.

I'll ack the resend...

Will

