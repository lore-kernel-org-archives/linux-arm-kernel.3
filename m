Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF57BC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xCRMisnHYG+rKe2zqaB+fT8Zsy5tgW+HFQAhsYb4aQ=; b=GkOczmNZ0A96FJFIDvPthSjG/O
	CGyyvFVdduSUXgEdmBZTvfK3uVNgXdOiuCNWUfLFKMc+dx/SZ8Y2hX9vb9mMfCAtPdnEkSl7GxUIS
	MMnFfk/deMd1WX050TGxx2YENZN+N+MvuYwxyO4vrbB4SPivvoVbpBDCCZF5dHiM3wv7xuyWr4ZTZ
	AueTw5aD5KxVdVI594MovvuBDpPkW3VO2vyZm+eobSnMB9PcLdhLBvwolvKBC1NHHxtoWRFl9J4zR
	UjCXbCC004Y1rsC3ovVQorMbHWXwcvAHmk1QbH+ysZNR2s6ApuM+Y7VfQhD8toX7BZB4LWueTd0uA
	PdMFRT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATKM-0000000FjIg-3vZD;
	Thu, 01 May 2025 12:47:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT2v-0000000FeyK-2aeG;
	Thu, 01 May 2025 12:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4xCRMisnHYG+rKe2zqaB+fT8Zsy5tgW+HFQAhsYb4aQ=; b=Rs9xhcaZnyE3EgO5NsWtKg+rGr
	HKneR3rv8W3Uu7rGQsCInI4mFx9Sex1+GQBO6NdgpG2QzURqWKxrcH7gxzewqBOKr0wQMBRKxOAMW
	suttM7urgjvAu+BXm2VBlVrWlj0lcZjnImryubfeJ87vJVH+fzJ0G/4E/V7mHz9iSnEHD1CNVWA9t
	0ldZ7u4k0EqBJq7Z8oZMNmUwtrZBoj70PzKeukMKVMhG3MN8R8FlZaHFEOGVDF4Bg3Ve1iCn61+oK
	JkgXMWYqT3XhDUHKXStoA+lSyfECRy6+mm2cXCDLDpiGlCJPNusI7qyEt85sDqogKH9C87O6JvxLz
	nfPVGqKw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uAT2s-00012o-CU; Thu, 01 May 2025 14:29:42 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org, cristian.ciocaltea@collabora.com,
 andy.yan@rock-chips.com, Algea Cao <algea.cao@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz
 error
Date: Thu, 01 May 2025 14:29:41 +0200
Message-ID: <23932150.6Emhk5qWAg@diego>
In-Reply-To: <20250427095124.3354439-1-algea.cao@rock-chips.com>
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_052945_655781_8E6F249A 
X-CRM114-Status: UNSURE (   8.91  )
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

Am Sonntag, 27. April 2025, 11:51:24 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Algea Cao:
> When using HDMI PLL frequency division coefficient at 50.25MHz
> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
> get PHY LANE lock. Although the calculated values are within the
> allowable range of PHY PLL configuration.
>=20
> In order to fix the PHY LANE lock error and provide the expected
> 50.25MHz output, manually compute the required PHY PLL frequency
> division coefficient and add it to ropll_tmds_cfg configuration
> table.
>=20
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



