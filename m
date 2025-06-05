Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C33C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GuYrfRIt3NP/tsfwxH5PFscLlX5erdLhDtZ3+v8kg0=; b=AZyk3VxQ2x5eNvHwTVZ9Iv6tL3
	qtmA8IUqDSZr9vUDtcsBG3VvDog2DDx38jFdOGBpFz+BDSpSxHxaQVxSPq91klQFrDNTw1fXjaerT
	yAd3urFUgT7Qi5KDN0vqMX4CTllBAM4vOM8qPpHNM7tol23PZyIjUUrEUWSTXgSCVYyFxtsnpc+N/
	6W0sfCndR9/Nu2xFxYoqkMNtsGOZ7OTk1p2axDIHTxTzBAxZJlAenmqe6YnTrmzNoqDnAIl68CG97
	8zcSsnY/rn3lwddDHTLd+BGKDGTu8tR8GHTx0yN0Sa7y/3WKhQxKzYspfgIdHNDZNxD6uIox63kPG
	xW+jFQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCMv-0000000FshG-3pU1;
	Thu, 05 Jun 2025 15:19:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCJK-0000000Fs6A-1EMe;
	Thu, 05 Jun 2025 15:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749136492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ENI8hMjvEmJfVrQRZSFpDbyKHVOtvfZuTm5qF/vEk1X9P4OigUMMG7qLVI2qosebz8ddrxGGYzEZZiDtjkR/dCK0ZzXU3/xZFoNQI6xUCziEB0er4zPVxDzJaiJQt0t0dnHoGf0FOh/E7kyj9Lb841Ko3RteQbTAgBr7G0EjjoA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749136492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/GuYrfRIt3NP/tsfwxH5PFscLlX5erdLhDtZ3+v8kg0=; 
	b=CiS2fKxauqWUQMP1ejrx8adcDEkkl3oZ9DnqHwWhoP2htA9pVuSul4sJER3KjYov9/oJHH+vXa3rrpAceqawTxO200NM8svS0Pbuz5sYizX1xmOcNiZIW3eUU/NUpsLul3u+Q05GGFSkV1fBADbU+vzKAf4pLubew6rSiEdAO4Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749136492;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=/GuYrfRIt3NP/tsfwxH5PFscLlX5erdLhDtZ3+v8kg0=;
	b=e51u7eqbnLxwYY5yZzmLXXP5HnH4XLEy+59bYwU7yq79RAHad1ASKDdWUvA4NKtU
	WuBzAfplXeyVY87JQsYejDcYPp1lcBqOWM5b+r0qfTjEoxE3JGEyEtz3kpv7NbmYyMh
	S0FMhUYFU5gwxET6NfPaMpw+TuQSLF2t0mAg7jGE=
Received: by mx.zohomail.com with SMTPS id 1749136491036595.9387295759052;
	Thu, 5 Jun 2025 08:14:51 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
Date: Thu, 05 Jun 2025 17:14:46 +0200
Message-ID: <4244538.aeNJFYEL58@workhorse>
In-Reply-To: <DADLSAEF1YPO.V0CQK084KFFO@cknow.org>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
 <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
 <DADLSAEF1YPO.V0CQK084KFFO@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_081518_405421_C41ACAA2 
X-CRM114-Status: GOOD (  25.22  )
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

Hello Diederik,

On Wednesday, 4 June 2025 10:24:33 Central European Summer Time Diederik de Haas wrote:
> Hi Nicolas,
> 
> On Fri May 30, 2025 at 3:38 PM CEST, Nicolas Frattaroli wrote:
> > [...]
> > +	case ROCKCHIP_DDRTYPE_LPDDR5:
> > +		ddrmon_ver = readl_relaxed(dfi->regs);
> > +		if (ddrmon_ver < 0x40) {
> > +			*ctrl = DDRMON_CTRL_LPDDR5 | dfi->lp5_bank_mode;
> > +			*mask |= DDRMON_CTRL_LP5_BANK_MODE_MASK;
> > +			break;
> > +		}
> > +
> > +		/*
> > +		 * As it is unknown whether the unpleasant special case
> > +		 * behaviour used by the vendor kernel is needed for any
> > +		 * shipping hardware, ask users to report if they have
> > +		 * some of that hardware.
> > +		 */
> > +		dev_err(&dfi->edev->dev,
> > +			"unsupported DDRMON version 0x%04X, please let linux-rockchip know!\n",
> > +			ddrmon_ver);
> > +		return -EOPNOTSUPP;
> 
> I'm guessing you mean the linux-rockchip mailing list here? If so, I
> think it's better to make that explicit as 'Joe User' who may run into
> this issue may not be aware of that mailing list. The 'linux' and
> 'rockchip' name combo is used in quite a few places.

I agree it's ambiguous, the message as it is right now is the way it is
because we're not allowed to linebreak user-facing messages for grep-
ability and I also don't want to exceed 100 lines of width (though this
is the one case where we're allowed to).

I suppose I should just replace it with the e-mail address of the list.
That should be clear enough and this error message also won't end up in
random boot logs strewn across the internet if it really is just some
engineering sample hardware or similar that's affected.

Kind regards,
Nicolas Frattaroli

> 
> Cheers,
>   Diederik
> 
> > +	default:
> > +		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
> > +			dfi->ddr_type);
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
> >  {
> >  	void __iomem *dfi_regs = dfi->regs;
> >  	int i, ret = 0;
> > +	u32 ctrl;
> > +	u32 ctrl_mask;
> >  
> >  	mutex_lock(&dfi->mutex);
> >  
> > @@ -136,8 +186,11 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
> > <snip>
> 





