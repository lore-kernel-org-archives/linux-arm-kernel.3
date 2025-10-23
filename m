Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F671CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ng0p3rzhbCe/bm8WuWNgEWBVBz/1DYFIUGKbuqDxdLg=; b=uD4feuUth4BgjHf3gQt+Q5CG9v
	ORC4AD0MhcP+sFB0Zs9KVWf8WKdJlHeoip/mFhksLBV9UBy55NK8cQ/rnKDKLs0BUPEgCki0QcVUO
	oZftLyN1Q/6BsiLrFJ5MTXtrIiIYWciJ2PSGW8KyhjbFq6B5D1otl/9OlKGagHUFz8BFbwV7fnSJX
	f3m4cDWsqg+H5+YUAXQAGeJziopUCukRtAjMMaMv2yR4drDg3Adek3ZBnDJ1nI69Tm5N01xD6cOY6
	nUxVtl5WCXS3foxCmNJrsyF6sis6gGsqvEvUGSwSt3bBTSEtef43wJIRC1qfZxCGPOPfwBoTJYT+C
	0DHzW2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuL9-00000006EHd-1pcA;
	Thu, 23 Oct 2025 12:22:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuL6-00000006EGv-3Nri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:22:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47107a9928cso400365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761222163; x=1761826963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ng0p3rzhbCe/bm8WuWNgEWBVBz/1DYFIUGKbuqDxdLg=;
        b=l8aXpOizVAHDXqVbXCzgIK03vUu6NySfNqDRu3b3VlvV9SNMkR8j2RZDCcArECp3AQ
         gBUK+67iQHQak7m2ydeo53J2Ac4wposcJFNJ0aiHWF8H412hNPvQeOSGLkf0P2IsXP7I
         SyrkfmWkAIma1xJ6RiVeYkOleOW5eG6uGcfKOK8wD8MbQPSeMOtHCoNQ6Cj9DjYF1YAV
         JuzguZkuJkYjjlklgJl30pCXjsGnb2ORf/f09TluAOA+9CYkGFYgUJCL1nsuFCZIO+xg
         sjfr+My1SDqr6vzxbW3Mvm9BogWzYGSpfVz/02g5K/0hGZyHlEbLo6Rei1tRoFnuwlo3
         Dkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222163; x=1761826963;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ng0p3rzhbCe/bm8WuWNgEWBVBz/1DYFIUGKbuqDxdLg=;
        b=JzTSkwnwRCXINNBotDG8J3+/8W+TPtj2lRDOyMDfb33hSYVClLuxKLZVsXAOjT/EuJ
         1MDI7ukHtIpCGdP772BRvTmQxXh2iBu5IiJ0vK4AXufdTkMvHV31rHpoTcniR/O9qF3t
         atJjh5y25zwbrgvh2Fy+qJaJ2c1UfGBcYEX1RmU2V515JcmqqKgnfaJwMgqcXTBSzJku
         eAmPwuUoI2FNkQjByQRe6sQMknmpncm8VikZUry4zYCy2eYUIo7xAKddHJwc5Lr36P7B
         kAgTs197zle8Wm9f7CrzSXaGAXzFPT5xR9aNiuGMD91LevuxaAL2jQ5yBIgTymuG9q35
         z6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwCZtLiZcmC0de6zTfYv+z8WBVSdecR7jST4sHfvVBuHOhGcp2xfAUArIwg7qCd0Sy+wVFkQOOzhwYH5glGNL/@lists.infradead.org
X-Gm-Message-State: AOJu0YyfFLvlawPG/AtpOIYkyuv1Aqyc5Ga/3m7fJKCvQ7+ipRpYmYfP
	UCQswOPfPSH1aHzGyoneop8fo4DIdHKUQk7MXF5uxaZbcC1exzIeru6WKz89Tzvgf8E=
X-Gm-Gg: ASbGnctJ0TsR/FzXGjEsNRwyci1PMlc+dzRMjZfIMh+BC6EjceWKKXOd49kcba4iqDm
	M8RK5r6kFuSK7cgTx99EYAoshZeX9bLbsa8QqkbPIKFKCoCRQyU9ifCjQ9QT2+SHYfHsnpsHxGo
	vDtEl6Q7leDs4SM6fo9fOOJNU91S0LbqHztGhiCp1J+N+kqT98cygbBDAjKqzgAZYsFanWSy6FW
	BXdLcxkOnug+PiPvT58G4eeKzYUOiYtpFIaX2LMmbOFDeqDe4dMepqxLStS4aV+Ct+j30oHyjuS
	k/znJ1XrhfSLbGqqhm+masCUrTkygO3Xa8/+kcWQRfQses4vcdYOyxaAjQ3t24yg265XFcdtGcV
	USsb/d/8CQkSdAES5EyuAtfY9eaB3LJx9dRr3osKPkNvGO/nKcFymxZ/u8vVc2uk4DltbmJwwRZ
	C6vi0DQvN2ZM5LDbeBrsQPYaIJRL68i24ZT/tdZx/FUA==
X-Google-Smtp-Source: AGHT+IHn9Jc9tXr8TF9Sn6KIpzgp4yHxdt9b5RD5u8Yb6ZrVqAyZQpOL9VO2GV+WOPSTnrPzeUkpgA==
X-Received: by 2002:a05:600c:1d25:b0:471:152a:e574 with SMTP id 5b1f17b1804b1-474942c4fa0mr55655555e9.2.1761222162514;
        Thu, 23 Oct 2025 05:22:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7622sm3705393f8f.8.2025.10.23.05.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:22:41 -0700 (PDT)
Message-ID: <cacc9439-2cf0-42bd-b6c5-13d1e75642d8@linaro.org>
Date: Thu, 23 Oct 2025 14:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <joao.goncalves@toradex.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_052244_872727_F70CEFD7 
X-CRM114-Status: UNSURE (   8.88  )
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

On 23/10/2025 14:19, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Enable the necessary missing configs for the i.MX95 to boot and also
> have Ethernet working:
> 
> * CONFIG_NXP_ENETC4 for the network controller driver
> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller


These do not carry any IMX95 compatibles, so I have doubts you described
the issue correctly. You claim that SoC needs them, not the board.

> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller


BTW standard comment applies - explain which upstream boards have all these.

Best regards,
Krzysztof

