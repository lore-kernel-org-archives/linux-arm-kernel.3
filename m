Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4E1C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHt9BrBIYqZp5kZ5sjlL9mrhswYvvwFRhl772iB1+XY=; b=irLGrJGQyVfXiPDyNN95WMDeWj
	GVWGC4IeqydwU3rvdXc5d/DcHQX9HpL6DYXKtNcx8OuK5liLx3MgQ5UYqTXOTQ28Su2IwFy7SZVzy
	mURJ0S9Zny9NCW4bSFoU7u9ts6+kvmtZgZ1VeW4Da2sP0NGcgq39EC7lwogLmrN6UaeCwGEwlN5Uh
	YQj4YHQCOjEdc8e6v5LVHU8rL5IiGR4pTEnoKhvxdhXFlXBygS31iRfFlmn3zJNzDcPPNO8WoEwxT
	lUHE3tiqAEmnZH5bOVS+uLSpULisKabHWBxqV041oqzTZad0qAYWbuRYdUCoRdKbXOIu4HSKI82ez
	MX6pmcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuOh-0000000CrWI-08tQ;
	Thu, 26 Jun 2025 21:44:43 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsr4-0000000Cgea-42VG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:05:56 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-40b2c2e52easo645867b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968353; x=1751573153; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHt9BrBIYqZp5kZ5sjlL9mrhswYvvwFRhl772iB1+XY=;
        b=QiPwsgpSRkXrnKyN3G6K0vxFjN1f6CkHGOLfePIyx37CvtUcxVTu0GAw+WSu4unWwK
         xkSboLHHWp91G7Fsd4/VdB2mF5+CamTs83Bpe0ZJrlpsQkT5eoIyMIlZHntKwbENLhjC
         i4SKWl3RZfpMfEJfqAbRqZl+99DQdeSgusR4b/+e6935yLcostf+wtZXWfDKa8qbvwD1
         rQVtq2BBVit58qwnDwOk9cXIgw5RBASNdKo5ml4DHrT85DDI4l4gMscUi3a5M6KbJNbo
         D2jkqHgCa1S4n/PzdjJkEOIrAjCdowPiGSGVNcm0m1IyTpovDsvWVNOvcslwwyEzSyZj
         c0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968353; x=1751573153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHt9BrBIYqZp5kZ5sjlL9mrhswYvvwFRhl772iB1+XY=;
        b=wTrcRWgeP1BFT3qLrxuQuKkLh/h1oOfL7fDKL8fiwYlfGIY+5fOxCxcgFYwPLsK0iB
         XTz0cOvjc5RWhud1EUDdLGSGv19o8QPv2hWVxWwsolrBl9M5JdyrgvFkqyT3e0V3ym8c
         kX5E0pAGUvsUVwrir4ZZBehu+m48C6hmF66t6DyH5h5pOnHfGk4dXMOivvhTMQBr4aOs
         biihhLEkfqNvOadabgNeYrPeh2CAqLOSVml9e+5n1kJ6jKRmaISdhPvW6n4jQgti6NR4
         +E2CcFwVtz4lfGSbOe/PGdrw6SwgEHN5Fjbk8yfNGvdlixKxjoG+ETfnlbSYg7f66r0r
         oUsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNkHKPxNuu7jOlYzMWYbTxwRwTfb+MJwLixRj4lrPoJQHEdIVVgSM8yZAszbJZsJaFS1R12DOwXg3/En7c2M/g@lists.infradead.org
X-Gm-Message-State: AOJu0YzFoBOpNijvx1nQ2d0pAUnfc48F7+z6p8uJ8e+jdXgWv3KXEqK1
	AMufpex6Mqe+2P/nwSsPvZhy2Gx3DsCEz5eYMSb8NJI5/yJpNXL/9Kwfy75eyJQrt+dWpmugOy1
	ynZOKLdtZCI4T1ASfXE7opa56WQ==
X-Google-Smtp-Source: AGHT+IFlRtE1eWK/FMjUnULxroCH+ZQKYqxRY5qaFdZ+f+SoiV9KEwtPmc0HwZMn2/GT2thgfmq4kS9LjJKIm6e5aQ==
X-Received: from oibcj14.prod.google.com ([2002:a05:6808:1b8e:b0:40a:c2da:1f99])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6a87:b0:409:59d:2fb with SMTP id 5614622812f47-40b33c77bfdmr516313b6e.11.1750968353579;
 Thu, 26 Jun 2025 13:05:53 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:38 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-3-coltonlewis@google.com>
Subject: [PATCH v3 02/22] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130554_998707_4B64B702 
X-CRM114-Status: GOOD (  10.03  )
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

There's no reason Enums shouldn't be equivalent to UnsignedEnums and
explicitly specify they are unsigned. This will avoid the annoyance I
had with HPMN0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/tools/gen-sysreg.awk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index f2a1732cb1f6..fa21a632d9b7 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
 	parse_bitdef(reg, field, $2)
 
 	define_field(reg, field, msb, lsb)
+	define_field_sign(reg, field, "false")
 
 	next
 }
-- 
2.50.0.727.gbf7dc18ff4-goog


