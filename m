Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C5C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LzTcO/m9tkAD8Gqe/zjzIYRZPiIiP4NraWiu1v8c0Q=; b=nLYxBL8oNmtVIN6ZWK8Ct2dTzR
	wmOjVHsHdbkQfcSKBnpDhBP5P5s6Les5kFgUf87cXeMCtXzKHYS6VX4tWb9g0+inmk4tAd+xfQ7VL
	f2uSV+f/RM4X5Tt8l0O1bcTTmIhvwnLQbiJpZDKJjQZ5i0Tc7/38H2G63/IpllLPIuuXo25DX/V8O
	77XJ3yJxeO1Re0vG7NoCZQiP8/RfA1nlBM8vA1Khq6xnznDjeGvOfAAQwGKrFYTLJYcdP/9rTf+sx
	otd68LyfkiuDSmYzsuwa2DdxAOIsnA3AxVOah/r8F/7sWEeBXfJTv7zGhkb9Xo3JDjTqqNi4YtTcU
	H8rEh5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEpB-00000002QCQ-05We;
	Mon, 30 Jun 2025 13:45:33 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEZq-00000002NZ4-3l5U;
	Mon, 30 Jun 2025 13:29:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2680494b3a.2;
        Mon, 30 Jun 2025 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751290182; x=1751894982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LzTcO/m9tkAD8Gqe/zjzIYRZPiIiP4NraWiu1v8c0Q=;
        b=loU/FGPqTc9z+Wq5tFMLhd5di4asD4VsHx39tU2raKrAM0K+5yKm7T18Fa7/lSXSpu
         ZbaqK4Dv3AS7rIpxWqJHhqI/FSgxWJnHCXv3teBGAZboDN9ggxv39T0BolmDBXqcB0MG
         vOdktUY3kt/xuRMr3wq8rBwjooysyu007sgAnaG5w8Tz3fCVq9pmKzNAJZpyd36b2usu
         yVSfWtnUguKQw1BvnnH04jUfHP/+FklMpyCEXAAUpUR0NgHnZs6vwzjUVDpk7Kuoi+MS
         l9vHph/Ed7eAKfSzYRFmaguZOh3cAC2mGG/euJ1jCrYGcD5FKPzU3NPqFMbhbY17GuVA
         Xl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290182; x=1751894982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LzTcO/m9tkAD8Gqe/zjzIYRZPiIiP4NraWiu1v8c0Q=;
        b=bdxatnAbCGFKIoPnSkqp5JrRDLw7kWPTpEmRtYZjmpVaLqxbpTgSMkAOl/ceOf0WNh
         1swbbj9DrYffmuiYf54PeP6nxoOIvIGaNJJkdFI3JwBXkoCV0Dl7kNAQ7emVWJNfcp7s
         fjigDy6IDvZCEvYmi/WCdt/XKCAGdWDRS/jgmEJy4D/9eb4rkMsI+DOCU13iwdvBggft
         baTuauIYo8LR3no8gaEMo2JbF9XnDRMNl7DL6Y2YwqNh3vKdkn9tpyfYlSIbZJdfF0hR
         fg1skJHuuBWuh5u3sXZNust+FqaWelkkqlmMbaX9cWwnAMTVnbbmidBoFYGV9oczxdXf
         jyww==
X-Forwarded-Encrypted: i=1; AJvYcCVwHDJuLfSoVEm+ZQNIb+KWLgPGiQ+jpWqvkCWzxcoqp9f1RHG+1vVlQEJ/PSvhlpGjM4laTiA5qpKsNEH249A=@lists.infradead.org, AJvYcCWvmmja3Wrnq6QOVTTjD22bUOl0ea1D0wFqNYOvsLP7HxSZZNMEQploX33lt4uHCyp0x8Ra4G6jrJKTszaEZ29T@lists.infradead.org
X-Gm-Message-State: AOJu0YxbHGlx+YzD/6XSCWYCgsbdf1DKL7V42a8x0Oqw5lWfPtbS5vmV
	3jkXfJPj+q8A5ftdcCJ5/GpoJJYCJ4PORM39Tlzw5tIbxwPywZu2qapy
X-Gm-Gg: ASbGncu46Zm0W0h+sEvjFoJ49NN2Vf7+5qwZ6kT63plZbjQWsphT0xANYkDBpjgxoGf
	cPCy218/zbDoQhLY/vmPmtMg3TJgbimKp3LKLdFNjqa3mIyRbrXBmHbjxsogLQ0wGl+ae5oB56T
	zKmithVJBm3e+uYs5N2u9dbqFq7gxD1Ad9ziMpRlXSEGmT8DvXLlJRUqpzsvk4FHPC/YwWosXU/
	jqeFT9jjH5hFnuvBWw40aBfuo67cAuIiHnJ00KUlJjT7SBKBV0+8P36GpIzG0lf8dH9JVWkbHGo
	uz1IsF0MojPqJb0izIurDeNMc97jUGpE+/ORERo2pKxE8ucCu6TdTgzu5gkyFRmw7gXOSSW4jqY
	=
X-Google-Smtp-Source: AGHT+IGvSGnok+XQLrJYo+ik4oz3Ag1fPM5VlkYA503/kIRfskW4gdLdiEAL+3hl/iMdowvVnXbgzw==
X-Received: by 2002:a05:6a00:997:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-74af6e3f46amr20055931b3a.3.1751290181725;
        Mon, 30 Jun 2025 06:29:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e655sm9110887b3a.65.2025.06.30.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:29:40 -0700 (PDT)
Date: Mon, 30 Jun 2025 06:29:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
Message-ID: <f56c2213-e7ef-4b91-b843-e54d8821e044@roeck-us.net>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-4-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-4-f7f842196986@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_062942_933294_8ADCDA69 
X-CRM114-Status: GOOD (  15.06  )
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

On Thu, Jun 26, 2025 at 11:53:57AM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for watchdog on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 8d2520241e37f0e8a7526cbc99d5aa0d4edc9a55..ba0bfd73ab62a86befead007d4b7d2a870b81a0c 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -34,6 +34,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt2701-wdt
> +              - mediatek,mt6572-wdt
>                - mediatek,mt6582-wdt
>                - mediatek,mt6797-wdt
>                - mediatek,mt7622-wdt
> 
> -- 
> 2.50.0
> 
> 

