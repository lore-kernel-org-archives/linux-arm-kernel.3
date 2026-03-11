Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207691125875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=; b=V0+/Oj4NiPBhTl+DV2dxvp3vYy
	JHrwhcM6WLQge1W+v9UcBHuWjfL2b1oXxcW25GRKYR7dSAVn1tBg8v/7PYAnpJgy1YAY+qPy2x6su
	Y6JxKo5IlW6y49kGNTPzDgrFuP9qUews9cpoRs2b4vQlw1qFZZa9kxRFAEsOCGR4HZAFM/F+Hj9fJ
	Q6e2fanbnd1/97FmtegKb5l0giI7gdJpN1i2uOIybn7+a/fcvPo3JYBP+3t1pdt0zhZg4IDJhyes/
	uFtH0sRj5EEc8HHK8TBkVFou3CyIEJdhBp4LiVZBe97MOHoVQZHJDDsTOsS+M+gC7Plf/A7dkRjf4
	dW9FWbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PUN-0000000CO8G-1s2f;
	Wed, 11 Mar 2026 19:45:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PUK-0000000CO63-1Y30
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
	b=fB4ugZKSpwUpx45R1na9WzcJG03r/q3fzjvtYxP4Xp7BMFKrqYOYcfWZN1igzbhOeFmoHz
	A3f2gTaZXOzk7xP0hR+dmy9WvhluRUQb15h2l+qrpYXXnEPgaCm2QoHgMZo3YIbilmFX6x
	erD4uiXW1jvC5lWswjUr9ktZqH9sCQU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-5dUJWSlFNhiw1zHEppYfaw-1; Wed, 11 Mar 2026 15:44:56 -0400
X-MC-Unique: 5dUJWSlFNhiw1zHEppYfaw-1
X-Mimecast-MFC-AGG-ID: 5dUJWSlFNhiw1zHEppYfaw_1773258295
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d73a9553bfso3407793a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 12:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773258295; x=1773863095;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
        b=CfSFrQXckfhU9/fwmGwsukouzs7+VZLugfu+ihxQJW++cBpf39yQH89+a2c4DYg0El
         O+NiPZttVBDaXoIv8hmf2JCkha2kHnME+P7HbM/gM1A4TQZcG9THSlU07KpolUzDwhKB
         2jInPLb+v5zrAxnBFZ+/Pl95e5F6XxQeWeP8kH0cyGaHWp2oMBVvreLs2gn22+mvfwuT
         4kThLvjgsyb0Q2fvJiq0CZaIWSC2t8kMo8Vcj+cwzY0o58VeIoCk6cRG0aDGqdfVb3s8
         uNElhnBzJSTSdVYPveCnf5NhpPsx+Rob/xrGJpj4+lrL8WshagrpZ4HNBRFw0N8rB1Oq
         mYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6DwOof9bONZvEX2HM9xkfYX9VynG5X0NMJXsK0/PuV4KIjaQ2xfq5jOPwOskTEqg7k2HfMB+ZFzfjzQqNAWFw@lists.infradead.org
X-Gm-Message-State: AOJu0YzgBUmcMPoXKWaCUwhfpGMfAqHWiErbYw2UcAaln9s8mr+NpJSA
	BAkO4X4xA3dYK1yIxB6hospTrkwDNB01vDJ6JFVq9tZZF6p0nRlp1D8kKW3WvYNJyfaR+juB3kl
	vWvskKAqnOj+9ro+BoE/U8xvJlucyxrY8okWqlXG2jyAImW1ydUqDd6S3ukbyobuSBYuu35sQ8N
	Rb
X-Gm-Gg: ATEYQzyJ92ivtzjcNu+vl6sS6TuLVr2zWv5ZAYssnmWBDCaVAW1AyTHRaA+fDoOBg/m
	JqxjPIr7nA7WWiLUYPCKAQpoOtoyZ+6QQswlcd4ziHeW61V2MWQMMx2KZvAhlg5YgEzRokxQZB3
	uIi2RZO0oGhZFkE4P0FnBCSavW4mMxkV9JZ49amrKhqFf3mnAUhOLNZ4InNzwsUP/rJlvN9agwb
	23fB454ZuKLF5p1vlIFRhWKMGmU1E+EqdmmxBbRvQ0wE8Y/g7sPZjtPr3H6ag+Z850Rwye46zmM
	hkqn/CY/u5nqj8rDol4ccvmdJDdptOniV6MSi4W2c+6DC3EL0MFfjDLAWYrM57unDl+tvCdL5OG
	ud3ZKBkDwcpJzzS10tOce
X-Received: by 2002:a05:6820:468b:b0:67a:47b:5a1a with SMTP id 006d021491bc7-67bc8a92d45mr2060520eaf.65.1773258295394;
        Wed, 11 Mar 2026 12:44:55 -0700 (PDT)
