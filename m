Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01233CA5FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZk6BBvw065lfZ4Zznk2HcUwwULFbdr/ghoctd81Q0w=; b=tHNqln0/y4RF9mqkj/uLWX2WxQ
	CKuKZ0UMPsSGI7wE0NyJSvzQKza6It0RPFIsOIMGPHEFxyp65jnntqMzcIKSfrqjhRkHIarHj3kMU
	NrE+o4DSm+ll4dMtbNyux6xEJQtR02RGXIQ+MKeLIKRSWxAOp0gzAM/01whlhb6lXV16xrRIxHJAf
	RZJ4ko7Do1/5lcZeQnibsCAuJgNTAMN4pzKl63Fop7+VfApjR6Qn+b7IDZgQ0SkHp2Lld5KqJNecT
	LZ9ODHeI5RJUG/B3R0MqSroADToWtyF1d72fRGpCeZyLYG5TGyTJ5U0ynmOChi/j2VD24wNSeckbM
	QrtaRD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDF1-00000000tdn-2BLw;
	Mon, 28 Sep 2026 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEv-00000000tav-4BEg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZZk6BBvw065lfZ4Zznk2HcUwwULFbdr/ghoctd81Q0w=; b=oqNdt3gi0ZKIfC7x6K1Jwmoful
	Rzs+kyS2ay3GZaKP28twRpvuH3ySZbrBdWIbOZ8mf+CtHAxzUEBHe6A9/9cLze+D7lNDGpHNQG2RH
	gMdburpejJ6I6vHVyYlvE+NdqnDciILh1YpPHyIF67LtT50IHsZCVwrDIu5UIEYex/2dvv+XVjfSX
	GUDHOBSiIkarxhpEnSStHt9lAbm6yiW6f5XaeGAqVDeC70ni1Q/Y6cfSjVbvwSnRMNQ9eS8qbWx87
	xZ4CrzRvTiOg6ydwwQny+Q6wJvyrQ8ay7HKocW2uoLwIP7zXfOU77ORWsAT+g1t7GH/ptUMUl8sHq
	FgTJAlBw==;
Received: from out-96.mta1.migadu.com ([2001:41d0:203:375::60] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBDEt-00000001clF-0Z3N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4CRRZjkC/vJWP/qd9Q/7VyTKTlYxIPQ8NjIByQMRmVg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609157; v=1; x=1791213957;
 b=juseSFbDLvdYE+U7VKuSi0P0zyIkyPKbOuvO033G6iVxSYrxLjS0iPlPbVV5N0bS9AFb1+Ah
 2IwFiyjEq/hRrBBtub7QHJdVdZ/ql7kzDpWOoFcTc5NCCxds6qRtCjEKauVzOctoa/tytsBET2z
 ObfnAPXG49MD9XHPOpSUjBgM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f6782b16b2001397;
	Mon, 28 Sep 2026 15:25:57 +0000
X-Mizu-Trace-ID: f6782b16b2001397
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/10] Documentation: KVM: Fix the name of the SMCCC filter attribute
Date: Mon, 28 Sep 2026 16:25:03 +0100
Message-Id: <20260928152507.2116110-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162559_406623_D827A4D8 
X-CRM114-Status: GOOD (  13.33  )
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

api.rst refers to the SMCCC filter as KVM_ARM_SMCCC_FILTER, a name that
exists nowhere else. The attribute is KVM_ARM_VM_SMCCC_FILTER.

Fixes: 821d935c87bc9 ("KVM: arm64: Introduce support for userspace SMCCC filtering")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9e..fabb1d4bf8f8d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6873,7 +6873,7 @@ For arm64:
 
 SMCCC exits can be enabled depending on the configuration of the SMCCC
 filter. See the Documentation/virt/kvm/devices/vm.rst
-``KVM_ARM_SMCCC_FILTER`` for more details.
+``KVM_ARM_VM_SMCCC_FILTER`` for more details.
 
 ``nr`` contains the function ID of the guest's SMCCC call. Userspace is
 expected to use the ``KVM_GET_ONE_REG`` ioctl to retrieve the call
-- 
2.39.5


