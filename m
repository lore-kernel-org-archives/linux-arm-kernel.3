Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9650FCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8u3fvZrweliySkFwW59HgfNZQsRs65Go4IHgDTz0m34=; b=bfbYHdfhiPSCv7KuMKT5ikVfhP
	NOCZZj5YAsqbyfNDSVD+2r6Rr5kYBQnE4LB7n2L+Aqc6W7cQaeALNjBNu2yuI4xky5uO3pYd3eeS7
	A6MHXzOSvHSGPEiFjnZTVl4ApyNDmX6WZJntTLXt0i51tsLXAq6ieI3Df2zLEg7w03se0tzpU5a0P
	AWrSAxrkbTf2OINFVdb+6ZcpwokjPJLt28YIGiHkCUD0Rjketl3LCYdjbD7b1SFBmF2wj/aZ5c8Sk
	fs+qPB9sC+Ig3dCTHTRfnNts+E56d+TUOaFJNM+7GdxFxjXdg0vGyAaCwgZSK7ziqPKxYNtNV4hd6
	TOez6ieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdSV-0000000D5NO-3GVI;
	Tue, 13 Oct 2026 14:26:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdST-0000000D5MS-1e4W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:26:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so6153585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791901583; x=1792506383; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8u3fvZrweliySkFwW59HgfNZQsRs65Go4IHgDTz0m34=;
        b=cfDk03wFSDvenDQE6ZongRdkRAThlZc66rOZIE6FA4U81hawpEHBsRZXFoKrQ2IUAX
         ZtlagXoM92+9I5HWTQLO+nHcDsDgsQ4kYgqUPfWASwzClSUYsECJyV1qFokOC3aZMKj0
         6PdVPjyv27Fpzm/90ctYzk4rUSwl16hzHvezExtbhspDUArCUoF2Rvr/IsDnXnBG7HNY
         SmqpQI2pDyjzSuikgNutbiUfCyQlna/nxYjESAyDSPLTN94gGMz7TUnLBQaHq02iVOfA
         GzrxJRCwStu7UE/GPSLunM94ar6OX+YOBIxiii0vFv0q8NVzCXBxGQjX5/COwzUnr1ku
         rGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901583; x=1792506383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8u3fvZrweliySkFwW59HgfNZQsRs65Go4IHgDTz0m34=;
        b=Z4t7ixfy5srUSKtYvomBTc5+jbvlb+9aWDOGBSnOMmCivMcAQF3cYX8ANnp1lrfrlx
         ecYprYa+cS1N9vS9B/QU46LeOYH8YHmtBMeIqaFy3I0nRTjaO2Y6VoLHxgdNbGw1+GzF
         H5GHul54aJfalmah0Sv8ppw/Xj3+71jqqYo7HZe6mgJ81EcKeeGHfmYAKoP2au+Ueq+l
         OhpF19F0pxv77z/ysLjikSzVRAbXIwV1oEQxaD8PCVw4xD2VyS9OyHebcALSjNU8WMNR
         bdbOG467tHZAQGLWgpFPmza0SIKuATxXTXHWjKBQBRSuqRcJck/Jj2NNp98PA5APyrxx
         ielw==
X-Forwarded-Encrypted: i=1; AKwUvByrdQ9PmlCWxFvcwI+5MVHQZ5axiVWrlsEvLignjs6WHajNteuveW68n5McjAeOTDyZCX/3nXzK+4cE8GEIra4o@lists.infradead.org
X-Gm-Message-State: AFq9FYLnVUrm8yM2P0SIqzhaqtgE//XXX+bKmYmXRllYyoO0kgNUIJ1W
	cIWjsvh9ACHrqp4ygFqfr4aEmgxMX+RuGf85UuU5YtCrwGQ7zx0zuwi572OEPjGObUE=
X-Gm-Gg: AYBFou1XdgIYnDN4VRpwkxY/E4oiKV93uv+j4ffna0IdBb0j6HwyipJArl/wSN3rAKX
	GKqhrC7b1efIJzeirCoOFgoVAjopr6xCEOKEM0T7/9IZUBKAUXsbVRHMihBWhaq4CwvM6QuDXvO
	ckbH07IMc1TY4C6WGShsJPAzed8Wdermxm9qkzR5JxToCzDQNd4MRHYgsRWUn1IoWGJw2mWnWzs
	q225vPDfuBBz8rQALyRe2tracBCsMkUkjP2STxZDYAiEMPABc55PNjQjHVrGbxaEeYM2eFk1bJh
	jeVvtCqIhThir/XNAVpw0TcQjTiReN6VJSV1A+yDKsBM/DPGuJvpSa0a5kIEHbmFSre4+JJTSaU
	l9lRrx8T3xcQrxAKqibYWyNQttCGnlhMdgQ2Tncm0JZWpCXZj0Ajjsql2hm6lkLREQntYgqypPi
	J47PJ4Krx9kc3u5i1GA7sHqKrXLrce83mR4KTVj+2pG868D8iA3KN6lEF0at9rdkEljVLMh2A+t
	+oloH2HoWzGm3p4s/c=
X-Received: by 2002:a05:600c:6994:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a18e446f3bmr249827115e9.2.1791901580664;
        Tue, 13 Oct 2026 07:26:20 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm7109928f8f.49.2026.10.13.07.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:26:20 -0700 (PDT)
Message-ID: <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Date: Tue, 13 Oct 2026 17:26:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_072625_461341_6982F7A4 
X-CRM114-Status: GOOD (  10.76  )
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



On 10/13/26 4:33 PM, Daniel Lezcano wrote:
> Hi Tudor,

Hi!

> 
> I noticed I picked up your series without notifying you
> 
> However, I did not pay attention but picked also the dts files.
> 
> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
> 

Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.

About the driver itself, I was about to send a v9, where I addressed
some issues sashiko spotted. Do you prefer to drop everything and wait
for my v9? Otherwise I can do incremental patches.

Thanks,
ta


