Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C843BCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssc2XGYXxWt7KSvkGE64VLhm/JYqo0izQ0v9suh6vGk=; b=dyD5NqWEDy41PY6mH4EU4qbdCf
	QHQQKYIDVCLZQyl9WRGvO8XSByWwo10N81yaIuu+LnYPaUG6vsKMLRB90hwxZfQ/B/RAC8jTA4puc
	6S3cgNBJX00y8JKrOfP6cl/F/Lf0W+DF9JZLGq99sn5aWQ5mA6Dqbu0TCN1CscCP3ZoSaHhst0icC
	ckgDfKjIES/SBdcs1hSfUYkalCW8F48i6TYf+F/KPiCeZW7GFVaITtJKSb7BQakac1TYklUPE7BdL
	aauT3vU/GVwF0aVt3Bf98ccvdSxFUPEhrIOXmnNsa0cp8zz4fuomc1D/yrVeQTK2QxSo0x5wHkO1v
	EOQ70V1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDCZ-00000000t2k-10ZK;
	Mon, 28 Sep 2026 15:23:35 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDCW-00000000t25-3jEO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790609012; x=1822145012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ssc2XGYXxWt7KSvkGE64VLhm/JYqo0izQ0v9suh6vGk=;
  b=F2tkkRUuqkd1iY1RRCixXQWiBhVL7OgihXnZIF1RCKOWD1zIX3w2HlwP
   AEfZkvTXX0F3ubBpGv1Gur4A6oK2C7NQv/Qs+iyH5ooEcfJg1x8Gy1M24
   EsTspvEJ/sSAhUwh82SjQme8lg+9nvXzv+vL8CBx3FxI3rcwywWZSR3qJ
   PH9WgGyOoJJybjKeVCQiZ7KKE3AhaPDUVIRRA+DKSGa/jYR1e7F43DN+F
   pHDfRB4z2DQCj3uh4RVM/n6G0ZNcxL0zK21N/OgkPmUMWt0FCBeQV6hDl
   Sn3IAA/gazxU7er7YSECJ8VDzk8jQBncmhnk43+tasic9syDFtNWfSB1G
   A==;
X-CSE-ConnectionGUID: jnJ9/YN1TZSLsI2f6lzYSw==
X-CSE-MsgGUID: 9bwnKBOuR0yNrVpk5p4H0w==
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="29644157"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:23:24 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:12407]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.104:2525] with esmtp (Farcaster)
 id ea5ba36c-33b9-4f1a-b9d1-70d08488d952; Mon, 28 Sep 2026 15:23:24 +0000 (UTC)
X-Farcaster-Flow-ID: ea5ba36c-33b9-4f1a-b9d1-70d08488d952
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 28 Sep 2026 15:23:23 +0000
Received: from 7cf34dda9133.amazon.com (10.106.178.42) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 28 Sep 2026 15:23:21 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: <nicolinc@nvidia.com>
CC: <iommu@lists.linux.dev>, <jamien@nvidia.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <kas@kernel.org>, <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<praan@google.com>, <robin.murphy@arm.com>, <smostafa@google.com>,
	<will@kernel.org>, <leitao@debian.org>, Cristian Prundeanu <cpru@amazon.com>
Subject: Re: [PATCH v10 00/13] iommu/arm-smmu-v3: Adopt the crashed kernel's stream table for kdump
Date: Mon, 28 Sep 2026 10:23:02 -0500
Message-ID: <20260928152302.58271-1-cpru@amazon.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788130528.git.nicolinc@nvidia.com>
References: <aqfPKIeO4lWCHlQ3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.178.42]
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082332_983431_23E2E71F 
X-CRM114-Status: GOOD (  10.15  )
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

On Sun, Aug 30, 2026 at 04:18:01PM -0700, Nicolin Chen wrote:
> To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
> and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
> flight DMA using the crashed kernel's page tables until the endpoint device
> drivers probe and quiesce their respective hardware.

Tested v10 on AWS Graviton4 bare metal (m8g.metal-24xl: Neoverse V2, single
SMMUv3 with a 2-level stream table). On this platform, if the SMMU aborts a
NIC DMA read, firmware resets the host. An unpatched kernel fails kdump when
the NIC is still fetching from memory as the SMMU probe installs a fresh
stream table.

Reproducer: sysrq-c while the NIC receives ~100 kpps of UDP over 64 flows,
spread across most RX queues. The kdump initramfs omits the NIC driver, so
nothing quiesces the device.

Results using Amazon Linux 2023 with kdump kernel 6.18.39:

- Unpatched: 2/2 failures. The SMMU logs read and write translation aborts 
  ~2.5 s after the panic, and the host resets before the vmcore is written.

- v7.3-rc1 + this series: 3/3 complete vmcores, no translation aborts.
  The kdump kernel logs "kdump: adopting crashed kernel's stream table"
  and "kdump: retaining SMMUEN for in-flight DMA". In one run the NIC
  driver was present, so the device was also re-probed and reset.

Tested-by: Cristian Prundeanu <cpru@amazon.com>

