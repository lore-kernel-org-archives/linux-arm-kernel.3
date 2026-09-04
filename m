Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C4C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=; b=0l/DH9liCYjqc9wgV3mgMi9arn
	eAbdlD1KcBR/koIYYFOkKxlogr8j9KQ8Xy561apJjVCsqOcM6VN28OJtqQdH0K359cL3Qeyv3MKeg
	OFoF6K5MHCPvQeoBsnf5Z2nhYtdJ1KfXu8YsU2mkfjFIGWlzH2h3LKqgXPlf2POMaXB0LDEvdeA6R
	bOC2WLF33f/iqUp2PLo+mo2+Rqei08otJsAgtDYwhZ8aSuKgq8zfoTgjGQC7tkHP1WHKx1ghamT4Z
	e+oK7aE8S1r487L4xsGSdi1B0uolfuM13XLlf0PK9z+G/k5F00oMemOi12rsRMXX86HuoN+PjeOuy
	noqK4EJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XbQ-00000002sFP-0Nrm;
	Fri, 04 Sep 2026 17:21:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XbO-00000002sEf-0KG6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:21:23 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so2892853a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788542480; cv=none;
        d=google.com; s=arc-20260327;
        b=fM5QD6s1MBkob8aj84hjuwIZF2Ap6PtA2XwPsqaBMIzyoXLYVf1rESjzAQnzfcSiE5
         yQAO8BAov4Z72+XEzd5gcNRBKVe/VfzTKSOsTZ3zMNHRSrdRcBkvAIM41nSRblQHbent
         JZ77uk7Hme2BMJvEfx1dY7V51xwNEkn8xZXbSgtWivcCcgZCt+75yAHdBXlHzTL52Dj1
         3oGFhD3iXt3XT/gLCLlMmrhhZrRY/62wFf2xKMH7qYv/wgYCjKWFHDD4zHWEUTqbW/xc
         bfN54R+1hFaxbOEh1XYCUf8y/ekeKkAbkp5HYEy41u5Hg/1n0BUD2jL8sn58NBvw1tZB
         2eaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        fh=yY75oTlZNhNKOChy0NCCmXJlyPBIrStk0sAbI1PhPuA=;
        b=j+PI9ltS4pRc9mfODxhe/8iXLenAdj4SBa98IOXZ6lJsZZpaWreXQdBPcNwcfBew5s
         ABtpTk2guTgVDiL1frrgiPRc7u4w8vaDtXKIRGAl7TFMraMwI7TlnFlx4hDjgjiHfT/P
         Q2zA5aB+oY+IOJpNq24psFcSYIU9eHpJc89OatrG6jsw42rjoNcRfHaw6mVCHVWVDX2c
         FOPQZDQnL0QOlI7sABIN6TKMbhB4OzTBzuvRTA7o85cMgaY+jB3slLhhAQkRQxeH/76u
         ztqSbGbh+wA2MXGygBpSmPQK5n4hbClKsgsEbe45Vit2knX40WPvE03ZVZGPuF89ifU3
         ShzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542480; x=1789147280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        b=CEUxXb8VUmHpqJcVXypX1+9IjftQTV2F6TWwLxtV9m3KKDErhxKcF7WkJeKBmEJjFr
         RTaVrdBz/nVryyYic5SpQQZWekkLYUzq06B596zAlwhVG0/FayJ82yA5s7Fd49AHefm4
         cePZxRAW5Rz40YOr2hhwyOZZHXthH4gP3nrRgwgR+DYsF+cpBC1wxgo4hBBy5J3uNYE1
         srmOWhG6VWTD0ouURi8tNJCNg9Loo/HkKgStLq+pi0kJ0pkLoDuKc64xKrNaKL5MCsdn
         b2+aJAt8jy5H6yYSJFwKYekyelu9QJ8B4gCSJtGz54PNCWbGkmCkN5y5tUD1ZKLWtN6q
         jUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542480; x=1789147280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        b=Dnq6coeMCeBeLjPD4VnQz5bBxiFa7q4inXnSKMEij7eqHCqjIYK0DVBCZ6PJkKSW4i
         cGwVsQ0LqWAG05zjOEXII2kxXBiVzozzZXQTXCeGrCiDGce22Qt9NU7PozqA7G6mrvgm
         8XovxVrmCIwQE+EV8UGgL0A8qGJFxZvUgmF7Ad/WZJOP5F/GsX9lhDactKd0/N1d8tzf
         a7Dnh4vGGBOhPLMPYsteaQilxySNC3GjLHcOnkj24W173DISbxct3iYRzuhUMBALkgp7
         BIhpD46lP+LZiJDAKZAWJzvvpl32oqft4I6yTZ2tqVNQSiJX+Ne6a7CmAiG0Am07lSbc
         J+HA==
