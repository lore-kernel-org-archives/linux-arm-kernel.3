Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA399CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erRPpCwv0zrGxM2LnT16YuV44X2ypJ/NozmhWetNO/8=; b=mxnH1koRPOSDnvrhMnQo/3X0te
	Ibzo+PoLDkUXDhazuO/g2mzdcTkeDtF3XIsbN483EGO7gAGl95563X5w6dcT0XKOEu/JQ7AhDTH7z
	ycrydf5Q9dW3wIsHS00JY2URS1kBaY+6+jlfsCbUZHrjrJDURbrFRkCMNbif4YqC2msR9GYHmXu6f
	VRna+OjaXfsew4DQt2Ia6EVmOxvaOqnAyLyMu1D0QNDvp2PyQLfildmkD459PwwrrLpNL2NQzzGAE
	flyCdJg+ey0/aedkX3yX4eAv2KdAmIKe6Uh1+24361bom1YABEg1/+27nzWtplHxD+wkj+VFDb0/N
	WSFPBuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3gr-0000000CUqB-3UfV;
	Mon, 01 Sep 2025 12:31:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1kl-0000000BuFd-1hYp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:27:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6961F16A3;
	Mon,  1 Sep 2025 03:27:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B6EC3F6A8;
	Mon,  1 Sep 2025 03:27:09 -0700 (PDT)
Date: Mon, 1 Sep 2025 11:27:07 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v7 09/12] perf: arm_spe: Add support for filtering on
 data source
Message-ID: <20250901102707.GL745921@e132581.arm.com>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
 <20250814-james-perf-feat_spe_eft-v7-9-6a743f7fa259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-9-6a743f7fa259@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_032711_481177_78246C8A 
X-CRM114-Status: GOOD (  16.18  )
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

On Thu, Aug 14, 2025 at 10:25:31AM +0100, James Clark wrote:
> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
> when any of the filter bits are set.
> 
> Each bit maps to data sources 0-63 described by bits[0:5] in the data
> source packet (although the full range of data source is 16 bits so
> higher value data sources can't be filtered on). The filter is an OR of
> all the bits, so for example clearing bits 0 and 3 only includes packets
> from data sources 0 OR 3.
> 
> Invert the filter given by userspace so that the default value of 0 is
> equivalent to including all values (no filtering). This allows us to
> skip adding a new format bit to enable filtering and still support
> excluding all data sources which would have been a filter value of 0 if
> not for the inversion.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

