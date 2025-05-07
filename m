Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11699C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPKhEEOlzYIkRbPw/GeR8hWFfjD3gG75JAvhi9V0F+0=; b=V3i07aYqdZLbIMObgbTN64Rn8w
	5pf8yIJQ/2sKFl2BYXmyxV9eDkPQmXHIKPT4C4kXLjOXQMb8wYy6JYl2E3Ay/moWuZvPbT4FI7Tc4
	i+p2Qef+f2ySOv4wyMvnOwTTOpp3SpWOPcXmEfUm5y68Szwwdhdq3F6iAD06nagceSBgnqKPBHVxG
	+Py4NaC3olbgqk2nxb44rSEDwD62Miv/fiBegEA8laIksG/p9saKf3XCASu8i82hha9lP1uOKoh2Z
	mylcKJyGHlu5xsu82DUeUm+4CDBD/mrQCA+uVpPhbXyX5J1JyCrQJc0nAZ+Kh9N7WkNIFXacvvRdQ
	EpAx6u8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj1e-0000000GPeH-1gE1;
	Wed, 07 May 2025 17:57:46 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCijL-0000000GMzC-0FIA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:38:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-224192ff68bso1148975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746639529; x=1747244329; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPKhEEOlzYIkRbPw/GeR8hWFfjD3gG75JAvhi9V0F+0=;
        b=3k+xmYU7eXAiKTHhawlZpBrx9qaegtGCk01XlJadg2MZvq53dBbiDy0vHOOrZ34XBa
         SJ38HTsdoQiYyxVIFXx0TZQYO4m1DSrF8I6iFpsHcpjj40pr4bbOEwAYUNvlJMnxUhhr
         l2u9p2kG7YSLyQUNc/zA2xDLkBTe1eFr2DmpRT1SKwf/BFDdAHdNJdjdhUFPiZIiZIjk
         tHq3DgtH6CGVuo8VsoiH/6LIAOtgL1Ncph3or4cRb68KqOYdH/CsVIZC4xiAUhOq+UBp
         Bt70f2/slaIJh3T6fcZifv52rjvSEcB3TE8UY68hFnifzE22QmmyqAwNRvwVRLSdButP
         HW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639529; x=1747244329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPKhEEOlzYIkRbPw/GeR8hWFfjD3gG75JAvhi9V0F+0=;
        b=ZefEnPZKeE+adSphL/rXul4rLJ3jlZTa4vl00U87AV0XJnW2vG24SnJ/wBzrIwiaQG
         c79yJ6BEB4ySzecBESd0Bzjz38oxs4W845D+JAn9MiRxW1hPdKbLIVVkPS/pbileW5tg
         cEpWtJv2A8gT993av8VXJ9jhEevj9SQS0iXoYGOXHQseio+NjjmgdbZpyE6mhWQZ96a0
         hiwFTvVv1420D1D4oimpYO18dWRJPCX4VHgZe2PeL80pJpSFfJ458HD0D8He3IDjxSUm
         1mPWtXlkeSfN44xb26+CXZZSaJy5q/yNxYz2S5QYSUJjd2nPcuDDruCRCXgVX+e/zfFz
         Dqcg==
X-Forwarded-Encrypted: i=1; AJvYcCXxp7CbpxFRPNMr9lr5O2axhrSpIK4faTo3BIu1Eo8hlhUwuSs0ZR4s3ZRyI3m4fgyC//vIgYbBtXsaBJz0S6/v@lists.infradead.org
X-Gm-Message-State: AOJu0YwyQb//ScVUgFtLRyqB/Xj1TnKEyH3EaqFhcpeWwHKPr8iDnXnb
	XohbabpXIW84v8aq5DQwot+APwuwStqVFvJ1by08JWKMrLxdUATnFGc846ee0U7Lc7geaKs/77F
	5AXxK3aW1fcEQxl8CPw==
X-Google-Smtp-Source: AGHT+IGNfkFxMjaTsgXaQ67I1WvGAJM6TlgtahsPE6jcXmeR00somZXniUnAeUbq3tjSmORMJMl00b971pTs36O8
X-Received: from plbiy10.prod.google.com ([2002:a17:903:130a:b0:223:242b:480a])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:d3:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-22e6cc6d267mr30697245ad.53.1746639529608;
 Wed, 07 May 2025 10:38:49 -0700 (PDT)
