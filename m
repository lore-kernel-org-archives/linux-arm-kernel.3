Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF9CCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddFu/kMbyT+MIg9x7LiNThzvSZy/m4CVQMOwZpgjoG4=; b=u/sPQIr18otppbpTEorF1xYN3A
	Q/JzAvSNrGBsc66cOMDCyVtxQS9TADGXzSrhG5FK+sujTg1nAXQboBcOuz9Drp2gpCRKgCJQoccp4
	gfvBGYfmRazx45kOkm/4nOPlbdE22tbvWV9i2Wb2gz91JxcF30DXWwiMT6dDeU5XLRwCzJ2BTuTxm
	8/Qy0NnjCcZc4ZQwasiCXdiU9XkmpEQZOkNeRe7D5a1oxZrFFE84IWZVtUh4kE1xegsr98GMKmYqM
	b48WCEonrJBzjPkjhE4dqOGDyl/7AO+Mefwpi/sC47w4OXmUQsBRGvB0rXAsW4w0Ga/gTA7PW7qq3
	vJx5DJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBhu-0000000DfKV-10au;
	Tue, 06 Jan 2026 18:23:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBhs-0000000DfKJ-3uKB;
	Tue, 06 Jan 2026 18:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A4F960008;
	Tue,  6 Jan 2026 18:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B6BC116C6;
	Tue,  6 Jan 2026 18:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723779;
	bh=ZMHIVMxJvP0SqJXp+jI2tHR/1Nef4l7GGKt6yBgh3HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga0uyPT6NQN7Ta4jenmNcBrxk43grsKtrsOVSkQZFE46z5RgZcMT110WPd78kSA2s
	 3UTnNsUnsk02AGOrUzaBDvqzb/gYzXCQZ3JmQ0v8pXnRFKQm+tHT+RSkchrCvHsW1U
	 KfIUuCFkRnm9izYSbiWxdMnKWKPBROEWdqWgJtjN1P3ChIZQhlI79qgJg6CGrddt5Y
	 Ntdi3+K2/axG8qaHcnbhfQ64TNPxivq5Lu8X+TzmfrcML0O8zcYeUDRCPny7nkmBLH
	 stb+oz6/4/o8M94sZiL7w7gfy4wPVYT0cXlYSmGIi1GHl1oPUx3EVDhS2SxLcdN7b3
	 3YO9gdj3v/Slg==
Date: Tue, 6 Jan 2026 12:22:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	linux-arm-kernel@lists.infradead.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 03/10] dt-bindings: phy-common-props: ensure
 protocol-names are unique
Message-ID: <176772377743.2503618.2171230504388641306.robh@kernel.org>
References: <20260103210403.438687-1-vladimir.oltean@nxp.com>
 <20260103210403.438687-4-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103210403.438687-4-vladimir.oltean@nxp.com>
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


On Sat, 03 Jan 2026 23:03:56 +0200, Vladimir Oltean wrote:
> Rob Herring points out that "The default for .*-names is the entries
> don't have to be unique.":
> https://lore.kernel.org/linux-phy/20251204155219.GA1533839-robh@kernel.org/
> 
> Let's use uniqueItems: true to make sure the schema enforces this. It
> doesn't make sense in this case to have duplicate properties for the
> same SerDes protocol.
> 
> Note that this can only be done with the $defs + $ref pattern as
> established by the previous commit. When the tx-p2p-microvolt-names
> constraints were expressed directly under "properties", it would have
> been validated by the string-array meta-schema, which does not support
> the 'uniqueItems' keyword as can be seen below.
> 
> properties:tx-p2p-microvolt-names: Additional properties are not allowed ('uniqueItems' was unexpected)
>         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> v1->v2: patch is new
> 
>  Documentation/devicetree/bindings/phy/phy-common-props.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


