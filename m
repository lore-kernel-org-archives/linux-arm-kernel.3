Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E54E909C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkqHe1XyX/ctvoneyaOWC6ZPxkehSDSZz4eMTlKnIo8=; b=D8+gnEvQHEKM8E
	WXKtaJIRR1/m702iA9siv3r1Y0wxZqDLX8V8oscSXV9ax70stn2FmAXYvfiamQ9bxinhIOfY4MckD
	yZGpsFigbGhqrQ379MTsyamEPGQTCmSh9cFK2IXv+6ur0mzyJE4iO3ISlPLdenfqmRzIdyy/4HioO
	i8UjFKIAxYOXji+cPHEKhq4j9r9pvZCdFWNk75GHBO/t9wMWN+nptbGz5meR0FG0u08JN5X8bp2/Q
	wcMbVMiQ6mopdppf1Uw7yv9T9522TjBx+ddKRuWo/VU9SWGbatZmng+SYK92MyydRF7KqkEJs9wH+
	PvKPRIdHCdarUDzwxJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNBc-00000008W5z-0X8X;
	Tue, 17 Feb 2026 15:40:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNBU-00000008W4j-13rO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:40:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-4362507f0bcso3736794f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771342817; x=1771947617; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkqHe1XyX/ctvoneyaOWC6ZPxkehSDSZz4eMTlKnIo8=;
        b=dZ8Iv8EoHhTa5IRhxkhf3haVo18+ets6G+AMIjknmvg6kCI46edX2+VCxBVv++Rf26
         iysZlfFEyKVCYDXOW9Ub6zG4nDhbwhqR4QzKaZ3IJStaLaDiU1Uv+IFnx6+PiXg7VeHl
         5VWDS6PsO3AODJE49MzOSSm8+W5sY26WJi/bl37eS7TgHxfzqU48okfBpiL3Ah3uf75N
         06T3J2XlBawsWyOsrNLfi1xy5Qlzves+XR8NP6VyUm3fBzlFQwbh6g5E+Ih/RRZ70nAo
         +tflJxAULc4SlWDv/V1ptkQ07nifRrDrnmO69jrKNHlIEeH9HhgjuqLhHpXxXJNR9ivs
         u6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342817; x=1771947617;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkqHe1XyX/ctvoneyaOWC6ZPxkehSDSZz4eMTlKnIo8=;
        b=ertcq3sFtisHMCsh+1iCdmN0E/+CTCJhyfn5Rrn9NmibKe1NwTTc6dRW/qsFtMHWhV
         3dxrtNuhcTIay0kXyki8+JjG6t1BX7ueBdAxREHygbmexD/rQN6oRpTC2xG2+i9PwzT8
         f8DafvKiX+Tl8QtkjT+4N2Hql6zHN3ygJ4uSomUS0vyApyIghH5+0ujcoqSXKlAKpj6I
         PxxSN58VqARlpgi1K2nk8UPNf2t7acAtj3gGUNLbOXQQeCeXmYnemxiDSUsjNTWQqO33
         /rKtB+1h/d8n3+1A/r5bomrwRWjXt6S2F9SwJYiZI+OMLL7i/7ePqKEWtkbXhUmfTUcT
         dHtw==
X-Forwarded-Encrypted: i=1; AJvYcCVZDkckabQlhsCHCrHe3/4hLLCw46UFBJ0qR45e2lRDE2SKzZBofKUXmpWamDccl0w/nKMaTPpDP2UXxBYpIAn8@lists.infradead.org
X-Gm-Message-State: AOJu0YyZhr2+muU/xIeDNCu+m5q6aCfJgk0KzpIWCzV/9M299L12KULU
	1GnaroeQTgeb4ooedmUII//3hPxBZp/BktMhM5/dN5VHO80kCNSyrcoNPd4ZAIe8tDQ=
X-Gm-Gg: AZuq6aJd9h8x7ODfGpu86o0IGZ18HY8FPSJaITjeLyFYYupccXbGkIWtMRNvnAgt2v7
	hY18ZTpSl9hppNwEIMkZoVGm76jL2TDEEBpSxOCpHlZsoQb14tfqGQWxoU+ZzPDA3uDdkI4WaeE
	5FOk1Hwx1NgQnPDJeqjhSearSma88WtNsYiQfP5TGZMKiO5Gb41UVzyz1Q5sKvcdwscqbqGiCIs
	/iG/9tVhMQ5Dru12ZZVg43opC08SHsBIoWaW+cDu3MKeyE/1aTbaUAo2xFW45HaHh0sXp26zzbD
	hT5GEVopXd/hM/vVELFk3p3A/5H4DjFNB44oLL0QWdA7TPZkNMF4oMNWeSvYJkxzkHSMg2LFO+t
	B8pfnN6mU3CStFq7LQ0xkb9PT2Cq7ladb0/pTri43dbtaNMq8E6dMeL+ZeKJ4bgwRgsq/IeLz4C
	N5ZB62EAyzsXjkSp8CSInmWsZ6CMJB7VDIUrH8eO/YjPNlawTQ+DNxzvE+/5TsJSqTEyjdfIGZJ
	+rN+v8LWNTYtDT8
