Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4927CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaQKGTXkVR3kYdLDQmwE5JedZ37UBA7jczYx+OJ6aog=; b=mth5IZhUWWvMIZ2vw2dOrUHdSc
	DaRY1Q4k9UGjJNlDUWwUWxMDEQukbIUoywcjZK3ShdOiocPQBMvFbzxlajFzjuVukWfzo66Soe78q
	aPIv0vaSDoafuvycxHAKZGDUflH5pvHMXhUO3Vv2LP1F18Qip/ewWJyngOoCgUVZd6sKMKhaKAHoe
	7oo1WReDg2P5HkOwtpAyUd4RuzBPrC4QnimPJDU3A2o0b5m0kSpEMdYd2bKOM1h1IpnVCjs2YQqur
	7iYlVdYng3YKPIBaTbzd01sBaEJVbneuxLP1b6DxNUjjZZmkPooYnumgWRioWp52GWcXpXfNXrSaQ
	KSJ+O1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYuP-00000002GS1-1zhy;
	Tue, 02 Sep 2025 21:51:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWKq-00000001YWk-0RM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 19:06:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-771fa8e4190so3884398b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839987; x=1757444787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaQKGTXkVR3kYdLDQmwE5JedZ37UBA7jczYx+OJ6aog=;
        b=W6mNVvAYJCkSHLHSlqSE0KL9vyiqc3gUQWIWtxoBugi9Nj37grJoiscNplJuxxteeT
         bLnj4lmH6k7KZKhrGv71kCOiie4n5tpbMKB+l93N2hecQO3G+7SO0BISZlrcgahMkHfa
         zXywBSv8FE7cMINLKVlCivYn/qv6wEaOajOQfyfn2ZSBBlOEeggE/2K9BldaYQ/p3Ooe
         6OKNkbRJp/L8O3w9jaeLjfV2vZ3YhaVUOBEanek4wf9qCOGbU+aKkxxX4ebLQOG2nxVe
         4yhIq3MV7vIuh9N+CDz9dy1eRWHubyGmbcP9viuua+iSxRduWG/I/RnhYT6GHPDAHW6s
         GYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839987; x=1757444787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQKGTXkVR3kYdLDQmwE5JedZ37UBA7jczYx+OJ6aog=;
        b=sxQ14nR6txdXHeHTgXiwfp40p2VzYsQdT5E7QNR/wFUX7wIznh5lvsb8Tb6umLm3bn
         /AurqfJTeCOnDFiAzvu6ULNEd3HGj/luuOPnnsOUSdYZHM9xGAv4woGBGY/VAtZ9XGtW
         egTH2RS86mC9AhORBe9nNhJ1cg8qYoETjtOFLmwh3PC5iuu6zYDcTJ6J7cwntg7BkagJ
         NzZf7VwBuqtEoMz3qBOtEkvMHQlyZcHE0yUQ0VDn5bNcn4jsdVuf5Dwr4XvQuX5s4ldH
         Lj4bGEVv3PhpvMd5Y53XoBFMTxPmqieZEwvD+gAJue9d0zXgymLHVeonYMPoJv4yqWot
         pjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyxlaP6LnJlgK7rLU0bXh0R08aOCg7vbdFLzwxADHR9gi94dMzOHjXjL6w5hxWyGuhLnYJ2YdB6lebiM2jGbwt@lists.infradead.org
X-Gm-Message-State: AOJu0YyYPqbm+l5mvjOO5/kBldyg2GB5PNxMgJOirtQWvTzs5WWXS2Wx
	Q7nnKu9CZhcx3hYgJnHfO7fayAF34uglDUhu5YW4dgIloSF6urIFq5pj
X-Gm-Gg: ASbGncusiBeJwy6+r8h5QvyPAhmAhfePnblCXzSq3hb47+m8mCDMWX7Uu5LPOw0810h
	spVU2UxyWCWCCG+Nw6Fk7DYdrS/GiXLPfaFwCr/amfynR0ualfps7aZ6Sdsci9Vflg/jRp8YpsJ
	w4B5x4tf9EpqT4cwjNZMmpN6l4Q8kVk/oVfFhfeYpi+y9ih3jOx4tKwUqGqLosmURLr6EV+NG2e
	sLWS261w7JgBXVy9mC2AeYd/qUayJXHho6Et0DgWYP9EiBWRClfNkQEKZVHDxEs2QEPQvFaXFTi
	Qy4/u00x6bALFwQ1SArzXFeYdTK+0hOOVAx13mN2sIk2w+ryYEIhjthOgRQzurOLM952vNqBglE
	TwX9iNBhA3Hf1ZeiyeDvz4DbJzttqWoEqjRQ=
X-Google-Smtp-Source: AGHT+IG1xuBoEV27s4xm16m66fmxKaYCj+mrkdQ1flkuz61fm4ED8TpcpYI7A026pH2YAjozHpIDAA==
X-Received: by 2002:a05:6a00:bd84:b0:771:edda:1b9c with SMTP id d2e1a72fcca58-7723e25de24mr17232403b3a.14.1756839987179;
        Tue, 02 Sep 2025 12:06:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm12639897b3a.79.2025.09.02.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:26 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:06:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
Message-ID: <5570e45f-5208-4d76-9ec7-351665193616@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_120628_141397_B1ECE5AC 
X-CRM114-Status: GOOD (  12.85  )
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

On Sat, Aug 30, 2025 at 12:18:59PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
> anymore and platform is so old, that there should be no out-of-tree
> users.  If such existed, they would have enough of time to object
> dropping Samsung S3C2410 SoC removal from the kernel (which did not
> happen).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

