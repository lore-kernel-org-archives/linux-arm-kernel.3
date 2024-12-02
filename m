Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF38D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIziuh6HhH3MiEkt0k6A+2SHY8YnugDlGidsCQhzxg0=; b=CvdPeacdOSBk2A5GaB+X5XGbrT
	tESERS+YfR3CILpgfAbWMqLeEe71RQjWMVmVzSEt9NuxDCm1vQL2yKQKl5FQ1DegO4mMoEvawK/jp
	oTzOxf4nAbt5ndVCIfe3V9bT40DpcOsxO6/d82SqyMG1IZN4/KaezgIiEwunksGaYvoUTN0H3njNU
	0sMsIQlAWOOmq67R2ahm25myWRoF0g8mOrCzwgvjA0R1C1WOqH81nzxeyX6X4GgIME1hbwcytfY+M
	RSbTdSrOw9zBOFgHmcwHYTEBZzfJPSopPuFNAeSLL/SgVFa0LtCtmgbc7fwz50Zymyf9aOWEPGWNA
	RIFDKdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6vm-00000006K21-1vP7;
	Mon, 02 Dec 2024 13:57:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6uA-00000006JZc-3E33
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:56:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Y24xF28Y3z1V5Rk;
	Mon,  2 Dec 2024 21:53:05 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 59A13180087;
	Mon,  2 Dec 2024 21:55:59 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 21:55:58 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 5/5] KVM: arm64: Handle DABT caused by LS64* instructions on unsupported memory
Date: Mon, 2 Dec 2024 21:55:04 +0800
Message-ID: <20241202135504.14252-6-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241202135504.14252-1-yangyicong@huawei.com>
References: <20241202135504.14252-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_055602_994221_D0937A7E 
X-CRM114-Status: GOOD (  11.54  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

FEAT_LS64* instructions only support to access Device/Uncacheable
memory, otherwise a data abort for unsupported Exclusive or atomic
access (0x35) is generated per spec. It's implementation defined
whether the target exception level is routed and is possible to
implemented as route to EL2 on a VHE VM. Per DDI0487K.a Section
C3.2.12.2 Single-copy atomic 64-byte load/store:

  The check is performed against the resulting memory type after all
  enabled stages of translation. In this case the fault is reported
  at the final enabled stage of translation.

If it's implemented as generate the DABT to the final enabled stage
(stage-2), inject a DABT to the guest to handle it.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kvm/mmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..b7e6f0a27537 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1787,6 +1787,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		return 1;
 	}
 
+	/*
+	 * If instructions of FEAT_{LS64, LS64_V, LS64_ACCDATA} operated on
+	 * unsupported memory regions, a DABT for unsupported Exclusive or
+	 * atomic access is generated. It's implementation defined whether
+	 * the exception will be taken to, a stage-1 DABT or the final enabled
+	 * stage of translation (stage-2 in this case as we hit here). Inject
+	 * a DABT to the guest to handle it if it's implemented as a stage-2
+	 * DABT.
+	 */
+	if (esr_fsc_is_excl_atomic_fault(esr)) {
+		kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
+		return 1;
+	}
+
 	trace_kvm_guest_fault(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
 			      kvm_vcpu_get_hfar(vcpu), fault_ipa);
 
-- 
2.24.0


