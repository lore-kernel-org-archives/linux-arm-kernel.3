Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E24D340A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVvuynXxGH2+n8uumS3XV9pMAppoTDcZ56n8GmERENw=; b=zTm4IHVc+W84f8U+wRDpKyJGnA
	8sILTmXyTxRHPEbHMK7RaptSeaneCbVr9dOQ4DWVkyS8fLzv8ZclzgeNcnKa6BbYSCzwZlJ4PwX7w
	+rrW2rrYrvBIfq2KnPMLAG/buxqkw94XS/RCUfQL6tfGW2DleVujUAQvkbwntf4Vr7wK2+iZkrt/e
	0mKUyHjEhQ8IZiT9h34yXYYY5/PiAmIOK7NHeo2OTlzxXlqkunYnDQqnG0N79BhAJKLmBKMABv+N1
	woSgUz0w5X5zpn2ImYRlTbUXHM+8vSQXDTX9msGjREOJtFy3CMtYp+sIVXUbhYZNspa/+llp7wajA
	EYrBVNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmO-0000000Edu3-47ko;
	Tue, 27 Jan 2026 16:19:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmL-0000000EdsV-49YP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B27DF4005F;
	Tue, 27 Jan 2026 16:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45368C2BC86;
	Tue, 27 Jan 2026 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530737;
	bh=qN+iDa2h31PUuD+8uQTYfX0FDbhK4ykWb7nOlFRU9Xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NRUsf5K/3ntfr16607kAZDWuezozyWeqS50NUEXP+HMu2dd18auTEbkvgB06awj4F
	 OVehvYaJHDVwmAoqd5T5rV0PHGJSTUDDeviiHdpRzvy97rTO3DsfBjhczGSIQCpwi7
	 WReyFb4JHVi+HuL4ajHgP3hRhjkVRzetiM1qxOVHbbUYq4tF/VWU3IFRSAvXaN1kQz
	 tty7Lb4BacgPe9K386sM2I6frbj/XESsNuKsWZtUnn7l2byjUnRRAI7242N12ZtWUV
	 Fe48kEsW3a+LyweecvQiVC3/airwCzzx1o3pRAbKc6fBoBIwmrDeux2LKfpd4a6XwN
	 IwFstv6qkpz6w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Jan 2026 16:16:14 +0000
Subject: [PATCH 1/2] kselftest/arm64: Add a no-SVE loop after SVE in
 fp-pidbench
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-1-3c78eda0d58b@kernel.org>
References: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
In-Reply-To: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qN+iDa2h31PUuD+8uQTYfX0FDbhK4ykWb7nOlFRU9Xo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpeOVsTbVbOUPbuFIFFlOSYlUatPEfRDZbgvj6d
 r6Y2H9o/DmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaXjlbAAKCRAk1otyXVSH
 0EU5B/9djdmSiQVbQU/ugUA2QMRPFCvUCafBTNJc138dNWdGb7aJeCfzaZ6jLjYpbsMRFAXQ9zl
 0ws36EDRTR6Mzt4ca1f0uDdlM0NFTW8bs1+gtT2VCfDoxxm7VlSS/G2bvh42K6dAZhtSa6qvGVu
 mwwZawEWWr99t62QZGUU8mLdWHp+0AsjHspJkkGPdRSWaxr6SMdrDpM856FTnsx6POzj6WVoH1s
 YLVpXG+UboHxMigapUeOdVziG8fKocW5z3Suf5yC4xHgLyyBR8RW2z22VG0A0tuJ5SM0uU/RkjK
 uCrxJZ8vc//biqYqDVYbc0ANjy0Bdlz5FtpvGLaSFOlZy8Se
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_081858_057263_AA0EE43B 
X-CRM114-Status: UNSURE (   9.78  )
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

Some applications use SVE intermittently, one common case being where SVE
is used during statup (eg, by ld.so) but then rarely if ever during the
main application runtime. Add a repeat of the no SVE loop after we've done
the SVE loops to fp-pidbench to capture results for that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-pidbench.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
index 73830f6bc99b..aeeadc7873dc 100644
--- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
+++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
@@ -63,6 +63,10 @@ function _start
 	puts	"SVE used per syscall: "
 	test_loop "rdvl x0, #8"
 
+	// Test non-SVE execution after SVE
+	puts	"No SVE after SVE: "
+	test_loop
+
 	//  And we're done
 out:
 	mov	x0, #0

-- 
2.47.3


