Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C2C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Dh3Q+/ESCOTgc833hn/a+Fb6lN+IAypXdcE5FvZtyA=; b=IxxcEo3D0zgV/1EDEsKl/KinJc
	0kSirG3Kp2SI48NLZigNg3j/fukokJzLaNG1JSjsyrm0MBZx1/ez/A1W7fcsFVSoJsIWaDWQOjHqy
	vrH06QIkgviYYI+ImCbqMBlU5VWjgnVdQkXBwnEGi21d8UGrTqSJzBgRKP42TnOgUJuu5FA0ncjE4
	RhkPRkUoj231OV9P+pBrZRb5IDH0mh1kmpgnWDlmGptkPALWlB+2e1Ffx5JSiZeo7ldPYWw7HIJqE
	y0SHNN5X6/dEyxi1Hehz2Xq8znMVUpWyCFKBi8qU6bsW1mSIR/rfojZ7Letouh//b9LxrQZAet26g
	IhwdcXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XOS-0000000Fpu2-1TCP;
	Sun, 06 Apr 2025 21:19:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XMe-0000000FpgT-0kzO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:17:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-227b828de00so34402735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 14:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743974231; x=1744579031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+Dh3Q+/ESCOTgc833hn/a+Fb6lN+IAypXdcE5FvZtyA=;
        b=i3f/WVtg2d6OtDIOi1Gw2fTeKGNOXKqDAGSo1a6soM8rsMPdGezybHILjBG7oaCLQT
         33fGc9XA09c9LE6FvkSfyZmx4TOK5KRYNLQqPpziyPKBBjUOmIL/rDUWyEH57ODepzTE
         lHTcQ6CADTm9l4q5KgHON4nu1g2R9/Oi1hT0gGQQpS2umyaL7MZXy+gnI91TUItd9pnR
         ut3R+1dIhFp06jYdqZ2NX1tdeHpZHbFJFV7ZDAcGh9TweFPuhVBw4I4RLj63ckhNhPfw
         TQGOkHr670RrptQER2luiV63B9o5EthOQQ4v0QKLDLPZ3wp0ctlUP+uUs8K1+FkvG/j8
         weJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743974231; x=1744579031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Dh3Q+/ESCOTgc833hn/a+Fb6lN+IAypXdcE5FvZtyA=;
        b=AwxBJwg8YD0cbWwleTh9a9GSwSfB48qwTYfJoja/GdVe49TRH7VCX0MDkCSKVGl3u9
         1741lvQFmAfsx0JJtq/rqFKgrLOdjVU6YeZm47F6SqkJKWIqrFPZqye/1ItMBlZ8mPWI
         1aodgO3FRDKzIUTxzaoUN+6HCm4xiyF3eCd/RzQCDqydCFmmBuTGwSx0XXd0spNZYfFz
         iN+0pEwK8M2Ca4BeJBP2o59OhzyPlqmbmoJZGmwA3XOsUNf3Awpy36iIU4fGAskVICyM
         0VxHojf6+gzD0rbtvFKWS3rp21r1yWYYj81CrtBZmzeSKYN/3iXWQjsfe/xQdUkFljbO
         JvgA==
X-Forwarded-Encrypted: i=1; AJvYcCU+fE+b9/6kEbx9MOP6hh/TEXMk3sFjdImrt8nwxi3GavEkcYno5XH4Dr2+Mfx3mHTiDx63nAdmBeiMqZOyzzfR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy27uvIy4LVsFtG+piiZBOqh0Ie/BjH7kGAY2+9Sl112gC+IeFl
	x9y5x5RX5Nrk+BaCb6zIi6pysedo31wf/h8NfE/EJtji3r4dbPTo
X-Gm-Gg: ASbGncux0slmGu3pagtN+Lrf27mLXp4tmfCje42NBMj0gGgZyR3Rla+87kWkTXNyd9m
	ll6+SrpFMO3erLfYV5T/YvjyNyPJkXFdYHz5oE31qtEsjbbTfhhi5z2M5Jl8NXfw3YDao+4ZmmN
	i9gVWAvEIW0WdA1YKhnHDuMOmmI5nNHHw82QmeXWJRDpR/BuQaC8bdKSAMf0a3UkBQeBmCHHukZ
	WMEyvow+lZ3dyeDN8vkk86HCv0vFFisiPCzRHKE3/TmXo720UnHv6lR9nkfqcUjT3AWMWaZyXb+
	a5Edr2NU3Hl7yMkFN39puCQKPu4MIIGocqzJ3WFG7jTiyDheoi9NoMrVpDERkTj2eZySwLh62ax
	T8pwfXRnudhNyYYuYrg==
X-Google-Smtp-Source: AGHT+IFZhV9L9NQnjbxHqzuQWHloSa51wng9XDm1os9z7UwsaUvtPeYzq/GeVYYATAq42YOjNg2ktw==
X-Received: by 2002:a17:902:d586:b0:224:2524:3047 with SMTP id d9443c01a7336-22a9553aae5mr91276255ad.26.1743974231454;
        Sun, 06 Apr 2025 14:17:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e7f5sm67292515ad.206.2025.04.06.14.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 14:17:11 -0700 (PDT)
Message-ID: <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
Date: Sun, 6 Apr 2025 14:17:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device
 unbind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_141712_229725_613D2FAC 
X-CRM114-Status: UNSURE (   6.66  )
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

On 4/6/25 13:35, Krzysztof Kozlowski wrote:
> Device can be unbound or probe can fail, so driver must also release
> memory for the wakeup source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


