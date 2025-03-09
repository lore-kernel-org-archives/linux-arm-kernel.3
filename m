Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A6DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTWaiiNH+tBaZi6l7L8OTGx/gcOTL7htEY9OSZqeGPc=; b=f6BzQs6Qg17fFy9ZXu0QLoMUP1
	rkVi8TJM4/iXXU9yt+BZLiIT/FLQp6djPf78O+QrS9pAfjGNTF7Ovh5K9U+cVc91eypZesErWpQzT
	2zXn76TMZUFdSR1Ddc3Ge07r9rzDn7YJpTnnVbBB3FcsHQhh2baUGFMGHmBXWcqFJ7BCfAn+t9OLc
	1n2aaaVwEH4a7vzKZfi70qSgCJ3bfYaqHYD9tXqRQwp3SBNl/C0nq4ybKmgGJCY0TgAdISTcatstN
	LhwAxijwjIXqVzBpB8wDIPw2twjJNH0vqteBpwTyuqzXouVg/cFE0epY3f9jgJr9gNCsMLIMjveC9
	LfGJ0yCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trHy8-00000000gNa-1LyO;
	Sun, 09 Mar 2025 14:49:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trHwV-00000000g57-0nY1;
	Sun, 09 Mar 2025 14:47:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-390effd3e85so2989617f8f.0;
        Sun, 09 Mar 2025 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741531670; x=1742136470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTWaiiNH+tBaZi6l7L8OTGx/gcOTL7htEY9OSZqeGPc=;
        b=b0O43ABVprUIu/SgxG5uNj34ZLLWeLkE/puUuiLRcAZiYDe5lkuc2UZM165rPhqQui
         IhA8XCqn/k0vMmr9PDI9skNiyqzyWvPyBeRmHgElR1whD0aOCsZWS/qPzq6tiw07wmgH
         /rXpGwFxLHx/ShKNXvAxHLXaxE8ooKvAhVID41JGxkJKDcGqwwP3EQDpOxWyradvGtcy
         51mlgK6MPrr0OTVZPIHyH3KkkB6EXax7vjD3I0KPwFVw//acX4OcrjaX2TGtxB2E97nC
         GGddz9ZZljxXChQu96QR4Bgd8q8RvBTc1GCjjszxFczElR+4y041l5OS5A9q0GH8ogrC
         x8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741531670; x=1742136470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTWaiiNH+tBaZi6l7L8OTGx/gcOTL7htEY9OSZqeGPc=;
        b=nHGKKtP9U0dg5YV7WZZCa1cfRNWpNqKQnniERA/2MjWZNRzZuK+GtjaFASMNtzkxhs
         wjmo8Y8h9ByD2tZwPXV27Tp+hDLj0z7/Qoejm+2NL3wpelfgKmkyKMDT4JOyXq+kJHut
         nVpZxDqmDCDDQmMWkJHOqRsSAazQXcqZ5PVqV1gnTFE3PYIaw26bbFLxuBpOtiMZD/LX
         CGPBR7Hek5pRvgOLqysxgX/cDANXgjQKjbQLlIVRXh/qzFveQMm903UjgAaeu0x8keAU
         HMDVvTChwPJXC63GzW1BChGyR8TpNQcJorwwiiC4SuCQl6xhNCDYm+3KXui73k1acfRv
         OHZg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Rp1XG7dZd3VVC4LzMw1z2NM0+FpVMhtYE/bq5HXRSAFLFr5xySPjrAp11rQyS8gQVDTEEkojpiUD@lists.infradead.org, AJvYcCXST54kkzpIl+TbIcAHZFuoJmF7lK+//ySAVlsdbr69DfVycxXA4tJ8cX3c0jl5pJ/q7AkaT48vJ3WgTsK+gQbB@lists.infradead.org, AJvYcCXdY2cPfgrYlD8ajlEz1emHC5is/VlQEHNfnKeTz1D7NM7WhhUvD2dkmHInrTdvcffOsgFQXwq40X+mK9WgNRY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYJ8OM2c4aBooXyacdTmz9rVgxsmzQxOdh9AHOo8om3MQtes2B
	exGCmgMma3ctCOAM9t4depntAzb3nWA+IG14cPtViKYSOAku1VHedxDjJw==
X-Gm-Gg: ASbGncv+pxyYzrOizBajZdbS6ri3txy15qIAy7oTDMsUbPeWmTQQAPHacS2xKPdr3Xs
	zAu8uLXDOJFVqCKMkVuKX5NMFhPpKHk7htYnYUl8IkwmsvgUT7Kzes+v5RgUDsfc5TmJxqA2RUD
	GoqwWxLCVX7M7u25CEGNCrPAuoWnUkup2JBFUi2H9xq0wkzNQa9XwlWZrS61P+1M0ma/prbk/NW
	nflLu/WVX0umVQFoyHVRZmqIRFRRdmDObG1hB1beYhzByq5AdyxatqTYb5kWpq511Zr/E8DFnhi
	sZWzf3l0DfmpDlsAsA9l/k5esTxEz92+HNILpWzwuU6DEgChMG73xmc2e+EJ8KHkOkn2OgfXG25
	4TC3liJxCIMu3DxQ2MQ==
