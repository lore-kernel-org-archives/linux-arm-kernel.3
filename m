Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A80C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I0gaAQiTCyczO3ncCezb5gyuPU+lPv2PjdLi0Zqhbqc=; b=g4QwdANABgeQ8P
	Bt/xq8Pw3hEroObSfhDxGyzqX8Ja1F5sKni32vJg0wDqj+Tok8yAII9xGYWeE/CXwPG7GI98xtnud
	Z/WjXgn4K8vCS57BR0Q+inm6tWzy4QBV5yBNM88ip2IVhw4ZUduOCUv2GTjphwIvwEnjm+9QwBKQK
	XnoYICDWW8Q2CcYXuHDa4h9rv/ofRLCYaWojwXDvdw0PaxcN+s4O5aIDCPfnMN1oc6uVIycUqsnx0
	VhI88u8mRmIwEctT7cfBFaDFhPdf2c/YuhC/diIKpR11sd7gGJBvC0bkYIAKYePeN1oRb3Cgpb4zl
	MLeCpykI+sUqCtiZlcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpSK-00000002eze-3Eu0;
	Fri, 16 May 2025 07:26:08 +0000
Received: from mail-106112.protonmail.ch ([79.135.106.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpQA-00000002eeI-45Hn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 07:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380229; x=1747639429;
	bh=I0gaAQiTCyczO3ncCezb5gyuPU+lPv2PjdLi0Zqhbqc=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector:List-Unsubscribe:
	 List-Unsubscribe-Post;
	b=Wfv0YyVdLchPkUnIK0M+avpJNvN58EnjNoNpSoEZTOmUCO4mjJPKAiKvi50id2lAX
	 BY3/5NW5BLOfrYZNmr4gkwqGFe+ookF/EnRmzRbgzphtEY8lTBMPx4fMIfVXXoVIK8
	 oBeL2/AvEZ7nQsGh3fSXNeyYC9SYh1z4ZpTyBKT62To83iIbjdBmtq0tt+FMHKZu4U
	 Lgf57C5tCzXtlYrkABFZXNFKTfCe2ZHS7KqkuIbngH8qvd2mk5W4MUtUBew6PKsCaq
	 HR2yhIR8bNd8wk9aRzzgtm+lcfo/xhGwmDBkWS01CwCM5wUpoARRdrlKf4mePRTzN/
	 KRurX7U1PXbDQ==
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/5] rtc: Fix problems with missing UIE irqs
Date: Fri, 16 May 2025 09:23:34 +0200
Message-Id: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbnJmgC/32NQQ6CMBBFr0Jm7Zh2MFpdcQ/DgpQpzMJWWyQYw
 t0dOYDL93/e/ysUzsIFbtUKmWcpkqICHSrwYxcHRumVgQydLJka8+TxLRrnFwZZuGAgV7uLo94
 EB+o9M++FavdWeZQypfzZL2b7S/+tzRYNGkvuzL6/hjo0A3dRlqNPD2i3bfsCK1lv6bMAAAA=
X-Change-ID: 20241203-rtc-uie-irq-fixes-f2838782d0f8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=1695;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Yy3MHZ6ARWN2zLCp0cK5heR+syKaYF14s7J8YWFEFkM=;
 b=4D5F+hHT3AdVUK968VWXZzzw5RTJxQJ7n9KDgVYY3MaMqB+Na5Bre0xgMOSidQD0dBhHDQdMp
 o6YY0tSz1NvDJmXcJDheZayCHRFGVTBuYxKXr6V6sbbrtl5mNjB2hNW
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002355_954129_E7245BD1 
X-CRM114-Status: UNSURE (   9.34  )
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

This fixes a couple of different problems, that can cause RTC (alarm)
irqs to be missing when generating UIE interrupts.

The first commit fixes a long-standing problem, which has been
documented in a comment since 2010. This fixes a race that could cause
UIE irqs to stop being generated, which was easily reproduced by
timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.

The last commit ensures that RTC (alarm) irqs are enabled whenever
RTC_UIE_ON ioctl is used.

The driver specific commits avoids kernel warnings about unbalanced
enable_irq/disable_irq, which gets triggered on first RTC_UIE_ON with
the last commit. Before this series, the same warning should be seen
on initial RTC_AIE_ON with those drivers.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v2:
- Dropped patch for rtc-st-lpc driver.
- Link to v1: https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com

---
Esben Haabendal (5):
      rtc: interface: Fix long-standing race when setting alarm
      rtc: isl12022: Fix initial enable_irq/disable_irq balance
      rtc: cpcap: Fix initial enable_irq/disable_irq balance
      rtc: tps6586x: Fix initial enable_irq/disable_irq balance
      rtc: interface: Ensure alarm irq is enabled when UIE is enabled

 drivers/rtc/interface.c    | 27 +++++++++++++++++++++++++++
 drivers/rtc/rtc-cpcap.c    |  1 +
 drivers/rtc/rtc-isl12022.c |  1 +
 drivers/rtc/rtc-tps6586x.c |  1 +
 4 files changed, 30 insertions(+)
---
base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
change-id: 20241203-rtc-uie-irq-fixes-f2838782d0f8

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


