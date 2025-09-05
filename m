Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B793BCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5vez/qigeUN3N+Im1RmVn0JRRYgZnIjim3ZE3xXKic=; b=XyBHRS9Kl8y3mNE3ZVJnrE5Scd
	7muqCLvzcya8oTTG4IhPqbFxNDtgcOYXE/uRNpyy+RNF3zjl7Kw4wxPhENnOPAvVgwVl1BwUymiJK
	E8ylv9m/H1oe0vCycSKy5Iv2eGNn1kZGPUA6xqdIpP29k8d5EbWq6JL55UUNyH3UFIbbGZVnse1jO
	ynkmSjDA7EDH5NllR3QLwN8tVEARCqU2EvbklbsKbabPl5LPV06Cs+l0DDytgWxWM39TFmYZzYbXS
	u2/RiGjeiWOYOmhD108jr6PM58d8lX1Njp/0EzgqGlVleXnkjmOJDOogcCmBsnMZfkI+kP9jLT4w6
	un4VnTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEn-00000002hJ7-1teN;
	Fri, 05 Sep 2025 15:20:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTYv-0000000116p-1GaS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:20:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b804ed966so8056735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757067656; x=1757672456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5vez/qigeUN3N+Im1RmVn0JRRYgZnIjim3ZE3xXKic=;
        b=L7SUZuBmdg3y1NOxehyVMJOj4MqHY0oQlBglsgsVeRwCp6HmaE1RS4anEd3EznQ9EA
         4/L9JTYjKbjPcEd228ee48LLkeH6at0NkI+IsU8C1rW81z33p2brfNnFh4MDx9D/mvy6
         cymYvYVFPt1zEiJ6ftkK+7ot6QnePhNJFoQOXoDzXuLxTzspkkfmhrq97cdIeqZzsU7Q
         PQ62XK0cl5Td5ZrA79L5LOPoRm4FY82H+fndjDchGtH0kbab6ZkwEgGeRM82Cx3aW7gs
         xdxrd9nrUAivGcrF9kOcg6QCpf/mnzVCVrkVBPs526llK9GI2nt4oyjOFjcmz3tNDUWa
         yixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067656; x=1757672456;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g5vez/qigeUN3N+Im1RmVn0JRRYgZnIjim3ZE3xXKic=;
        b=vCpAqVNYKfhSy2dMxE66p6Mh3GIhc96+FtMekqBJ1BPdhBkfmC9obLrJi+quANU+df
         jDtbEbwIuJWbV7irLBHLpEL3O6BpBg2Wm8i/xWf8t5VEqHu18HbpLFlMNT/DOFBU6Kam
         D98ZDM17Djd/bmpp0BvxCyei47Jfc/PoGOlNJkHta8m8bh85QhQMTUUN3iVt7b8fvDEp
         9y5dpyEx+9DlsJCKp502aDjKhI/DWpLaAIAVK+MnNDj8LPr90+97CsVFuTopJqnmrqH+
         wVWpZb0yoLDjAdm+gS/mur6mSOnpfBFgeRhFb4Tx3oDW6vLClWmIgZY07D5VjG4THTrf
         liGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTH0tvSppEUcOGorBeOLawYOkZ+JD1qUbJzdRAZcmSUrS9eDYMfbqQA5lF+SO8TX/pw1pFBP0Q0Ogwuumy+n9V@lists.infradead.org
X-Gm-Message-State: AOJu0YyhRhqRPaIK1fCETiA0EKxweegppnE/B77E6+WkiG4wdl2bhv61
	eIwb3sPffR+ZB5FFZXuZi0iuOZOPDKAjL2ev0fgSuM0hhJnsbP67Dzi46k4NzKL0poI=
X-Gm-Gg: ASbGnctwzCHiIgmJC36Xpzui67rMGItabw7nT8atBqYbsSdqAKQyM8DdlxtCh2W3tZ3
	x7DcYV5HjXVfG8hEiwHVVp3yjUFeWHVdPRF5pZIDpmyvFazXJEZcRMsUornwuYMO45FZBzpgz3v
	ySFiClay2vN0Me8elxph8c6IONuFGmZP7ia0rSl3PgXjSvh2CUh1tWCKEqqGRE1xPJqxHCdutNq
	sr6oQpEFRDqnKRXC05ujGNLcQcHLzL8mSc+1ubRcXKLWiBLGT+w92Twrg6jaS/ZGriux+T/FUo3
	MVKsmqA+QcV7X1xE2M2R5cLyyFhsLUFwOSQ2Hg5LW+lUrUpL2CbWIhwN3eyxKhxcS733Wr5xF1V
	vayFv9lPueIuPGRox6La3/0WuVb1TAG84EQjcZWdW7e95kuDGhumdQlBeGue85AiqD4Kml01z6N
	papD+dlbplDN6br5UQOWfO
