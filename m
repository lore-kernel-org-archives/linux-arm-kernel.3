Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXpneY+J8yPscOLP7jhAaiNlTKvyhknsIBSzw8J5v1o=; b=1JF6Ez6iW3LwSuJhZJ27NFzk2q
	ygQZYJZVe/Ir922LoHApzRfXCBYGew+sUWl0zto9xeFt4o1zxS/sm5K7/NTXbqBCdBBi540ILopIK
	WR1Gi1bOgWX6IByHMXIKCREc6mXsr+rQKhzKvDyzgsKU0fxYqIXafF+M4waQqbBQRJz4I7xr2RT/O
	I/HohaopjKyeXWTv4+yNkxl446zhkOrYzDYu7kGGHaqbarLgz9ULNtUJ8J3VMmlMSD2x9aaQwEIcn
	xMqO6ouT59XsIXB212uI+BrEnDQrg/CGaxkuCkhWRYExPCSd6OmowKpqleJvd2W4Tc8p770B4kl0i
	gg2Pef9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP9b-00000008O8w-3xGL;
	Wed, 26 Mar 2025 11:42:39 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP6D-00000008NfL-0UlU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:39:10 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-39142ce2151so2810685f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742989147; x=1743593947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GXpneY+J8yPscOLP7jhAaiNlTKvyhknsIBSzw8J5v1o=;
        b=pwDSJfUg/Azt7SGVb2qkKeoU5AF5d3XX2/Hq1GDT4I8sV51bhWGb9BGGNwRiIepQMS
         ZzQO2mV5S+jEPgoDH7Lk0y/yUOpl/LXYbyx57lMA4s4qgw4q5CysvoX6bvyPlzeijG2/
         eUNqlBhilQ8d05EH77xuvh2HMcOXGblm8bpTGpSUV/xlz8Bo1BTQgEFKH/H8/fIxbDAS
         XdUPMRmjz63yvkrpFgiQt9F9twfvKd6D367d07qZJG1MtwhINiOb8hrN1vvvYXt6t3lK
         SCNVzxgQ0sySQhydWOqVjvqUBzuByJMANPHxg6RxR5oiZs7EAuvnrfTe9m7QTlMf3kR7
         KsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989147; x=1743593947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXpneY+J8yPscOLP7jhAaiNlTKvyhknsIBSzw8J5v1o=;
        b=s5+eulmreTbrRanQPGRabCuiRuG3zV6wATTjkiuT/DIRdMewCPajHYDT1uYGye9PCm
         Y4mefek/cKuGd8Xtl2W6rMZ/TmPt7cgHrOlFZXSF0wPZskZ27zVdwolOp2/w/Gl/h+rZ
         gAUkU2sDLtuIVN/SWDAkRXMrYRY1oKpuxGDzXR7BpM+hWxOapov88gHnymmr5EMvOjjA
         F1jKdLgSARn9yu1TQO+IX2B3j7lqvB0zjsBN4V7fb/PnAvBtRN24tKEqzqWJTg0Dzn9L
         vnfD4LYfGO9tm34GTopZ9i0a0hiFgvA1oDQ/0bAVOmONb/y+FyyphxdQrRgRSKvdQFpN
         3VjA==
X-Forwarded-Encrypted: i=1; AJvYcCVmyfC+WeZlHGvnghRBRrV7fsapeVpk8b9kmkURjOMNk1acfth15aZ0l2Ttuc3A2La/PB579jd/RB5GVE6eA266@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Oo5+3ynm050fGeGaFvQOUyukOtykvO+OOKDq9gnNrOoyVHQo
	/j8U6N9E2ff/p1r7S0fFaz6kaxcrsyCpSt2jz+pG0uMNClJGICrufess2BS/Ar/NBL6I9Sx9aRa
	ayHgU40YWIFW4b8BYRiywfCHJIw==
X-Google-Smtp-Source: AGHT+IGmIIwQP0bm2M7IlxhsZXhvvis8SEyv8YAEqMxAp7vxQ4ixz0CF6DGy8JLA3pEu/5AAb31WyHaG1CNXPPwbNdA=
X-Received: from wrxt15.prod.google.com ([2002:a05:6000:1cf:b0:39a:bf28:66d8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59a6:0:b0:390:f6aa:4e72 with SMTP id ffacd0b85a97d-3997f8fabdbmr17862518f8f.18.1742989146887;
 Wed, 26 Mar 2025 04:39:06 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:38:59 +0000
In-Reply-To: <20250326113901.3308804-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250326113901.3308804-1-sebastianene@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326113901.3308804-2-sebastianene@google.com>
Subject: [PATCH v4 1/3] KVM: arm64: Use the static initializer for the version lock
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, qperret@google.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_043909_159248_92160E89 
X-CRM114-Status: GOOD (  11.83  )
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

Replace the definition of the hypervisor version lock
with a static initializer.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e433dfab882a..6df6131f1107 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -69,7 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
 static struct kvm_ffa_buffers host_buffers;
 static u32 hyp_ffa_version;
 static bool has_version_negotiated;
-static hyp_spinlock_t version_lock;
+static DEFINE_HYP_SPINLOCK(version_lock);
 
 static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
 {
@@ -911,6 +911,5 @@ int hyp_ffa_init(void *pages)
 		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
 	};
 
-	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
 	return 0;
 }
-- 
2.49.0.395.g12beb8f557-goog


