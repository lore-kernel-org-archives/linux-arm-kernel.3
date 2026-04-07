Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55C1EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwOkgIATGiCfLvpCgh2iVw4y707zmZ1cDQaby807Hjw=; b=Nw6vlFO9NNGbLOcVa8wYV8pYKh
	yqoPqsjV7Dog63QILEafIkADI5fwNBShZNBFxo6GdxU0YT6Y4078m8ep4psRze8fMTjveFtfvRKek
	zedo6E4W0UI0VpRltzt/vJ9m4/ZBNiokgos1jXQUnBDUkifJkutzhyaDZXNvABdO5HTuynMoagucc
	tOHNYzbi+I8f1t4PnsM3ng8BmBy94ycgHDI8FEk04ACHO05WSA4M/Zldkapa9vHztPtEgpL8TnuBL
	imyj3o5ll1eyrVk6ZZ6HuSKXujvO3A1ZBqw9WtCjtE3JerF5h6r+9KhkGQzEFg0Is516HqRTMKZCR
	tg/01wxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1WC-000000067KI-3P1I;
	Tue, 07 Apr 2026 08:10:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1WA-000000067Js-1g0o;
	Tue, 07 Apr 2026 08:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775549428; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WBi0XJ0BbSsT1rPp1AL3eNjXsDZlyrl/SDYEBiBDhWn0pm5DSTSzcuVoKIbb17SLKr7KJ//7qyQrOKL2WjZYE95QzXp4/KVqIdSekwI+rKZuE1oXwsvJIeX08XnnplMvCc8aUcVHVOQjMYrgoUKJG1lf6FiGGUFeWLROpDubsnQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775549428; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YwOkgIATGiCfLvpCgh2iVw4y707zmZ1cDQaby807Hjw=; 
	b=nrQESSwguAS1L+yTiGaeTVpa7nkpj6m2LgxZKABb8vrEhHB0AbnXIEzbUA9tHjIRzbAn0bgaJCbOORCLnKJjMhQc0OSY37ey3oaOycv7HyzHl7MDj61OWAYdH4mYYlyBQfbQd55WGcgL2dAuIc6zO8vJS/yNgYX+OG6UMuFXhRc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775549428;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=YwOkgIATGiCfLvpCgh2iVw4y707zmZ1cDQaby807Hjw=;
	b=bEVWl10RDW8jT+tnbC1NpOKLXO//mFuU75mYBlFj1qettNdizXDBQu9uFQeehAop
	YrNYbDKfvArT9QsNWMki5LlTNisTxZcSIWmOpElDIy9KelOtt/O1aFLPA4qAsjshX9b
	WhMctqOG2QZIS9fzM92eOWeVw/zqUy23CHNOv8+U=
Received: by mx.zohomail.com with SMTPS id 1775549425509524.2343363376186;
	Tue, 7 Apr 2026 01:10:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Daniele Briguglio <hello@superkali.me>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v3 3/4] soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register
 offset
Date: Tue, 07 Apr 2026 10:10:21 +0200
Message-ID: <6254685.lOV4Wx5bFT@workhorse>
In-Reply-To: <20260320-rk3588-mclk-gate-grf-v3-3-980338eacd2c@superkali.me>
References: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
 <20260320-rk3588-mclk-gate-grf-v3-3-980338eacd2c@superkali.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_011038_524009_720954DB 
X-CRM114-Status: GOOD (  14.10  )
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

On Friday, 20 March 2026 11:34:15 Central European Summer Time Daniele Briguglio wrote:
> Add the RK3588_SYSGRF_SOC_CON6 register offset to the RK3588 GRF
> header. This register contains the I2S MCLK output to IO gate bits,
> needed by the clock driver.
> 
> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  include/soc/rockchip/rk3588_grf.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/soc/rockchip/rk3588_grf.h b/include/soc/rockchip/rk3588_grf.h
> index 02a7b2432d99..db0092fc66ad 100644
> --- a/include/soc/rockchip/rk3588_grf.h
> +++ b/include/soc/rockchip/rk3588_grf.h
> @@ -19,4 +19,6 @@
>  /* Whether the LPDDR5 is in 2:1 (= 0) or 4:1 (= 1) CKR a.k.a. DQS mode */
>  #define RK3588_PMUGRF_OS_REG6_LP5_CKR			BIT(0)
>  
> +#define RK3588_SYSGRF_SOC_CON6			0x0318
> +
>  #endif /* __SOC_RK3588_GRF_H */
> 
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Verified the definition by comparing it to hardware documentation,
it checks out.




