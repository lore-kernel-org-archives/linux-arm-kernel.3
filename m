Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D146CC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=; b=Nd+N3hmEvvZH8F+yldBlFfaRFY
	bKg5PmCRzb6sOHZvDo4+Pyyo3l9KlGdsZ5WnvllKofwWKMEtortxJlHM4aCCHi4FS30XSxFvP8xLQ
	E/fnJcFIMT+ILDAqxPaC6PdBCCyahJgMXo9cTxwslnvvNwSi6z+OF6XKOAVQnw2RTUH6z37Kkgdb9
	oMmymRSQCf/krThr1f2x0mHEtrvZLRCtCHpsElNvlbm5itVf/J+boTFvmLcvV53XuvF4/tnl00jBR
	V6g0zJ23NmyaOHl7gWVNdm6Mb5Yln0zuq7Q6l2D3dLd9hro1Nzpot/hC6FpHgNxnqOvrgOSnKjOwq
	mfv7aVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33lc-00000004e56-04LD;
	Sun, 06 Sep 2026 03:42:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33lZ-00000004e4S-1MLB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 03:42:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d032846c95so25194035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788666119; x=1789270919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=dOccteRgc+iYu91lPoJC2IEuNGoiSh8zkdrbhjlCOCq1v2SRxDXYD2d1BBOC04LrdL
         ol+JFsz0tDaa/cQoHpGceZKBiy0UFmxJ2Y5ZvE0MicmoD+sSK7CnJQo3fTB3drOfZZ7x
         xme6nvDxGKzFKwGs+wHQy4Md0pOWVJn2H5GY9A/3QtcmYc2lNvamYH/X5geNjBgSw7l9
         0sPkc2dppIHccqu9DS/VhqgGP4KP8K1OzxjMBzmLwdRjA6gBqN1qLlJEaY1x6geCm2Z1
         DrE3TT2cgyag/QJPyf6MlEOadoEOKeCVxr506KqwedcxRV/Bq8z+nSQuLgkYXDFw+Nmt
         Rg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666119; x=1789270919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=kSvXn0qQtq0E6ZZUI3zcNOfNrCkEaDKFlGmVU9E9q2qr7wt0inwo5avwNpCFDGMNk3
         4Bm8LNFT+kEZ8f2+d2K/L4gRd9HDpWVNmYJGHzj4270AhBQyeBwW8137ZXMl715bf6Oa
         4RM9sdRZoFDmJTLPcg95hTn26h9kpuOjAKvJlQBMV7CoVhk8ocFEGnXRmN88T6ZM/jic
         O+8nq4EWUVB73oqbne6cqRI4BJN6YvwojcuNDX8dgEBWrIU76NXTAopmHK1p7W8W0KO4
         OvlOCC26khuj5p1ckg2WVxhpQFjnHSTJRzoAMQRg45fZHppHGmVB/WaYdsMpG92S807s
         9LYA==
X-Forwarded-Encrypted: i=1; AKwUvBwAwPKKlyz8TcaUv/I+lw3HI/SItDiAiJxlyXg9fYkNbq5wpQsCn8tfPPhlwp/Pw8cx8X148C80AYQa3K29pDg7@lists.infradead.org
X-Gm-Message-State: AFuF++nEcN9oWQA5V/BwA/E2C6UYbjzg1RVDhiqcGduHVO7hsQFvXkYS
	sDThvzTPv8CVeEynM5A4S5ugbd49JRYhNNyKcinKKFbj7WbXFukv5Qc/
X-Gm-Gg: AYBFou0+EGAdWSuLR5ejrxL9V89oFh9EV8Bh7CIUmHZUuHR2Yyoa4lAYGVCP4hZU3fV
	NXJkED2rNJ08oledAOUnR31V8PpKQPjjHhVJ/QCBQjNU7ghWyT2PzbzrNKt1b2AVBb4TR88WBz5
	MUQ0+auq7/88S31vlu2rZapuxwdWympBYnKlRRd+XEB9DAkbHbVkgr9zX6NuCw3SIxCFS7+csqg
	c2DW6nOcIxAfhJBNiYNLiY/z2sC4EWFyMM79UW8IGOAZIZvzgYn9p3NoiaRbif1l51IA9W0Q+z5
	1Sr+fHJL7Bk3iivXTFkz6Rxnze8jm3UQoTYr7xjGTZ+gOi4QFnwXPp9S0977Hnly/ZFIIqFxpq9
	cqJw2t3SuRc60ftxuUaM5CVwbC3VB+jk6ie4lAtK06xugBuntAprr5IcFV4GCfxSrz7MpmjLje8
	DZdpabolZtvhD0u9qMOZneRI4gm+pyOGPgvZoPjKCEZXnahwe3HDmWClnB95YzIfsmLoBQGWE57
	JUzcF5zufy4u9zZqZS+n2fO2Zajgfy9mWhAW0TUtzRC
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr22343140a91.12.1788666118495;
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm22761765a91.14.2026.09.05.20.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix VM leak in early return
Date: Sun,  6 Sep 2026 03:41:43 +0000
Message-ID: <20260906034144.14059-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_204201_365280_4FC36E47 
X-CRM114-Status: GOOD (  10.96  )
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

test_mmio_ease() returns early and skips the call to kvm_vm_free() when
ID_AA64PFR1_EL1 is not available.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: a90aac553249 ("KVM: arm64: selftests: Test SEAs are taken to SError vector when EASE=1")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). ID_AA64PFR1_EL1.DF2 is not implemented,
so test_mmio_ease() takes the skip path exercised by this fix.
---
 tools/testing/selftests/kvm/arm64/external_aborts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index d8fe17a6cc59..7836756a38a6 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -339,7 +339,7 @@ static void test_mmio_ease(void)
 	pfr1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1));
 	if (!SYS_FIELD_GET(ID_AA64PFR1_EL1, DF2, pfr1)) {
 		pr_debug("Skipping %s\n", __func__);
-		return;
+		goto done;
 	}
 
 	/*
@@ -356,6 +356,7 @@ static void test_mmio_ease(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.47.3


