Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07ABC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4x7GgBq+e/gvuJ5cyUD73Nhz+wFnQftgYUhrbLSnes=; b=os8magRes4xpiNViMb6/udDSb1
	mm7Y9OfhAZOvzOCLhx8YYMHars/f/xF1iZw8exgypquV2iof1Bdhj46QNVrh1kefDfFaplfcnE7bZ
	t9uafraHGAwzHwKqGqMODP4deuVwe7REvFW1ZEXlvwbioBHEqni+ODq64+rc9QKPjoxtK7JRGSRYJ
	QqYhL8YUFurMm2QPTtUfiMm1W/LjZCtBBRCGffK2QR92mNp8YLyQ1glVIXuubNLmnbPsb7BqTScqL
	d9YZZ2pnMCDOKM5w0X/cQaGMXSjLIZXmBoNmutJsTSA/AdIYQhMDCRTguuJAKoGnKURmiABB0xBLc
	aPsv6azw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2Zt-00000007kLc-2Nhb;
	Wed, 29 Jul 2026 11:36:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2Zr-00000007kKr-1Cmt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:36:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 785CB4E40FD4;
	Wed, 29 Jul 2026 11:35:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 356F26039A;
	Wed, 29 Jul 2026 11:35:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77EF811C14D1A;
	Wed, 29 Jul 2026 13:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785324951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=U4x7GgBq+e/gvuJ5cyUD73Nhz+wFnQftgYUhrbLSnes=;
	b=Klkzrn58+OfHyVsct7f99ef2xFy2v0hvlDqUS2cYaCLTQPDb4AxTw+OoKsqcCXG7G0VS6Q
	qOkdauVNmLo6rXuia78LE20XMDkaxgw5Xeb55vig37AA56rujq7w49WHfeRdTi73Z7T32r
	/W00Y5+CPQTBTI/FVZfwDDFj/dPIJIXQPNO43OJZwmhdFT2ktNxh6Qs+LdhMPvz5uPn37k
	G7AD0IOpMkbKf39CKtuCfnd5DjxBdoFJisIBjhz2kH8ClViQij5pNNoWF8VKzbSF2t4Pq3
	2zm3TUEbOg7vbiGPgP+oITs4s+uRE9SdIA0ac66Yxw9srYaNIloAMIFHxQqzhQ==
Message-ID: <af97a4a2-9a1d-4b36-9055-d05124bf4ab9@bootlin.com>
Date: Wed, 29 Jul 2026 13:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/5] net: stmmac: Fix double VLAN 802.1ad tag handling
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 boon.khai.ng@altera.com, matthew.gerlach@altera.com,
 "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>
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
X-CRM114-CacheID: sfid-20260729_043559_618773_1525DDE9 
X-CRM114-Status: GOOD (  14.92  )
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

+ Nazim Amirul

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
Nazim Amirul, as you seem to have access to some AgileX5 with XGMAC, can you
see if you can reproduce the issue on your side and if this series solves it ?

Thanks :)

Maxime

