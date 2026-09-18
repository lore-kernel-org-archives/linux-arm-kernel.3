Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35828C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwSgmxUrtbpCmxPEYK9er5gynnTViPyV6I3RqSz3ERI=; b=0Zjmt8NfRYlLM5enNJOq9A1Jug
	utCiGIpbAIcfM+ZzSzcAjgC+ia4yNd5nVa3xNjkylQ0MgX91MS11oNojPsbr7PrLoO9B69i/WbIVH
	qPLCCCP92cLKgCnvaOw9DMnjS5Fal/jkarFu4NeMIulDr7lNYZN27+I9AAUAzJ0V+13nQRdJS0G4c
	Mt2OtzgP201+8RBop5W9TKM703v+e0Eeb6nIW6j4bTiFLy75gLs6ovRH9PWDZNSBwq1q5eFju9O4v
	nExWD/065WAyEEgEK+aN9Ibre3jwwejUqZRFhTzt4ybBT5fJhroLIDPWbniPOGfFv2W+1ixXtniDf
	h/qtkF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rl4-0000000DXIA-0jEX;
	Fri, 18 Sep 2026 06:07:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rkv-0000000DX9Y-04Cg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:07:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EA8340160;
	Fri, 18 Sep 2026 06:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26481F00893;
	Fri, 18 Sep 2026 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789711648;
	bh=rwSgmxUrtbpCmxPEYK9er5gynnTViPyV6I3RqSz3ERI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=h4WFQ/8Wc/jggR8sKMBzi2Zlht6du789DaDJ0xTGa3JZxxXMy3ltKR660bjxlErF1
	 FT3+cxLFUPnHHaKuFhc++j4Z8W+41fqBWqnj+1PY3zM/0Oh13Q+kd44C9AHaB9B7Js
	 COpd1XPqwmy3nelnzVqVVOVLWvRdF6WcrA/ZQHy4UdIUXA/7QZLnFcKZPzAVTgqYLy
	 UEvNgLl/qu6IGBTHfLvqNRg7x1W8+0ImKiTUDfRJsRQe6fR2Uc8kv7O9tytP0pQRTu
	 3BrOT1anVyp1KVv1s4Gam0IwYcCAh2bwKD5Xyr3XUGsM73cIzWpMqH+zhQ4F78TITo
	 CTSF7QWrP/pgQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Ankit Agrawal <ankita@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH v5 11/15] coco: host: arm64: Connect RMM pdev streams
 for IDE devices
In-Reply-To: <SAWPR12MB9992670293875EF547CA440A18B0872@SAWPR12MB999267.namprd12.prod.outlook.com>
References: <20260910140509.868402-1-aneesh.kumar@kernel.org>
 <20260910140509.868402-12-aneesh.kumar@kernel.org>
 <SAWPR12MB9992670293875EF547CA440A18B0872@SAWPR12MB999267.namprd12.prod.outlook.com>
Date: Fri, 18 Sep 2026 11:37:20 +0530
Message-ID: <yq5aa4pf149z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Ankit Agrawal <ankita@nvidia.com> writes:

> Hi Aneesh
>
> As I read it, the address ranges handed to RMM in this patch are captured
> once and at the point cca_tsm_connect() runs. That becomes the address
> range RMM has on record for the pdev/stream going forward.
>
> So a couple of questions on that..
> 1.  Is connect -> {driver probe / vfio-pci bind } the intended
>      sequence or is that ordering left entirely to userspace/VMM policy?
>

We can tsm connect the device even while its driver is bound.

> 2. Are the resources/BARs captured at connect time assumed to be
>     fixed for the lifetime of the PDEV? If a PCI rescan (or resource
>     reassignment such as pci=realloc, a hotplug re-enumeration
>     happens after connect, is that expected to be rejected/blocked?


IIUC, a normal rescan neither rereads nor relocates an already known and
assigned BAR? To discover an externally changed BAR, the device would
normally need to be removed before rescanning. Device removal reaches
pci_destroy_dev(), which calls pci_tsm_destroy() -> pci_tsm_disconnect()


-aneesh

