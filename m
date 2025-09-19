Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53325CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VgdTBJ48Wmvy1eeseJAQPEP7FCyK0i5+ZYQcsn48DQ=; b=d6WKin8GHBzx3U9ZW+HIw4XSN6
	kLvkyEAuXmyCetB1AkoGTNLL+0+QSjjzDU2jcibdjSXQ27iE8B25HBPIh9U5/rqTosKT8M+XJMXBF
	w7si8uoG/WEN2QPydrt1iRMwA9JkdoncfvDjR2dCiDeqchur9nhTTt2Vcj/UhziURPiR2GWS08b5r
	2mnEMvut+J+Yv3Y6oa2pxyh9HisQIbOycCIOsaZgM3r+a+qkGyO7fnzGvibLZixtyb0fW05w8Ik3q
	FWYGH2t4ufp3ioBDKNbh2yX4Hx4ZOghe5TiHfsqIMpy67gK4b947DkS+nzdnviUMdYSUgY5mpwpiA
	AVtXKASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZWF-00000002jM0-2QZS;
	Fri, 19 Sep 2025 11:43:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZWE-00000002jLh-14TE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17A4360140;
	Fri, 19 Sep 2025 11:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851A9C4CEF1;
	Fri, 19 Sep 2025 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758282192;
	bh=5wglAAJW6dtD3zr2BQTAlG8RqtqO5qLqQ6ESZ1Vv9nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGsmlEpmgzvww2EUDkPbshduKf9U4oiLIqpMJorBL5ymV8RtIxABtWRBZyI/Xa1E0
	 M7FJyq3adqvTP0doBAN18XoGYF7BYkKI+imJFjheRTGreD4lRVA5N8FboL3J86OHMy
	 nxKObp9UBog6lvkwb8piDCsxuCsFVHyC0v+bJPNWa0Hdg/XQtJC3BlK5wtcEzU/ig5
	 m1r9Qz2Qc3oFWQhssbajVJKGf3RUs4zeBjqT+tBKPl9pchahJf8M3r2VilQX0L1RKX
	 ozQBfdnnbrDOIULdHnrKnjXMnhuroQU3mPnau7gq1WGFBBm+iCH6bSaim92dJbqljz
	 3NCgo9ff0IHrg==
Date: Fri, 19 Sep 2025 12:43:07 +0100
From: Will Deacon <will@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: catalin.marinas@arm.com, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	beata.michalska@arm.com, ptsm@linux.microsoft.com,
	sumitg@nvidia.com, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arch_topology: move parse_acpi_topology() to
 common code
Message-ID: <aM1By_d3K_hW-JTZ@willie-the-truck>
References: <20250919085918.5442-1-cuiyunhui@bytedance.com>
 <20250919085918.5442-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919085918.5442-2-cuiyunhui@bytedance.com>
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

On Fri, Sep 19, 2025 at 04:59:18PM +0800, Yunhui Cui wrote:
> Currently, RISC-V lacks arch-specific registers for CPU topology
> properties and must get them from ACPI. Thus, parse_acpi_topology()
> is moved from arm64/ to drivers/ for RISC-V reuse.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/arm64/kernel/topology.c  | 87 +---------------------------------
>  drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++-
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 90 insertions(+), 87 deletions(-)

I'm fine with shedding code from arch/arm64/ but this needs an Ack
from Sudeep.

Will