X-Forwarded-Encrypted: i=1; AKwUvBx/zAbHa4wZrx/FWeJLR5sxvs+I0GApUWD0NO3E/Y5NpjKvVjBU7rK8wQhgle/lmhCn5sZN/Tq/yKFk1MhexoPK@lists.infradead.org
X-Gm-Message-State: AFuF++nF2yIsSqTlvSksTj24D523ngPKjYV4jWdQyyuBEmFznQwTJOz4
	2pOlMuIK2wSjy6W88xZ7mcPMKTjhmUQsfczllGvQU9k3ZAGZFuIUZcxJngU63gUqzrgGa6OMqrh
	L/RXZBTw4oH43SuehLzbbKcAIql41twA=
X-Gm-Gg: AYBFou1W5kyIBCyCss4rvHV/VwNSgt9Ke9uk+5QF+w4uldkonR9nEeyngKt4JFxLdDj
	rS3skRcjoLxfBhH1iLXeAv0awoWskXPmtZ1V4py4MYzK99MBddPB/xT5c5rUWRe0bXlNb6NFubT
	An2RgNzK0DDM38xFgSr8v+bw9AjDk8pzqJZlFangFaRr9sMZrhEWewygzgtHkJ2yliUlxFVl44h
	5S1QXhiUrrzFHyOjHMP7mTDLJIfFc0zKhC4JrDu7yOZscSwgFz1xesC8TD8LE8Sfgb85T+nqo78
	Ra3ZszoSmZhCgW6LSZEg+XDHsXr4WyIhhPaHQpzIxWPCl2MgfMFe7Bn90wTiPmK/1N3JDBKGWkO
	JrnkUzBpAe5N05bFocuULCmQ5M8kpOnU=
X-Received: by 2002:a05:6402:a252:20b0:6a6:9368:73a0 with SMTP id
 4fb4d7f45d1cf-6a696a73aa1mr4363499a12.6.1788542479338; Fri, 04 Sep 2026
 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
In-Reply-To: <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 19:21:07 +0200
X-Gm-Features: AcwNN1WpEQ0Y6eKbtA6wNzDHeYOBs1Tconhq7C15XjRhFKDXvjk4jMYrR9OFExk
Message-ID: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_102122_133803_59A1BA15 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Ricardo,

On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.com=
> wrote:
>
> audit_syscall_entry() now takes a pointer to pt_regs and extracts
> the syscall arguments itself via syscall_get_arguments(). Drop the
> individual argument registers from the call and pass regs instead.
>
> Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> ---
>  arch/alpha/kernel/ptrace.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index fc8f6cedbb28..8a39c0473297 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
>         }
>
>  #ifdef CONFIG_AUDITSYSCALL
> -       audit_syscall_entry(syscall_get_nr(current, regs),
> -               regs->r16, regs->r17, regs->r18, regs->r19);
> +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
>  #endif
>         return syscall_get_nr(current, regs);
>  }
> --
> 2.55.0
>
This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series

https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail.c=
om/T/#t

That series moves alpha's syscall entry onto the generic entry
framework and removes syscall_trace_enter() and its direct
audit_syscall_entry() call entirely - verified with git am against
GENERIC_ENTRY applied, it fails at exactly this hunk.
You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
lands, alpha's syscall entry goes through
syscall_enter_from_user_mode_randomize_stack(), which already calls
syscall_enter_audit() as part of the shared entry helpers
(include/linux/entry-common.h). I applied patch 1/13 alone on top of
GENERIC_ENTRY and confirmed alpha's entry path already routes through
the updated __audit_syscall_entry() - no alpha-specific code needed.
So for alpha, you can drop this patch in the next revision rather
than rebase it.

Regards
Magnus

