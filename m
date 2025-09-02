Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65EvhtvipMhOdjygn6tHDJEsIHl353A0aFQlz0RsB+8=; b=15uzAOSvY1yhmhdwZVennXOlCS
	HCXDGM3jb9CYIuZ7fjMUydlIwc5Rt/LhDNY4KT5BqebQxxkfIgvr1ECYhwhrBUc32ggzKMFBV/i53
	zcZkVXRs+3widQREaUML3zeUUeMAzoYf/TkALswcnsSlcmmNCDWkZXknpyoKnJjQLqxBQwAoj131P
	NlHp+A/wRFmG05MQbL0VZ3enEMPjgoFUIm+ad+wVCJzK+AlWUK7/3a6cM8cdln6EjlWiazYyu7Ch5
	VHjdFOINthA1awvIgg/XDnTsA0Oo5zoJWVsCvgIwtX58awN22KisNuHLQc61xT1aYT11yhnMPPENY
	7vPJv84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utciw-000000038h1-0Tcl;
	Wed, 03 Sep 2025 01:55:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utXyF-00000001zbE-1wML
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 20:51:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so4541886a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756846275; x=1757451075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65EvhtvipMhOdjygn6tHDJEsIHl353A0aFQlz0RsB+8=;
        b=IxYwZ6jbFY1q/le1VivBMMEl49xxjmWHAkOAw1NDxI3YKE2WTsZUvrlN3qTYJY3NNh
         9L1Xv66ZIN9HMVSahL0nNfhv9JcY2Es3SlKV/eUO3/onz7XXYePF+Ql7IJxXXZIg30B4
         Nk6w7349JZFGaHeoHrAsxB0woz7KQTaaGj10DK0YLgLEHVjUV14+8Hq7Uj16P4jhEh57
         vvr6VJANFmZYJ2gQ5+KUO48r3x9xihwX1Hr0dysFLbhc8vnYFwYbdQjVEY2QIfYVCqoW
         85aWiGQHZuv0GtxEGtEd4L+von1IuA8vIi/jvt83wCpowrBuC+454F6ZqxfEfP9TLNZB
         bZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756846275; x=1757451075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65EvhtvipMhOdjygn6tHDJEsIHl353A0aFQlz0RsB+8=;
        b=JxamFW57t0agjSalBHn2xipGB2vBymwFvzhdAtrskaqyhcKUruhFIguw33axaf36Zk
         wD7D2sypDNeifITEamJE+6hY6goRQcqPKFELbigHsHir/thP7fpccT4YIRK8GKnpa7Fu
         dcWgkcIwxezbUDi7AI4ZmOJy686E3t12H46PnCTswQjEQZu9jK76NSHZVWeRhpBhFC2+
         9uz2jDmBgtTt45cC3c5hPM6e/5H2DRQHPSupjHKlPan0PeDQ/tuVIyrzcc7CFDjx598k
         P7jWNzxmsEVDRmmxS5LCD/waOvA/tWC5iatVCcZ0UMVMn3Asyf6kqHc7Enu4Pggf0fti
         0aig==
X-Forwarded-Encrypted: i=1; AJvYcCWyVVtpXD+ahLH9E1vEiMomBx2C7Y1yxp6pIpscWD/s7bDZWoFX+SpVKXiOEgzcctp2TVulEsw+Oeq4FBiMs10q@lists.infradead.org
X-Gm-Message-State: AOJu0YwJyPtMurKHQMi82MI5LdjjTuxnID72evcKpJ9kuwqmwj2ijoVO
	6xefp7QLwCwBdUjnk2WJOZd2L0TOZGsq48v+wfEH0Xj1xzAFfUvSx9N+yUZG6let+XrgBFtdkEK
	RlweBsPihPTe5+oDTLTpQFZCxqgfxVXg=
X-Gm-Gg: ASbGncugOxtO0YdqA7Qozsd/CgXSxi/BIBYOuaOnBXLjGAXdPvEVg8tNyaCixWcPqgo
	OmobVyhp04glbFYk53GV+E9H9jHM5MhRDo619+DpAZbtN2Hx72bOrt/vLqcKSbnplNVoPWZnfhs
	nRNFFLbHRyhH7nHU42ui0q9kexQdGwwMiaQW1Z1WilPss/hG0rjsnb5PA1ncYiAJ2WvYXb6pNR+
	iT1EDRxUQC4jRIWZJvJuI+I9Vb6
X-Google-Smtp-Source: AGHT+IGoMSLY9lsTFPrOE6tSEpdCd5ie6iLYbodlIhPMnaNwXHeZCeGU+4uX0c9H+JAl0U/iHZdR/fO7RStqqoUApdE=
X-Received: by 2002:a17:90b:1dcc:b0:327:70b9:9d68 with SMTP id
 98e67ed59e1d1-328154551d2mr17853246a91.16.1756846274566; Tue, 02 Sep 2025
 13:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250729174332.3acd1a86@gandalf.local.home> <CAFLxGvxZJv_A+YKCxVcd4yxPXLhHD5L9VzkvbFKPytxXc5vWaw@mail.gmail.com>
 <aKCLGvmPLPwjyw13@shell.armlinux.org.uk> <CAFLxGvwPwrG6KVsF=hKn1SmbC0yjLVjm6h8t1+qFE0GkO7rUbQ@mail.gmail.com>
 <CAFLxGvzcaGjNAWzCjdQdnOQjGPOqPg_VY2UBpp7Q6pGVBvAa_A@mail.gmail.com>
In-Reply-To: <CAFLxGvzcaGjNAWzCjdQdnOQjGPOqPg_VY2UBpp7Q6pGVBvAa_A@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 2 Sep 2025 22:51:02 +0200
X-Gm-Features: Ac12FXys35k1PMljuy9oRGh6uxKxmo60Bv_GaMm35fWBEQYYoeQIEqgC8yfWzDA
Message-ID: <CAFLxGvyBcaf76F=O2w7q7pJGEGLtS4GwgOjfN=vLV3=80CfWnw@mail.gmail.com>
Subject: Re: [GIT PULL] runtime verification: Updates for 6.17
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, 
	Nam Cao <namcao@linutronix.de>, John Kacur <jkacur@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_135115_502789_AF5A91B0 
X-CRM114-Status: GOOD (  18.06  )
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

On Mon, Aug 18, 2025 at 10:41=E2=80=AFAM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Sat, Aug 16, 2025 at 9:26=E2=80=AFPM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> > > Also please check whether you're using frame pointers or the unwinder
> > > (CONFIG_UNWINDER_FRAME_POINTER or CONFIG_ARM_UNWIND).
> >
> > With CONFIG_UNWINDER_FRAME_POINTER the stack trace is sane,
> > so only CONFIG_ARM_UNWIND is broken.
> > I kind of expected it the other way around...
>
> I found time to gather more details, maybe it rings a bell...
>
> The problem is related to va_list. As soon as va_list is passed as
> function argument the
> unwinder is no longer able to unwind correctly.
> Unwinding vpanic() does not lead to a correct frame anymore.
> Maybe because of va_list the function arguments are passed via stack?

Time to post an update, there is a problem in the ARM unwinder.
When the last instruction of a function is BL, LR points outside of
the function,
this confuses the unwinder.

This branch contains two WIP patches from Russel and myself to address
the issue:
https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git/log/?h=3Darm_un=
wind_fix

--=20
Thanks,
//richard

