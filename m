Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99247C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=; b=WsoVyPzg2xDjVPT43iWCOHxYlt
	oGyAEhRDS8ChrJN/QK+WFCffDFbYeHVI+RgxhYpFwKG30FRwWdYgHmL/PaC9f8bKrvHu6QzcJfIzq
	Blo59MUoGxj1nt9/QLr0URmTlphnXBka/zTge7ccoax0KsixwQYNf+GzMen7+TH/TKgp3cktWsACi
	mAFWy70CV2tgvr09uNT39xpc/8GppcANeFNPcKXg/Ue/IyzPOcPcEr38JNNY4F2wr/C2+ooFTNX90
	S26+paW7GOKds/NB1LxZ/Id0gkk5G8lo1Rb+b329Mtnta6hcXwNx2VLT0oEvbtjk794sgARqXLnvk
	KCdvp0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs1D-0000000Crb0-2310;
	Tue, 13 May 2025 15:58:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEryo-0000000CrFk-3grJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:55:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso39503995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151741; x=1747756541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=;
        b=aTa9+wvdx/oNoE7iXi/LFFZEzmQ9AbQ5/Sx+B+8eDS2SQmX9Vn07xBe7Xeygbhl60T
         LIcTeDNz4c4Tpz8CmD5f3odzHlyJvo6QjceMiRQyDIQAPG7R8vcHAIvgRdSwph4j6vNH
         Feb5OROOg0Oa7d7rP+DaSn9OD6ZPyXX5RFn0YqwXuVzxRgNyUIQ+M8PG+NyDTCSMZIwv
         NKy7VE5dx8fOSw4rjumCM3eNJc+EjMP2963LIkS7sHhsJfPYeOByXyLiCjFPvX36SVqC
         QeozI2nD08NB3YsnTcHsUShB9P+9ihhw3MIpWD4QFxwTokCTBevoKKp0BuQlVujB2l12
         10Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151741; x=1747756541;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=;
        b=KaEAuqdSPYH6E9N32Az55PeO8OKWb/LrKkbeNewAAIKYxP4LahgZdwTshsSQjwpq0R
         FWjnQ9Blds8vQ4jAHW+ldKdK0hV2NLHBTbMhuUYMayu9Gxk4VkwSMk35/l2Srz4lMnKo
         GWC74TCuAC3Fpp7URPHvWNcpRKj69L5SdNz92SrtmzxnxX6uOCr0HQHeYifG2z2Xxzc9
         5RRuvpaxe3o6i+vq8cK2LFYynoKuBeRLSkXtbxrRZaINdE+NJgPV6uyRKxzl/Knn+NlP
         gLT3LipbAAMIVwNYBwOgcdvrGp0evX62casWPyhmzVBYHB9E5a6DLEK1zbo+OlmaHork
         yMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZOqsgPkd3BigU96K+0RS54wg0CjjU4GUrAIXSaSTSEun51Hn/Q5alC6Uw4/IQVTGDq7KiObP+6ahB5BiVW7Fr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn4W5Fe+elI7eRhmkTPms4fh6COAwipO7tLzae+h2I3oDZvvz2
	DOG4Qa+LYmbYjxLH4OPmAhEUgw5vVtcz+pm5tXDthpRVOJCeOLYqZqW2XD1pqEs=
X-Gm-Gg: ASbGncva8C8aFsEJmOtgUy71upI/dZC5s+9OCmui5rlRc+P2Q5gj4NPySPhZ2V1rCeD
	5+KsyIE+rdb4UoQJvXLiGQ2Nsr50WGl16WBtnLR6hn4sQcuSpFuxo7WRBsNB7/HzYcKmUhKh2Sc
	njPBrJgmUeDafpk/31LnO1gIJVLUOJSFQIhOGwoJczTuF8L1C52nwweQlMHB3paI5ZnMfNIVfUT
	Y0f3kWCaDT/10pb0+baa+CJf0KoG4L5k46M0nYlXIYNrLpf/L0AMGkff5JD1Fuxpf1XMleZq0Lp
	bspnIDyrX3GG7GL1DwAYXoOIIGaAQagMoa5UOhpjfI/LYH1Az7wcxfNKzCFPbn0kDgNIlDbT+Ly
	f+XmixM7RMxmVdWlPa0blbdk=
X-Google-Smtp-Source: AGHT+IEsyluhpdUeyif3Ngd/ehW9ch6ZNKiHvT0522EK1VSzg20AmctXdpF2lUykleTEOTSKiVXBbw==
X-Received: by 2002:a05:600c:4e48:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-442d6ddd1e1mr154860845e9.29.1747151737648;
        Tue, 13 May 2025 08:55:37 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm217742585e9.6.2025.05.13.08.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:55:37 -0700 (PDT)
