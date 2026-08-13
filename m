Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEFBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/lQ7mX961X1xOEALGlqSDQ1TjsBKRLjdM3EK41msmV8=; b=bYGSmSr6Phr/hJwHMenloxZYs2
	xpghJbEiNmL8Drm3xyUX6DV/dIn94NxTuXP2Xqzs+XocBU+jXbKfx9BycGhUifGt7Wy4F01guAJSN
	OjBkLQJszepMCY98cCscXObKrkC+prplIB5zLWKXELo5y18tE+1AI1bw/d3Bfqf79gKIVnK/NNLhi
	uOmlImwqOsrK8pIVR15ktyhfQrKPQ8ILNAV9V3Hr9yXAomjA8EFcBF041+XMwHsnfP+XnFxuVOtz/
	H245q1BQHCIwLMi4HWiC7MOuFaEKz+wHUtONoOpF66ql5EiPTi6J0nWSrQESEzVwnY66JXIk1Hj/j
	xyVOefLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXrw-000000016Hf-1z1i;
	Thu, 13 Aug 2026 16:01:24 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXrt-000000016Gp-2yLN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:01:23 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAX6+5O6n1qPxp7BQ--.64333S2;
	Fri, 14 Aug 2026 00:01:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Joerg Roedel <jroedel@suse.de>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 0/2] ACPI: IORT: validate node and RMR extents
Date: Fri, 14 Aug 2026 00:01:18 +0800
Message-ID: <20260813160118.69153-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAX6+5O6n1qPxp7BQ--.64333S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr15ZFWfuFyrJr4rtF17Awb_yoW8WF18pa
	yYqay5tr95JF1fKw4ft3W5GF1rG3yrJw47Xrn3J3sFvrn8tr1UA3WIkr12qFZIgrySgrW2
	vF40vFnrCFyY93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUoq2MUUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_090122_121716_D9F69DA0 
X-CRM114-Status: UNSURE (   6.74  )
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

The original patch combined the generic IORT node walk with the
IOMMU-specific RMR descriptor and ID-mapping arrays.  This version
separates those contracts as requested.

Patch 1 validates the root node area, complete node headers and advertised
node lengths in each generic walker.  Patch 2, built only with
CONFIG_IOMMU_API, validates the fixed RMR payload and both arrays before
walking them.

Changes since v1:
https://lore.kernel.org/all/20260706094300.82618-1-pengpeng@iscas.ac.cn/
- split generic traversal from RMR array validation
- validate root node_offset and node_count before pointer construction
- scope RMR helpers with their CONFIG_IOMMU_API users
- document why a zero-count array needs no offset validation

Testing used Linux 3d6d817622b0 plus this series, GCC 13.3 and QEMU
8.2.2 with a Cortex-A57 arm64 CPU model.  A temporary KUnit harness in
iort.c called the actual static validation helpers; the harness is not
part of this series.  The acpi_iort_bounds suite passed both tests,
covering invalid root offsets, truncated node and RMR payload extents,
and out-of-bounds RMR descriptor and ID-mapping arrays.

This did not exercise a platform-provided IORT table through the complete
boot-time discovery path.

Pengpeng Hou (2):
  ACPI: IORT: validate table and node extents before traversal
  ACPI: IORT: validate RMR node array extents

 drivers/acpi/arm64/iort.c | 117 +++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 8 deletions(-)


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.50.1 (Apple Git-155)


