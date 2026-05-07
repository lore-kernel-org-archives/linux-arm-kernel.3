Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E498CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfUFoc81hVGu9gP50alI9SF7Jjd0HuyaUi9m0FbL6LY=; b=RZ6ALZ5Fn2H2yLH7OLvdbneIiZ
	YxvMZq2260gZC0mTZgP8+o6PmIBeOPKgxbG99f+Fyk5Fyh+XlPf1ca0irEEyYOrsgWCF9Gh5vnlBW
	j1VTBT5dbBWuaM45/CR6y4GuCl+CZWeKfsKkW6nK9ONmV2wu31zf8vOKoSQYqRb3Ra/b7/Yk/VFSy
	W2zPcfI+QV5LM4NHNucLB1jvFi/T4YzzDQ3tDDy278mibRGNInHHMY1yQtQLS4vfQtr/Pd20+RSG4
	q+1Ir9nV1iU/MFgz38fOak0XRZoDaBshAX3aGxb0STWTGnWWT/R32CSqUp1yCiUpdHFO5Vcv0EIA2
	rxVF3AlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPG-00000003EFK-0Y9u;
	Thu, 07 May 2026 08:48:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPD-00000003EDE-0uKx;
	Thu, 07 May 2026 08:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B3E43E08;
	Thu,  7 May 2026 08:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BE5C2BCB2;
	Thu,  7 May 2026 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778143706;
	bh=1dxLIMyeH6ASIo+C1XdXDmD5C+ZI9/aOanZo36hb3U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZfiMdCwxFX1fwzvvE6RmY9TTyrItR3XUIk2CQpoikH3Lf681+Jf+laxq7te6R8Bl
	 ieqc7ass6oH+xod4ryqzpYmONyn4f6n4VbTcRHHukqGCMDyIMyy9Fgj95MlNyw6jWM
	 9Y9o83oX36hRozySeypB+GBiuXuWyAorh6W/nNqaURGmjrneOphG66H+ONGNGHPO1o
	 RPR9kiISikxw6eclcMlNS9DCdFmOZa8WFhygpFmHdlbLkzKNzVp5N2YKE8LS2uZfwu
	 lT87HTaGq3x4vl1vWGbSZ4dEHR2PHvoNlplToKfvXrT+bowU/PFw9pN62hwmJdiN1E
	 ABqdaFKHOMBnQ==
Date: Thu, 7 May 2026 14:18:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Hans Zhang <18255117159@163.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: brcmstb: Assign pcie->gen from
 of_pci_get_max_link_speed()
Message-ID: <q3c6li5kld57rdxxpxr3dxvimzvdyr57irtj2iyryftri6cy43@3vbacremhcls>
References: <mid:20260501202438.376033-1-florian.fainelli@broadcom.com>
 <20260506164537.103196-1-florian.fainelli@broadcom.com>
 <t3u7r2ee6gdkjceula2ctvgditgxibwxcpaejc7ekbgdjog3br@c6n6ztzsbhpu>
 <83ceeae6-20e8-40a5-bc0b-6231d2118b6e@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83ceeae6-20e8-40a5-bc0b-6231d2118b6e@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014827_278660_D33FD0D2 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, May 06, 2026 at 11:15:50AM -0700, Florian Fainelli wrote:
> On 5/6/26 10:08, Manivannan Sadhasivam wrote:
> > On Wed, May 06, 2026 at 09:45:37AM -0700, Florian Fainelli wrote:
> > > After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
> > > pcie->gen stopped being assigned and as a result the established PCIe
> > > link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
> > > to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
> > > 
> > > Whether the 'max-link-speed' property is not specified, or it exceeds
> > > Gen3, resort to the HW defaults.
> > > 
> > > Link: https://github.com/raspberrypi/linux/issues/7343
> > > Reported-by: Dom Cobley <popcornmix@gmail.com>
> > > Reported-by: Phil Elwell <phil@raspberrypi.com>
> > > Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > Since this is a 7.1 material:
> > 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Thanks!
> 
> > 
> > > Change-Id: Ic5431469dd7a6c8b391f84f27119dad876256880
> > 
> > This Change-Id is irrelevant to upstream.
> 
> Should I resubmit or can it be stripped while applying?

I hope Bjorn can drop it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

