Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA7CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3camnU/lQ0FiLPLT54GfqCHA8eBvYKjiIgqqnJuiMM=; b=mkR6IAczTIo6gFPIEGmKSUV5sU
	6c1T7EVmQeqEh5xVdrGjqv91eoxlENEwwTnMV0kv0JuACiEEYgGtDA0H+PvzPrhyjhdFsG1uW7E8S
	V9h/wl4V60QiDhvbtMHgMFWeOwBBAckhG0h8lb0vGIw1Wc5E9tsvnHo1Il147Tonhb8x7phDg63RM
	2i4MKMfC7BcaIkoF2WruhBER0V08uRUsY22CYbhhnEaSlLU6x4LdqjAwEobPJlYy0x0+q6Zr9qJ2D
	1444tafyCI+dds5vVRsGZn5wHdx+q4eqtwdjKBkZmQ7Ck76chvq0tOj+NueZoRt43/3mu3aq+kNBG
	KMO+tdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEREb-00000002UM6-2cNA;
	Wed, 07 Oct 2026 12:59:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEREZ-00000002ULf-25Fy;
	Wed, 07 Oct 2026 12:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=T3camnU/lQ0FiLPLT54GfqCHA8eBvYKjiIgqqnJuiMM=; b=GgeYpCqx6vVbAicUTaq+SmGAet
	CFUrMHMusDYreTpleL9EiZHXIHHb2GYU67zocRi/EvjcrpzLcC3w56wut6arqEW1GBNwfFsOZXD5T
	6mv9OlTP8DokfBtlohEtmjtXl+eRjI4u7PM71d+HnVQ1oT8o5/6bqnfGLloIqTOHOdh4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEREJ-009SWB-TM; Wed, 07 Oct 2026 14:58:43 +0200
Date: Wed, 7 Oct 2026 14:58:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/7] net: stmmac: dwmac-meson8b: let the
 controller apply the RGMII delays
Message-ID: <ecd9cfed-10b2-4e82-a67e-3d4c49579058@lunn.ch>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-2-tanure@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007082627.63807-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_055859_534060_C12F5556 
X-CRM114-Status: GOOD (  13.88  )
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

On Wed, Oct 07, 2026 at 09:26:21AM +0100, Lucas Tanure wrote:
> RGMII needs a delay on each of its two clocks. A board can get it from
> the length of its tracks, from the PHY, or from the controller.
> "rgmii-id" in the device tree says the delay is added inside the chips
> but not which chip adds it, and the generic tx-internal-delay-ps and
> rx-internal-delay-ps properties name the controller.
> 
> This driver ignored those properties. In the "-id" modes it switched
> its own delays off and left the whole job to the PHY, so a board that
> asks the controller for one of them does not get it, and a board whose
> PHY cannot supply that delay has no usable link at all.

Linux currently has no PHY device which cannot add delays. So this is
pretty much a non issue.

       Andrew

