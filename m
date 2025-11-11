Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9B3CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E10Z3L9fyYhUUJch0+xrz/espL7BMNrV8rNe7+PPsv0=; b=dx52OUm75NT+3sgEpm1r/S4pwL
	gZf4xN3jxvMIk8tmN2XLWwWrtwOGs8/kgBiqZsFB9KVTS5M35cJgybGscj9qo5X5lvU2KHLrv8eDT
	Pim5MtJVJ8A6eLGpb8N8L1cetc6AS92of3CVmOqhepgBcT/wgTLvZHMvoN8gdGlxStI+sPwDs0IB7
	g7xSJLukD6XwqzunQn+irdCeNKk9QTIPLqkRweFFO9m1TjnJE67SLMsKIPjbzxdn1W95R8sU35mla
	8x/IH7VCrZ4lw7HPoMYmJXF8Xw1WxcRWfY29kRTyUXcD3jJQfi6CvWMOwupObWnvY/ng5g68Bk155
	m3l5w5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIneU-00000007BfU-44Eu;
	Tue, 11 Nov 2025 12:39:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIneT-00000007Bf5-07ob;
	Tue, 11 Nov 2025 12:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F0BB437FD;
	Tue, 11 Nov 2025 12:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3352DC116B1;
	Tue, 11 Nov 2025 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762864752;
	bh=esQHRI8kjTrLvjtgO/6g3Cn+MJc1AfYjyYOhFVM+O/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fk+Onx+GRKUPG65R/pu9BypCrp20PthfFhqBxaKyGgHDdx2K8PW/r5QQR9wW0c6+N
	 SfuQiE1mjfhOSmfAOLXiz15L0Z5AcoINETlSEnh12THxHFehPq5qemda1a36CLUHOC
	 tAWcDKZi/dz/WuevDyD9iJgh0ADaFRisAyFKnagXwNrFLPw+h7wu2DQvlFE05ZAbql
	 A+HHIDliRyNgdg0EiN9Gd0Ao7GnO2X99d6qsxX2o9r1zdEu2T7TskOR8r/wFaXHhdN
	 tJB8+ppTqEyLLk98RsPj8Acg2FyTi8rt4/bfm3+Crhc5aApsD36p0/2dLQ5FwCEdst
	 L+BI2s47TbA6A==
Date: Tue, 11 Nov 2025 13:39:06 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?B?V2lsY3p577+9P3NraQ==?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <aRMuascJFSuE6NBd@ryzen>
References: <20251111105100.869997-8-cassel@kernel.org>
 <aRMZS3EUYx189Xup@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRMZS3EUYx189Xup@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_043913_090660_A08698A3 
X-CRM114-Status: GOOD (  19.16  )
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

Hello Lukas,

On Tue, Nov 11, 2025 at 12:08:59PM +0100, Lukas Wunner wrote:
> On Tue, Nov 11, 2025 at 11:51:00AM +0100, Niklas Cassel wrote:
> > Revert all patches related to pcie-designware Root Complex Link Up IRQ
> > support.
> > 
> > While this fake hotplugging was a nice idea, it has shown that this feature
> > does not handle PCIe switches correctly:
> [...]
> > During the initial scan, PCI core doesn't see the switch and since the Root
> > Port is not hot plug capable, the secondary bus number gets assigned as the
> > subordinate bus number. This means, the PCI core assumes that only one bus
> > will appear behind the Root Port since the Root Port is not hot plug
> > capable.
> > 
> > This works perfectly fine for PCIe endpoints connected to the Root Port,
> > since they don't extend the bus. However, if a PCIe switch is connected,
> > then there is a problem when the downstream busses starts showing up and
> > the PCI core doesn't extend the subordinate bus number after initial scan
> > during boot.
> 
> In principle it is possible to set the is_hotplug_bridge flag on the
> bridge to force allocation of more buses.  We've already got a quirk
> to set the flag on a Conventional PCI bridge whose hotplug capability
> cannot be discovered otherwise (see quirk_hotplug_bridge() in
> drivers/pci/quirks.c).

While pdev->is_hotplug_bridge was also mentioned by Mani, he seems to
prefer a revert + eventual migration to pwrctrl framework:
https://lore.kernel.org/linux-pci/4f4wsgf56eublizg63fz6xmdjixesalb2q3rxetphd55jpqqju@zfyzsxfgiyim/
https://lore.kernel.org/linux-pci/2n3wamm3txxc6xbmvf3nnrvaqpgsck3w4a6omxnhex3mqeujib@2tb4svn5d3z6/


Kind regards,
Niklas

