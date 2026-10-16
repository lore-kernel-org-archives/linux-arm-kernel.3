Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB8DCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtJqI8YsdfW+gxZii/Z1VxgXOvJbDlTlvuwqPo5TN7o=; b=bAxxKrLZFmLU1pOAYPLEBFbJNx
	7tN6p0LZfoJzAK4+lQFaO9kNKYGBWgaizom334Ka8e81V/a6YMD2sNNRDhadVYPih9F+aLdN4/TVz
	cj+4v82ekPX+6ufD5qW7JnocRG47CRbBRfl8vf7rojfmRHV3Szc/NkOJ4uM4MvTeD9SyXOtqlFLZh
	jj7Bw5IL0v7ZIh7y8VIgeI6zUfqRMLhMm9r9sUQzwRY5adDDI9illhi7nwFvhaK3fh6osCc8Inyr+
	66i3f/3B9p0j/+vGvB6iM3i8vWmc6aOyrARQe+HWt2Jelc6mUsxLJGWol3dvnxBuWEhT6tDI7/gtE
	DmbrO/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHp1w-000000042hW-3dnP;
	Fri, 16 Oct 2026 20:59:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHp1s-000000042go-0UNF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 20:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vtJqI8YsdfW+gxZii/Z1VxgXOvJbDlTlvuwqPo5TN7o=; b=PQIUNC0cBfW3xjCJn68w+s6Mu9
	7UVTgRDCwAq5q5Arp2OOnFwHbgt+dzVnbbuPvzO87RJJLzD7RwR9uZPrRc6VNDX6rS3aoIFjE5E+y
	UB8vktCQsOT6lvsEpXyhvuHkcZfwvPrSQa2Xs1XTXBv2SBTSDIPYfxjLyAvSSk8OMsAU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xHp1S-00BDxQ-DV; Fri, 16 Oct 2026 22:59:26 +0200
Date: Fri, 16 Oct 2026 22:59:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@nabladev.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	UNGLinuxDriver@microchip.com, Wei Fang <wei.fang@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [net-next,PATCH 2/2] enetc: Make eMDIO MDC rate configurable
 from DT
Message-ID: <725fe351-bdd0-4b53-b551-0f638d02f98a@lunn.ch>
References: <20261016193344.115518-1-marex@nabladev.com>
 <20261016193344.115518-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016193344.115518-2-marex@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_135952_168875_2BF050C1 
X-CRM114-Status: UNSURE (   7.51  )
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

> +	div = ((clk_get_rate(enet_clk) / mdc_freq) - 1) / 4;
> +	if (div < 5 || div > 0x1ff)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Requested MDC frequency is out of range, ignoring\n");

Returning -EINVAL is not really 'ignoring' the invalid value. Since
these are optional properties which are present, if they are not valid
returning an error is good. So please fix the message.

Why is dev < 5 an issue?

	Andrew

