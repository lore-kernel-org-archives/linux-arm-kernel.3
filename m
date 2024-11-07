Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6841D5D696
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GO6EHAy3E9oBRQofog/8t22FjdLbKxZK6Scdg3HvYTs=; b=139lRIpqrBmO/fmQBhuRE+KIJJ
	lQrgs0GzNsMHvvY2DeQF73+VMNF2jhXnxw6AvYyAt1Dl8lPDY9W6QdFH2nZAkR4+XmwPvGRPxRMWr
	LYEzV07rG00RWDRjxFiXr1FgkoPVKlgvBGsLPp7Wf2DYnmYZzNDXYZOynSGdJG8G5rvGlZOM4swZ1
	v/T9nBvtYCyE4qZBEVYvV7nD1apMttwtwAxoINrZTe6WMO2ioi9tX+VYnGsCSlmVQonPgAycnno1v
	c/xtwRfTz3rUgcMMoR1o5gCYTg8RWEGu+Zoi2rO2tHUEt59n5bo5cnVsiQrM/NACNlYL7NwRXbSuG
	V02Q4lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B59-00000008YID-0B8z;
	Thu, 07 Nov 2024 22:34:27 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B3I-00000008Xg1-3Msf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 22:32:34 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id C9160212D513;
	Thu,  7 Nov 2024 14:32:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C9160212D513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731018750;
	bh=GO6EHAy3E9oBRQofog/8t22FjdLbKxZK6Scdg3HvYTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JlK+Amog/eo8deK1brnPwFK7BzPdCUlxv5PoSoR0bOlZ+eutGjTvuM7QKNc3/YMsb
	 JE2rGjnMrDYBhWluzoDDlibGNdpaBh93qQDgcogeVcxGCsebr76N6JTBiwMJcRCbp1
	 pdpwlPJxHlHYH7Rlgx3jRKPU3t/AUOL+6DtGYhDU=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	seanjc@google.com,
	pbonzini@redhat.com,
	peterz@infradead.org,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	sgarzare@redhat.com,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com,
	vkuznets@redhat.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: [PATCH v2 1/4] hyperv: Move hv_connection_id to hyperv-tlfs.h
Date: Thu,  7 Nov 2024 14:32:23 -0800
Message-Id: <1731018746-25914-2-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_143232_886612_530A8D10 
X-CRM114-Status: UNSURE (   8.30  )
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

This definition is in the wrong file; it is part of the TLFS doc.

Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 include/asm-generic/hyperv-tlfs.h | 9 +++++++++
 include/linux/hyperv.h            | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/hyperv-tlfs.h b/include/asm-generic/hyperv-tlfs.h
index 814207e7c37f..52274c9aefef 100644
--- a/include/asm-generic/hyperv-tlfs.h
+++ b/include/asm-generic/hyperv-tlfs.h
@@ -871,4 +871,13 @@ struct hv_mmio_write_input {
 	u8 data[HV_HYPERCALL_MMIO_MAX_DATA_LENGTH];
 } __packed;
 
+/* Define connection identifier type. */
+union hv_connection_id {
+	u32 asu32;
+	struct {
+		u32 id:24;
+		u32 reserved:8;
+	} u;
+};
+
 #endif
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 22c22fb91042..d0893ec488ae 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -768,15 +768,6 @@ struct vmbus_close_msg {
 	struct vmbus_channel_close_channel msg;
 };
 
-/* Define connection identifier type. */
-union hv_connection_id {
-	u32 asu32;
-	struct {
-		u32 id:24;
-		u32 reserved:8;
-	} u;
-};
-
 enum vmbus_device_type {
 	HV_IDE = 0,
 	HV_SCSI,
-- 
2.34.1


