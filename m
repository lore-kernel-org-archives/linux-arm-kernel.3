Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958DECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHRiZJlXf4dgSbBmN34yJL4UwiLKK4okLCKjAMiq/JQ=; b=1Emrf0p9et4NB6ySBtdGufSnQk
	JNYaD5q7o+TeAmeCicRR6a8R/+o7dw070OhVU9thE9sN2IEOoO6+YJREBocsQlb3Ra6oUqZkf/9pk
	4qNFnAwuCHG/u01LMuw1WGa/qgPCWMAw8BE2RV/N/RFAL0iDEnZk9scJCL1yhs/vsgFkEUKasAmSD
	4yUPkRBxMNwv6z+DBpaaNii/juie/AfhHKvsVISaauWD4IsmwQqWsuVq2AnsBvYiJnnXhJb38CnV3
	/nctFPgBBf7YGMdTyS6rkq0YPtTxnio9gKfy+l5XPQOTKX8ASnIIG5oK5fG8OGrmJfxriDa6dXeEm
	tdkPvTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjhg-0000000C5Ne-0XB5;
	Mon, 20 Oct 2025 06:49:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjhe-0000000C5Mj-2hyT;
	Mon, 20 Oct 2025 06:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD5396143A;
	Mon, 20 Oct 2025 06:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5C1C4CEF9;
	Mon, 20 Oct 2025 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760942935;
	bh=Iv/5iWY5nZgg3nkkN0LA+0Joncb4DUQdG2wDhxXdaOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F8wdyfNsAQO5RrxHosn2NmUkErkZfu77XMbnNZ69elG4DJmNwFMYK5RthmmMHGs5R
	 0P3EmcJaPG3npRrD/tULFvayADEjOnvzZzqDYJrCCdDIKXa+Qt0hMioxHu1ZRcstV4
	 aV9moaLdJgnb2fSs8mnnkJUHLHcQNJOwWAo9B+dcy1Oi7lAnOcJu1ZK6s5g8CI2aCC
	 Bt2dTAQu0INm+gukGoxorF4ZDYMk4caIUEkpjnPxsrdL0t2dDziel0j/93yg2pqv4B
	 V+40E5GT8Yo/awfH7alaPMHnovB/hnJFvLSaBK451F1mETVaNeTW+CuxdFm0dgaZkv
	 kVOSyGB4f+tMA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, 
 jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jim Quinlan <james.quinlan@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251003170436.1446030-1-james.quinlan@broadcom.com>
References: <20251003170436.1446030-1-james.quinlan@broadcom.com>
Subject: Re: [PATCH] PCI: brcmstb: Fix use of incorrect constant
Message-Id: <176094293138.11548.16893576609668956400.b4-ty@kernel.org>
Date: Mon, 20 Oct 2025 12:18:51 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Fri, 03 Oct 2025 13:04:36 -0400, Jim Quinlan wrote:
> The driver was using the PCIE_LINK_STATE_L1 constant as a field mask for
> setting the private PCI_EXP_LNKCAP register, but this constant is
> Linux-created and has nothing to do with the PCIe spec.  Serendipitously,
> the value of this constant was correct for its usage until after 6.1, when
> its value changed from BIT(1) to BIT(2);
> 
> In addition, the driver was assuming that the HW is ASPM L1 capable when it
> should not be telling the HW what it is capable of.
> 
> [...]

Applied, thanks!

[1/1] PCI: brcmstb: Fix use of incorrect constant
      commit: ad6014f77f6b66e862a912b5aa4571d00ab30405

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


