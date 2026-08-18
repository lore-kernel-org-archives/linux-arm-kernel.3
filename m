Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEDFC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGXeti55rfsL+QIxNH+23V/SFO6fjV5CYs9tpc0kf6w=; b=ygY4OHFkWkkDwieDXMX8j9L76S
	vG4Gtg1Ubclo31VXiWa8uwxF4V/APGq5u2MvvzVfnHE9EkWSyeJzMJ2wdwx8AhYSCYEtbNAsYYxzh
	q4fn1/1Hnbe9vJZbOvqsdHvbtCkM9bKH/pdjRKym7F6fF09vAlk1Mfe1Fad23OFcO1ny/y2qfTMJ5
	4kPRM17oelIxQk/xw5pRlqVqiIuiPtG/9IOQ3inPdangWlVqoCEwHVUPErl0r4stNdA1adVKdEInw
	fa8bNdZtdYih7xxqNnyfGNrHsgacRH/hf0G72gRNrpQTV87EqCAQ0d/RUHWoT/hTYktr/Ub2ZpZuD
	qu68BR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDts-00000007Qxn-1rIn;
	Tue, 18 Aug 2026 07:06:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDtr-00000007QxU-08UP;
	Tue, 18 Aug 2026 07:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7550342DB5;
	Tue, 18 Aug 2026 07:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751C61F000E9;
	Tue, 18 Aug 2026 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787036778;
	bh=NGXeti55rfsL+QIxNH+23V/SFO6fjV5CYs9tpc0kf6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fnmDUoqzkz6gpC9rE+MpRmsVk4t4fqISEBKKGm0FAVNtaTxh7CSfS6eX10wQVFC2M
	 afGm7/6KhniQcLBzXVmICJtEKf/Ie9fiN+4u0TeFtq9FmAQmQQBuC5xEydaFk92DNi
	 0tMxnMJwlttlLoYT8hBhFX3ArF9aK0m1Dhj/F9tWgU/AiV1KzcnACYoseTQjvOQWKQ
	 wbfd0aK9sNJ22POKHl6f3qi0swzBrTlpFPdOSQdYXHQZTpycUhWs6Hi8Jrc9azl0El
	 7JEVYeqgjEyvtCdHjc+GtO3J9IswyLHsyXZvaeMOXSXxFQbxGzQbDs7rP0bzi8SuNQ
	 Hm1SbNdFIlU+w==
Date: Tue, 18 Aug 2026 09:06:11 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
	Manivannan Sadhasivam <mani@kernel.org>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, heiko@sntech.de, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
Message-ID: <aoQEY5PDU5iqnD9S@ryzen>
References: <dae17d36-c7d2-467b-a621-3c55e08a67a8@163.com>
 <20260622171448.GA678675@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622171448.GA678675@bhelgaas>
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

On Mon, Jun 22, 2026 at 12:14:48PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 19, 2026 at 11:29:39PM +0800, Hans Zhang wrote:
> > On 5/6/26 22:00, Manivannan Sadhasivam wrote:
> > > On Fri, Nov 28, 2025 at 01:09:06AM +0800, Hans Zhang wrote:
> > > > Current PCIe initialization exhibits a key optimization gap: Root Ports
> > > > may operate with non-optimal Maximum Payload Size (MPS) settings. While
> > > > downstream device configuration is handled during bus enumeration, Root
> > > > Port MPS values inherited from firmware or hardware defaults often fail
> > > > to utilize the full capabilities supported by controller hardware. This
> > > > results in suboptimal data transfer efficiency throughout the PCIe
> > > > hierarchy.
> > > > 
> > > > This patch series addresses this by:
> > > > 
> > > > 1. Core PCI enhancement (Patch 1):
> > > > - Proactively configures Root Port MPS during host controller probing
> > > > - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
> > > > - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
> > > >    and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
> > > > - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
> > > > - Preserves standard MPS negotiation during downstream enumeration
> > > > 
> > > > 2. Driver cleanup (Patch 2):
> > > > - Removes redundant MPS configuration from Meson PCIe controller driver
> > > > - Functionality is now centralized in PCI core
> > > > - Simplifies driver maintenance long-term
> > > > 
> > > 
> > > For the series,
> > > 
> > > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > > 
> > > Bjorn: Could you please take a look? This series has been floating for a
> > > while...
> > 
> > Hello Bjorn,
> > 
> > Any chance for this series to be applied?
> 
> It's too late for v7.2; we're already more than halfway through the
> merge window.  We can look again for v7.3 after v7.2-rc1.

ping


Kind regards,
Niklas

