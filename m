Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53419D74962
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EA9CUgTC4Juvta7B91Kq5htCC2uTanYEkMECpDwaTM=; b=mA9F0imATgSLDZuE/4nT0im3Sx
	0u18cjygHHwB4SVLkcoRhwiARoiYyYp6vnWAB54+TFzPjuck4ohUlaeb/Cccx7oHKuVu8OKXTSHek
	NZ55utNLCWMFYHmTFAkVCcbWRZbyHpfCg62MnMkAoQsRohPSZKhP4nSlDjBDx1/IwJQ2yiGVMAbej
	j8k4xfRZpY6IMKTiw1uhvitglhuPcASsu/jL9m36MKhwNeYg5rQN6U4e8oZ86Qd+PtmcYIU4V4NPb
	RB+07GZz+mqwtM00NKR3NSLp/ISx7ApiQNvU3YQatzkOSF+VbIkfaB9hhZ5/WfTany6JVEDpaoweg
	KMPhXX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60ru-0000000Gjuv-1KK9;
	Wed, 30 Oct 2024 05:03:42 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60kf-0000000GiyP-0Yz8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:56:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4tiSW033939;
	Tue, 29 Oct 2024 23:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730264144;
	bh=4EA9CUgTC4Juvta7B91Kq5htCC2uTanYEkMECpDwaTM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gWeb7b70TvlWYB2Wm+rPIixoPrV0rgfprDynbM6p/P8JaVsyOXyq5+vbguNzr03pQ
	 FkDJYTUA6IVujGAJn/CSDN4lP+YeCuG4/LdLlPnX7OFfqbSh6M+5iph40OQyc226ZR
	 o9XxXcPNFFVrd4cCuRm3Dn3tmSAjyadyNgfhvwf4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49U4thc1119737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 23:55:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:55:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:55:43 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4tcHH066220;
	Tue, 29 Oct 2024 23:55:39 -0500
Message-ID: <25c5c744-2e4d-4df6-a080-8f5705a47884@ti.com>
Date: Wed, 30 Oct 2024 10:25:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hns@goldelico.com>, <andreas@kemnade.info>, <iommu@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        "Nagalla, Hari"
	<hnagalla@ti.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215613_302004_459AC486 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Robin,

On 28/10/24 23:28, Robin Murphy wrote:
> Hi all,
>
> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.
>
> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.
>
> Thanks,
> Robin.
>
> [1] https://lore.kernel.org/linux-iommu/c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com/
>
>
> Robin Murphy (4):
>    remoteproc/omap: Handle ARM dma_iommu_mapping
>    media: omap3isp: Handle ARM dma_iommu_mapping
>    iommu/omap: Add minimal fwnode support
>    iommu: Make bus_iommu_probe() static


Tested this series on omap4 w.r.t. remoteproc subsystem on v6.12-rc5, it 
works fine; attached logs[2]. Therefore, for series please use:

Tested-by: Beleswar Padhi <b-padhi@ti.com>

Many thanks for working on the fix.

Best,
Beleswar

[2]: https://gist.github.com/3V3RYONE/f9244a0aa0e3514b7c62f7965cbb0bae

>
>   drivers/iommu/iommu.c                    |  3 ++-
>   drivers/iommu/omap-iommu.c               | 26 +++++++++++++++---------
>   drivers/media/platform/ti/omap3isp/isp.c |  7 +++++++
>   drivers/remoteproc/omap_remoteproc.c     | 17 ++++++++++++++++
>   include/linux/iommu.h                    |  1 -
>   5 files changed, 42 insertions(+), 12 deletions(-)
>

