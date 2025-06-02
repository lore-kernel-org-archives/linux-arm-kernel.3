Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D27C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ob4i5lx3NjoopJMkPn2Gu2SflaQcZ8+s5uU/xFdQFYQ=; b=odXB8sgfQ+xYvwtVdxsk8izqCl
	vkesEbuY2JiwIC4dIVz0aEQKtU4CjusSp3uZccFmKC6kLI2oxb2CmTq2T/H4jgnsQqesSCHD6vdbk
	s3tuOviX+QGTCr3pIEcYTvb3s1LMVX5xn8N4KdA/6Pu/yziGUGjnXRXRxyRdwDyrnf/Tzm7C4rbxW
	E+oRr+hcnuHmsp+a0PSLn11Ybi7CZQeXHZSSyYloKo+USk5+gQPGKQIxDDj0KfVIlqICha/W5lRZl
	UyrVJmGlV4qKWuwvXesB0X5h/o3Hdvn0pyCay5Z3IW6i6EMWu7RL2WCdrgsz/Js8RtAClqrV+rbsh
	hlPj7h9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAwp-00000008X0N-3ToT;
	Mon, 02 Jun 2025 19:35:51 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqC-00000008UAr-1qif
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:01 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3dd759fd518so53099665ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892539; x=1749497339; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ob4i5lx3NjoopJMkPn2Gu2SflaQcZ8+s5uU/xFdQFYQ=;
        b=o7cRFypYjp7aZuxT+fQikr41y02pRXwzJfMOq2RD+pqk+ZIS7kHw3HoHINC8noB1V1
         hJyb/eX7PTChBb8kI73z7Kh2+NwW68joz4r61kPOSBolKVXl5Kfnod0eJ28kYPDmdkJG
         dcIS2Qla7BLoGqqsViNkg5fvG7Jz4PDKjjO8em5QZbQbdmfFkjkpiq6EmxFzUIcx2WkI
         u1udLlCXY0d4n2MbrL/J2TX3Hjqb0p20DEgRZDNO+1EbYrwZS0pUK1IenBIU36rktwtb
         4doT/ph/NYOEFA0ProDmYJKZc5CQuTv/u+Hr200Zq0w7BCP3LYXAB1p775LPRM2+TXxk
         1wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892539; x=1749497339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob4i5lx3NjoopJMkPn2Gu2SflaQcZ8+s5uU/xFdQFYQ=;
        b=MXHR8d5MixgRARLadgJoUk61IINb/0nzPQxZPmjTUJMlHDdu7/6KzqviCtinSDa3wi
         wB1Pwnyb7EYcYCvxhnaW0L32HIcwFDAG8pW1tWQjYpNTzeHmY8YCqF+J12Z+aFcjCBXC
         064mF5A+jRDYJmQWLSxsvthoDxC6tBKs3/RbV/A/jZiKT3oABh7+dIppjadcv9GnOckZ
         1vfSwXrpw8fJ28xxbXMOdTGUW2JN6IgIn0tJAyn7jCvln4BKe9a56bMnx2u229eAOc4p
         pYiTap7YYh5bcYz4oqow3GnWIF64DdeApQr6OJXOXZaCnrWRyEbwvwhpcuzziLNl5MI+
         Macw==
X-Forwarded-Encrypted: i=1; AJvYcCWSeb/B006k3vZ0sL8INQt7iItmYKyBRa7ixheUEZLrDXPUXbqAivPOYIJQOSlPqEJmJtp7CLuDcnyUvrZEeTe5@lists.infradead.org
X-Gm-Message-State: AOJu0YypfgnPOvfZiDHx0H3PK/A8K2TW0uDzHcZR/ruxsYZqmAqCXNKH
	n5hLD7cyi33fedyd8ClOPWZXnU7ectI74CFbYhCHKOR/EsCFKRfP2+Zewfz1o4nn/Txgrow0/L4
	9z/paFnwlgreE1vL9/6DO+AaJWA==
X-Google-Smtp-Source: AGHT+IG9118tOdExJjBuer/f/VBDO3HNWaiwxBHIeaEYz6xcDfDEYQh0uxIwgejlm2yfIrTUPAC6q6L4NmScHLSSog==
X-Received: from ilbbp25.prod.google.com ([2002:a05:6e02:3499:b0:3dc:756a:e520])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1aa6:b0:3dc:8e8b:42a8 with SMTP id e9e14a558f8ab-3dd99c28963mr156701455ab.16.1748892539395;
 Mon, 02 Jun 2025 12:28:59 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:47 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-3-coltonlewis@google.com>
Subject: [PATCH 02/17] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122900_476846_38BB1980 
X-CRM114-Status: GOOD (  10.67  )
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
2.49.0.1204.g71687c7c1d-goog


