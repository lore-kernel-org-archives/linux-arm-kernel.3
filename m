Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51418C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UTYhxBnwSC8yAJEvjw+cCqMcJ96NHJ7AdHx5vnA8Kag=; b=H46gf02qHEKlMFNAAD0dVsJzy5
	RZpX5HDlV+XNB8ZAwFwiukyrMf/C/rfdlZe1YsYY7v7qVXe3upzHK7zqpny4xwq40uh369ua2Ftfq
	noELKgVzS/2r3kfnoFvzVFGtZPV6jloeW/Vg8R86AYevzHKCaCXl6RNyodYD66iwcBLmJIoZ1eaJM
	ebWzJK9uriOWH1BOdt1JcWTGQevXM+1pSM8lxz6L34wFKMa+aQI4NHdolO9v9GrOUres1hNo5KiSE
	0yOkZkvY2r+wMiY+hwjYyLOUgnxSQfG8n2mOnBWsKtiVKxTbiIZ+5ZpS65swepiTHnuORVt9rRy4P
	xekGoBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SGR-0000000CpGW-07K9;
	Tue, 01 Sep 2026 17:27:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SGP-0000000CpGN-3Tiq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:27:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E9B0408C3;
	Tue,  1 Sep 2026 17:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B548B1F000E9;
	Tue,  1 Sep 2026 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283633;
	bh=UTYhxBnwSC8yAJEvjw+cCqMcJ96NHJ7AdHx5vnA8Kag=;
	h=From:Date:Subject:To:Cc;
	b=OQIvTMiVjUOTouHgNZm/4jk1gj6AWHc5oxw7C9FLVGOKURh5qWfEXeBbJXtfo+XaU
	 3M140dneL9GwXkoTfQcr2klZMtlwdfsyDoLgZyOLRT+idC3U+XvjNlOj+BGljcpn+1
	 haX7CJ3T+02vxcobqGJuF9TZVKPqlDaYwpH5Itcp8NbwZenTVpCJfJZmZQLS8AuRqe
	 rqSMBHK2VPQ5CTxVssecqZBO+itmUzCwqzkkjaOCEv+bOWsP/Pl2Tp+9IhgJeTunH7
	 XNZsc9LFFwnvxeFPwq96DVCsSW8x4aEhzd/A4xvC6lG9RxCCFVfMD1i/9Kqf+SnN0K
	 oFWB5ucle2NAw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:27:06 +0100
Subject: [PATCH] kselftest/arm64: Extend gcs-locking to cover cases where
 enable is unlocked
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-test-gcs-locking-no-enable-v1-1-8335dacb1587@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOkKl2oC/yXNQQrCMBBA0auUWTuQRgnVq4iLdDKNozWRTCpC6
 d2Nunyb/1dQLsIKp26Fwi9Ryamh33VAV58io4RmsMY6M1iHvjzcAStrxUiKc6a7pIgpIyc/zox
 kjz0FCpMZ9tAyz8KTvH+L8+VvXcYbU/12Yds+KogZUYQAAAA=
X-Change-ID: 20260826-arm64-test-gcs-locking-no-enable-c291cdcdf083
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Bill Roberts <bill.roberts@foss.arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GitzmlQ5l2hvhW8wvFRTMCxX5/K59sspgMLl2BRFAKs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwrtKh42AbGQdwtSNDUXnKY5gRabpMQmdzjHD
 UEke+z5R3OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcK7QAKCRAk1otyXVSH
 0Du0B/0d+jiM4CD5r2DSpJPQ0ZEneNMYRJD+tpkMb2BAe1cTlB6P0/4zzqlVrlbIPRhs8JI5GyN
 RnDgJ1optVUKvI4x4Rzdtf83OzHBh76lx9VHKkvVY9dv+LE70SNihTryO8Ru3tv3rVZVZeRQOLv
 xjnA3KdZgmcuMIXXgf2/PJv41YYvdig1e9T2wGqGDSqY+BeCU+4/i++ba2bsZdFxKCSqOiugUAe
 7H0Bkv9UPP3j3hE9b3tQS65HDyzQMGlhSicEfeSjj/54c+elh8lfa2iFbevg+SeZ38oOgs0rqRA
 crCUKVmx/KXiosqF3/NBLh9/RG3GzZ+QQvDV59new5CB6zqK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The gcs-locking test case currently only covers locking combinations of
the various flags that can be set for GCS (enable, write and push) where
enable is included in the locked bits. Since it is valid to only lock a
combination of write and push while leaving enable user controllable we
should also cover those cases, add coverage for them. The new cases pass
as expected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 1e6abb136ffd..4dd7ab4191f1 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -77,6 +77,21 @@ FIXTURE_VARIANT_ADD(valid_modes, enable_write_push)
 		PR_SHADOW_STACK_PUSH,
 };
 
+FIXTURE_VARIANT_ADD(valid_modes, write)
+{
+	.mode = PR_SHADOW_STACK_WRITE,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, push)
+{
+	.mode = PR_SHADOW_STACK_PUSH,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, write_push)
+{
+	.mode = PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH,
+};
+
 FIXTURE_SETUP(valid_modes)
 {
 }

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260826-arm64-test-gcs-locking-no-enable-c291cdcdf083

Best regards,
--  
Mark Brown <broonie@kernel.org>


