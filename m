Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C2CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 02:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PbhoTTiLGqZIvdhDyxJZ7YBvHWCNiI0Hjf/RiN64/zY=; b=LEediLHuvkTMWLV6Zy/QlQ3Nwa
	x+qJmlu0L8eJqXodfFjTUrsaQ1+50IMN8+FZieGr4VOum2Ezj1sLLYnPqTKPNYGzix2LHr3yZ/FGC
	UPn0CgmzOtz0PyGFoIDW8ZS3vzULFFCVC1FbTw6fSwuI79wnSfy70MUArr0Tc2CsTx39V3II1PJ8o
	M1XamlL0So0zNfNUO5eVnEMT9voTHTLPm/auIfVyPCY09getn/wxe3+jTcwH7uF2PsfRSK4Hg2urI
	badZDXSzAVlBDGSY8zrJbUqNuEWDuqU3UGkWWR00/ricGe2AUXUznpSaRtq6TjDIlAxz9gwYd/KbE
	eL0KzVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFUe-00000007Ipv-4Ao8;
	Wed, 25 Jun 2025 02:04:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFSM-00000007IgC-2CJr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 02:01:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 513E0113E;
	Tue, 24 Jun 2025 19:01:27 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30DA33F63F;
	Tue, 24 Jun 2025 19:01:44 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/arm64: Prevent build warnings from -Wmaybe-uninitialized
Date: Wed, 25 Jun 2025 03:01:38 +0100
Message-Id: <20250625020138.3777454-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_190146_603540_B1D0F104 
X-CRM114-Status: GOOD (  12.16  )
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

Arguments passed into WEXITSTATUS() should have been initialized earlier.
Otherwise following warning show up while building platform selftests on
arm64. Hence just zero out all the relevant local variables to avoid the
build warning.

Warning: ‘status’ may be used uninitialized in this function [-Wmaybe-uninitialized]

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v6.16-rc3

 tools/testing/selftests/arm64/abi/tpidr2.c    | 2 +-
 tools/testing/selftests/arm64/fp/za-fork.c    | 2 +-
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
index eb19dcc37a755..389a60e5feabf 100644
--- a/tools/testing/selftests/arm64/abi/tpidr2.c
+++ b/tools/testing/selftests/arm64/abi/tpidr2.c
@@ -96,7 +96,7 @@ static int write_sleep_read(void)
 static int write_fork_read(void)
 {
 	pid_t newpid, waiting, oldpid;
-	int status;
+	int status = 0;
 
 	set_tpidr2(getpid());
 
diff --git a/tools/testing/selftests/arm64/fp/za-fork.c b/tools/testing/selftests/arm64/fp/za-fork.c
index 587b946482226..6098beb3515a0 100644
--- a/tools/testing/selftests/arm64/fp/za-fork.c
+++ b/tools/testing/selftests/arm64/fp/za-fork.c
@@ -24,7 +24,7 @@ int verify_fork(void);
 int fork_test_c(void)
 {
 	pid_t newpid, waiting;
-	int child_status, parent_result;
+	int child_status = 0, parent_result;
 
 	newpid = fork();
 	if (newpid == 0) {
diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 3fb9742342a34..2b350b6b7e12c 100644
--- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
@@ -240,7 +240,7 @@ static bool map_guarded_stack(void)
 static bool test_fork(void)
 {
 	unsigned long child_mode;
-	int ret, status;
+	int ret, status = 0;
 	pid_t pid;
 	bool pass = true;
 
-- 
2.30.2


