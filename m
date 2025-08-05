Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2C8C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHsvp+/Bjkz0VzpOPnAgeOspoQjUaCKpxCXn8goA7qE=; b=xWlmG7WHn1TDBwUcvoBu9qHAur
	RdT5583iyg54sZMgJrKxhqwQRjOFla4YvtBQxvmHgCFQrwxPo3hjKdLbFhU6v96CrfktaxAWLEYiS
	9Og3F3/tnjviC8qtaMooOw7LE+vngieMAi6p92dNy8hPM41G6J6DKYZai4wWjZu+Z9LEbqgddONQE
	2X7awT7qdlFJmKlqrg+nY76POiFnerxrHgbAlUhePHD+w9w0C5l9hqS4J+XA5Ur2v202/aw9IufDE
	Ij3RiOOnNp1azjY/m2YeDYWr4O5ar3HrOaEH9KJYc13jlrcZBaW05OxzqGaeYO0Dugi+4DMs2Agd1
	YBGxiVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJXB-0000000D8Sl-0UBX;
	Tue, 05 Aug 2025 15:25:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI9Q-0000000CuPH-0v1f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:56:25 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45359bfe631so22982065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754402182; x=1755006982; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nHsvp+/Bjkz0VzpOPnAgeOspoQjUaCKpxCXn8goA7qE=;
        b=UeBjL6rTH+Jur0Ennrr6BfB2MZKKv+ogtidwxNi5zZQMjebwolmw3zAlVnDbX7u52M
         DGP8yeCyG6fx9cuObS8G5vgLP2L5JPNu3S6JKIfhWAmYRtor+0/pYr7Xy4RYAC3Ix9AT
         ohZ53N4hUc+HV1EN0g5FqiIdQe8c+vY4wGqLjQKREaW9sFtQsBmXr53ZoRx1sH3OIg1u
         +V1pPH3DmZEVnZbp1cHVlaBcqmUilyro8jWGTZPO87yKML9JlnyyiEvcIa4LjN2YFNR/
         cXjRe24p/G8aW6MeFAUJkAytbLIUnzh5Sa6TAOxhkdt1kevCv76JvdwDgKhoSo5g7DZD
         H4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402182; x=1755006982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHsvp+/Bjkz0VzpOPnAgeOspoQjUaCKpxCXn8goA7qE=;
        b=nKwU2fQm2Vfr8+lJzdqiGwVbJ5BhrKaRfv7klYRopudoJJKqEWGS6qKjkLrJVqYY6s
         dBo3UGFKwDT4T4eLur6bDM2y7fSJxgvEOeoJ7gp0/KMousbeiA2PujTyO32tg8HnDZ0e
         gjIb9HhstWd7NB/YFrKb2t6qUWNzW7Y8zxqY58gC/hZZ43QAYtjS3h23HMZdeu+vCng6
         95iV7x7l6mULLbg44i/tgql+WLjKNii4xz8Be+6/HEpnRf//gPfz5raMh5fboYd76Gpg
         lwVgunbp5OBhIquDk77hgmwPEtP+5Ybqvjkm1D/3rfSUtaodXcHofy5IJwi61IlMSpqm
         Le+g==
X-Forwarded-Encrypted: i=1; AJvYcCXIIM3XTOGX+n3UJ8EXmVW34nrnhSw7t8PyLbmeMnd3UKpug6dD8lq4Pg2eWfOFn9aCUysS9LWLn58E3yUE1m/R@lists.infradead.org
X-Gm-Message-State: AOJu0YzNSMvs7K6lj99I8OvipZQLNMfQOmNQGfzIxA8amtQ0NwRs0Xkz
	4ghT/YZ+NfAkbs0NnvQv7d1FHnx1mbc/B2ZmiDahhG2BryAYEmwzmj99gOMzSDN/eS4YugPfREl
	n6A==
X-Google-Smtp-Source: AGHT+IFWoGupfBIVH1rgX2yqjUwby0fXRVsDyp5fe2CHGq1F+B7GPhaYB69SziWlO39eO56tzXt31ZlbBA==
X-Received: from wmtg1.prod.google.com ([2002:a05:600c:8b51:b0:459:dcaa:ec9e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c02:b0:459:e35e:a90d
 with SMTP id 5b1f17b1804b1-459e35eab8amr16052345e9.27.1754402182673; Tue, 05
 Aug 2025 06:56:22 -0700 (PDT)
Date: Tue,  5 Aug 2025 14:56:17 +0100
In-Reply-To: <20250805135617.831971-1-tabba@google.com>
Mime-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805135617.831971-5-tabba@google.com>
Subject: [PATCH v1 4/4] arm64: vgic-v2: Fix guest endianness check in hVHE mode
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065624_262491_17D59D65 
X-CRM114-Status: GOOD (  12.37  )
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

In hVHE when running at the hypervisor, SCTLR_EL1 refers to the
hypervisor's System Control Register rather than the guest's. Make sure
to access the guest's register to determine its endianness.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 87a54375bd6e..78579b31a420 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -20,7 +20,7 @@ static bool __is_be(struct kvm_vcpu *vcpu)
 	if (vcpu_mode_is_32bit(vcpu))
 		return !!(read_sysreg_el2(SYS_SPSR) & PSR_AA32_E_BIT);
 
-	return !!(read_sysreg(SCTLR_EL1) & SCTLR_ELx_EE);
+	return !!(read_sysreg_el1(SYS_SCTLR) & SCTLR_ELx_EE);
 }
 
 /*
-- 
2.50.1.565.gc32cd1483b-goog


