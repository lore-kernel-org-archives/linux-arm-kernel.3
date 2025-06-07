Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EBBC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYPvJM2AM0nJ6MKHQqkb8dxJlcm9vRxZyZOZJELy7lU=; b=GilJEYD5RGvRNnYWRsMWlvJXUZ
	fQ2KQtQPHFjgCAMikfFAwrTLC9Xmti7Z4Yd6t0Q7zfcLMzj2UGOZx7oAlgvtysDsbIrJKatCUjLtw
	MT0U1SsAAL4XKQZrJzcOA6x8VZT2Y/JQD8rZkl/C9TJT9+ITwChUE+BZZDst9bDuq1jjY6bUTLHLr
	rrkmxjDFKepSGxoc3Pm35MKU43nmN2YGs+vfNZy+K1Q7JX3Cdr5/5lYEg1uM4LZfzFaO9JJER22IS
	wCkskPVutU4j+STodsdh0zOUMicp90YI3M/pk3Shoo2dcSa5L7t/9Q6I0zhtMmqLJCoVKA82dnryM
	P57aWkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqL9-00000001WHG-2pfz;
	Sat, 07 Jun 2025 09:59:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqIw-00000001W60-3sa7;
	Sat, 07 Jun 2025 09:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD17F43B89;
	Sat,  7 Jun 2025 09:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C51C4CEE4;
	Sat,  7 Jun 2025 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749290252;
	bh=VzdmqcMNvBqE3KC0zj0VVYLrni/GN1NT9ay8sXX/Oms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ns5odZjJt6lhUyX0pMfYyXcMLXpOPa+xQACBahwgKkqgsMf5wo087OjgjS6NihT75
	 eshtaC6q6950Gjl+0Pt8Dzg1KrBozq2Dvkksjd+1Ucy9dxqUrawcZ1BwRuDZc8Acpt
	 NXGi66sE4YW1tZhPCCsJ9IfxzvxTyt0sm30jVFrw=
Date: Sat, 7 Jun 2025 11:57:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ajay Agarwal <ajayagarwal@google.com>,
	Daniel Stodden <daniel.stodden@gmail.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Deren Wu <Deren.Wu@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
Subject: Re: [PATCH 6.11 1/1] PCI/ASPM: Disable L1 before disabling L1 PM
 Substates
Message-ID: <2025060702-deviate-faceted-bd57@gregkh>
References: <20250606015738.2724220-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606015738.2724220-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_025735_017040_975FDF48 
X-CRM114-Status: GOOD (  13.99  )
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

On Fri, Jun 06, 2025 at 09:57:38AM +0800, Macpaul Lin wrote:
> From: Ajay Agarwal <ajayagarwal@google.com>
> 
> [ Upstream commit 7447990137bf06b2aeecad9c6081e01a9f47f2aa ]
> 
> PCIe r6.2, sec 5.5.4, requires that:
> 
>   If setting either or both of the enable bits for ASPM L1 PM Substates,
>   both ports must be configured as described in this section while ASPM L1
>   is disabled.
> 
> Previously, pcie_config_aspm_l1ss() assumed that "setting enable bits"
> meant "setting them to 1", and it configured L1SS as follows:
> 
>   - Clear L1SS enable bits
>   - Disable L1
>   - Configure L1SS enable bits as required
>   - Enable L1 if required
> 
> With this sequence, when disabling L1SS on an ARM A-core with a Synopsys
> DesignWare PCIe core, the CPU occasionally hangs when reading
> PCI_L1SS_CTL1, leading to a reboot when the CPU watchdog expires.
> 
> Move the L1 disable to the caller (pcie_config_aspm_link(), where L1 was
> already enabled) so L1 is always disabled while updating the L1SS bits:
> 
>   - Disable L1
>   - Clear L1SS enable bits
>   - Configure L1SS enable bits as required
>   - Enable L1 if required
> 
> Change pcie_aspm_cap_init() similarly.
> 
> Link: https://lore.kernel.org/r/20241007032917.872262-1-ajayagarwal@google.com
> Signed-off-by: Ajay Agarwal <ajayagarwal@google.com>
> [bhelgaas: comments, commit log, compute L1SS setting before config access]
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/pci/pcie/aspm.c | 92 ++++++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 42 deletions(-)

6.11.y is long end-of-life, sorry.  See the front page of www.kernel.org
for the list of currently supported kernels.

thanks,

greg k-h

