Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39DCCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/u4jReseop0/bCsd+wYtyXTYZOtdfFVumMqa5wsKfA=; b=Du5Kw23A3w/jYTdLt4CvB/toTe
	lyftGxCA2wVg+4D3CaUcXAtysSoiJQLxFabephGzZZsto1fD4kLY8YM9TBB2kaR/iV1LUX8sZsBJD
	wvkK+d4fWV0uxgkiFG+6IYvTwVsPhASiaCKBwBzOlK1VZl6yvB9OulctmImd4I0zd17VpdZ+vpdfP
	GL1ehk4eOBmDcokVZ2qxV4GqY9mHXES6oD/OrqWUK+elcVa41ywqZ4Rd1y4pGYI3MDqVb/oI5qu+I
	4lChC6vnj60ubg5PveZSaFR6RnMjplxkp2Dj+PPmLB+rvOr4UC+v7dHni7NgO8ProYGcKEN+TiRnN
	nyjS+cVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNV-00000004BME-3GBg;
	Wed, 08 Oct 2025 15:46:57 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNO-00000004BDg-0fZH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759938398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d/u4jReseop0/bCsd+wYtyXTYZOtdfFVumMqa5wsKfA=;
	b=rcezhYdoDGbo67O7mVxNiF7OAuu7Nr92tcfx/Beh0AJb5OvqT3NVpzQHtTaJa812Vsxe//
	iXJD/VxrdptNvozqNBMxTEvuw7seNY6W4OXD0/hcgA0ee6uFOJxCJ3b2vOOAz0qF5rwOM+
	1FyyfI2En61qXOJzc+HmFWrkVGleibQ=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] KVM: arm64: selftests: Allocate vcpus with correct size
Date: Wed,  8 Oct 2025 23:45:20 +0800
Message-Id: <20251008154520.54801-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084650_499580_2E99C74E 
X-CRM114-Status: UNSURE (   8.91  )
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

vcpus array contains pointers to struct kvm_vcpu {}. It is way overkill
to allocate the array with (nr_cpus * sizeof(struct kvm_vcpu)). Fix the
allocation by using the correct size.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 87922a89b134..b134a304f0a6 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -331,7 +331,7 @@ static void setup_vm(void)
 {
 	int i;
 
-	vcpus = malloc(test_data.nr_cpus * sizeof(struct kvm_vcpu));
+	vcpus = malloc(test_data.nr_cpus * sizeof(struct kvm_vcpu *));
 	TEST_ASSERT(vcpus, "Failed to allocate vCPU array");
 
 	vm = vm_create_with_vcpus(test_data.nr_cpus, guest_code, vcpus);
-- 
2.34.1


