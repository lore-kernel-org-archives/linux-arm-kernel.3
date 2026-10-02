Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5B2CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zplr7QU6lV0JIsmwOjHD1EDA7HxZc99c9t5ZOt0FqI=; b=p6N/85TW3kLILkggpVUvmTs6rv
	5R9IjABQE1sASQT0rBMQEhpvs276R7AQaZ9QgpmUn8Kmt1WRuAMTaJTsVczeJP+0G2w+i0U6kQPYU
	ZRj4S5FVvEMU/Fc1tR/+kLisDCOo23oUNjnsw3X4NHc9/Wm31uBmsfWaU3zjYRtYDwNQ2ajLWcKRX
	hqwx5/4ZdIBGuzZdwue34pPwtN5ECxZcpfjqey5wn0d3FEtEyxuufqkNGgek7g+IOuHA6VU26XVx6
	HVXa8bwnIVE8nHTOsdr/u7cdsTwP0P3o63l8ZSxBVV05aQIPwbz8l6v2SBmtyMaeJRNQyk/QZb2kI
	xaaf2myw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXhb-0000000ApBJ-13EE;
	Fri, 02 Oct 2026 07:29:07 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXhY-0000000ApA7-2D3d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:29:05 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a11603310fso1835495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790926141; x=1791530941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zplr7QU6lV0JIsmwOjHD1EDA7HxZc99c9t5ZOt0FqI=;
        b=FNAWsBKC+i1KoaFNvTFpdBegGclp1nq64eFLDjWRKkBgFOyFdAR1aJuhlLsfBX7iuI
         DGR7V/lUW93sDfeD7u5LgBuoJm5DVFzK5a8GXmz0GWRlwxP0KT07+7i/C81tq1XLP2nQ
         yRzbvnwUHkP9OIWpbWyw6r3yp9CObycOxUSKfNXAGwyPtd49caUAIdpmGRH59QH1s0F9
         vh/hIgxI+b752UDQax/4Xz5M2T7OQgaNZGTy1Q/DkuIMEDWn0dMthAxBtGag00E4n5Uk
         8N5VzzzMu4B1GAuMhwnqxK4fBbYzqu+QiDzGvvWn84zwT8/FUJp0ASzqc7hBteRAyuHJ
         3Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926141; x=1791530941;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zplr7QU6lV0JIsmwOjHD1EDA7HxZc99c9t5ZOt0FqI=;
        b=CwQRDTiWBnAF7zM8NbptsELtqtBF5rAITwbpARGcJHZNgbCqRqhCpJqrv7o36nWbjM
         VypAQDC9E6llOY/sNwBXIWAla0fZv+zgidKrRhZYaR53ISJUmYWCfaaSNUQgBCPfMzOW
         PekDarPcGQmmpX7JU/fp6DX4vxpDSttZYibO2Ofq8gTRzTSCbLr5IyFWILOpsmXMpGf6
         dh4nx+Jy9Dza+prFIG/jRionAY6+0HEE3i8S2sKfRTmkiAgmgt4zBXSIMsF9a5f7sQnm
         hgDwJ/jO/8VcGKzFbij4lABZ6UlwpzwQnF95LulHaT9/lDkd7+At7QCPrsz4O93zEQb1
         MaGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzczs9FzjSum5dB5vtHczIQIzn3LaBkg3ZDxjmb1GOWhEBnHf2jRs9JLNfycKtL8ThPOiO/D1+KIdkrY4SolWev@lists.infradead.org
X-Gm-Message-State: AFuF++lkdeNow0RsGTKM0KGpnHuhjZf5ofYvowFa1NGbw4dAeNOu9YoM
	bzhOgpjG1Fttl+utXXriMjxpiuEMwZB0knMh471k/ILI5umsTfWWKfyIwQshFuHxlJo=
