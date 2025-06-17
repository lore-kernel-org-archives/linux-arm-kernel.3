Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC0C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=; b=I9uwCsYGfM+damb1LViNo0USfA
	aw0MQe65pLN7xypQJTj1dNLMjeZZ/AU03AstzsGrSku4V1M/jnP4hH0ZiA9tgdTEBQlQuW/fBeAEw
	CHKTGCcHJjvJLxdtHv//sy0N0Zl3a+3POoNkeLFrfaFvVzGY22E/HNU3FhYZxgTlnBcHLhklWMFfV
	Mhhm0a0vnrrVsL5aEHJ16vqsSCTLcclvhXfDAqRwQZSvP9UQeK/z6Vq8oMifqc3UZxR1x5frg7kWJ
	DeytYjvgQKg/lz6KPLpfuPJW1m7KPRdqTpx37PrITfs2MYsjomrvMTf1BrDHjzk6TAG9hRgoeHk7C
	E+uQBpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdci-00000008PdL-2wTw;
	Tue, 17 Jun 2025 21:13:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdZj-00000008PCm-2Gwv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 21:10:36 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ade750971f2so806345466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750194634; x=1750799434; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=OVHKgM/8zBoo96h2jh4zcJgbjcLlWyH4hdBfi0AI4l4zV0TX1JWWOeLz3a/MXNxLMT
         XtrRIXSmoxplxaFt8wjZZP0wSAjxOwdbZKljcwUZJ1WushJso/yaQCNRYU7cwJ2ctwDz
         KFTaf8oSLn9qkrf112ac5k2syUQiNjYJWR9hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194634; x=1750799434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=OFhQVwMKHzSHg/6Yj+JWlPrCt+SgeOwLoDV16QxHdDP+wTThtArj4NKuv3F8WVUs2c
         svdRsTvKKpZMbTww6h8VMGu0j8MpnrF30r7QAfiNV9lMMV/c3knPuD98MkKFp1LC3UPI
         iHlLadASlrPH68ivfEfOZF8FiSHQKjtngwsKdnluFVVC2szwJKSLxR9Qnz8trpGAIf4b
         QnUNHShDwWZ8LB5tmwmWmu+OaModJtxr43q09+n1ATOH4p5IdPN99gQxD4MGw8OAMuZC
         CNMoO8F5S/aGyFI22qZGceNkDGqQTbF2x5MsNALTsZI6p3u6voPipjKFH8jNRDPjCDRP
         QzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDG7mbPwuwLIE1A5rbQlauerzVBT8OYKU1x0Qbb4cRsu1DBHQlojf8gbh3mgixNNKHK9FIDlkxpjJydogVwWBx@lists.infradead.org
X-Gm-Message-State: AOJu0YyQYsVd0F8y55Ja9YRuVvRVrg7qyyDcTD6G+ZnO9E0QDWOCfYmt
	LmECgRy73UrYJR/2I6CQxAlUtxNqX5ZO4ZBOGLE/FCFCy3UVR4CAvUCkG9hySXWuK7484PoBhnN
	vT4fR+ts=
X-Gm-Gg: ASbGncu6RGHQfdHzlAM0lUgclfiFVx/Kxx7RfYaAJUwaUFicVOaQNL0eMy5YMniVA05
	VHM8a22m61PqtjnDxXnoK3TDo6R51UHXSCqb2fy2rj+yBbZ8mQiZi2+DzoEXmcm6bGRIjuNRBZ1
	N8Oq9JTFtB1kGcaMDd2Wi4yskIKpWxodxwILZyb239esxEXlTulBPaJy06B3t3AHtFcqNahi94N
	R4VgNQ8jQoQU8IHk4YeW+dKywrCeutf3XZzw3IJ6uvCJEHMos8RSrQH/KmJ6jFe2rIoSPkF7xn0
	AU3ZEDG3pXpSgDoCY4dUjlC6DPBXIYcCvU3MiDxan3PgtO1vMUdy7rJMDWO6XIRxnO4FGi9iJ94
	pz5Xt+DZLKA1n1IHuFP9upRzDH5x2lGJjuWuY
X-Google-Smtp-Source: AGHT+IGHRKeVbEoMaD/e8Q2bXOcNNsFuRm/1q3AdF8i7Nvr9ttcrhSCkL8YnZ7fVMtoofJ7FDQNLiA==
X-Received: by 2002:a17:906:6a1b:b0:adb:4203:cc9c with SMTP id a640c23a62f3a-adfad46a361mr1459962666b.50.1750194633685;
        Tue, 17 Jun 2025 14:10:33 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d4dsm919510466b.28.2025.06.17.14.10.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso10773288a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdCoBAHz97PvJPI2b+bDo8bJHYoBZAakS0sstqclOnG+mldmXSUM/RAnjxoM/AEnJIcCL6hqSrM92hbR26wRGh@lists.infradead.org
X-Received: by 2002:a05:6402:5188:b0:607:f55d:7c56 with SMTP id
 4fb4d7f45d1cf-608d097a0a3mr14798722a12.25.1750194632040; Tue, 17 Jun 2025
 14:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol> <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
 <20250617203726.GC1288@sol>
In-Reply-To: <20250617203726.GC1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 14:10:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
X-Gm-Features: AX0GCFteh8AxHdG-O3SktB-Vd7hTjMUC_EBJsHwrbakY8eEhqvV4OBO-zVcDyV4
Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_141035_616546_A1582CB2 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue, 17 Jun 2025 at 13:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Okay.  For now I'll keep the test commits last and plan for a separate pull
> request with them, based on the first.  I fear I'll quickly run into
> interdependencies, in which case I'll need to fall back to "one pull request and
> spell things out very clearly".  But I'll try it.

Thanks.

Note that this "split it out" is really _only_ for when there's big
code movement and re-organization like this - it's certainly not a
general thing.

So you don't need to feel like I'm going to ask you to jump through
hoops in general for normal crypto library updates, this is really
only for these kinds of initial "big code movement" things.

> Just so it's clear, this is the diffstat of this patchset broken down by
> non-test code (patches 1-3 and 6-17) and tests (4-5):
>
>     Non-test:
>          65 files changed, 1524 insertions(+), 1756 deletions(-)
>
>     Test:
>          14 files changed, 2488 insertions(+)

Looks good. That's the kind of diffstat that makes me happy to pull:
the first one removes move code than it adds, and the second one very
clearly just adds tests.

So yes, this is the kind of thing that makes my life easy..

> Note that the non-test part includes kerneldoc comments.  I'll assume you aren't
> going to insist on those being in a separate "documentation" pull request...

Naah, they're relatively tiny, and don't skew the diffstat in huge ways.

             Linus

