Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4161BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=; b=wRpXdlj5FOOHCrz2S4eaJ7cglv
	Sul2rwbT3CpaCpA4XMuaTmM0kYNkgpWWBRQ4JGHhUFnSszz1ecvAs4tny+uQ04iuhgK+Drsel6z09
	kfebdgVnTPC7Q+VwKjP8wUjAQ17iqqsdIL1VWRkNPFlhu0QUGODG9FWO3SH8WVM903tUtlR+zCgPp
	C5MO+TjEwprLfUjtRNkPMRwL0g6buQoSOK1mQ2Nm0py9nZfr3WRjEFPsMODZ5hYB0dnr1twsuFvTj
	sRjGD4QDT3VcapOD4iYO3XGn8anvLoAV/SKmjPxUX8SpQLW2zoiVM0z6bIScJv5/GQStKQQfNd5QV
	Wg4oUNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mI5-00000008tij-2sAn;
	Wed, 16 Sep 2026 09:50:57 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mHz-00000008tgH-104Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:50:56 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f88so370722f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789552249; x=1790157049; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=;
        b=Ufhr+JWf5aHXYYsMsQfoYc2+m/2DDPY01TXXratjAqqjMTCKP0bv0LjZmw8WKQhJj8
         SjlWYfPWq/fLjkRVrY3tNolJsfHv7XF5OvP322tGZcdZvq7aBr37b6j1hRRhXMkBjb/A
         rRBkb9ZyxBch0x6RcqGL1al4mLQoWzYriNDCLt3wb4C09/dE+SaXItMoYgECq5HfMZyL
         wTeO5inxoreqjIbUeLll4t6s5n4HsC8VkiVH0NVd9bpzMUrcjwaR+C6hJZEbAQByBrWh
         imAoV4qyCY+Jd6qV070CWHtUvJFIPNZLkI2Jq19xbVFljJAF1oouYKJA5nwe1Rm3pDl6
         EjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552249; x=1790157049;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=;
        b=gJ4+KUiGGkDeQovHsZ9dOYYBbvZtaLV7R3QBOqtdv1a9Rt64m8DsyX2nlOcEsDDo25
         1tsrFR9qPhPx9Ey4yPs61kZYgWcVbLnKxLQJQbqA3XcGXNJ+Fwl+4mtIadDAB/S6SK8Z
         hPKh+5x5Rv/2cfIny/dlZIPzfMlZEJxLaqL2A18GzxeTwI0GV+Q33IchOERi7wYN0daz
         N8gmaA/LFGCaVGO4eQBe0xHp+/Z74bG3maZBTtfxnwKVp9ar1YyVXJ/lB4mgnKkV84kR
         aoaeXxhDKEWhykW9m9hRxb20ssSu/v+svw13BweCgqgSoOPCKqQYRE4rpY5Zzn4SrDxD
         hFBA==
X-Forwarded-Encrypted: i=1; AKwUvBweM6+8fDOeVCejMi2bPkdKrTs/CvIHGfwFnCMQaUGGrAZf4IeL6gDLS/DQBVyRGv6egRPIOqRO73Ffq5hE82sn@lists.infradead.org
X-Gm-Message-State: AFuF++kq9KZXmVrLLNCzSrBQtux/484uXp/YUOGnv4SHkNavtte/BCgF
	VGyiAa3cB/r9YqeOIePxY8dv0ZUi2kmVIrLIL3RWeN+bPnkW1avCEEGhAscgPkCL8A0=
