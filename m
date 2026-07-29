Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+AGVRNa1SzZhkLyKFGlOYMYOvwt5zE8+rjSL4vSATU=; b=KDfVqSynpg1xEGEgZ2ey9PVzQ+
	Hzno0+CFciBnLm4bz6LokWlld+tHbaH1IGM5BVZmWO8N9VVVgV0GXacwd+HtxTa9zPsH57IJdRuSO
	GNEFxMd5TVZUOz/XsAZSGYwP86v41WV5sWS7+jzkNai7Xn6RsaTRF7iKPjEzTL5Xq05HXoWgr2VCW
	ITNtbf0EHuWL0s4ZLQJ4D0GYOHWuuL3QWH0R30/PmE1Ko/GHnGk1Yc03yGbhS9KXg2ANZOR0osEdV
	1nm127z7ldxs3941CWzb1OeGFyeREZzVH0ovVM4OfrUxtTmZ2KzeX1BJgDM8OJgS+hWXwoVTlbPqx
	kq3Bu4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2Ux-00000007j3A-3Tyy;
	Wed, 29 Jul 2026 11:30:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2Uv-00000007j2b-1R26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:30:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB69B4E40FD4;
	Wed, 29 Jul 2026 11:30:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A0136039A;
	Wed, 29 Jul 2026 11:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D092611C14D10;
	Wed, 29 Jul 2026 13:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785324646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f+AGVRNa1SzZhkLyKFGlOYMYOvwt5zE8+rjSL4vSATU=;
	b=lDdc18OQJAWS83HE6BFVKDefips09iGZ0t/q81THNYNQ8HRedejVpxxwSZEMgG69CzcVx/
	UaA/Ok2GH/YyXKwxqzKPZ6m0p62jwpEC0hXFIfzvd02VKi8ZKjqVAqysXr3rpXatVqIXoj
	aERRzMQhfdfOwKdguTXxtrbvvPAv8bDN6FBJ/y7O29SpejIdbe2xQnkrbcvkMb0y+rJst5
	Mzc0VCA+42LnnIOAXuehc9nLI0SBiGmJs402/4HPMaUXWwxFZDMwP9wZtj1w3F1XHtYj98
	FKbPuFwFyzZ2w5ixhLw77MeUQrGuuWyPO8fXdvVa235bBdDrIG505HZA27QXDw==
Message-ID: <bbc44e43-2fb4-4ab7-9829-bd9bfde4e532@bootlin.com>
Date: Wed, 29 Jul 2026 13:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/5] net: stmmac: Fix double VLAN 802.1ad tag handling
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 boon.khai.ng@altera.com, matthew.gerlach@altera.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_043053_546267_AEB310AD 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Ovidiu,

On 7/29/26 11:51, Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain an 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag.
> 
> This issue was observed on the Renesas RZ/V2H platform (which has a dwmac4
> IP), when testing QinQ ping:
> 
>   # DUT
>   ip link add link end0 name end0.100 type vlan proto 802.1ad id 100
>   ip link add link end0.100 name end0.100.200 type vlan proto 802.1q id 200
>   ip addr add 172.16.3.2/24 dev end0.100.200
>   ip link set end0 up
>   ip link set end0.100 up
>   ip link set end0.100.200 up
> 
>   # Peer
>   ip link add link eth0 name eth0.100 type vlan proto 802.1ad id 100
>   ip link add link eth0.100 name eth0.100.200 type vlan proto 802.1q id 200
>   ip addr add 172.16.3.1/24 dev eth0.100.200
>   ip link set eth0 up
>   ip link set eth0.100 up
>   ip link set eth0.100.200 up
>   ping 172.16.3.2
>     -- FAIL --
> 
> This series addresses the issue for both dwmac4 and dwxgmac2:
> - dwmac4: since dwmac4 does not expose the tag type in the RDES3
>   descriptor, it cannot support hardware double VLAN stripping correctly.
>   This series disables double VLAN stripping for it, so the 802.1ad tags
>   are left in place and are handled by the software VLAN path.
> 
> - dwxgmac2: the RDES3 descriptor does report the type, so the code was
>   updated to read it instead of hardcoding ETH_P_8021Q.
> 
> Note: patch 5/5 was compile tested only, as I do not have the hardware.
> However, it uses the same codepath as dwmac4, so it has the same issue.

I was able to reproduce the issue on imx8mp, and indeed this series fixes it.

I'll try to do a more thorough review soon, but this is a good finding, thanks
for fixing that :)

Maxime


