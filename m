Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4DBC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFKFKTz3f/ODCWb43+xuXVSlIieWn0Rv+6AT+FvWruI=; b=mj4JRLUpRz1O5IDCbOs0N/WnCr
	vCrqAUqT9i66MBQBFPs1ISPbGLN+hObqW4xqYqlj760F0YeyEZtBQVNIMDdgoteej7oEYHO9935TE
	3tD7AG9onF+TlkBAlYCdm5m4DudUThUd2KfvrvMtQht1uBXfQEKg7esHSt0LFDXaRdD1hVVWcyBNd
	u/AQV5+6CiH6P0AQP9lwOO2LDNYJ71BBb2dXmBameXqa7C4QDGmzuFQfkiJ4HAyqqKD++7oZnJgif
	A21+KAgbdG1IMAIQghF/zvKRi3cMzMYnhTujvAuyRH8X3GFZNcR4VU+Ulw5kkGMYtnmo/mnDaKBUO
	raDinRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8tf-00000001aYT-17sP;
	Mon, 03 Mar 2025 16:44:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8s5-00000001a9d-0k0i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:42:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bc638686eso5562535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741020143; x=1741624943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFKFKTz3f/ODCWb43+xuXVSlIieWn0Rv+6AT+FvWruI=;
        b=zWi1yvQdd2/RotrfnkSRWdkxZ6jkWteHSvl1/sVUuoE+JWagoc/TpPo4EEyKO2Ht/F
         D53JVpAascvYmGL+9KZXpoxwlGrSXGbIStIfi1lIVoxENYvvDaJMCiMn3geXEMH0GFiK
         41N+KsZkvyaahHpErYBQGYx2US81t41u4pv3ZwKvUbYPAs1JZjbTc0ZPDTOH4oFknPT8
         Uqxevu6dINCzXPQI8cqCvxNOKUPgEE+j0ew3C+v9EpdtsfmG40Ycq/2BHdOX1CK7u+nO
         2+8IoxDhSoGcViiCHfTWT/bQeLbB7YKZu3o329yCR8W89D/LPtrzWh/GWQoIOnd1SURF
         eKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020143; x=1741624943;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iFKFKTz3f/ODCWb43+xuXVSlIieWn0Rv+6AT+FvWruI=;
        b=Md+JHXdcoxlxzQL+fWbV9BRBNdPVdoIOTP+Je3VFv3FZr1E7p50kSqAUr7MfmW+GAZ
         99XWvACmPKMo7JCkCQrCiqT4MzL+RhftXvo17EsiK3r0ynZ7lXVIuQBPX2YSIlIxNlCF
         aqKpHz1PFvQo8uV4WpSDrN9MEhVy1qtNbh01Sy9Qb0+Pna9xWr0zYX0Ai6YVKLcE1JDe
         jjHlygxSRmMtcn52KddyaKrAQ6GcDakTd59TwfDjL2Jlk98D7sR3jR/gMU+vdWUQAOgh
         RxfptGOLtX4GioHatSB9qNXfQ2gLmhdxpRrhMlFIpoa0x/qQv4hFtyRLMWwrkNJHpyIW
         60zw==
X-Gm-Message-State: AOJu0Yx4YbLcvHmNA8tUiLdd11K4PNKUvBO+7OC7DysFpWucEmn/ecoF
	N6idGZiNemY1curVRA3h+3d2bg855DlVKi9hKPTX8/6bKJJRsIb7MW8P87JWp/U=
X-Gm-Gg: ASbGncuE0jmDMRAjppXx3aasoDLqFIt0/ypzOkNYHx9kJ9U388Kc9d5zqbhDy0RlALI
	hwPSfLi7p/XoMyUfKT4K0zL6faWhqLXhJB0oPCb+3v0+0BQ1330NXCSZYaNXkBu6wZejSS7dQHM
	Cd8XpZy0CRxT5XCTHcgiD+Ec4G9azH4e2Q4IzNIbHTqcP46cLXFCg02ceursrOO0GcNeeOCBEXv
	w4xFXVd6UtcqeBF8WzaCmBI9NjvlslDeMK8uF2vGk6a9dONofZxheMt4Sh/QgBkTY4KaW3tVfbZ
	l8hMEZ+PRJPki7BkGJjMgADyVH0qZIIW1L7Fjir/0abfkt7DG/2JCEs9vAI6nHqdIjKZFUTomye
	DeiolmKUK98Usn1QHWXG1bg==
X-Google-Smtp-Source: AGHT+IERr7trlQog+kaqqAb3/Ic3azfyefHYSZ50wtP9WNSBDS9iVBnCIw5D4hRIB3JQ4kfjJRTwFQ==
X-Received: by 2002:a05:6000:1fa9:b0:391:e1f:4c29 with SMTP id ffacd0b85a97d-3910e1f4d09mr3013310f8f.13.1741020143525;
        Mon, 03 Mar 2025 08:42:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1c49:dea2:d749:5015? ([2a01:e0a:982:cbb0:1c49:dea2:d749:5015])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc57529fasm28363735e9.31.2025.03.03.08.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:42:23 -0800 (PST)
Message-ID: <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
Date: Mon, 3 Mar 2025 17:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
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
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_084225_225236_1BEE0D11 
X-CRM114-Status: GOOD (  18.50  )
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

Hi,

On 17/02/2025 12:39, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v7:
> - No changes aside from adding r-b trailers, effectively a resend.
> - Link to v6: https://lore.kernel.org/r/20250206-adpdrm-v6-0-c8ab9348b853@gmail.com
> 
> Changes in v6:
> - Use the drm_connector_helper_get_modes_fixed helper.
> - Split out into a separate MAINTAINERS entry
> - Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com
> 
> Changes in v5:
> - Moved to using the component framework.
> - Other lifetime fixes
> - Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com
> 
> Changes in v4:
> - Fixed dt bindings.
> - Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com
> 
> Changes in v3:
> - Fixed building as module after splitting out mipi block
> - Addressing the review feedback.
> - Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09@gmail.com
> 
> Changes in v2:
> - Addressing the review feedback.
> - Split out the mipi part of the display controller into a separate device
> - Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com
> 
> ---
> Sasha Finkelstein (5):
>        dt-bindings: display: Add Apple pre-DCP display controller
>        drm: adp: Add Apple Display Pipe driver
>        drm: panel: Add a panel driver for the Summit display
>        arm64: dts: apple: Add touchbar screen nodes
>        MAINTAINERS: Add entries for touchbar display driver
> 
>   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>   .../bindings/display/panel/apple,summit.yaml       |  58 ++
>   MAINTAINERS                                        |  16 +
>   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>   drivers/gpu/drm/Kconfig                            |   2 +
>   drivers/gpu/drm/Makefile                           |   1 +
>   drivers/gpu/drm/adp/Kconfig                        |  17 +
>   drivers/gpu/drm/adp/Makefile                       |   5 +
>   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
>   drivers/gpu/drm/panel/Kconfig                      |   9 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>   17 files changed, 1489 insertions(+)
> ---
> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> change-id: 20241124-adpdrm-25fce3dd8a71
> 
> 

All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?

Neil


