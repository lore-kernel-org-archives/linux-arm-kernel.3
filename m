Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA75AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=; b=Tx6b85EqrLQ8OkS/X4172ewcJK
	DpqJh+RCqgAMSu5rXMP2Qy+1PVupuI+VgPREV0ondJ3FN2M0sWO2Xe6AxTv75JyPg2FwRnNTJc0YE
	Of33cDo9mQOPPwdjydwD9NZpZa7gwSnhwgVqXT3YYMWyteo+WzbfTFkp0j46WjkRfIAgUrlh1tqil
	HjsFv2JAq8DbhWfZOckh+zSHzJkeEZBoSZeNfCGJsws0OuQJz+rHg1PUS9AWKKUfHEaml9Du7rB3o
	uHUkiphCe4bZrN5ltjzxg5f8ImXxVvC2GBT2l/kris5h2+g4Fs0IEqZ1fAsH7fYYVwVd3MpRw7uuV
	rxM7Z82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvIo-00000002maV-1nLB;
	Fri, 02 May 2025 18:40:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvGq-00000002mCP-1cZ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:38:02 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso3498567a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746211078; x=1746815878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=;
        b=n0L7Yn2CMz5I85HEDRhu2W+/zxS50oyiG4VaegIu4qLoRoSmG166aaOrdQu0QauBgY
         vT84jeKPpKfaFNB3foAxTGN2dG/pJbaTE6orBt2GwVP4ikM4cdeuUacuwDShG+uLU2+o
         Z/IupgH2VNIei8LjlN1Bpc08EBH9gcf41Sym10pFpQU+egnqVN49Mrhz2Wh8aE7aZvo2
         ZwkEOoSQ+f2plqfLWkpzz4qiNLfKEDqW5kmG9FaIAR0SXrhTWqB0sWltGt2yJ4VHmylj
         KmPLXs6zAPH+xElKY1YeNmiY/YEk/EfUzU+ZX0Tzek0OLwFcApwDUqBfc2HAt/RRRSiX
         TiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746211078; x=1746815878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=;
        b=w0879AsgQWitPeR0uxN8pHvuT/YBNKRX5F7TCzOmdMYsBY/veRmpmo2YJFHgm8V6wf
         b1JwLHOL48uiKCN7+rD6o0DhmxJjP0H5wLhrZ307EDDSPzZZOkpSBtxf+N/yAGDjGiSP
         TNFdaJxOx1Gnbfhzs8yFTV2arHi1Ub5wmSff2KF0rKeHScL6jtlvNDd15pdrvHcs7fuB
         h7LgBuBY8inCavzDYAS6bJNrNFnwZ18YrgPbfmkcemWdBaBSV1V7s4KmMgDQgftdFnfz
         hJQXxBE11hk1p+MLUdvTjQehuVlHP6zlhgv/BB7BhKHg4/qmxhuk8oEvMB5mbGMK5tU7
         fq5g==
X-Forwarded-Encrypted: i=1; AJvYcCXbBiKRxbGUJdtRh5EKVHmWGiKj6CbQNaZ16+xufqMZtojQ7WrsCibC1mUU/aTf1bsla4tjlnHqeYHiuWj9U4HC@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ8myZAWtJs/MnpRv2gCL6BBGGfzJuG1NXBK9t9PjeijIk752u
	xpELNJMfsVWtyAMRJXvMPcvCloYNYboxe5pkaVZs3OxYIirT9EFs7SbkWdXLbuRxNq0IV0qUaKo
	vnAg9ZTqIeurhWQzXJbJfL4H9/3IbhpA1bQ8R
X-Gm-Gg: ASbGncs2ScF2sBLKvyDA5LzmUr9oorahUir+oV94WNL/rc85g16sthrTDaV66Uy8Pts
	z0cFu4fEuY9EuYRKV3CvbnUemjiuS0nJKR+JK0ay+DoMKwO2yO3c4eA+BScQPvg9pGzSvBDyD7/
	46SbGbP1b3p0g88T/ceGiPYV+sMJAWy3+YxItHZr3KjFSCdpWjMA==
X-Google-Smtp-Source: AGHT+IGwGEcGt7qt4y6UtHsVIeUZAmZUDbWtJ+Ey7gGLeSPt9gI0iA5XJZYC4rzHLcT2CmY4/egmqxuj7aqEk5l5ENE=
X-Received: by 2002:a17:907:9812:b0:acb:94d6:a841 with SMTP id
 a640c23a62f3a-ad17ad8096cmr430432366b.16.1746211077663; Fri, 02 May 2025
 11:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-7-changyuanl@google.com> <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
In-Reply-To: <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
From: Changyuan Lyu <changyuanl@google.com>
Date: Fri, 2 May 2025 11:37:20 -0700
X-Gm-Features: ATxdqUHZQf1uwj7X5bskxFA1vT8WH6Uhw3YyifuFYUsYAjHkndnVOqhZb4vCKaQ
Message-ID: <CAGzOjspvbMkr8b4-xy3EfGLE4nmLC8B9EPx0QYCdpoFQD-FESA@mail.gmail.com>
Subject: Re: [PATCH v7 06/18] kexec: include asm/early_ioremap.h
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_113800_427383_DCF1B164 
X-CRM114-Status: GOOD (  16.40  )
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

On Thu, May 1, 2025 at 5:36=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  1 May 2025 15:54:13 -0700 Changyuan Lyu <changyuanl@google.com> =
wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The early_memremap() function is decleared in a header that is only ind=
irectly
> > included here:
> >
> > kernel/kexec_handover.c:1116:8: error: call to undeclared function 'ear=
ly_memremap'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]
> >  1116 |         fdt =3D early_memremap(fdt_phys, fdt_len);
> >       |               ^
> >
> > ...
> >
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -17,6 +17,9 @@
> >  #include <linux/memblock.h>
> >  #include <linux/notifier.h>
> >  #include <linux/page-isolation.h>
> > +
> > +#include <asm/early_ioremap.h>
> > +
> >  /*
> >   * KHO is tightly coupled with mm init and needs access to some of mm
> >   * internal APIs.
>
> When resending, it's best to fold little fixes like this into the base
> patch, along with a little note and the author's signed-off-by.

Thanks for the suggestion Andrew! I will follow it next time.

> I shall queue this as a fix to be folded into "kexec: add KHO parsing
> support", thanks.


Best,
Changyuan

