Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A3C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5bTh+3Vvg3yCOBzS0gI9x4Skq8JpHTqDTkP6m6Co9I=; b=hKHf/CcFPNKBT+iN05VDdScwfj
	DOHjEZDJRy4Ktlw1rd3GwDYzAGnM9G7lB6C/u+IJVJJBBDkTlpqPxvSEJ9TA1RQwHoArWDWOdkYn6
	da2XLBzfbFhupwOcuV9Or9WNrHAf62S8zzwRLkOhuj8cbNNOGxmbxPypCuYuRkPd/4C33vS5yJ2Y/
	SpfSRpUkI703XQLXMIVtyimUf1zjt3Kg/AwaLyaiTQgsmU8/eJNprTlpv84hRP592z0nALbBpvhwJ
	dchiGoB4BA1E77nZIUvg5dDqXPP7C1kU7OnQX0pnkjCLb0UeKc761QuBpK9icalKLLVhmRHxB2w5k
	QDj4ihxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrJ-00000007qyg-1FeC;
	Thu, 24 Jul 2025 15:27:49 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQr-00000007eiT-1gKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:26 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-454f428038eso9176165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365383; x=1753970183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5bTh+3Vvg3yCOBzS0gI9x4Skq8JpHTqDTkP6m6Co9I=;
        b=NpByOaSXX24mhpnohApKuMZJ6cdoYznCUVj5Zz/VDbAAwq3jjaIW3w1oWtjyTF6LDT
         pSOxEuXFKZDqygk+HLJBr/hdZqCP8ywjTNkpnCyLmiNnCgVMV52MfH5BCWMAu2mYqPtb
         NPpACr2RKeVd16yhQoJ7McDEkwXdj/cT61eCkPw8o8jo+UTOfiBSQ5osyHSd1yDZVVkO
         YAivWLOtV8zUnNbDLeHDL5ThKMihUgNkD370Q8ZGVF38GkDXf9zRtD1VGCI5S+oYNgst
         E5Wiaw50eQ4Oh0DU6bFT127zYGMdCpjfo39J5pjzVkGtL0u3RSfluYwjao1QD5pb1SSD
         +SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365383; x=1753970183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5bTh+3Vvg3yCOBzS0gI9x4Skq8JpHTqDTkP6m6Co9I=;
        b=DYSacM7uEbEV2eIXSIxfhxtzOyey0Sb2BkpNstHh43HimpqWju+yF/nG4brGPJJh9W
         +6ZPa0//6wI6ojD6GKeB0ey7/ivRDFb3bYwJ1FVwUup05QmE/yTRkJn5W4kPuaXVNu9U
         4K11TfXYjj2zA/Rd92NxvIfr4NryTGDzMZI/SZ3PZ5rnGRBu9xQMDqAmIyw8WXhhqPpF
         xeiq11GNx+MEJdJckBHWXD/mIEYerW08acV2ZYUPoo2YX7bo3d2AIWP35ppm0gBwg8W7
         SvSxicE35P4EJUEjKQ2qMVvl3g+74IbKfFbNQln3RFPwkF8GP1Q0agRzFqdZYaC9p5Xc
         4LMA==
X-Gm-Message-State: AOJu0Yyu16aoS5Wb05PD004lfEWi7WctZr+KcJ3ecOdcTFcle1q7K4G5
	/cWb9/1+KcmM3ZSz1tULmQgcS1cPWa1JdcQMfEy4y3Nc8rU2HyN7i6uLXDYfl0JomcA=
X-Gm-Gg: ASbGncv4in+p+Zx5E9hGp195dhAqk26XqfGTnLLlFghQiJkIK9TCgnJvuMvjvmBjAlS
	yLKW0Na7xuiSj8A+EcL+YdqS40+sHa3Rb5tDmO/fu5vwKEPobeoVUC64wQnyFFxITKHUZyk0lK1
	DbW7ct65gJGfTog/Np7rH3iv9aU+U9aaYG0SIzijmafNwpnPmItu1cbvkB8C9/YJSS7M/yia2Tg
	LoCl/K3NVx4UaT7TwdCOTRY1uN8acaPWIrAvF8VnwuW0PAt5mrrCci6Mj2yLR9OeQxSHK0xPGdF
	PrNVjlf6J1dtWLHcorjvMBlP5HRy43GFr65xAbnOhOdnUpgYnd7SV8U4+N/Jnxw/q9G4WYRKp5J
	NtpWVDJ9jrOGwhBzN/2pkQ0AIwxboDzBEuA2eY4+zmTw+sySwnRc6GB3pS8s/ty0vY89j4R/X4w
	zz9UCzoFnTgKaI
