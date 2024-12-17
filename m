Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIbodpRWxqrrqRRUsCSmxdoYxLL2MHEZUJwlmjhZJMc=; b=WLuONOiZ0mMeqoo2x5W9DOxFzE
	Gk8s08k+yuXAR1Qi62Pj8tLw+lglShlIMP01UlEfJNBkoOpYKzTW0DXap4WeqwURkURy2eY/4bTf5
	OJufRnEPFnTxLQi1h3O/aS1nBcbjgE1ZcgOTy6WiDqcCWzCwppv9/nnl3TtGGha4bdsC/AEAlCS3e
	j95ejTmGUOYI+OZPKwlpsDYueBoEWmvrSyR2/eAHKAWVYhKxAOUs44zTv3HIVidjMjYnMwFJcW7Vq
	C1QiSmGJmEeVkThNw/hybML2ct64ssUFrDcXkhmqdgJPme36Ofdcj8/VoqpKAYD4vr1qH2fIiD2I7
	QQz+skAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZHk-0000000DugT-17EV;
	Tue, 17 Dec 2024 15:14:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGc-0000000DuOn-0IcM;
	Tue, 17 Dec 2024 15:13:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so6712965e9.3;
        Tue, 17 Dec 2024 07:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734448423; x=1735053223; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIbodpRWxqrrqRRUsCSmxdoYxLL2MHEZUJwlmjhZJMc=;
        b=Y2mtv7zrc93i1V6KKU9KtsCB6mGUJQyz2TZKlW3G+RL0TLTn9jgRGZoRMQ5fm3FN5M
         k48qofHeFLW+eznLj4roOROmRWq7x2ooIQeDHWDK2olxU+93ygBxS/85LFuRaAzfvaDx
         gIXKu9TdczU6bhEU8HTJQjn0KQTewNi/TFrs6V1OPFMc8XeaLNm+OtojZLCtJIRftrA/
         Cc5VGaRgHbuePpfR9GTiC55qYXlEoLP8dc7u6MWeURe/c3K/3qBjTpz2ty4Cbj45NcST
         xh1HO3Op5WDpwe+vC2UEgE6LkfpuhoOFKlALJyxb8XQm5QJBrt7QdYx9oS/kFfBay5hl
         FxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448423; x=1735053223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIbodpRWxqrrqRRUsCSmxdoYxLL2MHEZUJwlmjhZJMc=;
        b=gwGfyaSbladrA2hYgQpD82UHRYbkXOlDxee9+Y532fDKQjO9Zwy4pJR8BpJTz/y3um
         mzvsun5X1RL9Jd68ohvqglCHUVj2FvTEEcA8xHv5s594x5YBxnYW0URmqeeV9fm9KxRi
         yrlk+HALh3N5szAZ//pAjJt+onyxzKo47uFXI9JoA9G1uJK9MXfSGZj3grHJxITf6Qy/
         5vpczDMyZTKcCU+7QPa7dH7FqIm1uW/Zj11zNbrvp2p1rA34cuHF8k2tfs2JuWO9JoDw
         keF5zB5BZ8FrFqTja7TqCsjRj2lrV/8cFAuCsvwsodl1N7ywTGCCpEJf+VZqKqiXNrvl
         5fYw==
X-Forwarded-Encrypted: i=1; AJvYcCXOhDS9Xa31BTRix7t5UDRR+3QMS81uuCPlJl+IKofT8ZFCbxrXnDyFlw2izuDzklDs5EXO1n19/aQJ3Nyx4xZl@lists.infradead.org, AJvYcCXn5rjPpe23J7bDMKjLi7Irfw76A5+dkVqULeeEJqHAgtOiDdykjR9bbKygC/rd5GaGA3t+MM800qvSj0uecFg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJAZjdxoRTBA0m/CSIj2z7CCn+Lzco2tNWQM0oJ9ZPV6fJZ5y0
	p5wtspxVFiHzUVMoD187iD7LTnaiNbmxFHiGmF1dfYhC7w0Mll8jLR1fWnFK
X-Gm-Gg: ASbGncsLvFSOu7A0SSLmhqS0nGtA12gr7SPv4WQ0YPIOL2zmAnLTELkNfSnTLcYVYPD
	u9Cq837zCRrQUV7jOIInuz/aWkIX/yBA5hTmRvYDyQ+kLOuKyJv3+y7N0Ru6FdZ9V3TzFbhmbNq
	QDKEDMx+kObgkgGLxQ9PotT6VaC5WGi+oIN1iRHVm61zBRb375Fpf9/NQLNAHI+8Jmd9oqTjU0/
	2J82DVZge+K34OzmY/Wa12AKF0pfwdF9N5m2/mnwa59
X-Google-Smtp-Source: AGHT+IHLcu6qj3H5z8Rh0t1dPSXaYp5zGOT8WvycKhg3dUOqzNjj52VHTli51/q2/uIIlYifEe4k4Q==
X-Received: by 2002:a05:600c:4fc5:b0:434:ff85:dd77 with SMTP id 5b1f17b1804b1-4362aa3a62dmr56863795e9.3.1734448423285;
        Tue, 17 Dec 2024 07:13:43 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362c7d59sm119484895e9.43.2024.12.17.07.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 07:13:42 -0800 (PST)
Date: Tue, 17 Dec 2024 17:13:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241217151339.gjpdkfbechdjohza@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241210211529.osgzd54flq646bcr@skbuf>
 <6758c174.050a0220.52a35.06bc@mx.google.com>
 <20241210234803.pzm7fxrve4dastth@skbuf>
 <675da041.050a0220.a8e65.af0e@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675da041.050a0220.a8e65.af0e@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071346_110350_44DAEE42 
X-CRM114-Status: GOOD (  11.49  )
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

On Sat, Dec 14, 2024 at 04:11:54PM +0100, Christian Marangi wrote:
> We can see that:
> - as suggested regmap doesn't cause any performance penality. It does
>   even produce better result.
> - the read/set/restore implementation gives worse performance.
> 
> So I guess I will follow the path of regmap + cache page. What do you
> think?

I'm not seeing results with the "times" variable changed, but in
general, I guess the "switch regmap + page" and "switch regmap + phy
regmap" will remain neck and neck in terms of performance, surpassing
the "switch regmap restore" techniques more and more as "times"
increases. So going with a PHY regmap probably sounds good.

