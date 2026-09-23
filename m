Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7A2C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAK2smec0sGpBh/YVftv5pYSh5pJeWG4AIykWvsLZu0=; b=e7lgeg16eyLElq+LENVgK6NEjC
	+S+9sBzXf0/A5efZvqQklWvwRTVH5va+RhP4QcaSWt5vNRQ0+SxDFkh2tcngqi9ix5oVLBmp92GK/
	AUp9LgeLWbCRUQYGe5zquskEppQzIqy4NC/T6FDAjPVrRXMujf1lM2EfgHOSlJOMb4bkL0XKZzZua
	B6u9bJg9WlyWdKn40umZh2j3DL48uVRpMx+FAVKmp/r8uUpofSYmmM2K9X0zjYykXWLZY2CJGbwz/
	pIDcj+QR8G3Pw0XdeTT+fcyemms3+9PQcYQrURzTs45Z3cOQL1dmVQ9HjP0+dBIIBEwXq/VIG73gH
	LF7LBCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ll9-00000008CXf-2lLN;
	Wed, 23 Sep 2026 12:07:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ll6-00000008CWU-2gqL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EAK2smec0sGpBh/YVftv5pYSh5pJeWG4AIykWvsLZu0=; b=IRN44ooSDxxsucQ8S7dmamUca8
	fpcZJDb4l9JgMusPXVSmjUEC0y2kkaP89A61I+XEUSmk8X3AqSWLjMn2x+krXG9niiOwoCt5vZx7H
	6jUk91duty+5roaiQXa3VewphnwDUgnYO8o3ibWEEY2a1rXh94fa4e0gZy/8smMW0Obw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9Lkh-006nMp-OI; Wed, 23 Sep 2026 14:07:07 +0200
Date: Wed, 23 Sep 2026 14:07:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 4/9] net: pcs: xpcs: add Qualcomm Nord
 platform support
Message-ID: <b7cab76a-c2f9-472a-bdde-162e1fcb5fd0@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_050732_684392_472DDAF8 
X-CRM114-Status: UNSURE (   9.71  )
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

On Wed, Sep 23, 2026 at 06:37:30AM +0530, Mohd Ayaan Anwar wrote:
> Qualcomm Nord exposes the DesignWare XPCS register blocks through
> separate direct-MMIO windows instead of the standard contiguous
> MMD/register layout. Add accessors that translate MMD accesses to the
> Nord windows:
> 
>   MMD 3 (PCS), standard registers: SR_XS at 0x0000

What does standard mean? 802.3 C45.2.3 defines registers 3.0 -
3.32767 as standardised. 

>   MMD 3 (PCS), vendor registers:   VR_XS at 0x2000

and 3.32768 - 3.65535 as vendor.

However, with a length of 0x2000, there is only space for 8192 of the
standardised registers, and 0x1000 gives 4096 vendor registers.

>   MMD 1 (PMA/PMD):                  SR_PMA at 0x3000
>   MMD 31 (VEND2), standard regs:    SR_MII at 0x4000

What do you mean by standard registers when talking about VEND2?

>   MMD 31 (VEND2), vendor registers: VR_MII at 0x5000

	Andrew

