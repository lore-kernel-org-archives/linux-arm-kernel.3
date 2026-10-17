Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992CFCCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqki18dh2sw7qjBR1ax+MbRp8zg5PnsDMbmc+/oYY+Q=; b=0Pq4swmWt0z3Qca+VLcZThRiYT
	AaF5jCy5LL30hdcP4Ftwijse07ey86KQBCKec4h7840R/sJwsvIqdFQLgjLKHULlJ9muPL2us9FnU
	Ft2VVG2Le9d5Jfui7MfAes0A9ZFsZQtZaXycnFTxyzuYjAaqa0LyMXX4yhWZsfOFkwVQ8MWojeYjv
	t7h7mS8aXCxnuF2dlDq3U0GnCvhDnwFRllCMW96DlCuIa0Z+WiYCWooSxPtlw03UjMOPR3uXygb/B
	FVRdhPXb4O7s3DVQpXBOxUUmHewkz1nlwhPLJiS9fHd101YonvzqU8CavXFBjYsoTSwsEov1Y2UUQ
	zy2bKnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4qZ-00000004ny0-2qgE;
	Sat, 17 Oct 2026 13:53:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4qW-00000004nxh-3EsS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 13:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qqki18dh2sw7qjBR1ax+MbRp8zg5PnsDMbmc+/oYY+Q=; b=IXvf3/2aiKKcGiRfgJNajtyG6X
	nCHfg9ARZOdM+I38LEsFL46clgsoBcFs6GZUBdPPmRNI8C0M5+PDbaaSyjaICSMjhI9mZj9J6VreC
	OCz0w1u18rl3cnIJvIwG1lDs8oAFfNIRt8+99Nt4pS0wIBBd+3K7DNhtzoY/I6JFW6SY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xI4q9-00BKHj-6D; Sat, 17 Oct 2026 15:52:49 +0200
Date: Sat, 17 Oct 2026 15:52:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/9] net: phy: dp83867: add regulator supply
 management
Message-ID: <5402d24c-3d3c-4ae3-b63e-605bbdf64ec5@lunn.ch>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-1-26a8beb44b8f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-1-26a8beb44b8f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_065312_813972_37475766 
X-CRM114-Status: UNSURE (   8.28  )
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

On Sat, Oct 17, 2026 at 03:15:12PM +0530, Mohd Ayaan Anwar wrote:
> Some embedded board designs use GPIO-controlled regulators for the
> DP83867 power rails. Add dp83867_power_on() to enable all four supply
> domains at probe time. Absent supplies are silently skipped, so boards
> that do not describe them are unaffected.
> 
> When any supply is newly enabled the driver sleeps for 200 ms before
> returning.  This satisfies the post power-up stabilisation requirement
> mentioned in section 6.6 of the DP83867E/IS/CS datasheet.
> 
> Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

