Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21F0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAZ9jQC/mJhCSOh/eXQcdu5v8UyTgJRpZIptn/Tfisg=; b=sDH7v2soveLroXVqg88YIBGKRK
	jiKkDXszwPAGf53STYDQQ7MDLsCKkqrUUGay1xf3lO1UuEmJtQZqQc7GAawVndV+c9NEKtpYhaQNZ
	pFpLbwNqLLsvyMjqVqaZoZtG3N8RKsYhZ3oxttbIZWs3ynBFK5acBOvx2yXS/BbeOuowzwOSuPElM
	uzNyhah9MV0yT9xOi9GULZ+lhZRk9VXydcwinhHCxX1ESbfm36RxFjXGJU0UZvVIqWw64pdEkhFkH
	T4WzbqWKgtl96lQxjNBn31n/2D9VEkYulTt1DqbbPKej+ZJW18Xus4Dcr5VpJHUzr21QJanZv10GI
	PfMA0vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfHf-0000000HCjY-1Q6U;
	Sun, 16 Mar 2025 04:07:31 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfFx-0000000HC8U-3bBQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso11625375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097944; x=1742702744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAZ9jQC/mJhCSOh/eXQcdu5v8UyTgJRpZIptn/Tfisg=;
        b=ggOHiU4z9mxgNU+shSrVw+6jinkyYBmCQcSlAUpjVuyTW4wK08vB2E/Dz84C+KF/++
         1fUUAwQH2D7eHRbvYNi/XeShfkZHQmG4+IpiWMH3qkdBYs/JxBjjGt/YrcS6jNpWctyO
         //vBYAUtxRigCP5xodJVJxcsrzIaYo1rtFuP5jy6QaXdLP7KqJqG4Thxx3uV4wJDARu2
         AhJzeu4PT1a9ujNojmSJ8uKt71S0U5NfiXHKQWWef0DHZbsH1JfiQgs3AMfFpYDE69le
         l9NJ7uasiaomB0oEmGPn/WfllE06irKh/95hAfdcNbTH1a9LjcytI7J107KA9DrevnkR
         F3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097944; x=1742702744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAZ9jQC/mJhCSOh/eXQcdu5v8UyTgJRpZIptn/Tfisg=;
        b=QrSss1yohq0THZAoOl7EGb7N+16TVwcD44LBPR/UX6JjNEh3QzlQDziMbR/qoAWCbW
         tOulTIwxZD59RdI3ZCvrQyqeFMZSdLGaQ5z7M5xgcwWbecKmrwMjWXYPa3IbqmnmA2MD
         fA62tddtnVBcIlc+RpWICuJ3v0kXgFdI0yMQV012ckl7MM385YxcMusRB1trQOIaxJa+
         El7S9wOamxQhfa/YiCk2D323tKaW/LJH3YC65JEVessTLblk/1BLKNHzd47fRfRRK2L2
         K82prg4pxsGO0Fi4Dc87Zil49BQDnIRQbtp3c13uYZ4hhb2v+KrRNMyO3TcY6BeBoaHC
         gQJg==
X-Forwarded-Encrypted: i=1; AJvYcCVoC1zxQQ8YrkB/Yqu1t1MwJUBvWVxrvvo6O4EMwH7HyrIxP0yCC8yptm+j3fS0bYPtDv6L92dAt8A5h0jDD7CF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxa7JvSJiieVg75RJDBdG7SGAR0unR101iDA4+GplLTOxyq3ih
	isRckU19i8z6Toqr0KAPY/pxtgunfYtblPZsTtgD4iuqtaaIA1PK
X-Gm-Gg: ASbGncvS7ztNpyO5hcTbYjdonSDSvQXcM+UAB5b65hn0F8lEXsXieB6gTvEX0Pz3cEk
	UnlWPJhPbQdzK7SVG5f5j31xdAeZxDNDGdrX83L9x9vVQOq1hs5NkMd9c3VTnTvHb4vy62onH/f
	rik7lJYVdj967htqUkFqX1J2b8OqBfl/eSgxb5mrW6fbj35ytOPZ34nAWLNwl55jXQSZgxoPbOP
	wUKHdz/qKeOGej61mhviRrqNnNXy7Nc3QV1RoU+E9RDM7Kk1mMqoTPxrK0runGPUNgqAnIL5qgk
	Y717B6PcmcnG07X6N06OIVcYO2CdwDxI8Q==
