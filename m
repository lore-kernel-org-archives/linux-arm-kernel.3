Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE03CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2WtKlX5Be+t9WCfynzOY98X+OoJJT2Buiwxou/xw8c=; b=r2M/LYr2d4c8ibqzMQATpSirj9
	YCvNYp5IiZ8abTuzIFmzZNZ/0BnXqU+BXi0oCh4AVW+BktosJGhia4QygmJzdfTtqmE1dujZvPocs
	13xyudw3C0l9vYJkO/A8QeWuR6ermWcUVqtbS9WvzJWuAgZUqCcWPgn91ctp9GZRzbhxMPXg3KW9F
	ogxcjmV863jEyh5mfsvvkeHydq65+aGM/3LddwAhe5S0VT6mX0RrNx8wuFYjpWNq2lWuJeGUQ7oY7
	Eo/uxGU82ivq1rJpPrCDo5GH9xdL+QiCzepStj7e4nsUTUqN8+YayYbmxLp6/Qv6mAS1uqSn0Jh7s
	Tu3Ny8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhZh-0000000EfZZ-44vw;
	Wed, 03 Jun 2026 09:07:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhZf-0000000EfZ8-3OYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:07:45 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36b7b802299so937972a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780477662; x=1781082462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2WtKlX5Be+t9WCfynzOY98X+OoJJT2Buiwxou/xw8c=;
        b=nbVLEEp65A4dByelGyKoMC3ZoXuGApIqZwjAuO0JgUGV+jDdJmvIxy66Cm6juvNxuY
         gTJ1nJTXDtS8+qxYH5oqI1U+Yb2cPPucL4kVd+YzizubsWJ7fpgR0t/hBtwuSEFG2nde
         0aBmH7fxfVVhmpB9nvZJTrl4jC9CqDH6SF0LyVneBGzGePLfpNcJM7cX15O6Ua8fjh42
         OSpVntE0O3n8QqyM15OAelg7SucKBy1lO0+ay3KzVlDcmTt7fwAzFwZktPWMwIMRDZmS
         FR2Eil9GBM9XuLN515eUDKcO0k3JpNCY5DEzUWErF1R8DWNbo+KWmGeDGP7kYONSGcxo
         dZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477662; x=1781082462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y2WtKlX5Be+t9WCfynzOY98X+OoJJT2Buiwxou/xw8c=;
        b=oc3gHa1NX3ZaSBCvQ2qpnP8I50L3qupgj4FGdNQs1DZOcInlkMD4mjkjyNqtrdEmiL
         pkuQLtlcA+il/ZGwdUd2JIGcNTjoXH00hfUaP21kzTwgwt7M4hryl/4IXx6V5P5SwG55
         wSmifa8HB6NO4HpNRfUj6gJiaXieOR2tsAWF/eu/szaxx216iEbzNdeUa8BSeG0i3q9Q
         Pqg+sJqPOfz3osBw3ZI3iDrtNoTBVRn3UZVyJYUfai76SLdWLFc2ANR8MoNVYIUhUk3S
         MQ9APIUdNj8Ds88H/q7FjQhygOnTp2+5cJLY80X5GdNrjDdIs74vCL8CCJ/UVBkJ0dXN
         UqXg==
X-Forwarded-Encrypted: i=1; AFNElJ8ptbRcOr1U+4q9FxKtgVAgt0rTwEO/N2ocGbsRsERfwO3mH4VqGAEGEMi/Vj0o48C7hIc3a1qvcJzWVO3VYDTM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjy1lG0hjgAgIaQUKFYgtye2+eSHSSkebbSTDEGLmyqrquCuKX
	oE9eVWSD8WVtMEN1DZqECtIkQgcC2GjAihqfcx7ey8I6+MbsbU49yWY8
X-Gm-Gg: Acq92OEmlxKEH4r2XigFL0GRFS215EiM+VE5T7jc1KxEXrducqdcTl1XZsMOQKt909P
	Ywz5evr878GB+vO9iU02oEzx8WYhFMfSel5q0IwUYVFu7Eiik9W3U1B5GSqqzAYJqb/BY0kQQDu
	R0e3cei9VnsUu3JLUWFEtqTwTLuwNe10tXpRonBzcmKtEl85/nyEwvUvSwnTCGGljlX/1A+icEJ
	DxCDRnFotq9c+Kt6+QWmvBXzQB9DF3+hKBedg+a19SeGAmexsHwQwYRghWxLpq0xGges2tgcHRI
	cZkkmvI0G0P4e/AwhPkbKOB1RSEpcB6cyAcA8qM18/FjQcg3dafsOKJ22Jo7I8oV/whWwDjhGtl
	nri/cAa5E7CisVTYqsLdVQweqJnsC+6UuiP60bvOAsVW4KGODtsWll6xO+1vs95cdRTBfrd7F5h
	XM9hPBVt3EAA8eXefQFVU4T08ojYlLYX0P8vDY00pt7KA=
