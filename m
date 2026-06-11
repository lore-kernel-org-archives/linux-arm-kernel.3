Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C34CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro9VRaxqnpZjOWZQhcQkBrJNsT8ppT8UuCTCvAy/sWM=; b=PMb1SUeUfXSbmeoalIYvuoF4k7
	Ij+B71ZnroziOeF0UNIYgfRCq5JsE+J6aVVILy2zSrNkUFwzGS7TMShbKOlBTmr1NzGvc5SthUJcZ
	e8itlWXeRj9w2mO+H+zxLp6N2njXxKe0YUf0Uw2rl8ctSKXg6qY5MuXaXraedg2801LYbktOtPR+9
	BrF84H68J+ghIO6WMZHiRxC3vuDky9s1R8SxrjjKhOYobFIiRK6Q62NjIlMLhZ3Ufxx+2r7gwLtPw
	gxT3mSX/xL5p61HaUUiLjpsUeRaeqpzARxYvxdQ62D/9aYPhQJcbhq8s/I0ltF1E1KF7xAEMVXMnB
	mCur3t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmQU-0000000A4M9-2xLo;
	Thu, 11 Jun 2026 20:54:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmQR-0000000A4Lm-3zXI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ro9VRaxqnpZjOWZQhcQkBrJNsT8ppT8UuCTCvAy/sWM=; b=eHXrEETynmdVcNLwvS4Q/JmBwG
	g1YFwlYFYsA3u5PWqOCMnGzPttqs6Iz4KgJR5Sjv4SN8mPAS1HbgSLv7geiEyQSYp0ES8BFBaskgd
	PoLMh6BZE4dkrZUQ1ZwRv11+FKknYk/B55dVmSnvVxuE8zpITgPAR6E83AxFzGIDZvPk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wXmQ9-007EUi-JR; Thu, 11 Jun 2026 22:54:37 +0200
Date: Thu, 11 Jun 2026 22:54:37 +0200
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
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_135455_990502_753A0497 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
> When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> the MAC must not add its own.  The driver currently falls through to the
> generic DLL initialisation path which programs it to add a delay.
> 
> Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
> ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

I'm curious how this works at the moment? Do no boards make use of
RGMII ID? Are all current boards broken?

      Andrew