Date: Wed,  7 May 2025 10:38:40 -0700
In-Reply-To: <aBl0kUIKryH5AUD5@archie.me>
Mime-Version: 1.0
References: <aBl0kUIKryH5AUD5@archie.me>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507173840.2541517-1-changyuanl@google.com>
Subject: Re: [PATCH v7 17/18] Documentation: add documentation for KHO
From: Changyuan Lyu <changyuanl@google.com>
To: bagasdotme@gmail.com, akpm@linux-foundation.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	changyuanl@google.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_103851_092016_E8E9913B 
X-CRM114-Status: GOOD (  35.77  )
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

Hi Bagas,

On Tue, May 06, 2025 at 09:31:45 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Thu, May 01, 2025 at 03:54:24PM -0700, Changyuan Lyu wrote:
> > +This document expects that you are familiar with the base KHO
> > +:ref:`concepts <concepts>`. If you have not read
> The reference label is generic and can collide with future patches.
> It should've been disambiguated as kho_concepts instead.

I renamed `concepts` to `kho-concepts`.

> > +them yet, please do so now.
> > +
> > +Prerequisites
> > +=============
> > +
> > +KHO is available when the ``CONFIG_KEXEC_HANDOVER`` config option is set to y
> > +at compile time. Every KHO producer may have its own config option that you
> when the kernel is compiled with ``CONFIG_KEXEC_HANDOVER`` set to y.

Done.

> > +need to enable if you would like to preserve their respective state acro
> > +kexec.
> > +
> > <snipped>...
> > +First, before you perform a KHO kexec, you need to move the system into
> > +the :ref:`KHO finalization phase <finalization_phase>` ::
>
> kho_finalization_phase to disambiguate label.
>

I renamed finalization_phase to kho-finalization-phase.

> > +Next, load the target payload and kexec into it. It is important that you
> > +use the ``-s`` parameter to use the in-kernel kexec file loader, as user
> > +space kexec tooling currently has no support for KHO with the user space
> > +based file loader ::
> > +
> > +  # kexec -l Image --initrd=initrd -s
> > +  # kexec -e
>
> Use full paths to kernel and initramfs image.
>

Done.

> > +``/sys/kernel/debug/kho/out/scratch_len``
> > +    To support continuous KHO kexecs, we need to reserve
> > +    physically contiguous memory regions that will always stay
> > +    available for future kexec allocations. This file describes
> > +    the length of these memory regions. Kexec user space tooling
> > +    can use this to determine where it should place its payload
> > +    images.
>
> "Length of KHO scratch region, which is a physically contiguous memory regions
> that will always available for future kexec allocations. Kexec user space
> tools can use this file to determine where it should place its payload images."
>

Done.

> > +
> > +``/sys/kernel/debug/kho/out/scratch_phys``
> > +    To support continuous KHO kexecs, we need to reserve
> > +    physically contiguous memory regions that will always stay
> > +    available for future kexec allocations. This file describes
> > +    the physical location of these memory regions. Kexec user space
> > +    tooling can use this to determine where it should place its
> > +    payload images.
>
> "Physical location of KHO scratch region. Kexec user space tools can use this
> file in conjunction to scratch_phys to determine where it should place its
> payload images."
>

Done.

> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +.. _concepts:
>
> The label can be ambiguous. It should've been _kho_concepts instead.
>

Done.

> > +.. _finalization_phase:
>
> The label should be _kho_finalization_phase.
>

Done.

> > +Generally, A KHO user serialize its state into its own FDT and instructs
> "Generally, a KHO user ..."

Done.

> > +KHO to preserve the underlying memory, such that after kexec, the new kernel

> > +can recover its state from the preserved FDT.
> > +
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

Best,
Changyuan

---- 8< ----

From: Changyuan Lyu <changyuanl@google.com>
Date: Wed, 7 May 2025 10:14:34 -0700
Subject: [PATCH] fixup! Documentation: add documentation for KHO

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 Documentation/admin-guide/mm/kho.rst    | 29 ++++++++++---------------
 Documentation/core-api/kho/concepts.rst |  4 ++--
 Documentation/core-api/kho/fdt.rst      |  2 +-
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index c64aa7aadb300..6dc18ed4b8861 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -8,14 +8,14 @@ Kexec HandOver (KHO) is a mechanism that allows Linux to preserve memory
 regions, which could contain serialized system states, across kexec.

 This document expects that you are familiar with the base KHO
