Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333EDCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THdXiYAEn5Oz4oBQv+RuuXZHfCgfy9dp1ghQ5rbYac0=; b=ij/nWJD9L1dyQgla4Vinov7UVo
	/6xAT5CuVCqkM1TOcak3RxJ4TEzsQRmYUIPEO+9OBH5N9nwU52SxkRZXj55iUebftX6O1+u3h3Dwl
	3OV00gyr8h69BR6BvCYlvYOAMYXBLijKLrOKmoscmwKX/QVkhq80RRQtMKKmqF5n35vwK2Yu+YHRc
	gfjl/BacOM37NJ68MaK8TEVjFwGQt62KO7QTa8dgh2Vi9kyNwKddkz3yaF59Sohaio1Uvh27XHNjr
	+rPY3pscSJpGlO9bbeu80qBJip+KWMG9YUqZ2sVQyEGyZzAkd9epvy6JXDDa+ZxWuFqXXk69MQuFY
	KXJQOHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMQW-00000000NAn-075y;
	Thu, 15 Oct 2026 14:27:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMQ0-00000000Mbc-3EEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2CC11516;
	Thu, 15 Oct 2026 07:26:48 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CE483F871;
	Thu, 15 Oct 2026 07:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074412; bh=DNQETDEyak8naSY4EIpo/+mHp8XBiRhp+IR8g1J6GgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSqW9q7XxyuwSmz+6ydn2qmvCylqqdgvQfEHsW3ZI+CVk3toxpkOv3457nY01jAmL
	 oWUcu0zVjHtRyNGSfcRP8POyzvzunYIOcPRzXWxewluJvrIlTeKE6qgG26Zlih/5MS
	 N5PAD9oOQ+iEmQkBbG+Lt+WGtdQFCc3+qpopbsKY=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 14/15] misc/arm-cla: Support exclusive context assignment
Date: Thu, 15 Oct 2026 15:25:48 +0100
Message-ID: <20261015142552.4128028-15-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072653_848377_1CAB9B6F 
X-CRM114-Status: GOOD (  19.43  )
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

From: Jean-Philippe Brucker <jpb@kernel.org>

Introduce a nr_contexts members to cla_domain to count the mapped
contexts. At the moment PL0 contexts share the domain, while PL1
contexts require exclusive assignment, since there is no context
save/restore. A negative count indicates the domain is exclusive.

Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>
---
 drivers/misc/arm-cla/arm-cla.h |  2 ++
 drivers/misc/arm-cla/cla-ctx.c | 44 ++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/arm-cla/arm-cla.h b/drivers/misc/arm-cla/arm-cla.h
index c9ecab5ab6bf..43a58a329525 100644
--- a/drivers/misc/arm-cla/arm-cla.h
+++ b/drivers/misc/arm-cla/arm-cla.h
@@ -105,6 +105,7 @@ struct cla_dev {
  * @lock:		Protects the following members.
  * @ctxs:		All live contexts, keyed on cla_ctx_key.
  * @queued_ctxs:	Queue of contexts waiting for assignment.
+ * @nr_ctxs:		Context count. Negative value for exclusive assignment.
  * @worker:		Kthread worker to coordinate reassignment.
  * @reassign:		Delayed work that switches contexts with time slicing.
  *
@@ -120,6 +121,7 @@ struct cla_domain {
 
 	struct mutex lock;
 	bool broken;
+	long nr_ctxs;
 	struct rhashtable ctxs;
 	struct list_head queued_ctxs;
 	struct cla_ctx *assigned_ctx;
diff --git a/drivers/misc/arm-cla/cla-ctx.c b/drivers/misc/arm-cla/cla-ctx.c
index 0489bf7a103f..f956cc88909f 100644
--- a/drivers/misc/arm-cla/cla-ctx.c
+++ b/drivers/misc/arm-cla/cla-ctx.c
@@ -39,6 +39,38 @@ static inline void cla_ctx_put_pl1(struct cla_ctx *ctx)
 }
 #endif
 
+static int cla_domain_get(struct cla_domain *domain, bool share)
+{
+	lockdep_assert_held(&domain->lock);
+
+	if (share) {
+		/* Time share the domain with other contexts. */
+		if (domain->nr_ctxs < 0)
+			return -EBUSY;
+		domain->nr_ctxs++;
+		WARN_ON(domain->nr_ctxs < 0); /* LONG_MAX contexts?! */
+	} else {
+		/* Reserve the domain for exclusive assignment. */
+		if (domain->nr_ctxs != 0)
+			return -EBUSY;
+		domain->nr_ctxs--;
+	}
+	return 0;
+}
+
+/* Undo cla_domain_get() */
+static void cla_domain_put(struct cla_domain *domain)
+{
+	lockdep_assert_held(&domain->lock);
+
+	if (domain->nr_ctxs == -1)
+		domain->nr_ctxs = 0;
+	else if (domain->nr_ctxs > 0)
+		domain->nr_ctxs--;
+	else
+		WARN(1, "invalid domain refcount %ld\n", domain->nr_ctxs);
+}
+
 /**
  * cla_ctx_create - Create a context or increase its user count
  * @domain: CLA domain
@@ -53,7 +85,7 @@ struct cla_ctx *cla_ctx_create(struct cla_domain *domain,
 			       struct cla_ctx_key *key)
 {
 	struct cla_ctx *ctx;
-	int ret = -ENOMEM;
+	int ret;
 
 	mutex_lock(&domain->lock);
 	ctx = cla_domain_lookup_ctx(domain, key);
@@ -68,9 +100,14 @@ struct cla_ctx *cla_ctx_create(struct cla_domain *domain,
 		goto err_unlock;
 	}
 
+	ret = cla_domain_get(domain, key->type == CLA_CTX_PL0);
+	if (ret)
+		goto err_unlock;
+
+	ret = -ENOMEM;
 	ctx = kzalloc_obj(*ctx, GFP_KERNEL_ACCOUNT);
 	if (!ctx)
-		goto err_unlock;
+		goto err_put_domain;
 
 	kref_init(&ctx->refcnt);
 	refcount_set(&ctx->users, 1);
@@ -116,6 +153,8 @@ struct cla_ctx *cla_ctx_create(struct cla_domain *domain,
 		cla_ctx_put_pl1(ctx);
 	}
 	kfree(ctx);
+err_put_domain:
+	cla_domain_put(domain);
 err_unlock:
 	mutex_unlock(&domain->lock);
 	return ERR_PTR(ret);
@@ -161,6 +200,7 @@ void cla_ctx_destroy(struct cla_domain *domain, struct cla_ctx_key *key)
 	 */
 	if (domain->assigned_ctx == ctx)
 		cla_domain_schedule_reassignment(domain);
+	cla_domain_put(domain);
 	mutex_unlock(&domain->lock);
 
 	/* Release initial reference from cla_ctx_create(). */
-- 
2.43.0


