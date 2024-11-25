Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D374D58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=; b=L2seeLJK1mRPFVGvgd87mUfeC9
	VcHWJRpyYn7ptP0ao9fWo71imwC8S1QlfEOHOYNfuhfoPI2OAsJVFdxni+V9FkpqSAqR7yFfwgYkg
	DLWSSmmsi4KFzLANv3Xk90SMtikVnJfaZejEj3fEExYUTdFx9mG00Ia3be884AdtDq6ZfeM6loPUe
	5jDieR5Kz06UxtnHarslYIgAVwQ89gR98hjVGXXk9zLA1d5hINL79wqCB1y1d9Jzh1CE9uYpWB/Uq
	9dEE04MOafcEjQp6P/LwLPtVucuG/TubD21+vR2IlDgcASTF+wS8Ot1eHXeoL/uZgUYs6z7IkjUAF
	apBcMyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbAc-00000008Wlh-1EdH;
	Mon, 25 Nov 2024 15:38:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb9e-00000008WeO-466I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:37:40 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso2573506e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732549056; x=1733153856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=;
        b=ahGhMmrItsFrKSuATcJTIRYffvXPxmwO2gGwDCWE/7AmfAhJWlroAzYoTvcI7mRMtk
         ZkIdEyk9cVkThOJSFh/6YfflThCNnlEz10P1fTJ9oXieFtIhbbKPhTKB4/9OdzENOERY
         /Kj03Tf3sQhHGCNMNyxkQAobZBa2U8uua2Ang4YOAHrr+8PkKI7YXTq5zmqQ+w6RBaeA
         PZOkzDd7GYnaC2H3Hf58mFKMrOovnzwp/IhM4cxu9RL0eRXAIthRrqyCenj+nvnluYXB
         ht+mXGH0KtVnM2SVEi0J5EuDbxhQVyqqRfJbByhj1DzYLf3I/WZJxdj3CkLR5OAAQYZr
         Gfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732549056; x=1733153856;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=;
        b=kZrWFQHeufFn2pQ/mAyi8ZGwHZH3pPv2o2rNTZ9AQHoZCKxSs38AQ4Eb5Q03/glPxR
         tgJxeBni2VbDojw1vkSiAfjkl7a9n7WvxWCuoKP4GAgy5M6TUaKthLIR7xDeYRbt4Qub
         iIYHQdTlJwFmTkMs2wOVG8S0n8+QUit0lm2O9IVyRgtBtZqBjsAA/u8aRfANpV6+q0bN
         iPw14Tz7P88LgaFQc+20o4vhHBkXEwxpNUKDrqykFZ63VqEkr7HLvmAt7Zd9vT/mmX3k
         jhjum9/K1uZ5xJWLYU3X8T9wuCKrACaoABQWUZzMbGhJbZqgc8+Ur/tjYCcX9eHGNjWa
         H7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcJck0rt+Hw+sfn0hWDMxfLE8aZ6v/CjQc+yWbZeoPlqHCX2D6Tnoo9Ari6DYlMLoP/uQVtaaHerXaHr5OF8wx@lists.infradead.org
X-Gm-Message-State: AOJu0YwAoTtOhPDmyCwxsCb+dKCDULIINXfoIA2FTcO7eSroYImxjU3E
	W+286m9OaI90FffHoKIu4fi6NqoYvDJD8qWxb6ZWIYp4Pz5NTu3bjdFhfXFefTA=
X-Gm-Gg: ASbGncvq2WV3I9ZxoMW7RvunP0Avv6Bj92WaivOxqN75eu9VfgFJd+WPrtEtZHPWj70
	xgnlaWLEIbj9yJLQaRSZyB7VNUCiVVVx1GzWfgJO75TZQ/GeV31DmiHqyjRsIqkBvJGWucmFbr1
	tZ32OTYObtNaquxRiI8iODd/hEpJ+sJz6r+zjq3yVBrI+v6IWVfStN/N5VVG1ZV1i7XWYrkk5dN
	40G+3cSugVtWLctu9/IAMsgdAv70CpPp9QA5HQ+hovJPzlOXiIuWweniSw0v5hJ4i4RtkCILv8Y
	tu49XI+Wc0Ui75ZHw4HvTkUe16Y=
X-Google-Smtp-Source: AGHT+IHmC/h4cTUnON85E6sO/QnQqtWoSOkY3lw5hIYTrZwaGeM/PrXuqTSpTpCW43QaBSIa3xvw0g==
X-Received: by 2002:a05:6512:1247:b0:53d:a9a4:7567 with SMTP id 2adb3069b0e04-53dd39b4f71mr6398723e87.48.1732549056577;
        Mon, 25 Nov 2024 07:37:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349ca82957sm66277205e9.33.2024.11.25.07.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:37:36 -0800 (PST)
Message-ID: <48f3bb08-a591-401c-bc0c-6af0506a1b1f@linaro.org>
Date: Mon, 25 Nov 2024 16:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
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
In-Reply-To: <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_073739_026071_58046ECA 
X-CRM114-Status: GOOD (  21.25  )
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

Hi Hector,

On 25/11/2024 15:24, Hector Martin wrote:
> 
> 
> On 2024/11/25 20:24, Sasha Finkelstein wrote:
>> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>
>>> So this controller only supports a single mode ???????
>>>
>> Most likely. On all devices it is connected to a single built-in display.
> 
> More specifically, the controller obviously supports multiple modes but
> it is pre-initialized by the bootloader for the single hardwired
> display's only mode. So as far as the driver is concerned, there is a
> single possible mode, and there's no point in trying to be more generic
> if there is no hardware that would use that.

I totally got the point, I just asked to slightly change the design to fit
the overall DRM/DSI/Panel architecture.

> 
> In general, it is not possible/practical to be generic for reverse
> engineered hardware with no specs documenting how to drive it
> generically. You just can't know how to implement the options that are
> never used in practice. I spent a lot of time on exceptions to this rule
> for the GPIO and SPI controllers, and that's not going to happen for
> more complex hardware like MIPI DSI.

I'm fine with the overall actual design since it's a special usecase
for a special display present on only a few SKUs.

Nevertheless, as Maxime expressed, you should still try to fit nicely
on the abstractions, or change the abstractions.

Neil

> 
> - Hector
> 


