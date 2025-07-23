Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AFDC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJr/hw1dHQH58OkL2qscj1xdCFrGFtnGhH2Sn1vmVSA=; b=F2ekCY8TUnKgvBRjrkWLZfuQ6O
	qc5wfg1Sq6Xpr+1REp3irgkahZ1nrDxPmnRm6megJ1HKz+hvSRSlCTS/Dgn4cmYDKwbA9sMvDqpGJ
	fLyNS/lKZQjb3b5gFHGmbYFJWbSVrCHpcMg1mnmXSCYWV/TyKOjz9rICsYrmEq1ON2MT8xSsHTye5
	gelDCK2KSApYYoVb6Y59sOY3107T7eVBCtLdaWGmUOFh2pTh9EUol2xwSyWCv6++qm1eCtemmxuCu
	kmP8AYcXfk54GfyDZnE1kjU8lIQLY59DiJCTQziVqKwPeG38BfQCxD2SKjWE8hqj+owzBa3Zb1YlD
	LLDxhU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUbz-00000004LY2-3h5F;
	Wed, 23 Jul 2025 08:14:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUHC-00000004IPK-45wz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:52:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a54700a46eso3525068f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753257153; x=1753861953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJr/hw1dHQH58OkL2qscj1xdCFrGFtnGhH2Sn1vmVSA=;
        b=rSGb/I4I+FGTbNKMTldcZ4YlghhzJwbc4DTyBtYbVxnNxwfquWpopBCmli04U+G6dM
         x4akROnnGjbs4Un7BU1vc3Y/2RFiOacnm/1RofSgk/4uGMZg26qpnlVVr7GD3iaTXs2z
         hbaabcgumK3SDdAMryzI7q5RBXXv4QTRLu5uCFbJZ10jjebMmU1GYlWWJ6w5T6ND2nbs
         tY/xkK2spSQ0HRXUHngt2a7IYNO3n+1AT1dJPx4M/FaNWVXWwlyLoylERpcgDcN7eWKr
         ZbBe+6AR8Z+qD1qQmNPh4SwTIKOKgrs4nrZ8fT1kM5x7JNmbOww3pYzGNqgfiqrg8EJL
         I6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257153; x=1753861953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wJr/hw1dHQH58OkL2qscj1xdCFrGFtnGhH2Sn1vmVSA=;
        b=IJdKL5DsA1rBIuk3i+xp8fRzKczThhQ0Os8t8pDhUgHCLP92nOdICwmdLK22wzmM7l
         uzz1P2tyjwYXOBNvVYWTqDanh8HC8Z6E+7yN9ThWYDk2XbzZ5/OG0wgFwmY6CBjKi+Pv
         jPEpH1fLqUSCiytu99Dky/hKYumBlWUm7pYCeCKFBKL0wNlEYBhOgJZIIknhHVvlTDuC
         DrrR0eXEP6gp3spoptpyuUjUaZRkfQ+Z1bym2Rp5IdK89qDZJxKHqkJjpXjb6kKWAHxA
         bfeUhsQPnb3ltaXXDpk7KDShnuHGONzH4WRM4YV1rdv6CL1Pr5a4pDF2CiexWlZC/Y1B
         9K1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYPKbbl9NJM4JJMqci9Rt2b9ej5qUJVe76P8qRayRX5ZcYgMhc1/9kf1TD5s6AY1LP9TMnpBZU2/hIeP5b6XVs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+FoFOAE9+is48bjD1phaxp1Lv6QKHtQJCEQAwP2QRGC0pf1Nd
	swZwsKzZIEbG7711vJFq545ZrQ3w7KZ5gAsA+xpnbkWdgq4Z9nnPBN8Z+haQDKuinTk=
X-Gm-Gg: ASbGncvIGVK9/D1r3ArktFcwxuUh6Cz9YfAkNoqIpMewB/qT40mEOk9NLfB6CFtyFkZ
	rBSDzK0P4X1ogV617zwG3oyaw6FpucV6QcrW9Dsqd8vygwUWAskAdqo+Z/1cimwiWbPEq6l+V4n
	FqeDDmlC3CmSWZcBq4/PvFEkX3YvBEK/ZiLkrL6RGefwMwH5ybCk8CHyxmSOspclf1/+FSPwRC/
	GmSv89WxLZyTBccqq52btXcj1/jLZ+T7090tz5prQBqy3f+HGqNQQuLfkKdn41o0Mu16ynbWRcE
	DwZYnDKHq03YLJxQi7IP7NL5V8uHrgMGConrZJsX4TLxwmSX0iZRqEz8qtXkX9kOdgnFw89S6uP
	GgRrv6SOO3vdQnvzoeOTYJumr1gqClssQxLApKpGDcSh6Ga2couhQ+e6etWSeRhiwfXHdjLZMxz
	c=
X-Google-Smtp-Source: AGHT+IH1+KGiK7+CPpG7hfWiA/jq/1R1SSgKNRLgfm5//YxJ7f7pwzncw9zDFJZ9mt07q0lMm4XQyQ==
X-Received: by 2002:a05:6000:4024:b0:3b6:1630:9204 with SMTP id ffacd0b85a97d-3b768ec8a1bmr1439039f8f.19.1753257152837;
        Wed, 23 Jul 2025 00:52:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294? ([2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45869199605sm14357735e9.14.2025.07.23.00.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:52:32 -0700 (PDT)
Message-ID: <d1c67441-85d6-42d7-9ace-c4884f767dc8@linaro.org>
Date: Wed, 23 Jul 2025 09:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
 William Mcvicker <willmcvicker@google.com>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman>
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
In-Reply-To: <aICKM-ebp9SMAkZ_@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_005235_027133_A33648FB 
X-CRM114-Status: GOOD (  19.48  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 23/07/2025 09:07, Vinod Koul wrote:
> On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
>> On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
>>> Add a new phy_notify_pmstate() api that notifies and configures a phy for a
>>> given PM link state transition.
>>>
>>> This is intended to be by phy drivers which need to do some runtime
>>> configuration of parameters during the transition that can't be handled by
>>> phy_calibrate() or phy_power_{on|off}().
>>>
>>> The first usage of this API is in the Samsung UFS phy that needs to issue
>>> some register writes when entering and exiting the hibernate link state.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>   drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
>>>   include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
>>>   2 files changed, 50 insertions(+)
>>>
>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>>> index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
>>> --- a/drivers/phy/phy-core.c
>>> +++ b/drivers/phy/phy-core.c
>>> @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
>>>   }
>>>   EXPORT_SYMBOL_GPL(phy_notify_disconnect);
>>>   
>>> +/**
>>> + * phy_notify_pmstate() - phy link state notification
>>
>> 'pmstate' doesn't correspond to 'link state'. So how about,
>> phy_notify_link_state()?
>>
>> s/phy/PHY (here and below)
>>
>>> + * @phy: the phy returned by phy_get()
>>> + * @state: the link state
>>> + *
>>> + * Notify the phy of some PM link state transition. Used to notify and
>>
>> Link state change is common for the PHY. So remove 'PM'.
> 
> Is it really link or phy state?

It seems to be a link state, and I think adding a way to force
a link state to a phy, which is basically the role of a phy,
more coherent.

Neil

> 
>>
>>> + * configure the phy accordingly.
>>> + *
>>> + * Returns: %0 if successful, a negative error code otherwise
>>> + */
>>> +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
>>
>> I think you need to use 'int state' and let drivers pass their own link state
>> values. You cannot have generic link states across all peripherals.
> 
> I would avoid that, people start overloading this if we let it keep
> open! I would like to avoid the api -(ab)use
> 


