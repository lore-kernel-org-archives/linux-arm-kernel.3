Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E411CEE346
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Z9nsGfmU9dabQDurtU6D9qANl+1c6JM8c61+vYKkL7I=; b=pMJ+jaPQQjg4lL
	Vp3Ek/5CownGLmaAHK45xmoMedexFUyNkVlBiXv6WJvuz11XKB4uSdSmrnti4R/uJJDIixZGI040o
	8hgda7N1aGrLC3La6P8UAISoLgPjVL+OAxiyJ6P42p7JST6YlGvXfRv5N++2QGcNtGdWFMDl/x3vn
	3ui2wkG32juAMwlmz377BGopARvyKcsI84FMz+j2hE/G4bj05kx8fLMvHNeRk8OXYeNqoW2Ajyaas
	roHLIFCuRHheRTyl1ioyAnZhopKEeQW5Aqa1nGSaXCTgcVKaINadprxTsiPY3plHIUTIhnPHrxwFE
	RkFtbNydMLRx1jFDzr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPqJ-00000000tFG-0Ekg;
	Tue, 18 Nov 2025 17:50:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPqH-00000000tEk-0iBp;
	Tue, 18 Nov 2025 17:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BC3643CFD;
	Tue, 18 Nov 2025 17:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85E5C4CEFB;
	Tue, 18 Nov 2025 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763488212;
	bh=ZEunj4yri52IXhHshxtw1VSYREUT24C/11HBul8gL2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=h/loyg9uuJtbmzU0qLZHUeq/bPldjF+SJX+hIIS69jmmAVgKRbifIDQhy4R4a0TPP
	 sKPpLSg4GAGsxyTWzhtOUelUF7f16PVYkFnlWD/UXDJvKmURSTFSysmunxcEkPd1pR
	 +M/OjQOHmiY5F2vRusLxR9aFEl9We8xo6oRM9cVsF8LfDzypFUyuN/ILlFzAMZgqRd
	 jeCj5w4uJaErorKIH+KPl5h8i6YK4X3Gw/tNS0EQMbZb2zfud1sL7GZnQlpU77jjCc
	 tWjGZJMOawRsyz2UjAvguMUZDlHM1/tMjgccQuV//AzHwCH+CwZtEVJoMril070gA1
	 8IX3w4OqLCHrw==
Date: Tue, 18 Nov 2025 11:50:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v1 1/5] PCI: rockchip: Fix Link Control register offset and
 enable ASPM/CLKREQ
Message-ID: <20251118175010.GA2540980@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181023.482138-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_095013_511311_A4AB8E96 
X-CRM114-Status: GOOD (  15.98  )
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

On Mon, Nov 17, 2025 at 11:40:09PM +0530, Anand Moon wrote:
> As per the RK3399 TRM (Part 2, 17.6.6.1.31), the Link Control register
> (RC_CONFIG_LC) resides at an offset of 0xd0 within the Root Complex (RC)
> configuration space, not at the offset of the PCI Express Capability List
> (0xc0). Following changes correct the register offset to use
> PCIE_RC_CONFIG_LC (0xd0) to configure link control.
> 
> Additionally, this commit explicitly enables ASPM (Active State Power
> Management) control and the CLKREQ# (Clock Request) mechanism as part of
> the Link Control register programming when enabling bandwidth
> notifications.

Don't do two things at once in the same patch.  Fix the register
offset in one patch.  Actually, as I mentioned at [1], there's a lot
of fixing to do there, and I'm not even going to consider other
changes until the #define mess is cleaned up.

What I'd really like to see is at least two patches here: one that
clearly makes no functional change -- don't try to fix anything, just
make it 100% obvious that all the offsets stay the same.  Then make a
separate patch that *only* changes any of the offsets that are wrong.

I don't think there should even be an ASPM change.  The PCI core
should be enabling L0s and L1 itself for DT systems like this.  And
ASPM needs to be enabled only when both ends of the link support it,
and only in a specific order.  The PCI core pays attention to that,
but this patch does not.

Bjorn

[1] https://lore.kernel.org/r/20251118005056.GA2541796@bhelgaas

