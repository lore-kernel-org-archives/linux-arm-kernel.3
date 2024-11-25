Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52718D3B7FB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/9Q1gMyTfomfpzyKtc8H9UOx8pBJDakv5PwQ73RSRHg=; b=m2qNBKDuliG81BIJ2fWqRS1ZZJ
	0uyvRp/2lY8BMgF6q5ouoLl4zs+pyt6ACSfVEDdHJP8PWfIE9Hrr4RcNV6K33cSPHc1+QqhAWpsx7
	RytXf3OugrveH171UJXMrRvSsI/unSJOv/v6kHOo82VXEo/2lr7oux65Dn3jEsmvZDBSlGxfG+gWi
	oaBXXNnV8NS5eIPURy5/unR1mxTeNmr1A/laGSGSzoFxV8pk7ml361h/ItNf2d9aArkvky7/7PKUk
	/zVE+QwldhRL2/nGzQIENiW3iwDsKoWYGsckOcZVmB4CfS3IbPl9B+hypFSq4zwzAwu2qhpD2hGHb
	KuuC0g8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWA7-00000007i5k-2RKD;
	Mon, 25 Nov 2024 10:17:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVm3-00000007ehP-40XV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:52:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016351692;
	Mon, 25 Nov 2024 01:53:25 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E11523F5A1;
	Mon, 25 Nov 2024 01:52:53 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/3] small fixes for arm_ffa driver
Date: Mon, 25 Nov 2024 09:52:48 +0000
Message-Id: <20241125095251.366866-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_015256_033275_E6027B9D 
X-CRM114-Status: UNSURE (   5.68  )
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

This patchset small fixes for arm_ffa driver:
    - change ffa_device_register()'s declaration and its return value.
    - add direct message version 2 related properties bits and some fix.

Levi Yun (3):
  firmware/arm_ffa: change ffa_device_register()'s parameters and return
  arm_ffa.h: add properties bit related direct msg version 2
  firmware/arm_ffa: remove __le64_to_cpu() when set uuid for direct msg
    v2

 drivers/firmware/arm_ffa/bus.c    | 22 +++++++++++++++-------
 drivers/firmware/arm_ffa/driver.c | 18 +++++++-----------
 include/linux/arm_ffa.h           | 16 ++++++++++++----
 3 files changed, 34 insertions(+), 22 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


