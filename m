Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C00C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASGce+NyaGbEoSjdawfaStxr+cxlfQcFzJFI1lv07Aw=; b=1Jk0ZdWIAjC889vkkMQSNzj06t
	1np1tD1rGKbqKD3Dun9vg552eX6eAYbF5F3hCduTFrvv8RSySr83nkA+VItt66KCbvQHL6DLuvEb6
	AGTR2ko8PMDv5dVZ2Y6P/72TUhHkPqitOdXnV2peiKkgGAU1SufEk5zc33R0spD8UuyvNDTCHkbcf
	ntGucF79t6VMsimS3KEVO3sdbKGimZterVhzLenQnwx4gcpmnUAHga5k96zbvbb1ZqIHTGGZnxf32
	g3Jc2NgEum/NPdhlsliZCeZeAgHtIVca2k9mW8lWpgaXEmmaGEQoBrm7M9IUY4A6rKI/6MHJ6k8In
	xD7XEMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2J6g-00000005lFv-2R66;
	Wed, 09 Apr 2025 00:15:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Izg-00000005kB9-2IRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:08:42 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 278202113E98;
	Tue,  8 Apr 2025 17:08:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 278202113E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744157318;
	bh=ASGce+NyaGbEoSjdawfaStxr+cxlfQcFzJFI1lv07Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQm9USqTIK36LAB4mqAvsqseTTmnZCrw+zHCmm9m+yyGhhqzi6bXCY9O+iMchHVrc
	 W/4PTasl5/WaavJ0SoPdl1fdv1jRtRpnQKf1WJexVHnoVXObTXQQ81K3Kvi5IlTmoC
	 YH2yCK8gsKTJc/v1dacCQvG3lBGHWH/xZ2RaG9j0=
From: Roman Kisel <romank@linux.microsoft.com>
To: aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	hch@lst.de,
	hpa@zytor.com,
	James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com,
	kys@microsoft.com,
	leon@kernel.org,
	lukas@wunner.de,
	luto@kernel.org,
	m.szyprowski@samsung.com,
	martin.petersen@oracle.com,
	mingo@redhat.com,
	peterz@infradead.org,
	quic_zijuhu@quicinc.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next 1/6] Documentation: hyperv: Confidential VMBus
Date: Tue,  8 Apr 2025 17:08:30 -0700
Message-ID: <20250409000835.285105-2-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409000835.285105-1-romank@linux.microsoft.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_170840_637141_2B3FAA28 
X-CRM114-Status: GOOD (  13.37  )
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
index 1dcef6a7fda3..f600e3d09800 100644
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
+image via using the platform security processor to ensure trsuted and
+confidential computing.
+
+To support confidential communication with the paravisor, a VmBus client
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
+  Both pages will need to be scanned when VmBus receives a channel interrupt.
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


