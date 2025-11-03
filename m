Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F733CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkxRjtj8Zko1T2xij3oDoi3JjwhxKLKuoC0vibst6Dw=; b=nVoJrPaElMuRh+zP7swnAP0hcU
	8nRNZna6ttchQV1DOqIyFHX6eJx1PMfWc7/muiQKR14pi6u9PJQA29FuXPws1tWcMCwLXyxtyMECz
	xLokMrKi+IOuNPNKuTANCto4KMmUjBs2UZDfzNkS4Kaf1wRA8X4oe0rd8GBql9BAbbmpxGsoD9B7D
	/5v/9ChKKvsuDqWMZ44coyTL2U61M3FJ1CxuZwLGk6bFslVNWpNilQ11IdnM2PVdzH2zIY68uOsbF
	MQxda27WxbOrHYuPh8DANPLazwBqh6Jj1c0iFtKKd0s7er1GGjEem84kJGMMd7LK58aCge/bKe8P6
	U6jwPmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrCi-00000009XfT-0yKI;
	Mon, 03 Nov 2025 09:50:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrCg-00000009Xem-0eUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:50:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-475de184058so12122785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762163420; x=1762768220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkxRjtj8Zko1T2xij3oDoi3JjwhxKLKuoC0vibst6Dw=;
        b=kHGpdjf+H926au+PMpaJ7LgDTDukT9D7wrZitfBxeaAq4b12vvHV0WUT423Y5+sRYD
         a9IDOTd9DKSKwUif4waID7e2MHt+mNWgOr31fDZVvzFbXJcv1g74yxhRev031KQb6JwW
         CuYgpUtml/QeRKf71kORbZ82G4VmSsDe0HNbNXCS7tfK+EPDUPUIJq57f6t+X6cFNEAn
         qyHh8zpu0snoveInTeY1ByP/U4kDf27cWOuD+LRrgS8s30RdtOVTV5nFaXIxBcc1CsQM
         5ZxBMFdH1YlUpfUQMo56zhFdZQTDxTQd3cgtk4mYEQNH+bmbKqOnh504n7PShEZwdTkV
         jBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163420; x=1762768220;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xkxRjtj8Zko1T2xij3oDoi3JjwhxKLKuoC0vibst6Dw=;
        b=eSmQqi09T904755rWi0vjBEnXdysi5dNXFWBXBdGj1a+uuaFHMZGZdq0/dGtglOBYF
         fxeHZ9EWQeUO5yQm3vHKOXpskWy59THZsIAjyUZcAQGkpk8S1hPJi30vHAhQr5ZtFink
         EA534MGx0mytSS5h6jEdZkNxpvPkmekyvEgjqS+vRlieeMmp5ArHiOKYUawe6azXimRV
         BEn22MytcgzIWMFzvp4ndBMrwjcv73lmF1rQmcxZk/lN6Zbut+pnCP9vm6KnvspMA7Vk
         ggJF6s5bsP13IWe4PiI6ym6512mllvXGl4yl22dUPhJoJ8Qpg4qByuG5MHm7xe5kKN4s
         BwbA==
X-Forwarded-Encrypted: i=1; AJvYcCUU2BDFK71r6H2pNXxk3uGiS/mTa1uP7+aBPW1wY/JC8SLAik/YeOTA1HXRixOoDmqG+MpMF2Pzauug3fwgpiRi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1u7+o7l6DJzHq3x5EufGczhaUfNsLY0kW7xn3R/S+gd5ctcnM
	D5OyJl2vv4xbS6oghtx8T/34NcrfaYTPwEen3omMTOjyResem3Wiie9bXZn56aSt/aE=
X-Gm-Gg: ASbGncuX+9LHliHsFe0rTK768EXEw4YGHpmPqD/SFLiBRsGgrp4D/fdBPLa/EV8GXPF
	QGebZ42YhVJAWsLF+g4F/yqYC44IdJa5nkAxjzPQjhKwnwt/1Xe4wSjWL07/rDBhvhgHo7QptsG
	9f+AjgfuXBSZGlRFSriBaA2QaRYYKx1dd9cAlz7Y46sDLqsNRQw0kzgi5jtN2uih4B3sY2KMMhp
	jS0lcsEg9G93rLHNy1DxS55HqOWNQMffKqEv75qtmCvpVy8pBzWH+iEtefhC9TMPYlIZtT4ZoOx
	J0HBnKhM6Zf2OhWbR1eFKU6GEhaF/k4dDox3STcEaUGct4tIFN/K6OcAnMkecbqPURfRnEKU6ty
	6Wnx0rrv649C129zZAz1y3eIInkLmR/4N9XqVIXV92EZZ3q2/7Y310c9qQaybk8ZDmSOKozNZpG
	oPu+cA7Xuk8QVX4vAMo25ZHtRLeGEMuQMHkh+Srtp8zjG+
X-Google-Smtp-Source: AGHT+IHrNu7b4MLVFNafM5XudQwLx9/rw/9sFxikTt/B5JVYOos8PxRbnxL+oXtoVWVlGPVam6SEPg==
X-Received: by 2002:a05:600c:5249:b0:471:145b:dd0d with SMTP id 5b1f17b1804b1-4773087230cmr102374215e9.24.1762163420204;
        Mon, 03 Nov 2025 01:50:20 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fcd45a9sm84684815e9.3.2025.11.03.01.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:50:19 -0800 (PST)
Message-ID: <83d07b54-d584-4297-9aae-2a170c0059d4@linaro.org>
Date: Mon, 3 Nov 2025 10:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI region
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
 linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org,
 stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
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
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_015022_254231_B65EB328 
X-CRM114-Status: GOOD (  19.11  )
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

On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> Hi,
> 
> This compile tested only series aims to fix the DBI parsing issue repored in
> [1]. The issue stems from the fact that the DT and binding described 'dbi'
> region as 'elbi' from the start.
> 
> Now, both binding and DTs are fixed and the driver is reworked to work with both
> old and new DTs.
> 
> Note: The driver patch is OK to be backported till 6.2 where the common resource
> parsing code was introduced. But the DTS patch should not be backported. And I'm
> not sure about the backporting of the binding.
> 
> Please test this series on the Meson board with old and new DTs.

Let me try this serie, I'm on a business trip this week so don't expect a full test
report until next monday.

Neil

> 
> - Mani
> 
> [1] https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Resending as the git sendemail config got messed up
> 
> ---
> Manivannan Sadhasivam (3):
>        dt-bindings: PCI: amlogic: Fix the register name of the DBI region
>        arm64: dts: amlogic: Fix the register name of the 'DBI' region
>        PCI: meson: Fix parsing the DBI register region
> 
>   .../devicetree/bindings/pci/amlogic,axg-pcie.yaml      |  6 +++---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      |  2 +-
>   drivers/pci/controller/dwc/pci-meson.c                 | 18 +++++++++++++++---
>   drivers/pci/controller/dwc/pcie-designware.c           | 12 +++++++-----
>   5 files changed, 28 insertions(+), 14 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251031-pci-meson-fix-c8b651bc6662
> 
> Best regards,


