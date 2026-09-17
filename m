Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DAC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=; b=lVOLizXLeUjzRBBdtBoE0X7SOF
	Q5sx6HcM/YlNptXhTAhDGFZtho0/U3C1VsIb13sFn4iralFg95d7Ji0Q9vCXZQe4qHgV2vyAvBKvJ
	nBZQt82x0v9e7Z5XkhdvuQF3PlXwZU3/nzdcbUWrUCWuzsazlzYMfu/a6Qvmrh887fgmtmwo0EWvG
	e4PlfGHA+cKq1nKxakDQGFKzEQNJ83mLMCWYakr5yrrbHnRuwHMNPlG6BTN4qhQng4IkXbqGTpj1c
	EgByhlvB/okDJ1j+nG2sbBx3dh8QxbAGTvXcJMEm2mTl/C6reeb7PsYmTBBaY3kWtjTZbGdg/zKZV
	YwwsC8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FGz-0000000BzE8-20X7;
	Thu, 17 Sep 2026 16:47:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FGx-0000000BzCj-0z6Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
	b=FEdPs4GsnvTUP0HSzSuH/e4Wc1c1rf6CAPY2L77kWs/O0OKN/weVrkEBRPR/VB6U8WArzB
	8wl/Zn42wDqfyZBKPdzvcf9BpqPcTzSlKcRZVjnIGM02KlZUHo2kSy2f03zHCrbwCGsjKK
	6rGiI234qXhbzW0ljnFhcyWETqKshBs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-efdBya-2OoSQGawd3Rz3Aw-1; Thu, 17 Sep 2026 12:47:38 -0400
X-MC-Unique: efdBya-2OoSQGawd3Rz3Aw-1
X-Mimecast-MFC-AGG-ID: efdBya-2OoSQGawd3Rz3Aw_1789663658
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a9b5240fb3so1397877a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663657; x=1790268457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=FcTisaGotCAyZ/AztdI97BR8LFmQPoN1oBwIOd/usrdowff+Tf3LSD2Pc0geQ4AZPP
         NkFL3a9CuKXFpsByHLEa1PGkx14PbTbvRhPzYf2kM4ghA3OM9Qrm0zEw2kAMp7b3CW1j
         7vJChWYiod9ysCjZB1RfhRqGqtj8ksoruP2S3zNtQ3h6EENeXEPoxP6//3oxzhfPlxm6
         tMHXNhc+KfMLAQBwkt8cIRxe+Y7Gm4s2vnKeh0R0wIFTXbBlSo9oig/8n30fRuL5p8Qr
         FFzcMsplK0koqOEg/7FyQPMmsqBc8qCICw+KcsvhC/KBr7kMrSQpw7wDVjDwdPscDldr
         nhjA==
X-Forwarded-Encrypted: i=1; AKwUvBzY0bWCDmDaq+LuVisxrg5uuQcCIGv+BO1SQ+umo6+4f1kHSdzFE6TF619MZ9REnnbNj9mYI/10XnW7s9kFf8QB@lists.infradead.org
X-Gm-Message-State: AFuF++nqb248SSair5++LrStZu3MSIiyXfpWVHQsT0vbUQXOi7CL2CLG
	QDXDM9tzK5usDfsC3QKiOJ5BfMo0a52kg9C/OLFkxAOvpreTcAu7I3ENDwErJEXNtbWaZuRadcy
	+wBdA6gYEdVdHXtmK5JGH0juRe+EcZOv9TVcE92Q5quVPmA1INyML6i/RsiGfzKeXZaqpFvWUWw
	zDIgi6XbfxqReyOrPOurhch2IWFot4QHMOp59aOnDZIJo/h6AODyE=
X-Gm-Gg: AYBFou0+3WIcwbeEfLbfA2fptUX8/TQbg6F/txF4aBnMp3Dr44ytiAtsTW5cDwIQv8H
	o24AReFHxDS9ejwD5j0OsBEIJscv2dkVWo5wCSJ88YS2tz3fDfsn7omRYFPVZtT29wC6M7mJ3AM
	ikSPOyHiJ3WKDlxT1oiSqn3e3Mf8xXRFwuujUjkWY792D9sb9A9pULg0wR+nFjK1MW+0FZuAdXy
	M6P8gq979ceO3n56ExCWrtuGtI8XTIzyHqS/6fMf+TVEo7ffbZ0u79MTpRQWNbgkZJ5po5kgbe2
	UDE=
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c29e5244c19mr627700566b.10.1789663657704;
        Thu, 17 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id
 a640c23a62f3a-c29e5244c19mr627698766b.10.1789663657315; Thu, 17 Sep 2026
 09:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
 <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
In-Reply-To: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:47:26 -0300
X-Gm-Features: AcwNN1UQ-9H3EW5aAPKYI2mYiHxV9kMvBFdM8jP3WAhZbefwH7qcxYHE69PGYDs
Message-ID: <CAABTaaAUBzp1uaLve2piMhEB1R5po5n5+Sy+U0mbbe70Ak-SUw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Magnus Lindholm <linmag7@gmail.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lJeAAc2HP_1OEbV5wniZ6VeL9Ekz4u6t73x20Zt2mRY_1789663658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094743_362964_850B1B52 
X-CRM114-Status: GOOD (  23.83  )
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

On Fri, Sep 4, 2026 at 2:21=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.c=
om> wrote:
> >
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/alpha/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> > index fc8f6cedbb28..8a39c0473297 100644
> > --- a/arch/alpha/kernel/ptrace.c
> > +++ b/arch/alpha/kernel/ptrace.c
> > @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
> >         }
> >
> >  #ifdef CONFIG_AUDITSYSCALL
> > -       audit_syscall_entry(syscall_get_nr(current, regs),
> > -               regs->r16, regs->r17, regs->r18, regs->r19);
> > +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
> >  #endif
> >         return syscall_get_nr(current, regs);
> >  }
> > --
> > 2.55.0
> >
> This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series
>
> https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail=
.com/T/#t
>
> That series moves alpha's syscall entry onto the generic entry
> framework and removes syscall_trace_enter() and its direct
> audit_syscall_entry() call entirely - verified with git am against
> GENERIC_ENTRY applied, it fails at exactly this hunk.
> You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
> lands, alpha's syscall entry goes through
> syscall_enter_from_user_mode_randomize_stack(), which already calls
> syscall_enter_audit() as part of the shared entry helpers
> (include/linux/entry-common.h). I applied patch 1/13 alone on top of
> GENERIC_ENTRY and confirmed alpha's entry path already routes through
> the updated __audit_syscall_entry() - no alpha-specific code needed.
> So for alpha, you can drop this patch in the next revision rather
> than rebase it.
>
> Regards
> Magnus
>

Hi Magnus,

Thanks for reviewing this patch! Ok, I'll drop this patch from the series.

Thanks!
-Ricardo


