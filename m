Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC7DEC0461
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfdnRKMwt4rIrADe9QK97cFlPrIqJK1YbAhHvdHHa88=; b=rEli374x9NtPO/OyIarOcPCTjp
	5u9o3yvWhgYhzHUbF2fb26ITYFFElOai2sQw4VWT54vFSo8sduKCMHQKeVyKRZ/b2WCal/jDI6xei
	CIjqTrN84nu9+0gj2O2/daa9fFuaxYC85vhmwGTknUBksBWfROJ2q2XGf0V2Y3iAtCv4z7J/d/QF7
	9ONlyywaZaOJWJmjwiR70thWJ22fpa4SgmeKv6V022051XM5S5NE7p1IiGUQZCopVvBzag/jNq6XK
	qO9PatWYkBOSYKMcW9UF+9EP6euhOf5/HZXBC/4iZR9f/QN69gyjs54l6gQa8bhjJyIH1Mi1XF7d7
	TYRaOTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLpX-0000000EqbS-1isC;
	Tue, 03 Mar 2026 09:14:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLpV-0000000Eqao-0qaa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:14:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48372efa020so46845845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529251; x=1773134051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfdnRKMwt4rIrADe9QK97cFlPrIqJK1YbAhHvdHHa88=;
        b=UoIeIm47CurZXEiqk6LFsUN3uGinuQLUseoZGQizqu2eM+F+U9Yocxw5UFSQXIN8+Q
         gZaXdUIJ7dubZCEvGom1+fAu8mvWfzYtZVCxXiThArEXFR2byDdfVfV1E5gB/bKyICZv
         YbnbV5AxDGEi4O00LlywqONA4QXtAtsK9gYUgZbmOt/hKoEJ2fFAeu2e8T0ggq+iDymm
         5CPY2Pfan2ICy7bBR5TZRlFmf1Sc/pdSl2xb2JJtAfARYFQcmWySZC6S/JhdENtcPhRU
         gtUKSmcrPR+Fcalp01K1EjwCy2gM8cD42jKvj/z1jKeqbGBXOXnUc96R+Gv7OwNXxKWy
         wlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529251; x=1773134051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfdnRKMwt4rIrADe9QK97cFlPrIqJK1YbAhHvdHHa88=;
        b=oEAMR4NlguNOyzf3GsFeAKRlK8MHZ6g3Z7IL2B8GmidwULEglHxUlV65bTbxeKZEG/
         N8JWwCN85sGCv10F1y6e1O2EXs06oC8+n/oCnCyVuVvH1kRW+ARes9oWw3F769GjJYkw
         t+0E6JCSFBpq97SbqgT98KAWhYLgZAywp6SQ9ZHwx6f45OdV3FjxWRaRndgV0SL1ymxF
         XxDJJmpcPjKzoya6NKOtUagbjJ4f77oOoJEQUrHOLonSZLGsO4+zT3jQqARtmptwZYz9
         ev0bUEqi7OlToCCb9Pt6aHbWf0Wihy/L4zyPwcqqu44QSGnIZ4PrPdWEAI9Y7z9gE/E2
         7uNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVUAlrw8ZyeN0dvQDK7btEZtEZtMXwp0A1JRcY2Tm6j4n2i9jEXbnMGrvUjo6PcF4ea+ZOlYMptpZQMpuQh+yq@lists.infradead.org
X-Gm-Message-State: AOJu0YwFdYe1vEb6sD96elAKFVLCCbPGEiawkSSKi8o92kwSNUX3ydnu
	c6xEzxkTEgZFGQpbYifSZKAZyHZrE6CKHPmgW9Rar6LGNW196lbQ8M6H
X-Gm-Gg: ATEYQzwe4rZWc/w2Qx7eo0bXzJ3aYK67YP9N7Tv2QIvLSrUndmhOXmFntQL2PVKdzZn
	+pBqh86hWwvnkDAaswsiE+Q2Hauf4Ia8pFAhJwHJYDt6GPSj7qFKyivnrIJIfc4e4wQ69YQBGpq
	yTcHqGAbQH0RIsPzyx89OZX+hUORBZOfTQVjZPmxdjbH1caNsA0Uw+g0SPfjCqoLAAIrK5tFT/o
	1EyZWzTW0My+7WaBa8tpifM1+mlRIeEXnAD8zMyZcWsDF+U/SffGAu2OsGbOxhpssF7hY3zNnKY
	xHnct0GF5T2HGhaSFsepCTLbl7Ny7db2YAde075ob8K2LAWfdRcPoFFnIrVQxdRg23yszowR5ZG
	/Pt7tFgxYcyP4WaccrGeCISqq8t5yeK565k8K1Knhpkc32k/RqXCIbiwQOkpj5TqfiyqzDG0sAA
	nBOrIv1LYrrYbuF9lpOc5R9nY=
X-Received: by 2002:a05:600c:a16:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-483c9bfb2f2mr273658985e9.19.1772529250689;
        Tue, 03 Mar 2026 01:14:10 -0800 (PST)
Received: from eichest-laptop ([77.109.188.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7030b9sm376259165e9.4.2026.03.03.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:14:10 -0800 (PST)
Date: Tue, 3 Mar 2026 10:14:08 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last
 read
Message-ID: <aaamYByn9dZEIBWb@eichest-laptop>
References: <20260218150940.131354-1-eichest@gmail.com>
 <20260218150940.131354-3-eichest@gmail.com>
 <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
 <aZXq4gn4xhInQQlq@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZXq4gn4xhInQQlq@eichest-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_011413_245409_C969765D 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Feb 18, 2026 at 05:37:54PM +0100, Stefan Eichenberger wrote:
> Hi Frank,
> 
> On Wed, Feb 18, 2026 at 11:26:52AM -0500, Frank Li wrote:
> > On Wed, Feb 18, 2026 at 04:08:50PM +0100, Stefan Eichenberger wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >
> > > When reading from the I2DR register, right after releasing the bus by
> > > clearing MSTA and MTX, the I2C controller might still generate an
> > > additional clock cycle which can cause devices to misbehave. Ensure to
> > 
> > Do you means SCL have additional toggle? You capture waveform?
> > 
> 
> Yes exactly. We were able to capture the waveform when the issue
> happens. It doesn't always happen though, it depends on how much time
> passes between clearing MSTA and MTX and reading from I2DR.
> 
> If you want to see the waveform, I uploaded it to our server:
> https://share.toradex.com/dwnhcrl6b9toib6
> You can see the additional clock at the right end, after "0x17 + NAK".

Have you had a chance to look at the waveform? Do you have any concerns
about the proposed solution?

Best regards,
Stefan

