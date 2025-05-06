Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4817BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmNA4c+Oojm6jH43yAx2JRj1VUwsumuexFyexRksMZ4=; b=FKb1qsnnhVonzPrqjE2Iy684he
	IFMXjdcESRS6fiir8hriKiWJNRz1625TptCWPgPymacEpNjCIOYNh6lXnL78r31+hmQ+WKAdKgsUi
	1hyVGRkBKRnH3EzUYvsZrBUXJtZk1mpBORunJu5SUjq7LGFTBwIuK6XyqDxYEhHa+ggSZJ3dHNjFt
	0jUlj5FCC0NAnujFFQeLvnWhrmGLu/Y9y6ELCwJ/7aGnPbp9b62s3+KL45NyKvkpM6VoaNXJ4KalV
	NAz/YrcFQ3QI8x1doK85SC54xOyHER6kY5GcbU7gEI13dQekthe2GKTGl4G7vVjdWJv/MRI5M9PuT
	3KvfnHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQuR-0000000DbmW-0XVp;
	Tue, 06 May 2025 22:37:07 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMCc-0000000Cre8-3tNb;
	Tue, 06 May 2025 17:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZmNA4
	c+Oojm6jH43yAx2JRj1VUwsumuexFyexRksMZ4=; b=oj27vMXlyT9pECI6x5V31
	AKjSaNUSrju8+cNTVQbDMN+Qyu/8bVhpETmylPLoWEQptAOYOf5kMqKKIqxR94E+
	WlKKd2ptt51BxanXvH9m/TBX5pm3oidaq/N4TmxYAYOgLehmXJgLsQ6Dma5iqD6e
	eYpEf2f+1eSkZFdGa02kgM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAX_U4ySBpoVmZeEw--.15363S2;
	Wed, 07 May 2025 01:34:43 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3 0/3] Configure root port MPS during host probing
Date: Wed,  7 May 2025 01:34:36 +0800
Message-Id: <20250506173439.292460-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX_U4ySBpoVmZeEw--.15363S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1fZw43GryUtrWfJryxXwb_yoWfCFb_uF
	WfuFWDJw47JFyvyFyFgF4Iyry5Zan3uryjq3WvqFWYyF9xXr13Xws3WFW2gF1UWFWSyFsx
	Cr1kZr4rAr1xZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMeOJUUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOghFo2gaREltXgAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_103535_288704_73CCC739 
X-CRM114-Status: UNSURE (   5.96  )
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

1. PCI: Configure root port MPS during host probing
2. PCI: dwc: Remove redundant MPS configuration
3. PCI: aardvark: Remove redundant MPS configuration

---
Changes for v3:
- The new split is patch 2/3 and 3/3.
- Modify the patch 1/3 according to Niklas' suggestion.

Changes for v2:
- According to the Maintainer's suggestion, limit the setting of MPS
  changes to platforms with controller drivers.
- Delete the MPS code set by the SOC manufacturer.
---

Hans Zhang (3):
  PCI: Configure root port MPS during host probing
  PCI: dwc: Remove redundant MPS configuration
  PCI: aardvark: Remove redundant MPS configuration

 drivers/pci/controller/dwc/pci-meson.c | 17 -------
 drivers/pci/controller/pci-aardvark.c  |  2 -
 drivers/pci/probe.c                    | 66 ++++++++++++++------------
 3 files changed, 35 insertions(+), 50 deletions(-)


base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
-- 
2.25.1