X-Gm-Gg: AYBFou2JD4UceNRp3U66ovExT2jTxx1qzeTXyInKz2hKhsNkMF/JArS7Y94aLBfLHDb
	+ZU91AnGM7PliY2dHDuvL8shzGvspb3A+a3DjZZofqS3dJqTt2ra5K0KUfHQt9NhZZDVnNG7Kqu
	n73jyoqRofcFX1a0/1iLUI0sJTG/NSBcC0Y26RP3uowSmEzx8QCQbekR698cOcQhBthEPsNFxuz
	Dq47dq0GTa6vsWJYnh7/Z7OzTRWfbV1u8Ig0d/gK0Lz3lQgvUI7nOwwHUV3ziBPbdM+IMjoZRvD
	zSmgpHc2HMaQ30j2PPMAaHKHitTB0XmOjkPKKh2u0ES2o4Y9inw3D11Gespa1Od7pRIANN74fZn
	B+DRvD1qaltp+lXzA3fK3QkWQaHgjLyKo2tKDhUnSwSmi9dye4flts5S3fjTWT2b7DjM07NckFA
	A/Q7K+HmK9vNY+w+ERsD7JjcNjvSA9lIKpBmpTaPBNFSoQENstEw/7+w49iLQxplGqISqu7ZsdG
	pqVeeAezRtc4P+s9K6fkALKRXKLUGlKtjN1hM8bhxsAmx7mAaUMT95vFVwR7g==
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr30178595e9.10.1790926141218;
        Fri, 02 Oct 2026 00:29:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm42454685e9.3.2026.10.02.00.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:29:00 -0700 (PDT)
Message-ID: <ebe0714e-cb96-4091-a718-97dd9c081710@linaro.org>
Date: Fri, 2 Oct 2026 09:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: Add panel-mipi-dsi-bpf generic
 panel binding
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve
 <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Benjamin Tissoires <bentiss@kernel.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
 <20260928204059.GA515872-robh@kernel.org> <artyl8fD3zzng8Uh@houat>
 <742d5bab-51cc-49f0-825a-f299a055bb1e@linaro.org> <ar4G864IgYTvfNNy@houat>
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
In-Reply-To: <ar4G864IgYTvfNNy@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002904_585508_F603C664 
X-CRM114-Status: GOOD (  20.07  )
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

On 10/1/26 09:09, Maxime Ripard wrote:
> On Wed, Sep 30, 2026 at 03:32:19PM +0200, Neil Armstrong wrote:
>> On 9/29/26 10:39, Maxime Ripard wrote:
>>> Hi,
>>>
>>>
>> <snip>
>>
>>>
>>> panel-mipi-dsi-spi is a generic panel that will load a firmware, and
>>> quite similar to this one. google,android-pipe and qcom,fastrpc don't
>>> attach to anything and will just open a tunnel to userspace, which is
>>> somewhat equivalent but more dramatic than what this driver is doing.
>>> simple-card or its variations will just instantiate a kernel driver from
>>> the DT and is used pretty much everywhere.
>>>
>>> I reused the binding from panel-mipi-dsi-spi for this. It was reviewed
>>> by rob, and acked by a panel maintainer, and 4 years ago, so we're way
>>> past the "oh but we didn't know what we were doing back then" argument.
>>>
>>> So, let's phrase this differently: what's different about the
>>> description than panel-mipi-dsi-spi, or any other binding already in
>>> tree?
>>
>> The panel-mipi-dsi-spi still describes a class of H/W control interface,
>> not a pure software driver implementation type.
>>
>> "panel-mipi-dsi-bpf" or "panel-mipi-dsi-rust" or "panel-mipi-dsi-cplusplus"
>> would be the same problem.
> 
> Rob explicitly said the bpf part wasn't the problem. Also, I don't care
> for the compatible itself, so what would be an acceptable compatible for
> you?
> 
>>> If it's the BPF part, BPF is not Linux-only, and there's hardware with
>>> direct BPF support these days, so it can be considered OS-agnostic and
>>> not an implementation detail.
>>
>> If somehow panels used a standardized MIPI firmware we could define this
>> in DT, but here we're basically inventing our own type of firmware from
>> thin air.
> 
> That's not what panel-mipi-dsi-spi is.

What you describe is how it's implemented in software

Neil

> 
> Maxime


