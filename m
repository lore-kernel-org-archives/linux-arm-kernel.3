Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892C5CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=707YQ5WOW5OhLWsgc1Mn0RWZVRHccpuv4G8HLhK/9eU=; b=c4ogumEMInHuZtcWBTyLa3im4/
	6Oso24Ipk10GznuOeOCJ7PvsX8/5wSwVgDRfY+9PDw+F3Nd1aAQSsllI+QBd2kJHVQv0q4X+hmw4O
	iCnU3pu6jDex93z53EZbwmiJIy+oeVPn7lKLTRIJViXZ9UTXdRasnuz+oKx+enJEA/mEnOJzwOg5s
	0GiPogShh/KUQDaMwgBDfrFxfZhuIVIHEQNDtZyK/RYg4KOnkJtSUN91vp5Bmm7X0vrOoku36ypdA
	WCbsBZxU9v2jSAxg6oAu1GFHVM9Q+6YYHjUkF/KH0gNrHhYrGAoQlCqaQU7KGOcg5DUCYCKqE/0ee
	D/MpdAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdEG-00000002KFl-1R1m;
	Fri, 16 Oct 2026 08:23:52 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdEA-00000002KCv-3brx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:23:48 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a1ac6663e1so35139835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792139024; x=1792743824; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=707YQ5WOW5OhLWsgc1Mn0RWZVRHccpuv4G8HLhK/9eU=;
        b=D3ctTMfgaXvVfCit4tQgeyeVyoV6exFoG98+gr/tAof8ubzVw+6R4T+hJZqsW9Z6VZ
         3OJScbdx1tq5T0yHbUrRDg6igd+K1KD6HBOpfYQiNcqEGsuRlk4I1J+bS+zM2WIlgfwL
         Qqt1LEPcL42dlgZQmxqG9SxpaBZBP5eh31GccOlc43Rk7AhSW3mqIgAIrEljm3RFvrAj
         njMlQpQA6ZzmEhW7aP7soE/HnJ2mb1Z+N4fLuh1TFrwGL0ztjhNii9hj3fwYBez4PmaK
         sKsRoqj6nQpqFUiQzB3ZP5lY8ePCjVX9vFEA8/umE3+EAZ8T0Vgj01AGHm0rlZGfKLpv
         mYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139024; x=1792743824;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=707YQ5WOW5OhLWsgc1Mn0RWZVRHccpuv4G8HLhK/9eU=;
        b=SJyYq+DKUhG3YKWBEFau+Y+rooF3kRei0oh7Sv9XdTcm0Inrg3KRbn28NKFjvgdNbF
         DHfFS8laQcPTmtjtsC6Pb3/aRRyOCaD9+mnbbEweWY3UmmnsBvpWvwvF+/yPFdHleJEk
         LmixRcdZQvhYoZMNpUy38GHM9k3nVNDLc1hUN0HzypGzYwA7mKrq3OZUH899sudGxeFy
         cLXBOWCEer0a6A+GRsW1T8rWF1JlJV+qah5YRNbfKqNv1iW6Vy7HhPxogw3vE+aDJJIv
         qTJ/Kf8Bpk2eWPH3ir15UFxeBYUadn0HsKY3J5pAedvtBmFKuF05Lafm8ib4lkltoB4w
         jNig==
X-Forwarded-Encrypted: i=1; AKwUvBxMEKaIPD/yNEv+oU+pylHjtNCK9rsMd0yGgBjtbSDKNkU7bYDkO9R4MnW5Lhl7mEVeKe7woLzM4RGaZahLrIxI@lists.infradead.org
X-Gm-Message-State: AFq9FYKJHuGy7ZE1xkgBhIF4QXZObZ+D76hLxvAENYBBpLGdPhxYPfry
	ARP9zzjIKfrhZ9yENqZ3vEQA5CRtyaRKIEpkPbw+gTN1v2lgssOSt1pv2yqco/2mFPhfu/4AjeB
	Hc898s4F1jcLbK5je3vE0enCF7Q==
X-Received: from wmbhc20.prod.google.com ([2002:a05:600c:8714:b0:4a1:93c0:d3c2])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e86:b0:4a1:ad49:7b3 with SMTP id 5b1f17b1804b1-4a1ad4909c6mr230452255e9.22.1792139023899;
 Fri, 16 Oct 2026 01:23:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:23:40 +0000
In-Reply-To: <20261016082341.4030770-1-snehalreddy@google.com>
Mime-Version: 1.0
References: <20261016082341.4030770-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016082341.4030770-2-snehalreddy@google.com>
Subject: [RFC PATCH v2 1/2] firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_012346_903336_CE9D6259 
X-CRM114-Status: GOOD (  10.81  )
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

FF-A v1.3 ALP5 (DEN0140 rev J) introduces the optional FFA_MEM_RECLAIM2
(0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
a subset of pages of a memory region without requiring the Relayer to
maintain intermediate transaction state.

Add the FFA_MEM_RECLAIM2 function ID definition to arm_ffa.h.

Link: https://support.arm.com/documentation/den0140/j
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
Changes in v2:
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2, following the
  existing convention for 64-bit-only ABIs (sashiko)

 include/linux/arm_ffa.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..85c2e490a387 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -78,6 +78,7 @@
 #define FFA_EL3_INTR_HANDLE		FFA_SMC_32(0x8C)
 #define FFA_MSG_SEND_DIRECT_REQ2	FFA_SMC_64(0x8D)
 #define FFA_MSG_SEND_DIRECT_RESP2	FFA_SMC_64(0x8E)
+#define FFA_MEM_RECLAIM2		FFA_SMC_64(0x91)
 
 /*
  * For some calls it is necessary to use SMC64 to pass or return 64-bit values.
-- 
2.56.0.176.g3575e65682-goog


