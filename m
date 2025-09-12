Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AB5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RH4GhObM3FT55o7hGQgrlMBMoWx9IX3m3EBVgQrzYfg=; b=EjSSxICrwpP5NkcosBF+n9dRAi
	ecQcPY5AHfrQ+obicb6z9TL6Mcao3h3U15yfR2ArBMADMs/hyn5hRAmFpSzy8IMJwS/jczR0b5UcE
	0peuG1tW/MjskDUFeHSrga7D4wkKquS9i5iU7fW20oWInBoxVzk3c+m2BzbuNXXK/EakGBdj3JgOD
	ggRf316lgoQUSh/mT6U14VDiWVpjOICrlsVyzSpzKiMSdevSKMDlOCXjKABZXg9jkXPntJMlpcxRA
	SnrkWIDYu5Ag2hgcR07HKCxliGFiNrbvYFNGbImaGSUvrl/ugPsV0Li624+x/luyLkFACZR5H/2n1
	woA1f2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PX-0000000A7q9-10f3;
	Fri, 12 Sep 2025 15:10:03 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PU-0000000A7mR-01WR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:01 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-62adfdda606so26620d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689799; x=1758294599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH4GhObM3FT55o7hGQgrlMBMoWx9IX3m3EBVgQrzYfg=;
        b=IsDGfiUV41WZhZnwcU8mKmubrE+boUcaA/rGEBt1YV5HTX8g1bOJXti6NxNPnOSZwF
         NPx48QSO/LoTdp3OcswPkQmuQLDAM+GL7TxCw9tADWZC4WT6H0m4PvSr9pG31PuDvISY
         DaclXx5wUEovyY8HiW7bDcvVbJl1eBSS3mXjqyNksPrGS7qRsrqXi3vvnZVdFuR20IdP
         HvehYXCyB3s6HiCsaI/71EKWMhDD4eCmzz5InHgaCyN5ovBqd7fW7IVHDsA9mbKuvjDr
         DzDWTdwT+Q+F9pCFaZkZui+geGWN6p/httrrbSnGaKcOKrIExPHvOGTRPhrVBG+JBuLC
         mIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689799; x=1758294599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH4GhObM3FT55o7hGQgrlMBMoWx9IX3m3EBVgQrzYfg=;
        b=H0TAR3DntsTNuBHoTYF9oNDE/nIH7w4BO2LtxbijFANJChcYNNRUbObi8IwHZVmlpy
         KpWVxejTtXmlEoFKrMZP/PEa2wfndCaszvdGeem1zAj1leReJM9zCF4meDCMUtspn3RM
         DuHTv0TUb59rc36X+IBOnFsVcgEf+GQRBjksXiTVdSgiCF999ahnO9dO1NrjTy6pFCKA
         W4W2wYdKys1vteyzPshju9AhnRk2MI7CFbR2PMB2T8ZyxHdAlAMi3FXRes8g8Vqp57F9
         qgBpIwFDm0Yf2q9fR0HaiGgW4lZhRy/qSeC4VExeTk6YRaJ46ZodgccECe5acV5vlm/f
         fShA==
X-Forwarded-Encrypted: i=1; AJvYcCV/r6iusQFO6zH8hxvz4gDsm1fqmwGRym19ELXaBRPNsJwCnHh/MImz8gccdd0Umpzn4rOQoBD11d3G9BXRchNi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6uuKn7ZYDsot+qWi1L3ixJUnwvKPIcZDYnLoIpxtMm9qK0liu
	cfG2XRNa2Bc7f0X8CpZtw1u7JvI9FpYDapRO0Tk5v7vlyVZOs/FrLQwNp+77qgn/8g4=
X-Gm-Gg: ASbGnctydCgerTnU3bJ7Fc9S+IhDWq/nxi7DDOEFjNxvXv/O5oUsGJQwrckaX3QCt4N
	NtPr6agYg4+6ungcIdh7hEWSqNO3xnZX3TtJUi8qSZh0WVQJoB/jHhitGTfIZsVvxKSU0YSz1pF
	yfdonNGqe0wtjYk/irHIC6BzpJaZeO6FrzdQEVlOyxxWhRi5omrxIxtiv5jI0MSLzRvK2SgPfIN
	ZxubEWkWNFkzJUWmDb9bXR4lF0RiwJjC9KJaPzSESPVZgIkSPxE9+0gqulxGTXzP9FlOg5Xzwu7
	EbtzVPq1mv8qLG7VVNmTOo/S1/w5I+R1wk34DAgi2xoiCuD15wi9FYGxoX1s8YbmdB88SZaCCmQ
	igaRNgog3gmj2NW+Zn37ws81jeYpvNXLUuq/CovrBbsg0
X-Google-Smtp-Source: AGHT+IHDbtGqslyeLn4YFWeoqnBwKggrxCYxTs3G1b8DQvW49OjHmQw5TtCHo1C0fUHoFsODFmt/wQ==
X-Received: by 2002:a05:690c:660b:b0:721:7e7:50d with SMTP id 00721157ae682-730651d60dcmr29556217b3.42.1757689798342;
        Fri, 12 Sep 2025 08:09:58 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:09:58 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 02/16] Documentation: Add kmemdump
Date: Fri, 12 Sep 2025 18:08:41 +0300
Message-ID: <20250912150855.2901211-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081000_069339_A95BAF02 
X-CRM114-Status: GOOD (  28.49  )
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