X-Google-Smtp-Source: AGHT+IGf5Cwi04Qa+X8PjeKePQUKLiwDo+IJ3EDto0rr/2TEINmkWVGh9IecdlUhicgQ4p2TyfcEGQ==
X-Received: by 2002:a05:600c:4f41:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43d1ecd94b6mr82913775e9.26.1742097943833;
        Sat, 15 Mar 2025 21:05:43 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:5::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3978ef9a23bsm6539658f8f.15.2025.03.15.21.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:43 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 01/25] locking: Move MCS struct definition to public header
Date: Sat, 15 Mar 2025 21:05:17 -0700
Message-ID: <20250316040541.108729-2-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; h=from:subject; bh=eRhFkF/3rcweOD1hEb8YOfkkc+MgHB8pVKtpJtztTto=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3butWk8EuLzPVXxsuVw8yqD8MdVwsBmree1XPD V9Au8WSJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN2wAKCRBM4MiGSL8RyiyIEA CF0DaeI20sABfTiW+XnI2K40s/yy2XdKyaP2M+UF+REcO/yDFmgt6PB92KqELak5+J8Zi2i1IGAPbL VUQGB/9GPicCJbHPwoFytzQGK9WLhUge3emsZIXUEY6hsTw5s5YX3aKvWQSxl2n+2FRSIopyc1rC3+ nX4Pt4N8iQzyrESusYoivUFphBfzorcIhNELZlC8XfeNgSvpH7VhGHxzgDF+f0x7ptI8tLqB4S9WnC rGlawzSJSmYe+054/yEUR03h250A1H8XHtH8s0UkaymWWfZwSVmdA2vRjk0YvRn/kn0jx3eBtT/Tc1 MnmcwgF3gfyF2j7LQ9KQ79/bXniDKzmIuPc4cUE7V8Mj/AWjZPH/AEFoQy7K47YG2vKIGBw+LK0DZD 8CMVBbbCsDt32Q699Fn0tSZeYkwgoDuNKv3MIFEk8nz7Ih7KdMQgjbUPJyk1KW8RabsVw0BOlA3igv /cfexOGCQVv0Tr8SQeEhc6OGyDr1NKnYqPqJ3+aBlq4sy68DpHYpQSYKJcESF4nGYrf9eOB6GPGPGK BEZnXXAechWthJbFWsNbSQMW/iZ7GgQ5MtQ4/T19J94XQ3Bc/LoSVUvlTBboqEyIUDd+eYO1ECll0r w9vUiTso2v9M8XgX8vGZeEBkK42nAuhPuDiT1R4EOcasWTSuQANf3LFmwfGQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210545_917019_265BE91C 
X-CRM114-Status: GOOD (  12.77  )
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

Move the definition of the struct mcs_spinlock from the private
mcs_spinlock.h header in kernel/locking to the mcs_spinlock.h
asm-generic header, since we will need to reference it from the
qspinlock.h header in subsequent commits.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/mcs_spinlock.h | 6 ++++++
 kernel/locking/mcs_spinlock.h      | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/mcs_spinlock.h b/include/asm-generic/mcs_spinlock.h
index 10cd4ffc6ba2..39c94012b88a 100644
--- a/include/asm-generic/mcs_spinlock.h
+++ b/include/asm-generic/mcs_spinlock.h
@@ -1,6 +1,12 @@
 #ifndef __ASM_MCS_SPINLOCK_H
 #define __ASM_MCS_SPINLOCK_H
 
+struct mcs_spinlock {
+	struct mcs_spinlock *next;
+	int locked; /* 1 if lock acquired */
+	int count;  /* nesting count, see qspinlock.c */
+};
+
 /*
  * Architectures can define their own:
  *
diff --git a/kernel/locking/mcs_spinlock.h b/kernel/locking/mcs_spinlock.h
index 85251d8771d9..16160ca8907f 100644
--- a/kernel/locking/mcs_spinlock.h
+++ b/kernel/locking/mcs_spinlock.h
@@ -15,12 +15,6 @@
 
 #include <asm/mcs_spinlock.h>
 
-struct mcs_spinlock {
-	struct mcs_spinlock *next;
-	int locked; /* 1 if lock acquired */
-	int count;  /* nesting count, see qspinlock.c */
-};
-
 #ifndef arch_mcs_spin_lock_contended
 /*
  * Using smp_cond_load_acquire() provides the acquire semantics
-- 
2.47.1


