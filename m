Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB7CCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmCRu08IgcbJZYrB4NvC6vwyUprgkKxjzkV72squNuc=; b=trTn3/tNwWfRnSy954Efps7UxL
	r6rxFUX4jprnMQ9LTf1zJVYB7CMWVW3HxRq1fvfnWTpfYpBDszYJV7beCg9VDhDe6QnHAY5TGTeur
	Bb+8KbI5Jr47uk2F7oKVA0aqeowhK5ktjvPYvMZRKgGcEWEcy/tQBfzQw7StsA4lyO2PZ7BO+pmPs
	RDyC4HrWiR7XQWa13NvyU8i9teYHxmAf+H5Ds/6ulq7gN3nQotpNnAlvTQ1XqOBrhmtkVDLqs3iBt
	aukwjSm2wngW4qBLFgDmKlXzk03kv/IgV0lebkkasRKaZ9tIBx1vwxa5X/F4msUG8TkY08ADtCFBD
	/x+sHfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8O09-0000000EGQc-2FT4;
	Mon, 13 Oct 2025 19:14:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8O07-0000000EGQ3-1riw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 19:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tmCRu08IgcbJZYrB4NvC6vwyUprgkKxjzkV72squNuc=; b=Ji5cP4PmaexINKz39ahA6TAIpz
	50wm9RqjP8VbK6gc2PRWy8EuSIV3+2GEZa2kPTaX5lq5yJmK6+TQgbbMRaWmS11w2LdV6bC/qacjz
	hXU/yNC+NkSysM5yXd1QYmvMz5WNjsaEnUTZIEhjJvZxpsY4lsy6CPm1Z3CoLbzPfoa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Nzz-00ApOd-E3; Mon, 13 Oct 2025 21:14:23 +0200
Date: Mon, 13 Oct 2025 21:14:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <e124b444-0427-448d-af74-aec22468893a@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
 <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <08a8e0d6-f486-40bd-a2f1-43e33ccde1d2@lunn.ch>
 <PAXPR04MB9185DB2E801B8A2139C7C29089EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185DB2E801B8A2139C7C29089EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_121431_479468_7EB87DEB 
X-CRM114-Status: UNSURE (   8.96  )
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

> For instance, if we define the error code as 1 in the return
> message, the driver will interpret it and just return -EOPNOTSUPP,
> regardless of the architecture.

Yes, that is fine. Document the values the return code can take, and
what the mean. What we don't want is the protocol directly returning
errno values, because they are architecture specific.

     Andrew

