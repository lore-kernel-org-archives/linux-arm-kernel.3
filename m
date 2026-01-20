Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9C5D262AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=; b=eVHWtvEagu/DBFq6TPewkgaYSU
	AHQ9ji8uR5fZIkozBUFGigRDEIZV3f4aiYuVbwJZSv2iSMRalxeiAuGf9iyV5CsfKzVeRpSPytpMk
	bz8TwN9USvMC8AIC0DV8kDPujRPvzDVxpWDHl927Xb4I3U+Iurne/jeYn1rSnqq66PIFzaFmRJZ/O
	rBohYWMf5ryhU5VdNhN/3ufgcpKhFlE/RW4lGnnJ+gRatim6idxtRHA7VJSCWIJFsWT1mMC+bNcCw
	KYNj3M+jY7Va0JIj4oDHMRqqsgv2CtO/lYtbTt52MYIUI63YEQbXuLUsU8rO4FgIftSGYgsPfPnXV
	EZIFFx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKKd-00000004aAd-2dXQ;
	Tue, 20 Jan 2026 22:36:15 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKKb-00000004a9n-1H8p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:36:14 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso2387915eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 14:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948572; x=1769553372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=;
        b=HqTo6o3tvewVWcglL+ON6DYul1RnkYolIElFFKFsAyrDPi+xdAUz1FkhQGkcKye/OS
         zRVJvF+Ths9zqEyG4Z7akcoXdNLqzMTpBrr3ikakUqOEzlrQSP3D8oZH0gx2IQWwmcFA
         5ljPw90ouyCXIlkRE515xtjRVSnpKcvISzWPOpxraFPllmGrQEnUxyGh0LI4KNKtTw9e
         inqa4uBiYucrg5KiMT+DPHQ/AblV/d+iOdqQB11AnYzAuo4d6jc/ngRCn/44KNMuovVx
         lM9np/RnchYP5lPp/OTkaBnVCCvNCfiriDXTqHOLu7GnrIkOyf+yOgN8JrlF2DrWTxC5
         VWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948572; x=1769553372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=;
        b=jRE9Rub5Gm2tl3INSM2nvmAvSQpHb5qI7QMKYDQkbCDzFRi5kqD5SkqAs2Sx1HPH42
         LVde1cMsG9GefjwO4RiAP8th7XjTGyquTBzdoHrzM9BkZkRlloPohfKwbee/Djk3SNh+
         38CxOn6peZqEy+w16Cx1u1mXO3nAQKyAf+SYZ8MonqZAM6fxDxA1ulhX+w59MMXg1M5F
         TMv9koaGZiapd5XYzTIBvQq6WDXqPfy6q9HRMc7chkEWjwuSoXHN/NIgHmKxsnHeUcu+
         hROynWCg0K06relGiW1/YvcXEXOMq/Wt3Ce446IWgb8+GZawfaEg+kjQzQFOdcjykihL
         H0eg==
X-Forwarded-Encrypted: i=1; AJvYcCVvKWO5vyx2tfmmY8JU8wTjxUL0wTkNJOoFbWB8vr0nY/+whaoV/LggJYK31p8rfbqplvOI0EMHYF3ucBa2dl4K@lists.infradead.org
X-Gm-Message-State: AOJu0YzKSzNkbEiho9cAwJhLB5wwe/5NqJO2ceN+daSDidoMR0QOMjgZ
	uYQcA6SFZbf84qq1keho/Ry24t7Mk2ywHZAWGRcAvysulK8d75yTAujn
X-Gm-Gg: AZuq6aJ7W4Mcs/ynP8iYQZNceTz40ddRK5cxwILT0mV2vlNd8/Ti9wzAgQpIwQslKCd
	vGFcH2BcpaQrigV6kNPYyYxtWuwTWMY8OVDZOA9kMqRrX9Ea0y9HjnQthsb1utcJgmomJmlt8n7
	mXuaRZPzC4Y78L3GcIknmfr5msuM4vW/REmMumGPiQychGgN3KcxscdAoetrmpPL1Mq46uZB+zT
	lq949IVw5nJ2os2UNElzUYWNl41Q+Il04rDExTrhi/10K27BDqWeAVuK/9PswTpWf2zQJJmtthl
	K5pjjooNwpJM+1IP5CjVXSClvul82qKPCDdvFgo4gcLhFM2CW1JiZRqb/pa3h72FNrmWMMpguzM
	UUEJFnTUIhOmNqaWdvZp8c0HBAXV9aaEaJbEoxfpJEdciX/FitzSqjxtEPsY2zvKUesP9efiB5T
	I967rXC9fhEQ==
X-Received: by 2002:a05:7300:fb94:b0:2ae:614a:3307 with SMTP id 5a478bee46e88-2b6fd7eee95mr2453605eec.42.1768948572147;
        Tue, 20 Jan 2026 14:36:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm21042996eec.32.2026.01.20.14.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:36:11 -0800 (PST)
Date: Wed, 21 Jan 2026 06:36:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXACRN7BaumIySp3@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_143613_351213_01FAF2A9 
X-CRM114-Status: GOOD (  22.21  )
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

On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> 
> Am i reading it correctly that RGMII delays are limited to these four
> values?
> 
> If so, please add this list to the DT binding.
> 

No, these value are just adjustment interval, and it is also
controlled by another code register, the final delay is calculated
by the following formula:

delay = delay_step * delay_code * 0.9;

So the delay configuration needs to be calculated instead of
directly assigned.

> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	int i;
> > +	int code, best_code = 0;
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +
> > +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> > +			/*
> > +			 * Note K3 require a specific factor for calculate
> > +			 * the delay, in this scenario it is 0.9. So the
> > +			 * formula is code * step / 10 * 0.9
> > +			 */
> > +			unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +				best_code = code;
> > +				best_delay = tmp;
> > +				best_config = i;
> > +			}
> > +		}
> > +	}
> 
> With the four values listed in DT, i would make this a straight match,
> not the nearest, and return -EINVAL otherwise.
> 
>     Andrew

Regards,
Inochi

