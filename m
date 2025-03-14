Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49552C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUdDLeTcFv7peeEsvlaUqyHqo41x8jGlZj8eHhigyuc=; b=NZ7T4gbmIP7l1fd7/HDoi2mLhK
	QOFgf4KObWlpGIFUV7pR73hNSipthreYDOPlMiQ0AtEwpiI7tCAtExPeRt6HKvcW7OEBKiaJuHWi9
	8h8BRdUQW4wXJ5OOXySjQDhmH3YFN700GwwkgRs+04YUeygcCkLshg6N+7sf7F4TnFtvOfgjL38Ei
	Y9x6xfEy8gwHrJoUYBNASbzkv82kH/c68XX+WRdZJA52xn4eLALRYMFXw38NIRy2/FanF2g2DSwK1
	sD2/ART3HV+ekuSyK0VtP501+ZljutMW+sP1CPOyJH2L9zyFQ9781tWCyANhwoFwzt/XuYp6crIq4
	YlrQQ6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAuH-0000000F8x7-23bE;
	Fri, 14 Mar 2025 19:41:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAil-0000000F75p-0VRg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:28 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 972EE2033456;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 972EE2033456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=FUdDLeTcFv7peeEsvlaUqyHqo41x8jGlZj8eHhigyuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PQ9z6eCqIupiYkGG5TlmdH1mNJebiDCLhXL8ck324lwF7H/kECeYM8nAzuTF0QAKi
	 spwx2HjSI8QiRV0nMwmoCtwMrd0Ola9VV1TnE9i2o/oV3BIR5HfTYVFmOXTI+hceBy
	 7XdeOQ7VyEHc/nMraIzqQsieqDfk4Lri6rwM1rpY=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com,
	ltykernel@gmail.com,
	stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org,
	eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 05/10] acpi: numa: Export node_to_pxm()
Date: Fri, 14 Mar 2025 12:28:51 -0700
Message-Id: <1741980536-3865-6-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122927_180188_3C4494E7 
X-CRM114-Status: UNSURE (   7.17  )
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

node_to_pxm() is used by hv_numa_node_to_pxm_info().
That helper will be used by Hyper-V root partition module code
when CONFIG_MSHV_ROOT=m.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Tianyu Lan <tiala@microsoft.com>
---
 drivers/acpi/numa/srat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 00ac0d7bb8c9..ce815d7cb8f6 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -51,6 +51,7 @@ int node_to_pxm(int node)
 		return PXM_INVAL;
 	return node_to_pxm_map[node];
 }
+EXPORT_SYMBOL_GPL(node_to_pxm);
 
 static void __acpi_map_pxm_to_node(int pxm, int node)
 {
-- 
2.34.1