-:ref:`concepts <concepts>`. If you have not read
+:ref:`concepts <kho-concepts>`. If you have not read
 them yet, please do so now.

 Prerequisites
 =============

-KHO is available when the ``CONFIG_KEXEC_HANDOVER`` config option is set to y
-at compile time. Every KHO producer may have its own config option that you
+KHO is available when the kernel is compiled with ``CONFIG_KEXEC_HANDOVER``
+set to y. Every KHO producer may have its own config option that you
 need to enable if you would like to preserve their respective state across
 kexec.

@@ -29,7 +29,7 @@ Perform a KHO kexec
 ===================

 First, before you perform a KHO kexec, you need to move the system into
-the :ref:`KHO finalization phase <finalization_phase>` ::
+the :ref:`KHO finalization phase <kho-finalization-phase>` ::

   $ echo 1 > /sys/kernel/debug/kho/out/finalize

@@ -43,7 +43,7 @@ use the ``-s`` parameter to use the in-kernel kexec file loader, as user
 space kexec tooling currently has no support for KHO with the user space
 based file loader ::

-  # kexec -l Image --initrd=initrd -s
+  # kexec -l /path/to/Image --initrd /path/to/initrd -s
   # kexec -e

 The new kernel will boot up and contain some of the previous kernel's state.
@@ -89,20 +89,15 @@ stabilized.
     as input file for the KHO payload image.

 ``/sys/kernel/debug/kho/out/scratch_len``
-    To support continuous KHO kexecs, we need to reserve
-    physically contiguous memory regions that will always stay
-    available for future kexec allocations. This file describes
-    the length of these memory regions. Kexec user space tooling
-    can use this to determine where it should place its payload
-    images.
+    Lengths of KHO scratch regions, which are physically contiguous
+    memory regions that will always stay available for future kexec
+    allocations. Kexec user space tools can use this file to determine
+    where it should place its payload images.

 ``/sys/kernel/debug/kho/out/scratch_phys``
-    To support continuous KHO kexecs, we need to reserve
-    physically contiguous memory regions that will always stay
-    available for future kexec allocations. This file describes
-    the physical location of these memory regions. Kexec user space
-    tooling can use this to determine where it should place its
-    payload images.
+    Physical locations of KHO scratch regions. Kexec user space tools
+    can use this file in conjunction to scratch_phys to determine where
+    it should place its payload images.

 ``/sys/kernel/debug/kho/out/sub_fdts/``
     In the KHO finalization phase, KHO producers register their own
diff --git a/Documentation/core-api/kho/concepts.rst b/Documentation/core-api/kho/concepts.rst
index f1826ac10da75..36d5c05cfb307 100644
--- a/Documentation/core-api/kho/concepts.rst
+++ b/Documentation/core-api/kho/concepts.rst
@@ -1,5 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0-or-later
-.. _concepts:
+.. _kho-concepts:

 =======================
 Kexec Handover Concepts
@@ -56,7 +56,7 @@ for boot memory allocations and as target memory for kexec blobs, some parts
 of that memory region may be reserved. These reservations are irrelevant for
 the next KHO, because kexec can overwrite even the original kernel.

-.. _finalization_phase:
+.. _kho-finalization-phase:

 KHO finalization phase
 ======================
diff --git a/Documentation/core-api/kho/fdt.rst b/Documentation/core-api/kho/fdt.rst
index 4a5d53c670d4b..62505285d60d6 100644
--- a/Documentation/core-api/kho/fdt.rst
+++ b/Documentation/core-api/kho/fdt.rst
@@ -32,7 +32,7 @@ KHO process will be bypassed.
 Property ``fdt``
 ----------------

-Generally, A KHO user serialize its state into its own FDT and instructs
+Generally, a KHO user serialize its state into its own FDT and instructs
 KHO to preserve the underlying memory, such that after kexec, the new kernel
 can recover its state from the preserved FDT.

--
2.49.0.987.g0cc8ee98dc-goog

