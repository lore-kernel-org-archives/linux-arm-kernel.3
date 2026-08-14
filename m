Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71878C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=; b=2L2WXYVuekta1hUM9xKr3lfUIs
	Y56orNObVC596FFeVsTU9Oh5WZNn3Ec61eCAHDxTBCmxY7IM3FFQHH33nK+l0gsQTGwglBqP/Xnx2
	BbchMAmq9H//367nVVJVsbqM9TbdLYG11HrBybiiuB/dWGe2/UJtCQwME7N+2Aff3QPcRg0GVuQrW
	x2BpVx5SsbMu+mOmkx5WIlmV2Hp3yDUTMnOQm3yTXy1jvd8hmeFamYPTWEO/XBgXx5Knu8Ot1l+5m
	2T+ip2ZcvOhYeUnahq33l2pgCD6D56+ZKk+fGj/XPOgA8/LGixnT0UcuME08cG91OUItgiL1teup/
	uqtjmuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwmr-000000033Gt-3p1p;
	Fri, 14 Aug 2026 18:37:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwmp-000000033G4-2Gf4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 18:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786732666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
	b=dEjNr+kqcTQa4PanpFJwe29bl/HNlhQJOnyoF9JXiIL0h7v9LaWGUm+gIWEDp70ijzx/rh
	QaiSALCOTy5Bxp4ZH6bb2rYfI9QCpzAW8qwNzXN+EkiFA8ivqBm2zrIwTKd7CmbtY9Pd0V
	XugY+zbmWbjoNP5880LIpMxX73I6GYg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-GBw3tQLyM0qr54KgLXjSGA-1; Fri, 14 Aug 2026 14:37:43 -0400
X-MC-Unique: GBw3tQLyM0qr54KgLXjSGA-1
X-Mimecast-MFC-AGG-ID: GBw3tQLyM0qr54KgLXjSGA_1786732662
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a171a3be39so1461238a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 11:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786732662; x=1787337462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        b=QD4feiQAR4tZEDtPhbTi0JsHPkB/8FulEpHpEM5oOXETKlZJuyshmxZIA3BU0Um2bu
         zKp8050IwDUrIi4iEyl/kEc4kpg4QgPqtBAJYiCmXfSHNhIFeNcd/mZVEKOW3Dw0gdX2
         r4igb3aiIZ8vMd0RSOmM0g1BZ8rtuW/tU7XX59b8uU4bk0P4xrnsyRijQfdMLOQ2rIaj
         Fj5UtV7kVr9YurwyLbEj1Lj4xupUV6NhWi7YKb68FdxfKJr5t/xpRWBbQ485BHons1sc
         UT9y7q9tVBgd5nodI2PHHl55cu8dBco1oyAl+BGBD/FvyVn5fkuH3Z3ff2VLBIaIj13Z
         +mxg==
X-Forwarded-Encrypted: i=1; AHgh+Rpk1Ap9205iTNYNNkAE+rx+C/x5x3wIUIxcRyVCoTZi8Cpsi/ZtbEXUC3DFSKWC/WlT5slP22HvKb+Hq87B+1Y7@lists.infradead.org
X-Gm-Message-State: AOJu0YwtB+0elOcedorlKXcVulpiIJJ8TOjf0TxrvlOxAWBphzWi/jdL
	Pk9LHNlZwLC4Z9eAIx+2Pjyn6TQVhl9vrK/CpWw/009lhuAqrbnn9Sz+Bwx08Jn+eR+XFFyukvo
	UICI61tFrjA9StTPatApeklYnT3y9osdSJxIVBm07tYf1OO0LGQx1pYGU+GmhVo/dLIktczFyCF
	YCo5EKuu2RYbjJTBv5scIeC7xHBaoLBA5+i1dq3cFgx++NUuOkYCI=
X-Gm-Gg: AR+sD12GAyrb72igspj7W4HnVzZE326f9nKPTK3laBEs3z4rhekXf6xZf1UpxAmmDoE
	wqyACQy/6xhTu3lETmNbq98leO1q7q6udhEUrtqxe2lsOPkXgdTbauldLYM7RrUwtHcjldwngWA
	jJcL7txTcfRMHshpyQ1ni5Vk02Jgc9hD2zDNQIh0klVBmcZ7gtePl/ck7RTqgxrT43kvAF/yr04
	6ix9zXhFwJktVhk74JXtrtUwmyskYpMzy0UfTr0oSv6Zg==