Message-ID: <919fa7f1-d198-429b-8f31-70f085a4c79f@linaro.org>
Date: Tue, 13 May 2025 17:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
 <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
 <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
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
In-Reply-To: <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_085542_916210_7F30D593 
X-CRM114-Status: GOOD (  17.74  )
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

On 13/05/2025 16:26, Vignesh Raman wrote:
> Hi Neil,
> 
> On 13/05/25 15:25, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 13/05/2025 11:41, Vignesh Raman wrote:
>>> Hi,
>>>
>>> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas- vim3) fails to boot with the following logs,
>>>
>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
>>>
>>> 02:58:27.819: Starting kernel ...
>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
>>> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
>>> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
>>> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
>>> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
>>> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
>>> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
>>> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
>>> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
>>> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
>>> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
>>> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
>>> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
>>> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
>>> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
>>> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
>>> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
>>> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
>>> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
>>> 02:58:27.820: Resetting CPU ...
>>>
>>
>> Could you boot with earlycon enabled to at least have a clue of what's happening ?
> 
> There is a synchronous abort right after 'Starting kernel...'. Maybe this prevents any early console logs from appearing.
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243455
> 
> 13:54:02.013: => setenv bootargs 'console=ttyAML0,115200n8 root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18641665/extract-nfsrootfs-h2fjsmdc,tcp,hard,v3 init=/init rootwait usbcore.quirks=0bda:8153:k earlycon=meson,0xff803000 keep_bootcon  ip=dhcp'
> 13:54:02.014: $ booti 0x1080000 - 0x1000000
> 13:54:02.014: => booti 0x1080000 - 0x1000000
> 13:54:02.014: Moving Image from 0x1080000 to 0x1200000, end=5160000
> 13:54:02.014: ## Flattened Device Tree blob at 01000000
> 13:54:02.014:    Booting using the fdt blob at 0x1000000
> 13:54:02.014: Working FDT set to 1000000
> 13:54:02.014: ERROR: reserving fdt memory region failed (addr=5000000 size=300000 flags=4)
> 13:54:02.014:    Loading Device Tree to 000000007ffe9000, end 000000007ffff57c ... OK
> 13:54:02.014: Working FDT set to 7ffe9000
> 13:54:02.014: Starting kernel ...
> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
> 13:54:02.014: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
> 13:54:02.014: elr: 00000000f2f26a48 lr : 00000000f2f26c88
> 13:54:02.014: x0 : 00000000050fffc0 x1 : 0000000001004383
> 13:54:02.014: x2 : 00000000f2f6a358 x3 : 000000000000003f
> 13:54:02.014: x4 : 00000000f4fefffc x5 : 0000000000000010
> 13:54:02.014: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
> 13:54:02.014: x8 : 0000000000000008 x9 : 0000000000000001
> 13:54:02.014: x10: 0000000000000010 x11: 0000000000000004
> 13:54:02.014: x12: 00000000f4fefc00 x13: 0000000000000000
> 13:54:02.014: x14: 00000000f4fefc00 x15: 0000000000000000
> 13:54:02.014: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
> 13:54:02.014: x18: 00000000f0f21d90 x19: 00000000050fffc0
> 13:54:02.014: x20: 0000000000000000 x21: 000000007ffe9000
> 13:54:02.014: x22: 0000000000001710 x23: 00000000f0f0e8c0
> 13:54:02.014: x24: 0000000000000000 x25: 0000000000000000
> 13:54:02.014: x26: 0000000000000000 x27: 0000000000000000
> 13:54:02.014: x28: 00000000f0f566a0 x29: 00000000050fff60
> 13:54:02.014: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
> 13:54:02.014: Resetting CPU ...

In fact, this is an U-boot fault, not Linux. I guess perhaps the Linux kernel is too big, can you check the size difference since v6.14 ?

> 
> Successful logs with v6.14-rc7,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76248143
> 
>>
>> BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/ amlogic-foss/abcd-linux-test/-/jobs/10004997032
>>
>> But perhaps something specific to the VIM3 is breaking, do you change the kernel config for the DRM ?
> 
> Yes, we change the config. Please see the config used to build the kernel,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243439/artifacts/file/artifacts/testing:arm64_config
> 
> Regards,
> Vignesh
> 
>>
>> Neil
>>
>>
>>> The board boots successfully in v6.14-rc7, but the issue appears starting from v6.15-rc1. These tests were run in drm-ci.
>>>
>>> On bisecting the kernel, the first bad commit identified by git biscet is,
>>>
>>> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
>>> commit 59c35416f4246aee66b5f5523fdc950b83325d82
>>> Merge: 472863ab2aca e988adcb5dee
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Sat Mar 29 17:23:34 2025 -0700
>>>
>>>      Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/ kernel/git/clk/linux
>>>
>>> Please could you look into this issue. Thank you.
>>>
>>> Regards,
>>> Vignesh
>>
> 


