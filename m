Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD24C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 20:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=; b=SMEzC5VYVF8/H/I4+qUUEEgtqE
	TvCY5/HjFojURX+TS/Wo/qFA5RHRbWaD4tmCkfMMBxWwXy+eF8CI+R0rpqlKawfzN+buA84/2Y2NU
	5OZn/HA+6Tt49CeoXsuTUGETWcf0hUiFgu/jAma1145wLXDGv0rzMVz0B0EvNJyZp9AXK65msXqlR
	BXobT4dc7f9Uoo+DePqjb3Z5zk+PlTLsegt35rIQpUuwOKF+M6rq9/DoaMNIrFyhoEBURXT411kse
	OJs45v3G+LpA2ulRU+0pt7Ohadoa8kH0+gWoYhs7xyCQnPCbrqX4EnCa7/4ZGxqTMMFl4uroIJ8u/
	6cETiCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcdv-00000008KR1-1fpi;
	Tue, 17 Jun 2025 20:10:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcbi-00000008Juj-1Jvl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 20:08:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso10273347a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750190912; x=1750795712; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=EYMPUU3jNga59IOuKfsfRdwKCCyCoojdV7sj5Ce1gVF2RempFIG0XiSzOg/V0OS6S/
         yJv4zjc78R6G0vovHeA7YbVQKLVpbHtBP1DtnOZeVAzvkZyA7ChPnwfDYKt95xjqIeaf
         73+iBjiWlRsm0uNJdFvHkFVH+cwaPZ0edX0F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190912; x=1750795712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=HGl1EbjgV/7XltelIpDXbSRyk6AEIS+8I3lS0C/vfrdTmUh0b2apLJZylPh0jcxdD9
         0j1+NJshDJLlQbTYwNJpQHf7YFGCT0Tw8xZCfoYyP4+BqxkgYUduVLrG4jf8JhlU486w
         kbQIru8dFZ4J9FTy+taasonIVsyiD6rzvet392X2MyzZUSHFtJZk9tFNLVMgEXZbOIul
         akQwYCYgGvBvQGwPfTcMnJNJoLaOVZJeLWJ7N65qU7XeEc+OGm/qSPEJT4sXmWM43SsL
         gSaRPXSqjPp/PBFOtcJHH1/rypTcDeXqSbiTHcKmiPYylS1Ruu20PA1odIFzv/B5TL0j
         rLBw==
X-Forwarded-Encrypted: i=1; AJvYcCVcEhgUrkXhlr0IZ+ym4pYRoKUzcESAOEXFF3pEugWvzioADnd9C7h7o4QpQuEC4NIj6yHLKRSwv9BsgUmQmwZj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9UI9FBznJiA5s8E8BoNbYf5ulJ7jdDsjRa6QF/hkuMaQ3wu1T
	BY9nZv67s3rqfcvBDvcWfw0qjuwTFjbj5mRWvF0nXP6I82E8TD9Wqcd6HyrwixFay6SL2Po2k0M
	2ZtLvpEA=
X-Gm-Gg: ASbGncv8Ev0gr9X4DY0Uj8M1PLFfvPcFYTjP7wgVPgFGsinI2/RVZLhdNWxHGyJK5nR
	1BYe7nSwo7gApvquuIa0HZ6mxWR6UEzr9WLv4/eVlP/gapMS/ug11uoFjRoSk9pYdEcCUXr2pFZ
	PN6F02T7WM7TwaiiAkNjiT8cQzy24x+Qf5+UG0MKnvdEPSVxOMVJ3Er/kg9dEQ0s6epK8wE+eV1
	Z4ekxbvHcnNczAXkEIL1Y1N9sWCNRVUnTdWK/hL+dSI57LKIPF8Q4TuyaHJ+uLglCX4c9co2byu
	fo1I4Npg+LiJCKWc0CytM1uQs7fO6jzGt3S4hmsU7r3Wr4q332UhTwIoAI/bVSRxCAMR9y1H1VT
	BNK3HpYGDdObUhuELUe9T8klj1hawL35ezo2/rrVhb2TKDoI=
X-Google-Smtp-Source: AGHT+IHXxKRWGJqxhb3qpv9YhQbQu9alhvrKnYDlM4iXKsiw/tZCwuakaUdf2D46ODKIW1b1fmdhFg==
X-Received: by 2002:a17:907:3d86:b0:ad8:9909:20a8 with SMTP id a640c23a62f3a-adfad51471dmr1370187066b.49.1750190912554;
        Tue, 17 Jun 2025 13:08:32 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897c739sm926876466b.171.2025.06.17.13.08.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso11019029a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXexv7p3w3VqCWrl7jkSnn5Hg7ZZwD9EG5g0x2FlrGorlQaooSu3cGzl4/wlqBuRzRHitIi3mmuJlsK6YauoYV6@lists.infradead.org
X-Received: by 2002:a05:6402:2550:b0:5f3:857f:2b38 with SMTP id
 4fb4d7f45d1cf-608d0948ae9mr13954090a12.17.1750190910438; Tue, 17 Jun 2025
 13:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol>
In-Reply-To: <20250617195858.GA1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 13:08:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
X-Gm-Features: AX0GCFuoL7ATRJ2CnwP4RNLTBvlSmkXnXI8fTIZk-24R8V3-BYf3WTK_tAsCN-o
Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_130834_344299_F09EA66E 
X-CRM114-Status: GOOD (  11.21  )
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

On Tue, 17 Jun 2025 at 12:59, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Again, the tests depend on the code they test being added first.

Sure, and that's fine. We have lots of "this depends on that".

> I could do two pull requests, the first with all non-test code and the second
> with all test code, where the second depends on the first, i.e. it will have the
> last commit of the first as its base commit.  Is that what you want?

Yes.

Or if one single pull request, split out the diffstat with the
explanation (that's the "Or at the very least spell things out *very*
clearly" option). But two separate pull requests would actually be my
preference.

          Linus