X-Received: by 2002:a17:907:1c94:b0:c20:87f9:875a with SMTP id a640c23a62f3a-c212a23ba41mr343801966b.30.1786732661694;
        Fri, 14 Aug 2026 11:37:41 -0700 (PDT)
X-Received: by 2002:a17:907:1c94:b0:c20:87f9:875a with SMTP id
 a640c23a62f3a-c212a23ba41mr343797466b.30.1786732661284; Fri, 14 Aug 2026
 11:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786626275.git.rrobaina@redhat.com> <an7Udt-luZfJO71U@willie-the-truck>
In-Reply-To: <an7Udt-luZfJO71U@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 14 Aug 2026 15:37:30 -0300
X-Gm-Features: AUfX_mwn2tCHNr249W_00_JVZBPk2OAqZsqdPsMuBo2JtJrJsV0GhfYgrjHGFrM
Message-ID: <CAABTaaCcyTLV5TdmzZfpP6LMV+5GeCKqotPoJrb0u9n0h-TaHQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] audit: log all six syscall arguments in the SYSCALL record
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
X-Mimecast-MFC-PROC-ID: zkL4tGrwWJRuDN7WLM50b-zHOMs7tq_NtH_Pf2ZLNjE_1786732662
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_113747_646573_42147B09 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, Aug 14, 2026 at 5:40=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, Aug 13, 2026 at 02:02:50PM -0300, Ricardo Robaina wrote:
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3), silently discarding the remaining two. This
> > leads to the need for auxiliary records when audit-relevant
> > data lands in the 5th or 6th argument of a syscall.
> >
> > This series extends the SYSCALL record to log all six arguments,
> > by adding arguments a4 and a5 inline within the existing record.
> >
> > The audit testsuite runs successfully:
> >
> >  # make test
> >  make -C tests test
> >  chmod +x */test
> >  Running as   user    root
> >         with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1=
023
> >         on   system  Fedora
> >
> >  amcast_joinpart/test ................. ok
> >  backlog_wait_time_actual_reset/test .. ok
> >  bpf/test ............................. ok
> >  coredump/test ........................ ok
> >  exec_execve/test ..................... ok
> >  exec_name/test ....................... ok
> >  fanotify/test ........................ ok
> >  field_compare/test ................... ok
> >  file_create/test ..................... ok
> >  file_delete/test ..................... ok
> >  file_permission/test ................. ok
> >  file_rename/test ..................... ok
> >  filter_device/test ................... ok
> >  filter_exclude/test .................. ok
> >  filter_exit/test ..................... ok
> >  filter_inode/test .................... ok
> >  filter_saddr_fam/test ................ ok
> >  filter_sessionid/test ................ ok
> >  io_uring/test ........................ ok
> >  login_tty/test ....................... ok
> >  lost_reset/test ...................... ok
> >  netfilter_pkt/test ................... ok
> >  signal/test .......................... ok
> >  syscalls_file/test ................... ok
> >  syscall_module/test .................. ok
> >  syscall_socketcall/test .............. ok
> >  time_change/test ..................... ok
> >  user_msg/test ........................ ok
> >  All tests successful.
> >  Result: PASS
> >
> > Ricardo Robaina (13):
> >   audit: log all six syscall arguments in the SYSCALL record
> >   alpha: pass all six syscall args to audit_syscall_entry()
> >   arm: pass all six syscall args to audit_syscall_entry()
> >   arm64: pass all six syscall args to audit_syscall_entry()
> >   csky: pass all six syscall args to audit_syscall_entry()
> >   microblaze: pass all six syscall args to audit_syscall_entry()
> >   mips: pass all six syscall args to audit_syscall_entry()
> >   openrisc: pass all six syscall args to audit_syscall_entry()
> >   parisc: pass all six syscall args to audit_syscall_entry()
> >   sh: pass all six syscall args to audit_syscall_entry()
> >   sparc64: pass all six syscall args to audit_syscall_entry()
> >   um: pass all six syscall args to audit_syscall_entry()
> >   xtensa: pass all six syscall args to audit_syscall_entry()
>
> Could audit make use of syscall_get_arguments() instead?
>
> Will
>

Hi Will,

Thanks for reviewing this patch. Yes, I think so. I'll fix that in the v2.

Thanks,
-Ricardo


