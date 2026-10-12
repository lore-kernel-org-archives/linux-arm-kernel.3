Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365F6CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=; b=t7zTkk3+PTVU/NjRyvhy0dOp+V
	KGVCKYauW520lk4EWiTk0xt0pLkjg2gNLK1NIBE3g7DjkkCQ8/BnO+HKA83BbJuWAjSGoyckaEcMd
	9JFES08lXUCus2azmOQthFhhkDyTg7KWiuFf9NX1wVPaS4aXxmWrp6PfRdlVTM+eM4AtRnaJ4Bp5/
	4ivmGa50hAlwtwsnDpEeODmfJxiPiQKMzCv09Nj3i56ZvU1G7CiVqqlwGcKI8VNUyf/zWAb6YsNNH
	JPjS+jdL2krrbMPsxu03B2WjA++l+MCZ6NpLSZIsHti0QJ+poI0IOtGjT+O5mnjRqdvhykt09UZdl
	OnTTf1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCHx-0000000A3Jt-2sBp;
	Mon, 12 Oct 2026 09:25:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCHv-0000000A3Ir-0bUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:25:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so10059945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797141; x=1792401941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=f/Dpdiko/zd+ypqrFLoOyPi1S2bP4AoVOYf3HCvdieIDuqmk9ngHUItbUQcX1kBhag
         oABl1mXxV/IrTi7naU8pmYAWFqzNqS25OnLfPn9A6sYgUPlwOFDqeQebHwIjk8SmEr9a
         +hN6QlHQAjvIMmvW7mwKT2vGs+0q9rj3nJFD1TQOzJ4E+EIEHLVuMI6lhZptcrCyJcyC
         tFXXHO0EK/ZILlv/8rExu3GwU+nrACyT61tFOZHVfdcTB6pGiEtUe2Pw/RdeQthHYhT6
         BHJrWad+NoixMmiylLcWYoPYw6rOZ8Y75M6imbZfNEJ5twPDYhtQ4vfCPFaXEoMzn3Nd
         b3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797141; x=1792401941;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=DOzMAlLV8QJARk1IIH6tuUHWzAfWF4RT3OzmuIFunAIISTSysXwOOOVI9QbRbU0WLe
         p7I18PnnwNZ1dQZqthGqMYxZBIfpVky5cXUyhN8EPKAEQpuKqwew1cgLrKcPjGvQ7uD0
         tT5D8b0LSzHqOZtP/6AJZpJrZ3hhRo1V6NDgAHii9bl2upTq39F8T1JUd2Ynu4g58woo
         VT0K1I8WSgNeSDZhNQbLaauvBxrdbFLAC9X1kfmzhhBrGd8+xUUyLsZsMg/Uglz1IFmF
         8yb5unVM56aVU97NJeEYmZGGUkDQqLTwKrDAGTM1W54VPkFot8nlly5vBddjpakVEw7M
         T7+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmVpb9wTGAfO69PqCEMBD6qKsvp/3YxtEgC0LxzP7AiApChK2HFcq+k6pZbnfCUXhF80j0cg5g0q15WHR3eM0m@lists.infradead.org
X-Gm-Message-State: AFq9FYLsusGjIj2buli01wY2KvEM11iC3er6hAO4IenWXGKNRNg9qyiZ
	5xXaNXhDQkFPe2TAUGgArFdXxDf4KkgkZE/ohKyEsdpaTlTgVOTOa0LYLI55xrWLmAg=
X-Gm-Gg: AYBFou0ahiOIx2RUabtOhuIFjS7BO4guUN5CgBO1SdtVPBl3JK21itf9GYXdtrFh+/j
	Nk/KQXH55NXx4LzdmZ3kYkgoZHrSZiMQmFS6hOVyASrftac76RTOG9kCLEXqM0bwdkHPvWwv3JD
	NS5O9jGyWTkSSEWrMmI78jMAovetTfuRy+x7jWHLWVOKrWgGvjHha3OI1sTFWknsQdt3rHPXqAg
	NEkLSsRp1K/TeJJCJlRi/mr9KBGdO4F1OB6YfwIiFcSKfrXF75JYcwWxHABH7Oq4XEG4fCfjIj3
	I8+n4KeRmVJ4g5Hp2AZRaNqd5Vv03IxgNFgrIoF8l+k4POzIGjbXn30WbvN23KuEQmBpGfG3C3t
	IVc5KeNbUM/kRYOq1T6qcuv/mETMxQw3gt8vlcKFIB7RVkAZt2JRZGzLwmNIYscvLrTWF+dHxgE
	snEAjC8AL6ggUBrT7qWNroqqT1ZdBD1q8quMuQ+8TtxhumJM2Cd/JDgW1StgvV9sL9KTG1fmmqi
	FV5lPOV6JbSmUKVlvoTuTAu+g0HbWgWj6pez2IoLlipO255R4I=
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr153244585e9.23.1791797140983;
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm345518685e9.4.2026.10.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Message-ID: <255fe08c-8d58-441d-988c-9145f0995c6f@linaro.org>
Date: Mon, 12 Oct 2026 11:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
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
In-Reply-To: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022543_213381_7B85C6B1 
X-CRM114-Status: GOOD (  12.70  )
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

On 10/11/26 22:49, Martin Blumenstingl wrote:
> Thank you for your patch!
> 
> On Sun, Oct 11, 2026 at 8:31 PM Fil Dunsky via B4 Relay
> <devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
> [...]
>> +&eth_mac {
>> +       reg = <0x34 0x6>;
>> +};
> Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
> to meson-gxbb-odroidc2.dts?
> Odroid-C2 would be the only board using it and u-boot seems to derive
> MAC from SoC chip ID/serial number instead of reading it from eFuse
> (so I'm not sure about the status of MAC address in eFuse on most
> boards).

Odroid C2 has a custom efuse mapping so it can't be used on other boards.

Neil

