Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA11D49C91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1wZiyfMx8IVzYEySroLrCqNqngfCfq32/pkqb6D23M=; b=pSEp5VZOOKv09nBcPo1CX+mElu
	dS2xEuip3KEwgCbUjVOo2f9louCBJ3g5e6brqEXOaOAKlqAHiXJUvZKPVcpSvChqJLkG3s+MIndIo
	7EreOAQ0xcnZ7w5qbSjFn+aLuSq77NxgKBodNaVn2RMxCq1Lz2cAtMLQiOLoyDjrfGDTFxg9TTMit
	gssACpZ8qd6KxugC80aGoyh36Pbd0T5yCV6PoascmSP+MQPYqmUGNzcQFQzCirmiH7A/18ZKLB9M2
	Skuj8ysOOxmAsDf44iZmx/WuFElYys+VuG8AAM7ZmYMWOh84ceVI3/UuVV4XaNi7cHln6ODwiw9Pv
	o5Uod3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllCz-00000001Hov-3uY3;
	Fri, 30 Jan 2026 09:54:33 +0000
Received: from mail-m3281.qiye.163.com ([220.197.32.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllCw-00000001HoZ-1Nv5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 09:54:31 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 328f6f4d9;
	Fri, 30 Jan 2026 17:54:18 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Arnd Bergmann <arnd@arndb.de>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] mmc: add support for BST C1200 SDHCI controller
Date: Fri, 30 Jan 2026 17:54:17 +0800
Message-ID: <20260130095417.2113714-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPDyKFroOi-7Dir_H2fPX9Ne6zFeM4=XD0eMMrX+iJ_si1n2sA@mail.gmail.com>
References: <CAPDyKFroOi-7Dir_H2fPX9Ne6zFeM4=XD0eMMrX+iJ_si1n2sA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c0e532e3809cckunmaa8a7f704391b3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxgdVh0ZTRpMGh9MHk9MSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=UMuHSfAk0aAdu1IEeRFzrjjsTO4tF2s6Mr3JysqxA/5Ua77xzrxshI/989J05RQqEDYScm/hFW4VTh+7jyioRGcQlAJ+TYZOBw5ogjv928dHxWM/zucPPjTafXmgM36L3kuhspp6+cAyIfXeLKSydnQdMZ0A7yE/0g+104mgxXw=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=n1wZiyfMx8IVzYEySroLrCqNqngfCfq32/pkqb6D23M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_015430_692443_4E173078 
X-CRM114-Status: UNSURE (   7.63  )
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

Hi Ulf,

On Tue, 27 Jan 2026 at 12:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Patch 1 to 3 and patch 6 applied for next, thanks!
>
> The DTS patches (patch 4 and patch 5) should be picked up by the SoC maintainer.

Thank you for the review!

I will send the DTS and defconfig patches (original v5 patches 4 and 5)
separately to the SoC maintainers as a v6 series.

Best regards,
Albert

