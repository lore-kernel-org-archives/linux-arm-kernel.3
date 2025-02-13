Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWZgB5w3eSM0BtzO18X6A2qHryHBneRbetiSxyPOf/w=; b=V5yq5MOR08hn7ZZClgfe6SbYiS
	sm7Gjf8Wu9In30WMeprzHJeQDIb+5RbyBcwNCn77GkDiJmfnhs1lrMAmpswVj/bQxm5moCWJvyB5h
	jfse1/ansenQQucXm2Y8ir3gSl82FwCKM8TUI8AHoIq9TuWPE4DsAmk0QniGhOna8pLIYZESET8vG
	7XP0P4u82aLUFQbs5P+etzyNwN65Af/z4b5FP9SIK5MuqL04TmOaguf3XvnuMSwEYMKONG7It1CPa
	N3L+IybnsRdW3ICKOdmGGGQWQyEOFTQakU6ruT3p5I9yE0dW8hO6Ozhpa2XUkbNv0mqaIkjUx/ZRI
	BRrqyB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieem-0000000CMAG-14Sr;
	Thu, 13 Feb 2025 19:13:52 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidaW-0000000C8jZ-1Qam
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:05:25 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3d143a42980so6621175ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739469923; x=1740074723; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UWZgB5w3eSM0BtzO18X6A2qHryHBneRbetiSxyPOf/w=;
        b=RyREuW8gxsdYoYsSFVvSzD/b82SogP7tMBBWSpe6lwsWuaoh1iyUcLfspWp3tGSC4l
         wxXaLQrphvggAeeztSSrjBYK0+E2AJJcbLFKTidAMaPQRcq90xpnFhR7W/sFqvN1eKDN
         Qp/2gkkJRkKoMjtG27vMir1HEGVxaGVLazQPlOc4n78zI7XSQG1v/gU5WMc78gaQu7BA
         EX7eeJ7gE5SLEwoiwhcYC8Q1SKsw+TTtXxc+ZmO0vwR/IQDCCokOtr8h5eYhFk0PS0g4
         +YAtenCVNSNymawAha+BDjksejVJJ0wR8KazOxlBzmjxuVIAS5GFAlXnhc9MI3deDmNs
         xN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469923; x=1740074723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWZgB5w3eSM0BtzO18X6A2qHryHBneRbetiSxyPOf/w=;
        b=Qv3TYIilgDP7O049mQESLWOdYoamj/DjVj+3k2xFC0vgvfB+7/YgZWonAX5NXz8lKL
         d05ASFrG2wB0ZdAy2+JkKgewIgKhzWP/UnLnw8LZdSJG73g87QwQ3KrhCpCAd9wJqqAz
         PRXGUZ2uSqud4wTRtzuW3OX7aWMH7IEGGXllJbxBuRoz3a7UqYwvzB/Pwe+KJiCAoUdB
         kJuhv1xPlxKb5sm3aMy3pOYl7VgRkw5gNRl6AFnBdoa7MW5+PG+9gj7eS4W1e5twfdWG
         H6DzOdxPMgCSa58XMivsjMNwZPJ9wzYGVx8p1HItHYFdmknSRy5fU7O2CIQVRDG0CEUJ
         +3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/UkM3yCV7a0TH3fVJ6LE/Fzm+/l6lU0etwGLgpvPpcoDuVCbk2lEhDoQsm336vGYA64J6o/KblYWfFBTAcTwi@lists.infradead.org
X-Gm-Message-State: AOJu0YxxOJ+uTTvcUZv6+m7kvMVaRdQq8ZVG/0HJwnZCvZcC3NZLp3FA
	dPhUe+INuTkd6IsLryxg8uLmFDoBbuZBjCQyWAU800pKyg28JHsilcslyapGLJrvZzkWTLkEe9j
	PQ5smX/JeMn2Yp55cZPeXtA==
X-Google-Smtp-Source: AGHT+IGInJOaRNM/UmxApk8AjirtA1Ey5wL5ojkxOBaGdRUfXbOtlN+CuOjjpt+ni2zL9WpitRvyEXXQjjs//eksWw==
X-Received: from ilbec25.prod.google.com ([2002:a05:6e02:4719:b0:3d1:8322:8ecb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:144f:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d18c31c4e8mr35827555ab.19.1739469923254;
 Thu, 13 Feb 2025 10:05:23 -0800 (PST)
Date: Thu, 13 Feb 2025 18:03:17 +0000
In-Reply-To: <20250213180317.3205285-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250213180317.3205285-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213180317.3205285-9-coltonlewis@google.com>
Subject: [RFC PATCH v3 8/8] KVM: arm64: selftests: Reword selftests error
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100524_376681_079466B7 
X-CRM114-Status: GOOD (  12.23  )
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

It's possible the host has that many counters, but HPMN restricts us
from using them.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32e..b5bc18b7528d 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -609,7 +609,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  */
 static void run_error_test(uint64_t pmcr_n)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
 	destroy_vpmu_vm();
-- 
2.48.1.601.g30ceb7b040-goog


