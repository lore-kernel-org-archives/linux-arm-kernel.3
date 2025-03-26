Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A14C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wc3YVGgFFPukQsTfiZoZotgv1qZ6Vpg2i6m4XEs2Ox0=; b=FJpo9VhCJw0cA3PsOXT0AgbtX3
	4b9HTpnYo/aFjOGeU0C8z/16SM0rumjrEcnZlI9mRu0PpMS0qELlorcbBcWR07TmafB4LcXIc9zG5
	OB4v8aSnQtEc9/XJyZ/4JXdFmV4ZQ0a/xxi40X+opMx0J8cSrkXZh2VSovKbKPeOMsNLreFPGlLdE
	95Br+2lt+GAdF2yBd6uXIueCw/M5ofZKxixP5EgJlRwxiyiOqqjQgQwsJovMgXViXbVWhrn4X9tY2
	MfASGppvZy7lai7ZiOUGYSGNmRt4tZEMpGUcxVaHoj51MJeh7TTITyM9Dl1gv7oIuCLKBhSIJccDU
	AEN7lSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZun-00000009lOl-2k29;
	Wed, 26 Mar 2025 23:12:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZt4-00000009lKS-3wIW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 23:10:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso2051a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 16:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743030616; x=1743635416; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wc3YVGgFFPukQsTfiZoZotgv1qZ6Vpg2i6m4XEs2Ox0=;
        b=L+5kcX2nt4mN3MWFYSosCp4hbsKmjgsvvdE1B2bC8hW4RLLNgx0zS9Tf9xPO1K+XyF
         d9dt3BjzAnLxOrEaH/7poUqg07ecKyK/r+5YVM3c7zgvESa+rCaGuoLOxbtpVPgfcyn7
         GFi2XwtR3cyNhxREWIYVSw24j8ghitx9RQhVjAS4uHQ6Y9iICX8aa3K5rqUJ/6VuhEOp
         PvnBIlVajfhoEIL8A3W/0udFTB7yCkwn4TpNp3pHskvctgPSnhfPbW+MU/ylS878UE2x
         RiDRntIZCkdVAgnJVOkQyEr8NuZgGinwWJcSMEG6T4rNTJ9ekJlfHPlsOgCLRYJZdSPJ
         H4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743030616; x=1743635416;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wc3YVGgFFPukQsTfiZoZotgv1qZ6Vpg2i6m4XEs2Ox0=;
        b=peT5v7RBfdFKQSCsy3NafvX2H/qlv4cEYGCvMG0U7a9Vcu6tNvpj+xgIHqcT/u580f
         NEZpSM0QH0Ss5Az26xxIiXWsfoZ5bBZlmPA8bK7RfNZ473A9ChyWE9eurdygyIUHQYJn
         VFDiWRtzoxjUGw6nK7bWbj5IhaT+in5p1Je8cQ45RVkhB7qX1ecoeqxQmp5dbLEqNH7U
         Jf1LrIY3i2xqC5QdmMwe0UldX6mPUuToezPvjbpP1Pq06Rpob9XihJZdVMMCAoWO56xm
         ndPAQm1SubK8PFXzicfgPloxWcVQ+Hj9xs+1u6zaFXgE4Qq9vF2JBb1ZQN7I/jkYGVH5
         jNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIxkO8AhUVDlINNChpLBe30h1IY7jjPKbnDap4UcxXKqjLo3dSXtb8S64u6xQAEUGOeoIkL/B0/WWp9whpfg7M@lists.infradead.org
X-Gm-Message-State: AOJu0YwaQZwUtEMoNpOdoKRIW7Zg4iZnh0gV1RAvcpH45oG+WSB3ve1V
	1NRiIZkZ4Iq1H1RsyjKwXAKIsAGLsGDksy/dQ5ZUV0y9OamypVp910bJIuhvlHwbnna0L+UuqaF
	Ngk9LQI6dQc+vNIMar0yjtcfGSZqxe6YIlOP4
X-Gm-Gg: ASbGncv0jZudk8trYEfwpJIb7ikDeeFtzxBpt8/VEmZvzzdrcqCFmjGARAlG3fwwgSG
	sKGbIfbOMPQj8B6wLffi0JN4cSMGXn8D28rgZN79eW0gDdlmuFNjTYx6/Puulk4dLtk9YzqWsLE
	ESgFsqrFZt20+2V+kcRxTC3HbAjdkWhsnCMCNYDXa2O/0SOwcrNpEzwjoNMUqSXKIYmQ==
X-Google-Smtp-Source: AGHT+IFXisS9wWdRUt0uNNuJQt+0RNkIIqbbbT66/cypXTYdXu3uR8mrjkMlVz/TrIZZwushzUnqd5yPMxkuIjOcxew=
X-Received: by 2002:aa7:c954:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5edaae205aamr22369a12.4.1743030616016; Wed, 26 Mar 2025
 16:10:16 -0700 (PDT)
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Thu, 27 Mar 2025 00:09:40 +0100
X-Gm-Features: AQ5f1JqVjr6tTcBF7w0LwsC86zQrBaocMPZS2--LfQfER88FYjnvupdq9_ZCZqQ
Message-ID: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
Subject: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Will Deacon <will@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_161018_978215_C01710CD 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

Hi!

I just realized - arm64 redefines __READ_ONCE() to use inline assembly
instead of a volatile load, and ASAN is designed to not instrument asm
statement operands (not even memory operands).
(I think I may have a years-old LLVM patch somewhere that changes
that, but I vaguely recall being told once that that's an intentional
design decision. I might be misremembering that though...)

So because __READ_ONCE() does not call anything like
instrument_read(), I think instrumentation-based KASAN in LTO arm64
builds probably doesn't cover READ_ONCE() accesses?

A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf

