Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B8CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybmoFOTqx8CgO8kzCFZ/99pdJt12xI1rX2JA8Bl4mm8=; b=e1Ljc8X//mptvNhhmNJRShtzwR
	Dd+AkkUwT1zJbJtaxa8TO3i9e8PrNVv5pY6rkj+BBMger9+MFn3gers9L7NkdPxuBJGFd0ou6AHPt
	QnGAzOBGgXFk0nv7CRVNXi07Mj/ogRZRA7gm86sLhcE67+iRb31Kk/SP4d1RUY8AbK8S+QVjrP1yK
	Eww8uYLATMBsEpYEDvOeTl4OB64BQ1liVVNtCL7bINDk40XypJ9OWNjQvw5hLhECNVPvP8pkw/PF8
	ZipAd+SaOdEngLxPgGiA9alFE3gKiUAf9kZH90/eJNJ5WvPfmyOPEu8+FhPzz8UJ5m8Vd/qK5R2GI
	oAi4/25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92o-00000004Dej-43oC;
	Sun, 09 Nov 2025 17:17:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91r-00000004CEp-2tFm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 908004173E;
	Sun,  9 Nov 2025 17:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D57AC4CEF8;
	Sun,  9 Nov 2025 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708599;
	bh=iGc9naSe/W6LWnKd6eu1yOG495ylzvyawIHdCwK7HB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYTp1I1+qCYFHPefGoYgIQcTanJlSvxbN+tL3OzL26Q/eUBQ2NZbBLhJRb9q7ndwQ
	 aPwkizyTInqDVoWID2Za1cr9Zz7vEyIK5I9Mxre+IL0oi90k318uijwf6uf2cLzrsn
	 d3TqNAA24+5jOOpLF7K2hyV73lariLFwVrBhBrmxH43WoGo+TYCfh8Nx3t/IKzmhO0
	 s3pi46NsvrlyAqZ06X/rj5L9NpKlFqH+abSCmLBgs4OM3QAHRvWqiyWB6TFO+dtB+u
	 xqBmCSC+9J+U2nc7WCWKMWtKyqXysyeSc2vL57X54yVq68irf409KaK9jROeccLuoW
	 ULup9dhwxpgHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91p-00000003exw-1Pl1;
	Sun, 09 Nov 2025 17:16:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 38/45] KVM: arm64: selftests: vgic_irq: Fix GUEST_ASSERT_IAR_EMPTY() helper
Date: Sun,  9 Nov 2025 17:16:12 +0000
Message-ID: <20251109171619.1507205-39-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091639_760383_3ED0675F 
X-CRM114-Status: GOOD (  11.04  )
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

No, 0 is not a spurious INTID. Never been, never was.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 6338f5bbdb705..a77562b2976ae 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -205,7 +205,7 @@ static void kvm_inject_call(kvm_inject_cmd cmd, uint32_t first_intid,
 do { 										\
 	uint32_t _intid;							\
 	_intid = gic_get_and_ack_irq();						\
-	GUEST_ASSERT(_intid == 0 || _intid == IAR_SPURIOUS);			\
+	GUEST_ASSERT(_intid == IAR_SPURIOUS);					\
 } while (0)
 
 #define CAT_HELPER(a, b) a ## b
-- 
2.47.3


