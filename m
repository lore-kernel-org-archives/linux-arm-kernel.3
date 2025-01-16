Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA96C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qF7XVPlipkzKdph9jZxT3W8mqripIYXZ72T/UKR/R3A=; b=oPsOAYS2ufGI7n06q+jF/zrxUx
	5EkOVf5GVuiUOakH2UQgxdbZY6n6v1A2dk0PNxHiIvKGQ3Cc6M+XzTC8hm0H3DU9J7SIQWPRaMTsr
	0iDUSyarNhYSkAGfTN2SBgHo3KIGAnQMrBOY3S2GvlOHAg74GxFOOTq2sW6hwqwPX/JHFRhZvdb8k
	EGCIK9B2GwpgF1jZttYgtqLMTUcrXCz/ZtkLe/E6hFGQnwl/5mJEaHvCiND1feSHXu/ZPaGJlE8Nw
	wcMGe5hw2qSwns4aIn7Aony0ufrgJhMerB4kIus6CmN+MfLRFKvkzLXETnOqXbu8KvR1zTUeSbPQ4
	UNAQkJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYa9-0000000GES0-1vdj;
	Thu, 16 Jan 2025 22:43:21 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYYq-0000000GEB5-28fh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:42:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737067315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qF7XVPlipkzKdph9jZxT3W8mqripIYXZ72T/UKR/R3A=;
	b=iNSCLc7QkrgYa8T2Zn0XXzuXEKed8oSiPdHScp/VAbQF9hsSAGd8C9dWx5iNCNgz+fgqrE
	AMlK38cdxEIP80fJJOIvlt6zu/OJv6OHLdpY1mUnSm1i86cB42bl8DJ33/+bX/spac52wj
	S/lcuEKweYxHzTAZuk534DLc9tcck30=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/5] spi: zynqmp-gqspi: Clean up the driver a bit
Date: Thu, 16 Jan 2025 17:41:25 -0500
Message-Id: <20250116224130.2684544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144200_829036_DBFD736F 
X-CRM114-Status: UNSURE (   4.71  )
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

Here are a few mostly independent cleanups I came up with while writing
some other patches. Feel free to apply them in piecemeal if you like.


Sean Anderson (5):
  spi: zynqmp-gqspi: Reformat long line
  spi: zynqmp-gqspi: Add some more debug prints
  spi: zynqmp-gqspi: Add helpers for enabling/disabling DMA
  spi: zynqmp-gqspi: Clean up fillgenfifo
  spi: zynqmp-gqspi: Always acknowledge interrupts

 drivers/spi/spi-zynqmp-gqspi.c | 167 +++++++++++++++------------------
 1 file changed, 76 insertions(+), 91 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


