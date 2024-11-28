Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0CCD6D250
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 01:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVBMujG2OTqdwJQgPPGju5b8tNjOmRcixGV2iZuWWwY=; b=KyQ5NlnqQNyyRbf7Z2j3gm+TjU
	N1yHSnM2quEVe6vZUpdf2By8hDMKAb8HuWbg4AsFx7NdnEean9mLhNhiwq2KzqXJTB3SrbUXrrN6f
	GVqBi2vd6WiFDGVXwy+vLJAknauAXZg6kIF5397MrphcXK93kiPG4J50eZn2KRkCVSs208g9swK/z
	RzWZp7UfvIG+UkbyutHF630yc3ic/ElYhsWD5B8yHWVUPu4VzrQAirhBHrJhVbmLf55bjemOHeqHQ
	THzR1i06Za3MuTNdlY8GqqbjEPk9hzKNYjjRKPUHBiZ05UhTkzP4n+7qVXJGnpLqrWxl9HoiMeBYv
	d0Xl2S9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSsr-0000000ENPE-0jjx;
	Thu, 28 Nov 2024 00:59:53 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp2-0000000ELnd-0aow
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:55:57 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e5efb04da7so344116a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755355; x=1733360155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qVBMujG2OTqdwJQgPPGju5b8tNjOmRcixGV2iZuWWwY=;
        b=SvaWVv9POk6s2OwUUopI9GDj6dgUtmaMHli2Khw8AAIQ4P43WXfbfoktxqN8NX0ReR
         RnUITsR/sxOFFvRDDb5u5ib3VNByhxmMYOhIhxYqSQOvU4WLJh0kETL8DpKlMeEIEyJr
         vzQ9QmS/HefEApyyvwCykQKS+XbZn66pH+3AOoGmO1XagmsTAcwPGGlviDCf4hW/U3Lx
         CAT8sirV76WbYbeheF/Lnc0FCpgHPdIZ5yfBg4ZNk67N6Ncp5f3lrXjowLEsoNJ54et7
         iiIzXXRV5MsEQEf1ZzOWYDR8SaALZ/HfAt8ariHoKImkqzj2AIZ95Q/HBHUFUAIc6lqq
         gK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755355; x=1733360155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVBMujG2OTqdwJQgPPGju5b8tNjOmRcixGV2iZuWWwY=;
        b=tyU8Rbroe6Aaa5GNSBznXb+kE1DXST/oTUXMuqSnBB/mEthx8g/ww9tlAxv5kTQxq9
         vchW+Xtjtw3lsQ8pr13GhXSP9tB11p00QZN0m5MTm6JqOl2v/WeXnjzAp0P30V5+vAij
         DEl3NiBmgROUgFaeZv/kHu8tnruD29Sz8LjNEQSuRP8B15X1uPnMWUhYvcMvJaXeMlsp
         83Y3EDAKoTnwgFk6j5zGG8owAkXHnStWBTFbyvm3+ZFO2VPPqKdzmY8+SLsDlxsmdKWk
         leuQRC0I/D34+yS8aV2DxuYUdobYhU1jM0NXhEPUdHd4KLQ1qBHEX+PwvZkAa9p9sxcf
         +svw==
X-Gm-Message-State: AOJu0YzDxYxfGeB6GDSCHPheEuhLFb/mTeBDYy+/QSIQbXutT9JOC0V+
	szMw8O+yev9OGBUM0dymKsHg5G4N3UCmUIj63dxuyYcNy4DNGpHs0ClqtCcNTw6KRIuPCISH+ES
	5IA==
X-Google-Smtp-Source: AGHT+IH+xlYFxzyyjYgkHwbv9v8SXpOlp7wHMGVgiCiV61K5VskA6YHcas7fec5b54n5jx+SjDlTSzyBffA=
X-Received: from pjbmf12.prod.google.com ([2002:a17:90b:184c:b0:2d8:8d32:2ea3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388b:b0:2ea:7329:4d
 with SMTP id 98e67ed59e1d1-2ee097ca9damr5929096a91.34.1732755355263; Wed, 27
 Nov 2024 16:55:55 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:34 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-4-seanjc@google.com>
Subject: [PATCH v4 03/16] KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165556_187132_8B61A005 
X-CRM114-Status: UNSURE (   9.68  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Assert that the register being read/written by vcpu_{g,s}et_reg() is no
larger than a uint64_t, i.e. that a selftest isn't unintentionally
truncating the value being read/written.

Ideally, the assert would be done at compile-time, but that would limit
the checks to hardcoded accesses and/or require fancier compile-time
assertion infrastructure to filter out dynamic usage.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 287a3ec06df4..4c4e5a847f67 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -707,6 +707,8 @@ static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
 	uint64_t val;
 	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
 
+	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
+
 	vcpu_ioctl(vcpu, KVM_GET_ONE_REG, &reg);
 	return val;
 }
@@ -714,6 +716,8 @@ static inline void vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t id, uint64_t val
 {
 	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
 
+	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
+
 	vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
 }
 
-- 
2.47.0.338.g60cca15819-goog


