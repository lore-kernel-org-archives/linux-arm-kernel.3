Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB8C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvIZQs5aIdeQIGe604/g6ihtAuOgYCCmz8WzaoFmYew=; b=SIP+3+lk0jzJiZCJT1rxap12mY
	wDjMpnhYUPXoQrzFWvjA8r1DoovxL9DeQUULxioShCDJvCncVXecS5uqFPqgzlowaLOV/dFuzG3/i
	RPJ+Bc0yN+9XImjYCW5JfAHFT7VW8/3pFCEHCnTyXS7tWRF7QB9dspRfJmDoML5QC3HL4VF73fbzu
	7MWO3g+T7g5rjMvXuFW0IZDW6woUKidZGEgTwgiW7NQrzFD/vZXXaxCbSVBKbmhKJsKkGx01aKYyD
	XhSPnZ2FASw8sEC97UoGF2z92P+iNdSWPFgagfI/TLOokepvPKzkYsiPom266U2dp/eEnEdV9Ou6k
	vEvzWGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5a4-00000006iys-1HWx;
	Thu, 06 Aug 2026 21:24:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5a2-00000006ixs-0Bce
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:24:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so34522485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786051485; x=1786656285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xvIZQs5aIdeQIGe604/g6ihtAuOgYCCmz8WzaoFmYew=;
        b=IBlpl0VeN/mQyuHTPhkTLsPUjqVKfBupd3NzIR3SjzKm1VXBL4nilqfu78Li6Tkwze
         wMB681bJyHqwhCFbriYPPqtgxUjoXCZOfjaQhtAEcGyvnwJLkp4lgZmESyxbiwWUjtl5
         T90e0+zqWODWeBG0wRupnwT1/v7AtZNYazjA/bonMXc9xQm+3RyPNg9cKKYMKVrBoXXv
         Ta3UW8yYEuIF+X3VVzSPfQyuS+8Tdim7pCaMM1Gfzhofs4frOpExwjnYkL4ZOE+igXgy
         wQNmOBStUhR4D4t+3zj1nZ0BQ8s4j6bQ/V7FsL9ZhiM3qrevSZhOQWXp50Eml84nrW1R
         ZtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786051485; x=1786656285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvIZQs5aIdeQIGe604/g6ihtAuOgYCCmz8WzaoFmYew=;
        b=Ud6ELCrjm8fU+DtDVpfwU5yZKCe3h665202eoBktsbGfcM1MO2Z5GJl6fawQiVe1DT
         EYTTyn5GtBdYeuH06DrstVli5LKWlYbupU7pzF0HPZ4rCM6eJvvF1PIB9QFfCnSGPcVM
         S+x5lbT+fkYfJGosJkk9aJ+qwL+wiwSOvqub4c1T2We6QmlB5C4/YNGFk6A8EH0gfmDj
         ztehL82hd8fHWfVOJBaaapRW+R4nO09wP92pUgivCr1xvRDVQoOM/HV+xA6VGyW1WmJA
         pAY7ERI557exXxI6Uyqlj8W+Ff3x8Ha+RzPPjbTOBXDzgMzq+kO+Jh5SsEbjxzXUdhUt
         IHpw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0mWhzFvvIrsttilfP2tLbuvELopqlY6OgZBMorhEtj8yfdbewGJdmh3w3DqZXg7aE1hO2PSnZCfJzbWH3BliJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7UcPQLdNYsuRhbjg5gV0w63iHQcAJsukItNpAARjOn4w34iYD
	1IXtQH37uB+ARzegXuhmrbJwFW2RGtKnV7hD61nwCxI4C6uNFi89pumF
X-Gm-Gg: AR+sD10bqqftNNgG4r0Whz32U+4dnyMTZt76rALb7OZNhcC4eH6cxw/VJJz83vjSi3m
	a/qcS8WiNW/Y73GsQg3FGtQJA+TblL/zdXmA/Xv0zRC8KKasFr40uvmr4qk9AZXRjVJb4eO7GPV
	4Evif2gxLycSiPUV3di9r3y+kiIb7bLJiVDb5s0BlqGyYbAGzC4aavVoItD1YyMLeDI3um3AXeN
	NrOcrLExjuurkRMYCPsUjamcDLbChKCdtAh8EtXENgR5Cxg2aa1fwcnZCWso1qhizI3thXovZMQ
	PdBFS3Ar/NZTFKytrduNlgATcCzQBSdMgznLAeJ++x09raXg6olvf085LYCoT7gsJmZleJD7f8v
	2F7PeioaXTg4u+LI0Loz9Lz76FWUK1unAVqAqY214Q6vqBMSzmQW72DVRV4khcasnslGPs1KSSJ
	cGmn18O7YnzM+l3vW5VS3l8MQzSaQq8IRSDcEgJvrhWvl10KASDF6YtKuCzQP8mz7DEw7asag3G
	g==
X-Received: by 2002:a17:903:2301:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d0ca7afc9fmr179070215ad.6.1786051485151;
        Thu, 06 Aug 2026 14:24:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbed969sm189185ad.54.2026.08.06.14.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:24:44 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:24:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog
Message-ID: <114ad2d9-322a-42e9-ac8e-6e6c7b451a27@roeck-us.net>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
 <20260804070351.1846165-2-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804070351.1846165-2-zychennvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_142446_086027_E8A4867A 
X-CRM114-Status: UNSURE (   8.97  )
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

On Tue, Aug 04, 2026 at 03:03:49PM +0800, Zi-Yu Chen wrote:
> Add device tree binding documentation for the watchdog timer (WDT)
> controller found on Nuvoton MA35D1 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>

Applied.

Thanks,
Guenter

