Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD150D3A679
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynacYz6swHjZ02f11a+UlbsVE/1P3vOR86gVEDQ9s+8=; b=Rxgx2DXktuKT6W1N2Pg4viCArf
	aWNgCxl6tAY+vSk8/AKRoOMWPfPi2bmsSyHWuMF+0MCeuQ0i7TxEEEGy6dwDFd5x1TcP8HgfHdqvR
	nIghdzsD6/L0hVMujlEZqqHQ/+KyHmFYoX/hs1xy5/cLccxvA29qLKQtayv2laAFpN7xzqziEv3l7
	WZ6kRDaELJC8H+HizUsqMtYkXargsif8LMTE9Q5X+BRanWymYvf20nGGl5twlvMlAhUKCfbC+gUKl
	iBYryFWfVLwUm1mY5iY0Z1zKtbYRaJNtNGg1tTXE96d2HfDMuMPB6/Y/I9t+04d5oVzGgs9lrKAmU
	U955OR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qJN-0000000FNRj-3ivh;
	Tue, 29 Oct 2024 17:47:21 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pfj-0000000FD1m-1i1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:06:24 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-460a8d1a9b7so10111cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730221581; x=1730826381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynacYz6swHjZ02f11a+UlbsVE/1P3vOR86gVEDQ9s+8=;
        b=0c+Soq2ahnIcPQc4cl5SDbPj+9CsP7t6LwwnWYuzKYWjnQDAFBomxohoCArEdyH8Sf
         DYQEYM9g1GdPZQkv73IZo0l9rDjW7ltk6csx6cM7lgh29RAQOzsHlZ5/MaAfkG5IR/0y
         5y58UQ6ITIm0S6GEObNWkbCFSvqkoLOjFhgHNc2ajr9i2fvRKDLW4jjzHbU3Qx6A7u/K
         N1Ejkydzy2ZNQcNiQMgQfPgWeT/JZg7mHqZCBjBmaKe4G6zJ7t3WfCqzD47wn32nZeVk
         ChhxOSNjTicQxVbX9xOVYeKTItvtKo1vF1J5Wg4/A9R2Y7esGT2LzccvC/WFjjwBk8xk
         Jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221581; x=1730826381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynacYz6swHjZ02f11a+UlbsVE/1P3vOR86gVEDQ9s+8=;
        b=fcyLXlQscoqawmyn2RYKrDHaGXHKNrhGUYB+bHSed+eBkJq190TM8ZXBLE5aM4rIO2
         szwBDDQXxg2vb5mIxPC6/vQ0FYz8T6KY4gsFfKGBPi4JzrFVZkW/B2W0dQqbMuP2MWDm
         gaif03W3hzUGe//Fs99KdXdIqLd1jpeskhfmIwHxa+P1r4dmvAAZueln20sSVzalMey0
         T1cF6kaNXYEamD7+FsPgzH+rhnOUNETTrR4uHkiCrhHyMzcotzLua9NK6gTmGWu6Z3Pu
         DhgXJEhH4aSObHEQ0uh2WPxKPWOXXLanaGd3seigEZh9FAmxX2Xzb3/r5CQs9PsK49zR
         JbkA==
X-Forwarded-Encrypted: i=1; AJvYcCUy+Q6PZTdL0zT1wp3Bfcs2gX0+2oycDdh7ectkvuwm7+PBv0y7gK4dZoFaSUOvRAFg6wMJm0mdUZwQNGjG+YTj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6IEzJhY+zLKzicHeipJs+3+X1mR8MLGcWF+ASG1ju/4W2hjNv
	l3aUntzmUtSQ45KS+w2GmSR3vl3uLlns+CvM3/a2GacMwXsbw6znX2A6C4Obv6H40x6kA+juyjL
	RBnkDIKFAb7D4Vy9tzWrkMwR1jqE9OPSihcni
X-Gm-Gg: ASbGncvQkbAMmuXbdeg1VFg+1T+FTbb8xuRoaervfy5GqYQ/FkZunn2yBSSnaMjYouW
	sDIr/fxThZl4NyiFkykgGCSvnBqc06nHe/fOVY7RRHV0Y/nIGTRRH9K3qZlPvK+vf
X-Google-Smtp-Source: AGHT+IERQ2wd6YprqS4eYvnnD7z6rw6ImUej3A/vL1S07gFistJ64iydzViz9z7fnItMS60psPXdYpEjxesagiZuwK8=
X-Received: by 2002:ac8:5dc8:0:b0:461:43d4:fcb5 with SMTP id
 d75a77b69052e-46164eaa58fmr4706231cf.2.1730221580720; Tue, 29 Oct 2024
 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241028234533.942542-1-rananta@google.com> <868qu63mdo.wl-maz@kernel.org>
In-Reply-To: <868qu63mdo.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 29 Oct 2024 10:06:09 -0700
Message-ID: <CAJHc60x3sGdi2_mg_9uxecPYwZMBR11m1oEKPEH4RTYaF8eHdQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Get rid of userspace_irqchip_in_use
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_100623_483198_453519AC 
X-CRM114-Status: GOOD (  14.68  )
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

On Tue, Oct 29, 2024 at 9:27=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 28 Oct 2024 23:45:33 +0000,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> Did you have a chance to check whether this had any negative impact on
> actual workloads? Since the entry/exit code is a bit of a hot spot,
> I'd like to make sure we're not penalising the common case (I only
> wrote this patch while waiting in an airport, and didn't test it at
> all).
>
I ran the kvm selftests, kvm-unit-tests and booted a linux guest to
test the change and noticed no failures.
Any specific test you want to try out?

> Any such data about it would be very welcome in the commit message.
>
Sure, I'll include it if we have a v3.

Thank you.
Raghavendra

