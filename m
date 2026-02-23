Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4D6EA4FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATg9bPcYdbnde39QIVVoT9NZJg4HqwYIBDM9M+ootn4=; b=f86vai6weg66+zFqmsTKBNkpMT
	JSts5lWGiNpA46u8bVD11F1+HwGp6cOvJVrhu3RW3CO+/csvgRbJV1o4t9uk9Sukh7lj0TGWXr2lz
	BxLsqQdh5d2hIotAhUcirYl6XarnuOZjX2vODCtHGtVtSPI/WUPZ11XOsThtU3hZdFaeMKH18DcUx
	PS7YK3lXsNvz8BYEdAjLyS9Ih8WpDt1LLQ/pbnPk3c6tlpp3XRTHZxaufw10gAzKFOBU6VwwJANR9
	1uMLRTtymm5ajR5MNpXJctQIa8c+/75c3Lfk8qjtL64oWQY05nZcYKZtWdiRq7mp0bixsrn0qyjsX
	bo+exkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX98-00000000USM-2psr;
	Mon, 23 Feb 2026 14:42:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX97-00000000USF-1iNu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:42:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 319EB600CB;
	Mon, 23 Feb 2026 14:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C39C116D0;
	Mon, 23 Feb 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857767;
	bh=+cWvpV653gRQnu0cW4AkcHRnKnqyVn6i1wzLUAvgpoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SN52Eh6IPc+fMk02ASHGoqIk/WWHlmCze5iqsWGilw5FjPFcEpklbiwgngthxUjKn
	 RvUOedFR9DoWuDgmn2MuNhqjmhFg/eQPHOMi6tlCRztm1bBMNJCza3xPKzBz1u034n
	 eVs4KS/hO3cYK1T5psrqopoItFerpSO5h9aw87pUE0OPFPX3IkxBOWGAXQ2Z9IZpLw
	 X7SCZUpHCsuUKMcIU6ERuZZHmCb2FA6wCIKI2xfVhBD5Z/NjsR4HwR8WWEGrRskA3d
	 H/6JeuXNV1UH+1uH9dqPYQ82jvUH14TQxht/v9QrVNsrLXBb8gWQBgOOdwU1Urad3O
	 uc1qMxDY0I6qQ==
Date: Mon, 23 Feb 2026 08:42:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linusw@kernel.org>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
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

On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQUEN wrote:
> On 2/22/26 15:48, Linus Walleij wrote:
> > On Fri, Feb 20, 2026 at 7:57 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
[..]
> > 
> > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver" and rename
> > files etc accordingly. Maybe it can share code with the actual generic
> > RPMSG driver once that arrives, that is more of a library question.
> 
> I would like to (re)express my concerns regarding the creation of an
> NXP-specific driver. To clarify my concerns, ST, like probably some other
> SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in downstream with plans
> to upstream them.
> 
> If we proceed in this direction:
> 
> -Any vendor wishing to upstream an rpmsg-gpio driver might submit their own
> platform-specific version.
> 
> - If NXP upstreams other rpmsg drivers, these will likely remain NXP-centric
> to maintain compatibility with their legacy firmware and the nxp-rpmsg-gpio
> driver, leading to platform-specific versions in several frameworks.
> 
> - The implementation will impact not only the Linux side but also the remote
> side. Indeed, some operating systems like Zephyr or NuttX implement the
> rpmsg device side (Zephyr already implements the rpmsg-tty)
> 
> Maintaining a generic approach for RPMsg, similar to what is done for
> Virtio, seems to me a more reliable solution, even though it may induce some
> downstream costs (ST would also need to break compatibility with legacy ST
> remote proc firmware).
> 

Could the virtio-based mechanism be used directly (without rpmsg)?


If not, it would be good to derive a generic rpmsg-gpio protocol from
the virtio protocol, and land implementations of this in e.g. Linux and
Zephyr to establish that option.

Regards,
Bjorn

> 
> In the end, I am just trying to influence the direction for RPMsg, but based
> on the discussions in this thread, it seems others share similar
> expectations, which should probably be taken into account as well.
> 
> Thanks and Regards,
> Arnaud
> 
> 
> I just want to
> 
> > 
> > Yours,
> > Linus Walleij
> 

