Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BA6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QrdXa6QaEm90F4G0qbOOPSMyPGC19cRpviSHrPym6A=; b=D1KZ+cFgh5Y3wn1SSvnFgNv7kJ
	9ujYGYjqfYayKLRz9Zr7i/huea2gh5a17RcV4h1FFp2wlH8/2NKDwrR8bY84OXK8h3zhmRHuVrq8G
	1cp7vsnKEKBPX/369sigLs1y9yJSgmmOgdXkSN5iRtpMtiRoKN9mECnKS0Y+iLhk6ecZfMJXZtBFQ
	ez4CFT7Yvuszv+RtN7NlvrWTTj/5HCDO0TwVjz6gCc2hUULr1Df1pXcWyq0W4aaQBaLrAxk80jiQB
	rcw9iCtaDu8R766bGdVsfCKwYAHILmb7pOzPt+FqO65YgpRkBPGa01w3ykNaRPmuWn8SK6LiEP2oh
	hLsEPyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI935-00000004E3I-2Qz1;
	Sun, 09 Nov 2025 17:17:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91s-00000004CF5-3E5F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2810446DB;
	Sun,  9 Nov 2025 17:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78407C19423;
	Sun,  9 Nov 2025 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708600;
	bh=yCGc4NjwNDiVZR7+j2n7RKZ3zFae6MLydrXdq+o2Jsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfDvxsOLie7nQPjsPwt8mfGeoQE7c6FRFDLWuMHLfu/7UHsCWuz2iO2NYWnxEdOBn
	 PT5RnDPIdubZySmK7FcpQcmzJWDK+fs5qAHR89KsyNvSjv6/bvXDbLDwZBi0oezajG
	 cI4BWFDxXVKlYDj4xdnj3IRkXdBH4vP8yQyU9IFpqkF05kZ7Pu5Xs9rduGqHqdJkJg
	 gpLGsJRyvVC2Paigv4zE4ZI8g3xCJ/s2wx4r6HzskdgfTCXFISFiP214gifGAWBZb7
	 87XFSKPEVhtePvGjxXc493Sjn/I3yXfx9Aod6OM8ZUyavmd/z9OJAunzyQa6b/hCDv
	 xfpbb9osuLxrA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91q-00000003exw-2Oel;
	Sun, 09 Nov 2025 17:16:38 +0000
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
Subject: [PATCH v2 42/45] KVM: arm64: selftests: vgic_irq: Perform EOImode==1 deactivation in ack order
Date: Sun,  9 Nov 2025 17:16:16 +0000
Message-ID: <20251109171619.1507205-43-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091640_930014_3AFED7A2 
X-CRM114-Status: GOOD (  12.97  )
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

When EOImode==1, perform the deactivation in the order of activation,
just to make things a bit worse for KVM. Yes, I'm nasty.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 9d4761f1a3204..72f7bb0d201e5 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -400,8 +400,18 @@ static void test_inject_preemption(struct test_args *args,
 			continue;
 
 		gic_set_eoi(intid);
-		if (args->eoi_split)
-			gic_set_dir(intid);
+	}
+
+	if (args->eoi_split) {
+		for (i = 0; i < num; i++) {
+			intid = i + first_intid;
+
+			if (exclude && test_bit(i, exclude))
+				continue;
+
+			if (args->eoi_split)
+				gic_set_dir(intid);
+		}
 	}
 
 	local_irq_enable();
-- 
2.47.3


