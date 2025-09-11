Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42669CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QS0X9ggn6fxbGpDUqeyaduaSpB6sZdnskQczeYDZPM=; b=DY59+pP0n0s90/XethhBteZCqM
	PO+JUcxl7OB/wNvLYnjFs+ce7VrhYIC0hxQ2QLrxt3z7Jiwi7Q6AUJboHRw1dv0o/QzPNoSLQR/eq
	cn5hQKZ1kddgRiGG6RO4BJaq5UxXi8fBiqnJtZytY28+9NeVqLsddqX3DOq8hg3APUvRksxs4Jf4t
	Md7i2wTUwuxu3+z5tynStNZv3g69oC10vtIbtz2dqYG8O7xi4WiaA0EwMwQfjTPkHs+xmEOdKDNr1
	UwZ6FgmnVHLnjdLw2E+8WEI9De2Lt9Z0pM1Goy/mc73IB5g/hoEfo3qRMrm0dvmtx9ZXFzy6TmGSY
	BJtarG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgL-00000003LP3-19Uf;
	Thu, 11 Sep 2025 13:49:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgI-00000003LNB-3Qgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so6018025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598585; x=1758203385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QS0X9ggn6fxbGpDUqeyaduaSpB6sZdnskQczeYDZPM=;
        b=bGm69Yi5kTnEEwwAA/5bkJBRpT4OeOcicLKOg9oB6419cpb2lp5t13LEpsiZk46sa1
         /Ty3sQ0Lx64k6Tk5oMw4XBhZ+4Qj5QpHIJ8oe4Hl8Q0LtpC57QmbHQMT3PllYPL3HXea
         XhgXH96aGmIoZS31ddO92BLRG7dRb8Y6yq6hBwcm30uKbFV9phOBtlRecqLO8EZ2kcfb
         WY4soRhc7ngjhePra5IhPwYeMS5yqTy9fGYLtK6L1mm9S2J4YG+kSo/tTOROZbbvZ7lJ
         h9L+jtK5yRYMFH9C2a2hwI9RGznix3V1LfWITo2T2TqfQdxLdt2QM9+emN32tPxT54U1
         eLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598585; x=1758203385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QS0X9ggn6fxbGpDUqeyaduaSpB6sZdnskQczeYDZPM=;
        b=SJpBwSUb6qKWLIG4U9MXLjcHLkyg+IqdHhXFcLO9dG6PT7DoLkF5cAuZG8lczTXtX+
         sDGonq2DlvtyECWlBvXeiDE2Mpi5218HJZ9tcchbVCH1ZMXB+v+Tz1KcM05EeMQkmENB
         xxGhLj8maZrkDUvIET4XriVYrlZShUTC/trx7zK47kBaUBdhnXw0N2CbUg2Qn0NVVDBq
         TR/v6sHYzQGykeSDrGi6yg0yqkhtV30OlDOhi8iKXLoRC1aAVj27AUXrYfQ5u6Hm97Pm
         Vlq+J8YHdy6iHULVxXZsh2+cj2Qn3Hkc15I3QRpJ+M67E4N4Nad3RFbN6n+3K8BBRXev
         4AbA==
X-Forwarded-Encrypted: i=1; AJvYcCWsI2FqC+l7mo4/lCkdk/J233p2AQHG2lrywWlTcJbD16q2w7Tuk2GPRLjV55U1W/nemsE5YEciKHrnnRW+PoTG@lists.infradead.org
X-Gm-Message-State: AOJu0YyBxxwqUnG4Zo0aEIJn7b4S8yFY4vEhKoSQv/Rr+KbeD7SegkyX
	d2DiVFUETvP8ZVcTvmOLwNRahZB0Bc+ziOcP/gXkBwSvtEuv1Kiy175B
X-Gm-Gg: ASbGnctGplRMyQ8/m7hRRLRgR4iOUmWVm3BSbT6MXqeOZ9hrOuNYue/7kXWNAHD4kYm
	ryc9+0qs9syysnxLf0HezdNfTGKyvqFTZIrGXuKZQbW+SaTU3iaC2By8L6ixn1nm/sfQXFwOlTD
	y5dhLfp+Wx8T8Ek1YT9ZHTP713C0dGqUeyF/AZsBoqqDrroq5EsXbdzbw5xSgQkbXpEbOzf0Zif
	qaUM05/5jHvx4e4r1TGCEVaH+yo5RM9n3CDPGj690Uxcohov5iFH5flGujMjptnpgLyDJH+mVuD
	uMX2nK4Zq4DBAxcosfvu+9nNRn6nAxQvWjvdq9/pNmwRCxwHG8St3pLRklaW0VsJ5DpwXQhwCNS
	eBI7bCmUk+rLPZz+5E1BPNqYXLU6f8OxlOlK5QMd7+OBEe6LscbMwrQlp6XU+tESMkVMMN2JK
X-Google-Smtp-Source: AGHT+IFNNNmoDMaiLwtDUu3F/l93u30ohFmaZcpwi8LsB2GCj8jLScee70K+1o9ZTJ5T9w+mmGeR0g==
X-Received: by 2002:a05:600c:4709:b0:45b:8477:de1a with SMTP id 5b1f17b1804b1-45dddea648emr170375255e9.7.1757598584916;
        Thu, 11 Sep 2025 06:49:44 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:44 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH 2/6] KVM: arm64: Add KVM_PGTABLE_WALK_PRE_FAULT walk flag
Date: Thu, 11 Sep 2025 14:46:44 +0100
Message-Id: <20250911134648.58945-3-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064946_882438_CF5062A1 
X-CRM114-Status: GOOD (  14.24  )
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

From: Jack Thomson <jackabt@amazon.com>

Don't return -EAGAIN from stage2_map_walker_try_leaf during
KVM_PRE_FAULT_MEMORY.

During pre-faults, user_abort() is retried upon returning -EAGAIN,
meaning the ioctl would get stuck in an infinite loop if userspace
tries to pre-fault already existing mappings

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 3 +++
 arch/arm64/kvm/hyp/pgtable.c         | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 2888b5d03757..0789671d1c4f 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -296,6 +296,8 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
  * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
  *					without Cache maintenance
  *					operations required.
+ * @KVM_PGTABLE_WALK_PRE_FAULT		Indicates the page-table walk was
+ *					invoked from a pre-fault request.
  */
 enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_LEAF			= BIT(0),
@@ -305,6 +307,7 @@ enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_HANDLE_FAULT		= BIT(4),
 	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
 	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
+	KVM_PGTABLE_WALK_PRE_FAULT		= BIT(7),
 };
 
 struct kvm_pgtable_visit_ctx {
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5db..140dccec2c5b 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -914,9 +914,13 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	 * same mapping or only change the access permissions. Instead,
 	 * the vCPU will exit one more time from guest if still needed
 	 * and then go through the path of relaxing permissions.
+	 *
+	 * When walking in the context of a pre-fault request, if the
+	 * mapping already exists we can return 0, as there's nothing
+	 * to do.
 	 */
 	if (!stage2_pte_needs_update(ctx->old, new))
-		return -EAGAIN;
+		return (ctx->flags & KVM_PGTABLE_WALK_PRE_FAULT) ? 0 : -EAGAIN;
 
 	/* If we're only changing software bits, then store them and go! */
 	if (!kvm_pgtable_walk_shared(ctx) &&
-- 
2.43.0


