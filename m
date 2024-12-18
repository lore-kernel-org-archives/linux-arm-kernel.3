Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FD8E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iGiz2wtN6cQxaer0WsA2mvybwMcelhlrvEDD3oLxkQ=; b=LRhlseoHEJNIrhwqoPj8MjVXVb
	ki0umHTfAKG0HWKUK/0OOIl9FNkVFOWOmESKK0oeAszWY8GGwzXTXQmdyXjyISByLbTlrdiBrZ/q2
	Thf97Kc9DCgUxZFDBfx+WkzSc6xx70O5T7jEHZzkDDQq+sVF9KQzMWJMbcS43al9TBm9jdAZNbyrU
	4OYUourpQuFf7bP3vd4FixhdGIX5SXheNoXywpmOcdR8aUzCOW1jZK/n0BQoZCw0smkdlUTJ8iwF0
	7VoRxvqEtZICEo1+TYD0aONn/3pjhq6Dm1XLm61+nQEwmKHyFHcn0ko4oa4l0M6L1RxwHwK0ccdpI
	BM4nFiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNu33-0000000GiuN-0OKY;
	Wed, 18 Dec 2024 13:25:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNt0k-0000000GZpz-2j5H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:18:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361815b96cso42817715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524319; x=1735129119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8iGiz2wtN6cQxaer0WsA2mvybwMcelhlrvEDD3oLxkQ=;
        b=Cy8W46FVruaaE+XUlmkdvRwKmRP6okmV+/oy/PImdMVaE0QkW6mU8fO8G84ATPWAFz
         i++quLtenjhA32GPmDEsGMtYI3PreuCEWdCjD3DsAUhJ72DPw4Xjf6ksh9kRMW6oaqy1
         KjVS6YXDHcYpHEHzNgUtjvv8u7JPHUNvIrvihMQ5etUgrE4oe1b+pg83l8gINOH4DU85
         kGzrVAtd7CEGQOkCo5QHKi2TC8BwXwBzb7jHDtt1XrFvcUUGBHyPTX7o4ZqlXHVWmtV3
         qVDxNc4HwjddSBk+EdDUsxlLyhzD7/PnFMzBWP+4ZGhCXlZwe3fyOUTn/aqYJRDO9DRj
         lTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524319; x=1735129119;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iGiz2wtN6cQxaer0WsA2mvybwMcelhlrvEDD3oLxkQ=;
        b=My8BoI6MdyAfMwPYiYkulZ2FpCW5nVHEahmSwfOgB9NfPAtJgFPeQE50R/eaJKF2Mo
         8//DnIa1svuULxCYZ72TUuNDKdHltafYi9HHXGxDxhq0UK0f7Hb8v4wuPDBUB0I9pFzJ
         vBkdwx/LKJHxhvyV6eOors7fp1u/5pzKGh707Mgfh1eOUkTpVJFgk6gN2XyMimdaTfmc
         BgISXGj5aSjzhy//3yBQRxvgoMIFeVyuKExib4Pw4ZNG3hpMXbvjltK3/uJ9vmd+q2Rh
         XW1aykfV5pE3QaVXEel+pf5CCRc8sv02T87wxKDbCKM8aHHQDE72+8SmpLG8BncNCLNW
         A1fg==
X-Forwarded-Encrypted: i=1; AJvYcCUYKpzOSidMU4y5lYUq3mUfosCza0GxYZzZ4hMFAQOLRzEPya05kE39yrluTO4GFwnd1NUxUdQWj/pRUirlm2XW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzus0ztSE5UAqyLKUrlJMOpLV8n6pkkL2DcU+A55yw6f/1QRIp4
	a5Prf4bY0RIShx/E7ej8P9+Gw03DxQotCqcivx/CH3GZpSmemK82oeTsEsmJiiQ=
X-Gm-Gg: ASbGnctW2lxCYGNXTTXLe87Sjxz+Gp5l6EDGlE53zk7NxgoeVfBi8oXYswr0RCxQc+Z
	BpeZp58Reprb2lBs5ENK1ndaCW1fGrsqz8DmyRijpmcMHCALtqM4HIDs7cKlR61uXben0UMd35W
	3GAT/+PnpOP53EXdBgZrSNgm6tx2NZQ/KkqkL1eRJClrgqDZ7xgSC1R/V+/2OFF1yvHWNDEeGmp
	kDHz6rIlgJXlVXTd/gGUCE5J3HuiuJV4KiMb7isVkK/RXXmYanmdImTWF6UOF9pn8ILfA==
X-Google-Smtp-Source: AGHT+IEcMnXSi7UDywqFLxWjgZ5pGPzgn8E2LkOV2zMI5Kyif7I2RM5iM7av/dsEhBaDUJWGgdltzQ==
X-Received: by 2002:a05:600c:1c0d:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-43655360de5mr23073915e9.12.1734524318825;
        Wed, 18 Dec 2024 04:18:38 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8061038sm13761708f8f.104.2024.12.18.04.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:18:38 -0800 (PST)
Message-ID: <f7bccde8-80d9-4be7-b280-7d171059b4b4@linaro.org>
Date: Wed, 18 Dec 2024 12:18:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
 <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
 <23ae6fb9-2c66-4d16-83e7-d53c1a6685c2@linaro.org>
Content-Language: en-US
In-Reply-To: <23ae6fb9-2c66-4d16-83e7-d53c1a6685c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_041842_691660_F6DE5972 
X-CRM114-Status: GOOD (  11.36  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 18/12/2024 12:17, Bryan O'Donoghue wrote:
> On 18/12/2024 11:36, Dmitry Baryshkov wrote:
>>> Agreed.
>>>
>>> The commit log should make clear that the ABI hasn't been cemented yet.
>>>
>>> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending
>> If it hasn't been comitted yet, isn't it better to post a fixed version
>> rather than committing a version which has known issues?
> 
> Yes.
> 
> - yaml
> - driver
> 
> are merged but
> 
> - dtsi is not
> 
> So we can still change yaml and driver prior to fixing dtsi.
> 
> ---
> bod

Excuse me; prior to _committing_ the dtsi

