Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B6CD2AB3A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElKAZBpC1Bz3c3ZWQvoUbtLIAcBoKNg+61eUP/xcpvs=; b=AgWF2dfgeOC0uqgNoYWknqLOeQ
	DDGgWVZdzACzpQEGwmlCoN7yJfDthlEFM4S3aYG2zElb/5hLaDkqfiEWdmjwk2AbV9Yb3fYK/S9Pb
	Q4+sPwvQpHzGedUfGMuhF2ApbJl39j/nGzMRs1t0Mqsm+VXzNxI0l3IzV5ZU2eioUqBVhANxtq1XI
	3s91W8Ij/AtnUACeEzMgHGgDT8kw5R1ZL6CYCO9TeYvIYrfKdhtBWNdxspoADW+FZTErrWGcNaXsx
	+zfF+OQ4PxQWDBS8pZIIdcRoFC4+iWDFQmcyfjyYcIkrf3bmRBo0h7I5z+Mzgiw/Vjau+7SMkQ1wW
	moxV12rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ldo-0000000ESlo-3ntZ;
	Tue, 29 Oct 2024 12:48:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kxF-0000000EKiP-26IK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ElKAZBpC1Bz3c3ZWQvoUbtLIAcBoKNg+61eUP/xcpvs=; b=TOdivb81h7kO4APQVlrHW6Ggvn
	PdyeFSckShHnpMVl/foeE5n7f1EEdC9yVeuRNZTv2f/PZe6MuCKcO6lgJiCMXujRq8AuP/b3/Fq4a
	ddQRRUyKIsExDr/4ImN2J1/8CmOi0DM34xVTqbqt2pxt3XPLIkVLRVgKgEmxSOcgVzFvGurvhGBfB
	UShFO3MDghzfS6lRLaHbQd+osHms8+K3gOGbeg7BpQxbEk2WXDM1QgHYvU78aIuMD7bEecM2j3QDa
	lcX+qUQQYbBXD9DZOjSgCIVgWxeeR2lnAaQ+YRP0TMSRytsBKL39gVKPSDGNtRm+SNUj6ipXUok8j
	cEUk8nGg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kxC-00000009tHi-2R6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ElKAZBpC1Bz3c3ZWQvoUbtLIAcBoKNg+61eUP/xcpvs=; b=EpSpDjrx0AHgOIm6YSSGWkM7dD
	d94cKajxuWsmFiHDLkfV1xw6l+45fSZNPS/QiqL3tzbWVBRCokDQPnyJ3SBF1qaPDFLqGL33/kk/W
	okLccrvnvbVQCC8bXmdhDtO/GcQv78NshflHHOv+N1zc/m0PiIYgKJErzGWMoc21pOUk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5kwx-00BZFM-9r; Tue, 29 Oct 2024 13:03:51 +0100
Date: Tue, 29 Oct 2024 13:03:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 09/16] net: dwmac-starfive: Use helper rgmii_clock
Message-ID: <f95333cd-6cf2-4181-9cb2-ea78810b8e40@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-9-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-9-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120406_967582_6B3F1AE4 
X-CRM114-Status: UNSURE (   7.88  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:51PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

