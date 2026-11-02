Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F28606E00C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j+WaJ1mv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Z315d8rOKowv6IXdAf5MryJ4yd+EB7ArfeE3mgpBZio=; b=j+WaJ1mvaWaQVF3SGexCoQHK3O
	Fqw1TADHFZAFuZtEgNLgnuiDXGGun584WniHTO8huVD7JmgkhuT8p3lvi41/Fd9duwtxsShXPxIp+
	MiJyB9YJRJhrL1ewC3vZ7o7rvfAOUyzX2Nrhc4raaujfm2PWHiO2LylObWM4xMxUrsoa2+eYsBKit
	G+1B5CCg9FAKgvOuuv1cz/bRxhMUZOFo4OYnrzc02vtxdEIM/9M2SsOE8t+3WaPzj3jS82alio5wP
	py+czaYczP4N12lDYwfk/lA/U4rHfNn/oIc5L2vvV63iycgVLg2madJq6njKVhVhAjEJvqDY1xZt+
	X3hp+AqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwI6-0000000HXnR-0b49;
	Mon, 02 Nov 2026 17:57:54 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwI4-0000000HXmw-2AeZ;
	Mon, 02 Nov 2026 17:57:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6] coresight: coresight.h: add '*' to kernel-doc lines
Date: Mon,  2 Nov 2026 09:57:51 -0800
Message-ID: <20261102175751.2274430-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
a beginning '*' in them, so fix these lines.

Also convert struct coresight_trace_id_map to kernel-doc format to
remove another warning.

Warning: include/linux/coresight.h:173 bad line:
  connected to @src_port. NULL until the device is created
Warning: include/linux/coresight.h:177 bad line:
  needs to be filtered.
Warning: include/linux/coresight.h:236 This comment starts with '/**',
  but isn't a kernel-doc comment.

Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
v2: rebase & resend
v3: rebase & resend
v4: rebase & resend; add Andrew to Cc: list
v5: rebase & resend
v6: rebase & resend

Cc: James Clark <james.clark@arm.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Mike Leach <mike.leach@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/coresight.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20261030.orig/include/linux/coresight.h
+++ linux-next-20261030/include/linux/coresight.h
@@ -179,11 +179,11 @@ struct coresight_desc {
  * @dest_port:	destination's input port number @src_port is connected to.
  * @dest_fwnode: destination component's fwnode handle.
  * @dest_dev:	a @coresight_device representation of the component
-		connected to @src_port. NULL until the device is created
+ *		connected to @src_port. NULL until the device is created
  * @link: Representation of the connection as a sysfs link.
  * @filter_src_fwnode: filter source component's fwnode handle.
  * @filter_src_dev: a @coresight_device representation of the component that
-		needs to be filtered.
+ *		needs to be filtered.
  *
  * The full connection structure looks like this, where in_conns store
  * references to same connection as the source device's out_conns.
@@ -236,7 +236,7 @@ struct coresight_sysfs_link {
 #define CORESIGHT_TRACE_IDS_MAX 128
 
 /**
- * Trace ID map.
+ * struct coresight_trace_id_map - Trace ID map.
  *
  * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
  *		Initialised so that the reserved IDs are permanently marked as

