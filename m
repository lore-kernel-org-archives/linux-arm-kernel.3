Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A17C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDYBYXhi2fpIXmidMih0lla5P8/HwKyQKaeA3qjglN4=; b=Vo9eotVqWdmARwFx9FQdS0YVos
	XrsLH3L8g2fwVKQW9Mnyohdxdr76ishum89p1kvBorCu8Mf6FazRN+dNqB2OW+w3InTN0PZK8DGDJ
	S4klhZj8qKM9bAidAzZgSSqYQc53lVyv4TN3kPMQyFh49I47eF4HdbkV4QwtKO9QIdaJnSRz5xqol
	ZY7ucveb/CFwqEpaQ+5mIRsuaBQFOuajKasZAVofGYhAVI7kIEMIjZtPGGqI0e+6OVSg/YvRKH06y
	6i45UXarSnLYVkzCgF2L3nUceWeDHABXrhG7/WRFnjpK3Da4z/JBZNypcOHkNUzi/PrzSXszaDJKb
	GFIbrerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNX-000000082wA-2I4I;
	Thu, 24 Jul 2025 17:05:11 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewhW-00000007iIQ-3JLs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 14:13:39 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A3B040AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1753366414; bh=FDYBYXhi2fpIXmidMih0lla5P8/HwKyQKaeA3qjglN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pwq5tdM2vDY6APoBJuNEplILNdsyaU8ylKRxeCbXe8XwZITdA49KYYVSYTry8HpKV
	 11JU1pkrDwmKYTn4Fl/PSS7PRD9lEUq9GYeo/HlJaKcFNthhWNgGaSbErWZpRksXU/
	 2vcUlKH47OM35KhDFiJKYjv9eHZYQfJhlwveoisq76XE1Ph/wNujQEY4mwi+2EPI03
	 C6Ge6wReBlahOFy06igmvLpUfGmMHNmMAtE5bIWSddnTvAo8pP5gNfRizJLIkJVMoq
	 n+gO3mVS2lc+fqlOMygB0N/vI5gck9MYQxuB1GcL+iBGKHLpcflufHKZM8r4X1ng6W
	 uqNwh/ttjzzkw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3A3B040AD2;
	Thu, 24 Jul 2025 14:13:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 eugen.hristev@linaro.org, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
Subject: Re: [RFC][PATCH v2 02/29] Documentation: add kmemdump
In-Reply-To: <20250724135512.518487-3-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-3-eugen.hristev@linaro.org>
Date: Thu, 24 Jul 2025 08:13:33 -0600
Message-ID: <87zfctad82.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071338_835473_719CD8D4 
X-CRM114-Status: GOOD (  38.13  )
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

Eugen Hristev <eugen.hristev@linaro.org> writes:

> Document the new kmemdump kernel feature.

Thanks for including documentation!

> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  Documentation/debug/index.rst    | 17 ++++++
>  Documentation/debug/kmemdump.rst | 98 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                      |  1 +
>  3 files changed, 116 insertions(+)
>  create mode 100644 Documentation/debug/index.rst
>  create mode 100644 Documentation/debug/kmemdump.rst
>
> diff --git a/Documentation/debug/index.rst b/Documentation/debug/index.rst
> new file mode 100644
> index 000000000000..9a9365c62f02
> --- /dev/null
> +++ b/Documentation/debug/index.rst
> @@ -0,0 +1,17 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===
> +kmemdump
> +===
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   kmemdump
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`

Please don't create a new top-level directory for just this tool - I've
been working for years to get Documentation/ under control.  This seems
best placed under Documentation/dev-tools/ ?


> diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
> new file mode 100644
> index 000000000000..3301abcaed7e
> --- /dev/null
> +++ b/Documentation/debug/kmemdump.rst
> @@ -0,0 +1,98 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==========================
> +kmemdump
> +==========================

A nit, but it's nicer to match the markup line lengths with the enclosed
text. 

> +This document provides information about the kmemdump feature.
> +
> +Overview
> +========
> +
> +kmemdump is a mechanism that allows any driver or producer to register a
> +chunk of memory into kmemdump, to be used at a later time for a specific
> +purpose like debugging or memory dumping.
> +
> +kmemdump allows a backend to be connected, this backend interfaces a
> +specific hardware that can debug or dump the memory registered into
> +kmemdump.
> +
> +kmemdump Internals
> +=============
> +
> +API
> +----
> +
> +A memory region is being registered with a call to `kmemdump_register` which

Please just say kmemdump_register() - that will let our carefully
written automatic markup machinery do its thing.  Among other things, it
will create a cross-reference link to the kerneldoc documentation for
this function (if any).  All function references should be written that
way. 

> +takes as parameters the ID of the region, a pointer to the virtual memory
> +start address and the size. If successful, this call returns an unique ID for
> +the allocated zone (either the requested ID or an allocated ID).
> +IDs are predefined in the kmemdump header. A second registration with the
> +same ID is not allowed, the caller needs to deregister first.
> +A dedicated NO_ID is defined, which has kmemdump allocate a new unique ID
> +for the request and return it. This case is useful with multiple dynamic
> +loop allocations where ID is not significant.
> +
> +The region would be registered with a call to `kmemdump_unregister` which
> +takes the id as a parameter.
> +
> +For dynamically allocated memory, kmemdump defines a variety of wrappers
> +on top of allocation functions which are given as parameters.
> +This makes the dynamic allocation easy to use without additional calls
> +to registration functions. However kmemdump still exposes the register API
> +for cases where it may be needed (e.g. size is not exactly known at allocation
> +time).
> +
> +For static variables, a variety of annotation macros are provided. These
> +macros will create an annotation struct inside a separate section.
> +
> +
> +Backend
> +-------
> +
> +Backend is represented by a `struct kmemdump_backend` which has to be filled

Structures, too, can be mentioned without explicit markup.

> +in by the backend driver. Further, this struct is being passed to kmemdump
> +with a `backend_register` call. `backend_unregister` will remove the backend
> +from kmemdump.
> +
> +Once a backend is being registered, all previously registered regions are
> +being sent to the backend for registration.
> +
> +When the backend is being removed, all regions are being first deregistered
> +from the backend.
> +
> +kmemdump will request the backend to register a region with `register_region`
> +call, and deregister a region with `unregister_region` call. These two
> +functions are mandatory to be provided by a backend at registration time.
> +
> +Data structures
> +---------------
> +
> +`struct kmemdump_backend` represents the kmemdump backend and it has two
> +function pointers, one called `register_region` and the other
> +`unregister_region`.
> +There is a default backend that does a no-op that is initially registered
> +and is registered back if the current working backend is being removed.

Rather than this sort of handwavy description, why not just use the
kerneldoc comments you have written for this structure?

> +The regions are being stored in a simple fixed size array. It avoids
> +memory allocation overhead. This is not performance critical nor does
> +allocating a few hundred entries create a memory consumption problem.
> +
> +The static variables registered into kmemdump are being annotated into
> +a dedicated `.kemdump` memory section. This is then walked by kmemdump
> +at a later time and each variable is registered.
> +
> +kmemdump Initialization
> +------------------
> +
> +After system boots, kmemdump will be ready to accept region registration
> +from producer drivers. Even if the backend may not be registered yet,
> +there is a default no-op backend that is registered. At any time the backend
> +can be changed with a real backend in which case all regions are being
> +registered to the new backend.
> +
> +backend functionality
> +-----------------
> +
> +kmemdump backend can keep it's own list of regions and use the specific
> +hardware available to dump the memory regions or use them for debugging.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e8da575025c..ef0ffdfaf3de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13620,6 +13620,7 @@ F:	drivers/iio/accel/kionix-kx022a*
>  KMEMDUMP
>  M:	Eugen Hristev <eugen.hristev@linaro.org>
>  S:	Maintained
> +F:	Documentation/debug/kmemdump.rst
>  F:	drivers/debug/kmemdump.c
>  F:	include/linux/kmemdump.h

Thanks,

jon

