Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9F1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSQoOeRNMREqljX6P5aowkBRrtgKoOCHtii1nkE3DDU=; b=T/xmySutzYBYYXb0TjPdr24A4R
	eDdizyaO5WA07cG/HwLWo4cHPPsLlPDe+p0ogsmtfZj2B99qb3Zof8+r+K0wb49S4NueJRBA2Zx5b
	+9UvJ0CVSzSlkDl7lBzB7/b4orFOl60N5PL/kz0R6MIGxr4vZMIV1Iex9TssSrFJr+Hq73KUTricz
	s+NITYC2twKzdPq4wIX8neZqSwUkF3MGA2Q7Y1YZ6qzEUyVYT5Eh84KFsPqAO7nD8IsY4RRfZdcTI
	znUTTNl9k5gccvOqZpPqhbrApJtEu4VeMjv15lqRiJqTGHMVdNoqoz7bBKUw8iqm8KqnMuWLXdsDP
	NYj1/CoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNN0-00000004VTk-1oZF;
	Fri, 21 Feb 2025 07:22:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNKm-00000004UwA-1fma;
	Fri, 21 Feb 2025 07:20:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f73e6ed7fso73683f8f.0;
        Thu, 20 Feb 2025 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740122426; x=1740727226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zSQoOeRNMREqljX6P5aowkBRrtgKoOCHtii1nkE3DDU=;
        b=PAECKUlaPXkbHI816H2wV/g7i+xgLFXfJS9SDGrzCtsZpafu95Y6a5OMub+ixfMa3z
         LwXLmbIYTK94DD1WzUxqAEWk0uPQyvXyDvkkByXyICvV6nBjY47og0U8Q4Di/y7ymT6Z
         TSbJpnxHNApSWEF8SwVJhm7KAX6ZhGaFpE4WBpJqZvpYHyls3B84At0zPskDYNwYs/7a
         TwPKwrt9mtrPoW8hKFH74KKwzozjhFZ2FxfVkzavBppOHWSkxNImI2K0RWB+/jILz3Ny
         LdLMJanmuHaiHruiR2t2ZB2gFi11RzRhShud9pNMFI7OQ9HVS34lHBYmdKsNswUV6ifA
         5OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740122426; x=1740727226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSQoOeRNMREqljX6P5aowkBRrtgKoOCHtii1nkE3DDU=;
        b=GQQL2POC2zhgUU/nXjQKJF8fYh+4XUu616Ynk+o0vFI6CXgoAMGzHiYzX7yB6C9ucK
         5PuGBJ/RR+nWJ2ZhNWw6FZjIUAoy9W7H08XbjOqMQmlR/H2oFSmV8vDIsYOcH88K+kap
         6JIB4zDE5mrBCfpDIWlL56yK32aFi+SEy2td2FbUiawx3h4isQx8tunUIRC8wg9fEICu
         2e33HjqTSxl9mpVU8qyw4OnGcvWh8ubYpwSLFrDHPagoWXdOvcXqwW8WOd6wFsp4HGog
         VIdZMoUyobszeym0jipjbuXvkLGn1Vt4PKKwyhKOLmQvvhjfKV4dqO38dnvJHdza7wcy
         yfrA==
X-Forwarded-Encrypted: i=1; AJvYcCVBYWm/ffoCqpM9SQssT5UZoIu3rzniOTljkrDPOwhoOq+r8sxUf0RLqKn+Az2yUUewj5TBrGbwO2fKyD72gth0@lists.infradead.org, AJvYcCViAFz/YU0uABRV3whiVZbdnMRoMJFyw/KBz8c7hHDkOR2Uw8IPZ2Q8B24FwbmhieUIz3W7Py/hbQPDk1qVax4=@lists.infradead.org
X-Gm-Message-State: AOJu0YznMSfmeH0I0ZS4e6aIRYYGfTjP9J0Eiq2iaS//JUdPN88AWrt2
	gqJf1AMEm7cSr4RVyZ3aXx1gb7hkPfRjG4Iy2CtczoPEC1LMDDj9
X-Gm-Gg: ASbGncv0PkUf31zpJiW8ng6NvB75ExFas+6nPfLgMwDm2p8UdxDdLy4Pu0MnyZXcN/9
	qtrcLMz+K3yQGX1tcW7cE9JxIigpjeLAjRhJPdkHzkleF6tkxOFzuvppCeXfvZ8HaxX7ly5ka8W
	5Ucn5pHFIcqH2diglJdL0BLAFQBjeqJMAphazzy5jxzN2bGPM8QSdI4qsSA1a0pIL1W+B9S5G1S
	SfLaLOOk7jSC1BZjOBTx64fn/nooCacUwXd4bzrTvf7TGdTHawKkXgjRP5qve7Inn+kur1LfvTr
	48uxqCYgrna5WS7TTs3ndcFwn58mUGaeHxNjhfL2hM4RzMo8y7OJAs21s1L1CRsVqyGSyiWkHI0
	BBjzGTCkGGwCeuBsT7CtlOIPKk9zXsZzbrMLS8L4h2h8MUzOhvL9GPE1Np5huK7XRDxkTzS8z5x
	XUELK03aUn+C8eXac=
X-Google-Smtp-Source: AGHT+IGeC5GBablq0AQrNpEx1BwFRc5eBCiJJC6ceaihfvgRqpFraNQ0ARF3K84jFym+xzSGuzhxZw==
X-Received: by 2002:a5d:47ac:0:b0:38f:516b:5429 with SMTP id ffacd0b85a97d-38f6e96738amr2062366f8f.25.1740122426123;
        Thu, 20 Feb 2025 23:20:26 -0800 (PST)
Received: from ?IPV6:2a02:3100:b29e:900:acd2:27f9:86ef:d768? (dynamic-2a02-3100-b29e-0900-acd2-27f9-86ef-d768.310.pool.telefonica.de. [2a02:3100:b29e:900:acd2:27f9:86ef:d768])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f258ddbb2sm22195014f8f.40.2025.02.20.23.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 23:20:24 -0800 (PST)
Message-ID: <944941ec-d897-4306-9cd8-e39de833749c@gmail.com>
Date: Fri, 21 Feb 2025 08:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
 <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_232028_442935_4CE5B325 
X-CRM114-Status: GOOD (  15.25  )
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

On 21.02.2025 02:56, Andrew Lunn wrote:
> On Wed, Feb 19, 2025 at 10:03:50PM +0100, Heiner Kallweit wrote:
>> Move PHY package related inline functions from phy.h to phy_package.c.
>> While doing so remove locked versions phy_package_read() and
>> phy_package_write() which have no user.
> 
> What combination of builtin and modules have you tried? Code like this
> is often in the header because we get linker errors in some
> configurations. It might be worth checking the versions of the
> original patches from Christian to see if there was such issues.
> 
The PHY package functions are used by PHY drivers only, all of them
have a Kconfig dependency on PHYLIB. I don't see a scenario where we
could have the problem you're mentioning. But right, the PHY package
function declarations are a candidate for a new header file not to
be used outside drivers/net/phy.

> 	Andrew
Heiner

