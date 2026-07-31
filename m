Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8ACC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=V0cx84YDl6LOig0HnLnRYdR8vDgzvhQjJIOIpIIfTbs=; b=nhTqwoHT1nEIqc
	qylzG3a+E0ksPpTRdlbYewAF/K2sh0dGfFuuCiPzYs4tkKgms/Vp7wIpOCd0sLNX28c80sA6eCWtj
	IfQiCZfWFAwtiEAXnzE9N6TBSjAK2MKp7AJ4XqM17xvAZPDOvbdM4sPL+FshWwFpRPo2J97Zbp2gx
	C8AscVmrRcAnSWY7ElAB+yazMk5a5CxRm60sfNH8e4m5diGndjA/X67u9aaOsP4N1Dfe14DdLTZgD
	sL4LAqiICD11EWNoKfJXVpGIrvjTrrSUJr7T/6F6cJNYHPA/YxPUnMtTRLZpTzpiT4EChc9qAq37t
	ug/YpSGAmeJcG8DsBTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpphO-0000000CwrD-2M6n;
	Fri, 31 Jul 2026 16:03:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpphN-0000000Cwqs-0Rnt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5FD96004E;
	Fri, 31 Jul 2026 16:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CFF1F00AC4;
	Fri, 31 Jul 2026 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513779;
	bh=V0cx84YDl6LOig0HnLnRYdR8vDgzvhQjJIOIpIIfTbs=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=T/EpjkArdt1UgrmZZjFVnYZknZPxp8v78vrWDVYTN/uHtZ72MakLbuKPkn1azv3kl
	 FaKNPlBsJharLNGbVsO8hm1vaji6oeX03r2KXZCcZtPmdwoQsZiOmka0om6WfUNgRm
	 tkeg48/USHInUNaOpqDlJdUkzVvq50aADNBz++Jcsecaj4SXhqUfZJDJW5MVhNcc6R
	 IALqTbNkKO0M/VE11ldTpe0YLG+gf413/B6dyGukXy+zeSy9x1Fkop1bW11U18b9L8
	 9cLhOXgH+S/PrAGfEVT9iR9seSc7hP5FIxMldcl+gfWPSAZBA2lQhAaC9zLXVmIc9T
	 0KyiTzxyyNIjQ==
Date: Fri, 31 Jul 2026 11:02:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v4] PCI: imx6: Update MPLLB bandwidth to improve i.MX95
 Gen3 PCIe stability
Message-ID: <20260731160258.GA1571469@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731030546.850457-1-hongxing.zhu@oss.nxp.com>
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

On Fri, Jul 31, 2026 at 11:05:46AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Bandwidth marginality was observed during i.MX95 Gen3 PCIe tests with
> the default MPLLB_BANDWIDTH value (120). This margin degradation worsens
> across voltage and temperature (VT) variations and different test
> matrices, potentially causing link stability issues.
> 
> Testing with MPLLB_BANDWIDTH value of 140 (0x8c) shows significant
> improvement in bandwidth margins across all VT conditions and test
> scenarios.
> 
> Implement PHY register write helper function and configure:
> - MPLLB_BW_OVRD_IN = 140 (0x8c) for improved bandwidth margin
> - MPLLB_BW_OVRD_EN to enable the override
> 
> This ensures robust PCIe Gen3 performance across all operating
> conditions.

Thanks for including the previous and new MPLLB_BANDWIDTH values.

I'm fine with the patch, but I think "bandwidth marginality" is
awkward wording because "marginality" doesn't seem to be commonly
used in this context.  Maybe something like:

  We observed poor bandwidth margins during ...  The margins worsened
  across ...

