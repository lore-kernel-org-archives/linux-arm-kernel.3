Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE6C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCtkPh64URqfzLtOFUYSrdf1rzYh/Ra6ILeKu8+TICo=; b=sXOjCWlveuytSj7T0u+z3ojlPc
	lpgdYnjJ8KShwEBy2WnV1VtggPOvC5Kd5OGvudkSqrBnr7eztEoAxmm5DMwestZHfCukKw+PRpDZ2
	asgneHhZ9St9QUEFku+i6TJJm51U1hMex7Xzd5mUw3uQbLXDxy0Bod3oQHP8UxGRi7jcjuU7kThJ0
	lmeoKkb2q25KTDZnN0lFv3/ooQ0Xb4nyhJqRsJGeW5w1h/slpNvN9ORpC+AXvM2Np18EmQ9+ogUrS
	oho7y9tdFF/kOzToELWV7FkEV/hs3mUHgkW7FgNMsTIz74c9JRS7mKfHKE5njQcSHZlbd5Bbr9gTB
	NXdEm7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tica2-0000000BvXY-196B;
	Thu, 13 Feb 2025 17:00:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibtD-0000000BiwK-28pN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:16:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF1E826BA;
	Thu, 13 Feb 2025 08:16:55 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.32.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB54E3F6A8;
	Thu, 13 Feb 2025 08:16:30 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: [PATCH v7 25/45] KVM: arm64: WARN on injected undef exceptions
Date: Thu, 13 Feb 2025 16:14:05 +0000
Message-ID: <20250213161426.102987-26-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213161426.102987-1-steven.price@arm.com>
References: <20250213161426.102987-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_081635_589212_E828773B 
X-CRM114-Status: UNSURE (   6.83  )
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

The RMM doesn't allow injection of a undefined exception into a realm
guest. Add a WARN to catch if this ever happens.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v6:
 * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
---
 arch/arm64/kvm/inject_fault.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 2a9682b9834f..7dba6fc8c41d 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -226,6 +226,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
  */
 void kvm_inject_undefined(struct kvm_vcpu *vcpu)
 {
+	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");
 	if (vcpu_el1_is_32bit(vcpu))
 		inject_undef32(vcpu);
 	else
-- 
2.43.0


