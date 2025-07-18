Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB67C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbSG1Y+X8xOUH3H+JXTRvCY6AoKsmR5VPGKUkwt5LLw=; b=vwFKIHMnoYWkgAPG5oVEaDP/LE
	5f/dcQ5FDXWmTkXDYvNjUoA6DRqBvs+M/uo2IDi16UxuqwLLQgZS2wWaXe22+vR4YUHPejkanvtYX
	5fUoaG3oM+hSzB0oWn7pE1P+1DdsIcb72DzFjwVnNJoU5Sjs4XgCr7XZ/IAO5viZrRlbTJzArUuWL
	DmghAwoiA4NNU4o16HEu44jpZkqIU+3lrfD1c6pqy3Gxb166iOIcRfm5LaroqX9h3/MnWRF6g2UvT
	npFTkBNsjuFm4VF1M36o5x26bVjPjbxLXacflPLW7Pk2RuhF/Fnr/e6gRIyasUxw4wqDA5New/mhX
	m2c31vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchr1-0000000CFTq-32l0;
	Fri, 18 Jul 2025 09:58:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchTM-0000000CCNq-10yW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62276601DC;
	Fri, 18 Jul 2025 09:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E3DC4CEEB;
	Fri, 18 Jul 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752831223;
	bh=yiX71oyMu9Q924Ckhjn0r4KiqSjGzxzjWsGvEymAH/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etIiMvplr0+qs593DjpUzQ1lQfIm6rFRYQtwAYWiMoOYDIa4bg+osFUh5NaFaJrZe
	 TnGJyKS+IrrpH5HekC/tywj4cRhGaBGpRvgbMqylHEHvHDSAKfRo8nBkDKmgULd+IF
	 oPHJN5NRcdNSraQVptSzUTsTouskMy3NWIvlta14WXSpnoZs/wLySPUHQYJvnc+Mwa
	 gEQlFwCScW3CVpXmUeyd5gSRm/JRA8l8q65OVn0cjzyaE3/UsmtZSkbYqRV975n+9K
	 0oF5j9skTGfRAdPjWGRb893KaENHTxgbb3lXr5luMqe95be3MMPjq//OaY67zFd6UH
	 yAfH6q0dwHaUg==
Date: Fri, 18 Jul 2025 11:33:38 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 0/3] irqchip/gic-v5: Fix some static checker issues
Message-ID: <aHoU8sKPuyzEFRIn@lpieralisi>
References: <736d34e1-c72e-4176-becb-00f0b27be2bf@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <736d34e1-c72e-4176-becb-00f0b27be2bf@sabinyo.mountain>
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

On Thu, Jul 17, 2025 at 01:45:16PM -0500, Dan Carpenter wrote:
> These are few things that Smatch complained about.
> 
> v2:
> I had a wrong goto in patch 3 so there was still a leak.
> Improve the naming.
> 
> Dan Carpenter (3):
>   irqchip/gic-v5: Delete a stray tab
>   irqchip/gic-v5: Fix forever loop in gicv5_its_create_itt_two_level()
>     error handling
>   irqchip/gic-v5: Fix error handling in  gicv5_its_irq_domain_alloc()
> 
>  drivers/irqchip/irq-gic-v5-irs.c |  2 +-
>  drivers/irqchip/irq-gic-v5-its.c | 24 ++++++++++++++++--------
>  2 files changed, 17 insertions(+), 9 deletions(-)

I reviewed and tested these fixes by injecting an error in the ITS
IRQ domain allocation path for a multi-MSI device - code failed and
the retry (that is not there in the code for obvious reasons)
succeeded, so for the series:

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Tested-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

