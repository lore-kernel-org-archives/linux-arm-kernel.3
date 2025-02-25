Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC20C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 23:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mde08ePw0U7qTCok3XXW6MXXh6mFRApsatbSp7N27VA=; b=AYYLRJcHpvNvVpxQmYqW/QUFG6
	dnd5PH9T0MA8YYz30TljiF0Jj8jM7IN7OsPtgcCSclYsyH+8QOzlDab+bf6tu6jehtcV0oJIKjULG
	3X27O5JUtQaAwPEOSeaIAV6CkxSLXVr3K/iS9V7o1DSylouiUBr0W/s+wp7zRWaMwYUVmpZ8wWlkE
	h6XRm3lPusKfXM3hm2xO3i4ghdlmXDASwPvobDFKISxZ8sjBqH15OFs/Ix/wHvLbsii/lOlF6kcaL
	PVGJIdYyqDoOdvgDFfd/DIo6ETyFI4BSyulyIWIP84LoakaojiKlkheD6mFAjSTkwFB/6qiMgTvGx
	8xnR1xkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3xL-00000001m9a-3vI2;
	Tue, 25 Feb 2025 23:03:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3vo-00000001m14-2l0k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 23:01:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc5a9f18afso11879524a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 15:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740524499; x=1741129299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mde08ePw0U7qTCok3XXW6MXXh6mFRApsatbSp7N27VA=;
        b=tEksUzyDT9ZO+eauNeawNNDz9Nkj3SkeXm+D2RgT0t8vlOto/ZsWSSw12krqftTldL
         LClKBI4k4F1bEC+Dk0Ctkl6243mPvjdg/4G9KxdXbtw07QLSAzgVOtl689LzUCekUC2+
         xi1iE8aXXBPXb8jV+VB8EjTfPbA0NlNiKIFQmU+OZygubp60wuEu/+C8anE/AFSmbTjC
         3Xp3h6grdOWo3Oz1CzBsrFIOuTbS6pJQZbOKJojK2tpHUmVLk+tOaWG2vpGjBWI+tAIH
         oNjHy76pVNw9+IBbD/5Sdrekporu452w+LGbee6xQ0+EAmbG4tMRk6DF8xZAKPO7+3xy
         HdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740524499; x=1741129299;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mde08ePw0U7qTCok3XXW6MXXh6mFRApsatbSp7N27VA=;
        b=Wl5LMTjjaw0LGRq6L4Rw4aQ5wrsxj24icuLuikLJ2LjIJK/f5FzniBewUvFNX9BuTc
         IHvMS8ccaTRROkBLel48GBOVkMpxEvosjY44/vXOvFbkmCeNZKnMdv5+3IS8RZL3FGdz
         znwuN15/ShOlSbLUQ5HWfFaghOzpx6Udnkqm2E/K7+Min65ZWyTTEiadB2CgtfWlMb4T
         OTOBbj/BTsXAeZVYhPBz+RdngJMJZZtQ9zJpW3JpKYp+Kpriubh5KWsACpwoBY4XP7cF
         deYmjjL2ymAoJC2uo1KmYwdscperOmL2NaLoi9rJasywEZle9Xvj6mTXSwCCbZ8EXDDh
         pfSw==
X-Forwarded-Encrypted: i=1; AJvYcCXlWfiVObaKTJviJjQY7dHV4H51ripyXWhuevO1airzty7sMlYQBROaxw0ZgTUHCyx9Xj71QATRWmFbUq3p7+Ma@lists.infradead.org
X-Gm-Message-State: AOJu0YyoEIunB8vTbIVzSOKCX/6GnRAWeg29U3+0lGSZHxr24U9oSBGk
	blVd4RsAMz7So5XvQRYgpvgkA5hi1ZdZypPmOdoJvDxiqDw8j6Qo+zRU19kXaZfoDIW7zkCfNA=
	=
X-Google-Smtp-Source: AGHT+IHPhKxQsRjLLUmrOJuKKmq+fpePmjEEOBM1vx7AS8VefdM5jfSQyDCFPrR8FFoSvuoQhhkXY0nLEw==
X-Received: from pjbsd6.prod.google.com ([2002:a17:90b:5146:b0:2f2:ea3f:34c3])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da87:b0:2f6:539:3cd8
 with SMTP id 98e67ed59e1d1-2fe7e33c7afmr2054308a91.18.1740524499118; Tue, 25
 Feb 2025 15:01:39 -0800 (PST)
Date: Tue, 25 Feb 2025 23:01:36 +0000
In-Reply-To: <20250225181331.frmfumf4b5ctfbsm@jpoimboe>
Mime-Version: 1.0
References: <20250225181331.frmfumf4b5ctfbsm@jpoimboe>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225230137.620606-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: jpoimboe@kernel.org
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, puranjay@kernel.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_150140_711053_E3078172 
X-CRM114-Status: GOOD (  22.45  )
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

On Tue, Feb 25, 2025 at 10:13=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Tue, Feb 25, 2025 at 01:02:24AM +0000, Weinan Liu wrote:
> > On Mon, Feb 10, 2025 at 12:30=E2=80=AFAM Weinan Liu <wnliu@google.com> =
wrote:
> > > I already have a WIP patch to add sframe support to the kernel module=
.
> > > However, it is not yet working. I had trouble unwinding frames for th=
e
> > > kernel module using the current algorithm.
> > >
> > > Indu has likely identified the issue and will be addressing it from t=
he
> > > toolchain side.
> > >
> > > https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666
> >
> >
> > I have a working in progress patch that adds sframe support for kernel
> > module.
> > https://github.com/heuza/linux/tree/sframe_unwinder.rfc
> >
> > According to the sframe table values I got during runtime testing, look=
s
> > like the offsets are not correct .
> >
> > When unwind symbols init_module(0xffff80007b155048) from the kernel
> > module(livepatch-sample.ko), the start_address of the FDE entries in th=
e
> > sframe table of the kernel modules appear incorrect.
> > For instance, the first FDE's start_addr is reported as -20564. Adding
> > this offset to the module's sframe section address (0xffff80007b15a040)
> > yields 0xffff80007b154fec, which is not within the livepatch-sample.ko
> > memory region(It should be larger than 0xffff80007b155000).
>
> I assume kpatch create-diff-object needs to copy over a subset of the
> .sframe section. =C2=A0Similar to what kpatch_regenerate_orc_sections() d=
oes.


You're right that we need to process the sframe section like what
kpatch_regenerate_orc_sections() does when building livepatch by kpatch.

However, livepatch-sample.ko is not generated by kpatch.=C2=A0It is built
directly from samples/livepatch/livepatch-sample.c by gcc during the kernel
build


