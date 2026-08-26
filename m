Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF26DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4DorX6PcTh2x6wNorxjYEQh+EVngR2+HPCGK50qHTC8=; b=J1u1Qhz5STCEevuT7uHO0sIkR5
	KSYYsGrltD3TQoEj00+BnQLQJQOZBW+b8fQHdMWu+dHuDsUAM6L6eXxZ6iWMlooOA75iBlDFvppw3
	j0ZBXVZxi1/DEHgjcHxkJcaCAiungeSGtivUtEFwt3i38cLMmIoNG+jLVoJQPPCofltFU09zwVjAe
	D17bmuCMPJKaviJPM6Ue9bjaJB1Znk6QvjH49Hu8SRkxyVOmqD49bCQir5FTb9/9B7GUqH9MBD8AD
	mQQ0lqDfCYKxmuEie8k1PkTDBGLucwOzsO+woL3WFMgU1Z8A7abaNDTQI49+h3E3SR7MFjp/K4Xz8
	OXh+mYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK20-00000002yGz-3uxP;
	Wed, 26 Aug 2026 20:15:32 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK1x-00000002yGF-0c8u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:15:30 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 545FFC001505;
	Wed, 26 Aug 2026 13:15:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 545FFC001505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1787775325;
	bh=MKhPSHZ5MhV65xr6BuVgzFg0wGRW5rVUSSJGsXi9CM8=;
	h=From:To:Cc:Subject:Date:From;
	b=rmR99MqZbMTy8Crg/jHGbA+PzGeQ3aG1cV0S/e5z5uG0VcAQt24aEQp0UZ4n+sXt5
	 ixWUhRPheY/kodI5ndLA2l0ClaZ7gvHGUIezMrKx9NvlMrtM4v/lf53r0gJ5FN119d
	 pHawu6dReHg28OmaQqB5w+/1D+hrDu956zmo+kwM=
Received: from bse-build-07.ric.broadcom.net (unknown [10.136.28.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id BA434A9A;
	Wed, 26 Aug 2026 13:15:24 -0700 (PDT)
From: Danesh Petigara <danesh.petigara@broadcom.com>
To: mmayer@broadcom.com,
	krzk@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Danesh Petigara <danesh.petigara@broadcom.com>
Subject: [PATCH 0/2] Harden DPFE driver against buggy/malicious DCPU
Date: Wed, 26 Aug 2026 13:14:57 -0700
Message-ID: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_131529_277347_C880BBB5 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

This patch series hardens the Broadcom STB DPFE driver against potential
exploitation through a buggy or compromised DCPU coprocessor.

The DPFE driver exchanges messages with the DCPU over shared memory-mapped
regions and currently trusts DCPU supplied values without bounds checking
them before use.

A compromised or malfunctioning DCPU could:

- On API v1/v2 boards, provide an arbitrary MMIO read/write primitive
  through the offset supplied in get_msg_ptr(), combined with
  root-writable and world-readable sysfs files.

- Make a user who reads world-readable sysfs files trigger an out-of-bounds
  stack read of arbitrary extent via an unvalidated checksum index.

Patch 1 addresses the MMIO read/write issue by rejecting an offset that,
along with the largest field accessed (DRAM_VENDOR_ERROR + sizeof(u32)),
exceeds the recorded mapping size.

Patch 2 addresses the stack over-read via the checksum index by checking
it against MSG_FIELD_MAX after reading the response from the DCPU message
RAM.

Justin Chen (2):
  memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
  memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT

 drivers/memory/brcmstb_dpfe.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

-- 
2.54.0


