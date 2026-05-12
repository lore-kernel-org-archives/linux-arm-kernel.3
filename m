Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE390CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGBgDfJ4AfqTknCN9alQ+NTutahc0Gme/TPQUtzberI=; b=HJeeDkzO0MJgsT24CFdtcQLjNo
	v/VacquAxEJuuGBgb6c64biViRh7pYStfkVgUsOLpZW7K7C1ptZDBBInSZMkpZx+foKlVX+x0WHyn
	eHEmrABNBa3RAt/VQvJ/i8am1RjtJqwkWdzC/oIfSnm87bzteRX7luAJxdL1l86v7ziKj9gGl9RNa
	vj22cp2vt++yZxPzEYMD9TI2UVSNJmgq1asKZkHqKbtsxMGcVMzoUYf2coUgyPQagyO8hB/hgiG59
	ovwj7bgr5yGPMseERf62LyLlVg1+uDUPZgBudMU7phs4ibJEtHNUFbzE/2xtmgtZk6mciEnhae1G1
	WmJCy+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdMK-0000000FK2c-1VuV;
	Tue, 12 May 2026 03:00:36 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdMI-0000000FK2C-1rku
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 03:00:35 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso1449253241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778554833; cv=none;
        d=google.com; s=arc-20240605;
        b=NOsfXgKNhW6IPrBxLnljgwd9hpkNwwxTjjrQdOOKkd+Zwvh9dtyaoDClDKpJUXfoU7
         6+1QZcv5ghHRB831/yVQ/NTsqyiSiCOhGAwPI7ipqEZDjK66E7SbjhP0cjQMYSlS1V05
         Vim2znSZtTyw37dajhPakYr5G8HmfThSSZxDAPxQmhecAOwIVvEibe4y9bEHXiINO1Dw
         zT0byG1WZUe2HXCPzDPBQ72VjEYn9+kWmzlp9vRl7rUUp21IFT11OkoVrRiqjmjIBlsX
         NQ/FKQinKuaOZhfjs8qCon4OVodFZcbLEzzp7sJQRQXlqCtj7S4EQtx+cApwukFSkDxl
         MjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YGBgDfJ4AfqTknCN9alQ+NTutahc0Gme/TPQUtzberI=;
        fh=Tu9Mi1GlKQiTeCCtPodAaObqNBLCj1A3Cde1FGilXPM=;
        b=aE2BXcGbb/8xJE4tb4MjXixFGcpmjDhiPW3/9KlcEj1XtlIRnaSKzviHpKF/8A8kTP
         FH6WKy3KyC6PpTqsuqZb+tIxYdZN9x6gcK3nES9ueJUSKaFfPpj9flxRUgZbhR4Ydisp
         Mi7gbCjJFHwrzwTrmOjvR8Rsxz0fOHmdO3Segd7u+F4rEGX4LPaHyrKpD2LBh3P+WbMa
         538WVZdjPXUKEYw075QJvmI0+FUpA+oNIePszPyvnWjRXWWOm0l33KAeBn8Gq8qNpsu4
         U6v2EE1bLaLLtuJ05b0Y2Br25lxUNV4kcDAobzharG1qBYE3B82gNtTkO7wJFU6R2/qa
         rYEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778554833; x=1779159633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGBgDfJ4AfqTknCN9alQ+NTutahc0Gme/TPQUtzberI=;
        b=wF9HkkEf+MbeIzEz7GJGMaJvmZsgi2fbCJ7TJkNbZYbo2TYotYEy/sdMc78ZVA2qL6
         7egYEn5cmu48gwiFHlEdN7vkv09vl2a/mdBPFzp3WfVL8JvpHm+9xdQMHnEJ+UCgMCch
         o5iqU+gJYQQnrlWousr/wZaB5Dmdqg6UOES8KOrh8/ngJsTmSW4VoZDaw/x+nQBsdYgC
         pcfsQzvXbBpK3cGVWjd6W6pKq2MrgHwbFukvN91cnLIBvUc9+ard/mURY7xKxkV7xuI6
         l1XBQJpfWv2gtBpvd7N85wKy87sEq+ONfjkUGVNXqLsvrIevJ0FV6QxebpvoTUkHwAVD
         GCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554833; x=1779159633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGBgDfJ4AfqTknCN9alQ+NTutahc0Gme/TPQUtzberI=;
        b=S6H8Ky7CEPOC230+ssDD0h8X/m2tDD/GwRB5xVXbrEK4byoXUc/S0/TWpZDTO2Ob2K
         NHIC8+PVOsMTjpDrJF71AYCYEG0oRTlqZWZbtUfYNHlQDON90gMYyP6S24HpUYio2qaE
         dUnOx3w57TSR+5nM5+9s9eHiZiXDZfzXY5o+btqoDcI0bIOfBYXK2uBt5CgcdT3RWWWt
         yNOXO6V2L6+RG8IcX5JJCbWpt8k31Ms2OwXAncdZ0BCoFFpue8ZNbvfhHOzpMo8A8ghe
         5pysQ5oB1ALqtbhP4uoLaoKWAzqGHxAZGKOBJG7isW0KB5FobB3TrlXtHUSj4rvVVN0M
         Siyg==
