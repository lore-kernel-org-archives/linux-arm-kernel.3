Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49FECFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RFNnnB+O0p0aRvheGlQAuqZY0fWkIb7EfMdt4bgYjU=; b=JiJYFKHezAbr37ULtjgFpGRY81
	ZJ0Ome5njDlFV+b3DKPZVYwtsyXAM4y/AKn7j/8VImV8kRTgP2OWJkhVCjnGWMjMEGmocghOdtIPA
	0vT0jPGA9u4EvvTplyPp+081ZOT85mYTTluQ06IhONXcOMEO00o17ICiGTPAtFgtuSHmPnBcP2zIf
	sBvj4HcqeLeIKU1RB7/v0LMqsU1TFHANUrG0LY3MZQVY/u4gOMn9MYAI51HcPmqkkxP8IXLs4HHEv
	uQgTLPc5sQq3uiiSj7Osus0MQciV9xEpudpqc7JbOKXkjsS+HebUABpp656v59MgwDXvOGMiqC97A
	4aFN08uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g4L-0000000FXAo-0tf2;
	Wed, 23 Oct 2024 18:26:53 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fK8-0000000FOsH-3ktJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 17:39:10 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso21452a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729705148; x=1730309948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RFNnnB+O0p0aRvheGlQAuqZY0fWkIb7EfMdt4bgYjU=;
        b=VsJbGx1kqT+zsOV1i76BGP9BRVaECy3KPWV//2QYzMSn6i7yYNDEfMnOhR30SwnJeh
         n7LK5c7370zvaX2TdBzVtsjAHeFYCAgJBIttNtMUkASl/jEO3h36MrNbD+ljnJ0hkP2j
         3ke4LdDZYznasEHdfM5zA4QcXznyhrKqd/PwSuDaJKq1CU0MqrNKVYFTcfjBo7xh0Z+T
         GGTmLrw0vkOUDymSZ1kEFqlkt98E3POXB9lVJ+q5TPIQPUGqd2ybdEzmEzmeaxNoFWQK
         969XXGHpiPscXALnDWWcOaWYH5ENMspVngyufr4xoemvrEFEIb7mx1BeGDSXqs/E47Ae
         UXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705148; x=1730309948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RFNnnB+O0p0aRvheGlQAuqZY0fWkIb7EfMdt4bgYjU=;
        b=jxxeFgx/02jUGLdamI+JRDaRfk1lnz2FHRy4ts9oB+PZQBq/ZDUbPuiSllNcujtVZC
         kcbyr800jyPr/8fNddnrcL9HacuSaMelWfWC1Fewni3OnXVF/2+ZQcFHCrVb7A7hMOaa
         1HAw6m6yGAWjM30fcaTjqe1USJJ6FkztJl53vj8EHdzpa2jzMzuN4FaYWvUfPDGCrNl8
         ko9/P4XAcOoy6uCh4NuLnxKx54TA1lh5AAjc0Yqc+vqrQALSaCyDuVib1ptAbl3EHr/w
         PuEy39XieVOxaNYKGZ5NoxF85rY0N+JKeVnWW0Jy6jlgYNMvqzidGEkdZHU8flS3lJFW
         hd6w==
X-Forwarded-Encrypted: i=1; AJvYcCUJxDkLOy9F7TxYq7rnfVOh0P+OIfjCI9aTDIcrWUn2Uv+mBrlJ55VbILWebbcVHUDa0qd1VBZzexUWyPTqR1OD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu4d4yVDLHiN//Lxt1JVvewoD6ZI6gVGyqvKTtXmRAXYIFHmfW
	885vm6Bxe4f2Ffx9MsXx959xAd/qASzpEyC69vxWqAlvpwgZLNDeWfce1iZ4ApZu4L/PTTwwyRL
	zGIWrreEHdyQxeM4rvZcGHCe1XKk=
X-Google-Smtp-Source: AGHT+IEi3chO4cJaxRAniC9KHshTFGfUXN96jvePl/7aNO37ofgEOlQMW+oad4DUIwtadK1f+w1v1UP4u0KBo3qeVKc=
X-Received: by 2002:a05:6a21:178a:b0:1d9:aa7:d6cc with SMTP id
 adf61e73a8af0-1d978b2da18mr4156793637.24.1729705146359; Wed, 23 Oct 2024
 10:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
In-Reply-To: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 23 Oct 2024 10:38:54 -0700
Message-ID: <CAEf4BzacLW14OmuW1nV4s=cMcSqcrSAO2Y_0XY3jT2efGNfmuw@mail.gmail.com>
Subject: Re: The state of uprobes work and logistics
To: Peter Ziljstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Linux trace kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Liao Chang <liaochang1@huawei.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_103908_963258_0FA2C926 
X-CRM114-Status: GOOD (  40.22  )
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

Ok, 7 days has passed, let's see how we are doing here...

