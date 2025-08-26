Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6DCCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHZTLFlxAYI1wokhjuCEuruyUylGu43DM7IKjkNYSic=; b=hre3cSVPJ/3DzSwS+q6WDsF8Gp
	lyK9HLgVQjhkBN8inkLrUHH7jxsAP5iY3FRBTSpSNou9MLDsaHDvfADbQ4wFCoT/AIUphLBpCNypN
	o/UPX68dQadPwhMSGSrs6kbjxLloW1VB+mcDouumM8IJRHubUnegjSDBojxLS7LIx5KZcH2IFmi8M
	KAob/gIB4Je+hiNvr4n670vLVVmvWXye0LNELIPT4OAL/yw+rYB8KzzN/f4CKXOR6qND/uslhmgHj
	Hae9/dfIdPe8iMu4xambwo2Ak2pfp1E8PTja6LfkTqOZ/6/WdQW5KVGAalrGZlOTbBbdQf0xp+rIR
	dxzctUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtlZ-0000000C6hp-1WSK;
	Tue, 26 Aug 2025 13:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtPf-0000000C2ix-0VFl;
	Tue, 26 Aug 2025 13:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JHZTLFlxAYI1wokhjuCEuruyUylGu43DM7IKjkNYSic=; b=etY5PLFfHvVwRjOXszye/DGGB6
	EeDfwhUfPBBHElGIuEt4CBRy1AldhAFBccZnj543K6AV4Xvqq6pcdNIfqcf1J9sqxP9GTv1Rld421
	0AuJKLh2CRWDkm+Ul9/DFHMDYluLA3AIkv78pFeyA09fvuZwxu6ukwM8cR1N29k6qKImuFZmW3MMM
	qCVOi9ccAynQbDiNrFS78BcReEN5xdvzHPhO4NkOVApB1RYQ/p8auBap2lsOA66RFcIqiEM+p/Jrp
	EIJVtCqUjQE/N3Tepz7e+3E78hAlvb2elxzZDQC0yDBfD4BGP9yDnTXc67Vd2CW73P1jADDmWRbp0
	QXd2jvjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtPb-00000002DYZ-2cEd;
	Tue, 26 Aug 2025 13:08:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A98B6300323; Tue, 26 Aug 2025 15:08:30 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:08:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 17/19] perf: Retire PERF_PMU_CAP_NO_INTERRUPT
Message-ID: <20250826130830.GZ4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
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

On Wed, Aug 13, 2025 at 06:01:09PM +0100, Robin Murphy wrote:
> Now that we have a well-defined cap for sampling support, clean up the
> remains of the mildly unintuitive and inconsistently-applied
> PERF_PMU_CAP_NO_INTERRUPT. Not to mention the obvious redundancy of
> some of these drivers still checking for sampling in event_init too.

Ah, clearly I should've read the next patch... n/m.

