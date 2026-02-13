Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F1CEDF170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwg8k07MnblHsBD301KLHziw381Y4vRMO8Vvy4eyPOQ=; b=Fb4TcM7js5dBi5EN/2rT8/NlrZ
	uu5Di8YP/UgYdw92JpibY8i8SerPyvADjoWqQDRbMnk0qLQjRGvCyQD7Zi0r03toyGT2nn8jmUuK2
	CZlOL9e/78of8/ne/kNIm8q6kf8xnfVgWE/zoX1hUZEjgLbrDdZEfI/G9/4hJu+0Fhx8UkbyRIMBw
	h6ybvWgQgXuBDcX1s2d5pcMh4Gk86BkRbKUTMBxfrpmDCRvl5eKDNsB7XD8iUoQwXn5Wa42Fn2Ex1
	4JSV48GVbYxn822F7Hkx616ldpnXPwfsjXkV80wXktam/VEXeg4G7aDhho7ItrJtLcz2FWhYdQsfC
	IC4ho10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJN-00000003Xvg-0fEv;
	Fri, 13 Feb 2026 14:38:25 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJJ-00000003Xsx-13NC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 14:38:22 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-658150fd8f0so976110a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770993499; x=1771598299; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwg8k07MnblHsBD301KLHziw381Y4vRMO8Vvy4eyPOQ=;
        b=hoxPXXg8h/+RpZ84bfan/H3aqU2RKPobs8ifSEpdwi0qaI02kDuqIyvdZ2QDnp/05A
         G7uFBH8n1j63zlelq2Xn5zOGvT+FkkGxGVzrwvp+UavH40BGIY9uvX66Vsq9QEyBP3uS
         d4g5UfKDEiSjZFfEktg6ftR+1qyWRzSyZakSLKUMNyFY3fiDo4Hd3C6ai96BZg12eiGN
         zX3b7R+6IX4uXOR9CVUMBItmErBdlHBeFd5TwdsxIjuTNyxszbpLKnOUhFAXV5p9BNLA
         Y1m5U/D63x62EA808QWS63tZYZ4HWhwEOOH3c7tKXTbSgjmV+iIcQzIEA9JTiYeN/0q1
         NLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993499; x=1771598299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwg8k07MnblHsBD301KLHziw381Y4vRMO8Vvy4eyPOQ=;
        b=ZouREO5eCW4v1wDzI3nM/gMSgmP9s8gHD8rpsUV36h9IW06uXnpLH0PAZtXolL/pKJ
         hIi/kBUJIglolPFl64SpxMrNPEXuB32ihjxuMMHKsA3wByC097AJpY/heYSp3cR89kiN
         3I+dqV2keZKD9DrKa188oaB0GqAGpPCQiDS4C831oIpPrqgrt1clbZil6kQt8+5Jbsg/
         ulDZSf+3Dxymnzw2YcMkALKePj1WjVk+D1uG1krfgjbbfIhA/0O19LB5qVaykLMQPVCC
         th2anK8jX+DnqyOsti/l8RExVK6kiDhC57vU7IADWYUWOF+jxbSEyYXtGMS76jFt1/5m
         qffw==
X-Forwarded-Encrypted: i=1; AJvYcCVjRJ/GACLx9VWb4fQMn7/XIrekD1rPAWoQsOCaLSOlXbemY8fuRxC7yXzGDs7J3Nu49/4fwHcOMAt9QP6h3kQr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kbrAljoaeSOcXsWTGpBAkc6MEsdTEz8Z8tGzmLJYmHT2lEOD
	MSLRS8Fsi52jGV42HwQERRVCDDziW/IyJpDYqlOgAXvhxJnbwFRSyn4Eus37E84IYRdJt80sdC3
	+Vg==
X-Received: from ejdbe22.prod.google.com ([2002:a17:906:f416:b0:b8f:7a4f:842f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:c104:b0:b8f:7014:48fb
 with SMTP id a640c23a62f3a-b8fb41ddfdamr117462566b.16.1770993498644; Fri, 13
 Feb 2026 06:38:18 -0800 (PST)
Date: Fri, 13 Feb 2026 14:38:13 +0000
In-Reply-To: <20260213143815.1732675-1-tabba@google.com>
Mime-Version: 1.0
References: <20260213143815.1732675-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213143815.1732675-3-tabba@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: Optimise away S1POE handling when not
 supported by host
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063821_294931_7593F335 
X-CRM114-Status: GOOD (  11.49  )
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

Although ID register sanitisation prevents guests from seeing the
feature, adding this check to the helper allows the compiler to entirely
eliminate S1POE-specific code paths (such as context switching POR_EL1)
when the host kernel is compiled without support (CONFIG_ARM64_POE is
disabled).

This aligns with the pattern used for other optional features like SVE
(kvm_has_sve()) and FPMR (kvm_has_fpmr()), ensuring no POE logic if the
host lacks support, regardless of the guest configuration state.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c7883..7af72ca749a6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1592,7 +1592,8 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
 
 #define kvm_has_s1poe(k)				\
-	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
+	(system_supports_poe() &&			\
+	 kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
 #define kvm_has_ras(k)					\
 	(kvm_has_feat((k), ID_AA64PFR0_EL1, RAS, IMP))
-- 
2.53.0.273.g2a3d683680-goog


