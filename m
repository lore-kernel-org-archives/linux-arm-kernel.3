Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC696C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp/I9Y/Mgjx6GvKWv7wtlhx9b7XZAr2v2596rXTJtC8=; b=TPyXRAtXeLKhDRCfk6xmTH1hCG
	3Kpd7bQ4a6bCouzMzGownaJVl6MG4g+6jOZh/KQkUchLdVgg8xgmKoNtknkvQtx/Z4JXOI4jOEWsP
	Sd9uEgpUTf1jeYDlD+HmuzTH/g/OwjPoNuimCBumlbjR/AaR+B+7sT9bdkutfGSmELeVey0vtMd2x
	Xa3Y3POSj51zvHmz/TgK3p0Je+EH0XEVnewJkcXMIBdiBUUJcmTQDF4+YrEGU+QIusfRSbs789kt/
	n3Y6S1V89v/ZOHEEuTwW6SJu1Wq/e+HvmHA9Lv5EeRHTovmkXbTbIUcupSj+Nd3adZ4i1xMX+L5VG
	xcJ5ywhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jv3-00000006XKa-0kLK;
	Tue, 15 Apr 2025 17:17:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jXD-00000006TO1-2plf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wp/I9Y/Mgjx6GvKWv7wtlhx9b7XZAr2v2596rXTJtC8=; b=6Fg9lZLDnv5vxdgBEO67ohr/1b
	8mXoiPEDLysESWIrWvdbZb+91akD6+vu950P7lSikqfrTnvCNuWQHtAQUV147k5ZDUO5y8zFOPrst
	z+UGK5KWMfeiUsjIMJTO3/cq9uJ5lIhxnJNfIkLyFYGLtP7sFQzRWHHGGBwPcPQ5HCp4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4jX9-009UUr-Bt; Tue, 15 Apr 2025 18:53:15 +0200
Date: Tue, 15 Apr 2025 18:53:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: sti: convert to
 stmmac_pltfr_pm_ops
Message-ID: <015dfded-fd5c-4596-b89d-3522e38d707e@lunn.ch>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
 <E1u4jMo-000rCS-6f@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4jMo-000rCS-6f@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_095319_708882_BD3D8DEA 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, Apr 15, 2025 at 05:42:34PM +0100, Russell King (Oracle) wrote:
> As we now have the plat_dat->init()/plat_dat->exit() populated which
> have the required functionality on suspend/resume, we can now use
> stmmac_pltfr_pm_ops which has methods that call these two functions.
> Switch over to use this.
> 
> Doing so also fills in the runtime PM ops and _noirq variants as well.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

