Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F938CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgOiY/8TM3TVUl6GJF7nL449nJQfKgvLd+3cCT8JD6o=; b=xmQ9ANNssZKMbzNs2HZJ9l+STB
	KvvKLBqeMRvpo7eKSR7S2D1iP/XJoxWoPhYU5V1AT9gUWPlEi5oV29FWelAlv8Km9zrJAIYJ8FGu9
	svk0/xFxdNnD1C6pLHnvvTEgqS708fIVkbXQwfYzwebnS2BeXce2ECmVOX26vvNl3jP7vDBRDvIlF
	Cle61+QGOtMsXRCY+I3hhou1mKFyX5VM08Dz8O3lG6GTK1fa1S2n/LUTjshaWWMkZeubTfSMQjyIV
	PulZ2lZUz4lt6IsJexiq9I2vtWgrirjWkB4mI0abyEVlszbv3QT8dC9szEONNOl4jC2DJnagIOUZG
	zMM1Qa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZvN-00000001AQJ-2M7E;
	Thu, 28 Aug 2025 10:32:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYv5-00000000xnR-01iK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PgOiY/8TM3TVUl6GJF7nL449nJQfKgvLd+3cCT8JD6o=; b=rECEJydgc7m8D9fDVfaSoNnCtY
	Cvzwrz1a+X+uHqcgSXiGPBIr/ddNcuBSy8iW0m3ERG6Nwim6qN2to5wuTZcM7KH9W2fvjxl5dZK5q
	pfNr70KoQQmHgAGweJd3ElGoczV94jzic3rfWFZkcUQHrZO8o3mlGqblzzBxx+6De/AbzRG+k/LM4
	fxgM38u5ynrl2HQTDNifVxJECo1H1CBgMhfj6FoxcvQ24klFM63xabIQagT17IUb4938lM3ZIhEEX
	EXmixQ/gPXiCsWXjlOwSi9bNPN5HrCdlU0vYdejEJln892uQKeEJCtbzlOq2HCh8K3saB0Pon/Y4/
	kmSAU+HQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42286)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1urYub-000000001Pu-1HpH;
	Thu, 28 Aug 2025 10:27:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1urYuW-0000000031q-1yMo;
	Thu, 28 Aug 2025 10:27:12 +0100
Date: Thu, 28 Aug 2025 10:27:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
	primoz.fiser@norik.com, othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, netdev@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: Re: [PATCH v9 6/6] net: stmmac: imx: add i.MX91 support
Message-ID: <aLAg8Lds-O_36aaN@shell.armlinux.org.uk>
References: <20250825091223.1378137-1-joy.zou@nxp.com>
 <20250825091223.1378137-7-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825091223.1378137-7-joy.zou@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022747_042039_D5A18744 
X-CRM114-Status: UNSURE (   8.59  )
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

On Mon, Aug 25, 2025 at 05:12:23PM +0800, Joy Zou wrote:
> @@ -310,6 +311,7 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
>  	}
>  
>  	if (of_machine_is_compatible("fsl,imx8mp") ||
> +	    of_machine_is_compatible("fsl,imx91") ||
>  	    of_machine_is_compatible("fsl,imx93")) {
>  		/* Binding doc describes the propety:
>  		 * is required by i.MX8MP, i.MX93.

Doesn't this comment need updating?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

