Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A210606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sT3tReKd;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eVjoFf9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iLoDvYYdW8eYBCuIX6o2n7MweRnzToA5C7UsFYQe97s=; b=sT3tReKdkrvSV3JpnkTuZUs/ni
	7d+pNpCFSZYAw+8BWYEXUuCNY2HydGtLHLF6inEzVVVlVwsjdaQte/ypaUut+iv4myfQfpuM72IgF
	Is4+aXkmksRzezMq0EnkC/lzC5pLJmfd+1NaBgDLwjhiMCCKj1jNvutqJGJZsTAcwnT+xcEZYZ0Ud
	xun9jxUn9HWQlLn0wQklZO4NgDhW5IZ8lCFZtq5ZDy2nWUjTBniQX2MdyZiyQzvfOnR37QqxdaVug
	53G5rh+W67cUSqT3jNGiZlnLQkMImC12EYu+gIR0lVigokIuS6yvQKw4myuyNEI1athM4zV2OzzPX
	RSbqyAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKFf-00000003X7h-2Cs3;
	Tue, 03 Nov 2026 19:32:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKFa-00000003X5l-2MGr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793734373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLoDvYYdW8eYBCuIX6o2n7MweRnzToA5C7UsFYQe97s=;
	b=eVjoFf9nolrqTvqe6/bn2n8ioCUHFQwkvb43SZKs+TlarCiDdl+b9+Fj4aZaJ9dZWZGklZ
	0Xk+XPyrVI7LNi5TLzgdvwagKaI176jBYUvmsNK0B/26EIRk0GT9WH1ITbptkP07eLzTGc
	RSBbcEUMm0isfEQpTUpL+kYCsY/zelc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-BL3dVhfFPqqbVS0DqelroA-1; Tue,
 03 Nov 2026 14:32:49 -0500
X-MC-Unique: BL3dVhfFPqqbVS0DqelroA-1
X-Mimecast-MFC-AGG-ID: BL3dVhfFPqqbVS0DqelroA_1793734367
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33D701800659;
	Tue,  3 Nov 2026 19:32:47 +0000 (UTC)
Received: from loberman-thinkpadp16gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7BD31800347;
	Tue,  3 Nov 2026 19:32:43 +0000 (UTC)
From: Laurence Oberman <loberman@redhat.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Wenchao Hao <haowenchao2@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ming Lei <tom.leiming@gmail.com>,
	Will Deacon <will@kernel.org>,
	cki-project@redhat.com,
	jmoyer@redhat.com,
	bgoncalv@redhat.com,
	mpatalan@redhat.com,
	ftjahjad@redhat.com,
	fsuba@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] scsi: core: Fix target reap_ref leak in scsi_get_pseudo_sdev()
Date: Tue,  3 Nov 2026 14:32:34 -0500
Message-ID: <20261103193235.1564898-2-loberman@redhat.com>
In-Reply-To: <20261103193235.1564898-1-loberman@redhat.com>
References: <8e4ba1820a7c56867bf7fff07bd52ff3f79573a1.camel@redhat.com>
 <20261103193235.1564898-1-loberman@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: _iZ4w-WkSve6rlXNKEK7rg9fATN6Jde2stTwIj4fkjI_1793734367
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_113254_829877_328F7A94 
X-CRM114-Status: GOOD (  15.21  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scsi_alloc_target() returns a target holding the initial reap_ref from
kref_init(). The scan paths drop that reference with scsi_target_reap()
once they are done with the target; the device allocated under it holds
its own reap_ref, taken in scsi_sysfs_device_initialize() and dropped
by __scsi_remove_device().

scsi_get_pseudo_sdev() only drops the initial reference on the failure
path. On success the pseudo target is left with an extra reap_ref, so
when scsi_forget_host() removes the pseudo device the count only drops
to one and the target is never destroyed: ->target_destroy() is not
called, and the scsi_target, the LLD's per-target data and the
reference the target holds on the host's gendev are leaked.

With scsi_debug (nr_reserved_cmds = 1) this is visible as one target
per host, at id max_id, for which ->target_alloc() is called but
->target_destroy() never is.

Drop the initial reap_ref unconditionally, as the scan paths do. The
pseudo target is then destroyed when the pseudo device is removed.

Fixes: d630fbf6fc8c ("scsi: core: Support allocating a pseudo SCSI device")
Signed-off-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/scsi/scsi_scan.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 8aae12fd38f3..9ed52724f97c 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -2154,14 +2154,15 @@ struct scsi_device *scsi_get_pseudo_sdev(struct Scsi_Host *shost)
 		goto out;
 
 	sdev = scsi_alloc_sdev(starget, U64_MAX, NULL);
-	if (!sdev) {
-		scsi_target_reap(starget);
-		goto put_target;
-	}
-
-	sdev->borken = 0;
+	if (sdev)
+		sdev->borken = 0;
 
-put_target:
+	/*
+	 * Drop the reap_ref taken by scsi_alloc_target(). If the pseudo device
+	 * was allocated it holds its own reap_ref, which __scsi_remove_device()
+	 * drops, so the target is destroyed when the pseudo device is removed.
+	 */
+	scsi_target_reap(starget);
 	/* See also the get_device(dev) call in scsi_alloc_target(). */
 	put_device(&starget->dev);
 
-- 
2.56.0


