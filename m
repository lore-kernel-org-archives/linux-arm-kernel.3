Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4266FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ug66WCakXjH83Brxboy0EDB2x6D7qH0J/OI0+dW8vQ8=; b=yuSmP00M7WZtC+ayXw6bhtKt40
	f2no329I5aKTt/EKCyOE/IE48s1jhDcpSdRY00ThEwe/EyUOmKWZ7LB86FXXbPd8V+jWzhdsmbI1U
	14+ZAOV6WCkPNfVnAPhg9+JvXZjEIpdQYCc44hxg7u98yrvHmPlA1aYC04Ei2H3q8dCurudmQd5hZ
	avMiBSV5NZZf3zlFwd2BrlMyerzbBWdcpm/npp8TdRcP0vbg+Ub1voZMZOA1OOGxbl3BUgwH1v/v+
	QlM1r7HKUxzuAi+udg9itSGL5COXtD1U8M3MtkOivnDZ1C6SN5L11Mx7VjYo+RxEioOxjEdhz7bZD
	9yas5wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDehD-0000000FxbK-3ra7;
	Mon, 05 Oct 2026 09:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDehA-0000000FxVh-42hL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 Oct 2026 09:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ug66WCakXjH83Brxboy0EDB2x6D7qH0J/OI0+dW8vQ8=; b=SxHksvvZ3Udl/M7EPSzUJ81AsR
	s1HYiZhTGExmBj2IPqWnO1/Gex4QWS41RHIPX9mE2MbhQOQRYxVxg8f/2psqQj+JnZEaI87jSKzzU
	kViuOY6kzmnU/yXQcTRGbxFZTsESAdcqLZzEVo1KSfh/heJjUhhLppcFGx8UU9geaeuGbMETsmY7W
	YbicQmBwkfsHvLQ45gZKdUnRH+7RUVpC4MlwOsGoepaKJo3G3n7RzuNrCZdg+raKZ0kmh1kFPTWj+
	uJa/8kf1ks8eAwU87ZeXisOKcYjY+GWLtt5XyonK9jzKTlkhtJz3TvRkyfFGGMo68agVUcyPXYG6m
	Y3WDHDAA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDeh7-00000007kr7-3v33
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:09:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73D271576;
	Mon,  5 Oct 2026 02:09:09 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAB6F3F66F;
	Mon,  5 Oct 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191352; bh=frlcBi4UAJkigcKVYvolRUhfFy/cS93/gSL/61U+fGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrQD3DOBUSM8hClpoJ04HoHHlaWTeJhj5DYEHEczvovU/Z4gxBno/s90OWtykcQpJ
	 8OKILVi9/lnuwU92XUVE90vh/qmnQaKgX9f5/r06t/V2seR9ZRHJyF4Jv2DeiJRqQR
	 tRnF88rnQYJW+U0Zfcu0Oq/A8MqcCTfBXwwOsXb0=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 20/23] KVM: arm64: CCA: WARN on injected undef exceptions
Date: Mon,  5 Oct 2026 10:07:51 +0100
Message-ID: <20261005090754.2140522-21-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_100914_248412_67F5B3A6 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Steven Price <steven.price@arm.com>

The RMM doesn't allow injection of a undefined exception into a realm
guest. Add a WARN to catch if this ever happens.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/inject_fault.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index d6c4fc16f8795..d61a3ff04fabb 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -317,6 +317,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
  */
 void kvm_inject_undefined(struct kvm_vcpu *vcpu)
 {
+	KVM_BUG(vcpu_is_rec(vcpu), vcpu->kvm, "Unexpected undefined exception injection to REC");
 	if (vcpu_el1_is_32bit(vcpu))
 		inject_undef32(vcpu);
 	else
-- 
2.43.0


