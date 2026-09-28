Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7A7CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJHzxKXVtIY3P2yIJggYlartU1XE0ipq+eGOK0t1wt0=; b=tscd69WfyyqbJmBbyAYTGfrKjD
	hWfG/67KCFFQ9McuM3aMse4WC3PE0UmhM9/DlaspjEpOAO3wml1Oq4c3THTYT5lt90j219h6GM4FG
	YCCfnRvzvpvRr+8VJ3ZB8hntv92lcH2waD3BJYsNGJxnMsEVyq7OCueu4koy/g7d1pGPHZSBTQOWu
	lzR7kfxZeTXVUFCSCXd+cNrdj80pIPJuKjrp9btB4blnnFWJcQx9em+IcfMjkI/v0rUO25wzDkuu2
	HbRLvrQ/mu/MUFIDi3H4c7zlWOdEEgEOZfh0i8gu3lU2WreUzJitKOWq6Zc8yKejj6LLfdk3hxBVa
	nS0EBgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH1q-00000001QsF-46aM;
	Mon, 28 Sep 2026 19:28:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH1q-00000001Qs2-0azF;
	Mon, 28 Sep 2026 19:28:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B7ED60120;
	Mon, 28 Sep 2026 19:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F39C1F000FF;
	Mon, 28 Sep 2026 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623724;
	bh=cJHzxKXVtIY3P2yIJggYlartU1XE0ipq+eGOK0t1wt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FV1vBIsy+SJMPxhCKAU3fAvonyUNNwCFv27Vmyk/SuURYrycGycfXXiana4254/1E
	 18ekcOUMpDcFVSI6uHiDLIGH6ewct+bqrjzOLXHajDpk0FM4hRyc5YP36qT9z5c5G6
	 AQTP8XhFgWc/fu9vMHuyl/wYjEc1CFHp60HYtmEk914pJD8xS4Y7CayARzmQ42gTfK
	 EQaii28pFUn5lRFDdlCGzb0GrrAxASWFHYl+VHZl70eJPM2zSCgBFD4SW+9+JuohSG
	 YV+bpPHCDU2zlgP6SYgiKtdtXiBJM5xJ19u9OLh9EaM0DZRjFMa+wU0mLXpnR/Ry0E
	 6TClnNMxJzzVA==
Date: Mon, 28 Sep 2026 14:28:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-rockchip@lists.infradead.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux@ew.tq-group.com, Geert Uytterhoeven <geert+renesas@glider.be>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	imx@lists.linux.dev, Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>,
	linux-tegra@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jimmy Su <jimmy.su@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH v6 6/6] dt-bindings: media: i2c: himax,hm1246: Use
 video-interface-devices
Message-ID: <179062371908.398635.9659405053425999054.robh@kernel.org>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-6-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-6-5e8b1f01be29@ideasonboard.com>
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


On Fri, 18 Sep 2026 11:44:18 +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the example binding documentation.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v6:
>  - Actually use the correct orientation!
> ---
>  Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


