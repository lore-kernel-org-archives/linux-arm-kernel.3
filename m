Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68423E77199
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=; b=PI8EEHdvT0KYBG
	6o0qPjtBasrjpYmx6ARUiCqjXM7neGYPVv/BMDLqBB/XljJSSZBc9aY8dsfQzmxxkHu92SIpqZ3rB
	M3ZoWp3kbPmjDD4p+2yBQScqEK6D/Qj8AiOpM47Pc6etNX20pK0ns2XoE9gfgpAkcZZSD+3e0Htvk
	SnUzFyaD60oC0xsryl2ygPe7gQjFOvxwHBG0DWFjmDZ2W2Awmmjgd2rVs5JD9dAnYpuJeOrgw3vO7
	qpfnfzXqGn1rI5bRDP0es56Ad1PlX+wayixyvYSGUMfsWnAJRZ+Vb/2dpLiPCfFME+voLS+bU1UPI
	70vtFaUAKJ5FlnUuYb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoDy-00000001bFu-3cq9;
	Mon, 06 Jan 2025 14:36:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2X-00000001Yxu-2sUU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436a03197b2so51082145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173508; x=1736778308; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=;
        b=OYN6LI3IKJEwfE90o+j/T2z7uY4Ochw4kUgru8EeILye/U+hsDZkDa9OlY1m3H3KeO
         wGmhvFhqnbedG8UxxRpHN1flC4WURpf15bLAcO/Wph26RWa6uPYFYRc0lu056mdYwk3K
         K8dMDImv6tJaWI7AhvLxvvgBGqwKN/ycy2Jm3VnI1VmCP/jAUwif2JYx9xUcmV+8+hLz
         Msol44QhiPowZCXmKQq2DIEKo2SgVfs0TXY2x2/ydgRw0N55gIKngKB6N3vZDmVrnUgj
         4bONqBOlBmWR0AfTzTm9Lo0fkMGNw4VXdu1dkkyCkTMVPMz8nNU+BnBqHoMhyNsGgRd3
         zJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173508; x=1736778308;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=;
        b=i1zfBFt6ghu7bSII7vAWdEmTjpzRzoUJoLIQo12/vd5MS8MUgWtx4mdqxsh3sXkhrM
         wtD2CiObzu3Pmujt96EopP67jwi2VOCRsstnkdRxMhATM+fn3n5Bl2Rh+ax21jPkjqXw
         7ZJSfZHacIwU2nypSn3iw5ecyKt4rpPn/1cfn9n46CRV2EPFeDhrMDLWt4UXF2qjtc3S
         K77nvE+YbYjzBddFf7TOACEg5EZPk2sgtkEKV6uC52sUFJW2YTY3R0rLr+1rMWHNuVHp
         CGznw0rvKcSjcC6vGfigkW/kNh+VZjssSUnpMpTCaQGQT9YapgmgF1cPUM8vPQsFXFQG
         tAYA==
X-Forwarded-Encrypted: i=1; AJvYcCWLgFTpVMdr8dMHi8DN+xrJJAy8tHo/lUbSMqq6r32jRZ3PokZnC0CGqzkNDpToGkwvXA/4zlzXZkyjTv5kqocr@lists.infradead.org
X-Gm-Message-State: AOJu0YyneH4nVLAarhy0XMGJ42mxJaz2CfqzdI6I/a1El1i+Hv9k0vC2
	79GZwi1QvVhCFf0AE0cUtOtbIc8Dt2b4VEE/Kut8mt5TtzwtXVR74klYkSnJCFU=
X-Gm-Gg: ASbGncuWMIv7J8SKOhWxpiuxtu72amMwM0wGYSm5IGbPvcGja3doTSvaxyotQ0zfCeg
	iLLAwX6mv9z89nd0meIefRlf24U9L8GWfvB2kD9F/xS2vUnN0MSZ23ALDt5Wc/4Rp3JISdUmtIE
	4/oruRkB+BAokPHtcs9ZJjY79FZCB8GYHeLE9zYnwZ8cI5hxDvHU//MebXCfzHtPqeBXauFiVlz
	vuQ5OxyOApyy0YwT7Z3OGHEl/dpe47amP7fbY2ZwcYpJoc8eJEwCqjC5DfL1P9+XdZRwVJf63Uk
	fWrzaFTWmbgrsg8y/hY/85JhggMz
X-Google-Smtp-Source: AGHT+IFDv6yPrrMdiLufyHJiRsCS+tNLTAQN7y7Zs6wjnXNJFvDTqtBqNWJ/t9oqV6eZf1xaBL1XqA==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436686436f9mr515572745e9.9.1736173508239;
        Mon, 06 Jan 2025 06:25:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c639sm564181945e9.31.2025.01.06.06.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:25:07 -0800 (PST)
Message-ID: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
Date: Mon, 6 Jan 2025 15:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.14
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
X-CRM114-CacheID: sfid-20250106_062509_721522_9982BBB8 
X-CRM114-Status: UNSURE (   6.92  )
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

Here's the final DT bindings change that will give 100% success in Amlogic
ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
via the MMC tree.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.14

for you to fetch changes up to 960a4140ade8f6ba44e78dc40b80bbf272027805:

   dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC (2024-12-11 09:49:49 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.14:
- Document the System Control registers found on early Meson SoC

----------------------------------------------------------------
Neil Armstrong (1):
       dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC

  .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
  1 file changed, 14 insertions(+)


