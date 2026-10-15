Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05DCCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1QpNHtWc4j6OMzJyZp8KxR6YBDf3RH5zpSHpsvCp7k=; b=XVbUzlDrfTvLeiLYP6Slw00/IY
	mTch6MX29eE65qe12RHieTmfp3qx1IzID3GMBmrR7OwLaaIS2SXKLC6W2IbKxDZB+8xpBU3ewdfNT
	sTWA9+VxOqhdsXM/qYQdWgSuFVprmtjUpMUsSNX5VLH0RGxEYQ+7XmNwFgojfvVvd/FSVtuufTErL
	SDDi+X6zASxXUV9LqVT+zQaMsi/ap5uZbs0GSTlhCdek3YSeVq0KC26140wDFIh1gqsU2SbC8zpiA
	824692mZQ2xLLdnG4K96U51UOvbsViY1acOqenvEslWFCwmVhemGRT0VxuRUk8FAbBE5r9guGUYZh
	qemYoAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLPh-00000000EsJ-1urR;
	Thu, 15 Oct 2026 13:22:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLPf-00000000ErV-1erP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:22:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 876F414BF;
	Thu, 15 Oct 2026 06:22:21 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 944113F673;
	Thu, 15 Oct 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792070544; bh=ijgdmJJoARJJ0ZUPqeRSJrO1Ou8HLC5tqytld0XM8dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJyjcEIKsgTcGTvcksw6c/N35HND1bFPDo9bzxz/919el9l/sCIrLRKKweEoWTXqb
	 sw9G/XqAdf4XUWz3xIREfw5uSA5JLsgjs+JprwcFjzCVBNAzSC+d1v8SHdkgdbgds6
	 sWZVXSZpp+dmoU1Zfkw+47in3YY/JFGvIkfltik0=
Date: Thu, 15 Oct 2026 14:22:19 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 00/28] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <atDTi0bNMvzIW4Nr@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <atCqFRdGzFq5dOdT@raptor>
 <atDLgcMeh7kizHGt@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atDLgcMeh7kizHGt@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_062227_474684_67D13BDD 
X-CRM114-Status: GOOD (  11.06  )
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

Hi Lorenzo,

On Thu, Oct 15, 2026 at 01:50:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Oct 15, 2026 at 11:25:25AM +0100, Alexandru Elisei wrote:
> > Hi Oliver, Marc,
> >
> > Gentle ping regarding this series. Is there something you want me to do to make
> > reviewing easier? Do you want me to rebase it on top of v7.4-rc1 when it comes
> > out? Something else?
> >
> > Thanks,
> > Alex
> 
> Just to say that I'm planning to go through this series myself and can hopefully
> help with the review workload here! :)

Sounds great, thanks!

Alex

