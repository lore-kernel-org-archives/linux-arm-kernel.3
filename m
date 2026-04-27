Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA98FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbhNNtkACDoe7xFvlMDxo1hg3mD7N2S9mOLV3kh/g2Q=; b=TERzdzzCdWO2VhcJWQSw20ZfUt
	Z8e8fZmm1Hoi0Ak1oycPBE7q0JhKMdWS1WQoNoL3hnGiZMNhc+/kI2Ik203V5s7iLvSp+bEIomFTk
	6AndR1aXwq/+L3tazkaMtZVz8PN1ncwQj1ehhlQle8ZB/cCNsg/H2746CdYKXdWVG4crpDCrTiLbt
	n6khx0ciRNOmIp1jy/fRwgfDyPaLlZqJRTGuhMv9wLFphVRQE+e/Hsc9bwYQcZwwgh3tc5MroweSJ
	A3mkpkAGxsvd7SbRJX3UKzcB1sivWL6ls5iwRR3GEdn9k4oghQTghwRhYrR5a55qkbDPPds4qyguB
	SlBvqHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOez-0000000HKi5-2sUz;
	Mon, 27 Apr 2026 16:18:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOew-0000000HKfW-0MQG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:18:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ba545100a13so1139397866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777306687; x=1777911487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JbhNNtkACDoe7xFvlMDxo1hg3mD7N2S9mOLV3kh/g2Q=;
        b=UKxcHKTNDfkv9G142Yy4DDeV0kGTXLcXB0K+MEiJk9iQyoK5Mh4sZo4t83emT4lPD5
         6wvQ33bPqIvoKVvROulGPPI8T+zmDA8yUJ24vCZkdi7Jfc4Eh/2Yq+bc/YKl3Jk9drTV
         M4cFklc0hEA4z8qyiAA+QZRDMBCiI6K776wPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306687; x=1777911487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbhNNtkACDoe7xFvlMDxo1hg3mD7N2S9mOLV3kh/g2Q=;
        b=g2CFtTD00P9MaYvz8o+3S0NjV71fvmkyTLIIiAxxaM4ej4LuQ/9pwcla/ol6izdxyp
         AHPiUKAuu9QxGq+F9GQUjPwSPJke46+GLlyWsLmaerKsX3Xy05XLfDnX7p9bSm4BPAtM
         ztUZ5hf/ULnawieq40/br73MzNmrUGXMwYYZ4Jy23qO60v4wFZJ5vE6HlIKrI4ak+A2a
         /O+nDKum7ifUB7vz50BW9AgWlkL4oKSIuVDF2nMHX9MkKNvyFAI/aE3pG9eY5EOYeokU
         5bvk7flSKYKrJZvdnaDDLGkoQmBxFgpsljMdbhNQvV5sL4bqAGTuAu+8WTMlsgc4WZK7
         wQww==
X-Forwarded-Encrypted: i=1; AFNElJ9vAyWEYeuX6XAku+eUwRklcOSLWp8csQwOF7zI2n12KnbGXpgxH1hrssZf5lHH6SrGSrxkZEOPNqe9vQE7m8b4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo4/G2fzUU+SWYzRXPECvwRoG4nK50woXtFysQE7x6mzLzZOOf
	ediNV+iDChDe4xCwfklE0UKge/3FQshoRgEviQ8d+bpNN0ufuXEPiAtj2yVy+d7LHY+iX+r3xsa
	hdyHbfU8=
X-Gm-Gg: AeBDieudsQOqImmGQQTg6zdC7XPpdFArhZVE+cVCKeDL2aIEv8REdZvlFfVxBzMyic0
	yqL64XBV29aJjc58IZxzDQCaGN9v5n/D4L2z5UkujfaIweqt4zPXDJl0eD0TnlQUyTPA0jF3+ln
	71OGGtLBESwJXlgzWwsTDjgCaj1O6DLxC882eq+jJI+LguJd9kqCi9sjNGo3rbJlOrj5mvf0geI
	kmxKVI7JoKQSb4Q9NEZKomVdPbI1EJO3xsf5zmskz9gnLWhnjUzWBDSHl+TTc8xiSH+F9qKsdwR
	Iu5lislafLAfrrrs4SQNRfBlofZ77WZLjyOLmszcut66gl1Q3jT9m6hFNM35WE8xepaaQA2iyb8
	8W0Y24PrM7C8lJcS/iERw3mpHlG0sJqltGTITwCfsWmQrka9qasARpgOvc4NN4oora2X9dDOM0C
	PqOx0YH+8AoJpaJPrEe82ygyUv2TaBRrveeQ2H49dwGH+gy5kWATEwJsmWS6rTBpyxi4cwZFAuH
	seUJdcKAaU=
X-Received: by 2002:a17:907:1b24:b0:baf:477:f11b with SMTP id a640c23a62f3a-baf0477f1aamr504843966b.20.1777306687371;
        Mon, 27 Apr 2026 09:18:07 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553e502sm1123317066b.61.2026.04.27.09.18.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:18:07 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so1773841266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+JICsGPCtgZh0PMXnqBmBYscpDYEOOFoGu+3J7+haKO/gNtX4hOGvjBVgdLhvGe2SFSoWIo62mu9Xo6zeGdTQd@lists.infradead.org
X-Received: by 2002:a05:6402:c46:b0:670:d548:da79 with SMTP id
 4fb4d7f45d1cf-672bfd87175mr18954968a12.3.1777306362462; Mon, 27 Apr 2026
 09:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx> <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
 <874il11jac.ffs@tglx> <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
 <lhuqzo051cq.fsf@oldenburg.str.redhat.com>
In-Reply-To: <lhuqzo051cq.fsf@oldenburg.str.redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 09:12:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLdmz92CCfu2+-9_UrGSn6Pu6sUVvLs5gjyhGaEov-BA@mail.gmail.com>
X-Gm-Features: AVHnY4KSfM89JX8og5V5ge1wHnX-tp7SzfuRcYZnE_6XGeDyPM7Sz-28_HY9VRI
Message-ID: <CAHk-=wiLdmz92CCfu2+-9_UrGSn6Pu6sUVvLs5gjyhGaEov-BA@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Florian Weimer <fweimer@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Mathias Stearn <mathias@mongodb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_091810_190583_F98A33A2 
X-CRM114-Status: GOOD (  10.76  )
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

On Mon, 27 Apr 2026 at 00:06, Florian Weimer <fweimer@redhat.com> wrote:
>
> RSEQ was intended to be modular

You are entirely missing the point. "Intention" is immaterial.

All that matters is reality. Intentions are ephemeral farts in the wind.

There is *one* major rule in kernel development, and it is "we don't
break user space".

And user space is inconvenient, I know. Users do odd and strange
things. Sometimes on purpose, but quite often entirely accidentally.

The end result is the same as far as the kernel is concerned: we don't
break tools that people use.

This is simply not up for discussion. Any "intent" that isn't actually
enforced by _checking_ for it is only wishful thinking, and worth
nothing at all.

                   Linus

