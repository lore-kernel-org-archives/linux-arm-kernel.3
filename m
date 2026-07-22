Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D976BC4453E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoiK/RNeZLIkLzyKO8ly8OA0RZ+EXunPBVOADEEok6o=; b=fbwPe8jHJokmzc8FMHdD/qMs3U
	AsJbY5KZhaINmRYfoUl4D8p/41XYHXd3PVMyGdMURfiu7KlhvZdEf563Gy03pY/7Q6bg20eXlDfq8
	86Y7aqUl/VbkhhLpHtp+heAz0sbuEWtn9X4mJ4B9nnc5A/jdwjPujaxq8+3IlkPucyU+cWSWhVFNV
	NBEmd9IHRqgFJeirOYMArxbZOQow/PzqKOrtzO52W04D8bZ4DFG5yGdTY6XtnZKaIEw1eZ9eS62Ei
	B4ZeOHdbT980+FHvQ5LNE6CnedeR3r6pCS+mQ72dJt9xdSGdRZA7TXe+Diudy6SePvk5pewMOhs37
	Ce+V8LCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc2-0000000B78M-1ekW;
	Wed, 22 Jul 2026 07:43:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbY-0000000B6jP-19i4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:43:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A382660A67;
	Wed, 22 Jul 2026 07:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5736B1F00ACA;
	Wed, 22 Jul 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706179;
	bh=xoiK/RNeZLIkLzyKO8ly8OA0RZ+EXunPBVOADEEok6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mzJHohDVyI6P4ZJ4DQTUQLOatceS5eWJpoGlO6jAJTfihjhxEuPH5xdf0NgajRyRV
	 tM0g0Mir4HbL3zjmrbHx+nqNVO/lknikIg7cDf6epQPyO8aXrGRznyMZvfUZ5IBfNy
	 DJ8oB5lmQF9exHLYARxFayn9JvAXNMglEdUgFVoEYiSCRoOaQR/lsDYxatp5yrnMne
	 mC4zb1zxZ2KU72Ejx9v53rKN8+0IoAEdl0WpmnbhrYG4Hpf1FbItBeOdbWmayZ30l2
	 eMyrK62segb7uFkCAPYKFookTDfxnB1kTp5r50x/BQzLXdZTHtVlAK3aIzEGOoiiCF
	 nuXvkHpncyT2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbV-00000007VfN-2cJ6;
	Wed, 22 Jul 2026 07:42:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 15/28] arm64: Add ARM64_HAS_NV3 capability
Date: Wed, 22 Jul 2026 08:42:21 +0100
Message-ID: <20260722074234.3330999-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

As a bunch of KVM code is going to depend on FEAT_NV3 being detected
on the host, add a new capability that will describe it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/cpucaps | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 242dc211d8efa..7e0414509e89a 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -52,6 +52,7 @@ HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_NV2P1
+HAS_NV3
 HAS_BBML2_NOABORT
 HAS_PAN
 HAS_PMUV3
-- 
2.47.3


