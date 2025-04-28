Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C81C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV+LOz120S0Jtp/84dG/TNRs73N6Uw+WapeFQ9kJZ4w=; b=ln4rzTA21bbsMSeHVCDNgFBJHY
	ymRhUB7ueJiVr7wIYGSV/2OmE0b0ccZQEUdL4RdKkaPGhVlqSUWr5dKsXiSGHVy4/WPEvIFlbFm2w
	x4QDcxYCuN+lFZzkiwLEAajuPFBYZbLxyuRW01r7AD+RZXosPxKRDUb1PnynsYgA1U1t6xKnESWP6
	+xZCL0mRDNM6lJesIpsnwjhmNdCCGlJBsOvKG0fLDs/jtD0j9H8OAsqqaBoORWzTY19iTmrKANGam
	GxsqlHFl8Pf2XqCLuzdX+b9IyOBzbBlxusAiMLstuDfsMUc72KDMbmkWUrUXqSqxmytyEeii15Rr7
	5hGr7ykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MUY-00000005v56-3Tf2;
	Mon, 28 Apr 2025 11:17:42 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MOr-00000005ttk-1Hae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:11:50 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BC9F8470B7;
	Mon, 28 Apr 2025 13:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1745838705;
	bh=Veuk+Z/sR4H/xEb/EwiI6wtFnWURIfFvrkb6odssbcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfRFviFJT9ccUMEDhTzc9B++u4Pr5H0EL3t3VfgeVKGXQ8RrEh5S0KxD2Dhq9xug/
	 tHWt+hwHh0cnIdaIS0zwo/Kkc8uQeNCUQ2dz8XcNXVLlHnWQkzaUeHPHJR7ea93huV
	 BBLNPqoZUgqaRrWoc3bxmCNgkApYyuGeTG3bRPggD169NN4Z845VzaOXFILpmRXUWv
	 bFY4iuMo5NjMycRxlzypzkDfjVaBQ6Eg78ETnJTGi2KymeCCTqs1lvpNS54/V1a5od
	 3SR+jOTguk26n3yfFXMlaSLV/h1WAdfCvaJ00HVnwsdEB+zKQ6v85aaikKpRyRBv7E
	 45xCYAe9Y+XSw==
Date: Mon, 28 Apr 2025 13:11:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
	will@kernel.org, robin.murphy@arm.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: apple-dart: Remove unnecessary NULL check before
 free_io_pgtable_ops()
Message-ID: <aA9icDMayHKAocnc@8bytes.org>
References: <20250422072511.1334243-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422072511.1334243-1-nichen@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_041149_566409_FAA87430 
X-CRM114-Status: UNSURE (   8.41  )
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

On Tue, Apr 22, 2025 at 03:25:11PM +0800, Chen Ni wrote:
> free_io_pgtable_ops() checks for NULL pointers internally.
> Remove unneeded NULL check here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/iommu/apple-dart.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.


