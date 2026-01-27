Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D96AC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toaioy7hLQQ9iPo2VTW/lFiyxv97v9+epn9Qt7bs3K4=; b=JirUH78vHdZgjkzT2ur/tWemVx
	a/X9O103uYMHlORMzakBXh+5246tCnYkNo4byb0yNI2nv1ZJhjhdXmCWkoVfQvIjRUa+yobyty351
	0Lypp0T4wUsbp/Oo5RObAecitMdnhwOLEQ+eHyx/f5lTxtoqTG5We9vVIDKFwycAsA8QduEp0pLRc
	yTa0zHNYjkqu+SMhMfpFrNSlm7p0TyTegx/iwOPYfPntAlUfjqyvUw/sJp1xwVVjBHtQ3pMBRekwC
	vILwJE/Gv6IcdKYoX+403gMeItgaQQfvGHKFyVg+t6mtJHtv41+mrCW0ghe9nPUSos6ywHZoFAJtp
	56X04hUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkbE-0000000EUhx-2h8V;
	Tue, 27 Jan 2026 15:03:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkbC-0000000EUhW-47nq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3389A442AB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 15:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12915C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769526202;
	bh=toaioy7hLQQ9iPo2VTW/lFiyxv97v9+epn9Qt7bs3K4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z2EaOiuBItSilFMOrW3Eor7PjEw1XYAId3JLYRCJaJnpk9fVH+L7uTfbcydubXeWl
	 2Y5HD0Uj1zY6PDHFjqPsvxIo3NXmM90sDEaEcqqK0MwaSWKdiwdc8j0hGfGlfAdb3Z
	 0tE5MSg7Z80Gg4VMOP3jv0jJ+6694xKGO4G99Mg49FtuAIOkOy41Tm5Yikca/AZVbs
	 QwF3Ie6oDdzYGUesobPfL88MCOnFYG4ZNAvKWelMjdnwOx7Z5PAbaraazxp3krHXpr
	 u8KsY8CDWKu9pMIzX779PwxOrp2uPo0Rq1ei5E+n82XpPgBw7OxJxXxCCjaIqdoZhw
	 zjq43gLRM4oOA==
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so2840334a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 07:03:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZQqeYCF3u5JsiBASWrm2e7bCBXqALuXcv4TiBJD3IniuY+ObQp1IIE2ZyVK6R7dpco4PksA0O1/kKZPWgpZPp@lists.infradead.org
X-Gm-Message-State: AOJu0YzBM3nd3P8Q6Ge3wJUWJs1v2pISzVxEjfEc7i2NKrZeVgTe2sOB
	i6lo766QOY4GhOld1naeQL4ztOBozgf1H+rrvjP4MbCmG4AcbuY2F95XsfApMtoacTFs74rkpjn
	vvSU+MYW9DWhWpK4y4LJOlw/D9dAha1U=
X-Received: by 2002:a17:90a:c88c:b0:340:9cf1:54d0 with SMTP id
 98e67ed59e1d1-353fecca19emr1732209a91.1.1769526201645; Tue, 27 Jan 2026
 07:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-15-ardb+git@google.com> <4965fa08-ce01-4848-bc30-5cc1b745683f@arm.com>
In-Reply-To: <4965fa08-ce01-4848-bc30-5cc1b745683f@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 16:03:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFskBM-LT_ifX5HpxgQnt1E5tt2QA_5fYuxPQBiSWSDZw@mail.gmail.com>
X-Gm-Features: AZwV_QhQr0Y-pb8zbIIn-c2LQYjEq4EXdEwxzxoW7Gst8GSBWzVqLdJq7MdLVtk
Message-ID: <CAMj1kXFskBM-LT_ifX5HpxgQnt1E5tt2QA_5fYuxPQBiSWSDZw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] arm64: mm: Permit contiguous descriptors to be rewritten
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_070323_043559_DE64C9BF 
X-CRM114-Status: GOOD (  18.29  )
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

On Tue, 27 Jan 2026 at 10:45, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Currently, pgattr_change_is_safe() is overly pedantic when it comes to
> > descriptors with the contiguous hint attribute set, as it rejects
> > assignments even if the old and the new value are the same.
> >
> > So relax the check to allow that.
>
> But why do we require the relaxation? Why are we re-writing a PTE in the first
> place? Either the caller already knows it's the same in which case it can be
> avoided, or it doesn't know in which case it is accidentally the same and couple
> probably just as easily been accidentally different? So it's better to warn
> regardless I would think?
>

Based on rule RJQQTC in your reply to another patch in this series, my
conclusion here is that we can drop this check entirely.

