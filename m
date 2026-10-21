Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADFA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G/cDMcoL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=YuDfAoht
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbUxAF4+fhGaTwU6SyGGMBBPCIGMBSiSpExMIJK1rcE=; b=G/cDMcoLmqUUm8qFO1CgnLO5QF
	78vDTSAXOj/y0I7IRNll/QynYppLEWK5vEgCfbR5LeudmT8FVFpKaXn7aGbdFDWslXZhQkREC640h
	6662ypmXFve/6fBBEimyDeEE1pQ5Zb0GjlUf74jdDbKxWBr499jWItL40BKpluAti9fi9yaGO7fLm
	t8aDXTCxnQ49Xt3AFZ1byaETbpYfcZ+0FH4SWymBAuWB5SFzwCnta45J9sPCNgbymAlCv4gpMMzc2
	H9rvaSrPOVt+Wxe+9FBt2VSaiwrLzXdPbmwY/U5rUOI0XPN46Ej3PmQjXqUGqNAlKpwpzsqdGxDyK
	oRJEGDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVgh-0000000BpL8-0bhS;
	Wed, 21 Oct 2026 12:44:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVga-0000000BpI0-2JaT;
	Wed, 21 Oct 2026 12:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NbUxAF4+fhGaTwU6SyGGMBBPCIGMBSiSpExMIJK1rcE=; b=YuDfAoht/p9qIU3gcRDo1zQNIE
	ZJewm00U8PJGJBWrNWIxjpN84vJBt1FRbw7fyx0Ar2B1AJmeukQ9k+kZNYws/CB1pu3y14Pmpu53S
	JvCAhGDlO+aArpYaGHTFVQ2Vc84oPDyfJEKxJr8DQJZV5AnBdWVmupbXFYHvV3A/NdZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xJVg9-00C5Go-1v; Wed, 21 Oct 2026 14:44:25 +0200
Date: Wed, 21 Oct 2026 14:44:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@kernel.org>, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
Message-ID: <838136c0-5f4c-4ed9-a0dc-d05ff338582e@lunn.ch>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-2-25daf2bbcf35@collabora.com>
 <b4950f82-0163-4482-9799-a5e3c6eb5964@lunn.ch>
 <c53928fbb9da11b0f32a84592742e6a26e1aed32.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c53928fbb9da11b0f32a84592742e6a26e1aed32.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_054452_665959_A70CB991 
X-CRM114-Status: GOOD (  23.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 11:43:39AM +0200, Louis-Alexis Eyraud wrote:
> Hi Andrew,
> 
> On Fri, 2026-10-16 at 17:40 +0200, Andrew Lunn wrote:
> > > Finally, update "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps"
> > > property
> > > description to add MT8189 RX/TX delay stage divider values, as they
> > > differ from existing supported SoC.
> > 
> > These should be mark deprecated and the standard rx-internal-delay-ps
> > and tx-internal-delay-ps used in there place for new devices.
> > 
> I agree, it makes sense to use them to describe the RGMII internal
> delay configurations rather than the two existing vendor properties
> (mediatek,rx-delay-ps and mediatek,tx-delay-ps), and deprecate them, by
> adding a deprecated flag and the comments you've suggested. It would
> also need an additional patch for the driver to handle them (while
> keeping backward compatibility).
> 
> But what is bothering me is these two vendor properties description
> says they can be used in MII and RMII phy mode cases. The driver uses
> them indeed also to fine tune the RX/TX_CLK (in MII) or the REF_CLK (in
> RMII) configuration.
> rx/tx-internal-delay-ps properties are limited to RGMII only ([1]).
> So they can not substitute them as it and with their description it
> would wrong to use them for MII/RMII.
> 
> At the moment, in the upstream devicetrees, there is no "mediatek,rx-
> delay-ps" use and the "mediatek,tx-delay-ps" use are very few and only
> for RGMII phy modes (either rgmii-rxid or rmgii-id), so no MII/RMII
> real use cases.
> 
> So, how to proceed then to make these bindings right?
> Use rx/tx-internal-delay-ps properties for RGMII and mediatek,rx/tx-
> delay-ps for MII/RMII or do you see another solution ?

If you say "mediatek,rx-delay-ps" is not actually used, then it is not
an issue. As for "mediatek,tx-delay-ps", i would probably ignore it
until somebody actually requires it for MII or RMII. At that point, we
can add specific properties for MII and RMII, and not mix them up with
RGMII delays.

      Andrew


