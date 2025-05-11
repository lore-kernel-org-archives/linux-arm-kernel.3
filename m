Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B606C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 23:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6e1Sd2wwIBHFKi64bmr0cXUFCAbG2BTPif+GBdvk8k=; b=uFfoJ32q05Y2/LiJkkgEKuEs8Z
	t/tQjd7NxbznUKL2EFKVysak6xNIeNGX9jLeaHCMmaiQjHARwJPUIvwz/JX2YxEi7A6b8SGUBhpK5
	l0Q6HRS0B+peEKuZ9JrgN2++oEqrIuyKQx7BQwdMSQsSg6dds+NPXk5wwnTuyjByQmfGXebYq2v+L
	4blIfFVZMUQ/6wcC8ahInl9qJzXeBJxtqPfAye/ZK1rM+8MMdOQx5fAEYEgNtnpiI0auJN1Y2Gs8Z
	2v4OJ3VCFIb7ccVq/rG7vPXE7wvxUkGdu9/uRe8rQP2YJ0rS/pZOXkf3O5aQpysLRanhRMRsWqCcC
	P/WfuNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFo9-000000080M6-3ROM;
	Sun, 11 May 2025 23:10:09 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFm6-00000007zkY-3ljW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 23:08:04 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id B2B49211D8B6;
	Sun, 11 May 2025 16:08:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B2B49211D8B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1747004880;
	bh=C6e1Sd2wwIBHFKi64bmr0cXUFCAbG2BTPif+GBdvk8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/uIweLM/AnCi7PqtxtdfyJTudA/+61xNiWRDAoghEYqfW7si/lWX7uVlaaVMDyX4
	 9jA91EjAJ3yihJuaC9vdYgkFDLfWxORvxvnRIEuSYhal1jDUg7Xu1XR3GOg9Em6cLH
	 npeCsKoJGHstFIFm1zrocmvdPk38BL1CW+0I/kEY=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	kys@microsoft.com,
	mingo@redhat.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v2 1/4] Documentation: hyperv: Confidential VMBus
Date: Sun, 11 May 2025 16:07:55 -0700
Message-ID: <20250511230758.160674-2-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511230758.160674-1-romank@linux.microsoft.com>
References: <20250511230758.160674-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_160802_985209_C60A7FA2 
X-CRM114-Status: GOOD (  13.13  )
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

Define what the confidential VMBus is and describe what advantages
it offers on the capable hardware.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 Documentation/virt/hyperv/vmbus.rst | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 1dcef6a7fda3..ca2b948e5070 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -324,3 +324,44 @@ rescinded, neither Hyper-V nor Linux retains any state about
 its previous existence. Such a device might be re-added later,
 in which case it is treated as an entirely new device. See
 vmbus_onoffer_rescind().
+
+Confidential VMBus
+------------------
+
+The confidential VMBus provides the control and data planes where
+the guest doesn't talk to either the hypervisor or the host. Instead,
+it relies on the trusted paravisor. The hardware (SNP or TDX) encrypts
+the guest memory and the register state also measuring the paravisor
+image via using the platform security processor to ensure trusted and
+confidential computing.
+
+To support confidential communication with the paravisor, a VMBus client
+will first attempt to use regular, non-isolated mechanisms for communication.
+To do this, it must:
+
+* Configure the paravisor SIMP with an encrypted page. The paravisor SIMP is
+  configured by setting the relevant MSR directly, without using GHCB or tdcall.
+
+* Enable SINT 2 on both the paravisor and hypervisor, without setting the proxy
+  flag on the paravisor SINT. Enable interrupts on the paravisor SynIC.
+
+* Configure both the paravisor and hypervisor event flags page.
+  Both pages will need to be scanned when VMBus receives a channel interrupt.
+
+* Send messages to the paravisor by calling HvPostMessage directly, without using
+  GHCB or tdcall.
+
+* Set the EOM MSR directly in the paravisor, without using GHCB or tdcall.
+
+If sending the InitiateContact message using non-isolated HvPostMessage fails,
+the client must fall back to using the hypervisor synic, by using the GHCB/tdcall
+as appropriate.
+
+To fall back, the client will have to reconfigure the following:
+
+* Configure the hypervisor SIMP with a host-visible page.
+  Since the hypervisor SIMP is not used when in confidential mode,
+  this can be done up front, or only when needed, whichever makes sense for
+  the particular implementation.
+
+* Set the proxy flag on SINT 2 for the paravisor.
-- 
2.43.0


