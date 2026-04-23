Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47D9F589DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJ45MRd50YmhTuS87ih6apveq2PuxqmT1boxyJYCNPo=; b=euvaIsIwD3A/efkHtHStIdzF5B
	ILvWu/apowS1j/Axi2OMOfHmEgHS0G6Zb2/q6i4IcuKVCHYoyrMn9CEEEZcdSzDjKRAmsBFmBO9bE
	FI0OkpSptZKqDVJUNk+fuOt3OeeL1HQ9qKiZbhfi4iQ3n5aOuF08tG4K6x9XRg5i3cb1w2u1uzpr7
	E3O8X6tx8TcfLj55VPGsXXSWrdhRIogbESKlIeL4SaVjoQln2NmPEGbiwzvfLFNx9CQ7cD/GFK70H
	yXm3iFyShP77H8+i3JrI0LXyM3YmPE/20SKbPhudwZ+/IxwOfZM/H2e4EPuNm2v0c4r0THhO90gHx
	o6i/A+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuV5-0000000Bm4F-3N99;
	Thu, 23 Apr 2026 13:53:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuV1-0000000Bm3o-30Ij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 13:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NJ45MRd50YmhTuS87ih6apveq2PuxqmT1boxyJYCNPo=; b=Idqd7BHnu2Vb4Ca8b6K1WFzn4p
	I/HKK+Y6KDoSFcUFKSfzIYdeWWTfIB9QcuVugQ/GkQMCMqd8+1ueMe8ipPGg7khwJjj26jz38/82/
	RUUEYHFn7spP9fIHQUSVVIkU54Ejhw6/pB/G01fSHd5PwBkqMzz1FeVZ/wgifXjOzEgo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wFuUm-00HFdP-Cn; Thu, 23 Apr 2026 15:53:32 +0200
Date: Thu, 23 Apr 2026 15:53:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <cb6b8ec9-296e-40fe-848d-ae87463ff1db@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_065347_776283_A3B8D49C 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Apr 23, 2026 at 06:53:12AM -0600, Mathieu Poirier wrote:
> Once again Andrew Lunn was left out.
> 
> On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.

That looks like a step forward. Now we don't care about legacy NXP
firmware, it makes it easier to make bigger changes, like use the
messages format from gpio-virtio.

	 Andrew

