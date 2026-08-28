Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CA4C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfku0lPz7WJB8aIdUHoXK+mnPfY4Qn0hLLaeSPnv6F8=; b=oVIBzLx3nPgS6tCg1mp+YyUPbI
	BlFeiXtp2hLLtpLWLAy90MX0radITaWzvL5H0ESCB9dJusuheQO+45ujOkb3MU3kzmtgwTPhfZxFE
	dzgBkxPHcCWvdwiMYY6VOkgleu9+ef8x6S3+pPQr7vfuZR99N8lYZXw4a6T91Rn4ZLrdRsNdr8uNX
	JxNJDls9EX1BmaGGOqiE3dwOxQ0kMFdlIwNd5uHsFp+zqLNc7eJp/u66sk5CnbKKRnn7eKnoUBscw
	gi8WOTQDEU6IPNhdj0H0y6y1ZnctemjzfU9SJONGJVkts3TEul33TJU7niXUVdwh+u46SKMqDL/R2
	mRPdu92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6G-00000005lSU-1Ukk;
	Fri, 28 Aug 2026 12:54:28 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6E-00000005lPb-04Fm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:27 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49b7c1dcc82so6699455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921663; x=1788526463; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfku0lPz7WJB8aIdUHoXK+mnPfY4Qn0hLLaeSPnv6F8=;
        b=URgiiyT9zrl88ZK+E4l4+jq4wa5j99x7gcthbrk1XM0VkgmrrsTmWF5YYnQ7sogj8z
         LTGLRzH9cXE7dppOURbyOUgPT1kXQAw+LaPC/CqJRaYjRXsu5kY60WyjHWykHJ7wx5iZ
         kqoWSAUtaYtIm21XSwhHq2YMYog/Q1DQFK0agNQtTT7/U/5u7tWJ+ukjAu+QAyc8fhaD
         8AxIa2wdmNiCD1l+TdsKGTmDZny/bhv089lRkL5t2J4ioAuDb3wjF2OuDFcZYT3Zrw8v
         I9wfYkz8qiFC1ilHY3rqQv/ICYWyKDLsXdUCWniMtQkcPnmo27EHYS8dCuETadkPKAYL
         Np7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921663; x=1788526463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfku0lPz7WJB8aIdUHoXK+mnPfY4Qn0hLLaeSPnv6F8=;
        b=JyI5Zn1p3chxmdnArH7wIxRrPoE2ZTF1eN2bOUEJYnoOTC9P+YPLcrW4PlzNyjQ2It
         OSFcBomcz4Ln5566RtjvvAZyJfI7FVFyjFT8LiS2YM53vtrGVzS8DSO0lArbFsogdam+
         6lap7JiMqEke+16PN1smCXUFndJU11oV8S3bhcscpgNTinoHnzljuOvN9t3plSAdrsIh
         xmAmqSNKBBdCGhh2AombN5Ir0a8x8/nhdEL0SBDeDujvZqmF0TbrSVnoUF2ROMGZ2/oS
         z5edHMZwmNojYUulrHZgjTDCGhYHBh88Lfty0YbO+67UiWuvjOxubY7vLMZrRCZ+00Nh
         pi6g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5o6VZnDrcqsgPGmFzXQhpCLes6QSSxwF4DG0bkPs3TZmrMZdL+453OyK9A+Onl49TvoTYSW5yFcB6aRPRv7nn@lists.infradead.org
X-Gm-Message-State: AFuF++n4PfMtcuHgP/6Y4XjOBEDQWP3hWoZ51OH5X6GgRmexGPBsDagC
	DpnP6xJTz9ddSosrLjJ69RHVgtq0tqUqDeDh71GOG/I3cpZZw3AYRpi7Pzp6kauuI3pbSBGBx59
	y2p+hln0oK0Qokg==
X-Received: from wmqt17.prod.google.com ([2002:a05:600c:1991:b0:49b:8f1d:7d3a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e86:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49b91bd43a7mr86485665e9.0.1787921662708;
 Fri, 28 Aug 2026 05:54:22 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:39 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-5-smostafa@google.com>
Subject: [PATCH 4/7] iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055426_062909_EC5B32FD 
X-CRM114-Status: GOOD (  10.88  )
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

arm_smmu_v3_test_debug_print_used_bits() hardcodes arm_smmu_get_ste_used()
instead of using the provided writer->ops->get_used() callback.
This caused Context Descriptors to be incorrectly parsed as STEs.

Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..eae08d4d77ec 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -125,8 +125,8 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
 {
 	__le64 used_bits[NUM_ENTRY_QWORDS] = {};
 
-	arm_smmu_get_ste_used(ste, used_bits);
-	pr_debug("STE used bits: ");
+	writer->ops->get_used(ste, used_bits);
+	pr_debug("Entry used bits: ");
 	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8, used_bits,
 			     sizeof(used_bits), false);
 }
-- 
2.55.0.897.gb25b4bd76c-goog


