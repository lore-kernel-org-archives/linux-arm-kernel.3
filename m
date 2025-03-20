Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF8C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 02:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yL5b2WTU5WHGZETUIu4ND+tiGH8mntIZf0oxmIMUMA=; b=AXGUeE9sQcg8GNnEOU3qQe27oE
	rhfOMtLSr5xDLKy+nQ7T3fmyFo86I2A8F3CxXz5eY3GSQxBWM2iqbgF6Nt+23gEOUpw5a65lVvONg
	tFCuF7vUlbZrGVR9LsevKV7JqK5s98M5NrfMr2LeRiVy7tlzbjfKClHGnVWq6gHr1rFTE5aOGxx6n
	mNoIbDOOUxupjwUccPKbyUyOIOHz9Llt8WrtUE1mG1SDcPIqIR4XIVtMreJdvYWDXISyKFyspSZqE
	1MAtRrXudPCXuG98D46w+rCZYJSiepSoICxwCsnSRrl+hkila8sQN4YdwbAzm7or/QZekWHuhYUW9
	BtHRL8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5KR-0000000AoHQ-0w7Z;
	Thu, 20 Mar 2025 02:08:15 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv58l-0000000AkRp-11fa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 01:56:13 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22650077995so5170205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 18:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435770; x=1743040570; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8yL5b2WTU5WHGZETUIu4ND+tiGH8mntIZf0oxmIMUMA=;
        b=wSfsMcupzBcOYYlvN7GoRYET9X70swpalaV45piFB5Jz8BFqcmfO98JIBHE1TxhzJk
         qmKyOfGded0SshqCJveqJ3MCATdGLJOBztkTo/EJaO0Hz7riBAKWY2knNmHmIdy5Dep2
         y8+wAG3ioPLSx3VDQwWRL9XhStVzAvljlVyN44+DWEtPqf9Yc1ydygaCOFMH3tjoAMVW
         pYgdj/jvKxEKI2QNZO0APEJgV0Y4mAby/R/c5eVjUPvvFtO1Yg4iuJfnUk+Xc1KaHmWo
         eRfLRQeWj9dD9K3XtKghn+LBeP1fupbPI2BzLnBCg7/vxg1s9bwIqu2PhaR3eeEL1lcJ
         WNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435770; x=1743040570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yL5b2WTU5WHGZETUIu4ND+tiGH8mntIZf0oxmIMUMA=;
        b=oURYdppyHX9w3z5Swwg+9HuCFleVjKIcqAX0bLVDrnBjyz1QM9pTsKwzjTbaxiQDcb
         /OumM2kZYoZn9meL5gtUhDCgU09CT8J/te32hcP366X+MJr9athYxvunzB4AB/IMX3bO
         53E63RG61wTh4EETeq5f1TSwCXdcxsXcTD4aJNYXi0diOPFD82eJGVH4Sh47ld0vz5Zh
         OsUx56kf5IxtYcO/+CuwiJzpH9zmhDJ5erD2GtVVgFn6OMLMJtrhlI2wWq7nqoIunLqR
         cLYBLhOBZ//JLvLHC4jkPN3wyF5GsW5k2QN4jab0IaBP8WlKObCpY3WmfprS5mE8orJQ
         U7zg==
X-Forwarded-Encrypted: i=1; AJvYcCUHvHzJX05etnygjNum0dStFdyJjhRECVtCov1nQZINrpKLoDyzao/aRm0HTNIrAY+YuZQi6WsUh2szNjZ/CGiK@lists.infradead.org
X-Gm-Message-State: AOJu0YyAvU9wWcAI9KycSFthudKl9DCXKgHYBiANT/m8EAr+P3fN/E26
	LwCMi4yXL4vcY+qKla1w31pEpNg+G783728rTRo4ulIpId7P9XB7ETx+0a6EI9A/mn0tigOUwhl
	qlyIeD7Dn85mD41EtUQ==
X-Google-Smtp-Source: AGHT+IHW15FvPpMLWn1HKaL85qfGSHpQDCxTWGFYK6N/65irCZHXzpE1wn1H8XnTV124IW6pqODmzO2IIQUyBB4r
X-Received: from pfbna11.prod.google.com ([2002:a05:6a00:3e0b:b0:730:4672:64ac])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4187:b0:736:fff2:99b with SMTP id d2e1a72fcca58-7376d6ff535mr8193650b3a.23.1742435769805;
 Wed, 19 Mar 2025 18:56:09 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:41 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-7-changyuanl@google.com>
Subject: [PATCH v5 06/16] hashtable: add macro HASHTABLE_INIT
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_185611_304317_D80D6376 
X-CRM114-Status: UNSURE (   9.83  )
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

Similar to HLIST_HEAD_INIT, HASHTABLE_INIT allows a hashtable embedded
in another structure to be initialized at compile time.

Example,

struct tree_node {
    DECLARE_HASHTABLE(properties, 4);
    DECLARE_HASHTABLE(sub_nodes, 4);
};

static struct tree_node root_node = {
    .properties = HASHTABLE_INIT(4),
    .sub_nodes = HASHTABLE_INIT(4),
};

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/hashtable.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/hashtable.h b/include/linux/hashtable.h
index f6c666730b8c..27e07a436e2a 100644
--- a/include/linux/hashtable.h
+++ b/include/linux/hashtable.h
@@ -13,13 +13,14 @@
 #include <linux/hash.h>
 #include <linux/rculist.h>
 
+#define HASHTABLE_INIT(bits) { [0 ... ((1 << (bits)) - 1)] = HLIST_HEAD_INIT }
+
 #define DEFINE_HASHTABLE(name, bits)						\
-	struct hlist_head name[1 << (bits)] =					\
-			{ [0 ... ((1 << (bits)) - 1)] = HLIST_HEAD_INIT }
+	struct hlist_head name[1 << (bits)] =	HASHTABLE_INIT(bits)	\
 
 #define DEFINE_READ_MOSTLY_HASHTABLE(name, bits)				\
 	struct hlist_head name[1 << (bits)] __read_mostly =			\
-			{ [0 ... ((1 << (bits)) - 1)] = HLIST_HEAD_INIT }
+		HASHTABLE_INIT(bits)
 
 #define DECLARE_HASHTABLE(name, bits)                                   	\
 	struct hlist_head name[1 << (bits)]
-- 
2.48.1.711.g2feabab25a-goog


