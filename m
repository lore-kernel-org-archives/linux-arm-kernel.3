Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEC9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAuj7C7H2YKoNTM8wr0twIlAbi4Bb5s+3gqw8FPEWIM=; b=y1hA4HZpkHjaKQeaMDqzGwPjSo
	fXtyaN+fk+XhP6Z1FA11Bsd+X4gE9cj3uyquQcN7IAcrUvLlz0xzfw+5Pf9EHll0O6LmZhEteWPLc
	zhoYpz9YugkDpK2mbQYx5NZN8psRuAWmmq6/WxWoo2eDZVZpXl+LG+iBPbJKZbJByGO0L2qeYitAr
	wkh/nyo1br7wpkQMIufBsC+8oYVHe/rPb9xDmLV6AFEolG3RHW0v0TmhkfXpu/n5RGoB59IlFhT/l
	XiceNDajRr1OW5xkngH7+krwZczSTrKDHiQttQure5Z/vg5/t6mpX8VWQ+qU3oVIqofJj4aiWoDEh
	6QNhLnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8tU-00000009lxm-2Lso;
	Mon, 16 Dec 2024 11:04:08 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8h8-00000009k0F-3ohC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-436289a570eso31098855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346281; x=1734951081; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fAuj7C7H2YKoNTM8wr0twIlAbi4Bb5s+3gqw8FPEWIM=;
        b=045r+Rm5FqzUxVaNTCVsJW8jkWzZBh99vmfUUwYrHmslIE6pBIuNJNzfpnuewN32Bo
         8DIjDKF3qQHfziIPdDI3Ie0EF2oNMEvPXWnp3n6V1QqeIgUbXc41isqiJHXdmVB2LXPh
         if990pOzTLpbgQ+YOtVcews6XtSOxCWywJPG7IgFzrIUy9Uq/NNaH00R/RMdwXFx8fhL
         uY/CRGRAM82W15kLRdP8QILooI2BO6Dd4PPQrkHWFIax+wYt1RaJBj5IndEpaMceiIHy
         xEPntrIJDqUVIByIapCrw3MbxtzfuMMVP8TjT3esJHenRgPNAXIXYoOba8bU/20KNZvt
         Lu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346281; x=1734951081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fAuj7C7H2YKoNTM8wr0twIlAbi4Bb5s+3gqw8FPEWIM=;
        b=fbH0aG4abR5xJeO2C13tTQEOQb3kl3SmooR/+I4A3D6t+w/ueMRBZsaoc2EFvw1dUr
         vD/5eFi60faWjxOwScgTWciKSmQCuUdV6wR8mHAZHYiBU1fNBHRRUMJOnPyyvA72ASWR
         NGkdKkT6KaRIA3XIiqx824NCcovP2KDaIdfj+7oyzuwRBV++VLqbFE3y3QXONpB6JSGb
         9zDHdoyR1qEwwKlrFHXs7KL/WkPNJ30Ait/gq+xY/v0kqpQM8iM9oK8HCe+HQXDR/3m+
         NB4dddVEOdGxzZk/OXeBd4qr8BR1XRmjT7MKUBppgAkz2lyLbRQewqIsj4qwXtUcZjqy
         364A==
X-Forwarded-Encrypted: i=1; AJvYcCV2fOdlAE8AJSYw1z1g+Dp84yyBmJzgSQvdMfyld0DXOX03zLrB2i1eGW6SxQMxn74OmmKhBpkxrikBOD5Ql/SM@lists.infradead.org
X-Gm-Message-State: AOJu0YwFumOZHtQo8nnlFB0WO5eVoNMo0M2EdSppLrn11iXBrKTZJDZl
	u1G9GNRxU2Z0VasKp8nmUAkzwQaOJCx3A7i/C3OHA4miUKK1cTFpsNf11jlZpJRURoIf4EE2QA=
	=
X-Google-Smtp-Source: AGHT+IFC5u2mx9tjf2UN64KWU4at4Dw87sQewuG3wxlRUMwtao0CZRTo0ShpInfw9GzncnB31/qHqTErxw==
X-Received: from wmbg5.prod.google.com ([2002:a05:600c:a405:b0:434:fddf:5c1a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:450e:b0:434:a852:ba77
 with SMTP id 5b1f17b1804b1-4362aa4ffe0mr115535675e9.15.1734346281409; Mon, 16
 Dec 2024 02:51:21 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:51 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-12-tabba@google.com>
Subject: [PATCH v5 11/17] KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025122_943801_C69C9EDB 
X-CRM114-Status: UNSURE (   9.15  )
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

In hVHE mode, HCR_E2H should be set for both protected and
non-protected VMs. Since commit b56680de9c64 ("KVM: arm64:
Initialize trap register values in hyp in pKVM"), this has been
fixed, and the setting of the flag here is redundant.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index add0502f888f..21864d101230 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -57,9 +57,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	/* No support for AArch32. */
 	val |= HCR_RW;
 
-	if (has_hvhe())
-		val |= HCR_E2H;
-
 	/*
 	 * Always trap:
 	 * - Feature id registers: to control features exposed to guests
-- 
2.47.1.613.gc27f4b7a9f-goog


