Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B45EC44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c67ixvgOobnsD9YZ1g1D2/zxbHV0RHVU8Y3paFRKUfE=; b=MnL10ZPWSuIddtaro8gnsLUp9N
	/CMw+BLv5T7AlgNZhyvh9czQ3cuJb2xPBHnXJgs0cWpQ7bDQiuMz7JXBx05EnDMHfDRwkDC/svpkw
	v8/uF2h8QcaOJm65t9+acUz6REJDyoDI/FhYg5oee+5o0JlYepYhJXRwTuPoGdgHpHqexl/vQZGKe
	Bl1AyO0moZfXPowN8KOyzsbr4WXPaua17+v5Ww1SyyVuX/kRYR+ZeGTiCgr1582ITSRiSNhzM/8bA
	1jXPHO67QPYI1CfM7si3M90itEZCCtlDJ89zuy8DepNDAb07wKjba6BHbYldy0IszHEvx5l99qXV0
	05yVpAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmREO-0000000B3Ib-0J0G;
	Wed, 22 Jul 2026 07:19:04 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmREL-0000000B3Hs-1Dwv;
	Wed, 22 Jul 2026 07:19:02 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 60D3312F;
	Wed, 22 Jul 2026 09:18:49 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 09:18:48 +0200
Message-Id: <DK4X0XV6ZM1E.2L9G007WXO2J6@kernel.org>
Subject: Re: [PATCH v4 phy-next 1/9] soc: fsl: guts: perform fsl_guts_init()
 error teardown in reverse order of setup
Cc: <devicetree@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, "Ioana Ciornei"
 <ioana.ciornei@nxp.com>, "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Tanjeff Moos" <tanjeff.moos@westermo.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 <linux-phy@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-2-vladimir.oltean@nxp.com>
In-Reply-To: <20260721231603.67865-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_001901_514683_FC507B4B 
X-CRM114-Status: UNSURE (   5.43  )
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

Hi,

On Wed Jul 22, 2026 at 1:15 AM CEST, Vladimir Oltean wrote:
> Michael Walle has confirmed that ignoring the error was intentional,
> and we preserve that:
> https://lore.kernel.org/linux-phy/DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org/

I thought you wanted to check if kasprintf() fails and return an
error? Just to be clear, I'm fine with either way.

-michael

