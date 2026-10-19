Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C34CCCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 01:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=; b=1WvAYFShz8ucp1
	vHmqeoSmTczUjofCWd7ljRRb+jBcT3WfdtKlc3NFCBVQr5jl392qgHpUlKSvTOuqFdSrcs071S8SK
	iNDhMHRUpvV3dFAGFZadz7fuEhAY5DDDawllW5ACu62fy1ru7dO9uJLkAJZsZoze4Si1msncO8wvm
	JrtHlziFDo9LwTshyenLCFxOiSc/XIIYhs+2QBVLc+egYUk/uUHkM+1OleXw7bKTA9H8XxzmLekd2
	r8m9Y21FsX194JCA4+iK9rvA3Bl5KiYGj/3U/yVehRmmQkzOE4YMmW+m/O4OhgauQrcjZVYQKUI10
	FnzrzuJwoYes0JuxM1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcdt-00000006PsT-3san;
	Mon, 19 Oct 2026 01:58:25 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcdq-00000006Prn-3DZL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 01:58:24 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3535a54bed9so2151907eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375101; x=1792979901; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=;
        b=rsxhuubc9/d+xQlO+Y2HlngO3j1dCjXvoi+bSn2dyO1PIgX4vYh2ZFNZiwdp1x2NLp
         SJvWRtButqIhdYfDi48KQFEL2jGmOAwUe/edOTZzHFifMARt6cqk3P62CWUTMhz9rNCB
         vzp7C75AiJ/R1GduhflEs0s3H8KmCEwsHIp8Qr9RGf857sT4GBFuJSfaNJRdBbNUuNO9
         Y4No3IOCDHxKJUQ0/kc4EHU+TwTznux3z4+SU8JoZKm8NY1zlXoJgF0FYf1cSsHO1wAX
         En8sAbIQ2uGbrJJiwNhyco2yChwwF8BssoIJQmvpCDJEZrjwVzpGvlopKBwSMtwGwT49
         BAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375101; x=1792979901;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=;
        b=oyRwd4b3wZEqehV42OgSYp4zvVy/tT+/qFJmh7BGjVdnr1EJ5D7C+nvSmMBXQzDoFH
         HUCq5lvOXH6YUzWBzJJd6HgBpPf/4wETCpCpDHAqwS5iwzXAAJ+0E07xmBVQw+cftcJj
         JpqKU0n/zVNe4m/TuIaNIiQ7o52BFiHT4ATDJCXE7lBtpzI0nZDQ/J7VWAE1d7S4xcvh
         PhFVyIQb6B4MzLTm8FlxlMj88fKIVSAGd76tm9dQ6mQJKClAp4t+/gL3UnfLU5sG/THe
         gNclViFRnWIDojgXMilnK5RaMiPs3QWuVNpvMdCyLqqqVnsf+XD2NNKbEnoJjfYAfo/8
         m3rg==
X-Gm-Message-State: AFq9FYIkKgeo+Pm5+MFeRMqajvRiFYgXk+EuwpA8wn91BYW8GwpeLxN5
	EIIEq+fWLieONYbJyQdRBzfJxJcB9ADQAwwz6wDrhjskUj240u6MUQb8
X-Gm-Gg: AYBFou3l07GSu/bs0ivndkj5iTzr9KY5b1PmcJ8M5xLM+VcUyk9M1SHNg2TFY9YaeE6
	TZioKi7YeiAaX/230Ho9pBnAcSe1Rhh0zepQ77vrf3siV3rdjkAho5CVTRsHZhIViik42RDmcs2
	+fRDEVKs5JAwGR5tmalasXFpQPNpvq0b5kNiB/02XLvBXAmAvQvWfgin8pAdoiF8RKum+g/9Lz7
	ZXIJhKJdur46UvpdeVRdfPCtXPh2a+6erg2SHVwCHh8n02VS0M4B2/Gjt/z6CAa6R0TVgLXuInP
	/b5JwEcPmZ6A+HFJWt+QQWsGakyO+c8LWIXIQuXPLjcYMmp247GCR0NhrU7Z/mGEFA+f5NPdIUQ
	9bTtFt0AUU3hqZXw39UEgHEZkgbJNN4yHYK7XUxKJSKz2hgjygkd4Ch/eptwSsv5zYJoEieRUme
	heum2v5z+KsG316alpylFymGsCG7PFRPcEv3gchRw+whgFDbqhp0en9wn1JPUGrU6xnQ8=
X-Received: by 2002:a05:7022:150e:b0:141:b2c3:d84e with SMTP id a92af1059eb24-185120a8bb4mr10990864c88.11.1792375100720;
        Sun, 18 Oct 2026 18:58:20 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:19 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] word-at-a-time: let KASAN see load_unaligned_zeropad()
Date: Mon, 19 Oct 2026 09:58:08 +0800
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADB51WoC/x3NwQqDMAyA4VeRnBdoiwT0VcYOmY0aZK2kTsfEd
 1/Z8bv8/wlFTKVA35xgsmvRnCr8rYFh5jQJaqyG4AJ55zt8vic8skXkDRk3fQl+xfLKERcunJD
 H0JJriUQIamY1GfXzX9wf1/UDDOF2FXIAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_185822_808247_B8A847B8 
X-CRM114-Status: GOOD (  10.62  )
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

load_unaligned_zeropad() is inline assembly, so KASAN and KCSAN never
see the word loads that sized_strscpy(), the dcache name compare, path
name hashing and x86 csum_partial() do through it. While reviewing a
strscpy() KASAN fix, Peter Collingbourne suggested checking the first
byte inside load_unaligned_zeropad() itself, as read_word_at_a_time()
does [1].

Patch 1 adds that check on the six architectures that implement
load_unaligned_zeropad(). Patch 2 adds a KASAN KUnit case for it.

This is independent of the strscpy() fix, which makes sized_strscpy()
copy byte by byte under software KASAN so that every byte it reads is
checked. Either can be applied without the other.

[1] https://lore.kernel.org/r/CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      word-at-a-time: check the first byte in load_unaligned_zeropad()
      kasan/test: cover load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h              |  7 +++++++
 arch/arm64/include/asm/word-at-a-time.h            |  7 +++++++
 arch/powerpc/include/asm/word-at-a-time.h          |  6 ++++++
 arch/riscv/include/asm/word-at-a-time.h            |  6 ++++++
 arch/s390/include/asm/word-at-a-time.h             |  6 ++++++
 arch/x86/include/asm/word-at-a-time.h              |  6 ++++++
 mm/kasan/kasan_test_c.c                            | 24 ++++++++++++++++++++++
 .../powerpc/primitives/linux/kasan-checks.h        |  3 +++
 .../powerpc/primitives/linux/kcsan-checks.h        |  3 +++
 9 files changed, 68 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-bug-word-at-a-time-zeropad-kasan-af2460466ee6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


