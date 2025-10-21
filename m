Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114F0CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aq47q2erZ4labhGNhKxggmDjNAXQgGxMUcPu49X1w1g=; b=2fKQRBifL33DaCiJc2Gjm703vr
	IKPCvLbC/uryH3RDaLbIDNCJ8JxAIkrP43hgWDYS06PDOYCz363MN8qg95EPBINXQHC6DxGRdNs5d
	bhCBY+HvO+l8H1iFplTOGxzT5LEcLvK8eQJdsGGEtrjaNYddFHkJcXzvmhC81ig47K7Y8+fvk7pTO
	ItdqKFd4tnaKYETOpAG5SoU6e+Ej1uaesHYLgzSJRMfkfIIZ+fY115sTwjRbWC6tsMQua5lBdmvci
	rtC0kBVQLdlAnI91VoqvMEGT/hpcQxOIZGYv7cpZZ86mv9HGzdpU2YMztmBWGBnAw2iLL0GttWcPm
	88bIzMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2AZ-0000000Fa8a-2jYr;
	Tue, 21 Oct 2025 02:32:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2AX-0000000Fa7W-3z0g;
	Tue, 21 Oct 2025 02:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B5E440966;
	Tue, 21 Oct 2025 02:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68ABC116C6;
	Tue, 21 Oct 2025 02:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013933;
	bh=8UAGN1YhXZIbc93snwY/CRtubSt6sDkHXFrJ7cAY2Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHcnkSfVYUiNs1+laZL/oTzN3Hwxulz3SDXzmd39w+CmT5bYFjNvL3B2LlK9tR2EZ
	 MsV+kFf0G0g34cY2gCGrybn3d+8LVj5mPlzQx65l6HFVpSX90tezuAsndIbl8dwdM/
	 IIKkMsR6N2dMg011uJPL28VumrpkuIW5fMBZPytwtZrLDtraufFed0Xf55NANa26OJ
	 OLhoySAkQjU6VOn+Ojr32RTbf4nUiTFyJ+SUYaQechFw9ycmSg9Iyn1bkx8nlbpYjx
	 7l0l0rKtIRP7EIY2QMIhZwgN9s49EkHms8o4WL/BnTnrMl27ydTB3EENp18Fo/09Ro
	 tIPFNNyq18iiw==
Date: Tue, 21 Oct 2025 08:02:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
	FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <diederik@cknow-tech.com>, 
	stable@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
Message-ID: <aaug44bngs5amid7un4plotcjpbc6ym44cztnhet7z44ybywgc@apzhg6enhxgy>
References: <20251017164558.GA1034609@bhelgaas>
 <54FD6159-AE45-432B-8F0E-4654721D16A6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54FD6159-AE45-432B-8F0E-4654721D16A6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_193214_008697_733FDE0C 
X-CRM114-Status: GOOD (  15.12  )
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

On Sat, Oct 18, 2025 at 07:07:35AM +0200, Niklas Cassel wrote:
> On 17 October 2025 18:45:58 CEST, Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> (snip)
> 
> >> 
> >> Thus, prevent advertising L1 Substates support until proper driver support
> >> is added.
> >
> >I think Mani is planning a change so we don't try to enable L1
> >Substates by default, which should avoid the regression even without a
> >patch like this.
> 
> Sounds good, I suggested the same:
> https://lore.kernel.org/linux-pci/aO9tWjgHnkATroNa@ryzen/
> 
> 
> >
> >That will still leave the existing CONFIG_PCIEASPM_POWER_SUPERSAVE=y
> >and sysfs l1_1_aspm problems.
> 
> Indeed, which is why I think that this patch is v6.18 material.
> 

Not strictly a 6.18 material as the Kconfig/sysfs/cmdline issues existed even
before we enabled the ASPM states by default in v6.18-rc1.

The default ASPM issue will be fixed by a separate patch which will be generic
for all platforms. I'll apply this patch for v6.19.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