X-Google-Smtp-Source: AGHT+IEwJbPV09xk72LEbzQ8Myae9OExn7rbr2tBSURY8OV0I/uXz2TcorLmybD6DwsofI0FuPNHzw==
X-Received: by 2002:a5d:64ad:0:b0:38f:2a49:f6a5 with SMTP id ffacd0b85a97d-39132d4de7emr6923623f8f.15.1741531669489;
        Sun, 09 Mar 2025 07:47:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm12193398f8f.94.2025.03.09.07.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 07:47:48 -0700 (PDT)
Date: Sun, 9 Mar 2025 14:47:47 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, Sandor Yu
 <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/12] phy: rockchip: samsung-hdptx: Avoid Hz<->hHz
 unit conversion overhead
Message-ID: <20250309144747.744e5197@pumpkin>
In-Reply-To: <a1a3e86a-1906-4797-932d-8e1aadafedde@collabora.com>
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
	<20250308-phy-sam-hdptx-bpc-v5-7-35087287f9d1@collabora.com>
	<CAA8EJpoQbvFbNXQ2RB1qY2gHnwZaU-PT-DMLnZkrxkqs2wkXqQ@mail.gmail.com>
	<a1a3e86a-1906-4797-932d-8e1aadafedde@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_074751_245742_625195AD 
X-CRM114-Status: GOOD (  23.19  )
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

On Sun, 9 Mar 2025 12:13:32 +0200
Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:

> On 3/9/25 11:22 AM, Dmitry Baryshkov wrote:
> > On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:  
> >>
> >> The ropll_tmds_cfg table used to identify the configuration params for
> >> the supported rates expects the search key, i.e. bit_rate member of
> >> struct ropll_config, to be provided in hHz rather than Hz (1 hHz = 100
> >> Hz).  This requires multiple conversions between these units being
> >> performed at runtime.
> >>
> >> Improve implementation clarity and efficiency by consistently using the
> >> Hz unit throughout driver's internal data structures and functions.
> >> Also rename the rather misleading struct member.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 79 +++++++++++------------
> >>  1 file changed, 39 insertions(+), 40 deletions(-)
> >>
> >> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >> index 2bf525514c1991a1299265d12e1e85f66333c604..e58a01bdb3ce82d66acdcb02c06de2816288b574 100644
> >> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >> @@ -330,7 +330,7 @@ enum dp_link_rate {
> >>  };
> >>
> >>  struct ropll_config {
> >> -       u32 bit_rate;
> >> +       u32 rate;  
> > 
> > unsigned long long, please, to match the tmds_char_rate type.

Isn't 'bit_rate' more descriptive?
But maybe rate_hz to make the units more obvious.

If the max frequency might get near 4Gz then the you need something
bigger that u32 - which might it used hectaHz (a prefix that is pretty much only
used with areas of land!)
Being more explicit with u64 (rather than 'long long') may be better.
Certainly less typing.

	David



> >   
> >>         u8 pms_mdiv;
> >>         u8 pms_mdiv_afc;
> >>         u8 pms_pdiv;
> >> @@ -410,45 +410,45 @@ struct rk_hdptx_phy {
> >>  };
> >>
> >>  static const struct ropll_config ropll_tmds_cfg[] = {
> >> -       { 5940000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >> +       { 594000000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,  
> > 
> > Use ULL suffix
> >   
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 3712500, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >> +       { 371250000, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 2970000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >> +       { 297000000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1620000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
> >> +       { 162000000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
> >>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1856250, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >> +       { 185625000, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1540000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
> >> +       { 154000000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1485000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
> >> +       { 148500000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
> >>           0x10, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1462500, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
> >> +       { 146250000, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
> >>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1190000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
> >> +       { 119000000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
> >>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1065000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
> >> +       { 106500000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
> >>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 1080000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> >> +       { 108000000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> >>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 855000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
> >> +       { 85500000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 835000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
> >> +       { 83500000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 928125, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >> +       { 92812500, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 742500, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >> +       { 74250000, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
> >> +       { 65000000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
> >>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
> >> +       { 33750000, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
> >>           1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> >> +       { 40000000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> >>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 270000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> >> +       { 27000000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> >>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >> -       { 251750, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
> >> +       { 25175000, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
> >>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> >>  };
> >>
> >> @@ -894,10 +894,10 @@ static void rk_hdptx_phy_disable(struct rk_hdptx_phy *hdptx)
> >>         regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
> >>  }
> >>
> >> -static bool rk_hdptx_phy_clk_pll_calc(unsigned int data_rate,
> >> +static bool rk_hdptx_phy_clk_pll_calc(unsigned long rate,  
> > 
> > here and further, unsigned long long
> > Also, is it tmds_char_rate?  
> 
> Yes, will do the suggested changes in v6.
> 
> Thanks,
> Cristian
> 


