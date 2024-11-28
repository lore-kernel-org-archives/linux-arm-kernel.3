Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A6DD69107
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSUc+JlbUkcJTV3hddKcfnf/DVsTc1Y11IkJDKUo+M4=; b=5D9uM5xja+8vqNWoTKIetzpuaH
	tHV29wSJFyHHKujp7WcgOf/NVYqepuYo1z74XpLSIGkSghSzvSqi+lL1sXsl/Xb29L6xQSXS6vA59
	7p6p8GAIoaGW8tIo8lHO6TJUIzxO5wf3xk8q8jlay6DABp3GAu9j/KMjuQ3ewYEIqJoWOqOBRxHBu
	hisRn6C66eWnGpy7CtzRF5IhL4liUe/h4YnPd9zKzopl8GulkO0OLLK1Y9DZqnyQ1p7zHRWX+UrXx
	ItJ4/wucuP69//EB64EQMJ6qrhT9sReW0B6FtbBsNCtVtrVVoWs/mT4rqxvVQJuBRAr7yDV3Pb4UY
	qO5OhVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdz5-0000000FXTc-3HCQ;
	Thu, 28 Nov 2024 12:51:03 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdkL-0000000FVRS-1Twq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:50 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a6483514so5927345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797348; x=1733402148; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSUc+JlbUkcJTV3hddKcfnf/DVsTc1Y11IkJDKUo+M4=;
        b=yXYBS8ZJplIkwcxg4IgI4qz7HixqmtOQ4uXemtbZ8HNyA6ySG8cgJiGn2GQqMBSXdW
         eWOw9hviqJC32b+no3mo261nUT0evpi/NyYzxNhYU6CuVf8DXScFy1jjaRF8j4Qk1srs
         ZFfniSNo8TWQLYwITpXjae+jQvZIbcYfAi3GMA2XlFinuDN+21LNnzT6mjXAMonVLsDE
         SpccKSzZTznYesHxKh+ssLCtLWbaH99td2rNnIKhu+Y7rsGusW7pzwkpYxP8/Kz6D0ev
         Op2LdeZ5HrwelReTlIrjqfrC0OdHb82jqE9mykEZnzUulbJrM8YxoTfxWiL4HkorTHZg
         ey5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797348; x=1733402148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSUc+JlbUkcJTV3hddKcfnf/DVsTc1Y11IkJDKUo+M4=;
        b=JWOhZN32pAjQsrmHy4TDXgw5GeJrcNUvYR/DEXd/uX7bgdqlSR8CPO/luuQg9zWC7V
         zvJnmgdX1FWzZzRqE/6OOjnQ6FeHwb+xS0DPVsPVFJtUlIOvn/ZD+dixMZsur1Fr7hbh
         J6Qx8k0VmqMCdPtmHBuYD/HQG4YfAAZ46dOI8B+dN95QNoi12lwuSjXSh0TC6bRVXgUi
         cQlROWeAy4xEKd5jSCcGWpPDUK5fzgr7tivetgVt9W0iHmjGIntxPnLWPfreso5t84mz
         NwgtH8BloE0XL5W7UZ7H0PkfYDCCfHr2K1fCiYD4eBfXUeRZouw13mRZi7LfTxI+ok7m
         kkYA==
X-Forwarded-Encrypted: i=1; AJvYcCWa+22L6uK5uOWn/hzNUxn3V3zl1cw1Two09ahqLHxJwd2pTu68j/mvRxUnnpfQp4cYMe41uAO+rbb0L0SNjzJn@lists.infradead.org
X-Gm-Message-State: AOJu0Yynefjpv7CDHsXwyryQmv8tmDMFmlj/BqiR39RyOHswctOQ1MBz
	Qi/7Rel0rx3Qfth5BnnmDpHyluT0AikzT7axtPz4D5aCvm2YFD62ywbGS0eOhyGaQFeNCySldw=
	=
X-Google-Smtp-Source: AGHT+IHPGUBbpJOX261VZ8WL15DveE3B5R1Hl7n4v9aOK6eYzyyv6fZdkCX1pbszmw51LoEme5rJDfOL2A==
X-Received: from wmlz4.prod.google.com ([2002:a05:600c:2204:b0:434:a0f9:be9e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3546:b0:434:a83c:6a39
 with SMTP id 5b1f17b1804b1-434a9db7b5bmr72740785e9.3.1732797347848; Thu, 28
 Nov 2024 04:35:47 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:15 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-16-tabba@google.com>
Subject: [PATCH v3 15/15] KVM: arm64: Renumber remaining vcpu guest
 configuration flags
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043549_387942_0E45224A 
X-CRM114-Status: GOOD (  11.41  )
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

With the vcpu's SVE and PtrAuth configuration flags removed,
there are gaps in the numbering of the cflag bits. Renumber
VCPU_INITIALIZED to bit 0 to remove the gaps.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c5c80c789ad0..2e4afec09728 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -864,10 +864,10 @@ struct kvm_vcpu_arch {
 #define vcpu_set_flag(v, ...)	__vcpu_set_flag((v), __VA_ARGS__)
 #define vcpu_clear_flag(v, ...)	__vcpu_clear_flag((v), __VA_ARGS__)
 
+/* KVM_ARM_VCPU_INIT completed */
+#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
 #define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
-/* KVM_ARM_VCPU_INIT completed */
-#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(3))
 
 /* Exception pending */
 #define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
-- 
2.47.0.338.g60cca15819-goog


