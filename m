Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B16EFD20D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lPxBPC3Dnkz/F6LRRTTUMzYTCUigzfPqij8o+dSSuU=; b=KrLTeEt+7u6uAzkVyyb4zfN4hm
	TCdP6HzDpD7Lxbeam0oFUT+RGs+yXBxkelMCqgVMSSPiDwsTpHYgrnFqSNO7Lnz45lZLS09JOw70W
	G57hNgF2uAEa1xgPCo77saWGzRC7DS2rcuIolSpujqILU9MPulu8vOmR2K1gVL02fwIbFq50TwWPt
	god6oWMOD3PBqVHhd/0ffoBeZuTUMCNTh7zfAp5xXKYaoLA+jlMoaSUVugzfyIIZ+KHJChhixjaDm
	M7FI9X8OpfqgNdcEokaWBCGNDd3erzqx/MrOw1Lj2c+XnZikD4DoWZ8XhGskPfdu8hMGLwTK0cs0+
	HdjLQI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAnN-00000003cdZ-3oT2;
	Wed, 25 Feb 2026 09:03:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAnL-00000003ccP-0Ra6;
	Wed, 25 Feb 2026 09:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+lPxBPC3Dnkz/F6LRRTTUMzYTCUigzfPqij8o+dSSuU=; b=Z48vHPYlEmRBlxgC4hRr82UyJW
	6E9KREzw7vwiOtHsfb/otxQjNBy0Oj53i+iX7lZJsbZbemkvfZBG5vbUEBvYmY04FS6Uem8nTzHsq
	V/9YeMj3Q7P47dVUeSUmtU4GhX1DIBu49FckuTz7iZMuvlO19gxKU5j9LsHkO5aM/bkCzmmFydB5Z
	mp/a081DYZsBWIu2p3xxEC30Xz8bNwKauMuS8h7jz27H6Ai92PZxYfwnBv+QZ8IKle4yL2QuHTbbP
	6VBCUCz4sDuWidq0F9esEubW0GTdcI8WjRM9rL69PKj8EhpDwuqi4I/YFPoH7PpCQTY2c8oh3Or/E
	xWzdFhbw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAnI-00000008cpy-0Ufd;
	Wed, 25 Feb 2026 09:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+lPxBPC3Dnkz/F6LRRTTUMzYTCUigzfPqij8o+dSSuU=; b=OXWchm/hvQcnPIi1R43Rll9Qlj
	Jar0vLf4GN4vbSpoesm3SfjgSl/86ccGrDy0U7BV/8HXW1DKe+HvaBzKBXEdXzBswXqse9tk105Mi
	rzTA1llYwtb1NmgnBknI+jQCTwCC31eATotRe/PRmcH+kksWnZWqXwhaty2qz3xw4G8zcR/ZKbpEY
	ea6b8xuz5OovfZOZHREtTASyyXPmVP4tRC7S3xDEi2BkyY1uf0NhDD62uY98cMj6hzOh6zu/7j2ti
	qdWAIgVQ+WvZ+EbwZrut/IlzGZ7FV5OTS8CgfMRoyBlULS48FQEUhleuoB1L1vlnhV3zPZa+ROUFk
	+eeYDvcw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33598)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvAnE-000000006HK-35li;
	Wed, 25 Feb 2026 09:02:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvAnC-000000000oQ-0Xf2;
	Wed, 25 Feb 2026 09:02:50 +0000
Date: Wed, 25 Feb 2026 09:02:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090256_238829_4F6F845C 
X-CRM114-Status: GOOD (  19.32  )
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

Note: only 8 patches in this series, not 9 as the subject line says,
as the set_clk_tx_rate() patch became part of the first series.

On Wed, Feb 25, 2026 at 09:00:41AM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC. This is replaced with phy_set_mode_ext().
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> Mohd has tested this series, but it would be great to get acks/reviews
> from the generic PHY maintainers.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 +++--------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 57 insertions(+), 36 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

