Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D19AFEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPjdZsZGp98bzXhzTSlyBYqfNOAXOQtvUQ//D9HXBng=; b=T7J1SPb3oyMz+RL4X2xkhUYLOb
	tq/qOspj3ZVs3z1ztHttyUTkMXg13PXEtI45k23z3vXnZP2hQyWz0I9z3LBRe2yWVZ7DZ8K6s45LA
	ZD2wv9EUOtm9fNVOlyAUJFywcqYN57iPChZ0nehkrRe7qoyhzS9x/Iu2+cbRlYn/GWVKBuwQhR6TH
	0F1EQ5/nL6uaMXCXLt086rqbzngNt01/u8fyveGQVbHSaixL6lHrBme8W/odSYwmmWzM8a3sp+gO2
	dg9ADi6vhGJJ6ZJZHOaS5UwJUpfAyrTXR3FuijpOVTDCaFUqWmuME/6pxgB5NOV+Zjdp9/T0i/Y/l
	T97eOGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLDf-00000009v9o-41dn;
	Sat, 28 Feb 2026 14:23:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLDd-00000009v9A-1W1Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:22:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-483abed83b6so24320675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772288575; x=1772893375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPjdZsZGp98bzXhzTSlyBYqfNOAXOQtvUQ//D9HXBng=;
        b=jRv/1nmacnHuYygnTyzNGpdvTPw4jRZih8K1WqwZxLRw0YO3AlyK7iVh2qU3OpFlGL
         cmvCWLixTBTD6bsibQ9FR36hNChrssBm72IygCTa97RUMmrrMj4sIIMdxUTj2vVl+9aG
         zZ/54xbJ368RL7uMzFSTnJTH61jBwkEfVDKhIIWlggXzxwOvEnjDFZ7IJLsIi8AM4eXQ
         MApnSVmTqwn+Ss5ASIbcb+B7GWteymmmRd2YjTI5YB2PuxQ1PSd2sALI5mDu7RSICbUh
         +cToUPxHnOkwDBvcb03krIsKLbnfTpbER8jKAOwIHYQ6xouqKGelWi82/9S6hyCDedD5
         0UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288575; x=1772893375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPjdZsZGp98bzXhzTSlyBYqfNOAXOQtvUQ//D9HXBng=;
        b=cgGSHHNL7l/JVCEotwqGxBqcvw7/oPZN1Oj82HH1qoJAZp5UOgve18sBHWcbDBuHiM
         bqClDwcHaF7bA2V69Gg2LxV/8OiYqBPF5ztzuhfLLSvrTn3H52/jG4eb3lzgdaT+Evkj
         zWWaEMALmFw+udWnEdVL4nJeA+L51fYDUqLPTG+0a+07ycnxzm3wVf1KeFBEnZN5nnYC
         vqdBTG1NmgSmcMm3YX5M3scF0dH3mgQtoMZ3rxG356+Nv2cJ8OLePQ4DiXUQVUn+uinK
         1h4hk8fQZVwlvHVxMhZ8AvSjui2mxXPNMzcyAJys5p+nXApdsVMRMJP1YPvwkn8B0i76
         m0jA==
X-Forwarded-Encrypted: i=1; AJvYcCWLeXKAiNwVhWKy6Cj6s1sGQBbtFqbO9NVlgWzfbx4noj31SGVabNRGbig+LZNiT0U6ZFJbyMMX4Gym4+Em7jij@lists.infradead.org
X-Gm-Message-State: AOJu0YyRy30kptbDrwXGa7bG+apd1XzD5EFFgL3vE+jcA7M2iewM4k4D
	BnPrXM8juqdsgZLtt8aGHCuOU98lAX3PX7lfs3DXOW7c2al8YQtKB2jfPZZYWZoed9U=
X-Gm-Gg: ATEYQzw+slszAypcgMBLUZZpQ19g4VL/2om6FbPmR4CI+AAcqKRmPSQFADYSmWetfB9
	jTKA6l/XQeY2/2yWf6wcyE1Vg8TtHI6sYJxdLjfo6ZMnQsHnH3M/znGedyJuMmgv9An9RnlVDoe
	lgYL/ZoHSCEKTsxYyX11oiYz/NVdJzbKhHE3l04FIuOfrps5NrEUCV5DaavduS+ohrVKkphCxSh
	EpsvGGaITFML6u45gw5jC5TURftkqW04VKJzWdq97bJYQkPrlPccMsjsqLrW0nmAG2znq3aRQi1
	4laNu9FMBS14l5hfBEVA4oyiC7MOzNVMXw+pW5XR91NJ90BJELeZAsr/tJMs7REy6mxg5zSMah6
	MdTMJQd40Wvu011XOCymmEfu04YAGCkZTwxYsyTQo7YkM5k4c6OkZVT9gaTpLXg0ViKvmoR3iEI
	SAUm0VQEg8phwU4etvAT1xExkbNKNzfA==
X-Received: by 2002:a05:600c:6990:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-483c9bde843mr102315835e9.17.1772288575503;
        Sat, 28 Feb 2026 06:22:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bffc17dasm159284865e9.2.2026.02.28.06.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:22:54 -0800 (PST)
Message-ID: <89e2618a-a0e9-42d5-b82f-eded1269bd9e@tuxon.dev>
Date: Sat, 28 Feb 2026 16:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sam9x7: Rename macb0_clk to gmac_clk
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260212100147.5007-1-mihai.sain@microchip.com>
 <20260212100147.5007-3-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260212100147.5007-3-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_062257_421955_33BB4DD8 
X-CRM114-Status: UNSURE (   8.42  )
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



On 2/12/26 12:01, Mihai Sain wrote:
> Update the peripheral clock name for ID 24 from macb0_clk to gmac_clk
> to match the actual GMAC hardware block present on SAM9X7 SoCs.
> This aligns the clock naming with the device tree and avoids confusion
> with legacy MACB controllers.
> 
> Signed-off-by: Mihai Sain<mihai.sain@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


