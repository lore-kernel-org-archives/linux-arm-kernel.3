Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p1nHGlm0;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Dt3RBBR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6NInI68FLUylWrhgCpXBz1AP5EYWXga5qw6E6p4zJEg=; b=p1nHGlm04iJWLxFqEsVSmVfOPP
	c4xlfreJkbekdQ89+tTfWixhmv/2KDED/6ictSset8MXB8JkaOMIXyGw45z1VUyD7pt6IassbDoGU
	0vZ9/I0rSuoBwiIcqfyxAI6F7a4rCuoA3eJHdOKg7DXZDI96qIL1dginQuFy8M9qqmhk2KJC8JcjH
	I+JQ6vFtLTO240ttzWbk2bbrlS+b1/oOJZ1L6ISnh/mEVD3FR+btEtkOodYyoL8kTfA5Qy2gzIXxB
	zqzHpxI+N+mUr2GXHN4xaKhq4ZUdmSBOd6jmnTcmZQZIOcI9XF1M6iMnukDIa5hFzek+7CeIBBbw5
	egSOs3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXZ-0000000Awxc-0OQ5;
	Fri, 30 Oct 2026 06:56:41 +0000
Received: from [113.46.200.227] (helo=canpmsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXU-0000000AwrC-2pox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:56:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6NInI68FLUylWrhgCpXBz1AP5EYWXga5qw6E6p4zJEg=;
	b=1Dt3RBBRT2n7vdMoPAjgRYh7Th5GGv/nngw3q8ATWLLm373zlntIDqZ5Z2eWzfgrVd/IKVkWU
	sDZlkG2TrR6Ickus9haCPKmRWK7qUwc9qnekEi2/D/wersMPzo+RMHDxlKnbyCklW+z5Buw3pjd
	NbuNxs6DAhcZxlBaqAmBK0g=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhf0cydznTVn;
	Fri, 30 Oct 2026 14:56:18 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id D794640586;
	Fri, 30 Oct 2026 14:56:19 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 3/6] KVM: arm64: Wire up TLBID vDomain configuration ioctls
Date: Fri, 30 Oct 2026 14:56:14 +0800
Message-ID: <20261030065617.4090073-4-yangjinqian1@huawei.com>
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
X-CRM114-CacheID: sfid-20261029_235637_002059_17F7319E 
X-CRM114-Status: GOOD (  10.61  )
X-Spam-Score: -1.3 (-)
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

Report KVM_CAP_ARM_TLBIDOMAIN from kvm_vm_ioctl_check_extension(),
and bridge KVM_ARM_VCPU_SET_VDOMAIN and KVM_ARM_GET_VDOMAIN_NUM to
their kvm_arm_* helpers, letting userspace configure each vCPU's
vDomain bitmap and get the number of vDomains.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 arch/arm64/kvm/arm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 809d33b8e5be..4dfea015eaaa 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -598,6 +598,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		r = kvm_has_full_ptr_auth();
 		break;
+	case KVM_CAP_ARM_TLBIDOMAIN:
+		if (IS_ENABLED(CONFIG_KVM_ARM_VTLBID) && has_vhe() &&
+		    system_supports_tlbid())
+			r = 1;
+		else
+			r = 0;
+		break;
 	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
 		if (kvm)
 			r = kvm->arch.mmu.split_page_chunk_size;
@@ -2437,6 +2444,17 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 
 		return kvm_arm_vcpu_finalize(vcpu, what);
 	}
+	case KVM_ARM_VCPU_SET_VDOMAIN: {
+		struct kvm_arm_set_vdomain vdomain;
+
+		if (!kvm_vcpu_initialized(vcpu))
+			return -ENOEXEC;
+
+		if (copy_from_user(&vdomain, argp, sizeof(vdomain)))
+			return -EFAULT;
+
+		return kvm_arm_vcpu_set_vdomain(vcpu, &vdomain);
+	}
 	default:
 		r = -EINVAL;
 	}
@@ -2578,6 +2596,19 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 			return -EFAULT;
 		return kvm_vm_ioctl_get_reg_writable_masks(kvm, &range);
 	}
+	case KVM_ARM_GET_VDOMAIN_NUM: {
+		struct kvm_arm_get_vdomain vdomain;
+		int ret;
+
+		ret = kvm_arm_get_vdomain_num(kvm, &vdomain);
+		if (ret)
+			return ret;
+
+		if (copy_to_user(argp, &vdomain, sizeof(vdomain)))
+			return -EFAULT;
+
+		return 0;
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.33.0