X-Received: by 2002:a05:6820:468b:b0:67a:47b:5a1a with SMTP id 006d021491bc7-67bc8a92d45mr2060493eaf.65.1773258294899;
        Wed, 11 Mar 2026 12:44:54 -0700 (PDT)
Received: from redhat.com ([2600:382:7704:370d:c6a3:6b0f:aa31:6ca2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc8efb85esm1894481eaf.1.2026.03.11.12.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:44:54 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:44:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] clk: airoha: Add econet EN751221 clock/reset
 support to en7523-scu
Message-ID: <abHGMgGCyPh1G5jC@redhat.com>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-3-cjd@cjdns.fr>
 <abF-qFC1Oa4dz-fh@redhat.com>
 <de6e8440-99a1-4be7-80aa-3645fdb0bdb9@cjdns.fr>
MIME-Version: 1.0
In-Reply-To: <de6e8440-99a1-4be7-80aa-3645fdb0bdb9@cjdns.fr>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -O_iDarOUXenA335bNVzeHHpG94rogXjAIeVvvl4mTM_1773258295
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_124500_822957_8C163C0E 
X-CRM114-Status: GOOD (  34.81  )
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

On Wed, Mar 11, 2026 at 06:12:59PM +0100, Caleb James DeLisle wrote:
> Hello Brian,
> 
> Thank you for taking the time!
> 
> 
> On 11/03/2026 15:39, Brian Masney wrote:
> > Hi Caleb,
> > 
> > On Mon, Mar 09, 2026 at 01:18:12PM +0000, Caleb James DeLisle wrote:
> > > EcoNet EN751221 clock/reset driver is significantly similar to the
> > > EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> > > divider registers so there are fewer known clocks, and the frequency of
> > > each clock is derived differently. This clock driver will probably work
> > > correctly on EN751627, EN7528, and EN7580.
> > > 
> > > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
> > >   {
> > > @@ -604,7 +703,8 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> > >   	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> > >   	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
> > > -				     ARRAY_SIZE(en7523_rst_map));
> > > +				     ARRAY_SIZE(en7523_rst_map),
> > > +				     en7581_rst_ofs);
> > I assume the mix of en7523 and en7581 is ok here?
> 
> 
> Correct, en7581 came first, then when en7523 was added they reused the
> function. I'm only changing the offsets to be passed in because en751221 has
> more reset registers so different offset table than the others.

Sounds good. I just wanted to confirm.

> > > +	else
> > > +		clk_data->hws[key] = hw;
> > Should the error code be returned here? I know the function has try in
> > it's name, however if this fails, then it still registers it.
> 
> 
> This function follows the general pattern of en7581_register_clocks(). If a
> clock can't be registered, leave clk_data->hws[key] as NULL, log, and
> continue. There's only two possible reasons for failing, if
> clk_hw_register_fixed_rate() fails then it's not registered because it
> failed. If key >= EN751221_MAX_CLKS, it does register but I'll fix this so
> it's checking that before clk_hw_register_fixed_rate().

I see that Stephen picked up this driver in 2022 with that behavior. I'm
fine with it if he is.

> > > +	/* BUS */
> > > +	rate = FIELD_GET(EN751221_REG_BUS_MASK,
> > > +			 readl(np_base + EN751221_REG_BUS));
> > > +	rate *= 1000000;
> > > +	en751221_try_register_clk(dev, EN751221_CLK_BUS, clk_data, "bus",
> > > +				  rate);
> > > +
> > > +	/* CPU */
> > > +	en751221_try_register_clk(dev, EN751221_CLK_CPU, clk_data, "cpu",
> > > +				  rate * 4);
> > > +
> > > +	/* HPT */
> > > +	switch (hid) {
> > > +	case HIR_EN751221:
> > > +	case HIR_EN751627:
> > > +	case HIR_EN7526C:
> > > +	case HIR_EN7580:
> > > +	case HIR_EN7528:
> > > +		rate = 200000000;
> > > +		break;
> > > +	case HIR_MT7505:
> > > +		rate = 100000000;
> > > +		break;
> > > +	case HIR_MT751020:
> > > +		rate = 800000000 / 3;
> > > +		break;
> > > +	default:
> > > +		rate = 250000000;
> > Should a warning be logged here or in get_hw_id() above? hid can be set
> > to HIR_UNKNOWN here.
> 
> Now that I'm looking at this again, I'm starting to think it might be better
> to just remove it and use a fixed-clock in the DT. I wrote it aiming for
> completeness, but this particular clock has so much code supporting it, I'm
> feeling like it just doesn't make any sense.
> 
> Let me know if you have a feeling on this because I'm swaying in the
> direction of just re-sending with it removed.

That makes sense to me.

Brian