X-Received: by 2002:a05:6000:2890:b0:436:1405:3ef8 with SMTP id ffacd0b85a97d-4379d5da8bdmr24192213f8f.1.1771342817327;
        Tue, 17 Feb 2026 07:40:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:72a2:f5f2:e023:2a2e? ([2a01:e0a:106d:1080:72a2:f5f2:e023:2a2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad009bsm34212046f8f.39.2026.02.17.07.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:40:17 -0800 (PST)
Message-ID: <12f8346f-3df4-4081-a009-7a3ca83e2c36@linaro.org>
Date: Tue, 17 Feb 2026 16:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_074020_363249_91D1F339 
X-CRM114-Status: GOOD (  24.39  )
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

On 2/17/26 12:19, Krishna Chaitanya Chundru wrote:
> This series adds support for putting Qualcomm PCIe host bridges into D3cold
> when downstream conditions allow it, and introduces a small common helper
> to determine D3cold eligibility based on endpoint state.
> 
> On Qualcomm platforms, PCIe host controllers are currently kept powered
> even when there are no active endpoints (i.e. all endpoints are already in
> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
> such as CXPC.
> 
> While PCIe D3cold support exists in the PCI core, host controller drivers
> lack a common mechanism to determine whether it is safe to power off the
> host bridge without breaking active devices or wakeup functionality.
> As a result, controllers either avoid entering D3cold or depend on rough,
> driver‑specific workarounds.
> 
> This series addresses that gap.
> 
> 1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
>     whether a host bridge may enter D3cold based on downstream PCIe endpoint
>     state. The helper permits D3cold only when all *active* endpoints are
>     already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
>     from D3cold.
> 
> 2. Updates the Designware PCIe host driver to use this helper in the
>     suspend_noirq() path, replacing the existing heuristic that blocked
>     D3cold whenever L1 ASPM was enabled.
> 
> 3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
>     the DesignWare common suspend/resume flow and explicitly powering down
>     controller resources when all endpoints are in D3hot.
> 
> The immediate outcome of this series is that Qualcomm PCIe host bridges can
> enter D3cold when all endpoints are in D3hot.
> 
> This is a necessary but not sufficient step toward unblocking CXPC. With
> this series applied, CXPC can be achieved on systems with no attached NVMe
> devices. Support for NVMe‑attached systems requires additional changes
> in NVMe driver, which are being worked on separately.
> 
> Tested on:
>    - Qualcomm Lemans EVK, Monaco & sc7280 platforms.
> 
> Validation steps:
>    - Boot without NVMe attach:
>        * PCIe host enters D3cold during suspend
>        * SoC is able to reach CXPC provided other drivers also remove
> 	their votes as part of suspend.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the cover letter (Bjorn Andersson)
> - Add get_ltssm helper function to read LTSSM state from parf.
> - Allow D3cold if there is no driver enabled for a endpoint.
> - Added a seperate patch to make phy down in deinit part to avoid power
>    leakage.
> - Revert icc bw voting if resume fails(Bjorn Andersson).
> - Link to v1: https://lore.kernel.org/r/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com
> 
> ---
> Krishna Chaitanya Chundru (5):
>        PCI: host-common: Add helper to determine host bridge D3cold eligibility
>        PCI: dwc: Use common D3cold eligibility helper in suspend path
>        PCI: qcom: Add .get_ltssm() helper
>        PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
>        PCI: qcom: Add D3cold support
> 
>   drivers/pci/controller/dwc/pcie-designware-host.c |   9 +-
>   drivers/pci/controller/dwc/pcie-qcom.c            | 162 +++++++++++++++-------
>   drivers/pci/controller/pci-host-common.c          |  45 ++++++
>   drivers/pci/controller/pci-host-common.h          |   2 +
>   4 files changed, 162 insertions(+), 56 deletions(-)
> ---
> base-commit: 9702969978695d9a699a1f34771580cdbb153b33
> change-id: 20251229-d3cold-bf99921960bb
> 
> Best regards,

With [1] to allow ath12k to go in d3cold:

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

[1] https://lore.kernel.org/all/20260217113142.9140-1-manivannan.sadhasivam@oss.qualcomm.com/