X-Gm-Gg: AYBFou2wSz7Ps/Yu5jZw28nolJY4+5/OJJproBAuKUp3vycqS6M/cALJKIDI4GKC0hy
	3Qd/pdKcG/aQAyK8K+WUrpv/Gojw3OO0GB4H6xp9Rw46W9X6rUjKWaPUOX+RDues7k4RrWlKNce
	2RCOCJuMywQZiz0q1Xq/S/FWW069OWWgvUy2fw43Cs323bxhWuEhNKdGFwlWUVW+Y/fqsoBiKf5
	WFtiWuhlfpoBwKlNGixnxdbcKKegEhGgDyAkWFfemazr+jyXF4zKaBymFbc1wI4vlyMj+SyrMst
	/6Xha3J+NmWV71YOIHwn46ysHnRMhQplCPS/u/y4baYz13ar5TFrXW2TKvZ7VChtjRPUt3UuNLY
	n1zUMNuyQrEJyGLozFEX5Tc7OF/m5yVBBqLCrLcpBT8xdB9xHhurrwducJBMLu6EWraexa8XjL0
	9ZOYH31z5sWMwawJKgersK4IfHtM19Zc08sjJ5vwLn239mG8Qx9MnRxdH5qaqHGgkCgCB1pjCjK
	MfsywGPAYL64zXrP8HzvhCQAOP1oRtX44G9PeTWRbolCaUs/3yeeA==
X-Received: by 2002:a5d:64e2:0:b0:487:ae0:6459 with SMTP id ffacd0b85a97d-4870d169884mr2405331f8f.40.1789552248673;
        Wed, 16 Sep 2026 02:50:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e? ([2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm5657003f8f.5.2026.09.16.02.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:50:48 -0700 (PDT)
Message-ID: <af593f11-9334-4206-8006-cadd9d5c15c2@linaro.org>
Date: Wed, 16 Sep 2026 11:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real
 consumers
To: Lucas Tanure <tanure@linux.com>,
 Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
 <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
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
In-Reply-To: <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_025051_300520_4BD1EE73 
X-CRM114-Status: GOOD (  15.54  )
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

On 9/15/26 17:55, Lucas Tanure wrote:
> On 11/09/2026 16:40, Ulf Hansson wrote:
>> On Sat, Sep 5, 2026 at 5:32 PM Lucas Tanure <tanure@linux.com> wrote:
>>>
>>> The previous series for the intermittent boot hangs on the VIM4
>>> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
>>> explained, sys_ampipe_nand clocks a pipeline stage that the
>>> hardware design inserts in the bus path between the SD/eMMC
>>> controllers and the NIC_MATRIX fabric to help timing closure.
>>>
>>> So the clock has real consumers: reference it from the three MMC
>>> controller nodes and drop CLK_IS_CRITICAL instead.
>>>
>>> The series crosses three trees; patch 4 (clk) must only land after
>>> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>>>
>>> Changes since v1 [3]:
>>>   - Dropped the Fixes: tag; this series is an improvement and should not
>>>     be picked up by stable (Jerome Brunet)
>>>   - Moved the patch 4 dependency note below the --- so it is not kept
>>>     for posterity (Jerome Brunet)
>>>   - Dropped the e-mail address from the Assisted-by trailer, see
>>>     Documentation/process/coding-assistants.rst (Jerome Brunet)
>>>   - Fixed the space-indented error path added to meson_mmc_probe() in
>>>     patch 2, it did not pass checkpatch
>>>   - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>>>     capability flag, not an SD_EMMC_CLOCK register field
>>>
>>> Thanks,
>>> Lucas
>>>
>>> Lucas Tanure (4):
>>>    dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>>>    mmc: meson-gx: enable the bus pipeline clock on T7
>>>    arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>>>    clk: meson: t7: don't mark sys_ampipe_nand as critical
>>>
>>>   .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>>>   drivers/clk/meson/t7-peripherals.c            | 10 +++----
>>>   drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>>>   4 files changed, 62 insertions(+), 12 deletions(-)
>>>
>>> -- 
>>> 2.55.0
>>>
>>
>> Patch 1 and patch2 applied for next, thanks!
>>
>> Kind regards
>> Uffe
> Hi Neil,
> 
> Any chance you could queue patch 3 for this cycle? Patch 2 is already in
> next, and until the DTS lands the MMC probe fails on T7 with "missing
> pipeline clock".

Done !

Thanks,
Neil

> 
> Thanks
> Lucas


