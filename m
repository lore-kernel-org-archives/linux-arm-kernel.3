Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2376EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 21:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6dDVyB9psyNYoQa6fpOddWiAy4i5cRkpJCqDed3Ch0=; b=jqFiWdV6N8Bd9AgJ8A5W5sni/6
	KBkImK5cyWq3NE4R0km0L+0NPnslWBDJLfFYJiygVV4BrFE7B2macnkQJHgZzgsJJ+CQ/Ow1hyVjL
	OE9sgKPhTjSfneI/15gG2cB900FJgEBc9jEY49CYrF2ouFPns24wbSvhyZuwsgeX4vNczwig8/6nv
	jJagTMyQUbTKun4dPXV/1wZWLm8Qpvr5lyWN4T0OfvLE7BFydjyk162cmuvxsbsVRiCfySuowNLLE
	CyuqLcIbcgZqpLlY/UiBkWGCmXX8yexJ/lWCi6xmxzQ7J5fkjbtdJY3+rYBdYPUWc5bCW+OsCBD5e
	28IMIS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whD7G-0000000FuHe-2LHU;
	Tue, 07 Jul 2026 21:14:06 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whD77-0000000FuGN-1yNh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 21:14:05 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707211351euoutp02c096569573baf1df3038b4538a822315~AHlufJQHR2557725577euoutp024
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 21:13:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707211351euoutp02c096569573baf1df3038b4538a822315~AHlufJQHR2557725577euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783458831;
	bh=f6dDVyB9psyNYoQa6fpOddWiAy4i5cRkpJCqDed3Ch0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g+Ed3nNyo5M80NkQfw4jAOTolFRfSoCAZrGKYdeQZ5srfwWVfaMd4reXeEstc1Azb
	 b8L6XWcV9buiqK5GEAIf8XG0g+VolaZoBhzREGML5sQnoI+Cba6uTW/I6hsTE7c679
	 gDI+2R5xkDNpwOoBSX5x36ODkRHE/2Cmwm/zxymY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1~AHlt4_tXc2809828098eucas1p2g;
	Tue,  7 Jul 2026 21:13:50 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707211349eusmtip17f0e062b7abdf62ff97e46a43741acb5~AHlsxBQqi0242002420eusmtip1L;
	Tue,  7 Jul 2026 21:13:49 +0000 (GMT)
Date: Tue, 7 Jul 2026 23:13:46 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Stefan Agner <stefan@agner.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Ovidiu Panait
	<ovidiu.panait.rb@renesas.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup
 when opening the interface
Message-ID: <ak1rseUKTWFKzBib@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260707195425.405989-1-stefan@agner.ch>
X-CMS-MailID: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_"
X-RootMTR: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
X-EPHeader: CA
X-CMS-RootMailID: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
References: <message-id-of-your-v1-mail>
	<20260707195425.405989-1-stefan@agner.ch>
	<CGME20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_141358_454656_65B2A572 
X-CRM114-Status: GOOD (  16.43  )
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

------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Please read
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
in this case 'don’t repost your patches within one 24h period'

Because:
- you have two patches now processing and no changes requested yet,
  nor did you get AI review that is currently employed
  https://patchwork.kernel.org/project/netdevbpf/patch/20260707195425.405989-1-stefan@agner.ch/
  and
  https://patchwork.kernel.org/project/netdevbpf/patch/20260707162146.73823-1-stefan@agner.ch/
- This change is actually broken - in previous patch rtnl_lock() was asserted
  by dev_ioctl(), but in this version it is not asserted anywhere and will
  trigger WARN_ONCE().
- Full tests within an hour is possible, but no need to rush patches
- Please spend time reviewing patches, as I spent few minutes to make sure
  you (or rather Fable AI) is correct that rtnl_lock() was asserted, so my
  review would be accurate (previous patch was ok, this is not).
- Please respond yourself to comments, take time to understand codebase.
  I would prefer not getting copy-paste answer from AI,
  we have Sashiko review for that.
- Missing link to previous thread, shown below
- Moving code to other lines does not justify dropping "Assisted by AI"

I am not maintainer, just random reviewer. Some maintainer will give input
surely soon.

But rule of thumb, do not repost patches till your patch gets
'Changes requested' in patchwork or like 2 weeks have passed
(maybe during vacation even longer, as currently there are >600 patches
pending review).

On Tue, Jul 07, 2026 at 09:54:25PM +0200, Stefan Agner wrote:
> Changes in v2:
> - Move the PHY resume from stmmac_change_mtu() into __stmmac_open() so
>   that it also counters the PHY suspend caused by __stmmac_release()
>   (suggested by Andrew Lunn), placed before stmmac_reset_queues_param()
>   to match the ordering used in stmmac_resume()

Missing link to previous thread

> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

BR
Jakub Raczynski 

------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_
Content-Type: text/plain; charset="utf-8"


------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_--

