Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9D2CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 04:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhecIOpybuUkmVRn+RV36PWvwdJyuFnrfxzmzDFBna8=; b=kkf2CDAkDoD0ZY1CXub2jZOmOz
	0MmnPbp8859t3W15bScByjpqs9uGfROZb+4ppIm55O2ZC54Koc4usQ//zMUqgkrVIT3YDx9CeMq34
	U999RvkS9moMRnJFMSiLK5491A3NFV+FjNXKOzx8yzcp5tAIdPZMPfzqopIyp+JJW2uJYKi80Eyfk
	ztWtID3qAcFkkxbRfOoLfK36R+knUmDUHNGV+SdJFXUm7kvD4fdbaoaAeHbmxdmUo4YEGkKu5n17X
	Of/kSLjiVudVcUCSppvFu4IjrrsDpGHEyea1DmUj9+26nMYin0FXigkw5jWBLZ4+ApGdyJ9HnNvEc
	qGGS2Ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxEV-0000000FpHX-2wPY;
	Thu, 21 Aug 2025 04:49:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow3T-0000000Fd1b-2AVe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 03:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NhecIOpybuUkmVRn+RV36PWvwdJyuFnrfxzmzDFBna8=; b=Hmv4e2X61kfRt4AKpoofe646kq
	+OlNDQvtDGPXi8oms7OYJ/6oEIjEzhjsJL7A5gesXFfDlcKge+jHv9dBJY7j3XTHjRIhzF4LDk1xe
	gSVBZl88aCPwpRJU9bXmBTeLW2ajoPbGtz6VNWFLA7d3SqcqG1hM3eowksQ0wkAClWoE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uow3G-005P9K-PC; Thu, 21 Aug 2025 05:33:22 +0200
Date: Thu, 21 Aug 2025 05:33:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
Message-ID: <f93d325f-2c04-49ab-ae92-b87ae88ab49d@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
 <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
 <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_203335_557365_6DF7DFDE 
X-CRM114-Status: GOOD (  17.00  )
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

On Thu, Aug 21, 2025 at 10:22:05AM +0800, Yijie Yang wrote:
> 
> 
> On 2025-08-20 00:20, Andrew Lunn wrote:
> > >   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> > >   {
> > >   	struct device *dev = &ethqos->pdev->dev;
> > > -	int phase_shift;
> > > +	int phase_shift = 0;
> > >   	int loopback;
> > >   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> > > -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> > > -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> > > -		phase_shift = 0;
> > > -	else
> > > +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
> > >   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> > 
> > Does this one setting control both RX and TX delays? The hardware
> > cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
> > TX?
> > 
> 
> This setting is only for Tx delay. Rx delays are taken care separately with
> DLL delays.

If this is only for Tx delays, why is it also not used for
PHY_INTERFACE_MODE_RGMII_TXID?

It is simpler to just let the PHY add the delays, the PHY drivers get
this right, are well tested, and just work. MAC drivers often get
delays wrong.

	Andrew

