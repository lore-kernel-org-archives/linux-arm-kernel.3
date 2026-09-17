Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B7C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=; b=OyBD5IB7pgQkqwIuPLeaUDn3gp
	ReSd/uepOqd1+fzVwzKJknzNw/9PWZ1jwxmTHj04DLuYW2bDMDb9PS7Ij6dCILxPAbDUuHdXwacSh
	dD9K4zqGcRUEbDIqq/uSElJGgZiMAi3GcFjy3ULCV33g9GF9t3dHDh6qZip/tQSTBOC4WEDVd++HN
	X6EGcuaNX9JsrFekWGdkCfW8lDnKgqb7Gb0dUV2IlEDzMnRxJx6ioNZFtBlF3QMLQjbYU5yPEPu++
	rELngleJwHN49MBXs6UGYci6sQvFHcxEEcyR1oIlJJrgCdCAc4hrW1o4Yli0bgewfHvEsJwpsStm9
	n42Rsp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FFm-0000000Byrz-3fTB;
	Thu, 17 Sep 2026 16:46:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FFk-0000000ByrG-3fF3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
	b=ZTTX6g4mYj0vlRM1lqShOllZvQyzIx2owUz//QT3uX3LDPwvQ13gLfFul3EjOEEnhQRL8+
	IgQ/7XdL20/z2P4kFnyzkp7ERWfZuLKKKkUCSaqJIXTrE/hkbCg/FbDPz+nqS3uMZjRKFl
	rRIN2A0cBVjwRsvMvG/YvP3IE3QaPqs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-qiEXLvFUPhW80IFHGUA65A-1; Thu, 17 Sep 2026 12:46:26 -0400
X-MC-Unique: qiEXLvFUPhW80IFHGUA65A-1
X-Mimecast-MFC-AGG-ID: qiEXLvFUPhW80IFHGUA65A_1789663586
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2945f5e851so95783366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663585; x=1790268385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=0lAg2tL0LyYC+zs+JIS7y4zCBHoDr6HIPbYK4kHhZz/HTXP1ghNjfwXxvtFfSPQzmd
         HW3fCNGge2sA6dbMyQCP5CvIKHgJMzVmiTSbjcSapvF3RDoqPnmnh8bwwtRFK5/YkmDz
         OrOtatx7EZ0971X7b3Ys/3v3etfCfXVIMYCUqIOhXhQy5iE6Ohi2ejTmJ450ZRINYRlI
         ZEDwEvHe3gVPl4V+GUZCVQM22kFMPhO61hidwjYUp5IZes2rAuvbqHGqBkyLmAiEy/5B
         6+q+P+EeLexDxbGGT9UlYYG1cbpDU7FKsNHPS3vFf8TRAruI9UJgKs0bqg4tTbYRkBl0
         BjXw==
X-Forwarded-Encrypted: i=1; AKwUvBwykKyyjyO7JvT8Eb+uJiCL0+CLE9Zu2hZVdEW0eM4Nu0ylQasukHWoPX7MzX9PzzbH6X8HHdsrSayJ72eS7FpT@lists.infradead.org
X-Gm-Message-State: AFuF++lmOIYPMOVkfAP1ol9sC0lISiJsi3xLwoX2skBUpQly9n+Vr2Bp
	2ljxUCrzIqj1R0vRL/mIJxtelWf7Zu8+CnKOm6M9YU+pwRIYlIOvFBHyLoL69w2iqRPuHCyWKLa
	ow9vjSoQKnv6BDnK2I7ChnoR0n6C+JkcrcPkEJwEmd9SGjf7YkgH8ZqPUQcCJl5/yWNcI0pfGgQ
	H46I5uigbgr6CVQdH/h6WzxsLbIwZc9Qx9wzeN95f/NQ4c/VAoe9I=
X-Gm-Gg: AYBFou31BOYl4h+ecVNqlMXrByAfo+/iLkfjQHGa0uLfUBW6dJknqk8VC/bi2xhGPmO
	FawQDsmtD5G43rCl9onzG4U9O6oWv2Y/cbKgcLn1VPmj+LDsAfUrlmDnTV2aNHgMOw6HsfEuGyh
	nI0L9bCQDSFw9/fPQxApfa3CQiLJVZ+lGF8XqSAbD1qXeaB/wvbKZfJPruwKInb7gnl0hOtgayi
	RZMJCiC7HA3OF2gb+mCUdLjIw1PAEH7WZhINBWAbtToGCxQ9T/2DKLSi/WO4exJcfL1eBUSyuKD
	Pbw=
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id a640c23a62f3a-c29e53184f0mr504529266b.42.1789663585536;
        Thu, 17 Sep 2026 09:46:25 -0700 (PDT)
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id
 a640c23a62f3a-c29e53184f0mr504523266b.42.1789663585091; Thu, 17 Sep 2026
 09:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <b4ab47d2551d090520b4fa81a884b5988b9655c7.1788351089.git.rrobaina@redhat.com>
 <apkuNj1paR_GO3x9@willie-the-truck>
In-Reply-To: <apkuNj1paR_GO3x9@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:46:11 -0300
X-Gm-Features: AcwNN1UTQywdGW9xqj12KwNHAYLGfDNNso402GZvP3WcYYwXGdDJ7Oiz7qML_cg
Message-ID: <CAABTaaCoNztwDUA-HPp4LaikxL4dxk-1bvCCpoZEGD4rnds1oA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] arm64: pass pt_regs to audit_syscall_entry()
To: Will Deacon <will@kernel.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, guoren@kernel.org, 
	monstr@monstr.eu, tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9DfZ6DZrQWVSdi0fRLlvrMnBQbTwtCyYHJlwL2_Z_mk_1789663586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094628_983687_A1C8C405 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Sep 3, 2026 at 5:22=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Sep 02, 2026 at 11:43:37AM -0300, Ricardo Robaina wrote:
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/arm64/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f743cbec1c3a..65532b2a8cd4 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2476,8 +2476,7 @@ int syscall_trace_enter(struct pt_regs *regs)
> >       if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> >               trace_sys_enter(regs, regs->syscallno);
> >
> > -     audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1]=
,
> > -                         regs->regs[2], regs->regs[3]);
> > +     audit_syscall_entry(regs->syscallno, regs);
>
> Acked-by: Will Deacon <will@kernel.org>
>
> Thanks for doing this.
>
> Will
>

Thanks, Will!

-Ricardo


