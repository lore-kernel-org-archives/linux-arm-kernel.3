Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA9D6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyNMPjO7MMUd6ojdX9/UDWNYw2O+FoxGF7IwqpNjl2U=; b=CaMXnnGAFtUqiFSXAwBfmFPZyJ
	0WN1WCp6AxfgBrlWAlzojj7nXlyHMYdGtzVT/HLZCcQFCNgkA/MbFo9EvWW2veoMuvhv1AMxckTaq
	1SCw1N0dgn5xr9rqln0zTzvTnRcLKRuX08ywG69Vs2rGCq846acupWw4R/QLX8ROLV7/mcPEI6HF7
	p4JX23pHryJVw+gpttAOyYNhoVMmTnfDNToc0PONd44XKq2pbAA/849WZ45aUcGf5In2Or4TNZfSo
	Ut8etdxRqzDPDwRL+lmm5xfu1hyfWTZ40gGzYZSAhgdz9kV1hQJTKS8ZyhXPDxI7IBRtdFsLa3Cpu
	i7ArhIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GNQ-00000001rv9-1jkj;
	Wed, 30 Oct 2024 21:37:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GLk-00000001rV7-1gcY;
	Wed, 30 Oct 2024 21:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NyNMPjO7MMUd6ojdX9/UDWNYw2O+FoxGF7IwqpNjl2U=; b=6ODvVexGP24auXYynC9wLkGhzw
	Ij5b5N2p3PUMIHkDOtE4nr8am56jtAaFUhmf/2F9T8z891JnfVvg327KEtn58HBHyEZ050bRc/cTP
	08HGvuZ+j1tH62+k+BM0/SYAdhM+Lp5LpgXMRSsVm2j+A2zLM7zJCLN+myVyboiCPnAk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6GLP-00BjTa-At; Wed, 30 Oct 2024 22:35:11 +0100
Date: Wed, 30 Oct 2024 22:35:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 1/5] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <cd2f249b-6257-4692-ac2f-93252534cff4@lunn.ch>
References: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
 <20241030103554.29218-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103554.29218-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_143532_458620_631F3450 
X-CRM114-Status: GOOD (  11.38  )
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

On Wed, Oct 30, 2024 at 06:35:50PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MediaTek ethernet phy driver files and get ready to integrate
> some common functions and add new 2.5G phy driver.
> mtk-ge.c: MT7530 Gphy on MT7621 & MT7531 Gphy
> mtk-ge-soc.c: Built-in Gphy on MT7981 & Built-in switch Gphy on MT7988
> mtk-2p5ge.c: Planned for built-in 2.5G phy on MT7988
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> ---
> No change since commit:
> https://lore.kernel.org/netdev/20241004102413.5838-2-SkyLake.Huang@mediatek.com/
> 
> Andrew Lunn has already reviewed this.

You should append the Reviewed-by: Andrew Lunn <andrew@lunn.ch> to the
commit message, just before your Signed-off-by:. Taking the patches
out of a series like this should not invalidate a Reviewed-by, so long
as you don't make any changes to the patch.

    Andrew

---
pw-bot: cr


