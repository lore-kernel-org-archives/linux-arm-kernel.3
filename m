Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA779CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBULL6DgUe9CggCYIRWgvIG8dAx0oc/6eJPoZVfJcfA=; b=fH+xJKjlYVBcotqGwEoNusB9DF
	45HMFhJdewG5EdFOKlsAFzmi40pcTq5tceV2fuWMMSVfxYbYJ4PIM6ZllNyYi/kBMIR38N6uQ0fXL
	b9Po6Np1UUtLuIXwahb/ugRQbAJ+eHaRiveu3OujdGpQAwTy0oAR1TORM4Maa7K308sMo3I5/paBi
	3Q7b3L874uFdwvj6CTAxWnd+TF+OMfrkrir1SCL42ik8eqDJBt3gcdPAhBlrzArosaKsHKEmWGjRa
	Q4ZXvoub6CS3TzY4eAoFA1hrl7xkomxUI6/NiSHrLWQPYtgqo/d07Ky+8w92OpYlZg4PZEZEOQwP1
	hVDG5NAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Lps-0000000DwRD-0ZfY;
	Mon, 13 Oct 2025 16:55:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Lpq-0000000DwQU-0PJI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CBULL6DgUe9CggCYIRWgvIG8dAx0oc/6eJPoZVfJcfA=; b=T4hxPhCElqyDUJn4At/i47NzZu
	2DY8dI0GRwfjMqDSf9GAUK9rWrPMGkZStwDQEmZxpE1q8fApUkTxFxNZ1ry054Z9NLTCS4PQCjV7n
	saL8ocOQr0vVqHRKluj481AJzVhgyiTZHjgFsKPB/AAWcvGKPkW4/xAKF5vievn+M5d4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Lpj-00Aoea-Hd; Mon, 13 Oct 2025 18:55:39 +0200
Date: Mon, 13 Oct 2025 18:55:39 +0200
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
Message-ID: <08a8e0d6-f486-40bd-a2f1-43e33ccde1d2@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
 <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_095546_133234_882FDF96 
X-CRM114-Status: UNSURE (   9.53  )
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

> > Notice how ENOPNOTSUPP can be 45, 122, 223, or 95. Returning EL2NSYNC or
> > EDQUOT to user space is going to cause confusion...
> >
> 

> I think we should just follow the definitions in
> include/uapi/asm-generic/errno.h, right?

No.

Try a make for mips, and look at includes you end up with. You will
find it goes something like:

# 1 "./arch/mips/include/asm/errno.h" 1
# 11 "./arch/mips/include/asm/errno.h"
# 1 "./arch/mips/include/uapi/asm/errno.h" 1
# 16 "./arch/mips/include/uapi/asm/errno.h"
# 1 "./include/uapi/asm-generic/errno-base.h" 1
# 17 "./arch/mips/include/uapi/asm/errno.h" 2

and this results in

#define EOPNOTSUPP      122     /* Operation not supported on transport endpoint */

not what you get from asm-generic/errno.h:

#define	EOPNOTSUPP	95	/* Operation not supported on transport endpoint */

	Andrew

