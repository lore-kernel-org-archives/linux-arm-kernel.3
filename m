Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87689C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y/AUNQnm7BznYAVMzOtTQX8NgYTNjyMXwi3FRym/v80=; b=vyeHiS80ekKplS
	BztUR2bF6obY8MKUWTOe93qSwk/abM7pCT0IGj3N86olpqs79lz3YSnVQAxwl9+g4MxelINTp/lyl
	oCeDdDmCzm0PaXOOIU40owsPCRoB1+YN+PqFHh8R1MwqcmVeaFFcbPmuUL8nZ830wTpY5H18Q3I8W
	aD06kzwraZHKYJbM8yXTbTV7xNvQNvKIXe7xlXhKr+nk0dFJdXp/Y+C11Z3gfUo4ONPXfU4MutUBv
	5shGMIEJgHyBjXUKK6ab482goZg1k+Vm054iWTH4zw30S7EdFKj/SEyo9DI8/ceaG4Nh7nHFqj6l9
	UCWdQeOT2Ih09BITT7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeXw-00000002CIU-1pEO;
	Sun, 15 Jun 2025 04:00:40 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVa-00000002BsG-3D7C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:19 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:03 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:03 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/8] Aspeed SDHCI driver workaround and auto tune
Date: Sun, 15 Jun 2025 11:57:55 +0800
Message-ID: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205814_805926_BB70ABD3 
X-CRM114-Status: UNSURE (   4.87  )
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

The purpose of this patch series is to workaround that the
Aspeed SDHCI software reset can't be cleared issue, and to add runtime
tuning and sdr50 support. The runtime tuning is to improve the
compatibility of the sdhci driver with different MMC cards.

Cool Lee (8):
  mmc: sdhci-of-aspeed: Fix sdhci software reset can't be cleared issue.
  mmc: sdhci-of-aspeed: Add runtime tuning
  mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register missing after top
    reset
  mmc: sdhci-of-aspeed: Get max clockk by using default api
  mmc: sdhci-of-aspeed: Fix null pointer
  mmc: sdhci-of-aspeed: Add output timing phase tuning
  mmc: sdhci-of-aspeed: Remove timing phase
  mmc: sdhci-of-aspeed: Add sdr50 support

 drivers/mmc/host/sdhci-of-aspeed.c | 370 ++++++++++++++---------------
 1 file changed, 183 insertions(+), 187 deletions(-)

--
2.34.1

