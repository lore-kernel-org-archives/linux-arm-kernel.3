Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F28CF3942
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=; b=yay5cTmfDcvBwbyoEhGpx9cYTN
	CifoFHyvxpyaUnDKssE15HFs7CfAoTKeQ8kt//mS7fMmlu1gMntwThwmqAp6J0m4asQuLb3L58L8R
	RYCIQuTdHC6xU8zhMnNGcEGwT+F3W6SF3iYRyyg3HBVofHz7A9N19Ile+d+JIpfOxf3wM+n5t4l59
	otHffDEZggjcVBS3JygerV7bBWRfoJK+GUWMqSr82Hs7QWXRQWfN9VUPIfCfSiY0awDqXQmwJIo7+
	bIwREWp51qYjZ8Fv3L2ga5T+sHxgZB65aZpVL9s/RTzDTqEuiWS4XtWaWUIRR14947clv9DK7YFBV
	ttULOixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkND-00000003WA9-375e;
	Wed, 19 Nov 2025 15:45:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN9-00000003W3j-16Ui
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477a219db05so25822565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567129; x=1764171929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=;
        b=TLoiMFWm4Gy9zZ1euECpG+LwNLHNwTNRlIESlyALF3pqLdYOgEvJswlzvoF1Q7/bS3
         ZpE/+t1R22T7NqSryUx3gAbEhi50TgI/grhuXKOZtZd/AlfnEKdA6aXNFaNTKoZEKBA1
         oIQ0n/TX/cKyJ5+Suk9/jSn+rfZRrZ3TKSeg1k6qwhyIGOA+MzKK/3Yrbl7TgX+7Ty/v
         /PGs54TBPTNY5CxVLn7q7KpzWkxIsdSBRAb8jondkjN4so7Um0MiLMzz4F9aEOPdO/ft
         2tm2YX1RsyNaN4OloZcHKrsPimcfUXYLiwOedhPFwWgPs5mO/tbld/U4A91TkwoEvLgF
         jT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567129; x=1764171929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=;
        b=VgMWV2K8iA7xgEuGQyMz1eFiA9y/bBbh/FcOb825glnLS6kR/0rQUbAWNjxHwwVkhd
         nsh6UHnrKahq14ZRQz1r7+xUswR9/Kq+miGtbEeltBdncqpmuG47acPBAaJAiLf7NJfb
         MEqe/Dt1lohM7b5BM3UfflUpu3TrnLJSvsG/GrmhGAU/fdhtFi0rvPhO0k25oglP+k05
         iDtK/uPNg8x8a7ONQ3pcppz8oGscuW+zHFtAHwd7rqk/hE4bVQ4ObqyQMGA+uz0WZlz9
         rPtow4Bj1+01diwPyGFPHTyCoRmu1tAAafHznmacxG+RiIqOCdmEA78G1GNym2Wc4viP
         gG7A==
X-Forwarded-Encrypted: i=1; AJvYcCWvlBWRuF93okBV4jAqGh4oVHgQoAmyflzhww0PrWBatTsjNINeMuUNAkEC41ZW5sdR90UTXEVTPOjwwdoxBrb5@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ24fprb8z8DK004Ci2OqpD6MJRHTgHZq7KMGQ/N/B3WrYJPWN
	GBvEyj3vwBs+M2Czi7BMNKqeWez/FZpq+DAk80iQDFYu0qrUIFMy5zyw1gi+7Kq934E=
X-Gm-Gg: ASbGncu2tRf4p/RHt2LMf9TgKwpazE9tS+8OLfyhaSYbF2uS0ySa+PEn4nabFzG4oJP
	5iBCGeAGZwAe+w8bGd/kgK7M6MjQRej5p+Rhz8Q4cRBl/HKKrpeReVM5nO2LpOQ9YOZpxF+ZD1c
	NbAhpWjgl1D8YimiqaKbKDvsuxhxAkMKEniBXvQ6u2SrtJRRmhxEb+Lq+m+lSdEPH9wFYHCcuC3
	NB18DULht47pyOOJGZheVm/loQ/P3MLpvVyO513tVTxZnnzodhXHfFiy/AkikL25dcFOLbBxPb8
	SvKzu115FjZyU7rV9sFH+4lMXZ5xmBXAy7eVxIX1ZExvtIEiwuYrXNdeaV6WJBL/Oh/R3kWe3rR
	i4INA2pwYq3b9Iq1GZniJJFEQyzlCRuoRtFDvexOAemhNGZSMiae9CxPCFNRWPXSOd2QJf31t5Y
	kljn1qtvl39z/58zGwW9eh9efT6nLk4Q==
X-Google-Smtp-Source: AGHT+IEsAcddfcsUUvEjJGVD9iD03mMaqDkbeYnd/gOudjAAgUoPc2H5D0xayvELD1uec3MJtxxFcg==
X-Received: by 2002:a05:600c:4585:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4778fe59a0bmr205474775e9.2.1763567128896;
        Wed, 19 Nov 2025 07:45:28 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:28 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 07/26] kernel/fork: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:08 +0200
Message-ID: <20251119154427.1033475-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074531_324236_D6BBC68D 
X-CRM114-Status: GOOD (  10.67  )
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

Annotate vital static information into inspection table:
 - nr_threads

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/fork.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 3da0f08615a9..c85948804aa7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -106,6 +106,7 @@
 #include <linux/pidfs.h>
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
+#include <linux/meminspect.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -138,6 +139,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 
-- 
2.43.0


