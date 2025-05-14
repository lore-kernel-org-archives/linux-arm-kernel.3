Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91592C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Tc/4nqMXEbm8d6EyQQLonLFnqiRqlfA73rzExd6DXQ=; b=bAMBh/kcF/RpLCDzVdtejftwd8
	umFxoj5hk0pd5USjvzCPicaCv0TBDE2W3/vDl6fOvJbvMmgMtZdxfqdWLJNSmWJJAr8MGoQJ51qxa
	mWj8JBEKnQgiZnQQeLOvjCi4OzMdQ857jf19vzz+Kp+zWc66xDiEPICjL7prKcpXMdgUJAXF/sEty
	OrccbGLwn2Ee1tD9gGiZ33Q6E++ARSTYdrJMFTTwr+CJNGHcwVqmiB/KTH8G5pG1jwuRssXpeEtVL
	Cvm8KiVGo4Xcs/FXOcInz3Z3/UUxSTUqjMxq8q3kLgIwSDhX/yGWt8v6zvsk/MP8HzKz8Z6V/FCiR
	d91bTKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDt5-0000000FZ02-04fR;
	Wed, 14 May 2025 15:19:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFByO-0000000FBKq-2skr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:16:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso47966775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747228594; x=1747833394; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Tc/4nqMXEbm8d6EyQQLonLFnqiRqlfA73rzExd6DXQ=;
        b=fiDBvU7c/sVImeDgIwN//AyaOxChhRQ/mx503HT3GWKDnYE0x/hnUvgLlxAqG4I8Ea
         nKPzG04cmMkzFmxkKKWGadXQMGiD+P2izm9mPQvBvi75UxOS31819HeoRuKdyj/eljzt
         k43poarmNHs3DKovyeWnJxuK5cfSZTKqknagzqwM+uYUf04Gzjqm7a9ZQwZZ/tfqzV2e
         GSYlPabLihihni4F4q2dbu42WCBEjzi4WfW3eaBG6sj7q9ntFxvMoxeHhJhdXTrWTNv0
         qxKDLvmR32cVpEsKSUHyvkxMVoW5EKmvcWikqvsVpEmb2f4QXykzGsbPR41z+NE/zEAc
         wCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228594; x=1747833394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Tc/4nqMXEbm8d6EyQQLonLFnqiRqlfA73rzExd6DXQ=;
        b=cECs2v9L45fXfnxzf9bierGThI/u8IIOV7tPzl6+M9bxj7AchGzRxbHXw/A3bbM43i
         677RyyWGtUJ6LK3Oxtp4GYpcYT27vOr6IUfRlBPiyZus+8baTPj9Pw9KlC0FKNVPNfJu
         Wpnaqfis/7YzAVaLYoeOHsiQeAKZDuoi75AawxwtQPphjjM9pYOOMc67QPPgquXDEJpg
         Ltt3RicHUMtNoB+9c5nCQ/MQeGTCFJwFYoekqvArJePbyrfTI4AVtO6cWRlJ7+A9Fe54
         khOD5d3Q9MNDe6ZjLxTc8j843zmpoDYyE1O6tlASFfelxvU3XaK89xHsjGJBafhIXfqe
         BKmg==
X-Forwarded-Encrypted: i=1; AJvYcCWv9toXsXzbJYvNuNoIxUDHtr4oZBoKNpjzhC/W5as5BfidEUofeYr1EHtVYiItYIOUOMlrljB/dwkXbyYRKdFX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4eVWmv4uH/3sIW8ulr6F7DKOTBh6bCexY6/o9yYi6VZHQbAUp
	VQ2Qe8eUFI7MKHIj8ntmhm8VSF5CHe8WgayedIzcfTpfjerk/886
X-Gm-Gg: ASbGnctwi/7g6/IV8nBSH1CZflnJcDkps2xMIaPknlaHrdTG03MWO03FsYDfZTsmv3l
	NnxlDqxThpxc4qFt5rhpp3V965Bjfz8XdgZXOLvr12aEEsGk3B3LUpecVw7M2W6PjESaOSauvlV
	SrC3RE3pA4RaIdjYEcPK13rCc0r3UKt+z7rWYlmR+35L5N9IEFO0y1fPE3rbU8kqfDdG2PBCaL7
	pAOZx2dxO6c7hU1kDmltLIAn60JjSg13/xAnoyDZsQWKBmV0PWOLyQTpuDvSbcnkm0QmHLas8Cn
	wMU3EaatExki9uie/qFNQf04MQqoB2hoa0bzxK+SxE3uUY2fzds=
X-Google-Smtp-Source: AGHT+IE8pnOYRJ/c4cfBs063yTkYwwC4PzsQ7cS9MN+l+gs9yIacFQxXiJfgdSPWX+aNftsTNP45Cw==
X-Received: by 2002:a05:600c:524c:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442f215f1cbmr26898775e9.24.1747228594244;
        Wed, 14 May 2025 06:16:34 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3979275sm30575305e9.34.2025.05.14.06.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:16:33 -0700 (PDT)
Date: Wed, 14 May 2025 15:16:31 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chanwoo Choi <chanwoo@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <aCSXr-Hdisg-7jEd@Red>
References: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_061636_724334_29A82E1E 
X-CRM114-Status: GOOD (  10.82  )
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

Le Tue, May 13, 2025 at 10:39:02PM +0200, Uwe Kleine-König a écrit :
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-on: sun8i-a33-olinuxino

Thanks
Regards

