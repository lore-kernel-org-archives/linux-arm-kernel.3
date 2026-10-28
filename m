Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A04606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FvDRNWw8;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xb5nZuD2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/dqcNV2rxcj+H+N6V1Q7pF0i14uOvWt3XmYVtpF0Vwo=; b=FvDRNWw8lDEd62
	LlO6Te1RSlzaMTnl8azto2vvRNJWmqtICytGHaZnUNmPTp+QVpfK4VMnQnOGXGjdKul9fqaay2lly
	YmBtzamSqV/mIyQISj0nYsSNAnIy4C8yKTpt0TJccGJSdFuiEZCLyduUTOnu3wrMI5B0ZVtx2QoIZ
	JMY/LyIAlMfRB/jcEBa9naJZbZXKzRb46MLamzJ3NQzXGLwN9P8cdXKQeGXga/RxXqRg5j49Y/fN9
	9n2GfrinH/Q/DZIEYpHQs5gLNlOkU6oZw8TQ7Np9Rfb/Tr3Z6del/WjuWvTB6rE2hR5DNq3CyScja
	aKG2AQ9k+CQp8X3xDHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dJ-00000007Oe9-2R7L;
	Wed, 28 Oct 2026 15:32:09 +0000
Received: from out-9.mta0.migadu.com ([2001:41d0:1004:224b::9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dB-00000007Ob5-46Ot
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:32:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hOfLyCvPxdoMK3iGT2snLIRtrBmcqixK3sf0MGFjqIg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793201519; v=1; x=1793806319;
 b=xb5nZuD2ABwyQl4nxMN0ZnFllS2AzPkEPZ1p+XokSb7KMe+6glcbj656ChKzAJ1H4nKWjJjU
 k14PTpdGt0A5O/E8UKJU0fWdmO0LePFN0l4knxy+yLIt6k+xuvLk/CPDzoQXH372GnlGCxJcnMJ
 h60bkJC3tNPpTOO/xUP6feeM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3c4a590b27db9bbe;
	Wed, 28 Oct 2026 15:31:59 +0000
X-Mizu-Trace-ID: 3c4a590b27db9bbe
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 1/3] KVM: arm64: Synchronise kvm_host_data before host deprivileging
Date: Wed, 28 Oct 2026 15:31:50 +0000
Message-ID: <20261028153152.1740044-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028153152.1740044-1-fuad.tabba@linux.dev>
References: <20261028153152.1740044-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_083202_167162_EC414ABF 
X-CRM114-Status: GOOD (  12.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Donnefort <vdonnefort@google.com>

When protected mode is enabled, the host is populating and reading the
hypervisor copy of kvm_host_data until it is deprivileged. This is an
issue for nr_event_counters which is only used by the host to populate
mdcr_el2. After deprivileging, it is reading an uninitialised value and
sets HPMN to 0, preventing programmable event counters from counting a
non-protected guest.

Before the host is entirely deprivileged, copy the entire kvm_host_data
content from the hypervisor copy to the host-accessible one.

Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 380dfb1db0be4..58190ff6723d6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -316,6 +316,12 @@ static void __init _kvm_host_prot_finalize(void *arg)
 {
 	int *err = arg;
 
+	/*
+	 * After __pkvm_prot_finalize, access to the hypervisor copy of
+	 * kvm_host_data is lost. Save it into the host-accessible version.
+	 */
+	*this_cpu_ptr(&kvm_host_data) = *this_cpu_ptr_nvhe_sym(kvm_host_data);
+
 	if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)))
 		WRITE_ONCE(*err, -EINVAL);
 }
-- 
2.47.3


