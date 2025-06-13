Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81782C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=; b=SOXBINI9cLmerEKOWshjQjVyVM
	f0yZEJKj4tTTeFqmAwthNaSWG2pCWJYbk3GgZC6tcpG1vlAFg/tXlaqz9mHSwtVZOOearqn5xSIvN
	COUhwRFo74N+NK1V55oFLEPVeSd38iRWybA3OIM3eETPRsRlEZkztxzve6XP1ectzZR5NyP0YVUY9
	FJMfIf7WfjUNhPN0PRjYZZl/N5laJR67fJ6D9QfB5p5FeudY9qcdkc3tz6m15tVyy2km7I4n/1VoP
	wzKaDB9IlxtLAXryhicyh0HdZEw2Uv2BCPqf/dGVfq88i9SMKTqoMbvwesjZL3gZ8w90S+z6avjI4
	umAIl2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cL-0000000GAZn-0r6m;
	Fri, 13 Jun 2025 11:30:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0UX-0000000FtFr-3567
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:14:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1186025f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806068; x=1750410868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=pRqlkw0iG2AHyR6qkvBNM8mjS7igZWVj09n/dtIgMqPYhQ0FpirmjOIHWaFdQ/m/7l
         ihYmiBL5i8ulzSNKERG19bpIFCApAiI7wFltLB7BrXwKjwpS/d7PBq/CGep7qKSuS6N+
         kdncGGdADlKQAsC9mpWVH3B9sfgUSMSnFU61Gadhh1Pac12PZar+xnip5FLhE5egVYoC
         2JL1cvWvpHC2AKDOUvFyxhDUzWVwkH8bgpFNbidaVvmxuDcazAt90YhJw/FxNCAcI9t7
         ROyKyoFkK6GULv3NO4bFBpH6HW+/Cud8MmbHz5K7uPXfS23B/oUXs2x69dlxqZObho7e
         9i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806068; x=1750410868;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=VyF3yS6Uw7J/wj0phP9LXfY+7SSmVlE+8bSlRP/P3V5xnidEYWnkrgGpojv5ct/zvj
         Fk18p2c+IZrfwDKeQRZXiX+yPB0M29DcZru+pFOh1XJQXtppslkMLj6bsuQFX88mwDkw
         V6nK1TXgSj6r0qD7bYnT8nqnB8IQXIYn+4YfBaYDQA8qv6lnUC/D6kv8GpzSkaMNEk7M
         qmd9OUOn7aupudrp/P5oKQPDt6a+O5z3fzXUgNymFXiChHH1gQxBnaAiMCA2pD1HgqEl
         4l2TLCNi0R1AKYVm/Pk/pKvrktvMNpakzTKAwsJQve/9nmO1XVWMe2su+xDXqmvRx1MI
         cyDg==
X-Forwarded-Encrypted: i=1; AJvYcCXDR98opwC7BON86o1O9Li3Ot4YH8lFXx6JnfhXPo+xBOIyCVQi8OuSvSQZ+Vz3Zp65sd3Ukna0hI91iwQRd1tm@lists.infradead.org
X-Gm-Message-State: AOJu0YyyQ+RMzgsg87u+6+kUpvSQMl0qvYo1RaWDuZUlSaiy2g8UUw1b
	Ifp8vAo3KdniNxlolwdLHnXEMlJWRfDHFjD/jEP+vvqzVxlKALZ7Lm0Q1RiI0IShKn4=
X-Gm-Gg: ASbGncsitoJ7rHt4qpqgamyjyzKSMwz3dmqKYXrUn0IpaiXxxAj4amWgO5dqt7UxZK5
	4oAfObLAi27B0KZ+io622FL70dZVeei26p4C+TjQlclZqi+7AhPcv7chRj2DHuUJgbgb2kUGa3L
	CkN4vlRgwg8dPAa+R2GpzSiN9qrrtSMc1cdnf9vcChor6Ydyx8L09o1RUEDgVq+nVyLYBsSFyzJ
	4iHtiWpQ2UPWO/qEs6sGuLPT3fN4M7JqeCpDJVI58MGOeS4VahYaZX1+udimFatha+7J5hl12Mu
	p/PYNb3UxbWcAoSE4Kns97wYTS8lryseKRCgu8nPym7YyIJXspMYghPV5v05Cz2FzCkr2LFjg5x
	yxGOXI1dFV+NSF/XAQFZMKEaBhT4ysUU2vdC25AY=
X-Google-Smtp-Source: AGHT+IGQOFD/EY7S2QDUIKx6X5WFj8qb8/qrnjFsfEXjcL1hzrA6uPRMdM2o+qwKrI1AezZg1EjOrA==
X-Received: by 2002:a05:6000:1445:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3a568655fe0mr1850481f8f.6.1749806068043;
        Fri, 13 Jun 2025 02:14:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm1781165f8f.15.2025.06.13.02.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:14:27 -0700 (PDT)
Message-ID: <5d624bce-a46f-4b75-b785-56def0c7f108@linaro.org>
Date: Fri, 13 Jun 2025 11:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org,
 linus.walleij@linaro.org, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_021429_795197_6EA4820D 
X-CRM114-Status: GOOD (  13.08  )
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

On 13/06/2025 05:29, Jacky Chou wrote:
> Add device tree binding YAML documentation for the ASPEED PCIe PHY.
> This schema describes the required properties for the PCIe PHY node,
> including compatible strings and register space, and provides an
> example for reference.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>   .../bindings/phy/aspeed-pcie-phy.yaml         | 38 +++++++++++++++++++
>   MAINTAINERS                                   | 10 +++++
>   2 files changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> 

<snip>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5a650812c16..68115443607d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3696,6 +3696,16 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>   F:	drivers/media/platform/aspeed/
>   
> +ASPEED PCIE CONTROLLER DRIVER
> +M:	Jacky Chou <jacky_chou@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> +F:	Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> +F:	drivers/pci/controller/pcie-aspeed.c
> +
>   ASUS EC HARDWARE MONITOR DRIVER
>   M:	Eugene Shalygin <eugene.shalygin@gmail.com>
>   L:	linux-hwmon@vger.kernel.org

Please move the MAINTAINERS change in a separate patch.

Thanks,
Neil

