Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98491C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=parPK2sOBJtKO354n/yKxLK2xavQMqNTeuki2IX2Ngo=; b=vcpeNgDkGQCU+lA3i6LsPXEvWG
	9Nuocpc6DoCYk+fPEmBGY81roM23W/nGg0WNF8vUNI3rXLN7OhVQbn6ieC04ShZiPdO+GtVKScQkF
	Uray5svL8Kb27Mr3g36Z+Ppv0XZ6oDYF1rQ7jl02crWUaeTVS3RZk2eiWlpkjIMEYCUXT03FJtD3G
	BS8Z85WUOoZfaVbwg4O/4jsDDJIQwWGD/xKJa5Kt386jX/EQ4Q+XbBzlSaFJqton3lR28K2YruK89
	8EywAGQFlWSEIrMNtqUjRFEU/B/0f7xBrmx1vp3GasJtozQN6O0kBD9sfkOxTeEjyX0qh8teEpqIM
	xKArIWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtC1-0000000HIsn-09m5;
	Thu, 07 Aug 2025 05:29:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujt9U-0000000HImY-36SZ;
	Thu, 07 Aug 2025 05:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFEA2437BD;
	Thu,  7 Aug 2025 05:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB711C4CEEB;
	Thu,  7 Aug 2025 05:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754544415;
	bh=DA+RdVvSTs6M4sCjuqioqJz44R7iAMq+lOuhcUm3W1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNzBxySlD9SAhiXo1+8OFDocyJI5nuXkNkkoMtzucyRzkXCOlgqY1alVZQx4xsjD3
	 lc0quQjSyQx7cTJ5gbHz3zEZa9noi9VkbmGiOFTU/zaJqBa9I6BEXkda4XrqkdJxk6
	 RBVLBT2FBeDLCrW91TSZxZKDSQ9CdDlwj+9SP1uvSHNCZNPjjzaEB1/Af4SW0eQ4yN
	 Pf4DG1k+GeDTBLDvUrJPl0r7nzAVt6/Loqu5MduaMuWXWShCMElmIqEKuzJjAMtiDc
	 zOE60faAuO1AffQonkSpLbA7QAHumSm3ek++l+SVpP6OzhOqASzwr8dhZbsjhHqgcH
	 35vDIJQs9GbGA==
Date: Thu, 7 Aug 2025 10:56:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Cyril Brulebois <kibi@debian.org>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Add panic/die handler to driver
Message-ID: <yqtfhokgfgiwk62lhxkxna26lpexgnlvcmwgfopewlj5u74drt@q6adhcvm7hqz>
References: <20250806185051.GA10150@bhelgaas>
 <0a518bd3-0a20-4b69-a29f-04b5cd3c3ea8@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a518bd3-0a20-4b69-a29f-04b5cd3c3ea8@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_222656_796840_2AC406ED 
X-CRM114-Status: GOOD (  20.14  )
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

On Wed, Aug 06, 2025 at 01:41:35PM GMT, Florian Fainelli wrote:
> On 8/6/25 11:50, Bjorn Helgaas wrote:
> > > I'm not sure I understand the "racy" comment.  If the PCIe bridge is
> > > off, we do not read the PCIe error registers.  In this case, PCIe is
> > > probably not the cause of the panic.   In the rare case the PCIe
> > > bridge is off  and it was the PCIe that caused the panic, nothing
> > > gets reported, and this is where we are without this commit.
> > > Perhaps this is what you mean by "mostly-works".  But this is the
> > > best that can be done with SW given our HW.
> > 
> > Right, my fault.  The error report registers don't look like standard
> > PCIe things, so I suppose they are on the host side, not the PCIe
> > side, so they're probably guaranteed to be accessible and non-racy
> > unless the bridge is in reset.
> 
> To expand upon that part, the situation that I ran in we had the PCIe link
> down and therefore clock gated the PCIe root complex hardware to conserve
> power. Eventually I did hit a voluntary panic, and since all panic notifiers
> registered are invoked in succession, the one registered for the PCIe RC was
> invoked as well and accessing clock gated registers would not work and
> trigger another fault which would be confusing and mingle with the panic I
> was trying to debug initially. Hence this check, and a clock gated PCIe RC
> would not be logging any errors anyway.

May I ask how you are recovering from link down? Can the driver detect link down
using any platform IRQ?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

