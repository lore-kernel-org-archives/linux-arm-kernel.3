Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD02E68965
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2PPcgfHtBCG02PjbK8BW7FPgfmHLZvDqSq7jNYuQgg=; b=gIkoNZfw6S3+8q19EWLo12i3Sh
	oBvY2cQX6Uf6a0BMsL3RE7AD2PVZOs79HmORPCv5AlEd5L+lFyj4mlNX8js4M+gJ9Zjjg7jyfln8y
	gTPsniOD2NwICO+JS3jfNs/CIQp76xlBeSgeNkuB+sDkASLeW0GF41NWJjpMWGM2mV9H5XxEmLFbd
	arDeOpyZlGuE+5TTfnmTZXn/epZ3XLqAtr7wZEQ2tX6e75fU3mIv2A/6OAHQECS774WiPx3xhd8Or
	k5KR6yatep7z41cfA3/+DwK+gnPj1LTGKDNJG62z5DB8Kj8sBsMw4VhItlVpFpwGITmJ+tOIvdYYc
	Vi2BixAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Rb1-000000036Tv-3Lxg;
	Thu, 31 Oct 2024 09:36:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RZ8-000000035zv-19qf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22ED0A43DF3;
	Thu, 31 Oct 2024 09:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF3CC4CEC3;
	Thu, 31 Oct 2024 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730367243;
	bh=ZFSitSgdptOVjcClSu7CfDR9yggNcE+SbsK6UcIRUOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yf0z3etJdM/pWhSVrW53SXDEgmrJsHEgI1FI6Vg3Pr9hFgrujZatLnt8sv50lGL76
	 EF8YuLVxB4sv0un+iTB8JtNuVltLJKkOOaOgMFMiS93egHDqhmBQw/IsCpOwFCFVwJ
	 SQp/Dqck738kE4KKhf6zh8ax9SFDeMA11GAKJS6J5nfhV55uE0NPL+8VhOIgatU5AV
	 anEiV6HSwu0QO48chjVJXGFEFZrTx670xbndcVyEtqLsN8roeQH3NKFCwie3JX687S
	 /a546hGLx3yHy2VhjaIrhqLD9EsenXiQHFC1QhcqY67kiF/Ya6C1CdBfxtW+mjOe2M
	 YMFECeau5OyEg==
Date: Thu, 31 Oct 2024 09:33:56 +0000
From: Will Deacon <will@kernel.org>
To: Jeff Xu <jeffxu@chromium.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com,
	broonie@kernel.org, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, Dave.Martin@arm.com,
	joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com,
	shuah@kernel.org, sroettger@google.com, tglx@linutronix.de,
	yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org,
	x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Jorge Lucangeli Obes <jorgelo@chromium.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v3 1/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
Message-ID: <20241031093355.GA7008@willie-the-truck>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
 <20241029144539.111155-2-kevin.brodsky@arm.com>
 <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_023406_397580_92353CE5 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Jeff,

Thanks for chiming in!

On Wed, Oct 30, 2024 at 03:01:53PM -0700, Jeff Xu wrote:
> On Tue, Oct 29, 2024 at 7:46 AM Kevin Brodsky <kevin.brodsky@arm.com> wrote:
> >
> > TL;DR: reset POR_EL0 to "allow all" before writing the signal frame,
> > preventing spurious uaccess failures.

[...]

> > @@ -924,12 +982,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >         if (!access_ok(frame, sizeof (*frame)))
> >                 goto badframe;
> >
> > -       if (restore_sigframe(regs, frame))
> > +       if (restore_sigframe(regs, frame, &ua_state))
> >                 goto badframe;
> >
> >         if (restore_altstack(&frame->uc.uc_stack))
> >                 goto badframe;
> >
> Do you need to move restore_altstack ahead of restore_sigframe?
> similar as x86 change [1],
> the discussion for this  happened  in [2] [3]
> 
> [1] https://lore.kernel.org/lkml/20240802061318.2140081-5-aruna.ramakrishna@oracle.com/
> [2] https://lore.kernel.org/lkml/20240425210540.3265342-1-jeffxu@chromium.org/
> [3] https://lore.kernel.org/lkml/d0162c76c25bc8e1c876aebe8e243ff2e6862359.camel@intel.com/
> 
> > +       restore_user_access_state(&ua_state);

The POR isn't restored until here ^^^, so I _think_ restore_altstack()
is fine where it is. Kevin, can you confirm, please?

Will

