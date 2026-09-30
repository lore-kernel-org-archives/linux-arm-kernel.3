Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E49CCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=; b=Zt98aLvpRBCzZQ/RZJjhP1kgeY
	BagLLEHsnGGN0N7pdiWiGHja1ofQZAYBxL4BQ1tJSydVLWcq1rRdH1S3GhDV4YrJhT4WYS7Yi70l+
	8Fen/4JMvkd/3Yb1NDtIjYsILZyFxuA+dZHtH3NV/vxTI1yefFxU4ewtiRcCQA1NMZmRfL4E+Yx3S
	8Jrsc4+AZcUtbTPhUqSJjNy0GQauBfrrn7gTulsNUjiGKHwx3yx4hdyevGL9ekmygShFUaajn+S9j
	oeuceJHeztA37xM7mIXMWPX5uc75HfgSSib6c5LuznCoUBiWvmkAWLE3lYWQnVPdRww3fo2a541lX
	Cj256ZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLJ-00000006XJu-1jHq;
	Wed, 30 Sep 2026 15:35:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLC-00000006XHa-1xJg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=; b=GMoTCqPD8uLxtUwCQbpsY1UD2C
	MQ74Odg/1hgAAvkq61iwm4t5jUeKXoLh/s7W/HAoVZ07LZdB5yltM9GZfZaMWMeq1S7L0OKaIpRwq
	ezuXqVTsjaTJmGBGCjjBnK/bBEW39a91hr012BcEAxMIS0tywLhSJYukoIOtZS0kpDoVDLTnikWqy
	xY9DHl8YouDA3gatk2q8jA481A9oXJdDULzVK1P8jit99kTptIbVvZfQ2TQhGBeO6axwYJzv6kzOA
	NiodJsnu/dDkUX6Tp8ojAywXuNYUrylbh06gScrylVz7SH4vGrVO21JWtdUrJeaCup0V2LrcLyZ6Y
	L4HqjHaA==;
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwL9-000000040Y3-21Zb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:35:29 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48589603501so3829142f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790782525; x=1791387325; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=;
        b=NaKNxNlTKRr7P5JHvWZCnj12UmI4mTuPZFVrh/oUz/S4tsx9fD9NUhlMDZ5+EH5Y8f
         OlG/3Io1k84hxnt9l7Xc2jgjjgEkCdcnUSov+y/EHsgFNHPiZjpP6nxXJN0Nl2Sem6vF
         Ui7M+HltRTOfXNoZBxfSyZDS69c/fYh5Q6QJaqKGNbphC066degqpBx6IuD+tjgyNex7
         TeYzno9ajQGPD6uad7b3qR2r6aVmN3zeBQEa9bJSh8XcLapqqU6HBZU0nzZzJShbCPN9
         jTNiteuomK9WpGhqfTcT0wR7S6sNa2zDkCQKP0LonIEVoFlHr7in/DAzzj5uz6jSLCt/
         LE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782525; x=1791387325;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=;
        b=nHZymKMmla8DYPjEEzhMorH6jH+zVzZkBMnqSCf2yZdG8bAE7faAMY284tNAgA8qH4
         kS2t28ougvQDNAg0JkWjTi7XLQ865UwMg0w/QgIBopr8bTQPduvYsHiDIFptrGhCld6W
         ucKG++lvHR5U5IYn9o83XrybLlGh8p4WD3ciJ+XUhATqE+yiDMkhEsovyysijedoxubI
         75UgyyJCFCRa5bzld+anM456hQ746Bfino7GSSji3C1ihoRut/sKOwgv1vR0+Wsg2K8a
         4/EoRjLRv9mLse2O9ksNyP6czRUtMn4gm6R6s6wYZB5Qoo/lDaYZCa/Zp3ilOhpxewQA
         7mQg==
X-Forwarded-Encrypted: i=1; AKwUvByYwKWf2ig2mlgJiAO3Lp6XqkUoZWRXEOnDWGyhlA32CDZfkYCtECxUtPm/XqRNGb2ceWHst+cmEvFpmYQOGC9D@lists.infradead.org
X-Gm-Message-State: AFuF++lX9qGGe34N8KvCGWscwPqXVZ9bjx54RoQRPhcVxq5qIFlFSQL6
	F2jB6KD8kQzEzGXaAaLWQY5qy4E45vGd/nepb/EjKtR5YWWjdTnJeb+pgfyLBZmCxLof4QzIKfY
	kN987DvhSr2x3FCodP10/eQ==
X-Received: from wmbgy25.prod.google.com ([2002:a05:600c:8819:b0:4a0:500:55c4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba6:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a01addde33mr35495045e9.11.1790782524993;
 Wed, 30 Sep 2026 08:35:24 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:35:03 +0100
In-Reply-To: <20260930153505.2144559-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260930153505.2144559-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930153505.2144559-3-vdonnefort@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_163527_765766_22D035C3 
X-CRM114-Status: GOOD (  13.13  )
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

kvm_define_hypevents.h is used to define the kernel-side structures for
hypervisor events. It doesn't need to be used anywhere else than in
hyp_trace.c.

Rename and move it to arch/arm64/kvm/

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
---
 .../asm/kvm_define_hypevents.h => kvm/define_hypevents.h}       | 0
 arch/arm64/kvm/hyp_trace.c                                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)

diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/kvm/define_hypevents.h
similarity index 100%
rename from arch/arm64/include/asm/kvm_define_hypevents.h
rename to arch/arm64/kvm/define_hypevents.h
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 9644c424819b..8faaec899f92 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -402,7 +402,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
-#include <asm/kvm_define_hypevents.h>
+#include "define_hypevents.h"
 
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


