Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9gu+eiMl1gGSKEogjiVxtZwcWzZZ/yN5EJkKeW7O7c=; b=rePPELrAmywpVHV7vOfDCeLJ99
	dOtvrz94Nim0B9b0hyq2BTDArBFDayLuR0vLWgRYAY7xfNaUrFqtNqqUlg6Ts/KOb6MgbDD26GDi5
	tKFU7ekVFnBmnV6kt/XCyJ4FD6/VQ3lDu+wLRyo4rPF3emfVqPsoE9brTZEQTukRNRM2lSpzxPVrq
	/o6K9yAqRMpBMraTtxWihb5bryAjKdmmfNSgeEF5gJH2dynk3CjEoDq3RmnhgfxzAroysoH5acUqG
	JoaRaSKQfNIN1A28euOKpRnelhvoaPn2o3vssbWb1t5GNwgPbiaeG2zLH5q4LtF+15CiydqB4WSYI
	1Ha8JDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4Z-0000000Gu5o-0qjM;
	Fri, 07 Nov 2025 08:43:55 +0000
Received: from mail-m3293.qiye.163.com ([220.197.32.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4S-0000000Gu3u-3VfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:43:51 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28c500947;
	Fri, 7 Nov 2025 16:43:30 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org,
	robin.murphy@arm.com
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	andy.xu@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH 0/2] perf/arm-ni: Optimize codes
Date: Fri,  7 Nov 2025 16:43:17 +0800
Message-ID: <20251107084320.555979-1-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a5d7c291309d9kunm533ae5d212b2d40
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQhhOVhpMGklDSB9PSU5KGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_004349_051309_B638DDE8 
X-CRM114-Status: UNSURE (   4.89  )
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

Rename PMU device name, and display the topology info of clock domain.

Thanks,
Shouping.

Shouping Wang (2):
  perf/arm-ni: rename PMU device name
  perf: arm-ni: add topology debug info for the clock domain

 drivers/perf/arm-ni.c | 69 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 5 deletions(-)

-- 
2.43.0


