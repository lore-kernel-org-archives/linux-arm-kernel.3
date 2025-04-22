Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A66C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=; b=fMd0BKQppSC28WaCy2BbTdOtxd
	VSR6MgRlDmC7TJRQ8mryqz9WIET657sMl5Og/QPbim9/NVYroBsp3x2f01QxWBjbjxCz4aHqapI7R
	eIoT/EK8KSakbjltEBDN6wnQIeDg1DXZ7MBF+UmBysEyjkszW53LF9m8TFFY0ZDTM/U8ca+4DNKyA
	bThg9eOmJmdzLwBaRqjOgTq1JKDJ770bN3oLhm7AUETS8OhbUrymyhJda9Ok+wGU/+LY2owEOLreD
	h3safWLMCU6FscV7nKgl/0aoiNpVPp88MRsUAag7ibZbVVRCxZxJz41oar/ZbtzqBTSr0+ZrWmNEo
	k13fUFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CUA-000000074ES-39sA;
	Tue, 22 Apr 2025 12:12:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrL-00000006x3J-3gwy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=; b=kLngi0bZdkRrqyOJP6w1SYQzlm
	8vd8IP7tT3kUqES7ssOqLE+Wu5W1y3qcOB+qN3gUJPPQtFi6oNAMxjWbKDUXbVDeA5v9xG+NxuMYE
	HpI3F5EBr7DRaz42siEJs94YyghWpj/6Fu/FcpsvTJca+muT5b5+BU3yQFdNzNT+uKsNFq0eNZ8wt
	APmDY9iUrhOPxOi90NvNzzQkFwhNgJOxr1gcGeLIOU9LRzDrz0n5J9wfoUhZcqmBMzZUcc2n2mCL3
	8CNexwHvbnN5DyuM1UqvvYo0ya2f0RHh7h0jkgRH6RB40Val7mvGSe/mi5sbd/0p8ZEXKZdMpnZ4n
	Y23eHlhQ==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BrI-0000000BCF6-40Tk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3578481f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321531; x=1745926331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=;
        b=B4BwPGZfkTvY/TIzBF/DcGKHlAIE4CtdTuuTyL8WxX8lQe02FfF0Za0onPD5t41NNe
         sCXkysjfra9PNDRQPANk1gTseipyuhk9yax3BfBKdjpbFX3DFUIRRPkgBfrFoGGbSQ15
         jSOkWuN9+UqYuZLeOXLVZwTIrpFx9Yrk2m0NaJe13Xm5NzxVhUZcnfn6EOvsRql/7LSH
         C6GIu1OY15/lxWivSiL0wf7ilbTAr9hmmtng7ozmrBSKJW7pSgmKz5SFsNZQd4wTRITx
         q3GXqTYuCPMwHT5nCO8/M0rBNumSAwctJU9hSIzOoJscZzLtOi3AhMFGUTYgKe01qVqI
         Eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321531; x=1745926331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=;
        b=Z8jo5HB/TfP7eQ+iJqqDRtZ+RbOy4WOLuPtqRKFiDzHpu6PPIajMGwoNjaTpKwHBFf
         0US6mfaxxFKCPlXkH68a/gXdSm6XKeCPdjVayuvUvZ5rFt2tX/T3kV2wfMlP9hSClkjY
         3SQBmGEWzXgbRYjqz6l33fxpgBHh1j0Z5RaS3A1ZmJc05133CMPPdIexp+24DpW5WmVL
         o86JAw8hD3225J6VHt5ceAE139R387HBPMKicNA7dbjNAqdGnRGqo4RTRVdhF9zlhlg8
         z4ORN9rEOwgIPS2YGIUYRfl9BSJgnDIhQVyl3KoNMdVs4MnMxSy6R3G5qUogeEwQPcs7
         6fjA==
X-Forwarded-Encrypted: i=1; AJvYcCVsYH2wKmwl4LEveV7ezZuI7k01vJ8HPRatcFIKVo7Es8xVWvfcBN6wfe9AabEsLWokPiFkAoXHG/36NLxGU+N7@lists.infradead.org
X-Gm-Message-State: AOJu0YxFqqUku5dhKuSroJt782ElgcP4xqIlLzdwzyLWR4wytZSBKfGh
	/m1mERTOCpUrPu3AE1Kh8Eju3q+aYWJP/sa3njGId1E6YiA/6xPtOZkCId24QvU=
X-Gm-Gg: ASbGncu0DPvp4n/mlPNwN1EHUJXdgmD+lIMM98le1ZbbkzHAvA3UduHckU1TuW7tGlt
	nw5KayzdsRqZszN7x3gM12V/NoikaR+nGoDl2qpy1uE6tqfp8Y+91mAAKIhGy8cjzUue08Jp8wx
	DSoAOrzj+NUU/bwewk+KfXJlSjZ7qcjIF5BmKyE/zh8irP31jYDVjwtWsXPvjYocRbchfiLgPAb
	Jor0xwEdEDfAkHx82RN01HCWJxB1W5nI7d8PElnkjr9EfPtnFFn30C2OGK0amX5/A80mu9+2Jy7
	RLt0e5xusRTO8Y+u6prIoilBZ03xt5mmxN+s0jBmXjpulG5RZLnL
X-Google-Smtp-Source: AGHT+IEfV3YGUN5j4yhdrrLJhy7BVF6BU0L6gVQPX9+sNcrdsbtuBIIBqNRd2hGHUQsMP3+8iBWGbA==
X-Received: by 2002:a05:6000:2403:b0:39c:1f04:a646 with SMTP id ffacd0b85a97d-39efba45f64mr11816104f8f.13.1745321530764;
        Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 01/14] Documentation: add kmemdump
Date: Tue, 22 Apr 2025 14:31:43 +0300
Message-ID: <20250422113156.575971-2-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123213_150260_C21F1DFB 
X-CRM114-Status: GOOD (  20.68  )
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

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/index.rst    | 17 +++++++
 Documentation/debug/kmemdump.rst | 77 ++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)
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
index 000000000000..dfee755a1be1
--- /dev/null
+++ b/Documentation/debug/kmemdump.rst
@@ -0,0 +1,77 @@
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
+takes as parameters the name of the region, a pointer to the virtual memory
+start address and the size. If successful, this call returns an unique ID for
+the allocated zone.
+
+The region would be registered with a call to `kmemdump_unregister` which
+takes the id as a parameter.
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
+
+Each region is being stored into a cyclic array of unique ids called
+`kmemdump_idr`.
+
+kmemdump Initialization
+------------------
+
+After system boots, kmemdump will be ready to accept region registration
+from producer drivers. However, the backend may not be registered yet.
+These regions are being added to the internal list and pending backend
+initialization. Once the backend is up and running, all the regions are
+registered into the backend. If, for example, the backend becomes unavailable
+and is removed, all the regions are unregistered and kmemdump waits for
+another backend to become available.
+
+backend functionality
+-----------------
+
+kmemdump backend can keep it's own list of regions and use the specific
+hardware available to dump the memory regions or use them for debugging.
-- 
2.43.0


