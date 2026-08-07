Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D82C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGIUAbuxL/GgcZOYXFoP8N5vnO1KeR8oVK2AuhwwhYY=; b=h/xv3q4QrYnnEc3u9BilLUK9Zm
	NuOXZsrICWA3u6xx1YCwjhfwJn/MBUfkgVmlrfE9dHCNd9NjCvrJzSMKaqSxzfJLOWxiO9RgCUQso
	bE9Vn29GK4wIcIrvMykFjk0iPp0KrxIXxQCPFW6QpmIJsSGwM+OEDUAPDxgm8ORU+K4hvwEJDLkp/
	eOQQ6EWmXB1j5UOXaLKtSMaNuicP92A3B0ZCsCyLL/I3XuHDzntJuwiQuSh1Bo8sPx6NhRa7NE9mi
	vDP6RVM2ViAbehbeLq2RMVIJQVIwUA12tQmDVOa4QUI8hfhwIwXWdSfaz6xtjKOzOFaauEDKS0Uzf
	lpIPFhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsT31-00000008oWY-03qt;
	Fri, 07 Aug 2026 22:28:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsT2z-00000008oWG-36Oj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:28:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0623440967;
	Fri,  7 Aug 2026 22:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D861F00A3A;
	Fri,  7 Aug 2026 22:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786141692;
	bh=nGIUAbuxL/GgcZOYXFoP8N5vnO1KeR8oVK2AuhwwhYY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gxA2zNj3ypUN+A8mJkuAmWbNt2KJKYtBA9kh+veuIaAYOBG7c0LmPZ6H20YVkXPMx
	 0iAzP8F/Au/95URMkGLQbFVTkpkD2z9rvbRe+Fk+grZ7mz40zV6AgxKusApQqb45AL
	 PgMqzHwd8Hh4/c2KZqCU8qPgVLen/t8YnAzLczlHVKkwh/e3HNbRNBhY8kruU1Tc5s
	 /rdRBhcJBFmUhOm9BC7zBvagJ9dxBgLxiZuGNvk0+u1rx9hgAYXkeGEEPhRYFpZYf3
	 rbMGst2O2zs3E/vkSaHFg0W1CLMIkS4AiNJR2RbhWfQcsh8M4jjHDtT8jByUnceBxa
	 J2wOaa/k+3o0w==
Date: Fri, 7 Aug 2026 15:28:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, Russell King
 <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <git-dev@amd.com>
Subject: Re: [PATCH 00/20] xilinx: tsn: Add TSN Endpoint Ethernet MAC driver
 support
Message-ID: <20260807152811.68158042@kernel.org>
In-Reply-To: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 7 Aug 2026 16:14:11 +0530 Nagadheeraj Rottela wrote:
> Nagadheeraj Rottela (13):
>   net: xilinx: tsn: deliver endpoint RX frames to DSA user ports
>   net: dsa: tag_xlnx_tsn: add skeleton tag protocol
>   net: dsa: xilinx: add skeleton driver for TSN switch
>   net: dsa: xilinx: implement port_stp_state_set
>   net: dsa: xilinx: register per-MAC MDIO buses
>   net: dsa: xilinx: wire up phylink for the switch ports
>   net: dsa: xilinx: program MAC frame filter and per-port nibbles
>   net: dsa: xilinx: register PHC backed by the RTC timer block
>   net: dsa: xilinx: drive per-MAC PTP TX/RX hardware paths
>   net: dsa: xilinx: opt into TX forwarding offload on bridge join
>   net: dsa: xilinx: offload the bridge FDB to the switch CAM
>   net: dsa: xilinx: offload bridge VLAN filtering to the switch
>   net: dsa: xilinx: trap link-local control frames to the CPU port
> 
> Srinivas Neeli (7):
>   dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC
>   net: xilinx: tsn: add TSN endpoint wrapper driver
>   net: xilinx: tsn: add endpoint MAC driver skeleton
>   net: xilinx: tsn: parse endpoint DMA channel configuration
>   net: xilinx: tsn: bring up the endpoint MCDMA channels
>   net: xilinx: tsn: add the endpoint RX data path
>   net: xilinx: tsn: add the endpoint TX data path


This is so clearly two series squished into one.
We have a requirement to keep series under 15 patches.
The smaller the better, easier for people to review and merge.
A 20 patch series will take forever to be completely clean

Please read:
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

