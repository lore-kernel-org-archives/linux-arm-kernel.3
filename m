Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139D7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiV1KAvAfB/N2ESs9iUxrXckjGXm4ld7nwAWfxyz8q4=; b=MzrOGD3Lp5J03oS6ZsgjaQ7KeA
	CuianVGiRXn3oDt4N0KT83eL/mLgZqjGpB2KOskVMXQqsYfVEIwkc9oWszcpaZ1mWadbRaHNZVsoR
	n+ivS0MXO7jn6y8Nx3lv8oYHtiG9yqfRutyW9/U1ldPjewj3DPXxsTDb3HqRg5vruJR8UjC96eH07
	bLqjYMjVTFHiOj6Sf0z53wSISRB0OF23lA/GWS+aC+qiqAOsfcThJHc1fTXgplti/LSGOIkzO0eXw
	Bfg7nkG1uf234sU0i8oKkrlveOKMQdY+IOEfkilSFI57kw+cWjAhF2974qdQIY9rb2CxiLkYmzGCG
	zR6H1R4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vz4-00000007c1K-3aoD;
	Mon, 28 Apr 2025 21:25:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vhl-00000007ZHo-3iIe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 21:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hiV1KAvAfB/N2ESs9iUxrXckjGXm4ld7nwAWfxyz8q4=; b=QiZWS+u20eVY+nwV0n36hQ2seF
	SII59WESBtRR0n1rhNxfz14F4puOBkGIW7le6tNYYmPCdZAB6UQL+1HYEc9XZ7EsViKbwL3bFcuF/
	qgp0whFoNYVp3H4b9JDbuWT5HcQquWSC+AHQD7RaSv9EyHlPhNr/hTpqEZtiztAHWVhfGkA+4FrvR
	tqXevu2p9iSIto7ZAmErrGovK7aMLa1s172gbm2zIvis+QdxVE6IwHUjQqxi+uUYYAfDaAPzt1hnD
	V3ueMV0Fpp9c5g83c8PhSogKlHoacLLbsF6sYKXmCP4X6SrJoy88TQ689fPXdehVRpwn9DxXWFtbs
	i9FwsBsg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Vhg-0000000D3Bn-1Ix2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 21:07:55 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id A61D1211AD25;
	Mon, 28 Apr 2025 14:07:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A61D1211AD25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1745874465;
	bh=hiV1KAvAfB/N2ESs9iUxrXckjGXm4ld7nwAWfxyz8q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rxRfdfTrS5MZLUdV8vOjhbRD76KCrJhbZapoQYJ1PhffsS07PiZh/fHgiezi6WQsX
	 714+Byq7ABtGAAEWUoD2H8cjlJ7nN1F1kRZzYtOUzdMDi7Okvd1OrJKgPB9vsaUwxV
	 1d+NYGGKN7Hg1aFKYhdh2RjSEc5pUe0BGO78oE40=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	linux-hyperv@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v9 05/11] arm64: hyperv: Initialize the Virtual Trust Level field
Date: Mon, 28 Apr 2025 14:07:36 -0700
Message-ID: <20250428210742.435282-6-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428210742.435282-1-romank@linux.microsoft.com>
References: <20250428210742.435282-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_220753_254738_4BCC5CC9 
X-CRM114-Status: UNSURE (   8.45  )
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

Various parts of the hyperv code need to know what VTL
the kernel runs at, most notably VMBus needs that to
establish communication with the host.

Initialize the Virtual Trust Level field to enable
booting in the Virtual Trust Level.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/arm64/hyperv/mshyperv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 21458b6338aa..43f422a7ef34 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -117,6 +117,7 @@ static int __init hyperv_init(void)
 
 	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
 		hv_get_partition_id();
+	ms_hyperv.vtl = get_vtl();
 
 	ms_hyperv_late_init();
 
-- 
2.43.0


