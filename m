Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A4CC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w68nXYhO8w1Z+UFacTP/9xoe54ZOVhy0dTj5FdmDPus=; b=QHIKuTKaIB3cMdMMbmpMf9F+Ql
	fTrGcJpSN61h3jtonsn5qJm8bS/eXfK7X4gRYeclukgrSnap9FqpMaZGCmSJC7JbTGvem5aV/HG1p
	hB+5xEnIZU0fps4LwWVvyjJgjZCqNyRHAIoEXr1wFthf1IwEPT7Cr09gZQsGpDPtp7kP+vERuIhFG
	Bt210sdadNf8w2ri9hxaQw0Uia91xW50IfirqdKc5cwRm50Vwn5HQgwUDh7YGCdQs/x9VJCq6v1KZ
	p32VV4NQEUYD6n64U3/uVGm2RwZE7pbIXCusf8b/MKHkzMGPcrBYx786cy+DCI5+sEWpD3Mk1xwWC
	VZ7/zDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3MA-0000000Bi0p-2QvY;
	Fri, 28 Feb 2025 16:36:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3HV-0000000BgAt-3JbL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44EE85C67CC;
	Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB783C4CED6;
	Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740760328;
	bh=QxKE/vnJMWgW3Fp9S6RUPUhxvfrYA/OhRaJWoXg5OT0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=E5/ReRPm3Hx56j0Y7VqvCQBpbaRGUJITQD3WoknMWBf0wvJkoloKeklZwhdIDfo2p
	 LtWbj134LSWzcyvZpjbeMNKg1uEpkzpp45OzzNgmSoMpaPftc2iC4AVraoBiV6J3Vd
	 VoWEyfKcPSrZR/l/Jg9VOAfWzjNd1htHqXQMKjcD0zF+ehx4fiof/Orou/vj2E6D5n
	 yr1tZELClvsO7uj3gpY3oWTmCICE0XKeqG2+gOywuZYfdmdNwGtQzs0r+QB20s/5c0
	 +V09pCNaGYb0nITGTPH2lizR4o622/1T4TVnlmAsQx8eRooKfUoWSCh8JneNxx9w+b
	 IiGoQezo2Dt1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBF1C282C1;
	Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] iommu: apple-dart: Support the ISP DART
Date: Fri, 28 Feb 2025 17:32:06 +0100
Message-Id: <20250228-isp-dart-v2-0-0ead81a90e2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAblwWcC/23MQQ6CMBCF4auQWVvTqViFlfcwLEqZwiRCSUsaD
 endraxd/i8v3w6RAlOEttohUOLIfimhThXYySwjCR5Kg5LqKpW6CY6rGEzYhLtfdNMbQ7ZHKPc
 1kOP3QT270hPHzYfPISf8rX+QhEIK1EgNkqtdrR/jbPh1tn6GLuf8BTf5WjagAAAA
X-Change-ID: 20250227-isp-dart-f8369baaecb1
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740760327; l=820;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=QxKE/vnJMWgW3Fp9S6RUPUhxvfrYA/OhRaJWoXg5OT0=;
 b=NkWNCpfcMNwzWsbnSKE+X1A1U4WmVG9Nd2rgKOi5zpr713ES47sa+Vb6FYzPoD6/JrAn/oHg5
 H7rwQkMQBQiB4NsAeu4cBz9ysy5g2QqS+7KaiGZ/StIiAE3RJ4QPQ1R
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_083209_874736_225355E0 
X-CRM114-Status: UNSURE (   7.49  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The ISP block has 3 linked DARTs with mismatched bypass support.
This series adds support for this setup.

(The ISP driver itself is sent as a separate series
https://lore.kernel.org/asahi/20250219-isp-v1-0-6d3e89b67c31@gmail.com/T/ )

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- Made comments and code a closer match for each other
- Link to v1: https://lore.kernel.org/r/20250227-isp-dart-v1-0-161e91ef4f46@gmail.com

---
Hector Martin (2):
      iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to 3
      iommu: apple-dart: Allow mismatched bypass support

 drivers/iommu/apple-dart.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
---
base-commit: dd83757f6e686a2188997cb58b5975f744bb7786
change-id: 20250227-isp-dart-f8369baaecb1



