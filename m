Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1331CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWAXx0S/pPXGVImvk7hrySXVZEromhVxb0VxrMIicFs=; b=1VGE8SlZVPVNk9tJNar9k4XtGE
	QssMU76UtgplKV79gqiZubhDXTe2r2x1bozcpxQfTqxT0JujZ7ecJ7QP1fZQBTA4xGcZwuGT6a6TA
	zEB5FCEw80ADI1ebGS/15iiOvioVxO8GKu9vO8kQVOyuAFkfE3c1f+u+xauKUYfvzjQnGM+DkfzeU
	KzoB3V16Svup9IWts1moP4M7qxYw/ptvzkQyH7tY3NfPrvtmNHZI+8pPQQX2OhPLDqKS1HfTj4ARv
	0p1RTK2kVaKe4cQ+hKsgwSoGHiAFzTfljW8yZeCwM9jb0RXm3fT8Vygv90y1NLQs1ZMUVc2920Fpl
	OE3uxPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrA6-00000009XBx-2gSc;
	Mon, 03 Nov 2025 09:47:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrA3-00000009XB7-2tQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:47:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4710665e7deso19027655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762163257; x=1762768057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWAXx0S/pPXGVImvk7hrySXVZEromhVxb0VxrMIicFs=;
        b=CX4GmwxF3JJqgqmVFezowgt/6ws9gMd3KXEEsfmuUJv1g5LneeJYhivU1jI1ttsLMT
         gbUIG8GJsMS34kGXf/EpTl/c0DQdRH8zLbgh9AvWn76Kp4LztLvrk0KMueOUOGnGrp4r
         w7nxgsYEpyS8/uAIIeTHX8gK4a8oSPvxWB3P4lAutTVW4K6rv3/Q13CArIzy/nvQSDAo
         jyycWoifWhCGL25JzTocyhRImw7r3pufFXDiruIIpv6WYEIse6EfKFxV+GoVwx0F4PFI
         HLdKmTFu43CInwMkOz09yU2vQLgTUdFfetEc/NXxwS8e2yjhm/SPfksIPd4vFRP3Byh8
         z9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163257; x=1762768057;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bWAXx0S/pPXGVImvk7hrySXVZEromhVxb0VxrMIicFs=;
        b=FMqrlAAYYEL6TrPEH7WTOEs1CZdeYpXICCVhQIPqgma+OPa2TQJjy6N9GQCOVstqsM
         Ov2JmYekVW/wwypXBsyv3Gwik1QmR/CeqgRBHfhJofMDV9w3gvrF1jNdeRiUbC7vYzeb
         XMs4AK4P5KmqSAUKKrmMpoGQ3zQzvHUpgIWa9BzV1Q7XxBqa6Xe9snNBpNGqB7MHXi9T
         gxHGx4FRwbgCzhWzb+k5U2OO037fD9eI1ZoertNQ3stlGBSwPC6INPPYGZ7rtccUfqtZ
         TgcFzZMfJhtePqEPY9thCzb5sio6dGupfNPLf/UdkB7pI/fyn1s3uP6m/1NBIyQNBlJ2
         zNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+l4fl9xxfF5XO0e0TQPB4XI60pR0m1KyUGzIsRkLq0fDAMSgtEbGmoJpI1susvaA8Y+eAkCuVb8/wNKCZoA3t@lists.infradead.org
X-Gm-Message-State: AOJu0YyJmbfSQBPWmAvjIs2snZILoXd79Na+wVzcp3DKLwNKpz54w2P3
	dgJl0/3w18quhulSXN+kfNAqeJej5PkTI7prBCGkS5PRqFsLHmqdmu5gRLRev2HbLvY=
X-Gm-Gg: ASbGncumhmSuPGeFQF8yk3fo07SUrzoTsJG7L/MO5/aUikuhG4ZboiDRIEDQMz23fnk
	yykTtZG5325G7Od2UAnkw8pYDOeHducyVwPQuACzr0+KKUySK+uYB6A4BF1BbaX6LOBJTafDzoN
	K2HGiz2/FX7c2sra+f+EChYK5qPTvf3s2ccyGgjVLkwMp0IzL8Qu6OGx7zZdvEkmtvC4yxDrIzP
	mO7D0YXC6nAcO002ldbJBhHsJ5cxR7/v984I/pp4BuUPwWT1CSHyf7Tmuw7BhBHwJbZoSR0giyk
	+J0cEcNO+rwlA1d+XY0N6wNutzAi/z2lP30t9z3oyXiFPU7UQ2tRIwcDD6UFryIUrFCOjbK9M6x
	Lfik9sqHC2rPqfAJrazWFZRYZLsh8/eY1tKqoULfLFj0Jhqw4SCiDTa9xEJ86M9T5wNl53/rXR8
	VFCcAX7qZWxHlEql4TDLlXMDOHArNzS9OYgR7cBbFdgXst
X-Google-Smtp-Source: AGHT+IFJTdtxUlC5NqH3U7Qd9RRa1ToHSLBe/u+l9wzF/fKHgtyig4wAMueqSDc4k0TKmlPFEUaTjQ==
X-Received: by 2002:a05:600d:4393:b0:475:f16b:bcbf with SMTP id 5b1f17b1804b1-477331dbef2mr57555515e9.14.1762163256713;
        Mon, 03 Nov 2025 01:47:36 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm144227945e9.0.2025.11.03.01.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:47:36 -0800 (PST)
Message-ID: <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
Date: Mon, 3 Nov 2025 10:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
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
In-Reply-To: <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_014739_777779_8CCF425E 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Mani,

On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
> have region for DWC controllers as it has the Root Port and controller
> specific registers, while ELBI has optional registers.
> 
> Hence, fix the binding. Though this is an ABI break, this change is needed
> to accurately describe the PCI memory map.

Not fan of this ABI break, the current bindings should be marked as deprecated instead.

> 
> Fixes: 7cd210391101 ("dt-bindings: PCI: meson: add DT bindings for Amlogic Meson PCIe controller")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
> index 79a21ba0f9fd62804ba95fe8a6cc3252cf652197..c8258ef4032834d87cf3160ffd1d93812801b62a 100644
> --- a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
> @@ -36,13 +36,13 @@ properties:
>   
>     reg:
>       items:
> -      - description: External local bus interface registers
> +      - description: Data Bus Interface registers
>         - description: Meson designed configuration registers
>         - description: PCIe configuration space
>   
>     reg-names:
>       items:
> -      - const: elbi
> +      - const: dbi
>         - const: cfg
>         - const: config
>   
> @@ -113,7 +113,7 @@ examples:
>       pcie: pcie@f9800000 {
>           compatible = "amlogic,axg-pcie", "snps,dw-pcie";
>           reg = <0xf9800000 0x400000>, <0xff646000 0x2000>, <0xf9f00000 0x100000>;
> -        reg-names = "elbi", "cfg", "config";
> +        reg-names = "dbi", "cfg", "config";
>           interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>           clocks = <&pclk>, <&clk_port>, <&clk_phy>;
>           clock-names = "pclk", "port", "general";
> 