X-Google-Smtp-Source: AGHT+IGQiU+kRp+7oSBH2pZIbGwL4AQMXeMBFNpTuAKX09/3FoPn8L5rNkO2mZKlz4GakzCW+U30BA==
X-Received: by 2002:a05:600c:1c88:b0:45c:b52d:8d30 with SMTP id 5b1f17b1804b1-45cb52d8f28mr86216625e9.26.1757067655677;
        Fri, 05 Sep 2025 03:20:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ad6e:d9be:21dd:7b96? ([2a01:e0a:3d9:2080:ad6e:d9be:21dd:7b96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb61377a7sm115282475e9.13.2025.09.05.03.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:20:55 -0700 (PDT)
Message-ID: <32d93739-0ea9-4b75-ae73-c0c8b10f2c3b@linaro.org>
Date: Fri, 5 Sep 2025 12:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/11] Add cache information to Amlogic SoC
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250825065240.22577-1-linux.amoon@gmail.com>
 <175699250964.3374853.16885676491827667777.b4-ty@linaro.org>
 <CANAwSgQGCTs46DVm3gt4PpdSTBTvVg5zga_oBt=rUJh2yhRLtw@mail.gmail.com>
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
In-Reply-To: <CANAwSgQGCTs46DVm3gt4PpdSTBTvVg5zga_oBt=rUJh2yhRLtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_032057_362139_0688F759 
X-CRM114-Status: GOOD (  17.77  )
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

On 05/09/2025 06:01, Anand Moon wrote:
> Hi Neil,
> 
> On Thu, 4 Sept 2025 at 18:58, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On Mon, 25 Aug 2025 12:21:40 +0530, Anand Moon wrote:
>>> Most publicly available Amlogic datasheets mention that the CPU employs
>>> a architecture, quad-core ARM Cortex-A53 and ARM Cortex A55 and
>>> Cortex-A73 and Cortex-A53 cluster, sharing a unified L2 cache to enhance
>>> overall system performance.
>>>
>>> However, these documents typically omit details regarding the sizes of the
>>> L1 data cache, L1 instruction cache, and L2 cache.
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)
>>
>> [01/11] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
>>          https://git.kernel.org/amlogic/c/d7fc05da8ba28d22fb9bd79d9308f928fcb81c19
>> [02/11] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
>>          https://git.kernel.org/amlogic/c/fd7b48b1f91e1830e22e73744e7525af24d8ae25
>> [03/11] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
>>          https://git.kernel.org/amlogic/c/a4428e52babdb682f47f99b0b816e227e51a3835
>> [04/11] arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
>>          https://git.kernel.org/amlogic/c/3b6ad2a433672f4ed9e1c90e4ae6b94683d1f1a2
>> [05/11] arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
>>          https://git.kernel.org/amlogic/c/fe2c12bc0a8f9e5db87bfbf231658eadef4cdd47
>> [06/11] arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
>>          https://git.kernel.org/amlogic/c/2d97773212f8516b2fe3177077b1ecf7b67a4e09
>> [07/11] arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
>>          https://git.kernel.org/amlogic/c/57273dc063d5a80e8cebc20878369099992be01a
>> [08/11] arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
>>          https://git.kernel.org/amlogic/c/6d4ab38a0a21c82076105e4cc37087ef92253c7b
>> [09/11] arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
>>          https://git.kernel.org/amlogic/c/494c362fa1633bba127045ace8f0eea0b277af28
>> [10/11] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
>>          https://git.kernel.org/amlogic/c/e7f85e6c155aed3e10e698dd05bd04b2d52edb59
>> [11/11] arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC
>>          https://git.kernel.org/amlogic/c/e97fdb9b8a0f8bd349de48815694f8a7200e3d62
>>
>> These changes has been applied on the intermediate git tree [1].
>>
>> The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
>> for inclusion in their intermediate git branches in order to be sent to Linus during
>> the next merge window, or sooner if it's a set of fixes.
>>
>> In the cases of fixes, those will be merged in the current release candidate
>> kernel and as soon they appear on the Linux master branch they will be
>> backported to the previous Stable and Long-Stable kernels [2].
>>
>> The intermediate git branches are merged daily in the linux-next tree [3],
>> people are encouraged testing these pre-release kernels and report issues on the
>> relevant mailing-lists.
>>
>> If problems are discovered on those changes, please submit a signed-off-by revert
>> patch followed by a corrective changeset.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
> Received feedback from Krzysztof to omit the comments in the commit message.
> Should I respin accordingly?

Sure, I'll re-apply the new version

Neil

>> --
>> Neil
>>
> Thanks
> -Anand