X-Received: by 2002:a17:90b:5690:b0:369:a719:6747 with SMTP id 98e67ed59e1d1-36e318c3497mr1428504a91.3.1780477662315;
        Wed, 03 Jun 2026 02:07:42 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a14485esm2417617a91.3.2026.06.03.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:07:41 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kees@kernel.org,
	keno@juliacomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luis.machado@linaro.org,
	mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com,
	sunyiqixm@gmail.com
Subject: Re: Re: [PATCH] fix: arm64: syscall: use live x0 for syscall_get_arguments() arg0
Date: Wed,  3 Jun 2026 17:07:30 +0800
Message-Id: <20260603090730.16960-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ah1-fmV1VcN3cKto@willie-the-truck>
References: <ah1-fmV1VcN3cKto@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020743_855925_5196216D 
X-CRM114-Status: GOOD (  29.83  )
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

On Mon, 1 Jun 2026 13:43:42 +0100, Well wrote:
> On Fri, May 29, 2026 at 02:54:44PM +0800, Yiqi Sun wrote:
> > On arm64, seccomp obtains syscall arguments via syscall_get_arguments(),
> > where arg0 is currently read from regs->orig_x0. However, the syscall
> > wrapper consumes live arguments from regs->regs[0..5].
> > 
> > A ptracer can modify x0 on syscall-enter stop before seccomp runs,
> > but cannot update orig_x0 through that interface. This can
> > leave seccomp checking stale arg0 while the syscall executes with updated
> > live x0, allowing seccomp bypass when filters depend on arg0.
> > 
> > Make syscall_get_arguments() read arg0 from regs->regs[0], matching the
> > actual dispatch arguments and removing this desynchronization.
> > 
> > Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
> > Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> > ---
> >  arch/arm64/include/asm/syscall.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> > index 5e4c7fc44f73..4bdb4d3ce2b4 100644
> > --- a/arch/arm64/include/asm/syscall.h
> > +++ b/arch/arm64/include/asm/syscall.h
> > @@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  					 struct pt_regs *regs,
> >  					 unsigned long *args)
> >  {
> > -	args[0] = regs->orig_x0;
> > +	args[0] = regs->regs[0];
> >  	args[1] = regs->regs[1];
> >  	args[2] = regs->regs[2];
> >  	args[3] = regs->regs[3];
> > -- 
> > 2.34.1
> 
> Hrm, this looks like a long-standing issue and I'm pretty nervous about
> changing it :/
> 
> How did you spot it?

I share your concern here, and I’m trying to be very careful with any
behavior change.

I spotted this while comparing seccomp+ptrace ordering across arches.
I had previously looked at x86/x86_64 (including the seccomp/ptrace
ordering fix from more than 10 years ago), and then checked whether
other arches like arm64 had the same issue.

> A quick look at the code suggests we have a similar issue with
> audit_syscall_entry(), so if we take your patch here then it will silently
> introduce a behavioural change to this guy:
> 
> https://lore.kernel.org/all/20260320102620.1336796-5-ruanjinjie@huawei.com/
> 
> I also notice that the compat ptrace interface allows 'orig_x0' to be
> set -- could that cause issues with things like syscall_rollback()?
> Will

You are right that on arm64, audit_syscall_entry() still takes arg0
from orig_x0, so taking only this seccomp fix would diverge seccomp
and audit semantics.

I also checked syscall_rollback(): on arm64 it restores regs[0] from
orig_x0, and orig_x0 is captured at syscall entry before the ptrace
syscall-stop hook. So rollback normally returns to the syscall-entry
state (i.e. pre-ptrace argument value), which does not look like a new
security issue by itself. compat ptrace can explicitly write orig_x0,
but that is existing tracer-controlled behavior and does not, by itself,
cross a new security boundary introduced by this patch.

If you agree, I can send a follow-up later so seccomp/audit stay consistent.

Yiqi Sun

