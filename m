Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D838ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSdBNVs4UefFpSGY9jG3xM3F4mLYxZd4t/C56DealMY=; b=Ibj78H+oljt0dAK9V9rAe34ZGH
	c96PWI2KoY3hhCE69+spkgTjVg/78hPa4xeMA2SsX9kgM7xtoWovKVcgkjO0za04TcFLKviNui5EG
	FXNiPBToLkkq7trQ5nJLwMtGIytQkD/ghz+01aKPAnFdoCIZUtDUBQS9P5TRMTd1+Owcp1vt2mDxW
	CRiuX/J6baGdLAVrwHlppubj+ss8+YkhUQj+pOElEzXG03lKV+eriuZkfcNWUS2cPVUeffgeYVvGe
	T4UBRTr0KSoqBw2AYw3GNGXzBC1EzGlpMUJysM5aJjdP8euhXVQRpTQ5JGNTzXADzPY8sI1ebY7mW
	MREeKO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDj-00000003Gxd-2xlP;
	Tue, 29 Sep 2026 10:37:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD9-00000003GiE-1drM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=uSdBNVs4UefFpSGY9jG3xM3F4mLYxZd4t/C56DealMY=; b=g6Khw0vW84S9jLEDmzv6EfJ9kB
	pspH1Xz36sABYSvSAz3bOE0S7YArCxT+QT1lBzcJgtGJZyihdjP1v8qx1DEHVOYT04QusS+MUeBuk
	XvnJfoulSnmFqJXwNOc4T6RDg41e/kNMPw3g44t6yfF8eNCX7mZQPGX8rZSc1PKQ/jaKOHK3hy0aK
	B2B1FoQsYwj0u5uQ92ubIo3Eu1cGCt9PO05i8XxP99NRGT/YfiihvrG5GqF5zI8YGwg2Izh5en2zp
	C+lIob4HebpibxNiu0Rf3koWfHstaG76BtZHeMGvPfy1c3YoYd7D9j0weqEdur9PJKYwrNbbFRl5y
	/lCqQq4w==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD3-0000000CL9V-1sz1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uSdBNVs4UefFpSGY9jG3xM3F4mLYxZd4t/C56DealMY=;
	b=A6Wu21241SK7i3HCYQ5++Le9OVxNG4e6TP5zR+W/m0dnIUiTneqw6/KFyqtR4tVWxg86uXJZ5
	opfNqN39X2nUcepz8UK0oZPg5TetNGTNYl0Eb+fbKfRcKOKKThX/0YybKVVPLkEcqSdZw/V6cXe
	+0Wr63O3iLFOkLiIo8f1KBA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hvDpN1vlGzcb49;
	Tue, 29 Sep 2026 18:25:32 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FA1A4057D;
	Tue, 29 Sep 2026 18:37:07 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:37:06 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 14/15] KVM: arm64: Document HDBSS buffer size ioctl
Date: Tue, 29 Sep 2026 18:36:54 +0800
Message-ID: <20260929103655.85107-15-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113718_065408_72E8AE0A 
X-CRM114-Status: UNSURE (   9.48  )
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

Document KVM_CAP_ARM_HDBSS_BUFFER_SIZE, which lets userspace
configure the per-vCPU HDBSS buffer size for hardware-assisted
dirty tracking during live migration.

The capability applies to dirty-bitmap mode only: it is rejected
once the dirty ring is enabled, and enabling the ring after a size
was configured resets it to the default.

Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 Documentation/virt/kvm/api.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9..3a3a14cae134 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9056,6 +9056,34 @@ enabled, cmma can't be enabled anymore and pfmfi and the storage key
 interpretation are disabled. If cmma has already been enabled or the
 hpage_2g module parameter is not set to 1, -EINVAL is returned.

+7.48 KVM_CAP_ARM_HDBSS_BUFFER_SIZE
+-----------------------------------
+
+:Architectures: arm64
+:Target: VM
+:Parameters: args[0] is the per-vCPU HDBSS buffer size in bytes
+:Returns: 0 on success; -EINVAL if the size is invalid or vCPUs have already
+          been created; -EBUSY if the buffer size was already configured.
+
+This capability configures the per-vCPU HDBSS buffer size used for
+hardware-assisted dirty tracking during live migration.
+
+Userspace sets the size in bytes via KVM_ENABLE_CAP. KVM allocates
+per-vCPU HDBSS buffers of the requested size.
+
+KVM_CHECK_EXTENSION returns the maximum supported size (``SZ_2M``)
+when queried without a VM, or the configured per-VM size (default
+``PAGE_SIZE``) when queried with a VM.
+
+Constraints:
+
+- The size must be a power of two in [``PAGE_SIZE``, ``SZ_2M``].
+- Dirty-bitmap mode only: rejected with -EINVAL once the dirty ring
+  (``KVM_CAP_DIRTY_LOG_RING``) is enabled, and enabling the ring after
+  a size was set resets it to the default.
+- Must be set before any vCPU is created; a second setting is rejected
+  with -EBUSY.
+
 8. Other capabilities.
 ======================

--
2.43.0


