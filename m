Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907EFC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y+hHFzTa/k47glBM85zSNm/4Usff7fJ5DMa71YX6C/w=; b=LRi+oQmoMAAOBO
	2EJGeoxkjr3L14BgklpJs1f6DhBIjdF0gSAeWJJg5YqJBx9PSjSRMOb2GZbCNE5pIiqFP9MgtTTof
	dzja3oZiadhK1WqKvDQ6XvmzaJZUNR1zctsObyruYXWv+o6hZZyNvvKxe2hmMnZ0mme5U5EY2akkI
	dFcw0+jOp+rEUs8cLSREqfggHTjdIzh9Musagtcye64CGPl99UJ9GyB1cYYK0dUEqFJRl5fayEsmw
	XvQYVdP3hFHw8mZhMshD1O5BS+NB0GbYuPoG6ThhCJyI3yMRm5I362htj60f81z5Tj5puz4qzDBzp
	+/8PElVXS3m9ek5yfM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD4s-00000003Hqy-18oV;
	Mon, 17 Mar 2025 16:12:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD39-00000003HYu-1zIp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:10:49 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549b116321aso5119968e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742227846; x=1742832646; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+hHFzTa/k47glBM85zSNm/4Usff7fJ5DMa71YX6C/w=;
        b=MI0RvjHCmCNEetqscEGFW0RTPJqucwuLIf4KJfT5WbtokKn0c3Vu/83JTGqLwmzOxm
         GR4k49ZDbEb2EW7ipzftG4kBqxR1fiawlRMTpSGdAjHZQyG/egUAgH5SdEUoh7GCUr/2
         Fa7Fdh/l5Yvx2wyhRWpWQAtpwEoLbzbgjQFBOq8pVjX+OYOUZcZvLTbStli1LHndM9tw
         4K6p51h1+y/Wvh8PTD+qJZmD6NavPb+6NRQTZdg/UkvcbFqpg7lhlflUc/OXeqxtWJ9W
         E3OLKYnnAIq79t+1majZPFyYtcXtZb/FcDdkwyc79eMf7BoVGBRf0oSnAEtaThxFOBtb
         6z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227846; x=1742832646;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+hHFzTa/k47glBM85zSNm/4Usff7fJ5DMa71YX6C/w=;
        b=tUZviDrKvDY7v6/0RpsQ3pTb5GZxdgfxCBG+Zh1UrT6yX2xoGSaasaoN4rZUHbIvPA
         uho4DquqeCefRbWxcEqhIFQDT+NwKuMD32DhAXjdjbKwzPblhpwC9NLW7oSpE6FGLzle
         DfRcM8MpjL26Rro1HIGShyuHDD/Pm1SfaQjWGhefy80FYQwkBpD164SGShKbwkDw9kCp
         J8cevdgF8PM3ASu9yc/FL+j1neFz91Hh2oUe8V0eWa51/EPTdHVnOm/zcq6xM+WeJ12B
         3eUrKDHsw1NOiK8Jb1FArqw5c3++AM0JtY5ooP2GqxyJgP8vPeyAxP+Vu/88o9NcnAgS
         Xdwg==
X-Forwarded-Encrypted: i=1; AJvYcCULDi0NBGP6LKd51voguoNj81LuaFyqZLMToCcWofZ4b8pFG0kz0HYOEFWvx0T/sF422DWzWOSmheOkT4Vks5DH@lists.infradead.org
X-Gm-Message-State: AOJu0YyrtSmPSUOeHWnT/tBTdo9v4F7djz+9YYF24ptxDAV3HuI/vEB2
	cedLS+EPDhrpqhdpcb9cs7oldp2E/ow3dJeYt+Kk975O8p0Bo8/iNJXlceJev/o=
X-Gm-Gg: ASbGnctZ+vDJte+IHS03FpIQVaE+Y4A3GhZGTtFFZEJePKvIgAsEifZ7Kx8OtPPCYw6
	wju6IBhDQmxD6M5XRC+pDwIMiIdMsfBbg9kbpJDWPxDv/FwL3LwvI2QFBerpt+K1JyZjAAToo4b
	1PEE05eE6gOh9ap/7iycgL9czMC8GsfDzAAWE2PBxvPhFK35Kzg0VdkiK5c/PjEu62wRs6hRDbg
	O5k+kUEPNBJ4Eeq7pOMuzLe6FZ6IzsLglCcYZ3GbbwRi0guMKlLhaiat2JP3k/z5SUYYVYqzl+/
	GzVY/QxdEitdgejDAzbQRXJVEhQONJ8kAJFikSG9PohQo7udt9/xxmGO8Q83lexSrnp8uwKDhLy
	yKtdQ8BQ1NA1QvrMJ+UJEvA==
X-Google-Smtp-Source: AGHT+IFZQpIZsOaRDvG49qndB2WRE6CllDvUSfKFpcbLjkgYwDfq2Cb3WLhsg7F3PZLRcEHd+KxEZg==
X-Received: by 2002:a05:6512:b05:b0:549:9143:2609 with SMTP id 2adb3069b0e04-549c38cf99bmr8874611e87.3.1742227845526;
        Mon, 17 Mar 2025 09:10:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a77:b55f:a550:458c? ([2a01:e0a:3d9:2080:1a77:b55f:a550:458c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c00e3sm1359707e87.64.2025.03.17.09.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:10:45 -0700 (PDT)
Message-ID: <8632a8fa-7af6-4fb7-ba87-297df4f084f5@linaro.org>
Date: Mon, 17 Mar 2025 17:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.15
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_091047_516738_295212CF 
X-CRM114-Status: UNSURE (   6.79  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Here's a simple changeset for Amlogic ARM DT to switch to the new PWM controller bindings.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.15

for you to fetch changes up to dbf921861985c8d1db339bc8ad0652b9064f2f84:

   ARM: dts: amlogic: meson8b: switch to the new PWM controller binding (2025-02-28 09:16:23 +0100)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.15:
- switch to the new PWM controller bindings

----------------------------------------------------------------
Martin Blumenstingl (2):
       ARM: dts: amlogic: meson8: switch to the new PWM controller binding
       ARM: dts: amlogic: meson8b: switch to the new PWM controller binding

  arch/arm/boot/dts/amlogic/meson8.dtsi          | 18 +++++++++++++++---
  arch/arm/boot/dts/amlogic/meson8b-ec100.dts    |  2 --
  arch/arm/boot/dts/amlogic/meson8b-mxq.dts      |  2 --
  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
  arch/arm/boot/dts/amlogic/meson8b.dtsi         | 18 +++++++++++++++---
  5 files changed, 30 insertions(+), 12 deletions(-)

