Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70301061B09
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdLEEC6mdxs/zMzXZPnIvj6mdc9sBcQUja8IkH/IZd4=; b=lXvAoBHOU+jb58grqTq+hxyzIW
	LCBJ/hmhIG4c6c/6HjXvhCK+/cfee80jjdmJbs2rBZFmiSFYm7Ejl3C4OqJs2j0v3+ysDyne1irik
	LxVJ9/Q3IiE1O1RsDCrrWIvTjiM+7X1WJZWhkE4aj9OrI+Sf5KB084Bu2wL4bs1GgYkRA/2u7JbOP
	MBCOa4n6SPlPiUj5GpAFk1HThGlWkEaBnJeMqsL9+CkgOLf9kFx6xMQ0RXjrZldgXYNtpZgzS8cXb
	GTcXq2x87iqLA5huwF0lMq/gntT4R8hkDzo3n7Bw3ZVKQAVK7hjDGzr4TnO7GP0SmASHgRzsc2pep
	1BMsVu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dxh-0000000BUrl-13Ud;
	Mon, 30 Mar 2026 14:51:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DxC-0000000BURd-03ZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FF7F600CB;
	Mon, 30 Mar 2026 14:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64877C19423;
	Mon, 30 Mar 2026 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882257;
	bh=be2pSVdKYs2XTtccvYTydqz5T0J6rzFdyQOTW0pLEsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oyg9MfE+vcunsCwkvYXhi6h3LKwmFgkF7BoB+L+mzyJr6qgP0THDfAxmgBJw9hYWI
	 okQ58i3nQKTMMgjc364xxb9B1Gm5vm204rvSRjo9jqdTGiohRIXyHvIcxCt0a1n4IO
	 pE4Sj+0HPeITJIGi4o3oXrtD8DEbGwcGpdEASVCQCsTeVzTqMkL10Twaik1cF0dyLZ
	 TbYnolXBHeZY/JlHcKOJ+RKndhbllPLdFU/sn6fuM5nduqeYztHWxCkyaqGVzvSFgL
	 29+7CIoP2E6uPJHOQavK2/RhLZDfQj9samhpqcPESG1WGL9EhPrYGyKPTD8sbHRT7y
	 G4cg7Z/wvTSLA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 38/38] drivers/virt: pkvm: Add Kconfig dependency on DMA_RESTRICTED_POOL
Date: Mon, 30 Mar 2026 15:48:39 +0100
Message-ID: <20260330144841.26181-39-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
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

pKVM guests practically rely on CONFIG_DMA_RESTRICTED_POOL=y in order
to establish shared memory regions with the host for virtio buffers.

Make CONFIG_ARM_PKVM_GUEST depend on CONFIG_DMA_RESTRICTED_POOL to avoid
the inevitable segmentation faults experience if you have the former but
not the latter.

Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/virt/coco/pkvm-guest/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/Kconfig b/drivers/virt/coco/pkvm-guest/Kconfig
index d2f344f1f98f..928b8e1668cc 100644
--- a/drivers/virt/coco/pkvm-guest/Kconfig
+++ b/drivers/virt/coco/pkvm-guest/Kconfig
@@ -1,6 +1,6 @@
 config ARM_PKVM_GUEST
 	bool "Arm pKVM protected guest driver"
-	depends on ARM64
+	depends on ARM64 && DMA_RESTRICTED_POOL
 	help
 	  Protected guests running under the pKVM hypervisor on arm64
 	  are isolated from the host and must issue hypercalls to enable
-- 
2.53.0.1018.g2bb0e51243-goog


