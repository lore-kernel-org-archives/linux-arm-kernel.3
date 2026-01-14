Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42645D37E2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fz48bVRzklRIVR7p/+O3YEHP7eJgCJT2rwT+Tt86CmY=; b=UWJ2ftghWF8E71nDgioSJaHzpF
	Dwf3kBRN8KVQh+uedXAQj5bLKKYMyJUqFwECr8QFnciikYcm0Fq9VvK0JB6asHAbQIsTGW+N+CI3v
	IN3cBcV+F5G8/En7aExoaZfhtxPvrHvccuJpTi3yBhE4AQ1bq09VqoXCPzvc9bKNckeZvesirq/AZ
	RKihhX/cft4BNCKTtXotQTrvJhjTHJbaXrSbQ/fIMxALNj5k5oGXPAsiamUCexrhcZ4D+QMd4JcgO
	rLPuqCY9wjeM2pfZElmvF0bcQLRy4Ncvdm9TGD0bv+xHnv5rLnOj66luBHd+2HqVQIlp2jqiqOtwO
	f1dY2D9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0eA-00000009HU1-1cTk;
	Wed, 14 Jan 2026 13:10:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0e9-00000009HTV-1vLP;
	Wed, 14 Jan 2026 13:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9800560051;
	Wed, 14 Jan 2026 13:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C188C4CEF7;
	Wed, 14 Jan 2026 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396248;
	bh=Lbi2dkKS+CDo0VctVbxA1brjkGK2rdj50pCjLj4bluA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVt/ptqz34aItSGZgocy9xdXCuD9dKmJxuyqSDXO0AMFnuI8NtXYLrQc5A9pu+SvU
	 gwBab5cCLYokIDGMQ5GOhl7HJHIbDXYxl8VKQem28J4zWopWXNeUmxNj6hhVhBbSls
	 Ybct1F1sWabl1HKOgTK1Hqve/iiqVkOzWCEkB+WjbruQ53Pw8Ti0eKOGnHfHajqo4X
	 upzATJnxuH8rICv9R+HRYJNRJ9FK0PSLf3HG+Y3ujcvrCCAyLaX41XFk+yGvFaaD37
	 qQIXCBmThqq9b4q/4dMcOUVJZZGjXc0AjrEIixMXjZaeeLKUuemzZmyoXDn2TPUu49
	 mCE86yrnxtdBw==
Date: Wed, 14 Jan 2026 18:40:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
Message-ID: <aWeV1CEaEMvImS-9@vaman>
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com>
 <87o6n04b84.fsf@miraculix.mork.no>
 <20260111141549.xtl5bpjtru6rv6ys@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260111141549.xtl5bpjtru6rv6ys@skbuf>
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

On 11-01-26, 16:15, Vladimir Oltean wrote:
> On Sun, Jan 11, 2026 at 12:53:15PM +0100, Bjørn Mork wrote:
> > Vladimir Oltean <vladimir.oltean@nxp.com> writes:
> > 
> > > Add helpers in the generic PHY folder which can be used using 'select
> > > GENERIC_PHY_COMMON_PROPS' from Kconfig
> > 
> > The code looks good to me now.
> > 
> > But renaming stuff is hard. Leftover old config symbol in the commit
> > description here. Could be fixed up on merge, maybe?
> > 
> > 
> > Bjørn
> 
> This is unfortunate. I'll let Vinot comment on the preferred approach,
> although I also wouldn't prefer resending to fix a minor commit message
> mistake. Thanks for spotting and for the review in general.

Yes fixed that while applying

-- 
~Vinod

