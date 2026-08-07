Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55017C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ltPkPRcOEcmiZJZYZ1L81HlsO2xE3TBDMrD6BDUdto=; b=u/9gxI6X6Te0xDtZmiLvUnxXf0
	Qf4gCyHFIB7Qdbt/XRVvtDxeqkFybP8QTWsaSbUWofh3TUFEk6luBPo+a/1QmAnw+cP9B3xYvPa+Y
	T73ZGwyNnJnqs3MMvZ1VbmhPP1bsVCOn+zi2dwJafQBdXh46z6Z7rJ5QWB5iehlSusnNnAk9SnuCO
	gcqw6CpnvnpIiMDRHXmUK6cXkpRh9aE3+awKOQbTmePHwsFzz/v/tdzOkdAnhl6o/bjroXBMLJRuB
	LMBIndD32nnMNIoSWSYOALXOMnW6wKsuknlaweCmL5UJZCHoPCmjDJIw7cguV3+FaQNMidnEy58d/
	m2JHiUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTG5-00000008pBE-3fUy;
	Fri, 07 Aug 2026 22:41:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTG4-00000008pB6-3JSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6096640817;
	Fri,  7 Aug 2026 22:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004C1F000E9;
	Fri,  7 Aug 2026 22:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786142504;
	bh=1ltPkPRcOEcmiZJZYZ1L81HlsO2xE3TBDMrD6BDUdto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bAEbHJcuOp+h+oilLLZYqqore7+dtKY4Q+dhmcok8le3vKwhqB90ibK72Em2rYbRY
	 m8e+yxibo8G8XYI4yIl+hTKqfYkeqsLe0Y0rnNz8xHmCn3qkgsHAFWEnBjJuj93/AZ
	 2vFm4oyraBmHiKCybhziZPzz4HoWuj5Ko/tXYX/+yiNUvqkwyy/9asF+9tn3UKQyh8
	 GOxu6/n+ehSZSDnqHp/HCksD0byyyScKuQCW76ZTsC7Q7ueeeT1pPEKmAwKxokWngs
	 M06Fig8cnPFY5oc2FBn+/hrQeWyD8jiE/5rNFB96VQUsfU1RfCaR79xZvf8BzTaG9T
	 ZXvXo0lrJj0wg==
Date: Fri, 7 Aug 2026 15:41:41 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joe Lawrence <joe.lawrence@redhat.com>, Will Deacon <will@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
	Petr Mladek <pmladek@suse.com>, Nicolas Schier <nsc@kernel.org>, live-patching@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 09/21] kbuild: Only run objtool if there is at least
 one command
Message-ID: <4bjd5d6sbmhorxcmzoaswr3emdhybswtjo5nbdsgtb3sxe43ip@eayelnnw6fi7>
References: <8699672b82fef17e73a5f2e5528478778dbdab31.1778642120.git.jpoimboe@kernel.org>
 <20260514222516.D2437C2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514222516.D2437C2BCB3@smtp.kernel.org>
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

On Thu, May 14, 2026 at 10:25:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Leaking objtool options into vmlinux.o validation causes a fatal build failure (`--cfi requires --prefix`) and silently alters validation behavior.
> --
> 
> commit 68e454f3a8ccd3d638c67c092eee264996286695
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> kbuild: Only run objtool if there is at least one command
> 
> This commit splits the objtool arguments into commands and options to
> prevent objtool from running when no commands are enabled.
> 
> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> > index 527352c222ff6..09af33203bd8d 100644
> > --- a/scripts/Makefile.vmlinux_o
> > +++ b/scripts/Makefile.vmlinux_o
> [ ... ]
> > @@ -36,18 +36,13 @@ endif
> >  # For !delay-objtool + CONFIG_NOINSTR_VALIDATION, it runs on both translation
> >  # units and vmlinux.o, with the latter only used for noinstr/unret validation.
> >  
> > -objtool-enabled := $(or $(delay-objtool),$(CONFIG_NOINSTR_VALIDATION))
> > -
> > -ifeq ($(delay-objtool),y)
> > -vmlinux-objtool-args-y					+= $(objtool-args-y)
> > -else
> > -vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror
> > +ifneq ($(delay-objtool),y)
> > +objtool-cmds-y					 =
> > +objtool-opts-y					+= --link
> 
> Does this code unintentionally retain the options from scripts/Makefile.lib?
> 
> Since objtool-cmds-y is cleared here, commands like --prefix are dropped.
> However, because objtool-opts-y is only appended to, options like --cfi
> remain active.
> 
> This causes objtool to fail with a fatal error: "--cfi requires --prefix"
> during vmlinux.o validation on configurations with KCFI. 
> 
> Should objtool-opts-y be assigned directly using = or := instead of
> appended?

Indeed, adding this on top:

diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index dc0a5d19f383c..729f82eb85b35 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -38,7 +38,8 @@ endif
 
 ifneq ($(delay-objtool),y)
 objtool-cmds-y					 =
-objtool-opts-y					+= --link
+objtool-opts-y					 = --link
+objtool-opts-$(CONFIG_OBJTOOL_WERROR)		+= --werror
 endif
 
 objtool-cmds-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \

