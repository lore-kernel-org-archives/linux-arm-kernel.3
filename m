Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E457410ED67E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdLEEC6mdxs/zMzXZPnIvj6mdc9sBcQUja8IkH/IZd4=; b=yfHKNRs+5sPCo6b9GjYgULKPIe
	tMwAoQHY34i7dEP68U1fysfrWhPz6Lg+jmebHlRh5TSA5BWDYxW8DETwiADvKgMby/Hb8vajiXIf0
	qme8OHkIhvb4FQZFDvQahvFgWAktCIo4FlXASpKsvqhsbKxzKwhkpNi+xZsWgHOXJxN8TECoC+0yF
	kGYBM7KoYCL2X/oDirBWokavy23tkBeQkoMbiA56pXCraT3T9GjgviwJ6sjXdqQ42tklospKbU4ng
	fiFoo5DHA1kKbj9YIyoOrObNJUq4l8BGr+K1JIKp9Pj0DzDE8480ethnGHk4YlroDU/nAlDYErtT9
	C7PJ05bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67mx-00000007Xgq-3roN;
	Fri, 27 Mar 2026 14:03:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67m5-00000007X59-018p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B29860132;
	Fri, 27 Mar 2026 14:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5826CC19423;
	Fri, 27 Mar 2026 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620176;
	bh=be2pSVdKYs2XTtccvYTydqz5T0J6rzFdyQOTW0pLEsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rM+S9W/tuRvb49c7BWCDLqctBJVkG6x3Rqu7RZ6S1RkyEF6i9xr/aZLoqvQ8uaL03
	 iqpS+QZluJYiuIXV7f0ljEE3GHEXcFsUDE0AaeFqy4Xt0+885WI5W0Ob9ptNepEmbo
	 liFiT+uUIiwNo3faRMQTvJAAW8K4/IjxX+0N9hp7otssMqPp1lYJFaCsbd9s6w1HS9
	 ERWNIUdlJmtt3TXcEmKGAkbF2Rwzn+28zrd1F1taFzsClWdVchdE/8w+xeSJa1qddA
	 d/KAAufqvZJukOxQEgmt0jmJWO7UifVtrA8K2oDUPA7LGEY5uKfN2xHZyGAduFHOA9
	 fY3VrYssZWg0Q==
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
Subject: [PATCH v4 38/38] drivers/virt: pkvm: Add Kconfig dependency on DMA_RESTRICTED_POOL
Date: Fri, 27 Mar 2026 14:00:37 +0000
Message-ID: <20260327140039.21228-39-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
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


