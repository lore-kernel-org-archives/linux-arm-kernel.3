Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC7EC1420
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFR/74Mhz6mqBNodIdVtj44myA0OpEyonX9RTs0IqEg=; b=Pf3ftExSIhDDUIpnW2q1H53e+n
	XA2CR0wUotcnF1GxyADCdkOJ3lkXnV9ld58RJoXprHw/GXW8kfbHEYWC39mcm0im+gBiNqF9oN1bI
	t8PKnsmabm5bxMifaU+lI625aq91y/t4pMZMKqAZJhDtBtLgEprDN4kSeyupopNqefT6Jg+5w96XV
	9bn5Z3L33rqd5UNhyTgPX1vzzDCmI7oJUNrewNeaMbOUK16SyyrGC6ALnrN68wSPap77s7C3f7chh
	LwuN6fgXtInxa4xH2AZ3r6faS3HHart4wosTKB9IcMQK8x5cizcBQmBhRC/jpd76KKn4iXG7y/Atr
	gWchKeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMvZ-0000000ExVx-0nLf;
	Tue, 03 Mar 2026 10:24:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMvW-0000000ExVW-3sl5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:24:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4082801f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772533469; x=1773138269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFR/74Mhz6mqBNodIdVtj44myA0OpEyonX9RTs0IqEg=;
        b=eorTjvULNJIo4kaVvcuf32l39tQwdXkrur4R8Hum1FBuG1W9iVQcav0G6OaXErDgAO
         O8dawPZ3+ytCrVCWOYEyZqQ6tkdUir06LBrFduNh204ijhSP27ljC3KDg4oI3SIczt/C
         njkFfUg15ADJAPEz9EdwvvawNOHPYqwWWcVTX+4bq6X20pw8pxoylML5WFgpz21wP0ul
         HXMtftRDsQvScTIf88Ve4iHjQwEY37f85o2ebQ+Abq2Zhu/4yxCLMlJ1vBdQGbJYkTjr
         AJrTVwgLNKiZpG/QQ4hmrhQ+1mGNHNuKm+qxbNcOe1yYdYpYsyarmrz+snrhLrohpWKJ
         1Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533469; x=1773138269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFR/74Mhz6mqBNodIdVtj44myA0OpEyonX9RTs0IqEg=;
        b=Y8U4Mpncfa5dzKJd6s5j4mcZqY0BtbfDamH+/MiuLmJ7u9UWwiXXwFsoiGIVP5sl2v
         kjyt1GLs24dNeYGv1qDMR1N3OJ84dymXQMRPQKdcdAb8XinWC1h/YVdIbONQAowfBTtr
         iBxx764bRaX7WM9AkP8bPhp/GUDJgFkLU2wlHI5xpIveqwwNESSQAwHNaaryeFICQWAN
         ML2rxbF754+o6HQ41HiiyJLsb4dc5At8plW8Cu+I4VJu4qpxLBkQfNzWngmzKhJJNpB5
         XNY/cHni3lF/UydzjKwWSdwCh8+cH/dFOhbEtimJr/dMEDgXH5Ypj8xKAvzgQYUGkmlg
         RcDw==
X-Forwarded-Encrypted: i=1; AJvYcCUWxoXvSY7A1Oq8A7huq1Ly1/N9mYghowZkF1wzj3fCpKXxN1ShA/l9f3CjKTHOK8GF2UyT+KHDRLTI4KK4L27z@lists.infradead.org
X-Gm-Message-State: AOJu0YycJO4ql1OC7y+UdG2u8ujIcgDknT+5dReip/tyStufH4veuTc9
	q9aHUfDVXBKwkaHj+4ybD7BYEKzZCUeUd0B7bDJgZyIZNLVQY7wDDiWD
X-Gm-Gg: ATEYQzwJOP7dZjfcDYTOW2lPUjQ+o3gUV8v5hiDGzJOOYu9oaryyC0xNkWsYotckvp2
	qzqxFCbMulTw0m/1tXFlWATtcEJ0sTHkCLKw7zlazcIhFHGP8pLvZLH5PbKgXPktLjssv62hOZq
	b+SykGI4PM9zNrDGQT0RCeLIqbZ/XrkQH6QP7Lmk6QDns2aBCULBtRzMSOU5YrwP/Q4YTrX7QGM
	4KTtAfYYQsZ5N352Zv1ekXVIKrjitKVN+EoGw9ARA/ALtZpIECpDETUZ6nXZDAqsRiv49Fm+yVl
	KR9fIiscD08SjTmlX0zETFy5TSGycr5l7ZyR2e/pl+gmpigPMJM+VP9XKGPTvteXZe+oLLDfCkL
	jlS5ZbwXPrVZKLyOzVX+z0ghw8FN26HZHN5vx+P7+SdjMsj/OXuVh5ak2NmNKqi5AP4SfUCytys
	KafLat2AdWFxlRPRMZPShspOgmBdCqf3wnM8VDS+uIQVSysvETAKKsvtJux/U8fPY+b7pIf59qf
	Bj+elNo8u1+xUf0anpqMZgIY0MEMHYk4oxXyPG4kbe5dQ==
X-Received: by 2002:a5d:5d02:0:b0:439:9312:4b6d with SMTP id ffacd0b85a97d-4399ddf87e8mr27796843f8f.20.1772533468743;
        Tue, 03 Mar 2026 02:24:28 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm35944065f8f.32.2026.03.03.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:24:28 -0800 (PST)
Date: Tue, 3 Mar 2026 11:24:25 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aaa22ecrKugDRM5u@Lord-Beerus.station>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
 <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
 <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
 <aaXCkswynHreRURk@Lord-Beerus.station>
 <aaYCq-H0NSuyjFJJ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaYCq-H0NSuyjFJJ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_022430_998947_59EBF4D6 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon, Mar 02, 2026 at 04:35:39PM -0500, Frank Li wrote:
> On Mon, Mar 02, 2026 at 06:02:10PM +0100, Stefano Radaelli wrote:
> > Hi Frank
> >
> > On Mon, Mar 02, 2026 at 11:30:10AM -0500, Frank Li wrote:
> > >
> > > dts part can't apply, please rebase.
> > >
> >
> > Thanks for the feedback.
> >
> > I rebased the series on top of the current mainline (Linux master tree) and
> > it applies cleanly on my side.
> >
> > Could you please let me know which specific tree/branch I should rebase
> > onto for the DTS changes? I will respin the series accordingly.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64
> 
> Frank
> >
> > Best regards,
> > Stefano

Thank you Frank,

I'm sending the new revision on top of that.

BR,
Stefano

