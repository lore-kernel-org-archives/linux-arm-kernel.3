Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPIqYp3UxnrgGl3qJNmgFxP+ej/sPqPAZCQlcsmkZcU=; b=dF4SVQe1+3xRNuqeWrS3rUXGsQ
	vj7Y4PLh+AqHix64I4GJtgp5iudKe2bbEzVAjqRcGdj0UilXzmfzGqcr/PSRvjrhTZFPiopic9p5M
	saNhAdw4RLd/TU/v8LCMJ9ry9fFngmg1S4Gkmem+fVGxGqofulNOzT42xgWUzViO08D06UdksplSq
	XVU49bsxFNoz9HwFwzz0lflCfRhM++ZxvfQ+m67jkma8KnNOM58wk54271EX9Ny+CYWI1ImeG7yD2
	OOFO+gxgxKeThzHxhCgl76UeBeeEQzrghGmfDy5cInRd1Fp1Fc6UWfuhOM+Mt/SHys+AU5k/SPfv6
	wZME6DBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up24J-0000000GWr7-2r1f;
	Thu, 21 Aug 2025 09:58:51 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RV-0000000GChz-3rJK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:42 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e4134a34so570133f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764080; x=1756368880; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MPIqYp3UxnrgGl3qJNmgFxP+ej/sPqPAZCQlcsmkZcU=;
        b=rANmpob38WtfxKQTKkdkN+/nH/RYP+l8ddb3Oq69AJJHo0w3NYgR3ZhBVzXqjDEl8E
         daByH7SJnE1CaoWsKxPiRzfASszvOu8HEmUu8hhasAPT3Bvi/fbZxl/h5yN/Xjc7bjCN
         +zQVxxafYYEABBXPvpQzlDU7gDxW8TI1vsQIet9o112xUFElm+dJDkBDCpwalulsLeI2
         ywGgPPFVq6r6CaFhbL1ikBlbPlqQZy5R4hYC+ORA4sj+o80JnAk0QTXP64AGh91M9ipN
         SEOUK1rza+knQNZ8tBPtkqYa8d/5oib7Iyuvc+slWw6fQUr7/hwrAdvBxDor57eyI83c
         exUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764080; x=1756368880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPIqYp3UxnrgGl3qJNmgFxP+ej/sPqPAZCQlcsmkZcU=;
        b=L/iAOlW5SmqyuWjUwNMqtuSTt+QEZfO/7hGlOSqJK+p7paB9MGIc2UGZ8ErTqTm/JH
         FOe6BBx2+k55aMKC5LnpgoPdRwuNTH/nV92B3QMjimmtLt5p7N7bbGrE14jNgMuASEZV
         u0KsIALvofnxfx1zobrkt0hN9/EhO8oRfk0zyyzNCJmAKcFlb3crDcdhwnUURItvrFq/
         VBEoBg3IJ4tXtocF4WlE5zTxbYToo7TF0AuOR6i4rkOj/y3H5ilx1uUZbzEGAq+2GsMn
         Gpjogs4pg6/AIaPWlUYg+TpJJargVHCFICktwFXuVt2QHKhZSYkMzX0vun7gStrVnFeD
         u0JA==
X-Forwarded-Encrypted: i=1; AJvYcCW0xXLg1BpJktHuI8FBzd4YOMZLWNUlaErjLjjGXY2VN9kY+32117C9GqM3vxca8CjiyDYEd+wDXp+Q7kR83nSe@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrLB8FYDc7k68XviV2ZK7F10/VHsiNkKd0qcSpgRR8j1l8WiQ
	ZGGVfOoWn94g9Ibv3KCtcYGNAdtOA/8BDxoY4hgYIYXFChMd4vs6uNUrlr6z6NPyWUYsPV6GHsN
	G7XRPNenlhTxxLgy5fko4tw==
X-Google-Smtp-Source: AGHT+IFW0oHYaYpDIBDZYmTqCX5wHO/vO6Eo9gvoYMFEfcVe8Gc0SJN49mBNwuBaONnBa7e5yp3hTafs+zGb5o3m
X-Received: from wrno12.prod.google.com ([2002:adf:eacc:0:b0:3b8:e019:9f6b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:220b:b0:3b7:8412:4540 with SMTP id ffacd0b85a97d-3c49596dddcmr1244691f8f.27.1755764080019;
 Thu, 21 Aug 2025 01:14:40 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:14:03 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-16-vdonnefort@google.com>
Subject: [PATCH v6 15/24] KVM: arm64: Support unaligned fixmap in the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_011441_955571_908EC47E 
X-CRM114-Status: UNSURE (   8.24  )
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

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ae8391baebc3..75014dc7d82e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -239,7 +239,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 void *hyp_fixmap_map(phys_addr_t phys)
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


