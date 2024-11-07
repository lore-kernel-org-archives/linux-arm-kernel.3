Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2402D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey6XNX5PbqVGBWLGb03G/bAnkJUej94evD8jcDY62k8=; b=pqQ2du9HqGP4ph5o1wQMTKS/C2
	ZDx+SGJHc6X2I0smFRBSKi7Jw5mAOthFHMENcQNiA4HNgTvJKRyk4xAPlpUuED8qYRSGPS4LMITEg
	vXmxabi92/3+RbUBif8nJhMgbQeemwwWCX0C8mtWfdz6KyA72xJu7JuFSlDcYA8x2aM8P0p1ZFmU1
	Vh54m4DmXnJjoES7dXFS1TNo8n2XdILtVYtHBY3oQRURS8dYF+0f7vZ9eHf9lz8kTfuAcSr/xZeIa
	mzdaJYdCNAorRl1m55ME3clecqsK8oco0fBZqkV6v91GIVVa/RmWYgwVs873grpd9zQToufqGEHQR
	0t6ZtxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rot-00000005NBa-3xxg;
	Thu, 07 Nov 2024 02:00:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rYz-00000005KEe-0KBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBC5A5C5438;
	Thu,  7 Nov 2024 01:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD3AC4CED2;
	Thu,  7 Nov 2024 01:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943836;
	bh=Ntx8WxDk8rLB1Q5ojb39wO8KX0zB/auSEfmEWkUG1Zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eOGRyaQBHLWbThvMfSOe+NdKSSWq47FiT6b0jbREJrCrmCCkKRYzBX+kI8uqf4FGB
	 8Rv3aIyC0qor9e7OhXBedZ/cj9Of9jgpTWw/ukU8ZRaZzBW1kRxPIXrz7wQ72uT3Go
	 k3T+rD5Fmj8phhkMIU94o0Mc6vDXwQiq9tz8HUaiJBhUqOzNkve1cErbwnm5NhPshu
	 AzS2XHxlYB6oBLepZrn7YXVck1C5VRttG7VoARVhv4jOm4klkosh8LV7cTGDr1rCI+
	 r+4m1zmGwPYFpV3s2XQgqfkehkMXEBiIgUHjIOC0VUa5YYa+5E4YFmg/XikX2smBGe
	 eVxd6sDElshsA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:39:22 +0000
Subject: [PATCH v2 3/6] kselftest/arm64: Corrupt P0 in the irritator when
 testing SSVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-stress-irritator-v2-3-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ntx8WxDk8rLB1Q5ojb39wO8KX0zB/auSEfmEWkUG1Zw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBtRwxb32ApH8TNCcyHne3pvmw/cpBt6AyUptaVN
 CbigTQOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywbUQAKCRAk1otyXVSH0Ez4B/
 wOuFw0QZXOAEYlFcCsYcnod9CvSTtuMwy5tDEnl0yp9kzzWK0P1Y3U89+XaFPf37gas7ljxNTWD85P
 ep6hgFfDMW3ZUzsQks3C8oSQPvpGEdsaNW7Bb3lCM6k30WJxpcA1AbWsNpgXEG2TAQHqSwLcZUHbr/
 Phe9TzUtRbi2szmDxzDGMzOL/JOz6K/v3AziIWHW3LWds5gA1DfXMFf2Y8tONxzQk/I6JXuX3MWZxV
 PNGhLcDB1GZx1onv67RT3a2zDo5zgAmJvV4dwJbMMvljWihwNE+pv35clsC/22S07uBgQRK8VFpNGU
 J36mxVJYc8xIgrRjhbJxYU2fCZ8E4U
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174357_201920_C271B32C 
X-CRM114-Status: GOOD (  10.38  )
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

When building for streaming SVE the irritator for SVE skips updates of both
P0 and FFR. While FFR is skipped since it might not be present there is no
reason to skip corrupting P0 so switch to an instruction valid in streaming
mode and move the ifdef.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index f1fb9745c681786f686f1fafcb7e1154f3c8e1a3..28eb8b5cc2d2e6f51818f29db037e55c9b838a41 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -302,9 +302,9 @@ function irritator_handler
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
-#ifndef SSVE
 	// And P0
-	rdffr	p0.b
+	ptrue	p0.d
+#ifndef SSVE
 	// And FFR
 	wrffr	p15.b
 #endif

-- 
2.39.2