On Wed, Oct 16, 2024 at 12:35=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> Hello,
>
> I wanted to provide a bit of a context about and tie together a few
> separate work streams (across a few separate kernel trees) all
> revolving around uprobe improvements, as there are a bunch of them and
> I'm sure it's hard to keep track of all of them. And hopefully I can
> also get Peter and ARM maintainer's input on some specific questions I
> asked below. Thank you in advance!
>
> In short, in the last few months there was a high activity around
> fixing and improving uprobes. All this is the result of increased and
> more varied use of uprobes/uretprobe in production settings. Uprobe
> performance is **very** important, and yes, we do have real use cases
> that go to millions per second uprobe/uretprobe triggering throughput,
> unfortunately. So any small bit of performance and scalability
> improvement is helpful. No, this isn't just some nerdy perf
> optimization work (I've been asked this a few times, so I thought I'd
> emphasize this again).
>
> So, we've already landed a bunch of work, mainly (not an exhaustive list)=
:
>
>   - various clean ups, API improvements, and bug fixes from Oleg
> Nesterov ([0], [1]). This simplified internal APIs and was a
> prerequisite of the rest of the work;
>   - changes to refcounting and RCU-ifying of uprobe lifetime from me
> ([2]). This improved single-threaded performance somewhat, but mainly
> significantly improved scalability in the presence of multiple CPUs
> triggering lots of uprobes;
>   - ARM64-specific optimization of uprobe emulation of NOP instruction
> by Liao Chang ([3]). This change alone gives 2x (!) speed up for a
> USDT tracing use cases *on ARM64* (we already have this optimization
> in x86-64);
>   - there was a bit earlier work by Jiri Olsa ([4]) to add uretprobe()
> syscall, giving +30% speed ups.
>
> And there are a few more outstanding changes:
>
>   - Jiri Olsa's uprobe "session" support ([5]). This is less
> performance focused, but important functionality by itself. But I'm
> calling this out here because the first two patches are pure uprobe
> internal changes, and I believe they should go into tip/perf/core to
> avoid conflicts with the rest of pending uprobe changes.
>
> Peter, do you mind applying those two and creating a stable tag for
> bpf-next to pull? We'll apply the rest of Jiri's series to
> bpf-next/master.

Jiri has reposted patches this time CC'ing Peter, heh :), it would be
great to apply those two patches and get a stable tag. This is
blocking the landing of uprobe sessions in bpf-next and also my
remaining patches will be based on top of Jiri's uprobe changes, most
probably. Peter, please take another look, thank you.

>
>   - Liao Chang's ARM64-specific STP instruction emulation support
> ([6]). This one will give 2x (!) improvement for a common case of
> having STP instruction being a first instruction in traced user
> function (similar to NOP for USDTs).
>
> ARM64 maintainers (cc'ed Catalin, Will, and Mark), can you guys please
> take another look? This one was a bit more controversial, but
> hopefully there is a way to massage it to be acceptable and not
> introduce unnecessary slowdowns (there were some concerns about memory
> ordering/visibility, which hopefully don't apply to uprobe cases).
> It's an important improvement, I'd really appreciate it if we can make
> progress here, thank you!
>

Ping. ARM64 folks, can you please take a look and reply? Thank you.

>   - my speculative VMA-to-uprobe lookup series ([7]). This makes entry
> uprobe scalability scale linearly with the number of CPUs (the
> ultimate goal of uprobe scalability work).
>
> I think it's ready to go in. It has **implicit** dependency on
> Christian Brauner's recent change for FMODE_BACKING, for which he
> provided a stable tag. Peter, do you have any remaining concerns or
> this can be also merged soon?

No changes, still ready to go in. Might need a rebase if Jiri's
patches are applied.

>
>   - another patch set of mine, switching uretprobe fast path to SRCU
> (with timeout) ([8]). This makes return uprobes (uretprobes) linearly
> scalable in the common case (again, the ultimate scalability goal).
>
> I haven't gotten much feedback here, would love to get some objective
> review here. This is an important counterpart to the speculative
> VMA-to-uprobe lookup series. Both are needed in practice.
>

The only thing that has progressed, thank you. I'll apply suggested
state changes, but I intend to postpone delayed_uprobe_lock rework to
a separate follow up patch set. Just a heads up.

>   - patch set dropping unnecessary siglock usage in uprobe by Liao
> Chang ([9]). This one removes yet another lock, for a less common case
> (at least on x86-64) of single-stepped uprobe (where the probed
> instruction can't be emulated).
>
> This one needs a rebase, but it was already acked by Oleg. Liao,
> please prioritize the rebase and send v4 ASAP, so this is not lost.
>

This was rebased and acked by Masami. Seems to be ready to be applied.

>
> As you can see, lots of stuff needs to be landed and most of it is in
> good shape already. I'd love to hear thoughts of relevant people
> called out above, thank you!
>
>
>   [0] https://lore.kernel.org/linux-trace-kernel/20240729134444.GA12293@r=
edhat.com/
>   [1] https://lore.kernel.org/linux-trace-kernel/20240929144201.GA9429@re=
dhat.com/
>   [2] https://lore.kernel.org/linux-trace-kernel/20240903174603.3554182-1=
-andrii@kernel.org/
>   [3] https://lore.kernel.org/linux-trace-kernel/20240909071114.1150053-1=
-liaochang1@huawei.com/
>   [4] https://lore.kernel.org/linux-trace-kernel/20240523121149.575616-1-=
jolsa@kernel.org/
>   [5] https://lore.kernel.org/bpf/20241015091050.3731669-1-jolsa@kernel.o=
rg/
>   [6] https://lore.kernel.org/linux-trace-kernel/20240910060407.1427716-1=
-liaochang1@huawei.com/
>   [7] https://lore.kernel.org/linux-trace-kernel/20241010205644.3831427-1=
-andrii@kernel.org/
>   [8] https://lore.kernel.org/linux-trace-kernel/20241008002556.2332835-1=
-andrii@kernel.org/
>   [9] https://lore.kernel.org/linux-trace-kernel/20240815014629.2685155-1=
-liaochang1@huawei.com/
>
> -- Andrii

