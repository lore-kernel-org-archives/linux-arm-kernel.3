Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD51C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=468JTzppqOaSuiMXzT6POZ5cXvHYJkY8IrPBC869EIw=; b=cAsQor6fjkFv7r7OXYXH1p9BlI
	gDNj7VyD+cKzrQtYbYXa1r3ZwCGJbgLO9Jo0bYGJKXfcg34cjPdH7S4rLGvnQ45LzBof26eltvNjf
	w+iT6bSI4vSmb1S73Pt6nRHc4IzeQWu1euwF+A/2C/k47qa9rb62aNb0aOL2MwFhcuzOMmpLpw2Ve
	1FAexcZ+Jrrm34811IW+pGlV7nw+QsjvcwK9WiW/87guAaUT6dPtfq1U2ucZb470SeTTdws/dajr1
	Nn+DU20ffyQ73fIaC8mTq2C/iw+oo7vjBHSeBWnQorIhNHAHSxGUOnSn2+S/nxSFYF4nAzu4U9Qq/
	dO45tnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig8D-0000000CbMf-3j4I;
	Thu, 13 Feb 2025 20:48:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tig6G-0000000CasN-2COQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8263B5C5A58
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A86C4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739479579;
	bh=1Hv1W5PIRbegvr3gIqvOw2rrDiC6G9t1Dr/tCrD03e4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pc+cVpYpVZcf6SPMc0R4TZfa9dQgW/98u31mFBPL6EqlUEgpeqxiquPXLdZZPUMHr
	 XKlJVilhTTClQTbKNTB0MAKFBw86OLoP4k30EQ0+OHdMP0uszjwwhnmCkH2FaiGAaS
	 eCRjHlGOvhxl3xY/o1DmVFpRMvF8zYtzYzM8+LSRKzD6q569tkZUbmnVre5GQqJhjg
	 BoM+rpVOjjRGo/vbisYr2rlyw8glE6AZ7dXlw/bFDU/b4fs7CLTQegiMGHMG1svc94
	 8uCQTaioL8TWofbISnJ0wtN3WwqCegD3iJe8wcxYr/JTdi29y9Pw8yqRaqXJ7FLJTd
	 94RUXcfCZPpsw==
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso3985125ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 12:46:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgBsYTxx6aQdT0fdGhEYo5QSEiCpoOiilpzbHbeMFBf5ql/cIKrfZFHIaOUKVpctKbjwqpXSf1LhT/dJIoh2ZN@lists.infradead.org
X-Gm-Message-State: AOJu0YzE5qLrIdkYbgUuYTzDasVoKl0+s5lEW06c+i1Q0kw4WgWMF8IK
	Y4E5hdN3eY1m3YsM+IO5KOYWCe1u22TYdjX+3rLYc9CExIxwRUDgHRo5gekFTBP2mQi5z5TIpLi
	1KAIQuR6p0F9LT9pHBFVfRw8+M9A=
X-Google-Smtp-Source: AGHT+IGQ7pJ/TiGbTLryDYR2+5szRZiiwjnj755YU/aasn/qcPVr55ah50aMoRFrQI9umJnTpry+8wekUMj6OpAzbMc=
X-Received: by 2002:a05:6e02:20cc:b0:3cf:f844:68eb with SMTP id
 e9e14a558f8ab-3d17bdff4afmr78463815ab.4.1739479579147; Thu, 13 Feb 2025
 12:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com> <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org> <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org>
In-Reply-To: <mb61pseoiz1cq.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2025 12:46:08 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
X-Gm-Features: AWEUYZkl0WveZP-8jA0rX6lZvo2HZZiSPy4b5e09ftMa4XtdnE-_yHKMbg6ADZc
Message-ID: <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Weinan Liu <wnliu@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_124620_603983_9DA3E620 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, Feb 13, 2025 at 12:38=E2=80=AFAM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
[...]
>
> P.S. - The livepatch doesn't have copy_process() but only copy_signal(),
> yours had copy_process() somehow.

In my build, copy_signal is inlined to copy_process, unless I add noinline.
If I do add noinline, the issue will not reproduce.

I tried more combinations. The issue doesn't reproduce if I either
1) add noinline to copy_signal, so we are not patching the whole
   copy_process function;
or
2) Switch compiler from gcc 14.2.1 to gcc 11.5.0.

So it appears something in gcc 14.2.1 is causing live patch to fail
for copy_process().

Thanks,
Song

[...]

