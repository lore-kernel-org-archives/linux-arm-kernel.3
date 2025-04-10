Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F56C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sN82NJUvEnlo4mUVhM2Hn6KBjDuL9mvbOe+ynpVv0lo=; b=FMKN32+2L8JPLp/f3I/CUK61My
	oQroQEQ4oa+RAU+9k1AWPHTYIeIPJp5rU41PMJ/NmrdBpLqJO/5AGxrUa3mVMgGm+UT/uTVF4eueX
	7wqtCOUEznwxPxrruOWyxEfmv3aMfbNOLVKSYrHdxxZlqKOU1SDpQPK56k0fRzMQxJDlOEvCGg2BI
	psPtjYQpVpBtiV8nSXJ8BabYsz0Nfogf03vlsVR+yzvn1q239OuvbQFuijbfDg3PJzX1GZPjDakdU
	nOJDQUCwd7xNqYAXmwZ2wiED9gYCg87ak2+dCZcKhaN6Q1N/YOFegbsBFRgLdnvPrECpy/+Cb4QsE
	KA98eflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qOq-0000000ANXL-3Fyf;
	Thu, 10 Apr 2025 11:48:52 +0000
Received: from mail-m19731119.qiye.163.com ([220.197.31.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qIs-0000000ALBL-0stS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:42:44 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11665dc50;
	Thu, 10 Apr 2025 19:42:24 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH 0/2] perf:arm-ni: support PMUs to share IRQs
Date: Thu, 10 Apr 2025 19:42:12 +0800
Message-ID: <20250410114214.1599777-1-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUxJVhlMGE1MTR5MT0IYSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a961f82225009d9kunm11665dc50
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06Ajo4PTJNMDceEEgMTD4U
	OhVPCy9VSlVKTE9PSUNOSE9OSkNOVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VKT0xVSk5DWVdZCAFZQUpLTEw3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_044242_408620_0D5CB913 
X-CRM114-Status: UNSURE (   5.38  )
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

This patch mainly supports to share the interrupt on PMUS for different
clock domains.

Dependency: The second patch depends on first one. It was already
reviewed by robin.

thanks,
Shouping

Hongbo Yao (1):
  perf: arm-ni: Unregister PMUs on probe failure

Shouping Wang (1):
  perf:arm-ni: support PMUs to share IRQs for different clock domains

 drivers/perf/arm-ni.c | 116 +++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 42 deletions(-)

-- 
2.43.0