X-Google-Smtp-Source: AGHT+IEIzq0FBEBm3LdZcFOEY9/KwPes9i1IaDCT4onRneKKA+Xc4u6PgwWHdq2thr0dEpYstk90ZQ==
X-Received: by 2002:a05:600c:4586:b0:450:d4a6:799d with SMTP id 5b1f17b1804b1-4586a8ce621mr55841895e9.7.1753365383404;
        Thu, 24 Jul 2025 06:56:23 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:23 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 02/29] Documentation: add kmemdump
Date: Thu, 24 Jul 2025 16:54:45 +0300
Message-ID: <20250724135512.518487-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065625_445003_501301A1 
X-CRM114-Status: GOOD (  25.03  )
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
 Documentation/debug/index.rst    | 17 ++++++
 Documentation/debug/kmemdump.rst | 98 ++++++++++++++++++++++++++++++++
 MAINTAINERS                      |  1 +
 3 files changed, 116 insertions(+)
 create mode 100644 Documentation/debug/index.rst
 create mode 100644 Documentation/debug/kmemdump.rst

diff --git a/Documentation/debug/index.rst b/Documentation/debug/index.rst
new file mode 100644
index 000000000000..9a9365c62f02
--- /dev/null
+++ b/Documentation/debug/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===
+kmemdump
+===
+
+.. toctree::
+   :maxdepth: 1
+
+   kmemdump
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
new file mode 100644
index 000000000000..3301abcaed7e
--- /dev/null
+++ b/Documentation/debug/kmemdump.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+kmemdump
+==========================
+
+This document provides information about the kmemdump feature.
+
+Overview
+========
+
+kmemdump is a mechanism that allows any driver or producer to register a
+chunk of memory into kmemdump, to be used at a later time for a specific
+purpose like debugging or memory dumping.
+
+kmemdump allows a backend to be connected, this backend interfaces a
+specific hardware that can debug or dump the memory registered into
+kmemdump.
+
+kmemdump Internals
+=============
+
+API
+----
+
+A memory region is being registered with a call to `kmemdump_register` which
+takes as parameters the ID of the region, a pointer to the virtual memory
+start address and the size. If successful, this call returns an unique ID for
+the allocated zone (either the requested ID or an allocated ID).
+IDs are predefined in the kmemdump header. A second registration with the
+same ID is not allowed, the caller needs to deregister first.
+A dedicated NO_ID is defined, which has kmemdump allocate a new unique ID
+for the request and return it. This case is useful with multiple dynamic
+loop allocations where ID is not significant.
+
+The region would be registered with a call to `kmemdump_unregister` which
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
+Backend is represented by a `struct kmemdump_backend` which has to be filled
+in by the backend driver. Further, this struct is being passed to kmemdump
+with a `backend_register` call. `backend_unregister` will remove the backend
+from kmemdump.
+
+Once a backend is being registered, all previously registered regions are
+being sent to the backend for registration.
+
+When the backend is being removed, all regions are being first deregistered
+from the backend.
+
+kmemdump will request the backend to register a region with `register_region`
+call, and deregister a region with `unregister_region` call. These two
+functions are mandatory to be provided by a backend at registration time.
+
+Data structures
+---------------
+
+`struct kmemdump_backend` represents the kmemdump backend and it has two
+function pointers, one called `register_region` and the other
+`unregister_region`.
+There is a default backend that does a no-op that is initially registered
+and is registered back if the current working backend is being removed.
+
+The regions are being stored in a simple fixed size array. It avoids
+memory allocation overhead. This is not performance critical nor does
+allocating a few hundred entries create a memory consumption problem.
+
+The static variables registered into kmemdump are being annotated into
+a dedicated `.kemdump` memory section. This is then walked by kmemdump
+at a later time and each variable is registered.
+
+kmemdump Initialization
+------------------
+
+After system boots, kmemdump will be ready to accept region registration
+from producer drivers. Even if the backend may not be registered yet,
+there is a default no-op backend that is registered. At any time the backend
+can be changed with a real backend in which case all regions are being
+registered to the new backend.
+
+backend functionality
+-----------------
+
+kmemdump backend can keep it's own list of regions and use the specific
+hardware available to dump the memory regions or use them for debugging.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7e8da575025c..ef0ffdfaf3de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13620,6 +13620,7 @@ F:	drivers/iio/accel/kionix-kx022a*
 KMEMDUMP
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
+F:	Documentation/debug/kmemdump.rst
 F:	drivers/debug/kmemdump.c
 F:	include/linux/kmemdump.h
 
-- 
2.43.0


