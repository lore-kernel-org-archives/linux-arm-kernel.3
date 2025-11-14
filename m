Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11403CE8D50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEf4qjsPqgccn8cpFWcEAcL5pmW2QpFCxBxXZDBIyBo=; b=LEWRYmoa6HlfmHexH8ylcezl0A
	Y/uE8K3ppfLoVaC5YYGAyYQzxFU5sYL3WUcyZX/JPCYI6pacP59TCiCt+BAUPiQY1U3yRkuiuZ8ZG
	Qcake7bhETLh8x+/eLROevpd9MId0wj4HVdEqM10UQDa3nFw14OcS1P5yjhVmlO5KwCdx3RC931IB
	aexFvrSXNzspGGGFjoD6FERXVtL85gGJZDyzlNugYN8j7CVc5CgzDQ9EAOG1+F24x2qcQZs1bgIoV
	r4Pla5g+6JHe0gyn5z6Rqo+vDx8LfjFLJX13EzHtn62r68SfrIcmq7it+IoUS0fTywX70L/HIssyE
	oe6fkZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLA-0000000CfAJ-17IY;
	Fri, 14 Nov 2025 16:08:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL8-0000000Cf7n-0cAr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hEf4qjsPqgccn8cpFWcEAcL5pmW2QpFCxBxXZDBIyBo=; b=UL75MGzC6evSh7Ce9HjnFBsbor
	I2JXrJo29OBXvvSfAAmJuLQo3NekgbdjuPl5HoPA8JxDchXdTHvXcTLNAEP8+cHcm8tVawkbJzj/+
	VkOnglFqs0R2pyXLmfhtq30wTbceWdgvoZn6ZhPjWNwBRroZaWkInmlfRWG3kv2ul+2zcFOd9h56s
	cRsI9QTmRpQXxn+fY8RhPNAjFYdegpbSTJIPutijwXBgHIeJUJwtZls6JKkXiFSuUF4MQY9fqkqdG
	jdFHTj5+ceiIw6D9ybTprVZJX7SYyerY8trm/vDG1U7vTgqPu/1Vxgi04Bddy1/8BmToJ2LH4Grze
	PuB/fo6A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTQ-00000002vNY-2ohX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:12:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C492E1BB2;
	Fri, 14 Nov 2025 08:07:46 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4254E3F5A1;
	Fri, 14 Nov 2025 08:07:52 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 08/35] HACK! KVM: arm64: Enable SPE virtualization only in VHE mode
Date: Fri, 14 Nov 2025 16:06:49 +0000
Message-ID: <20251114160717.163230-9-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151228_907280_390B0B1C 
X-CRM114-Status: UNSURE (   9.30  )
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

For RFC only.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/spe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 7e38f7d9075b..101258b55053 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -24,8 +24,8 @@ void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
 {
 	struct arm_spu_entry *entry;
 
-	/* TODO: pKVM support */
-	if (is_protected_kvm_enabled())
+	/* TODO: pKVM and nVHE support */
+	if (is_protected_kvm_enabled() || !has_vhe())
 		return;
 
 	guard(mutex)(&arm_spus_lock);
-- 
2.51.2


