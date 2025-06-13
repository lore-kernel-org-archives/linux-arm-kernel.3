Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1786DC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZezB8dUdKZQC1klqpxG0ZCPkOkCrr9wOd6SwONA76E=; b=SgQLP5MCIeRycK8sJYmAvednRo
	wN+2vokHzMwViWT+XhXqUCoZc7YvoCJkm8vUGQL7RxalkjEs3nM4ZN/Q3odMtK4jsbze1XfQEjRjL
	G+k6xm52VsrMwAT8EK68uo1AIygTwH+PoNmjMEc3cA1JT47h97r9dKG3Tn1odlgcZYAnnB2dKGcx2
	0e6yhdluQbiDbftOcHbYmsYk5pcMhoou8HwewVX5lLp8WQFtiIeIMWZ9n9zRQrYwdWhMm112WxcXq
	5Uap4T3p+GHmtm8UAka4oJ9RU4v2R98jOgwa71YNJri4UQFWztbZeckrwJezKyxUtuPYIPkHDiRc0
	qcAepuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0vJ-0000000Fw9P-1iGs;
	Fri, 13 Jun 2025 09:42:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0YG-0000000Ftcr-1rAg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:18:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451d7b50815so15629425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806299; x=1750411099; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZezB8dUdKZQC1klqpxG0ZCPkOkCrr9wOd6SwONA76E=;
        b=I6Y+ACk3WeebKfqcDR0waODGE1SjsXw1uFnx0fXH18gfD79zHXuGGsxAKX/R4I1z00
         m9ICWYYq5Huh/ySs1FpNjxvfKKfBtJJ0ASOGL9JYVCK0Pmgm7k6CRT/CXi8lDfEcg8fA
         cogvLVpYrk8Lg/myvFstdh6uVhhcJ7VYpxugEbtLD+vR059oYeV4Pn3lBpZWQxI5pPY+
         xEM8TQSymJSNxFgsOyHI4k77qUCPobYe0+qL1hxyGnOKQPteEUhTms1qOJOFcj4WMro/
         udCmf4z7vRnS9PtzvAVe7PZ+r3rrRX39I+/3Uc9SBGrrwXRV5YpqhP9g4QpOIRyh9Ydt
         iL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806299; x=1750411099;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EZezB8dUdKZQC1klqpxG0ZCPkOkCrr9wOd6SwONA76E=;
        b=FlYuPd9TEiZpkdWeRFRcBaqLBLDrghz7koVdLh2AAG9Vz6Hj1zasYecWmXkLofZC33
         peBj9olZsX9hnhT5je1UN5NczZetImty4hlrBdowA0eLlZXOa0396Zkm6jR9rvRb9SAk
         3jmN+KSsn1/O8VH1U/IjB+X0K7YUXBJRXPykZLrIrZx8nozCVYatwgBEVUww+fwW9oMW
         MOgxmSm2wt02qdCDaWMZIWfh7vmYolrXfG7O5Q9uTGtIedrP8UzLFqLHPBP1kyxhicTZ
         Ax8uOh1gJ1llKDRtl/wVTYzhZPk+4uhHVKuiwCOF1YPDUapoUK8wdU+qnSmkTluXsH7D
         MgQA==
X-Forwarded-Encrypted: i=1; AJvYcCWdLnAv2EGELKg7a1PuMHS292U79VeLbx6gihtR4amZzqF01wNipzAuR3O1/BeiUMsaNa/t4llaSvYnpW9vqOeg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5HVqD10WqtKMScKHlY/BUcdw5RQjq61iVw+mOVryist1dflUo
	hbhRVG0XCgdiZ3fCUGm2uSwtEdspV+JAv2zNDnJiRuUAuReUam5bEb1qa0OrUVm7Ix8=
X-Gm-Gg: ASbGncsCnHofp6Bcju+PnoKP/Q5JoqYkfA19bwEW8cbTOcD0Jo6LdnwEGmyCJA2sFOg
	UYrXgWjZvCOwsgkfUyCME8tFDo3K0uGtQCg4JlAouR1K8GvlX4tFfToVfVMZtyJUbHQuJp0khiq
	F7D6tCnMUqm+kINsi1oUefMAGx55KPgFVz6rcx9XoLE6ox4uA+/4j/wXRvEzNzc3hYx43C9gKtb
	dRvt5+PW6+64uZl4QSyi0lbVkanZ/ziLu1SGpcvbVYF8ez5hwmuFkc8gFx7sgNlvlIaJCvlFXqg
	hrpPiFoRpe6mP2vuJ79Tc9Zw7a0DsZ0P9IP5ICOW0PfN/jX89eq4mGcmhuojt9OartyQ8ak8EXy
	opPP2C9UKZ2FAfMhl1SqZFPgiXILfN/nN7QNKXCHaFGYdq3LUBw==
X-Google-Smtp-Source: AGHT+IEUrossJxJVwWBU+vfj+xukJOxxn0Gc50ke7zrjhbK13v9zCYmZziSm3yGa9wtgXShwZmF+uA==
X-Received: by 2002:a05:600c:468f:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-45334b07460mr22803915e9.13.1749806298856;
        Fri, 13 Jun 2025 02:18:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532063ebf6sm56506385e9.3.2025.06.13.02.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:18:18 -0700 (PDT)
Message-ID: <7178e816-4cb4-49b3-9a1e-1ecd4caa43ed@linaro.org>
Date: Fri, 13 Jun 2025 11:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Add ASPEED PCIe Root Complex support
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
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_021820_495892_A3D73CB9 
X-CRM114-Status: GOOD (  18.59  )
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
> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Add PCIe RC node and PERST control pin to aspeed-g6 device tree
> - Add PCIe RC PERST pin group to aspeed-g6 pinctrl
> - Implement ASPEED PCIe Root Complex host controller driver
> 
> This series has been tested on AST2600/AST2700 platforms and enables PCIe device
> enumeration and operation.
> 
> Feedback and review are welcome.

So it seems all PCIe RC code is bundled in a single driver and there's no
PCIe PHY driver code, is there a reason for that ? If yes I think it should
be described in the cover letter.

Thanks,
Neil

> 
> Jacky Chou (7):
>    dt-bindings: phy: Add document for ASPEED PCIe PHY
>    dt-bindings: pci: Add document for ASPEED PCIe Config
>    dt-bindings: pci: Add document for ASPEED PCIe RC
>    ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl pin
>    ARM: dts: aspeed-g6: Add PCIe RC node
>    pinctrl: aspeed-g6: Add PCIe RC PERST pin group
>    pci: aspeed: Add ASPEED PCIe host controller driver
> 
>   .../bindings/pci/aspeed-pcie-cfg.yaml         |   41 +
>   .../devicetree/bindings/pci/aspeed-pcie.yaml  |  159 +++
>   .../bindings/phy/aspeed-pcie-phy.yaml         |   38 +
>   MAINTAINERS                                   |   10 +
>   .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   53 +
>   drivers/pci/controller/Kconfig                |   13 +
>   drivers/pci/controller/Makefile               |    1 +
>   drivers/pci/controller/pcie-aspeed.c          | 1039 +++++++++++++++++
>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |   12 +-
>   10 files changed, 1370 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
>   create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
>   create mode 100644 drivers/pci/controller/pcie-aspeed.c
> 


