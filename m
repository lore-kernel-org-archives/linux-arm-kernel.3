Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1400C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyJXtMKyLy/gns1v7npOhaJocsF372rKr0wtnaGZSjU=; b=Frx73AOjT3sXNuUxjQHJajifE8
	TDl08w3cX5Wkh1DfekDIlREdNXpVVl3U4hR+vGFdC7PPhL1VIrqKgRfO4MH6s3WSJSHEO1pbGwUKM
	pFunFOBulGDAaucDQOX76nrgBkCEFz5JZWyVB6y8+e6fkBSoKuO2Tbaiko4QTSGuDqoFD+zR0y9WQ
	CRcpMgJjA8gm7ImSms4sC5dFtwIxJHvNG161VAY99pW/CD0XZFxgAsfeLzr48XPWuJS/T22sdlnRl
	1nzBFhP0whGsFYRw29EwktLQD7vmo68jgpQPcYotmK0W9ebxkDTBwPts15mRxDvblwuB0mgfq1V/L
	zBw0+ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39qC-0000000D28G-2Z7S;
	Fri, 11 Apr 2025 08:34:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oL-0000000D1jZ-37Kz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so18174695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360347; x=1744965147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyJXtMKyLy/gns1v7npOhaJocsF372rKr0wtnaGZSjU=;
        b=BGAyKWgdBomsRjyi12bJggTsIs5cZ+TTsQU4cJabsqPIe4Xhq4ceApPzZSeitSoB+U
         +vjRXye2Sjg4EWYplHj8tDRlVfEJUyhoGFxxvB8ZtyZvv9Rpp9W6K/4M0UOa9kMcitOz
         pbBwTUgWd7OhbBeB9EgpbT6AsMtqXZz6CfezNX9aeC3rW4t9soYQQDdjQUjxFO37r5AV
         +Aas7XExSIXX8p4v/GnV7171i3FGzBzyhdYF5Mb0SUAzC+ISb+SMi9lJL4W7EnOZnJHc
         7naLOf6dJINstgtQg33cNda3RKc6lC0+8Q7Hm4MzGUV95w6t40cJUVb+nFdkPnsDXMPz
         gtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360347; x=1744965147;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pyJXtMKyLy/gns1v7npOhaJocsF372rKr0wtnaGZSjU=;
        b=fJZrxJCy5bgcdU+vJQPxLN31YQ5JMJlaZ2owiaiwvLvtpr47oJZf9pSSe3EhRf/AJl
         aLiKdt+HAMpRTgXEM+YZhRxT2oZP5tm8jz/D1OQFvobFUH4EV+aj/V82wTw/OgkFQBI0
         s+/MxBG6Ctc2AclE8ssZVN/t1s3Supqcgf99B3weHqbQcik9yI01cpOxK6smKUDWnScI
         BgL6UFKekmEsFWf7pGu7Fy/MXyE6HDROi2+iHkJjJct+HzWPXVHKPs0Iw6qPauo7tKqa
         l6qqfxeoQ7YGrJ4VuqikHynCFNzj9wjH8HlEOKuAhlfoC2fmF5zzHObhrp9h6mUniLeB
         OFFg==
X-Forwarded-Encrypted: i=1; AJvYcCXXoRu/GKeMTtmjT9HOwYC/dq+3RIfdgsoQGq8Z3mdZFFjaZxRwYuOUB13zp+0TZhJNkXSShQ4RiMwoDKjmMLWz@lists.infradead.org
X-Gm-Message-State: AOJu0YyGPGtGO/z5wWhwbzKYCtPnbQTsJhg8yRs0/JjaF7z3igQAad3Z
	Y8Cw8xPa3ZOLfJYqCj+fK/iWKXhoTGTY5MP1bMvoyTjSsI+ExNQFSaaLakPONFU=
X-Gm-Gg: ASbGnctIHZq6VEw+seZTVkJaj8tqSJMMHYuCfxcdo9Xz7ua3oHzanXRkfpNDiNsb7dN
	GPO/jKQvAhYbhMT5v0Byv3h9fzSvGPFG8nBvtGRCJGVn5SjUOnhDn5sxTSf8/I4rHfXGGvQNPUF
	6cfRIIY94/IoSE/Frslfg/zsHhmsh7wf/OLXVVidPXHNTF3+WOXO2F89er6dzTT9w5D7pEBfOqn
	NAaC6dQ1Ym70zXVLyR6LjHvofea56nTtDQY+aEVtHn0pSfVlAxYDKFp4ECxxE9A30GruxU4cZps
	/nwIahW3odGA91rrPlId4+Ug0f+FgKPnkG5mOlnm7taSOrxIYsw7QVmlc5RVhjTiq4LStXvyf3B
	+emUTeDfP619nxkf/mg==
X-Google-Smtp-Source: AGHT+IFRP0ceYDboDUf7YhFap3N+kvOHTY96QqO4YWtRCrLo1IyOLrYHKFOroWBQKK4GWZyRGmFbMg==
X-Received: by 2002:a05:600c:1546:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43f3a9336e6mr13947315e9.1.1744360346497;
        Fri, 11 Apr 2025 01:32:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572b5bsm75951255e9.28.2025.04.11.01.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:26 -0700 (PDT)
Message-ID: <ab32c7bf-7788-4992-83a9-26963f520455@linaro.org>
Date: Fri, 11 Apr 2025 10:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/3] arm64: dts: amlogic: Add A4 Reset Controller
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
 <20250320-a4-a5-reset-v5-2-296f83bf733d@amlogic.com>
 <e01d48c6-287b-476a-b5ca-de670375561d@linaro.org>
 <8a0f383f-e100-4928-a040-91ec0aa9aa6f@amlogic.com>
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
In-Reply-To: <8a0f383f-e100-4928-a040-91ec0aa9aa6f@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013229_789565_C65CDBF9 
X-CRM114-Status: UNSURE (   8.18  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/04/2025 10:23, Kelvin Zhang wrote:
> Hi Neil,
> 
> There’s a conflict in amlogic-a4-common.dtsi due to recent merges.
> Should I rebase onto the latest code and send a v6?

Yes please rebase on top of https://web.git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/log/?h=v6.16/arm64-dt

Thanks,
Neil

> 
> On 2025/3/24 15:06, Neil Armstrong wrote:
>>
>> On 20/03/2025 10:42, Kelvin Zhang via B4 Relay wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
<snip>


