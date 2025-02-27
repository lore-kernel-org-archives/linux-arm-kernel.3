Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3237C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=; b=XX9qzaMGmxyGP2Zy4sxy6orA+K
	txFaHWwhTfFoWj89Iis4I/ynU7BbIGEfzW/g6HfZNfW0MBDVdVkVyXwZ9q+69R3eGnKh5eUzMMVF1
	Ox6kZSrII232tMNYQ+Ag0nLGYsE38koTSGICA4aDpBIcX6ZHWibaYNeN5txdblp+qzmwjpQ3vh2Pd
	CDIEBhw10dbeI2M4luhlp/oU4DFSCneiCFYInJhBUmsJXmlZhBvs2ZUdmrQFpjoAOxyc8SPuByIG0
	wMAYbokpr7L+yMCC4oZwad70vC46ysfIkxMiygjq3sunSjXFSAB4LPG9+t/D5ojnaWE7TEZYSwU+Z
	gA1uaMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh3-00000008TfJ-1Rpx;
	Thu, 27 Feb 2025 19:37:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf2S-00000007m8A-0poO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=; b=mCVXGvg6SY8y3Sk8myoB+vU6sR
	GEX8cYN5gmLJPy+a2k119y3qkGRB2W1CRvV6Iz3uOyXPO4WheRFrbUgwZzavK48aixhp/IrtWrHqf
	H0wvMbfzYJWLkeTBXqWuHhApFft4E4Y4ovgW0fWCpD3e/p8GDTK3GzMR/u8Azc1shGUGEaaViF1iC
	Z6OLtNxZfXLiXFKTNOXhxJPsqP7oPILrZfWX4SEcFXNK4+OdjfrpmDA/q3lIbyIn2EU/vGCMzTc1D
	5APAzyetDpiaxmwKptomQnWnD8Y7uF1wChoCm13EFQSJO9bYuUqnuACTaPW0bDOQj5PjXNomJPhA3
	CXyoTYxg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf2P-00000003oUo-0hWh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:38:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so10329575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 06:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740667135; x=1741271935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=;
        b=Wu3JZHtHjfwYM3iNoNJ3Du810P2j99ayih/1eMlUscTLnaPQcdskI9E0GP/nEae7uU
         rRhronlydlgdmFQPLu/6WNAFM3YCZYqFjKxBU9214vD8XW7ALqkpnmAPHvyJ69zWivhL
         46jyj7ViS8fH3k1GDtUcAn2QoLRW+j0uqj23GJ6+emMKUrCW0qjO9LZ9sX6drS3zeROt
         SWUo0HPcghAFT4R8a97v/lWT71KeG8eegGoosSWmrzWEsKrGBuTVwdlfF7qkbyBjTNuG
         LG3SL58b+TuBarikhCR5sk7LYLWXHWxqw0IYa6HmRbw7tdi4pZJNmdB5ezvrqxKIfcEB
         0jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667135; x=1741271935;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=;
        b=P2lsCy0GWTEojXnF4eqr56a7Sj67UIlpgK409WlskQGmCJsKIcPxqNIZTD/WpCMU+Z
         GO9gj1NAzXtvKahLI3zmkxP/osKm0LYxknkeneTvp7arMCRFgkA23tQyj4oQSOm0ivzL
         IViTVzNsr9dbZFL6Gxr/fILabgvCSyzYUb901sBy3wSEyVG+K3Uh9djTBgAFuzxvSzXm
         1vn8aThrGbBM44EaSfGIIuAKgnfclgYhSSrah2hwEYu4tXb50ycOYFQlizHszF+visBN
         JDZvwNLPkyDoW51hgDUsuoGvGsNnjXoFoHzdEp+N82RJB42mHY1HO3kC76Vc6HRZ0GTA
         gnzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXzxHL6+x2o0xUBbAOj3TKpFqvbUNKQ00bF4Pcaw8Y9xnMu03YZegM2HZ/fMSXBSBc2BA+H0LFZglNTat070QX@lists.infradead.org
X-Gm-Message-State: AOJu0YxymqBm1mt9BRHjtYRfiG5TeH/ZvvC8W7H3bbn5Mm/rknZ9DM03
	TT/veW/hMyl1o4b+vWqesSNN6C27S23utjoaP/6cSMiqPTfyGGsMJ1/+bBJQmKM=
X-Gm-Gg: ASbGnctN4qhZnkKZAOQh1OrwVHizpJCliF4xTqPkrLKtTExWUPclQ1YslMLNlKATlYB
	DesqNE3mJ4d59mT59G0kfd5OL+JyN+UcH8j2NOl2JpNVQpLsnwhFhRf600qWUUwI32bH31KXJRe
	7Oc3gTNd9n7ap6XicUFswQh45vmprXJitX95UnlzQ2Po2G3pkt0jU4Yy32A0driJp7pTfLQvC2o
	HR1se5uSB8oceL7zOMQHJwUOIxcG0V4P1I/bz3xkvtHj2KR5zoqJVOyMKMUCKz1QYQr+2OmSsEv
	prGK59UL/GoKXzHpkci7FiYoRQDRrYM+uARr14X2FCpR3ZqJyEJ3OTCGXHu1ufAjkiYlQDdKSey
	K45c=
X-Google-Smtp-Source: AGHT+IGglvD0BjLjUSReKQ3M4zIhgXtSEWvSxDygsXG0F96YWhydQ0BMAYxWezFgG1DgXlMFXIW6VA==
X-Received: by 2002:a05:6000:1541:b0:38d:e48b:1783 with SMTP id ffacd0b85a97d-38f70825febmr20148963f8f.42.1740667134786;
        Thu, 27 Feb 2025 06:38:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958? ([2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58713bsm59521635e9.34.2025.02.27.06.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:38:54 -0800 (PST)
Message-ID: <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
Date: Thu, 27 Feb 2025 15:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH net-next 10/11] net: stmmac: meson: switch to use
 set_clk_tx_rate() hook
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
 <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
 <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143857_452045_260B465D 
X-CRM114-Status: GOOD (  19.62  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 27/02/2025 15:35, Russell King (Oracle) wrote:
> On Thu, Feb 27, 2025 at 03:18:22PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 27/02/2025 10:17, Russell King (Oracle) wrote:
>>> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
>>> manage the transmit clock.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> index b115b7873cef..07c504d07604 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> @@ -22,9 +22,10 @@ struct meson_dwmac {
>>>    	void __iomem	*reg;
>>>    };
>>> -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
>>> +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>>> +					phy_interface_t interface, int speed)
>>
>> You can keep priv as first argument name and remove the next changes
> 
> I *can* but I don't want to. Inside the bulk of the stmmac driver,
> "priv" is used with struct stmmac_priv. "plat_dat" is used with
> struct plat_stmmacenet_data.

Right, it's still an unrelated change in this case.

> 
> Having different parts of the driver use the same local variable
> name for different structures is confusing, and has already lead to
> errors. Consistency is key. This is called "bsp_priv" in
> struct plat_stmmacenet_data, and therefore it should be referred to
> as "bsp_priv".
> 
> I am not yet going to be doing a big rename, but it *will* come in
> time.
> 

Doing it in a big rename patch would be much better indeed.

Neil

