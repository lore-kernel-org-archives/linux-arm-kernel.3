Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C907CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5IgzBtL3hdaFI1JoT3J9eqUHcohZ+48uLSQ9wTYks4=; b=ckMMtOOD8ZPZB7xDAyM6cu04cP
	UePr1F2z7TCHxOJ48nYazbsPJBf7Jf81GEPNmRm1zrb/NKj4Z1mtTSCqRBuEXQLWbbxkwXlPmH26/
	DpiH5oizagP9b69hmmcSwum1L7E/B/pHWpFBnonSV/+zoc3mf3d3rtijTKNL+LGOFeEqm/ZmPcZq7
	1J2lmY4QbLi8R10qAGNdIloWF2rp+E+tlUMjMjv/DaEF3NDr/KYZ+KzA86sU0Cz3X0V6L1K6lngjx
	pQxH9OVfCEjt50CgpPQXakh5CsTA58TRu75LXjVYcQ2z7swdqjFSF0otJVC+4aUrSTWrsUdehvGGA
	p7V2EYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxSd-00000007Sg6-1Ikv;
	Fri, 29 May 2026 13:41:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxSY-00000007See-3B1y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:41:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4905529b933so56024895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780062069; x=1780666869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5IgzBtL3hdaFI1JoT3J9eqUHcohZ+48uLSQ9wTYks4=;
        b=LsSpYkbEeJYghxwNcZPGUwzdzbEqsg0Jt3f4icea8mC4MGfKr5MPN7KI6XnsGiK/yO
         s22MeBtDP1zu4246uPVGZaf0m7ikA69JdLNj1/opak/jPWj+EbpomgP7KKyDkaCJMmM+
         WEYQVj9lNNmJoKb4X06UYKwfyP9igEzIglcRPR0NAH/JvvI6GmXx0I0ThCI84+I0MP5M
         POBYzZGMagI2AiUQ6zPP3h05dsmmZ5rOvcqdnW03Z+H6gCx3T3PqpFN3BOd5sjYhCkZs
         BhVp0yA+eqU5ueioyUyxI7R37PN2aAu+4zi4DseQKY010PMPYDJ4XNr4KzALHS7iNnDs
         cgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062069; x=1780666869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5IgzBtL3hdaFI1JoT3J9eqUHcohZ+48uLSQ9wTYks4=;
        b=rM7PEi8YapKLdFFSUOzj0jOwj5wJz97I+ZMVJggyNCVGN5tDzeFnfXz73lkweZ6I3V
         BVPvMyxleSM/ID3kjKA+mG2o9EWZGRFUIp7Or7UhtpHP3cr1Nk+Djv7jUq5GWQCB8LT6
         SjBJVwuTahPBUN+3f32Ag9iVd0brLGmAN8btQJMOiPydrzNMw9KIv9lA41w/IfIWPu+7
         2Ki32HoRiGxebaNLGRu90bBbGj+92pyW3YS7tEKt6/W/mkUsnwh+4+yLGddNJr0I2tH/
         qA7Cv9p7f6FGLH8YUyw7aRzuO4VcF9iuMAKTj/i///VTq42UIE053Ptu9ioNNHF1LgLr
         idtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BUzb1rQBZQ7l8JumON2TBe7Uy+0lg3k1vHRwbYC38yaS+Snymc30KEOQoUmCFeJTc21/JajeGTnyHDb5PHHqm@lists.infradead.org
X-Gm-Message-State: AOJu0YybL6d+Dff+ozOvOyVwVqwZfiu2w6461U3GpK4WXIeA10OWlW2z
	sTH+RkgJd/BMaO0qyI1gd+lu09ifh7Z7Leh26RDoGubTYu8E38em8VSzpslVJRL0Yqk=
X-Gm-Gg: Acq92OFQxcK2/9mVUPBHpVX1Cj1cXpdZT900ltjo9s2w5X2pwDE+U31UkuRIju8y/ug
	AOSGy56jT5q9074O64Acm5BjO24x7tEW1TYOdBPs/YcIV8ulO5KK0FueXwCXEmhqLtSw5i9jxqW
	7flQZguK9M58bxlITGt/Xx1o6OFtcaxaKvAI4XfumFL/ElYMeaLtfPigfje0gK2gxnbnr7gBdau
	sVdUD5HrH7Dby/umzVQibkegEJMjUOisv31zOTHQku3VOlIyMzznUU5dh5+bN2TcBZNns8mctDF
	4BuxivqgdxDoogrKI9hy8tDJLolsic9SygTcqDabBNidNKwKmUE+TKwavhTxalVsOGrdVrDhpLp
	kNUkvxXmcjtGK+/4anwFWtG/keFu5BUa2Pg+lNdeyr2fC/eyXr/AWFe76uTMdaxCWqGwtHPaf/6
	lodJDjrXfpNGxC9fAQj+zX6+fxU5pgTdAwgXD2pdukWJHZR24e9ZTkXzt2EF0d/XyyVUVjuCy2J
	U9GsBf9uoWUzXFsBQ==
X-Received: by 2002:a05:600d:848c:10b0:490:48e2:5618 with SMTP id 5b1f17b1804b1-4909c0affedmr41223155e9.22.1780062068618;
        Fri, 29 May 2026 06:41:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b6d0:a628:be51:f552? ([2a01:e0a:106d:1080:b6d0:a628:be51:f552])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm3488697f8f.18.2026.05.29.06.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:41:08 -0700 (PDT)
Message-ID: <a0d209bc-f37a-4962-9e38-5cf9d1e8d936@linaro.org>
Date: Fri, 29 May 2026 15:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add
 display and peripheral overlays
To: Nishanth Menon <nm@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vitor Soares <ivitro@gmail.com>,
 Vitor Soares <vitor.soares@toradex.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260522161105.277519-13-ivitro@gmail.com>
 <177980721984.3070642.16547338359984019493.b4-ty@b4>
 <20260528114043.n226kfd5urad22xe@sulphate>
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
In-Reply-To: <20260528114043.n226kfd5urad22xe@sulphate>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_064110_832782_092D1281 
X-CRM114-Status: UNSURE (   9.88  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 5/28/26 13:40, Nishanth Menon wrote:
> On 16:53-20260526, Neil Armstrong wrote:
>> Hi,
>>
>> On Fri, 22 May 2026 17:11:04 +0100, Vitor Soares wrote:
>>> From: Vitor Soares <vitor.soares@toradex.com>
>>>
>>> This series adds device tree overlays, expanding the hardware support for
>>> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
>>> and peripherals available through Toradex carrier boards and the accessory
>>> ecosystem.
>>>
>>> [...]
>>
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>>
>> [04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
>>          https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c3c5fb9b36836d279ebe370189d68a0a3387362
> 
> Neil,
> 
> Could https://lore.kernel.org/linux-arm-kernel/20260522161105.277519-16-ivitro@gmail.com/
> go through your tree as well?
> 

Yes sorry will push it now

Neil

