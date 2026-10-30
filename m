Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E473606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rFwnaXr2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Mo3zktTF;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Noh/vIGl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aX9oxzryrpP/N+LbstdWGgRShaz+ZIQX/4rMf7PZOrM=; b=rFwnaXr2GK3We14vQlDjpqeBjQ
	Pkdiz2q7bZ9pWkTq9pQACApRcJaFi8eKojcrg3y6qiVJepLtnDvYrVIfbhLbyXQD6qBf9wd6xP8X/
	nofxbEwSjXatgx3WwrvJWPjd3zYJ5fmrnbw3F7oTVcqgVg36VLdE96EydR7AufuhXsQ76bhMkbHDX
	VspJrrdnWtLh6J5U2h0/y8AErTl53hc1Iwedotlzz5ROa24zKy+9KG5+eGC7iCEFmThTfp9tgeJTw
	j1F7ApKuWkhoNeqs+19w1W1L9Xz9TQpdURmut2u39Oak16T+VeN8g562gYpx+a1tOQuK8an/fPx3v
	q8hSydrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgY0-0000000AxC7-38I4;
	Fri, 30 Oct 2026 06:57:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXq-0000000Ax7y-3eTp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 30 Oct 2026 06:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aX9oxzryrpP/N+LbstdWGgRShaz+ZIQX/4rMf7PZOrM=; b=Mo3zktTFvDWjVRRaSI7Lxe0tqp
	TTmo4MFFiqpUQgqXKQA9uxyfAhKKzAwzWfNeK886YcQHGZKJdgIVgJJiKx5QCocRclSQ9rk2ad8+o
	TxOgixKVToX00wVjJ0ODozHiqGF9emRQndT8DBeeQGmW4nYMc7fChc9wW0aor2BchcP6xemTknRdh
	0sXaSXLb7X/9gq4CIbf5p77F00FpVNugf6Q6mkwMemxaVy9yznV6EhJAfFqUtiDWMCElHPViCPCg+
	w2gGdbFA6xHAT110IVq25Fc8p1rAMk1puFfzCeyqfNDPnWw1UzNu5GppOklGNRIypY8ZPmdgPoq01
	/ke0Sqyg==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXm-0000000045t-2NCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:56:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aX9oxzryrpP/N+LbstdWGgRShaz+ZIQX/4rMf7PZOrM=;
	b=Noh/vIGlrIcfT7ytLHg4hzZRsj3j26ToV2uJy0btNnOrClRsUy/Bs1AbxtM2jwe5Maje6WNJG
	imSedcH2dmfQqrHq55yPX7JcPVJmAnz0Z7zJmf0EpH0BZ7yPXgxgykVwKwuj4/F908TyUO+7Bwe
	c/RLnrxuSTbKo/sXjSy5bns=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhS6zjlz1T4GZ;
	Fri, 30 Oct 2026 14:56:08 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 60ACC4057F;
	Fri, 30 Oct 2026 14:56:21 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:20 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 6/6] KVM: arm64: Add tracepoints for TLBID vDomain load events
Date: Fri, 30 Oct 2026 14:56:17 +0800
Message-ID: <20261030065617.4090073-7-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261030065617.4090073-1-yangjinqian1@huawei.com>
References: <20261030065617.4090073-1-yangjinqian1@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_065656_232931_D99BE8E0 
X-CRM114-Status: GOOD (  10.66  )
X-Spam-Score: -0.2 (/)
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

kvm_tlbid_vcpu_info logs each vCPU's vDomain bitmap on migration,
and kvm_tlbid_domain_mapping logs the pCPU mask and physical domain
mapped for each vDomain, covering both the default vDomain0 mapping
and the per-vDomain updates.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/arm.c       | 10 ++++++++
 arch/arm64/kvm/trace_arm.h | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b5ab89db1c07..0352d62cea18 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -954,6 +954,9 @@ static void kvm_tlbidomain_vcpu_load(struct kvm_vcpu *vcpu)
 				      max_vdomains);
 		}
 	}
+	trace_kvm_tlbid_vcpu_info(vcpu->vcpu_idx, vcpu->cpu,
+				  current_data->last_pcpu,
+				  current_data->vdomain_bitmap);
 
 	if (!vdomain->guest_tlbid_enabled) {
 		old_map = vdomain->domain_map[0];
@@ -966,6 +969,10 @@ static void kvm_tlbidomain_vcpu_load(struct kvm_vcpu *vcpu)
 							   0,
 							   current_data->last_pcpu,
 							   test_bit(0, clear_bits));
+		trace_kvm_tlbid_domain_mapping(0,
+					       vdomain->vdomain_cpumasks[0],
+					       vdomain->domain_map[0]);
+
 		if (vdomain->domain_map[0] == old_map)
 			goto unlock;
 	} else {
@@ -983,6 +990,9 @@ static void kvm_tlbidomain_vcpu_load(struct kvm_vcpu *vcpu)
 								   i,
 								   current_data->last_pcpu,
 								   test_bit(i, clear_bits));
+			trace_kvm_tlbid_domain_mapping(i,
+						       vdomain->vdomain_cpumasks[i],
+						       vdomain->domain_map[i]);
 
 			if (vdomain->domain_map[i] != old_map)
 				domain_map_changed = true;
diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
index 9c60f6465c78..0e8faeb8964e 100644
--- a/arch/arm64/kvm/trace_arm.h
+++ b/arch/arm64/kvm/trace_arm.h
@@ -415,6 +415,53 @@ TRACE_EVENT(kvm_forward_sysreg_trap,
 		      sys_reg_Op2(__entry->sysreg))
 );
 
+TRACE_EVENT(kvm_tlbid_vcpu_info,
+	TP_PROTO(int vcpu_idx, int current_pcpu, int last_pcpu,
+		 u32 vdomain_bitmap),
+	TP_ARGS(vcpu_idx, current_pcpu, last_pcpu, vdomain_bitmap),
+
+	TP_STRUCT__entry(
+		__field(int,	vcpu_idx)
+		__field(int,	current_pcpu)
+		__field(int,	last_pcpu)
+		__field(u32,	vdomain_bitmap)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_idx	= vcpu_idx;
+		__entry->current_pcpu	= current_pcpu;
+		__entry->last_pcpu	= last_pcpu;
+		__entry->vdomain_bitmap	= vdomain_bitmap;
+	),
+
+	TP_printk("vcpu=%d current_pcpu=%d last_pcpu=%d vdomain_bitmap=0x%x",
+		  __entry->vcpu_idx, __entry->current_pcpu,
+		  __entry->last_pcpu, __entry->vdomain_bitmap)
+);
+
+TRACE_EVENT(kvm_tlbid_domain_mapping,
+	TP_PROTO(int vdomain_id, const struct cpumask *cpumask,
+		 int pdomain_id),
+	TP_ARGS(vdomain_id, cpumask, pdomain_id),
+
+	TP_STRUCT__entry(
+		__field(int,	vdomain_id)
+		__cpumask(cpumask)
+		__field(int,	pdomain_id)
+	),
+
+	TP_fast_assign(
+		__entry->vdomain_id	= vdomain_id;
+		__assign_cpumask(cpumask, cpumask_bits(cpumask));
+		__entry->pdomain_id	= pdomain_id;
+	),
+
+	TP_printk("Domain mapping: vDomain=%d, cpumask=%s, pDomain=%d",
+		  __entry->vdomain_id,
+		  __get_cpumask(cpumask),
+		  __entry->pdomain_id)
+);
+
 #endif /* _TRACE_ARM_ARM64_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.33.0


