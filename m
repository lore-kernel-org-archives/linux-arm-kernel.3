Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BB7CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=; b=WCIx0A04SBLSaqmIPq/AGXC9wn
	Q7Omts/5ZL4PmVX6dWMGSQC6Iw/QqvNavteZtFiDV7w7Hi/vI8XRZrxwZPUVooTzHbEUJ+YUfAecP
	Gm44jfv3YUOSG9CgLXZUzc+D2UcFxSyrN9Nm7UBwQBf+vmoCl3O4LERL9a6xhVtD2lOLSD6iNMZQD
	sZTzRnF/CMFxZ/7msO9r1uUk22KnGw/erUc0QXUMQILkBDsekc3/vGxW4THINhCyj2AOlgPU2DHJr
	UxA+0nX9pwpF754C3IiTbidv5wE5ePMXL2S6feOJ5DY5B6cYZOfmYSmOul0WqoqRy/SiXF4ZnAyQi
	X8NXc5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiq2-00000004d8Q-2eUn;
	Thu, 23 Oct 2025 00:05:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipv-00000004d2c-379s
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 00:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=; b=j/5zBLue1pJHdvOSiXcjwDclE1
	O4gP+tIdtUpuwuxj0ulot7SMGje33U36meOHvM/NOzj6Rm9SnM5DaXyaZy86qv2O0y+uFk2h14t4l
	xBVoDhbDwY2i/IEMyyD1VIEy5p5GJUFqqPiqJdS/t0fBaQ33JRJ1a4csP/27FXuYy+/MWxCrv7SRf
	QbGLXLDQICKgNytUDWxqjzZjdcfAL0Z6Ou0BVVp+dIWbOZApuW55vA+9w22fr82ckRUA+ezT7uHF6
	SmXfrYJCd3ZKbStKV2fb/S3d8oRGpHkxM62m7IotcEn5WJbGLcuMSgT0NthbTqLiOcwQGKcZx7tci
	0+O/152A==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhyC-00000000vkd-0Gom
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 23:10:18 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so335589a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177941; x=1761782741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
        b=B08GLFdpUb36vLNEWdJ+7T9UxKWH1XSRXgmRKpl2ZIIT6wg/rt17WmrFkSsePlUIzK
         YalxCr9G6e6hP9SuoJwViLsMcpR4aIPBayZffmMejCBLZtkDxRDHQn+YTAOCKqz57QqL
         gZ90da9RHoGyR7Ecf2pHQZUoVIpLq/8frpjNX0mLPq2o1l6ysPDQZV1kaJyPVRiOgxfs
         7H+zx2RvwTlVl5MH2asGMaa33By0Yrxvv2fFoANtU7zMF2rn+g5fk0lUcbyRDcMzGgIA
         IDV9eemyo062TR8/T3i3HhJw8t9uzcv50tDLeU+N+yGGEZFTMQ2ylSejAcJXzww0ZkhV
         LHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177941; x=1761782741;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
        b=Lt+2pct2/BhBeg1Ghqp4i5I5c+tG9yIhQBKPvHL3LkDPNUXoM9G0LGwnLWNu50C5Dq
         RJ1wFi66pQyflZGIpE8o3OOZXHPWOkjTkRBfxzaCxo2lM6OMPvhkZ8EwaJY4eg9kTRWC
         Xx8hNHsEFW/H+xfiiObaASgDwDK5eSzRHJOqo//GfLk5PTAWAa7VD1ZH++09SmXFCdlw
         WuK7K1vPO8sUUAHTpk7FH/5HLaPotZfnQ4NmBPgG1m+ss+zppW3O4LRqCEQ/AWSWH3QR
         lLSUBkohHHX2yb+3Gl0gSCtS3Xvh9Ur2QEyXLmeJ1Meo+jkIXoayjHY1ZH3TdgY6fh6w
         Ys9g==
X-Forwarded-Encrypted: i=1; AJvYcCX1rQOlNOdeRg4Lb9YQbg9mdS8uHFhtC78UwMDLTzDCGevGtmhXLDEk7upyLxJfO6E0twlK57o1DEn9g27TSsqz@lists.infradead.org
X-Gm-Message-State: AOJu0YyM5Ry1VP48WVYov9hfzbz/ChczeNKNZ6elPv0zhTYLS1hmt7ga
	AAfolx+QLroQsg6eyGhDarckhBseNp7JZ7Z+b9XTq+k57mc3TXHGregwXWormVv6hNIxb+7mLRA
	7CPvFVA==
X-Google-Smtp-Source: AGHT+IGd6U9IlxxZkQUE9in6Tsw30xR2bnzy7O0+0w49jme5smP7pCaW5imecIRz7OgZNwNV7y77C8X4JZs=
X-Received: from pjbco18.prod.google.com ([2002:a17:90a:fe92:b0:33b:51fe:1a83])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c05:b0:339:ec9c:b275
 with SMTP id 98e67ed59e1d1-33bcf84e181mr33310671a91.6.1761177941265; Wed, 22
 Oct 2025 17:05:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:44 +0000
In-Reply-To: <20251023000535.2897002-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-3-kuniyu@google.com>
Subject: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
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
X-CRM114-CacheID: sfid-20251023_001016_195225_DBF6B79A 
X-CRM114-Status: GOOD (  12.94  )
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

Use __user_write_access_begin() and unsafe_put_user() in
epoll_put_uevent().

We see 1% improvement on tcp_rr throughput by just saving a single
stac/clac pair.

Another option would be to use can_do_masked_user_access()
and masked_user_access_begin(), but we saw ~5% regression with
unnecessary 3 operations for address masking, which is already
checked by ep_check_params().

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 include/linux/eventpoll.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/eventpoll.h b/include/linux/eventpoll.h
index ccb478eb174b..efc0aa2d496f 100644
--- a/include/linux/eventpoll.h
+++ b/include/linux/eventpoll.h
@@ -82,11 +82,14 @@ static inline struct epoll_event __user *
 epoll_put_uevent(__poll_t revents, __u64 data,
 		 struct epoll_event __user *uevent)
 {
-	if (__put_user(revents, &uevent->events) ||
-	    __put_user(data, &uevent->data))
-		return NULL;
-
-	return uevent+1;
+	__user_write_access_begin(uevent, sizeof(*uevent));
+	unsafe_put_user(revents, &uevent->events, efault);
+	unsafe_put_user(data, &uevent->data, efault);
+	user_access_end();
+	return uevent + 1;
+efault:
+	user_access_end();
+	return NULL;
 }
 #endif
=20
--=20
2.51.1.814.gb8fa24458f-goog


