Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A77BC02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 06:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9NvLmW/A6uUOB760Lj7I76Wak9fBpOpnPabjMwc01o=; b=LPnX7mCNfJ6Y+BzFf/k3Ply4oW
	YZ20y3LPYb2q/1YlFjKnTsDsXByUmlk/wqQUXvmsfTdA9bfrNFqfP9PHTrrIBVo++69vQJ9qvND6g
	qwRMjW0dXFvNeAdmKb1KZyKaJg8iG1a34DT/DBxY7KfZ1zzlfXpQ1H7FGawbtyL+0qSD11yh0bek3
	ELO/ZKHHGxi/VTRCPH3e61cXo4SlgBIqRFSnguiT+xHGfNrG1z/wZhu7ZHIUWGvuucgobMlFmHNbQ
	J7xbo1fZyUYIARk5/yZdEPrqft5Qpak/XOh2wfCO4f7mTX/K2SpFNW5vZCCC4hkkOmCQF0VMkhm52
	fHde2+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teTdO-0000000DRQ2-2qGm;
	Sun, 02 Feb 2025 06:39:10 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teTc4-0000000DRL6-420j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 06:37:50 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-216311faa51so59620815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 22:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738478267; x=1739083067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9NvLmW/A6uUOB760Lj7I76Wak9fBpOpnPabjMwc01o=;
        b=AOO7a3uP9Z0r9LltPOTnkNvhY914FgPQotVrd21sYZNA5eUaKhOf/JLjy55GPnZIz8
         8veyVUOHY7Bjuapkc02KK1ZXeBL+lABJb6y/g/NHjSfe14WEmGz/G9+CQmv5h8d+IQUy
         HbxwloPjbzchqQVFMlchuh63DbeYAWFZmPNJqRS9zme4fTE9sAn+kyAewlenFyvOZ+Rd
         c++FR78oZ+aTbslAnqDg1tJKL40DVjXaUDlVV1VmNiEQUwLbTmIrX8POrttSHSeaukI/
         QG8MsEszXqaEa9Xfzaa/PzY62BeJWXll2HVAfxe3Amo0XThJNmTeoxiSICrwOW903YUJ
         CDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738478267; x=1739083067;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9NvLmW/A6uUOB760Lj7I76Wak9fBpOpnPabjMwc01o=;
        b=JpRhuJClmegdlLmVfotlegr1ewNdZ8ygn3/OTUxgunD4zN3gStIRv2t+PO0NnUNflY
         s1bk3mE9ZJveji4EGW74617xRlQcY4l+FxuoJJ5UO703/cLc6BTGPEwORiK82Ln27kQz
         c/BhdiJf6t5d8zSu8yommqoVvSlmlf+2JV8GCXAVPO76R37iXKQfMkEGnTIiQ843gMcv
         zcH2dz8vbQqLdl8ky3r/F7jSs8stPM09jTHn8WDrk/XOZ5aEDk5LNxEAo6xdQhRWTKkf
         vcxB7vu065gmN5BjIG2k+K5Bnzzete9dMSKIw618ioY1h0NNhsH4kdno1S9juKur0ndA
         Rr0w==
X-Forwarded-Encrypted: i=1; AJvYcCXtaU4//tSbdprbGkJ8VXB0Zeq15UNSq7NV/YxSSVsTKBP2c1nG8cu+D7uVrCs/SSwUSREQ16/LY5CPY39bjFWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEL4xj/zG5IKCz72WE9oEe8098T5aU6DnVFaIdQyJirE0AaTo
	fRNJy2JkbEeBw/9+wiZW6syv6+1SJwFNDmrWKR7G7/I91ejuXeAcL2HNLI6Wy9RUKnYR+Xjh8w=
	=
X-Google-Smtp-Source: AGHT+IEViwf7ftDA47jzjJ4JIFfkYBeziUL/Uim6LKs1f/dyvgToTVzbkfLeuhfa6q0+31njXbcGNfqpzQ==
X-Received: from pguy8.prod.google.com ([2002:a65:6c08:0:b0:8ae:4cf4:372])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:240c:b0:21a:87e8:3891
 with SMTP id d9443c01a7336-21edd7eba4fmr152671605ad.6.1738478267463; Sat, 01
 Feb 2025 22:37:47 -0800 (PST)
Date: Sun,  2 Feb 2025 06:37:44 +0000
In-Reply-To: <20250202062728.753686-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250202062728.753686-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202063746.759828-1-wnliu@google.com>
Subject: Re: [PATCH 4/8] unwind: Implement generic sframe unwinder library
From: Weinan Liu <wnliu@google.com>
To: wnliu@google.com
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	ptsm@linux.microsoft.com, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_223749_100927_2E97E724 
X-CRM114-Status: GOOD (  12.34  )
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

On Thu, Jan 30, 2025 at 2:29=E2=80=AFAM Prasanna Kumar T S M <ptsm@linux.mi=
crosoft.com> wrote:
> On 30-01-2025 15:52, Prasanna Kumar T S M wrote:
> >
> > On 28-01-2025 03:03, Weinan Liu wrote:
> > > This change introduces a kernel space unwinder using sframe table for
> > > architectures without ORC unwinder support.
> > >
> > > The implementation is adapted from Josh's userspace sframe unwinder
> > > proposal[1] according to the sframe v2 spec[2].
> > >
> > > [1]
> > > https://lore.kernel.org/lkml/42c0a99236af65c09c8182e260af7bcf5aa1e158=
.1730150953.git.jpoimboe@kernel.org/
> > > [2] https://sourceware.org/binutils/docs/sframe-spec.html
> > >
> > > Signed-off-by: Weinan Liu <wnliu@google.com>
> > > ---
> > >   include/linux/sframe_lookup.h |  43 ++++++++
> > >   kernel/Makefile               |   1 +
> > >   kernel/sframe_lookup.c        | 196 +++++++++++++++++++++++++++++++=
+++
> Nit: Can this file be placed inside lib/ instead of kernel/ folder?
This could be integrated with Josh's proposal in the future.
https://lore.kernel.org/lkml/cover.1737511963.git.jpoimboe@kernel.org/

Either lib/ or kernel/unwind/ are ok to me.

