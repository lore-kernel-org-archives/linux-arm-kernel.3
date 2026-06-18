Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68456CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jdGbUn73u/W+J/foaoAddB/fO/5GVIO9U86FeT7N2k=; b=KRourJCupKfvOpBipi/hdcHhNc
	/JpSJ8nHeGVMyY6egnzJOvLF0D7OVZThhGRixlJZkwJSkm1As8IvXZt+1F9wLlc+VUbDVmUSoItSU
	0Vb+pSPoyuTMDaaefF7I8qOghRxr7gPn/UiJqwJ+nK4SwoWSDvkvGshj27Lioxn9TjsVyfzMcTcTH
	ZOApinia5lhuqbR+j9zbUOR+dJqfMQIgOFvAPodXJ2MJ3CxklnYQ3ToakKj6k5Mq9Kv9KCy2EPt8O
	LZ4+WYmkqYQPZfbcekUxUjHMlxnx1H2GLWi/cNk/XIaURY0ugGUfL8jTHhnELd1bCJj8BqLPsvnvR
	MxnU1y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF17-00000001WED-2Cnh;
	Thu, 18 Jun 2026 15:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0u-00000001W4P-23p2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06835491B;
	Thu, 18 Jun 2026 08:50:39 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C9A53F62B;
	Thu, 18 Jun 2026 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797843; bh=/zyz2Ae5rAcClg+aAQGrZgMkoO3w/Xao/6VaZhVCYVM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ty96Gmil5oiGGyziC4lQ4mxBklPq7aVRtpNkvnLewIiG1gyvhLM90URKjxhdY20gV
	 eDbKlMfEZMC33YWM5NLTdLw3k70wekBrmIW/5sRbxR+Q8GptMnUHsUKecNZUTI2Suw
	 riZkwcl4IXLMv5MuwP28h8AHL6RTx0D24bYLQ/5s=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 5/7] util: Set exit status to errno in die_perror()
Date: Thu, 18 Jun 2026 16:49:59 +0100
Message-ID: <20260618155001.226266-6-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085044_622641_4E616FFF 
X-CRM114-Status: GOOD (  10.35  )
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

Exit with a return code equal to errno in die_perror() to make it easier
for the user to get the error code directly.

As per man 3 perror, errno is undefined after a successful library call, so
save it when entering die_perror().

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 util/util.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/util.c b/util/util.c
index bab4bb394111..fc732200f2dc 100644
--- a/util/util.c
+++ b/util/util.c
@@ -100,8 +100,10 @@ void __pr_debug(const char *debug, ...)
 
 void die_perror(const char *s)
 {
+	int e = errno;
+
 	perror(s);
-	exit(1);
+	exit(e);
 }
 
 void *mmap_hugetlbfs(struct kvm *kvm, const char *htlbfs_path, u64 size)
-- 
2.54.0


