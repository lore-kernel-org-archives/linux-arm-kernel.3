Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8107ED7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGNx4KryUAWkUrEyK556nEdWmNkAb7CXLB+nZikEwWs=; b=ghKIQ5N5+003gcRklP3IUkwzf2
	wWVdvqU9yWLFom8yQT8o+j2lxGDqkOzYd2G2bGlM7vrmXab55o4yPhGdjTu6kB3zJUfgiAVkQLap2
	T7W3PzZHP8fX21WeuVECo2dcVjLWWoDUk53pZu3XqJgBYatlI+qfFxSVRjkSq1F0ZmvWc42seUpgD
	En+3HXRJ+4IcIWh0kE/qqJoMz2WJ7W9O8HpGXYX1sgggmFbFIt9v3hfmyINCNQ//zhT+CCjdFm6Pl
	4OyRMPIAsQrGhgihfTUu3iwRzrehbG4nDWyGz6BuLCE1MBK2Dtc1p2T8sjAz+3dtaqgZ4K4egOcem
	l8C4KW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8wr-00000006mRv-1TBt;
	Mon, 02 Dec 2024 16:06:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ef-00000006iZL-3gOX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:48:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4349d895ef8so42278075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154488; x=1733759288; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGNx4KryUAWkUrEyK556nEdWmNkAb7CXLB+nZikEwWs=;
        b=tS5n0AOe4yH9hRpX35ao/x6NlxTnONpy9kYl32s1yV3pTlYp8FUg0ytEijFv0lU8H5
         84nKXT6cbNKrYDrQhdymiHnMeblkwd3zmW9XhGLRB1a4v5YzfrMhoqqQ6q5qxHJ9Ckqi
         06hyxtdElGPV5FQ+HyQUN3+4F+/vrwsINfGtUoW3KLEx1Imu2XBNrK0K7c7alFSQXUHQ
         U7jxuzkajE/Y6dFUkQ0fdIY74Xu5mb5vfizTgfURTasXAjo5IfgRrscLyK7CSpYLGGe0
         cISkbUvnhbyhXR7Hva7LTwbSzmxr+e7ckIXjZIMHenGJ6PHl/y5rqERbmUVVHUVA5aRn
         8F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154488; x=1733759288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGNx4KryUAWkUrEyK556nEdWmNkAb7CXLB+nZikEwWs=;
        b=DDwaI/zs/LcwhLjDsMsIhmVafjSndxMbXK2ULoiQecwii7ATmUghQK5Hi/f+LfZs8V
         inG5RhgcxjauOmzMmOu2QwWIC4LffCVSr1MR97fEFIOKgOrhlkvxSQ4Cy2Pct+6GwROx
         KOVkEkPnz5WeuP5ZjDsGot5/8YlJ3hjR2XlfDrzmQw9Bj/fl4gBwTt4tWXNsyB0WfGFc
         3CDhYzIBR7DctshTGEBgDQ6dw1npCDNkp4jV57gX+t876f8Feya6RLSC8/ZsNt44b/gO
         9TfW9q+zOMOgVRtlbxW20Gzg89ZBQhKK8eUoh74Vj8iZKbOPUocRQPgiYrnQY6UIkpat
         ZN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOCinEHrdxGiQQeQBdOQsIgTu+aXHhH6f7ceEp0GO8PEkHSIrf9MAPooJmoKhgJXPk25tMJ1iQVTH6RfqQbvRJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwgeBM8eo6TfWQj4x8NgsYBLTnMlGDPCSrWZS7na60GVlHxr6xU
	hVS4QRIifDgSuy7foEV6DGlQocTNKegx5XQ/NBPLSPzAbuE56EAm6tpfLE9Mjw/H/OpcfScW2w=
	=
X-Google-Smtp-Source: AGHT+IE+TCs+se5ONyXKqcos0wiRI1E/t7OZ3N4PjzO6JlH3kIzyJ0HixavxVlrNIbbs/fsbkOGIjUeMMQ==
X-Received: from wmaq11.prod.google.com ([2002:a05:600c:6c8b:b0:434:a981:26f1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:156e:b0:385:f062:c2d4
 with SMTP id ffacd0b85a97d-385f062c49emr5948044f8f.37.1733154488244; Mon, 02
 Dec 2024 07:48:08 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:39 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-13-tabba@google.com>
Subject: [PATCH v4 12/14] KVM: arm64: Fix the value of the CPTR_EL2 RES1
 bitmask for nVHE
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074809_908457_0E24762F 
X-CRM114-Status: GOOD (  13.73  )
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

Since the introduction of SME, bit 12 in CPTR_EL2 (nVHE) is TSM
for trapping SME, instead of RES1, as per ARM ARM DDI 0487K.a,
section D23.2.34.

Fix the value of CPTR_NVHE_EL2_RES1 to reflect that, and adjust
the code that relies on it accordingly.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h     | 2 +-
 arch/arm64/include/asm/kvm_emulate.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3e0f0de1d2da..24e4ac7c50f2 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -300,7 +300,7 @@
 #define CPTR_EL2_TSM	(1 << 12)
 #define CPTR_EL2_TFP	(1 << CPTR_EL2_TFP_SHIFT)
 #define CPTR_EL2_TZ	(1 << 8)
-#define CPTR_NVHE_EL2_RES1	0x000032ff /* known RES1 bits in CPTR_EL2 (nVHE) */
+#define CPTR_NVHE_EL2_RES1	(BIT(13) | BIT(9) | GENMASK(7, 0))
 #define CPTR_NVHE_EL2_RES0	(GENMASK(63, 32) |	\
 				 GENMASK(29, 21) |	\
 				 GENMASK(19, 14) |	\
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 7b3dc52248ce..6602a4c091ac 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -640,8 +640,8 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 
 		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
 			val |= CPTR_EL2_TZ;
-		if (cpus_have_final_cap(ARM64_SME))
-			val &= ~CPTR_EL2_TSM;
+		if (!cpus_have_final_cap(ARM64_SME))
+			val |= CPTR_EL2_TSM;
 	}
 
 	kvm_write_cptr_el2(val);
-- 
2.47.0.338.g60cca15819-goog


