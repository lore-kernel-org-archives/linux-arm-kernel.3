Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63616CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5fj8/TCAT99B/0+ZH0DB55n65AvGpzqDY+eLZ0gMn24=; b=0Xx8HiyF+gIrrq3oMMQaNYWKxn
	kiAj3/rRpksqLeuMnnfuwjmF6lAWSUbuJAM3sVCSxxcP/lNRwNHqA3wP7a++GSzuX4tGOw1h69wlv
	prqGcZxlJz94YDKsCS1XqpVejfC+Mnby9sJrgsRFVvWvaiRdcY9PJvzfby8XLTzNYyMpoNnE6SgyV
	3VH4dczZ/GYymVkjQUWjQjWeC90cfRqsd6Vjq2UUsCMCLySXn+/S0/ZFxUs0NUfT8PTi6p4ljOEyV
	ylE8AkBkJfX6GqGwqk/9FhP76p5r8W2Ul60R1CM8oYEA5kUojRPVPZW+KY2T+90Zb7MT+rY1SWOif
	7G8QScOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmTh-0000000Ghfr-44Q1;
	Tue, 12 May 2026 12:44:49 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmTe-0000000GheD-36OK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:44:48 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4411a2c034fso5049459f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778589884; x=1779194684; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5fj8/TCAT99B/0+ZH0DB55n65AvGpzqDY+eLZ0gMn24=;
        b=b6eMFXlgRNueX+wWyxnAbo7fbdK2PzyuZimik70wU2a8752OUB7BG3VTFTWCfZd0nG
         UQRkyoUT5O+S2yTokJFo8Rjl1yaKAec/GJyqXs2OKleRqegWUnlhHS+gRjc5a1MUzmig
         I0cEZzK1/3IG/qcQaS6JZ35n3cWFO5TC4s9PigTNwMSQcZPzRIATPWd3I6LJV2a/dOAj
         Yejd6fLUbUM/BbzS1ySRIjHfU+BSkyCWGce8nXouASdnrNMy95IIsht2D97aCFF7wLZp
         pw45SDcWdt4g062MaqjB9Wgxd6kdTT/cOu9xMdJsCtpihBB8NdV/BU6mGocEyo3udx9U
         wN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589884; x=1779194684;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fj8/TCAT99B/0+ZH0DB55n65AvGpzqDY+eLZ0gMn24=;
        b=AigSni9SkwxG00naa7MwWa7xWpj/dm9PM4tTGdJ+6IfLmVWiEr1C61S4aodv6VBK2k
         NP9t0AU5hcOPO0v1O43FkGfr320onr3bo8/5K+G5oJ94c4Nq4VVBiYDKLYnqpexYZfYA
         1rBvzKR6COxm4fJqITuAszBCz4tSm/z05TarquSe6eEC+NsQKy3J/PNWcCiD5xVdTb7e
         iFOPxLKUvLOm4AlwjK6Wi30r8dFsvWgv19JMuyh3j1pNDNnFLUSh4UcEedXz37LdJ9AQ
         FW/7JCfZWajYZ01w1WBt+DFtRpa6p4vHAGCZRTRUd+l3O4GTSVVkOPHYj9vTNDskXej4
         GRcw==
X-Forwarded-Encrypted: i=1; AFNElJ8wkjSZO8/8Rln/w+uZEjQySVRsO41iTGQlvzylojWWKd1GVzRWFTDu8tNQ5ySj4npQAhsVWi+ZcS7F6EcB1wbK@lists.infradead.org
X-Gm-Message-State: AOJu0YwvOIawmzKGQ181xQPqtgCu9lRC+16FojwvoXp36z+9gHt0jzKD
	DI7VQ668pRgZQYjDIhj2NX4Qwg1YD3wshszPaZwulVRiSwueavgrzSpDAIdtVZLz+1QfAcDKtmI
	Bfda+WP2eudMsEuDxdm7U43A1UN71Ag==
X-Received: from wrnj12.prod.google.com ([2002:adf:ea4c:0:b0:43c:f5f6:7a44])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4a4:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48e8fe7cdfbmr41959835e9.20.1778589884289;
 Tue, 12 May 2026 05:44:44 -0700 (PDT)
Date: Tue, 12 May 2026 12:44:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512124442.1899107-1-sebastianene@google.com>
Subject: [PATCH v3 0/2] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	sudeep.holla@kernel.org, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054446_828729_C10478AB 
X-CRM114-Status: GOOD (  13.66  )
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

Hi all,

This series fixes the Endpoint Memory Access Descriptor (EMAD) offset calculations
and adds the necessary bounds checks for both the core FF-A driver and the pKVM
hypervisor.

Prior to FF-A version 1.1, the memory region header didn't specify an explicit offset
for the EMADs, leading to the assumption that they immediately follow the header.
However, from v1.1 onwards, the specification dictates using the `ep_mem_offset` field
to determine the start of the memory access array.

The patches in this series address this by:
1. Updating the core `arm_ffa` firmware driver to correctly calculate the descriptor
   offset using `ep_mem_offset` rather than defaulting to `sizeof(struct ffa_mem_region)`.
   It also introduces bounds checking against `max_fragsize`.
2. Enhancing the pKVM hypervisor validation logic to no longer strictly enforce that
   the descriptor strictly follows the header, aligning it with the driver behavior
   and the FF-A specification, while also ensuring the offset falls within the mailbox
   buffer bounds.

Changelog
#########

v2 -> this:
- Fixed typo in nvhe/ffa.c (missing sizeof)

v1 -> v2:
- For pKVM, removed the strict placement enforcement for `ep_mem_offset` as it is not
  compliant with the spec, and avoids making assumptions about the driver's memory
  layout.

Link to:
########

v2: https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

Sebastian Ene (2):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 24 ++++++++++++++++++------
 drivers/firmware/arm_ffa/driver.c | 14 ++++++++++----
 include/linux/arm_ffa.h           |  2 +-
 3 files changed, 29 insertions(+), 11 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


