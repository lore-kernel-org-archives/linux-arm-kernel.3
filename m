Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEE8D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0jYlXOcQHb39hyc/5eDnef2js3ze9FVOX5U4DjiM3A=; b=H9K/rNGCvNyyef3mX8/EuxnVCg
	kuAInkK7RkwXpdKr0TjT0Zj54c0385JIyYM7oh9B2KFCyYg0xxL4B+3AnOZZ/sBvsnVFM9mYb1Cku
	tXdkgMoAnBKnjFhv6JiaxSDqh6ZFDXoWU22kCS3JPl7prSIOezxdxVQWmC4LjFAvlOEA09dxZmIkf
	6xzvkVHqLTQLm2NnriaUnff9Zb3i/DMLimIohv2tiu1/hNk6gfCorHp6z1gF7V7oXUI/SiYkRFq6n
	f1gAtYzfJyezx9dDiryvL6NgnEBRXLrO0KlYM5B3NjO+eCrdt3jm/Zw9w1+F9GAhKU6086w+0xwD6
	4ul0rmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0v-0000000GXhm-3h5K;
	Thu, 27 Nov 2025 12:22:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0o-0000000GXeS-1gOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:22:15 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477cabba65dso4564795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764246132; x=1764850932; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0jYlXOcQHb39hyc/5eDnef2js3ze9FVOX5U4DjiM3A=;
        b=CCO27C7LMbg57HQHqnKoapipdEKmT2ZBN3P2aGiw5on0bg1BrRZ8Mm2km6zXLXC49i
         bH+AXvW7AqYhdWy+0E3KzQXGXR0NzkqfbGbOkd/ncGVZvgdrGwrDrW3A+wA06AvpCrIc
         w861frltpz9choj57Y2P4u1CALdKnbz8EUMcjk/2mpad3dbtvB/dkcZeCwv7XrWppN9v
         k8GxLrRi7pT1NuSowrfusF5zZU3vMHFqJD+6zwYRJhWoOCPnFcok8DdrlEepRYxa7hHt
         HNTfB2QjrjTbQS9rkOYn5/Syb83wisCJhU6+1o6AFq00H6sXalZMBvLQB4gZQlDVm0MC
         TmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246132; x=1764850932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0jYlXOcQHb39hyc/5eDnef2js3ze9FVOX5U4DjiM3A=;
        b=va79c4+iQlyw3b3issQy5MAj3WJjoloIsNL3lA5E0j2MxrCL3/qfwoFfGCCPPoCGco
         BkCyfJkIhxu2X9NuAqcEyslBqmxmZzNs5MzGkUBPXWoQXo/FIVgMf2YhcpGh+tzANB03
         OKxFqCECvpgCnpvB/YdKLcdgudpCJ5wT5kzT1H70Y+rDSLXvRTXGgSLajrhaLdysED0d
         wHZu/XySW5FXWqRjIiOXVlZnoNzcwahHp5qqftv8m6ectyFzM1MEAFWt0xl1tzlAZ4gI
         mMbNtd20Dx7RtF6y+7rsISsikaA/DVviL6/tdm2qflla/BBv3W9O5qtRWN5h5NwlWGG3
         q4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXte9iYaItg9d8wX5bQuZDl07rHUUo6EbZTR8crgJXW4DW+gPHEUDc3fYyzAhn//zeNpF/xSDWn55g6m2gaxIGc@lists.infradead.org
X-Gm-Message-State: AOJu0YzU1FNDBExnYFzWBpouRUWvMrBtru2ILw/Byrhx7f0pCdw3oitn
	yRPJ6L7VLz2Hx+UWzt63yoFLKGl7XmAMBISOJVx7fqsIcAeUC53c2xF1VHSXw5MpKyZvCC3AorL
	1Zg==
X-Google-Smtp-Source: AGHT+IG376eJWHhEDDHEut4Z6VQk8yE45YwYK/zkOvNfOcdPu+aYheXH5kexSijNSsoOI07uy/ilOytz6A==
X-Received: from wmcn11.prod.google.com ([2002:a05:600c:c0cb:b0:477:7a96:c9e1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1ca0:b0:477:75eb:a643
 with SMTP id 5b1f17b1804b1-477c0165b4emr275207485e9.4.1764246132246; Thu, 27
 Nov 2025 04:22:12 -0800 (PST)
Date: Thu, 27 Nov 2025 12:22:06 +0000
In-Reply-To: <20251127122210.4111702-1-tabba@google.com>
Mime-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251127122210.4111702-2-tabba@google.com>
Subject: [PATCH v1 1/5] arm64: Remove dead code resetting HCR_EL2 for pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042214_447668_A0D53241 
X-CRM114-Status: UNSURE (   9.39  )
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

The pKVM lifecycle does not support tearing down the hypervisor and
returning to the hyp stub once initialized. The transition to protected
mode is one-way.

Consequently, the code path in hyp-init.S responsible for resetting
EL2 registers (triggered by kexec or hibernation) is unreachable in
protected mode.

Remove the dead code handling HCR_EL2 reset for
ARM64_KVM_PROTECTED_MODE.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index aada42522e7b..0d42eedc7167 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -260,11 +260,6 @@ reset:
 	msr	sctlr_el2, x5
 	isb
 
-alternative_if ARM64_KVM_PROTECTED_MODE
-	mov_q	x5, HCR_HOST_NVHE_FLAGS
-	msr_hcr_el2 x5
-alternative_else_nop_endif
-
 	/* Install stub vectors */
 	adr_l	x5, __hyp_stub_vectors
 	msr	vbar_el2, x5
-- 
2.52.0.487.g5c8c507ade-goog


