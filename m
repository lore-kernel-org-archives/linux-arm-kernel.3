Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399A8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0pPIRQdj1vm03hv4wPP15q5GCtEOlFeScwiKi80rLM=; b=TupDboDlK1JT4R
	eSxuW7yjMRRa8h3PQONKWquuwYkOZTwIdU13z/vTbsdQvgXMQ1pcrT8kpgy7Viw2d8NVlUV5fE722
	o7wzLmIuw4+azpvMiquCjyKfPHve7E6hNsdiVo6TOSBIBNNI4jkOWJ76aWaCM7bbAYyu2p6fr9s71
	bd/xnL5N4Zj30AzySWTzihKykRYZv1wgsBEKASfkOuWrbgqKrsFgBWk3/fnPLYJzdxZLoO3aQ/duH
	0SiiImvMZORwPeDcp9GpURvD3ARi3D5MoHx/Q/zNM/+WB+xCtcVeKYM94JcRdADAl6cbaIWLw//3i
	pKfyR5jXodZ0uJtCvimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkhh-00000005CaB-0dMl;
	Fri, 01 Aug 2025 08:01:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkf4-00000005BnP-2CL7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 07:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54955A55710;
	Fri,  1 Aug 2025 07:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3009C4CEE7;
	Fri,  1 Aug 2025 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754035120;
	bh=ljibB/ctJYFLkO9vQS1KGFA64OMGWVieVJTPRuAfKhU=;
	h=From:Subject:Date:To:Cc:From;
	b=j/bAdO6tAieIMYHyfxqtpt4IUoDEIGaiH1k8+Tbu9WvYd8YfEe6JyWuTlLttNdndo
	 YRYmTiGZzyc4zWwkbLyJaM7VC0c3ncWSMxGo36qo6czTBKkWH1MSAJjVaLXxbFX3pX
	 K9jmMYBXp/KfnHLEbsQNvZG0Fc5bHExQRd2O+BZY9iSJEbODj42VcjHmhvan6ELQMV
	 ykaMo7aNghki2zgp3DnTbFbJeeLstt/uBjIjAWNavki0DktTKb/HYOv14xP7k9JXJE
	 Z+B9xfOs2xHdJ9y9VO57z7o2e2pqcD6V0BIfdH6IPJMMj/R44rLXnTN8HoTHhxBx4V
	 CaBuI7VFOHpwg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 0/3] irqchip/gic-v5: Minor clean-ups/fixes
Date: Fri, 01 Aug 2025 09:58:17 +0200
Message-Id: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlzjGgC/x3LQQqAIBBA0avIrBtQy8SuEi3EJpuNhUIE4t2Tl
 o/Pr1AoMxVYRIVMDxe+UocaBITTp0jIezdoqY20o8LIAR+DB79UcEZl0U2OPI3BGDdB/+5Mf+3
 burX2ASzeG7BjAAAA
X-Change-ID: 20250731-gic-v5-fixes-6-17-949eae3c5594
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_005842_631394_1E3348B4 
X-CRM114-Status: GOOD (  10.38  )
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

A trivial fix for a kbot reported issue and two clean-ups
discovered after the initial series was queued for v6.17;
now that the driver code is merged I am sharing them.

Only patch (1) is a fix, the two others are cleaning the code up
and removing useless constructs.

The series apply cleanly on top of this three-patch series [1] fixing
some exit path issues with the gic-v5 driver that should also
be considered for merging please (I reviewed it and tested it [2]):

[1] https://lore.kernel.org/lkml/670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain/
[2] https://lore.kernel.org/lkml/aHoU8sKPuyzEFRIn@lpieralisi/

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Lorenzo Pieralisi (3):
      irqchip/gic-v5: iwb: Fix iounmap probe failure path
      irqchip/gic-v5: iwb: Remove module boilerplate
      irqchip/gic-v5: Remove IRQD_RESEND_WHEN_IN_PROGRESS for ITS IRQs

 drivers/irqchip/irq-gic-v5-its.c |  1 -
 drivers/irqchip/irq-gic-v5-iwb.c | 14 +++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)
---
base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
change-id: 20250731-gic-v5-fixes-6-17-949eae3c5594

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>


