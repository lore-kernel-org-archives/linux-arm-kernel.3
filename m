Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWv5LKxiCTQpIMVM+IVYcM4I7ORaawMDktpdHx4zPLU=; b=TWYtblTVYbYRsXzDwtUCzINvS6
	tKIbxZBJYHyd5CviYiWRoUUenP3sGf9NjnrXIRTfLizs8bLNgkDJAKgafmA6/Ffin+pkP8w/hDZ3X
	3+fXobMoZlHLfK6F3o/aqT8/9kW26Lrg1z+iZCq/GaGUON6fZvjjBZ2+RM8CrC38lf8GBq0BHKAvU
	193vnWiOIXOV+z2N4cHTtb1cMI6ByWjOJSfW52EPGmGxXyuuqETNfaIP4sYjwVX0R1MyekFmnTGBJ
	q0VUVCZ/nPU3WuUTmGZQD5om5ORS/p/6n+Ovea5PSQXEHD4PzFn+3wKY/9vXOMfOEv8sk9vT/BGdJ
	g80Dak0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYdf-00000000KkH-1nOb;
	Wed, 08 Jul 2026 20:12:59 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYdb-00000000Kjg-1wsH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:12:58 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260708201251euoutp01aac8fedfa641f2f05e1791f892ecadd8~AaZv48k8G0324803248euoutp01J
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 20:12:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260708201251euoutp01aac8fedfa641f2f05e1791f892ecadd8~AaZv48k8G0324803248euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783541571;
	bh=sWv5LKxiCTQpIMVM+IVYcM4I7ORaawMDktpdHx4zPLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l17znRXqJBIpPf6cjjGr1Q32ku3S781rc6bjt782uZXTBbEmU3c53fkGu8k+TsCC9
	 P0h7MIxa8mP4QLutbd8hUVPvLNwK0yT2/EGv74rIq74fB/xOOYYgflbJ8IHmvBF5wc
	 5Be2k21DK3b0BSfIzh/CqTNx+4hrbPsGswNll2Zs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260708201249eucas1p1cabc72998ab7481e285fda2a90c938dd~AaZuwfJNL2208522085eucas1p1G;
	Wed,  8 Jul 2026 20:12:49 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260708201249eusmtip220a824c2b3b58cd1a50f3f593e7a9924~AaZuEZM9B2195521955eusmtip2B;
	Wed,  8 Jul 2026 20:12:49 +0000 (GMT)
Date: Wed, 8 Jul 2026 22:12:45 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net/stmmac: Check for STMMAC_DOWN flag in
 all XDP paths
Message-ID: <ak6vPffCx2OYqWYW@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260707174551.1264558-2-j.raczynski@samsung.com>
X-CMS-MailID: 20260708201249eucas1p1cabc72998ab7481e285fda2a90c938dd
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_"
X-RootMTR: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
X-EPHeader: CA
X-CMS-RootMailID: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
References: <20260707174551.1264558-1-j.raczynski@samsung.com>
	<CGME20260707174556eucas1p141142a61e5669032194f9eedf6393895@eucas1p1.samsung.com>
	<20260707174551.1264558-2-j.raczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_131255_965375_08157665 
X-CRM114-Status: GOOD (  14.25  )
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

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 07:45:50PM +0200, Jakub Raczynski wrote:
> Currently STMMAC_DOWN flag is only set/cleared by stmmac_reset_subtask(),
> to notify driver to stop processing of TX/RX frames. One of these processing
> paths is for XDP, but it is only ever checked in stmmac_xdp_xmit(), which
> leaves all other XDP paths vulnerable to processing data while interface is
> restarting.
> 
> Make verification of STMMAC_DOWN flag consistent by applying check to
> all XDP paths.
> 
> Fixes: 8b278a5b69a22 ("net: stmmac: Add support for XDP_REDIRECT action")
> Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
> Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
> Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> ---

Sashiko AI gave review that has valid points, patch needs changes.
Please drop it

--
pw-bot: cr

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_
Content-Type: text/plain; charset="utf-8"


------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_--

