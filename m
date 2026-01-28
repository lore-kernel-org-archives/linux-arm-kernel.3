Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D88ED25B44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=; b=DFkKQ2N2AjvIAuXalGHrz6MQyD
	gtmJEtuHj4yC+Gv5QADf8Eghl/kuDO6i14DtobfF+7PqAgfl+d3kK0RUjM0TXmq+jtkLdJRtnia8j
	JG7wZCIQOnyWl8dud7bbIpC2YqSbq8xV9/K4aPZslVXDEg8iNLWvKaPvWz/xfKS74y5/ToW1sf/oR
	lC3rAME0oiEhZNNN2snlHGmLMizPXUHqTE//HMTsq39FUlpCIldGdpYMRcWI2KlXUl4YOI5P6FiMA
	HdaKmXdm7pDU8N4hQhgmZo4NSj64hbTtEOgS0uq+qb9SgrzlH6cTSg8TKKt6AL+D/DYLUNSBrUgtE
	LEe8r8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3cv-0000000Fux6-2Tsz;
	Wed, 28 Jan 2026 11:22:25 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3cs-0000000Fuva-25KT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:22:24 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-124a95e592fso325491c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599341; x=1770204141; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
        b=BGUg5WuYB1mRlKrQMzX8VMMeF4/2ZEfRrRiRZ3AN1+wrwSHuaj7MH5VIXZMlM5PNSJ
         Kj8JcdhXdL2pbekUzBHKICvb7V2rZye27wc6VPO7i529kOlqE5dEJUJ/4TcGQvs7O4SF
         p8uZSlTS5ktXd2fmQh0TxJhGFVzyzRA0Vv0oLvyq1Fy8M8buHwAYWugf9ncxtFchn8Ey
         +tP98VZZtEt1DTjZAyxA8ELIPEyBQxgDIzsWy2XOXFpjGkmZmbVlr40P29Ud99L5ceM6
         vRslRzfNEbso3n455rJflOY06q0/S6weHwGZLbX3hkLTvQ5X0qSlvkDczzk/gczwDlKr
         a9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599341; x=1770204141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
        b=dgE/KwbGbgjcjIw13qM8RNCK3Ir67t+5vflKtL8pA/Z7osvTUV88Ai6zkPVLUlV03q
         YjW2K1akuG1Jv0XfdFbooI7F43zZJWDIs1n49EDo5U84rfWwHBp2Jd+bClVQzzDcRT1Z
         gH4JJlvNMcsSr61EwelJKHo4SBdWIqLLLL+ifvhKYaPVrQ/pMq97Ybt023U0X1nX7m1P
         07I47W1urPaY13jogg2VvjMQDQ0qc+bCKCVpGnNhSnQpYFWYwFnNMsZrS7YxtqJOV2Ji
         6ccLDkALF1ZhcOLEB5UZMDLPl8MSMs836aRDe7HympTYFltTiZExzdFCbFZKouJJ3LKi
         0BIw==
X-Forwarded-Encrypted: i=1; AJvYcCX2NNBF7wWXYGPPGFVfVcSssbqzNfZhmYMe8HgbgdlUoRVwUbAu/pwYw974KD9jaWWZuAkYfpJ3fGJ23Xb1Bg9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5AGsIIIrh40a2D4uYP3HB+JZ+x0JR052JVyVofRZSAle6N7hh
	nzBPNszyf7FWL1AcXU/EFVL5xCsyIAoJyVN4QTnvu1sAG16wrnrVTS8a
X-Gm-Gg: AZuq6aKmgBADBhV42UGZNT9LOLGgagNlve4WtL23GIb/z2IlCycr+aHPNuPMeAEnTEJ
	m88fbj7SelpL01wHla52Bd4dxjV/hQ+cJ1yqOYFlfy0NRzTb8xgEwa0ONVZkfco1xvSFmH0RqzA
	79KMA2eijQYt4Fr8o5l82KcoYcfyUA0e+8YFTuO3QxFyypBkttOcDxhrE7gPCMQjz0Ajwoc8jn0
	yW335HzOuZHTbqjSl0QmyKsOt5w1bHTTkmB+RqKOc/5WgHpNBbl6cEfGNo8oIQ+KtbRVZZS00Pp
	Sv7BZxCX9g+o326OnImFocQ4atsV24ryjNUgKbGhoNvn87iaFIiEbCPZDjdWcYx9B6Ywq5pww+/
	JbmYnDETPQ7yo2mSmlS9Hmw4igff4OapDa+FB/0TEsjWjqvJqvHS48E9qsi6z3OqS3ZyObpnydd
	V8t1kkptrMeQ==
X-Received: by 2002:a05:7022:eb47:20b0:11d:fd26:234e with SMTP id a92af1059eb24-124a0070cbdmr2385944c88.16.1769599341399;
        Wed, 28 Jan 2026 03:22:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm2140833eec.3.2026.01.28.03.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:22:20 -0800 (PST)
Date: Wed, 28 Jan 2026 19:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <ziyao@disroot.org>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXnxDlExQRYrbf6s@inochi.infowork>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
 <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_032223_001687_4567A19F 
X-CRM114-Status: GOOD (  32.66  )
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

On Wed, Jan 28, 2026 at 05:16:46PM +0800, Vivian Wang wrote:
> Hi Inochi,
> 
> I have some comments below.
> 
> On 1/28/26 15:29, Inochi Amaoto wrote:
> > The etherenet controller on Spacemit K3 SoC is Synopsys DesignWare
> Typo: etherenet -> ethernet
> > MAC (version 5.40a), with the following special point:
> Nit: point -> points 

Thanks

> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> >
> > Add Spacemit dwmac driver support on the Spacemit K3 SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> >
> > [...]
> >
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +#define MAX_WORKED_DELAY		2800
> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask = RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > +
> > +	return regmap_update_bits(apmu, dline_offset, mask, val);
> > +}
> > +
> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +	int best_code = 0;
> > +	int i;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	if (delay > MAX_WORKED_DELAY)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Note K3 require a specific factor for calculate
> > +	 * the delay, in this scenario it is 0.9. So the
> > +	 * formula is code * step / 10 * 0.9
> > +	 */
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +		int code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
> > +		unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +		if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +			best_code = code;
> > +			best_delay = tmp;
> > +			best_config = i;
> > +		}
> > +	}
> > +
> > +	*config = best_config;
> > +
> > +	return best_code;
> 
> Is this really necessary? For K1 I just used the smallest step size.
> 
> It seems to me you have, for the smallest step size, about 36.7ps * 0.9
> = 33ps per step. Theoretically speaking that lets you fine tune the
> delay to within 1% of the 2ns total required RGMII delay (MAC + PCB +
> PHY). In practice this number shouldn't be that marginal. 
> 

I think it is reasonable, I will take you advice and use the
smallest step size.

Regards,
Inochi

