Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32819CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9HlvrniU1D96ODxhGlOnHZdC3XvdXiJYKZBpcs/wmo=; b=lP2PfZ/YWSoVqkrLx/yEcHVtlw
	pSDN6+7UB+M6hsQZQMtJluWLaHlWZP8OMiip2J0kub+LfdM0F8n2461Rk30f12IvCGMf1cVVBDfus
	QvM5aduz3kIHnbLvIg0k/yn8r2NvTvnsJmGuc5thPtnbZ0tDDcL98Ca6gAiBPT/Fh+Sf0bnThKrjB
	pEVE0o1JD7RDqo/uba+jIxybR95VUPfWgDFVPP6IUCfxDnRzexYWozX713kxMY3Ndw9Y0TuZF19NG
	XibCm+tgdKpvq0d2j2nAGd5eHei4ySjKijhp4nPsN7gjuCfxReC63fYjNnZUgkrV4u9ZxEF3+Cvha
	xVYdUH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBgB-00000001FC5-0Bit;
	Thu, 18 Jun 2026 12:17:07 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfy-00000001F0f-29tM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:55 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bf523d7b023so81496966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785012; x=1782389812; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C9HlvrniU1D96ODxhGlOnHZdC3XvdXiJYKZBpcs/wmo=;
        b=n44JlLNuA49kk4dwTB4Fl1jO5SXt3WGbNpwCdZgEOvZMV/oihzBlewptLfFxQyO0cW
         Uqtc5Sa+WaMWjsGBw4tdNI/I5Tf60w0QLe3+4L5zDc8YZhs8UFOp71zZIRuAlVEctzvm
         PVSP2J/9Fzjyq988gq9aS0t8YeHWyAN/Y/bUUH1RlyIUqrZDLSc19ksE/zA3Oscez389
         2Ya5wPT3hesZuU1aUPCEQkWDon4qxHEoBa2KSZrZawpmJKbJ7AH0OQKkMtMbghwrpa5a
         3qc5JJgVudG01TIs4648SqJoU/dGjal93vOG/Eb1OtNxKEtrGiNQrOJj4f8as41BXMAm
         JIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785012; x=1782389812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9HlvrniU1D96ODxhGlOnHZdC3XvdXiJYKZBpcs/wmo=;
        b=pMW6pjjWnFVG/T/2mxWakXLGHsbv6Ne075TNiVO4ExKRL5/uUtNobJVgaMuz2hfia7
         kkhjcvWRvKmRgLzCtEYQDwCyh6pAVsNmh1eDz4AqvrQQq5ZpmdUY7anIHUgEjQEQYkhA
         wugsznvwEPdPl8f5MxdU49VCT+0XV2b2tdXf1jWjtAwdbccy32uC8d1fxxSIimAPGJEj
         QnodnAlP05RJSdhBd6jtMAnV/SD4HBJhs2HA1wgrhCx/kJ/KjayHQhptnjVTkx1PYnD/
         jyRoWD4N59qNKphaQ9A0VisSxKgNLsaJ1RJVjjmgQ30NjmewJCw9m0Ae9DTTdyRLiqVN
         12jQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JD0V1mh8al5Z2opRwTe/TkU6UFPkTsFxjY3Nr/H2oiK71yCPQwq26fKh3cE4Nxq+4931PAUzyzpdaI7YUiVWT@lists.infradead.org
X-Gm-Message-State: AOJu0YwyQ8Q8NTVNmRljzl5TdB05tmkdOo3EvDTSffXXO16YyTVAtVux
	XypCsLESYrlfPcyrdeCb7bjEuugwHjpNR6ixJVF66HW7L8b6DDrD/IFOSPMRb2E4WKkRFtr/Syi
	L9Q==
X-Received: from ejnz1.prod.google.com ([2002:a17:906:65c1:b0:beb:941b:68f1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:70e:b0:bea:a8c2:3d02
 with SMTP id a640c23a62f3a-c074ac8784cmr188483966b.4.1781785011825; Thu, 18
 Jun 2026 05:16:51 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:42 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-7-tabba@google.com>
Subject: [PATCH v2 6/7] KVM: arm64: Set IL for nested SError injection
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051654_589818_22A7D86E 
X-CRM114-Status: GOOD (  10.59  )
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

kvm_inject_nested_serror() constructs an SError syndrome without IL.
The architecture mandates IL=1 for SError unconditionally.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index b74369e9ad7f..6f12496cae81 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2938,6 +2938,6 @@ int kvm_inject_nested_serror(struct kvm_vcpu *vcpu, u64 esr)
 	 * vSError injection. Manually populate EC for an emulated SError
 	 * exception.
 	 */
-	esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
+	esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 	return kvm_inject_nested(vcpu, esr, except_type_serror);
 }
-- 
2.54.0.1189.g8c84645362-goog


