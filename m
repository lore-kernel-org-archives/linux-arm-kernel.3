Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA136CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 00:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=; b=SNIWqtS0lfN2mx4JG2spnd+t1n
	NCMREwTCLZQsGLTvUTZjfkn7LZMgKCcBi1Tbm2sSaUz2Y/zv51el7QlY+h2GQZO9Bc2sEtqEOE0E6
	GaieRhQR200ddyYWxWl1lJiIZdBWvGnZswoFAnQawjdGM6pFTVo0XS7nADHZWqSWfmoGQ5aKddOOO
	1/CEoBktsbLH2ooxJDAj6amZIoLXpY9hlJ8NA+mXsvitx5x9Ofg0uP7NpjeIWEICEL4JeM431DDp4
	mNJJuWJ/UB+ZvZrBX4elKQ434SSTTjlsqREw1toUZcYx+vjdClyBACapAfCEEYhfPdizqKNQVwc3j
	37rEa1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipw-00000004d2s-0jxj;
	Thu, 23 Oct 2025 00:05:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipu-00000004d28-1b57
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 00:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=; b=j5WxyGzOOgrcQS6QDfqyl1iMGH
	p76INzRn0do952wlpSmFZJkYE0reKfU4w88gfzEk909U6ihml6v1uxgYxedjIZ2mxoVkVBUnN31F7
	7i0Bw8CeRCZL9+OKCKxd9aRXMu5Hs5SMKdNESa7j6NPCEdGi1Pgtz1iah4Ldc7Bz51mGNvItQMhdw
	nYUt3dEfwR9u0dGGXt14n78IuXGGKB9kCwn7ncStQXkZXhCKclnl2bnAvximhc/mDI9oW9zHf16kq
	3sR0nCagnXxaA/OHGx0qsRb0JS2JRspdbC2JuVTPfMhHeSttMoHC9FL5KqiWhAliyuwqKUxUigNVc
	rnTKgNwg==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhy9-00000000vjh-2k89
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 23:10:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so400629a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177938; x=1761782738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
        b=2po47XVoFIW+1ioT5ibyUSjYyIX+x/+RpsE6gnzJBjxAihpM4N2bNwLwtQnbt6D+B2
         BN5E6heYimteIkzaXrViUr5bYfrFIuBhb1g+Y09OlqPVna5n6ok6p+3/e9iZnq5lWqAo
         g7ISDeAeHF6+u6T64sTqdlMvA9Vpwqwz8rl0AgiAU0EVmnEUdkVxa47Pn9c8Ke+gUU8P
         sEXYyUcDatoxitEEqAkV8exgPCMnPfk6svIHG0Ckf0v/lCk9sgM/ahe/C0ERy8Slalnv
         ojGwwNpjqNlOw8kWaRbBXpj1Nsii6XeQXCSi6lDiZO7nMb+qJhE1tAR6ABz0pAGiH9Tx
         gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177938; x=1761782738;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
        b=rkyrIroEs6bq6rHaa9FmP3SeVm1rT8ABJRX3x6kTcm+BJnwFuBHiCva2d/eyY5z4IJ
         uaMDvAeExq2BqfUIfMNtiztz7EstR/UDZ3nMt5MN+AkM174kIvegoIMI+IdMudSrSyCw
         +8XJ+g6tqZLlu5XqWxsJzL71ENy4LNJOAjJgfjgIc6w7FMX2gjtOcE76fZYKSMYNHf/a
         PfNdc+Pp1LUe/Msf3Mptz4jgPVbN6AoIPumlgRdQnuB+TKoaGEyYGIaVFYnGt4X/oiBf
         sdrJM3KuwusU7vVlaEkKbPRpOnZBO4VjrbnPcEwmwCESTloY20P33g3StfHm/ThK5hSa
         xE4w==
X-Forwarded-Encrypted: i=1; AJvYcCVLg23RSBebxgfBX1tl5Vnh6aK3MBgIHUl707CcJqlDMR2RnSUexQ+EiowNxCqHB6J/lfooizZoDsy4KIQwNLEE@lists.infradead.org
X-Gm-Message-State: AOJu0YwzzmoHjgUFUC+Lk++J9fGLewU5Iw2ney04eKIL1qf16OD2PGjv
	H47n48LjSQEVbwFnh2wT+Kg1qlAqR81tFhLJeFTLWRF2/bA+ogJqtQNFdruFUIxDiouOFMLGIA7
	lIZjYtQ==
X-Google-Smtp-Source: AGHT+IF6lSdbdtyS+/t/fGvEsbBKEiGOc0L8/NdAr9Cp2dQPW0iljcBuf5Kq/IEP9uj1boUHsE/v/xDHW1g=
X-Received: from pjih1.prod.google.com ([2002:a17:90a:5801:b0:33e:28eb:7df2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cb:b0:339:9f7d:92d4
 with SMTP id 98e67ed59e1d1-33bcf87b8a5mr30997233a91.9.1761177937783; Wed, 22
 Oct 2025 17:05:37 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-1-kuniyu@google.com>
Subject: [PATCH v1 0/2] epoll: Save one stac/clac pair in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_001013_838903_A5655EB3 
X-CRM114-Status: UNSURE (   9.84  )
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

epoll_put_uevent() calls __put_user() twice, which are inlined
to two calls of out-of-line functions, __put_user_nocheck_4()
and __put_user_nocheck_8().

Both functions wrap mov with a stac/clac pair, which is expensive
on an AMD EPYC 7B12 64-Core Processor platform.

  __put_user_nocheck_4  /proc/kcore [Percent: local period]
  Percent =E2=94=82
    89.91 =E2=94=82      stac
     0.19 =E2=94=82      mov  %eax,(%rcx)
     0.15 =E2=94=82      xor  %ecx,%ecx
     9.69 =E2=94=82      clac
     0.06 =E2=94=82    =E2=86=90 retq

This was remarkable while testing neper/tcp_rr with 1000 flows per
thread.

  Overhead  Shared O  Symbol
    10.08%  [kernel]  [k] _copy_to_iter
     7.12%  [kernel]  [k] ip6_output
     6.40%  [kernel]  [k] sock_poll
     5.71%  [kernel]  [k] move_addr_to_user
     4.39%  [kernel]  [k] __put_user_nocheck_4
     ...
     1.06%  [kernel]  [k] ep_try_send_events
     ...                  ^- epoll_put_uevent() was inlined
     0.78%  [kernel]  [k] __put_user_nocheck_8

Patch 1 adds a new uaccess helper that is inlined to a bare stac
without address masking or uaccess_ok(), which is already checked
in ep_check_params().

Patch 2 uses the helper and unsafe_put_user() in epoll_put_uevent().


Kuniyuki Iwashima (2):
  uaccess: Add __user_write_access_begin().
  epoll: Use __user_write_access_begin() and unsafe_put_user() in
    epoll_put_uevent().

 arch/arm64/include/asm/uaccess.h   |  1 +
 arch/powerpc/include/asm/uaccess.h | 13 ++++++++++---
 arch/riscv/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h     |  1 +
 include/linux/eventpoll.h          | 13 ++++++++-----
 include/linux/uaccess.h            |  1 +
 6 files changed, 22 insertions(+), 8 deletions(-)

--=20
2.51.1.814.gb8fa24458f-goog


