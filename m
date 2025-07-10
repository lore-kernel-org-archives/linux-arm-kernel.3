Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E06C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lh/UiYPOzQ6FOM3o+zdXpoViuM1cgTXaa4MU/+0hqBQ=; b=bbDWc1JDkWuIPw
	qhVATqDzK53DmFklYPs1A6ETGrEpey8u2PhyMwrWjbJ2Gm27J4USAdDjUAgJX5DCdfkz2LI05s47V
	tdD7fjwIdJOVvx2RsoVyYPdGd4EYRjqIFCq/2ZQtBayvk19uTKReJKZ299e9A7i89M4EozyvtW/se
	Lw6PKUENZTs6B+8n2zN3tScWylOs7jBqmJuzyX+lcer+OJlP9usDCRN1ufZVagwcUptaal2akQ/fI
	cvEgZo3Ir18vUZ/mE3J/LapC7bjHN83Z0/Psqip5JJ/x5nVO9TOby+JiiRDdje5ecy+4OGzHjOxxc
	Auek9d8seSc4L+unmAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwp2-0000000CoAY-232r;
	Thu, 10 Jul 2025 19:20:44 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuU7-0000000CVMc-3hW3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:51:01 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=WFxwfdD04n3wF7wZ9j6WuJLs6nwkzhfBs4SMxgQZRUPrlueXnyEX+72EFcAfq0lt60XYtPo0g5ieN7On3OUT+48TV9/j7SCEn9s/gXzA3KxTWVdzcMdYu4J4IuuTiXGpmOY7PBMCr7VB8h2knKu3XldRP/bSEVVMFeJQyqObSLykJHcAaAZ8/yjOiuE2djMVMlbDX0gs4+s4KNELYrTH9NUwICUpEFCcEWrho2hVt2IBk8NzsCQucmCOxdsh5ezf1udT44PKLWl791tVIBop/lnDSKWBzD46tl+aJvunPZbuIziQhejDrEhqeFW/kCAv5CAKVRSG9LkjaF+0NpaAbw==; s=purelymail3; d=purelymail.com; v=1; bh=IBymJfzBstz1MeeVPUcDhdidBI0tA5+7Lk35AymMU+U=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:36 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add watchdog and USB nodes for the Exynos990 SoC
Date: Thu, 10 Jul 2025 18:50:04 +0200
Message-Id: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzvb2gC/x3MQQqDQAxA0atI1gbGkdqmVxEX2sQ2ImOZqCji3
 R1cvsX/B5hEFYN3dkCUVU2nkODzDD6/NnwFlZPBO/9wz8JhFJPAhsMy7ijbHiYjcsgzFlxR2bU
 v4o4g9f8ovW73u27O8wLFMmEfawAAAA==
X-Change-ID: 20250710-resends-july-exynos990-dt-1d693ba89db9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1589;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=IBymJfzBstz1MeeVPUcDhdidBI0tA5+7Lk35AymMU+U=;
 b=dqv4xyGid0KGhulrr1Be+8DqEJEvXiyNT93jtGJCN52SJo3WWH1LR3kT4HIlGmVj69QxZZRdt
 sqyqFf2dft4AxVwIaoabt5T/xFJAf2twVuwc0SQCk+T0w2e2fHW/mXh
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_095100_026371_F674E92E 
X-CRM114-Status: UNSURE (   9.47  )
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

Hi all!

This series adds the nodes to enable the watchdog and USB support for
the Exynos990 SoC.

The watchdog consists of two clusters (cl0 and cl2). Unsure why Samsung has
skipped cl1 on this SoC. Both are enabled and working - tested on a
device from the -x1s family.

The USB controller of this SoC supports full-speed, high-speed and
super-speed operation modes. Due to my inability to get any of my
Exynos990 devices to enumerate as super-speed (even under the vendor
kernels) only the UTMI+ setup is done - as such, only the high-speed
mode is enabled. Dummy regulators are used in place of PMIC provided
ones until we implement PMIC.

Changes in V2:
 - reordered USB DWC3 glue node and PHY node (sorted by address).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (5):
      arm64: dts: exynos990: Enable watchdog timer
      arm64: dts: exynos990: Add USB nodes
      arm64: dts: exynos990-x1s-common: Enable USB
      arm64: dts: exynos990-c1s: Enable USB
      arm64: dts: exynos990-r8s: Enable USB

 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       | 16 +++++++
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 16 +++++++
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      | 16 +++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 55 ++++++++++++++++++++++
 4 files changed, 103 insertions(+)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-resends-july-exynos990-dt-1d693ba89db9

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


