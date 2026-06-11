Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46C8CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CYtTs3ua4MECH7jN0VaU7QhxRXBtLb2/pQ4oJEDKIM=; b=kK35w7lbzk7xB+tEA/TPuWZF88
	RlTNhaXzQ6kjOSnJipIbqREdkk83MRbWfdeguj1+0PQ6QV0G/2ZalRKItRJ9xdUHGsrlXISeORe1P
	GvqpW2CRo8LBvWGHKlS/7yJgNWUFduX0Yq0KyPSVT+XYY2rDwnt9dqmwPWlozYtgxDbSxIfHfJZ6i
	VtdnKYMvJF21LN6Nmk0yX/d5y0ysXP5CgffQM/32YYIRNn4U9D9fwJv2cEoJHSuWUXXcI/w4qWku+
	mXpBbEUuOWj6y9/RbLUjRgqZCXF65CV48jcHNbTzs8qp//gBmtqQIMwxE2AGjdtjbRqwiR3tfURi2
	VddkwekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmUM-0000000A4Zo-0goJ;
	Thu, 11 Jun 2026 20:58:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmUK-0000000A4Zb-0kIt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9CYtTs3ua4MECH7jN0VaU7QhxRXBtLb2/pQ4oJEDKIM=; b=Qo2WgDoZ8V+e57IIIfnV+4K3fQ
	oJSPrbxOD4ujJrmf9c0qR8Soz59lSIFBh5LAMJ8xqplNac7W1qI7wI7Wsh3IZsv3gJYWF2NpV3IZO
	129rpYu2OSF/Zu+Y0cEZL8NiuA4rA3yyRuAD7P6qWBGgdHrr93KIge65tj782hsEebUKG6tyY7KAS
	di6P2ea1jG+fz0tWTS9c2ig0eUMkqfeULyLtdUvW8Hijj3ncqJfD1+yFBNrju6haK8wAq9yMwa4PA
	W/pQCRW8x+1E842nkD7kZm/XayPOp5IOnXnIOKBAvNruPBTYUDLy7wh9nU9cEFMycYCphMjcfrdLT
	jwrB1R+w==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXmUG-00000005gQd-3B8S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9CYtTs3ua4MECH7jN0VaU7QhxRXBtLb2/pQ4oJEDKIM=; b=EGuNhWNCIwuVlTjwiCWbQqN2yO
	/NDn054MxrgWxsupTnseHEurYMbsp8B9toB0CYtQEXZBGlZ5Hs+2FDSW7AgRXQdTjucN1xBXyGcsi
	k3TVe1Tqqs+HO10abUL/9XG93nLJKJBnyoay90B8hi0OooYLioHUCuCjG+dEHNmXQ9zM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wXmU3-007EYI-Tk; Thu, 11 Jun 2026 22:58:39 +0200
Date: Thu, 11 Jun 2026 22:58:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable
 ethernet0
Message-ID: <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_215852_901413_F5B24733 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
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

> +		ethphy0: ethernet-phy@7 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <7>;
> +			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <50000>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;

Are these two needed? It should default to 2ns, since that is what the
RGMII standard says the delay should be.

	Andrew

