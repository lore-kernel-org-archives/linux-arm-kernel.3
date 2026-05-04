Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43A5FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=p0oanIq4qZ3RjCfBs2WHeYy7okhhUpZ9BRVwXKOtMjo=; b=uXHkDuQv34ENdX
	knIWYZwJd1du4eIG2B/DE8vY4/jR4Hvw/UydX9gj3vql7ahLtKMJHwEQtsos+YCa/TW7qrG44YMJJ
	cOCmW6OS8Jqp+tyinB7MLsDgn1WNy5F29XAup5SR7devejb7r2Luj0Ntq2WUSkH/JAgckKez4fF/i
	XV+nGhMkxrBP5011mXYPVYkgraUjms9pcfHaOz5qLmX5ufEfrYIxc5Ngca38AhSxn6jaiQpbylbf4
	IQoC40jWV/4qW7snJhbeCrOVQecajBcBHjqYR1WUekYpwiHNnya4t71kCT0XQIKdGz1iabUq0jvrH
	McjEScr1P0lH1UhCq0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK271-0000000EWTb-0Nwk;
	Mon, 04 May 2026 22:50:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK26y-0000000EWSn-0mgf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF76C41883;
	Mon,  4 May 2026 22:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8605EC2BCB8;
	Mon,  4 May 2026 22:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777934998;
	bh=CIMiT+a8mnCUitmVimzYzkH75QFn46DVenKLi+1avlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MCgMS0KBcl46EspKOO230wLDaLJROSln+PT2/MCUp1W/TpcMEG5oK1s7EyRW6Rasn
	 lFn37ODBRHzLINyNT1DzHr0OSd5CMnqlZNTwxibc09xV/MFJCY/QndSRlV6USdbe7i
	 uWl/M0xh6oUwhG8m1LizKFbDAv+f+U765fxp5eEl4ZUkRnV0XEm/C2A6Cdbz3eI4Oh
	 x1FV7We6nKIqmmACW0CWsoiNoAEkhDR2PFBWf7rwoV/4pdHjai14RpdEhaYIQnk709
	 cmJOJS3tub27NsGicuKQLs+I22wEX2GW/OCC+Vrgr8nmE/O4Toe4Oat6gniNYvospb
	 9qfM8Bzrn6B/w==
Date: Mon, 4 May 2026 17:49:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bhelgaas@google.com, will@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, vidyas@nvidia.com
Subject: Re: [PATCH v2] PCI: host-common: Request bus reassignment when not
 probe-only
Message-ID: <20260504224955.GA669929@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414081730.3864372-1-rkannoth@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155000_280399_4B236604 
X-CRM114-Status: GOOD (  10.91  )
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

On Tue, Apr 14, 2026 at 01:47:30PM +0530, Ratheesh Kannoth wrote:
> pci_host_common_init() is used by several generic ECAM host drivers.
> After PCI core changes around pci_flags and preserve_config, these hosts
> no longer opted into full bus number reassignment the way they did
> before.
> 
> When PCI_PROBE_ONLY is not set, add PCI_REASSIGN_ALL_BUS so
> pci_scan_bridge_extend() takes the reassignment path: bus numbers can be
> assigned from firmware EA data (e.g. pci_ea_fixed_busnrs()). Skip the
> flag in probe-only mode so existing assignments are not overridden.
> 
> CC: Bjorn Helgaas <helgaas@kernel.org>
> CC: Vidya Sagar <vidyas@nvidia.com>
> CC: Manivannan Sadhasivam <mani@kernel.org>
> Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
> Link: https://lore.kernel.org/netdev/adcXzcz2wWJFw4d7@rkannoth-OptiPlex-7090/
> Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>

Thanks for the fix!  Was there a bug report associated with this?  Is
there a symptom we can mention so we can connect the problem to this
solution?

