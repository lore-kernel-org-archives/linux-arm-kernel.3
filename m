Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9C9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDmpFnnNjtVVT4nWQKfnOVX6uwbQyh3AG6bbf3ydHyI=; b=QQH7UUzeIxCGpgcKRSBbAmJcaD
	0Sh7FWlSOGGEMfwaCtDBtjRUk44BgHEvRK9bA/D1mvw8843kwCek6suZ8cpzl9y/KjvogH0MG9kYh
	byMsWUZoKgAF5cQcuThGxbA42Apk/lBZ2GWJmZJrYba/iBY/lQCo3IyiET4DObLeXAKYxbqw9znB8
	WFJVJxPVwPF9YYIwlonYdXK4yAYoycuz2rPlFplK3O1oEyvOCrzq+9/XpyBY6yQIl/+yKpfJkF0xl
	9lm+psb/6odpg+ZUiDnUPTktnd0L5lDTg0IF44Y9ffgS4+j/owo4BuXqtKJA+rvxlRvBIWaTZKy5+
	sQ20FO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFXg-0000000Fbst-0AHt;
	Sat, 15 Mar 2025 00:38:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFo-0000000FZZV-3ohM
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 15 Mar 2025 00:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TDmpFnnNjtVVT4nWQKfnOVX6uwbQyh3AG6bbf3ydHyI=; b=VaQC4mRTTD6rw0Cp+FPgaICaBb
	o2f8vPMrzuraD3ZNV9UJE7FgD0bnblrJ0la+BCSGX3O0qbjBhEFw/YtlTW7fQeikoqd3NPD931NTj
	Pb0/qNqkmLFNnL8A5OcFUt/7uTLGlzz4uu/G2SCzePeoFpUsldinPFjkyDpsU/lyigYL1p+1vEAf+
	4QOb8drDYUzWE0MNpKKZ/MpPu3ovkJJvT+4CygKKnSUFV/k+P2BzVBqpj6/51bIA9grnL+87U7oov
	m4QCW3PwohL128oZvALUcWWWtwOO8KLjeoDUsGxgen4RWXr87HNa3M6xrma6vnqYpfkpjmW7CbTXX
	0aq1qEyA==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFc-000000031L0-29w4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 00:19:42 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id C8A432038F2E;
	Fri, 14 Mar 2025 17:19:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C8A432038F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741997975;
	bh=TDmpFnnNjtVVT4nWQKfnOVX6uwbQyh3AG6bbf3ydHyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAfmYGcU8yB0LAwiKY8EIayPjlFEW9Qtm5IBPBjBHTrIbenjaPidGT0C+kAQ68rx6
	 9TB4g0mgWycnwqtbQO6guH2Xnpv1671Fen4fFHxXgb69c5jdKXyBUZVZE3/uWEzOZ9
	 gc+mtZ/R/T6G//RMcYluQbk3Af45/0GDWm+XYXQM=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
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
	devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v6 05/11] arm64: hyperv: Initialize the Virtual Trust Level field
Date: Fri, 14 Mar 2025 17:19:25 -0700
Message-ID: <20250315001931.631210-6-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315001931.631210-1-romank@linux.microsoft.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_001940_890304_CDCA1F1A 
X-CRM114-Status: UNSURE (   7.83  )
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
index c5b03d3af7c5..f251a08ada5b 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -109,6 +109,7 @@ static int __init hyperv_init(void)
 
 	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
 		hv_get_partition_id();
+	ms_hyperv.vtl = get_vtl();
 
 	ms_hyperv_late_init();
 
-- 
2.43.0