Document the new kmemdump kernel feature.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kmemdump.rst | 131 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 3 files changed, 133 insertions(+)
 create mode 100644 Documentation/dev-tools/kmemdump.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 65c54b27a60b..1b6674efeda0 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -28,6 +28,7 @@ Documentation/process/debugging/index.rst
    kmsan
    ubsan
    kmemleak
+   kmemdump
    kcsan
    kfence
    kselftest
diff --git a/Documentation/dev-tools/kmemdump.rst b/Documentation/dev-tools/kmemdump.rst
new file mode 100644
index 000000000000..504321de951a
--- /dev/null
+++ b/Documentation/dev-tools/kmemdump.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========
+kmemdump
+========
+
+This document provides information about the kmemdump feature.
+
+Overview
+========
+
+kmemdump is a mechanism that allows any driver or producer to register a
+chunk of memory into it, to be used at a later time for a specific
+purpose like debugging or memory dumping.
+
+kmemdump allows a backend to be connected, this backend interfaces a
+specific hardware that can debug or dump the memory previously registered
+into kmemdump.
+
+The reasoning for kmemdump is to minimize the required debug information
+in case of a kernel problem. A traditional debug method involves dumping
+the whole kernel memory and then inspecting it. Kmemdump allows the
+users to select which memory is of interest, in order to help this
+specific use case in production, where memory and connectivity
+are limited.
+
+Although the kernel has multiple debugging mechanisms, kmemdump fits
+a particular model which is not covered by the others.
+
+kmemdump Internals
+==================
+
+API
+---
+
+A memory region is being registered with a call to kmemdump_register() which
+takes as parameters the ID of the region, a pointer to the virtual memory
+start address and the size. If successful, this call returns an unique ID for
+the allocated zone (either the requested ID or an allocated ID).
+IDs are predefined in the kmemdump header. A second registration with the
+same ID is not allowed, the caller needs to deregister first.
+A dedicated NO_ID is defined, which has kmemdump allocate a new unique ID
+for the request and return it. This case is useful with multiple dynamic
+loop allocations where ID is not significant.
+
+The region would be registered with a call to kmemdump_unregister() which
+takes the id as a parameter.
+
+For dynamically allocated memory, kmemdump defines a variety of wrappers
+on top of allocation functions which are given as parameters.
+This makes the dynamic allocation easy to use without additional calls
+to registration functions. However kmemdump still exposes the register API
+for cases where it may be needed (e.g. size is not exactly known at allocation
+time).
+
+For static variables, a variety of annotation macros are provided. These
+macros will create an annotation struct inside a separate section.
+
+
+Backend
+-------
+
+Backend is represented by a struct kmemdump_backend which has to be filled
+in by the backend driver. Further, this struct is being passed to kmemdump
+with a backend_register() call. backend_unregister() will remove the backend
+from kmemdump.
+
+Once a backend is being registered, all previously registered regions are
+being sent to the backend for registration.
+
+When the backend is being removed, all regions are being first deregistered
+from the backend.
+
+kmemdump will request the backend to register a region with register_region()
+call, and deregister a region with unregister_region() call. These two
+functions are mandatory to be provided by a backend at registration time.
+
+Data structures
+---------------
+
+struct kmemdump_backend represents the kmemdump backend and should be
+initialized by the backend driver.
+
+The regions are being stored in a simple fixed size array. It avoids
+memory allocation overhead. This is not performance critical nor does
+allocating a few hundred entries create a memory consumption problem.
+
+The static variables registered into kmemdump are being annotated into
+a dedicated .kemdump memory section. This is then walked by kmemdump
+at a later time and each variable is registered.
+
+kmemdump Initialization
+-----------------------
+
+After system boots, kmemdump will be ready to accept region registration
+from producer drivers. Even if the backend may not be registered yet,
+there is a default no-op backend that is registered. At any time the backend
+can be changed with a real backend in which case all regions are being
+registered to the new backend.
+
+backend functionality
+---------------------
+
+kmemdump backend can keep it's own list of regions and use the specific
+hardware available to dump the memory regions or use them for debugging.
+
+kmemdump example
+================
+
+A production scenario for kmemdump is the following:
+The kernel registers the linux_banner variable into kmemdump with
+a simple call like:
+
+  kmemdump_register(linux_banner, sizeof(linux_banner));
+
+The backend will receive a call to it's register_region() callback after it
+probes and registers with kmemdump.
+The backend will then note into a specific table the address of the banner
+and the size of it.
+The specific table is then written to a shared memory area that can be
+read by upper level firmware.
+When the kernel freezes (hypothetically), the kernel will no longer feed
+the watchdog. The watchdog will trigger a higher exception level interrupt
+which will be handled by the upper level firmware. This firmware will then
+read the shared memory table and find an entry with the start and size of
+the banner. It will then copy it for debugging purpose. The upper level
+firmware will then be able to provide useful debugging information,
+like in this example, the banner.
+
+As seen here, kmemdump facilitates the interaction between the kernel
+and a specific backend.
diff --git a/MAINTAINERS b/MAINTAINERS
index 1713cccefc91..974f43c3902b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13813,6 +13813,7 @@ F:	drivers/iio/accel/kionix-kx022a*
 KMEMDUMP
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
+F:	Documentation/dev-tools/kmemdump.rst
 F:	include/linux/kmemdump.h
 F:	mm/kmemdump/kmemdump.c
 
-- 
2.43.0


