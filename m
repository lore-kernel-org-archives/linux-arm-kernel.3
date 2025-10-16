Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13948CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ereBDfQE13p/OxAED0WFCdFyS6Zq9gCplE608zWHLVc=; b=ZVPDI1GjX0+UV6
	H/W655g7shPwpzee6EJVhkJfoTfYtIDae8DL3IiwOdIcEH/8eUnZFyQKgCljEehTPAAZfZwnqtRCp
	MHWgXTDZ6ipjqfQZpBHMfIBfDe1kIBhdzhE2Ou6mO6zCoSab89p50cdGjr5Z0hysCYrQx7h8a4QPz
	OZ0nGr5k5qyQKrX0XZCrnqxotFRnieSxsT0nDMAHFasUC3+HTMW2nlNkZx7VwAXgLpTtwjUCDJVY6
	mj2VDiXiHmKBiJu3CIZs/VvQaV2NjZhHeOXNNRZ9917V/851jJVbu/+kAJ5yvCc7XpGzEV/vtNHuY
	3Bd6nEhw+1XwnHjHjYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SAe-00000005d7F-3fIZ;
	Thu, 16 Oct 2025 17:53:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SAd-00000005d6b-0grx;
	Thu, 16 Oct 2025 17:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF9CA455F4;
	Thu, 16 Oct 2025 17:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A09C4CEF1;
	Thu, 16 Oct 2025 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760637226;
	bh=bcq7dWKKhPAJAQH1BkuW4iJjxEE0ztxwKDkUSRYWSvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=C7r4WbKNN5UzgAT8kp68WroN3O01umZ1ew9BKhuuFHuHpBQLWVNDtMdGpDWYqQwFg
	 1PZcA/RF64UIaOYvaxJ4H5Jqh8zCoIjBg4+fMpUcQMITsiO3/LNf/W93ZVqp3RZGE4
	 cqlrmH8bwxOBbIIuHD8J+qcEwKPj81L6U9RlKlu2e2Mx0dnzs2Qa+2ZOi5K3NMBi4d
	 +D+2YlqWLHUsqIxOP9j2Gqn7nIZ7FGWI58/tj4VfTdIq4CkNTfTz4uPDlq3c75AWXW
	 Hv+e3JqAgWzzqGvjxstRhsHmLY+JvQ68SKt5pBuanBwXSNzQ60yX+EXvqZfVRG0ysS
	 FFPkiW2/0H+9w==
Date: Thu, 16 Oct 2025 12:53:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Disable L1 substates
Message-ID: <20251016175345.GA993781@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016172504.GA991252@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_105347_223562_C4148964 
X-CRM114-Status: GOOD (  12.73  )
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

On Thu, Oct 16, 2025 at 12:25:04PM -0500, Bjorn Helgaas wrote:
> On Thu, Oct 16, 2025 at 11:04:22AM +0200, Niklas Cassel wrote:
> > The L1 substates support requires additional steps to work, see e.g.
> > section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0.

> > +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> > +{
> > +	u32 cap, l1subcap;
> > +
> > +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> > +	if (cap) {
> > +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> > +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> > +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> > +			      PCI_L1SS_CAP_PCIPM_L1_2);
> 
> I suspect this problem is specifically related to L1.2 and CLKREQ#,
> and L1.1 might work fine.  If so, can we update this so we still
> advertise L1.1 support?

Hmm, looking again at the spec (PCIe r7.0, sec 5.5), it looks like
CLKREQ# is required for both L1.1 and L1.2 (but not L1.0, the basic
L1), so ignore my comment here.

