Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RdLKXtzg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAo+3cnj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eCfNrN25WG0Lp8N9e0QR1ZUlJsFnF3TjIIskwGO1CyQ=; b=RdLKXtzggO6+oG
	pPdlQaKZQW741m1aBlfpZVpVbV5IZmz1aGstzpBI7dTqbFLwVDfhqHG2CCU8ZjdoVIVWrXQ8Ujvlx
	x8thbSxqhS+2thZwV8FfUk7TXqwE8PhxcWcnBizRch2TdYfsHG7ut8nFlJNeDpSL3HJg/P8+LDTR7
	Wa5CIp8jTD/OyIF9lr2iqJBVBIRl+LHxMY3v/SkgxfPBE9ZgD6r4+g3giWOhLF6YD4e1zwa7V75xz
	idiVLtedc+pRsNJVGHae5p2ji0VY1ge0uNOTJESgadgiBS+ShEZB+MWW7O/L+tIWOGWGNyRjIuK4G
	OOBRWP1D8L0QmcfJ10dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeY6-00000004J5F-2jQw;
	Tue, 27 Oct 2026 10:36:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeY5-00000004J58-1epJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:36:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77AA860200;
	Tue, 27 Oct 2026 10:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8595E1F031E1;
	Tue, 27 Oct 2026 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097416;
	bh=eCfNrN25WG0Lp8N9e0QR1ZUlJsFnF3TjIIskwGO1CyQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KAo+3cnj/Mo6mZ5IwWx68OFAxV7cAhDfrS399AIyrtiLUize18zsZR9Pi/LAeMjt+
	 quFJauaRNjvbVW4Uj9/o8PULqRCXcCTxNKbVEvLxKmLeybri7gWCFwlWVnFs31nN2n
	 LZlZVFHXXp0nnEEfIwtljU1RV3c9l6tuuIhrTLa04fgPYllUOd+F28jx7GD5aY2V57
	 Q1vYDl9Oq8/HBYRT0iOxf0SVs25GhNTBkrL9MSQk7lAgbYEGe010rrSi1Mvnh0wpcd
	 PAvLPlie4THn23L3TPmDqXR6gHsDRWn8bD9qfIXJBr7NBVrtg/AsofjelYcvnNKbfS
	 Gqx/IzjWk3+JQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/27] mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
Date: Tue, 27 Oct 2026 09:30:36 +0000
Message-ID: <20261027093306.2812695-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
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

Fixes: 55b175d7e632 ("ARM: ux500: split out prcmu initialization")
Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4c9d
Reviewed-by: Linus Walleij <linusw@kernel.org>
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
2.56.0.307.g5fe7bd680c-goog