X-Forwarded-Encrypted: i=1; AFNElJ+IuZi3LFa2w+o2yAIch7Swzv9GlUCrwxQl9LHdUJ0NtIDFQlG/+4LRrIgPTGO5VevRH8Ql8oWTzObTpX6cf7y/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlhb9tl2LGCPxnQTB1/3qcZaBLx7xLDimpzXQhITQ3q4efxkWS
	1OTBVQIj5CNhSM4yoVdcbTk1wEoZU0a7cFNO1QnrI7PDd6lqwKu1qhhFNX2PqlE6eodQQXk37aS
	wv4+yHzVAa4v0rcJpkUIJkQETCxC4Hk0r2/fA6GdA
X-Gm-Gg: Acq92OFCf/1eMJkROmS7yHbBs1oZK4K8XNIzu7kMvjXc1ZugnK2UUkAoJS/5v4Ms3M7
	DvQF3/9TPwZiQWeEQh3DmO4wXVwK1IjYE752fwMx1WwrlARS41kigpu9FL1eT5AVi1rCFwegqFz
	859tACHP9rzFszhGVDgSEsR7E4fa0rfT8vws1ezMUAfOqlBbfl4U8CppiWr8mQdeVayOXhAu0jf
	RX519JRjLnaMp/ELMS/PtwcqCXNXUW37VIXDAWVM3gk/BzBLmwx0g8zU7qyX9/FQaQtiG1qAxaR
	+5jSOuyn+jw6WUdLlA==
X-Received: by 2002:a05:6102:4499:b0:632:3bb5:95f1 with SMTP id
 ada2fe7eead31-6323bb5cd8cmr4171542137.27.1778554832592; Mon, 11 May 2026
 20:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-9-dylanbhatch@google.com> <afTYzAF_x41pyilu@J2N7QTR9R3>
In-Reply-To: <afTYzAF_x41pyilu@J2N7QTR9R3>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 11 May 2026 20:00:21 -0700
X-Gm-Features: AVHnY4KILl4VsgMlK7qBJOos5aRlukhM-ZbxId7NyZjs6rIXnB83q0XCoxXRTm0
Message-ID: <CADBMgpx9YxNUO6wLP7mYKxWW8L78Hk9gPwHrMjXUwPyUmGEu9w@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] unwind: arm64: Use sframe to unwind interrupt frames
To: Mark Rutland <mark.rutland@arm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_200034_505843_51547B2C 
X-CRM114-Status: GOOD (  33.09  )
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

Hi Mark,

Thanks for all the feedback and help on this. I'm planning on getting
your comments addressed in the coming days, but I have some initial
clarifying questions.

On Fri, May 1, 2026 at 9:46=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> Hi Dylan,
>
> Thanks for putting this together. I think this is looking pretty good.
> However, there are some things that aren't quite right and need some
> work, which I've commented on below.
>
> More generally, there are a few things that aren't addressed by this
> series that we will also need to address. Importantly:
>
> (1) For correctness, we'll need to address a latent issue with unwinding
>     across an fgraph return trampoline, where the return address is
>     transiently unrecoverable.
>
>     Before this series, that doesn't matter for livepatching because the
>     livepatching code isn't called synchronously within the fgraph
>     handler, and unwinds which cross an exception boundary are marked as
>     unreliable.
>
>     After this series, that does matter as we can unwind across an
>     exception boundary, and might happen to interrupt that transient
>     window.
>
>     I think we can solve that with some restructuring of that code,
>     restoring the original address *before* removing that from the
>     fgraph return stack, and ensuring that the unwinder can find it.

If my understanding is correct, the issue arrises in return_to_handler
as the return address is recovered:

mov x0, sp
bl ftrace_return_to_handler // addr =3D ftrace_return_to_hander(fregs);
mov x30, x0 // restore the original return address

Because ftrace_return_to_handler pops the return address from the
return stack before it can be restored into the LR, it cannot be
recovered.

Based on this, I believe you are suggesting to restructure this code
path such that the return address is removed from the return stack
only after it has been restored to LR. But since kernel/trace/fgraph.c
is core kernel code, will this end up requiring either (1) a similar
restructuring of other arches supporting ftrace, or (2) an
arm64-specific implementation of this recovery logic?

It looks to me like there is essentially the same recovery pattern on
other arches; is there a reason this transient unrecoverability isn't
an issue for reliable unwind on other platforms?

>
>     I'm not immediately sure whether kretprobes has a similar issue.
>
> (2) To make unwinding generally possible, we'll need to annotate some
>     assembly functions as unwindable. We'll need to do that for string
>     routines under lib/, and probably some crypto code, but we don't
>     need to do that for most code in head.S, entry.S, etc.
>
>     The vast majority of relevant assembly functions are leaf functions
>     (where the return address is never moved out of the LR), so we can
>     probably get away with a simple annotation for those that avoids the
>     need for open-coded CFI directives everywhere.

Are you suggesting something like a SYM_LEAF_FUNC_(START|END), that
wraps CFI directives for leaf functions?

>
> I've pushed some reliable stacktrace tests to:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace=
/tests
>
> That finds the fgraph issue (regardless of this series). When merged
> with this series triggers a warning in kunwind_next_frame_record_meta(),
> where unwind_next_frame_sframe() calls that erroneously as a fallback.

Thanks for the pointer on these tests, they're super useful! I've been
able to reproduce the fgraph failure you mentioned.

Thanks,
Dylan

