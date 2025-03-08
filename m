Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE617C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 03:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ETKGNohs1JuiFVrDiXY7s59ZmOAZHEk4puoypMh0ho=; b=zCSF4d3ktPv3OmTkPOQwjXEFst
	5j0RvoLiynHgx2Miai5Cl+Gdqm8qxIm9NUb2pKB8j2bScWapkknC5/NcT2EsaNeU+UG3N2fSUis7m
	oG91yQhJ7wuEBpv6jjA19vBtp/1KrVhaoNKVfig/5DDkxnFdqu+F66yfkaeFUGIUntXmKAiljIRGs
	wiXk7/KgpU9UF2JXg+mgvotUou3GPzvHWEY0A3EonrLFjiWiSiEeSyKDxyAIhI3W0eyzf2yzZGb+j
	9OJvt7IJHSeIIf+iiqEf2a0G6SMwAlzI1x+PVVLVCKBcObQG/rkPEGftnVkT3BeteDtHI5SQuhfuu
	OE/7tYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqkQg-0000000G5Jc-3veA;
	Sat, 08 Mar 2025 03:00:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqkP3-0000000G5A6-0K76
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 02:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92B3AA457D4;
	Sat,  8 Mar 2025 02:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FD8C4CED1;
	Sat,  8 Mar 2025 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741402743;
	bh=VpVgfZqL5pCD8VMIpfO//WgO/NgRuraRLNPhr0ucINg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qhLr56rB5CiqISw9E8FY/8/pkE4H1Kap65yRwfrQjaXE4GKKw5lv7TVmR7y+ppdkm
	 FgOanKxGp4MTHSc8nfMzxrj6FLlgMjFc2zmOP5u6k77tZ36jQXVlHuH0+kNKbrZLfC
	 FJR8HNf8CAITOfIhUkXaq0mew8fo9S9YWEYHqZ4CeqJTprTWbcrDJeaSJRM59zgk/r
	 vIxYIJEmmRa6q2zdHVf3YHpw13tHVbdXOlBEasZOTRC/Tk1IvrpbCaT3ivLydXsyzR
	 R5ZfprFRxepAtpOL/2gAobeDmgCHGOoi8aO1hfPbExbp2yxoKEPpLUF6reTwcbK5HC
	 /ozmbhctbWRPA==
Date: Fri, 7 Mar 2025 18:59:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 net-next 01/13] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250307185902.384554a5@kernel.org>
In-Reply-To: <PAXPR04MB8510771650890E8B7395B2DA88D42@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-2-wei.fang@nxp.com>
	<20250306142842.476db52c@kernel.org>
	<PAXPR04MB85107A1E5990FBB63F12C3B888D52@PAXPR04MB8510.eurprd04.prod.outlook.com>
	<PAXPR04MB8510771650890E8B7395B2DA88D42@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_185905_185892_0D461C6F 
X-CRM114-Status: GOOD (  14.49  )
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

On Sat, 8 Mar 2025 02:05:35 +0000 Wei Fang wrote:
> > > On Tue,  4 Mar 2025 15:21:49 +0800 Wei Fang wrote:  
> > hm..., there are some interfaces of netc-lib are used in common .c files
> > in downstream, so I used "ifdef" in downstream. Now for the upstream,
> > I'm going to separate them from the common .c files. So yes, we can
> > remove it now.  
> 
> Sorry, I misread the header file. The ifdef in ntmp.h is needed because
> the interfaces in this header file will be used by the enetc-core and
> enetc-vf drivers. For the ENETC v1 (LS1028A platform), it will not select
> NXP_NETC_LIB.

Meaning FSL_ENETC ? And the calls are in FSL_ENETC_CORE ?

