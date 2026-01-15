Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C397ED44C46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LfBzSpANqdHuLmwphkabgzcsNZxU8vpcfO2g5viHKks=; b=tCiDR4qlCyY/cp6hP94LdEJyBc
	Pk8ManDze7CGe6RS8GThn0RMekEgI7IN1HMXe0UCjjQetShZASW5qAU137i1ZUAZtAZqj9XU7Sskx
	rU+xOO2tdSqdFQ4YGWCPLj3eYFAptO7LvVzZGvtsxk+yVfSt2TErUMsQ4KIJS4kyrUv/tbnoufpTl
	xs2JWTwYTz44uersXDxFdWKZ/rgJUoHHExX/YJOzaXRWbIRMQ/ydC2bl7YffZPsmvVLTTsPpchcJd
	GJcwQFavrSIbjUAy1hag/+iAKMBVnKI6oZ1m6Fp2Nk9I9JKhdR0vc8wJ/siP7rIb+J0B6wjahohmT
	rRErIeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNBS-0000000COVE-1Rax;
	Thu, 15 Jan 2026 13:14:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNBQ-0000000COV1-3p4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AAA6601B2;
	Thu, 15 Jan 2026 13:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5E4C116D0;
	Thu, 15 Jan 2026 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768482879;
	bh=V3PyVuhXJCYy1r/dprjMiYGS0EpLNXI2zVZPFrpF0uA=;
	h=From:To:Cc:Subject:Date:From;
	b=l/hNTj1Pp4RmPs2K60Vk+nP2smXSDZq7cFeMNF5nHnfbTWC/uSr97J3lpi4s75b2U
	 dcznB22kZGQEJ625MD+kLHHQN6PFvACWFp/9F5jg5+ymdH80rZwArc3wgJ6G1bd4tk
	 PtY4/WgRN5zYlVXqb2Vsc8JT+e2dm7yzFNNFBctNUhZhx7IKtln5uAxK37ZdsUzPFj
	 1BzDvVnZjTn5Y55ssotDB4J6iw4WX4R7dLgNCWIqkIYAsZznx9QxPqGXOzCVgLr1qS
	 1xxM27dM54CpTDI5YFnC3nbPxuv988lKSBECRz/xtHwSUdhFHLZbs9jhJiiVFCLw8A
	 CfK7zAdvelk+A==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Udit Kumar <u-kumar1@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/2] Some minor fixes for the SMARC-sAM67 board
Date: Thu, 15 Jan 2026 14:14:17 +0100
Message-ID: <20260115131431.1521102-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch series contains two small fixes for the sa67 board. The
CMA patch will fix larger screen resolutions for accelerated
graphics for example.

Michael Walle (2):
  arm64: dts: ti: sa67: fix CMA node
  arm64: dts: ti: sa67: fix SD card regulator

 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.3


