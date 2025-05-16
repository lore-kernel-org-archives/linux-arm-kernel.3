Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B1DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCC2wFvX+VRXPFM+UqJWuDREx7PiggiD0yB6yD7SpzU=; b=Yr6mLA6g55p1pB5VoBSGTmoVvO
	CThxbqzjIBlwN2BMSXfBhAt7DnfIfXjMmnVXWhIrlqmG4R7qwhYtOIRYQ6Zmn7X1dPDUqELcG2W8M
	+lEiZovECE7qMjm8RpbqiBwEEDVoqcJWF9uTzZ8pMcqKxZdD8XzXmyGre293kGN8yxZJmWZEpQGAY
	wau/bqfgf9xvXhwkf6aRLPMaC0wuwHSuluDnmupVAxvG5rdbyUEQAbMHVnDwH5vS9e7kiyZEnoRMq
	r4/Onct/Dp2ohU7A0dnSwuAP3LDpWMieI03pY+phfBxzSZmJS43+oH6Sw0TnS+1sw4GT1BAr/h7+c
	hxvCBLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxg6-00000003ynG-2SdJ;
	Fri, 16 May 2025 16:12:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxDW-00000003tO3-3Bm0;
	Fri, 16 May 2025 15:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5685743786;
	Fri, 16 May 2025 15:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B69C4CEF0;
	Fri, 16 May 2025 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747410202;
	bh=JX6JzbUHGsSlhtbCchsrt85j6DDVCcgzO9j3GrNG8PM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T42LItu/hK1i86e2aCIt+WEP4NJzf4EQ8lDPZyKYgO3dkrEMLM78MUkRcCoDKnnzC
	 /9WjEBYk989deDxl0d8r877edJv0c3Mlkbxpjtte66iq6UIR67890PwDSSXIA5Pjau
	 znqMjRHhNDgUHyu2cbOk0o7+9H2GIGfRa4+6aHt+OaCjN5eURvrkHxoaP1QYy/GvAk
	 eCy0T4bLBfr2cnlrV+wKiqXJNc+xxwsXAapB0qtnmOgWkB9W/dqwYyj+UPNydatxXP
	 sFz63Dg8wJ/9moBgA1cZdZVZZQms6APs9jDtbZubuCTKKT6tGWITa1WiV88T1+5FBY
	 fx5M4fHy8MM8g==
Date: Fri, 16 May 2025 08:43:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net, korneld@google.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 rafael.wang@fibocom.com, ricardo.martinez@linux.intel.com,
 ryazanov.s.a@gmail.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT
 and FAG count
Message-ID: <20250516084320.66998caf@kernel.org>
In-Reply-To: <20250515180858.2568d930@kernel.org>
References: <20250514104728.10869-1-jinjian.song@fibocom.com>
	<20250515180858.2568d930@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_084322_822208_A31D85E5 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, 16 May 2025 11:46:57 +0800 Jinjian Song wrote:
> >Module parameters are discouraged, they are pretty poor as an API since
> >they apply to all devices in the system. Can you describe what "frg"
> >and "bat" are ? One of the existing APIs likely covers them.
> >Please also describe the scope (are they per netdev or some sort of
> >device level params)?  
> 
> MTK t7xx data plane hardware use BAT (Buffer Address Table) and FRG (Fragment) BAT
> to describle and manager RX buffer, these buffers will apply for a fixed size after
> the driver probe, and accompany the life cycle of the driver.
> 
> On some platforms, especially those that use swiotlb to manager buffers, without
> changing the buffer pool provided by swiotlb, it's needed to adjust the buffers
> used by the driver to meet the requirements.
> So parameterize these buffers applicable to the MTK t7xx driver to facilitate
> different platforms to work with different configurations. 

Have you looked at
https://docs.kernel.org/networking/ethtool-netlink.html#rings-set 
?

