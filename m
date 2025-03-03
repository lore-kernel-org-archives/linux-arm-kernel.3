Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D55C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=; b=efzI0QCH1+DAJg7ghOUCMjZUIH
	I5E8FFcgWNVn6WMg3Nuz26dZ5HnM6Z5Mux9C7rx/6UXnAMYfZf/ifQzo2BWG1e8bBdMo+jSt+9zAP
	6af7i5qnTMCujtVVun9K1MKLXPdWES3GCQdK4YRJxgEHEqrWPYuNZAHD8UnRHy5LIT72Fka/irwYW
	47JzUQxTwHlFzLlaCb63VwJ+Lj9ppWMhfHWhX0UAJD5i0zK2/PdwmrRtnyElfkMu/5uvvuS3Xg6dN
	Vdq+SeXjIGcj5GznfwnWABXgdQjiCKLRF2LT7QvfMTb9ZtxqGdaYKJukzZjkPTIVmsKPgaxYDjftW
	GUM03sSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7f2-00000001Ipo-38e6;
	Mon, 03 Mar 2025 15:24:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dR-00000001I6z-27L9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so29222815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015392; x=1741620192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=;
        b=dAK+Ck11HhxemuHsf5MdzI2VvNIJDO3wBqiQKpl7nLtD6P65coarz2z6RZ4YmmiXin
         Wyb9xC0AH7bnRZdBVOZvan4h6cwfUVNR4lyp6Ez7suJxCU7Yho4xEcDTrQsLSia4gpvr
         4YvL0+QEMFoGrp1Gw2Wge0fmQnMRCOCbBZj3bG0UsRrhEyPbOyKfgUU3+WZu84cXfkMk
         OTPAol4hGBHvpoNvC3bCFdqoALIvZ8q8cYvQb/UBUhTfP40bzBRmgqJrpED6q2ncJsnb
         8ZNXzstQ91F0Vmq73T9QZyZWKPdWzhkxTzVG3anN7XtIfUjhN6VWqKiYE9uzPfeUGqN7
         upBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015392; x=1741620192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=;
        b=Hnlt5TFiNfqw+R+gmZMkYrOugHoMDkj8itxZjDAubjnq+VaH3GC9LunWmUWzRA+lQu
         oZxskGdqRjl0IivsKtj6f/XqFDqDR5H2sMGCowouhik3DskOZhofcc0FGJN2Hk1XcSxM
         YPBOpVD7Ibl+ghMdjC3cu/OauY+Nx0/wvqjgPAIX+UmUHDHIX4LqYrmR2UR7pBSsryXQ
         sYnyiVDDvEkaUTC/S5VW0DdP/jhr5YRRggNaI9q01pAOixhPmyBQ2LOGg93h5cjcXfm2
         OA4H3UnWWiekG849f6mM1GOCdDzFA9U8VHqpEvceKV819rCyj3vG5zoFnyM850Yz71l+
         nXKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmh//e9AqG5WvarW1jfNH8Y0Z1gS+5sJ5u45eZrHCPC2cEXcODg5RwOBBztgwfs0/2YpjoElPuZIVEQm0VzjnY@lists.infradead.org
X-Gm-Message-State: AOJu0YzGIiYbSKf2QL2AX9YCQn3giU60p+Sp18eseOQaOqZpHoKzqz73
	AgnHxgJDmuuj2vi7wiGnWW8Vat8Ku/otXU77Ezw6344A71Ok5R2C
X-Gm-Gg: ASbGnctrdZdRDHgY177Rd5nyV2DPgEfTWyaPnI0V0mOgDBxiNC9Z8PtAQtSfjKEFgt9
	2i6QJTA+mt8rARd6lq8f54mA6XvxLVLffWuFfjuZctRouJoNTyyfMgRHPLrfJs2qUzM8jxKaHcQ
	LyR5LvhOXail2i6cdRQuI/w3cKJpd+f7g4Mm2vmpPhiq8R2IaVkl56rMFOrddmHBxoQSxt0aQYs
	kzGWdbC9cxw3dqDXFn9N5CwU+rVpC7wOCMP93KMgg6E4x1H1rzV52jIwTIFh2VupnoIlBIZE+cQ
	wcjxBZDgZ6pxvtYC9P9xwkEyxvizBvfMkw==
X-Google-Smtp-Source: AGHT+IGWe7AGIoZyzhIx4o6frHx+jxnpDfdaTig7kvrlS9c7aRLExKFsaeXCaLAhRyKx5jPukd6geQ==
X-Received: by 2002:a05:600c:4f86:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43bca3972d7mr4843355e9.16.1741015391407;
        Mon, 03 Mar 2025 07:23:11 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:4::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f75ebsm164799315e9.3.2025.03.03.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:11 -0800 (PST)
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
Subject: [PATCH bpf-next v3 01/25] locking: Move MCS struct definition to public header
Date: Mon,  3 Mar 2025 07:22:41 -0800
Message-ID: <20250303152305.3195648-2-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; h=from:subject; bh=l+FzxzqcQOvCH8c5GurhKDmppajCdKyqii/WUkvzxT8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWVghejvu1V67bqXOIvMlrdiOA5EFuq9ml673Px YVwX7L2JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlQAKCRBM4MiGSL8RypodD/ sHpZiA9+maif3gXLaLeb6BTa8ziYYbNY7ZG6/NdOcNw/uV3egEUUzRRqjKaMmDsRtl8u3i8UuKv93i Jpn+XC/A+FwN36qoS13Atwe1+eFSD/ZK0b52m1Tgy5sHI8wLBe/eCop0B6+TdV+nqpCUG22mIxK8kL yxABesXn6haH0qjCe1WgAx2qbP15M5KLx2leHpzsbXkBjQN/URoZHzBv3oyjrWiFXXn0R1lS3yGOwR V3j3EA44LSwOtcKzHtFmZOPnzXP9h/VaWi9Q/827Uq8Q5YpRgAhsDHaBEinMJ6xrWKWKxzosaTM4qZ 3Kl57QWIF7hlmRccjfD2KGQDbup22QXtz34QHm0FjNknfyT3oVfUVoJ8RTYsXR4h6sIkAEV8mEu9Il 8o/qwNMFXj/K1a3Z2+hKs9CkXdftARzIiKNhnOLoZ6OcMybgSp86eS2StUIeegiSSPWCLSHJRijnuU wb0sFuJWRQ6eveZiG59om0uLPkO1knbSuAk+dkykWu5TmE9nKyt7WXULkN9Q6+rkG9Lkt1jV89MQEX 3sPA7uXmn3t9nLxQINGa3cpYEru6LaMTvUmeUSf5maMPLnh3CMlBYvFVMi5q2JPW9m7JyF1/sqOLrp wGbPN0FktYyVe186BbPjg+7BtvK8bU5OX0ZT5CupTYRg2a1ZfvVBTo+6gZnQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072313_541823_BC5F63E7 
X-CRM114-Status: GOOD (  12.58  )
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
2.43.5


