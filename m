Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D876BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg93C/BLYgHh/n0G+OklhbEZ69gCR/bdEIeH7kWAQMQ=; b=I8VEfb1iryMd3uHoCDh2CDFbrB
	7rn5vByRp9drZAubFUV9Djff0D3Di2U87127j6iOEOWcm5mijuny3H0GalxzJYJj5XGwBh4L1AbRj
	q/5AasrTkWSSsbSsFjWszJVgbZ/QtVtmYfST89+h4RZzN3HuMWbSaykoPIDgvbsj+rWsNtIe1u3oG
	gUKvn1vvcgIno+1R+bqYKh0Xv+TUrcTAPYZL+oJTXB7xCr5va6wOF7UEQBOjwykUGCFLjS32y7mQI
	iERrYfQtE+OoxTBVC/tToNTQh6AQQMqBMMaElteNOI8EwJVFZndV2tPtAbUN+UL2LNz69bXh2U1GR
	IS/ic/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15ae-0000000A9Kx-2ViX;
	Mon, 31 Aug 2026 17:14:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15ac-0000000A9K9-1T69
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Mg93C/BLYgHh/n0G+OklhbEZ69gCR/bdEIeH7kWAQMQ=; b=ITG0MN6jXzAjEeH42+oh9s8CZ0
	fqpgRXe8s30hgWWZ2a6Fu05Z1F6PqiA1mP6iNK3XCjSlCpUXy8Wmi4ncnza3+G/jVDeW+qiUeuK9q
	Xfp1OHPYdvwjJ+SmyOe6bph7E/LSnxpklT04hIkB/Tgqe3PAgEXRC1czEdPAmFLj1l+o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x15aG-002EHW-IU; Mon, 31 Aug 2026 19:14:12 +0200
Date: Mon, 31 Aug 2026 19:14:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <74541d4c-5090-454f-96ad-f6c5baa21b93@lunn.ch>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
 <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
 <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_101434_400108_FD863304 
X-CRM114-Status: GOOD (  16.79  )
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

> > With this in mind, I was thinking of breaking up this patch series into
> > separate ones to solve one problem at a time:
> > 
> >  1. Introduce support for "rgmii-id" using PHY-side delays rather than
> >  MAC-provided delays. Also, issue a warning if any other phy-mode is
> >  being used.
> > 
> >  2. Fix the DTS of the existing boards to use "rgmii-id".
> > 
> >  3. Once the DTS is fixed, remove the now-unused code handling non
> >  RGMII-ID cases. This should also allow us to remove the whole
> >  ethqos_emac_por code since it wouldn't be needed for RGMII-ID.
> 
> I'm wondering if we should add some temporary very loud warning for
> boards that use "rgmii" before changing this, or even just keep the
> actual "rgmii" behaviour which inserts the delays, as there seems to
> be lots of such users...

We cannot break in tree users, and backwards compatibility with old
mainline DT blobs is required. So for those, we need 'rgmii' to
continue to work as is.

So steps 1 and 2 are correct. But we cannot do 3. 

We can however issue a warning when 'rgmii' is used, advising users to
upgrade to a newer DT blob.

	Andrew

