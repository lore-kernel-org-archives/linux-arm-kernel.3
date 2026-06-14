Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCE2CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFNzURuXDPJOtNYOPDVBgp1lrFOmwFX8HD0T0LBBDZw=; b=mEGMtwUsGWiRg9Vwvyvi5maa+O
	B8ib3XwKJZPfOE9MlRpAJZSC6A9FGKChJ9tYcuYXlthFrYg8xvJOg+w8oM84wdcL/vRYYqRg5AcEY
	N2BA+DVBD+DX6rdxFmso62cAPbkq38Fawnc4g33u7zlv0bIyXdq/Ychh7X3FMM29ywCY5GBUcEXR7
	D68UU9bXOl6A7qTRaSEaiwx8AMT20063tca7hzvbcDJTLXZnt+I0dJNrYqD9OtpyVCqpWrmG+975Q
	MpnZjDGooQfMN8n0Gx+RyYDWxR8QXORLx72Faf2CG0igB1eZWEBR6kOnsdvzDY5SLO6KSZ8dUWOYs
	x2/ECtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmV-0000000DAoe-3XBL;
	Sun, 14 Jun 2026 16:33:55 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmM-0000000DAj8-3GiT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:47 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45eecec7667so1711838f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454824; x=1782059624; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFNzURuXDPJOtNYOPDVBgp1lrFOmwFX8HD0T0LBBDZw=;
        b=nXlPjVMOjhQ9sbJtvcgowc4SGy/mpzcOZ16qKml4oMqhNXPEH8yMmjTRSImpkfm8uT
         Vf74GUEXlPb0Bn6ZLM9J+Q0mnQN83rwPCj1Sj4rD2yT9gOaqnFDHSW31TiAc9C/64Y8n
         u9vBDtI/nN4iZ5Jkw912FjtXl9lZqNWxVNSKXuMkQHVb0E5MlX9luCjqnfQZZP4eJTOv
         NIaF44HrazKEI3zFfQZ8m7+G8dq1Z9RyPtMsxf/nKvLSa5ox4ODAiEU8Njk0LIrqJII+
         GdoTd/UQp79QcDSwB+Hl86zUfbM+EWS6aXyxc/mUcfoBVt663yhnGG5rsoEno2+Cqajt
         07Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454824; x=1782059624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFNzURuXDPJOtNYOPDVBgp1lrFOmwFX8HD0T0LBBDZw=;
        b=h/oXPmdGzY4bciKgUekHQzvUmNAIDkbLn6mmy9hmHXyr+79pEwBz89BTIkP/oieGEs
         Y8swv6FVr5f9VSPtwXYiv1S0zM0pEKUPKTYwXhoollXQMuP+pSow4spsikaHDQrEIlH8
         zqkgJ4ZIQXOQQ4+Vz7xIFhmBk2AFBpTBGhZlujUojjGTigI2jBXniqedwRIzYbcLCG2X
         Ow9J0H0SxbgT4utnxggL9ruKSsK1X5Dj6wo9ldf8nAmNzVSKww5yNf6Ft58liPkp3kh6
         5Z8DKKaFldhodmZYD+CajhlNvwFHIpWvx0ZPnufor7LCHOyseZhXIWowb7PpTVWG2fD3
         VgoA==
X-Forwarded-Encrypted: i=1; AFNElJ+kI4i99zPIODhqAdjgYCl2lFdSBgRbBYJDc1nnBL6CnSx6DQ7Ufcd9XLIVylBhwPuLTAQ5B5GqF9+xDt6qxJyK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjzu3TxZNcAH5FCeXWmirciC9ihjgj7ZwR/dmypusQp7WD7CjT
	y1Ky9RGhrU3dCsVlqT18rBQQ6qOK2bAstEQLhxDeILyB3eyB1yy8npLeRrK8Z7oYyGdPi6h+/gA
	VEA==
X-Received: from wmqi7.prod.google.com ([2002:a05:600c:3547:b0:490:5e18:ff1c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a215:b0:490:e89a:b221
 with SMTP id 5b1f17b1804b1-490ec5071dfmr86889055e9.35.1781454824318; Sun, 14
 Jun 2026 09:33:44 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:35 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-7-tabba@google.com>
Subject: [PATCH 6/7] KVM: arm64: Set IL for nested SError injection
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_093346_845381_DB48E882 
X-CRM114-Status: UNSURE (   9.83  )
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

kvm_inject_nested_serror() constructs an SError syndrome without IL.
The architecture mandates IL=1 for SError unconditionally.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 4b39363cf891..4262d4c17a87 100644
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
2.54.0.1136.gdb2ca164c4-goog


