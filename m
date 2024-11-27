Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02E1D609CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=; b=qVk8J63nYeYheXyg75i3bAln6/
	0H9Eo8wgIXiYELFpLEVKS40Nh7HJBfXqnKYgwokuFBa545X+4TRLNJnsYdzXmqgR+EV5d1jDNzYBK
	ygMVOarf81uOucN9bjaAB1nUVFIm9PSN3RLUxtoZx+FoXgMeZ51duUEn/lBmg+pVLhwKFXH2zCGDr
	qy0znVf0tKCxQ9qdoMv3lYNeXuYpCMvKDRno889pJl4dLwn0gkfjV0OTBxNPnte6xutqIpi0M4dqS
	j1DSwxe2eOGyrOP2eFsMJQsYMm3BKQiMlkFVVWbUJQr+kFe564pNppMtt9lIe6c/z23ptVa5d1wAC
	aHbet/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFQU-0000000CsNO-0Pvd;
	Wed, 27 Nov 2024 10:37:42 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFKE-0000000Cr0c-41Oi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:31:15 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6ee994218d9so57855917b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732703474; x=1733308274; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=;
        b=S+RWn8GhCC+BfyRxXPmGhpT9jxBnHWw5dAkS+6fT1FaUKtz+oeDoDCT2zSgAGl1gDH
         7zxxhLyj/XD/oaCaRLNcNW+X+FOQ9VxZuSys8sU60R9xGWBHvdlfrKxodY0W+rvZRdSJ
         pS37ebG7Bea37Yk3NFHNDnL+FUzRX08xwFQKjwJXxTqY+F/UepAFpCztIqJEFdCgDhPS
         877Ntu55lHBBxVyCdiV/lyPBpdv/7glTT1nKofpl90fDYXaZIrtm3tRGFtrjObn3+vbi
         OdcOQ/BId5aCwSxMPaICVF8wUIeOqiUJRZdZCaynQFDiWp8A2FRNSaLcA/lOTdqe50Lc
         GVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703474; x=1733308274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=;
        b=UuxRxnBJt2MM3LeRAoHfo408iVsGodosMvaRvGLGgJvGc1NEp6jgmuKTyhB06yXuib
         Sluo835xUbz1Or86nPt7d8bBTuOTleO6jgcMZKzHN3TYQUnrP2RXqLJ0ZmN9e1hRvOg2
         SQNlo5kWBm9rOwEsQEqJAw1KLweV1EnvbJFG1hgIRjbtS22PeS0JSpvaQ2+vUt3+kBNM
         LkrnpyjKNTVyk6KIQFSSvHu9jGLPuhNB7JJwzScNmIPCZxWA5bDllQ2giM41XiuNIWoZ
         4itNWj1SdIrbOs26pysNIusQFyCRjyiBTAe7hlpatP0B1HgSKiaGQKkWm15sCxRIEKob
         CumA==
X-Forwarded-Encrypted: i=1; AJvYcCV9ScF5Pl3nYJmmw3GxTrQqj7N5sLQS42SLcDXQdcc3Q7hptqW0wgAJcsO0ygmddKCJh5XAD802jHNUTKcFB11v@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu5bj9THMz2UILDJ/M2HAXl744FXYqvZYbsNafglqAM/9U/koa
	lA1GwO056w1y3QD/4i7tv/l6rTrvrYpIt8Muarq7O50/DQcHP2tyhasMhBt9kp9km0FhWTgwhHC
	Q5JjCtUTr/bSzkD1LePt2VNbACMY=
X-Gm-Gg: ASbGnctAVwtPS1+ejyzsQXfyf9wRmp+sHry3DP1EmV+Thmbw2MpOSvgq5QUVqxM2BYH
	q62DXgtr1SYj7GRpfg+H8NEkpiW1Odz9N
X-Google-Smtp-Source: AGHT+IE4Rwjoqcf6g4WNVWN6SK2tYJNiVr4zxnFoZgSAN5swW6pmwHPwkZxnwv7KUL2OiNM5h7LYDp0/itheP1WTPd4=
X-Received: by 2002:a05:6902:dc9:b0:e30:7c38:668b with SMTP id
 3f1490d57ef6-e395b94b0b1mr1678379276.37.1732703473698; Wed, 27 Nov 2024
 02:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-3-c43c4cc6200d@gmail.com>
 <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
In-Reply-To: <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:31:02 +0100
Message-ID: <CAMT+MTQ40y0GoOHXp=UUR=79JBPUCt9DSihojZyBwcwgR5_O1Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: apple: Add touchbar digitizer nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023114_991886_A49CF4C1 
X-CRM114-Status: UNSURE (   7.50  )
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

On Wed, 27 Nov 2024 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +             touchbar0 = &touchbar0;
>
> Not used, drop.

Used by the bootloader to forward calibration data to the correct node.

