Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866DFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xK9cdU7Jd08ydspHZ/LYkJ6UQeomzAplwBThlP1vwpc=; b=N8j5a+sT7n0DJPWGBaLfqLPGKv
	7szWgj8ZeD+lGn1FcvjWCTGbVkpCGY2gg/VgteQRGacCHo9ErSqS96D5kaHRP70lG8SYfWvtOYmKP
	X6C5cn2fP0a4aLpW/P6pEKAlzKA3u0CZMy9ITp8luqXCVQSdxO6DoFXxZlvjcIMYnp5VephA80y6m
	fAATc7AutqsYOa0sYL/RAYVVgr786N0zUxgtnkID2maMElAj9jIfWgmANFkHhBi2Tin1Lu+33TY9y
	syYaAb1oE7bZDfevHDxukYK7lDLq2znZjhSzuUQTrlnc0BWGxlBk9HrNqtLldgw37bfiExGwsgpSf
	CqwmXBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQFX-00000000GQ1-3mnW;
	Fri, 07 Nov 2025 17:27:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQFV-00000000GOF-1scf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xK9cdU7Jd08ydspHZ/LYkJ6UQeomzAplwBThlP1vwpc=; b=gjE3elCVS4gAloZakaMWCavQF0
	VVu0WRaiT/L3wbBnqluVfYLju8y6wohorJRj0IEcmb8E5DSUzE5LC0FFiLQqAz/pCdpm+tNEZ6ODD
	oQ/M/uhYaW+ycEkvcICDP+IxH1BBnfOL2y1dxJBnHf+gFXwlgTxSiJ3HiXH3VxHRE2HY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHQFI-00DFmK-VG; Fri, 07 Nov 2025 18:27:32 +0100
Date: Fri, 7 Nov 2025 18:27:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <7db35257-de36-4eb5-9205-ca7fb8343401@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
 <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
 <PAXPR04MB918581030A9FC05E13874BDB89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_092745_488801_951DD319 
X-CRM114-Status: GOOD (  14.20  )
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

> For your information, I'm facing a similar issue with my remoteproc_tee
> series [1]. The advice I received was to look at the PCIe DT implementation
> (I haven't had time to explore it yet). This advice also seems relevant to
> your series.
> 
> Do you also have a look to rpmsg_virtio_bus ? it seems a good candidate to
> match the device tree properties with the rpmsg device?
> 
> In the end, this is my point of view. Perhaps it is better to wait for
> others before deciding on the direction...

There might also be some ideas which can be take from greybus. It also
implements remote devices over a communication medium. 

	Andrew

