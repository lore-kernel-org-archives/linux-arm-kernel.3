Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629C5105F7BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGPit1GISWqr5Tp7ZscfP1p3dWxXhNTpfxNr4BRLST4=; b=Q6sgcA7VrLzB/oe4XaTE3cOuyp
	zL/y8kosYl1oRnzLHY+mbUq6nBO8RcuKjJrgboSOXoycaO+mMcOxfNtpMgNr7JV19vcmCjJDowzQl
	rtsZHiP4Igcv3UurT3ucjf2uOFSC/62/ndBt4SS5S6EfoLx29Gl3v2N30XpXlCp+rNeX8qLl5/nnb
	eZKByYHkIY6ACKcBjh9l9A/183A2E/FCm34sl7AX+mqga9v8BFN+yKtA4jHF/uPlC2h6Cb88GYciF
	Jx5wvECiQrNVeW1xwICXuNFEZBklEQF28OVS3zMU/WzEkAtwgBPGB5seJxMdAQtP3z2kADfpvXwU6
	cS+QK37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14qg-00000000ajx-3aGZ;
	Fri, 13 Mar 2026 15:54:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14qe-00000000ajB-0naZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:54:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so7657995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773417286; x=1774022086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGPit1GISWqr5Tp7ZscfP1p3dWxXhNTpfxNr4BRLST4=;
        b=H6yNumfTN0Ks8UOOzLVyT2WOti8BtsB8gfnFF7twxwUP7ISfj5fZiR7jsZib4v37Nd
         jFUg7BglAOsbR4lZ6v/HeaGXR44MbJ6v1TpJSMyoqOj70hokucS0GTbgveusaRgPnx2j
         L0Zz3sW13rsl6uSZ6OKkb3lls6Ri7QOgzlB0e7W/oLGKPXrkJHxnRC74mXzEcX11ts6G
         shkHuHiG9gD7uNTULA7Ztm4bWGR4HO+uebb9bicFICp8X1Efy28pLtTiv5DoNJePNCrb
         q1NZ33p3Kgty2CTdKUhT9XiTa3P9whxUKsrJHbLhZKw+KLoMCjKpVHC4+a29jVHCUBRB
         GA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417286; x=1774022086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGPit1GISWqr5Tp7ZscfP1p3dWxXhNTpfxNr4BRLST4=;
        b=K6uhg+8M3nR06ZyVb1J9fnAM0ybTdvSIrpt5hmefsLPWw4+s2i5Rx5iYUooS9GaGl3
         9pg4MsK5JVeZHVL0XKVy1/CKPIbsYXU+lSuKGEcBUZRxArXdIP8UhI0l7aeGFCRkGyBw
         2zNBve1CkGs+NXYgJN+c8zaCjOes1fahf+gPo8CKXZRpvzm3IRzpMda+dQHiY5z4ox8t
         CE2iyxK+9Adb39CsF3OlG2xATd2TCRp7l6y7RlNndiRVx+sk5Pne21ikBxQgCRpNIMrs
         Kygbb6gqZrmysgyi0eCHv23vWmq3VzehhdmiCjfVeRIeotkMzRHP6G48itgJ2RZQDNcI
         xRPg==
X-Forwarded-Encrypted: i=1; AJvYcCWkV5zMMmIEFEfS0v3MoNJ69KodfE6GHOLyzRRS9TIslaMt8ZeereomZX2VelLoTJ6hpovpH1BNSmhQm0IIfXuX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4UoCgBkxxMsvhiHP0Anv/AA2xxCRxt0uGFF77iKJKAHrUleXO
	eLlU9GPXI1vEd9HpzmRvkFVtF7NglOQLo5NQxXrCtEgToKJxt0oTirzz
X-Gm-Gg: ATEYQzzC232JwDEM8Ju6ghTweEYWceivWNLyK1K6UxlMUUvHu5iKOEUIMJr+M4EjnHx
	uoblay2G25WHrrO9PXicN/l6t9pcPBxTD8b2aCOFhmuUAP8SjAKQtA7bn4Bz3+UK+3ZnPvIujT5
	cis8whFbsmF5o5vufroBg5K00G44APm8ghj7jBzB8pVhIotim1MSMnsAdtiEm4hZPyU86/vgjXZ
	G0UyHczxUzxk8CZ75oKWQ9wnt1Dp3GFWyXfoXDtt3RrkJkmN6rqv2kvDcFLw7VnxHiWSVEyhdeM
	msiqgovF2SnVohWTIwnSAcY03s5sVhgyeBiZaJ4ZXQxFUaduwUgiBQqBbaNsT9uO0PVaM3Q/R5P
	Hq2IWu6sl9w1yhhqzP0MvpugGZqunN0XXwF/4QbWp3Zkq1slaSGDsZHh0Puau0IDh5mFlp8w/De
	fx25nDUzh5DfXVKwm0SjPQEGuPv/dHNcxw9UglnACc/2f8UkMKyOL7KMCmqrBJChM0sf1kdW1Da
	AFSa2DhQQ8jBGXovDbV57L3P78K/62VQ1LLO2B3+uswPQ==
X-Received: by 2002:a05:600c:c162:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-485566c94a6mr62238805e9.2.1773417285577;
        Fri, 13 Mar 2026 08:54:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855725572csm52482715e9.2.2026.03.13.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:54:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:54:42 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <abQzQnmG0Xh7wXjt@Lord-Beerus.station>
References: <cover.1772642881.git.stefano.r@variscite.com>
 <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085448_247309_4FDC35B9 
X-CRM114-Status: GOOD (  13.65  )
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

Hi Frank,

On Fri, Mar 13, 2026 at 11:13:35AM -0400, Frank Li wrote:
> 
> Can you rebase to my for-next tree
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next
> 
> And new file, run https://github.com/lznuaa/dt-format to keep node nice
> ordered.
> 

Sure, I will rebase the series on top of your for-next branch and send an
updated version.
If possible, it would be great if the series could be merged as soon as
possible, to avoid having to rebase it again on newer changes.

Regarding dt-format, I can run it, but in my experience it is a bit buggy.
It sometimes moves comments to completely unrelated locations and does not
always keep a logical ordering of nodes. For example, I saw cases where
usdhc3_wlan was moved before usdhc3_sleep, and pinctrl nodes were not kept
at the end of the file.

Best regards,
Stefano

