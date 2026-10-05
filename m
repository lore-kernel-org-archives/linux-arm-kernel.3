Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF87CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMGNafCDTIN7tw4XYN2fDnbCF/eJLY/nlgTC6tJLnk8=; b=CVaOLigN7asLfVIAQVDc+JqbwE
	RHWna7aPRPm8uOYQnA6veH5blBXwpedBvL/7a48vLVW3NnPaMZFo/PokCd26WHy8EeH94RkY+nn5V
	dGQFGkenzX7JqnU1uQPQEPDDgDvxphvn9woIlrjaoPKwPfZ/Zv9Qm97t0/eqUyZolNp6/0dd2TbVl
	ToocIMFXFd/mlV95m96GaSDQdXMzaKzjhZ6ZdQ+hzi9Mtw0TUzKXRS7IZrzlZtdQ3HeerzXuS8O3O
	I8NSTM9qhC6g0P8jAmPp0RqTsFpst8aCEJQ87RGgjsemWWqjwUipeB1VDE989vLY8zZz4jcvZsX9+
	mpJ7mMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqU7-0000000HCwB-3Cog;
	Mon, 05 Oct 2026 21:44:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqU6-0000000HCvu-1g17;
	Mon, 05 Oct 2026 21:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4C3343AFC;
	Mon,  5 Oct 2026 21:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E767A1F000FF;
	Mon,  5 Oct 2026 21:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791236673;
	bh=OMGNafCDTIN7tw4XYN2fDnbCF/eJLY/nlgTC6tJLnk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D+l3sne0JSz7S/e0kjaWYoLkdpILd0g09XO0cEnq/7woWOynr0kGxi6v6ORBoneF4
	 cFDt30znQoNiGnVplh0IUpRrPIHe6bevX1qePBTo2eA61l2KPFmAEC/NdN0idLJscS
	 +6V6etyx8wQuYYe9v+wBjzCUcVNF3NCZIVdZY2nwLaZExH6ioS2Zt0yu/TJfB/BuT7
	 tIh8sB4+VhbfbmrdT0wYX+M2YXLglC1yuNBJPqrbR38XGATjv37EiqEn48ly4co7oj
	 qxXl/61UP6DhGKRzv1QaSVYNHDTc5Dsqd/GnUo6zMPogpAlXjWUUhl8ezY8P+N3edW
	 vpjmzcddJ/q5g==
Date: Mon, 5 Oct 2026 14:44:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>, David
 Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
Message-ID: <20261005144432.580daa2f@kernel.org>
In-Reply-To: <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
	<20260922200336.2201212-4-coiaprant@gmail.com>
	<20261005135939.01ccde50@kernel.org>
	<CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 6 Oct 2026 05:15:07 +0800 Coia Prant wrote:
> Thanks for the suggestion. I looked at this again, and I think the
> dependency is a bit more involved than it might seem.
> 
> The PHY patch (03/11) adds the driver support for
> "rockchip,sgmii-mac-sel", which is documented by the PHY binding (02/11).
> The DTS patch (10/11) then uses this property. If I send 03/11 separately
> to Vinod and keep 10/11 in net-next, dtbs_check will flag the DTS property
> as undocumented until the PHY binding lands in mainline. That would break
> DTS validation for the net-next series.

Wasn't the validation running on top of linux-next to avoid this sort
of problem?

> Also, splitting into separate series means each has to queue and get
> reviewed independently, which I'm worried might not all make the merge
> window in time.
> 
> So unless you strongly prefer splitting, I'd rather keep the whole series
> together in net-next. If that works, would it be possible to coordinate an
> Ack from Vinod for the PHY part? Or if you still think it should go
> separately, I can do that too, but I wanted to flag the dependency and
> timing first.

Well, the patch series is already getting stuck because of
cross-subsystem acks. Do what you will, I have 700+ patches 
to look at right now :/

