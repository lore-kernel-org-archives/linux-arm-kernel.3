Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60794606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fOBSTT7H;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oLGvXQ98
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4bc3lyW8ExNMs+t0RxZYctVap348djpgztaEMV/DmNs=; b=fOBSTT7Hhsq0wTsEr4bHLV9Had
	nsO5A6uHqko5GOCNqi9Zs+PIpcLgSI/USqjj5v+Yr9EBis1gNzCT5uLPK5G+znI3rgHycHivgvVin
	cW/K1sUlXMwOuQt/1E/b+4GLBpbldqU1gQZNEDUvpBYNhOGHwEY0u/UHLb1+CSbudYp9fQ7SPDX/2
	qiFtGciF39zRC1XOPIPlsLQ59gnMQ8hfDECQZxCw7SfNDCInB1+1akTQicIVYa2dXACmn8wQWcDTY
	rlzaiIdPRd2fvyIFp0jeeD2Fw1nyUGU5hNKMRVo7PmNuXNu+dY7V08Ojg0PZ3Xyr7f8lnY1yqzo42
	Sc17cyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTqo-0000000BdpP-1Hr0;
	Wed, 21 Oct 2026 10:47:18 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTqm-0000000Bdny-2AgA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4b
	c3lyW8ExNMs+t0RxZYctVap348djpgztaEMV/DmNs=; b=oLGvXQ984248iRJ5qJ
	tzRNkRq2PLyi3KzOHNdHtRpe64gdRSfX0s+t7wV3qXAg8quZ98tDZY457ItbJjuN
	QDBH2GE6nVXv4nCueP4gqooUEjgFw3IidJ61H7c9edWSn14nRjb9I2x+k8fl8XgW
	8dE8M8r4SchCwoyclzKz4/6n4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXXzcZmNhqXKxSBw--.62283S2;
	Wed, 21 Oct 2026 18:46:50 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] EDAC: reserve space for debugfs input terminators
Date: Wed, 21 Oct 2026 18:46:46 +0800
Message-Id: <20261021104648.4105938-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXXzcZmNhqXKxSBw--.62283S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxdcTUUUUU
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Bv8N2rYmBvbUQAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_034716_909820_513184E2 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Versal and ZynqMP EDAC debugfs injection handlers allow the copied
input to fill a six-byte stack buffer and then append a NUL byte one byte
beyond it.

Limit each copy to five bytes so the existing terminator write remains
inside the buffer.

Jiale Yao (2):
  EDAC/versal: reserve space for injection input terminator
  EDAC/zynqmp: reserve space for injection input terminator

 drivers/edac/versal_edac.c | 2 +-
 drivers/edac/zynqmp_edac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


