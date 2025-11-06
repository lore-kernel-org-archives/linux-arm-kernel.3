Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72B1CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiCLMgsCHHKiMYJvr7tQp5QqiCV5Xr6f8luV8BOdCfc=; b=VCfD2yNGIhE9a5fzv6zMdS+wy7
	cyA5D8IwJz2fBhV1oSZJq9+GKvwcnx0wJ1Znh3qZbqpN8BdkSVQspsVZYYhaEfZNnsH91EbFEDBYf
	Pdh4l5X3TDIeoL85oXJWId6nixEwgTCGpjLs2ZtiD4rL/pVsVBodz5GrHEUTaH1Hmi+pz3kHCa90n
	qdGhNsWkam/YKpNYyX+WEm2PInETp43VfKtIE4+mjHybzAf+BOPqaLtW7ZYtVOMplBLTmdpU/czNU
	4y8hVpbFj2SEBSnmxdLQEPT2pq24/3v/JTh0fxUZcglVa9n/pY6LiTtOoVKJg6Rc+Sf5GcMhR1P5e
	aL64k+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvxh-0000000F7wu-0zoz;
	Thu, 06 Nov 2025 09:07:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvxe-0000000F7wD-16Gk;
	Thu, 06 Nov 2025 09:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 949A1438EA;
	Thu,  6 Nov 2025 09:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20083C4CEF7;
	Thu,  6 Nov 2025 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762420037;
	bh=MieKUKDPbSY+HzttPLXginlv3OHh6q6f7G1egoTKNI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9aQVLpkFlu/1ll+IAGrhZ6ghN3FIqK2wGYl2AF0vkYenPel/E8im3tlXc9H0DjS2
	 CXhoRbDPyJ/NXx08KR8rQtgc5M8gCDOJ/Tlp85TbVuvLnIBQyr3L6qyWWlvBaePJPb
	 cBqiX6e3NLgavy0KbMwuyqTmq4iDyvTvu6hrcPSZq5HrmPMmBSARZGQXYp0UU3B6ww
	 L1z6CZ3urqnNgrQWpPg+Kt4FDn5Nagf1auEfyL/QM9KklhwTEi/sCbjbAL3PHLL3At
	 HIHrPPr3NAD122CcEYD3nbt1Ds6b5anvs0ScnP69r7N2qtYimDeTHUYNSJIvA9iD/+
	 5rFTPfSyqWWAw==
Date: Thu, 6 Nov 2025 14:36:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrew Murray <amurray@thegoodpenguin.co.uk>, Jingoo Han <jingoohan1@gmail.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
 <20251106-positive-attractive-tiger-ec9c1c@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106-positive-attractive-tiger-ec9c1c@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010718_753101_E74C2B3E 
X-CRM114-Status: GOOD (  15.09  )
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

On Thu, Nov 06, 2025 at 09:30:15AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 03, 2025 at 03:42:58PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Nov 03, 2025 at 10:47:36AM +0100, Neil Armstrong wrote:
> > > Hi Mani,
> > > 
> > > On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> > > > Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
> > > > have region for DWC controllers as it has the Root Port and controller
> > > > specific registers, while ELBI has optional registers.
> > > > 
> > > > Hence, fix the binding. Though this is an ABI break, this change is needed
> > > > to accurately describe the PCI memory map.
> > > 
> > > Not fan of this ABI break, the current bindings should be marked as deprecated instead.
> > > 
> > 
> > Fair enough. Will make it as deprecated.
> 
> The true question is what value was being passed as that item (ELBI)?
> Because if this was always DBI - device has DBI there - then what
> deprecation would change?

Nothing, except not breaking old DTs with the binding check. That's why I
decided to remove it in the first place.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

