Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E1C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NfTrwv3r;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZR2eirAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqg9AUkKMFzGjca4P8T0j7dfc1PjK21o+l1aCM99D/M=; b=NfTrwv3rO5UhoVlDVmqaN9e5fM
	vdSQEEORYVpo7EVXgNjTbNma5jK7ZOxjiSD12Md4qB4hfi5LM5JVfilMBgpA+PYztT1035SJcBkfF
	6QAv3+I12y+PwizZhqcvkpkskae4xdQz6ukahzCQQP4Smg9iDH2JBrKNJcW25MyNCkbvSNQaxelq8
	tNrcNNboS3AomhfOLu4gzN3vkiWcTnIc/DrPU8r7nuk5fq1OGKCdTBnu9/y+4I/ji/XdVlRTuPx4L
	PPbCda27a8gLTf7ohnhPZxvJvwubgxEMDortmYkLl30GlifHoYV0JcmjEsoZr4LURrBW7IzTiykCf
	QZ6ZORBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVDQ-0000000BmSC-30cd;
	Wed, 21 Oct 2026 12:14:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVDP-0000000BmRw-3MNU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:14:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED6AA6021E;
	Wed, 21 Oct 2026 12:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235A41F000C6;
	Wed, 21 Oct 2026 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584882;
	bh=gqg9AUkKMFzGjca4P8T0j7dfc1PjK21o+l1aCM99D/M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZR2eirAseEOQSteV5fGTHuD7jgmvGErUNFgsPw7hP6u+VHrrIKQu8+DCOh7vRJ4sD
	 SnSRuCBT3N7C3mTYMlFZL7atpBp5s2B8Lm9/LYE+jm09bW68zu8dStZevJ2CDOEaWv
	 pKY0zWnxPXz5h/onSYAfHBfgoteb0/h0ebEnU9TfV6aC1H8QNGfoXi/XCRP9ZiP6v8
	 3unjVDVtSrXXDHkHvQZywgMjoDSVmB0qkfOhaSb9pDS7dSMsikMP5oN0Fr7DlvwNIB
	 CgsQTCkbuHAyUNu7+LVxg4oA3PhW8b0Q6eLfIGaI1L4HzMZZV47UP3Cvzofs0SriFD
	 cHPlGtHXMh/Ag==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/28] mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
Date: Wed, 21 Oct 2026 12:09:29 +0000
Message-ID: <20261021121245.3111563-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
and the mfd_cell descriptors on the stack and assigns &ab850x_resource
to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
resource table via platform_device_add_resources() before
db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
attached to the child platform device retains a stale pointer to the
expired stack frame.

Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
descriptors as static const so the resource pointer remains valid for
the lifetime of the device.

Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4c9d
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/db8500-prcmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 6672c55f2ebc..cdfcbeb2a88c 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2953,16 +2953,15 @@ static const struct mfd_cell db8500_prcmu_devs[] = {
 
 static int db8500_prcmu_register_ab8500(struct device *parent)
 {
-	struct device_node *np;
-	struct resource ab850x_resource;
-	const struct mfd_cell ab8500_cell = {
+	static struct resource ab850x_resource;
+	static const struct mfd_cell ab8500_cell = {
 		.name = "ab8500-core",
 		.of_compatible = "stericsson,ab8500",
 		.id = AB8500_VERSION_AB8500,
 		.resources = &ab850x_resource,
 		.num_resources = 1,
 	};
-	const struct mfd_cell ab8505_cell = {
+	static const struct mfd_cell ab8505_cell = {
 		.name = "ab8505-core",
 		.of_compatible = "stericsson,ab8505",
 		.id = AB8500_VERSION_AB8505,
@@ -2970,6 +2969,7 @@ static int db8500_prcmu_register_ab8500(struct device *parent)
 		.num_resources = 1,
 	};
 	const struct mfd_cell *ab850x_cell;
+	struct device_node *np;
 
 	if (!parent->of_node)
 		return -ENODEV;
-- 
2.56.0.218.g1ec904b173-goog


