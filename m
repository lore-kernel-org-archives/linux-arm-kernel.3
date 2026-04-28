Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8AEFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7TAcOXxPnUVfil+ay330gPo4DxhAxhPDiY4u2086e4=; b=2RphkFKLeREGuHAmN/I+B8D0un
	7Rs05ekl6oNICvkbWArp5Ly4rbFl+p9ZDxt9bNlMRrGBlzoARXi2MXV58pXuy+r6b1IK1zOvS9kqv
	gwLvz53klLvVOfpU0ddIn/axqzfcLRX4UhRD6yBLdBtAoI4xkW9ufBvkFLzbqHU8gghF1EbMjU4Fj
	cjCNlqM+PJSehWxjtb2+czYVMwW0nt1gTnXPdCPr/zojbX6xYmHLcRp6hZXa+x6Rx1XZIgr+IKYl3
	RY/UbibBT8GMOPVfGiTewzSyzK0feBFMZx6hIYQ1tdk7HuZDLvkt2ZvSNkjI03v8ZRJ4N0UGL31rf
	XdVhUUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmoc-000000023am-1yJj;
	Tue, 28 Apr 2026 18:05:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmoY-000000023Zj-13i9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=f7TAcOXxPnUVfil+ay330gPo4DxhAxhPDiY4u2086e4=; b=GE
	cDleAyqqdGmQWx/Ex+NIq0ne4BoHv7ryPiIH1R8l8YNsCRw9rQeCVAVmE7beTtd1Yo536uB6pXloi
	WWskddRMmJeVNtUfwGqet9BpI13iSU7xXwav46OeSpPSwq1hR5ThEGC/B6lnz+iaXWp5r7OfLbUBV
	s64aKyNSeep6o6g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHmoJ-000NwR-MD; Tue, 28 Apr 2026 20:05:27 +0200
Date: Tue, 28 Apr 2026 20:05:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <8d9801cb-0c66-48d8-a946-89a7771e73ea@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_110544_271098_DCB662BD 
X-CRM114-Status: GOOD (  12.86  )
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

> Remote side learns the endpoint when it receives any message from Linux
> from the dynamic endpoint.
> 
> Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When
> you send the message from this endpoint, the standard rpmsg header
> would have:
> 
>     85 struct rpmsg_hdr {
>     86         __rpmsg32 src; // 1026
>     87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
>     88         __rpmsg32 reserved;
>     89         __rpmsg16 len;
>     90         __rpmsg16 flags;
>     91         u8 data[];
>     92 } __packed;
> 
> Remote side tracks the dynamic endpoint by reading src = 1026. And while
> sending the response it fills the header as:

I've never used rpmsg, so this might be a FAQ. How does the remote
side know what the endpoint is to be used for? Here we are talking
about GPIO. But the same hardware implements I2C, and a few other
things. How do we indicate this endpoint is for GPIO?

Maybe also related, this hardware also supports a number of GPIO
controllers. There has been some argument about if one endpoint should
support multiple GPIO controllers. Or, like gpio-virtio, one endpoint
represents one GPIO controller, and you instantiate multiple
endpoints, one per controller. How can you tell the different
instances of GPIO endpoints apart when they are dynamically created?

   Andrew

