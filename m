Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B340C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDPWQKpYK210YH7pdRtFQhVqun7oclqubAHor3TmIiA=; b=H5lud00ZCGYqPfjn94z/wEV2Zi
	b4pjO0rc3R81MVR61zm5FlhKeQlphJOHJtPucQShBVuawznblp71vayg4+TWhSh9h5IJcZw5kEyec
	BL937pys0QFIDrcrpadfHV3h0A2QO3H8EYT1p08TegxxpXSMLhAefcruNyYgG9pchnqUV/6o2oNSt
	oP1iD0ErrUL6C5Sd19TA9+WsgXxFnRyJm6nD2hlknUaJ7J72IdKSMMsuNASWP6juZTSxogGjGIgAu
	ihIbYjrLwsdpjIgSnLlHuOmf+MAW3BlP3Z0M6hrvDLBTh1NIUMrRMWGFUg3vTr4WCOtA1sAqpq1Id
	ATBxJZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k5f-0000000FEZW-0nRc;
	Thu, 10 Sep 2026 19:05:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k5c-0000000FEYp-3faD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:05:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso2228045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067139; x=1789671939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDPWQKpYK210YH7pdRtFQhVqun7oclqubAHor3TmIiA=;
        b=NJOLP8KCopYnyhoVgbfSdV+kdav+ZBJ1Q/vHTLeLlVS/0EjXYEJqcCVK5RFJzeLWU2
         HzMdoQz9Ky95NhmIDBTZpMsVAUuzpywTvxbt/UlpxlLPiZtY7izJYLsk4rjGvR/TH3kW
         iJmAsVnKDkVaUu+URawPzEVXJRLpgzjh5NCNg7DAKml8j5MjkXg+2wXgRCIuI7nl1Cju
         wFitugvPXfMFjLeS4Bjy2sO70LMqVU+Q3yb1nKrzyqmPkJHf3T+nD4TL6dlWoQKNOOaO
         Jv7K3rpVaHKD3B/uV8enhCvu4Dj3fGrHq0oPyfi1hC0s8GnFn28QH7jMGQvVMuekNJqr
         QLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067139; x=1789671939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDPWQKpYK210YH7pdRtFQhVqun7oclqubAHor3TmIiA=;
        b=SETXJv1RyerjLRsUfrhyP3POlJGak3V9H5Ksh8HkweRtn6nZCeRvYis0/MaYcUEES8
         rCPH+koUmok2C+HkCGZEIfQev9+4jYICen7VJTwaBM6gGKwi6Jyuy9nynIQFrjHr4bQe
         B0KV2k569Y13Aq8O5pFag1eGLMSCyHIby4VJIoTrLjgLCPQATASr+f7OCQmN1wOWZCsv
         Wh2eYznpPUtitLDvm7yaDCQzy/Bfs15jGEPLUB7eft8frUjCsa+YmF0iKXIbZJjOIjAC
         mS8uc2ASDQ+Xm2yt/NRBi1fMVOFo2c9sJzhaOcRmRpeyjxzU4c25gQm+gGL65glk+ffx
         gSqg==
X-Forwarded-Encrypted: i=1; AKwUvBymhx7N2/F1R3iefyFrkyFuowTFtWXOLdeAft0wet9ltTvl8ySURYzxBWdeD5v3SyYRMaC9ncy7lH1+Zu1l1cNg@lists.infradead.org
X-Gm-Message-State: AFuF++mhuDwQTHM8t13z+GtVw8097RM3mXpR52IYtJ9++L/UmOoJXcBf
	Y6xsaQcxIL8qB5F285JEq9EhoXn7ZUC2wzcd5kGRIIAIpCIwhuu/t+hd
X-Gm-Gg: AYBFou0rVp5SZlmAofTm5rXIBzwGkI3pcHyfJaqkAoKsGX1ViKwYLPqDKSd7jDNGeGT
	ctO/JEbBoELL0VO2jn5nXiU1CA8hOKnTXd13r3eA969q48MdCrzvWcfxWpFGmrlgWKdeDa4J2m+
	7zeAcDuebu/h+rKV73F//oihSCeBKhByz6xPEm+4F4X1axF4wBGJOfipk0ePyo4MKJLBbI+sk7K
	Zf+tfcvIvF6xtt1LCnzKAphJ87m25wc4TkvvlEpwq5FJcgRLItqSjVK1ZXG7xz/bkXPgVtyrVe/
	D5vQ0CiID23naU7zvUk5Lmtb3vexuXg24IalC8kX4jqa+83Qz5xV7AF5ZUzWYfCpNo94Jb3zz3R
	SNtnEg/OPcsuKc2aLxnOgwnM1+ys0rW3H3RI16KMSw2e2AERP6BpCCPslG+lMsyBXxMP/7pUj7D
	eN6A9wb0vZ5EHN/PgACUayEBrna7SHVA6LUWkoybNlrlg7QpDeyipIS+kuWNobuRpzpooFkHqzU
	xUKZZWaYKt58WGnPrammeZ3w5D/APPjAtmjwd6/TH4PCjoPaNKlcez/m5AsontdgBF6lk155ErI
	2bLed6y3sraGhrFgKdnw0zr/InVYldXP3j44ZO+ieq9BSiEajM6MqrMNjPR780tHSCaKDrlQsK1
	Vsw+WFmk=
X-Received: by 2002:a05:600c:1f8d:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49e6198933cmr5181655e9.9.1789067138621;
        Thu, 10 Sep 2026 12:05:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-601c-58ef-b3f5-74f5.310.pool.telefonica.de. [2a02:3100:b3d9:b901:601c:58ef:b3f5:74f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adb075sm14811665e9.13.2026.09.10.12.05.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 12:05:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Date: Thu, 10 Sep 2026 21:05:28 +0200
Message-Id: <20260910190528.4483-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
References: <20260909063156.89636-1-kmehltretter@gmail.com> <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_120540_933003_364246B9 
X-CRM114-Status: GOOD (  12.69  )
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

kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
describes phys_shfit. This leaves the real parameter undescribed and
adds an excess parameter description to the generated documentation.

Correct the spelling and describe phys_shift as the IPA size in bits.
The value written to VTCR_EL2.T0SZ is 64 - phys_shift, rather than
phys_shift itself.

Fixes: bcb25a2b86b4 ("KVM: arm64: Refactor kvm_arm_setup_stage2()")
Suggested-by: Fuad Tabba <fuad.tabba@linux.dev>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Describe phys_shift as the IPA size in bits (Fuad).

 arch/arm64/include/asm/kvm_pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..20d12da3d28e 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -532,7 +532,7 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_get_vtcr() - Helper to construct VTCR_EL2
  * @mmfr0:	Sanitized value of SYS_ID_AA64MMFR0_EL1 register.
  * @mmfr1:	Sanitized value of SYS_ID_AA64MMFR1_EL1 register.
- * @phys_shfit:	Value to set in VTCR_EL2.T0SZ.
+ * @phys_shift:	IPA size, in bits.
  *
  * The VTCR value is common across all the physical CPUs on the system.
  * We use system wide sanitised values to fill in different fields,

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0

