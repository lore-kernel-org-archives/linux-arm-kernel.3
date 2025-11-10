Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C774CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD4y8dFL4Qc3UIMVu1ByWGHKasnWIhJOmctGKB7rHNk=; b=25TQjdWtcdEiGDEG5HCWOfrXUM
	xh8C3DbU9BKRjlgC7fjSqpWCjhtVge6J4feWgYKS3/2rpK08/wsauz7LNiEiI9b8zrJxmP0aFeB7w
	wASoE6ayaQv0w4AsIR5DhZdju1Lpr0jXkvX3M1NHx1yoPkoH8TawAeaPMlGZcKQni8eQFCTtW/Kwp
	00fik9FtqsM0MUSmBJQowJPxSVdmYRBufVUVWGuZU1p4UKyT0JXRMvoEmF2iaRgik0EffLRFG0fq5
	Y1Ztq0fRvO4XRz40HZV1/WoltKRAyXSdgS9BP5FYzdiT4cC2dFZTjErsBtQizM9yUTiAencJIs7y+
	Rj3jboBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILZk-00000004qFs-1C55;
	Mon, 10 Nov 2025 06:40:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILZg-00000004qF8-0UGr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 06:40:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso7912385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 22:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756822; x=1763361622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JD4y8dFL4Qc3UIMVu1ByWGHKasnWIhJOmctGKB7rHNk=;
        b=yGl7KvVlAvRtN4CEWrhwdir8DTZ12uCadjpuiT6hfh6NYfD8ooQQvgyWfMJJ2J1h/T
         0fjqBLV63O8R10Lhcfegts1zoShy4b2ljc3MVDF2wHHI+G+7GR61s5DbaK/hzwzjOoMM
         zxs9p9VYUaJdi7GXD9FFipgtvEmDdvwPYQEqzOvLtDPTlgQUFLBwC+4XzIGefMJu7Yi0
         Mh4NkqRs8rQRNDNqKPhalM7NxQ6FFSMa/6efLfYB5dHaRU9oey7XljJ6doyXBkZ9gvPs
         nxMbdLAySE8c5Pl3brJuxYS4W/dLhbZeVwTQVjv+xR3YYA8G68AWuur+c7dhGAoXE86t
         cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756822; x=1763361622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD4y8dFL4Qc3UIMVu1ByWGHKasnWIhJOmctGKB7rHNk=;
        b=FkyHwxNDHXLc73P63Dicgt7tK5rhmN23YutIB4emjmY2TRL9a+kuDq7sd2IIEbt07V
         FTOMt1JEJTA4yOs5kXpdDFoB3n16JCm7ig3nz4ZJcASkHa/wdUxvOCuk46Ks1Sxpbefq
         WkPCOWMJ52Am0YhqFfSIDJobe3o4Hmw4+H4+SPQEAcbZYv4JwTl1XVoh/HQBIyJlmtGQ
         WwTluqVnThJOCJcKDkODiByRhcl6zT0BUmxea6MktLJ3hBzTCAIbB8PE7Bu6mSQXH1rf
         eiZcWAZGYaNXyyKUwnR5OVQSsOgk0EtNtOdNbQwehQVgA4vlUcARXDDR+cp3frbB2Pi1
         60HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWetic//aPtaDydNvqJSyxeA5vw4RWcvOL+YofHLq0ykggDOFLu1tDH1PdDkIKsAHPelgb889fg/gl4Ld78WcyE@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSEJYbu4G7FgmXQK3fnFyqqUqCQyzNmj3VKo2ZturEBYCiMTj
	iib/GE2YzbFQANoz0Ty0dSDN9ZK2ZUXzDgreTcjN+LnsnIvYU78ThB/BjvDDYPqEd4g=
X-Gm-Gg: ASbGncusG0mzFnTJf0s672DvTCKHIDFENubQFXSPbCnFN41uMhxcwScWsZJiC/zhQGu
	dYKrQqnLbKFGSRKwNhX3mTN7EODoU/TPm7HQZLHSdKIUhNmu2daY5Pdmr397RP0JHk1QZzEu1fO
	QpZMID0AQ2H58bSgD88zWGN50VrVb+v5xzHg06KrwepYyAYEKLRumSzrRYGNwv0ED+6movaPtXn
	c/EaWLHEzC1+hd+mqCqZwV8snSMzDwMDpllbnc9Nl6IjllPF5fEiYcLK8YK4+7eq8+bLcoPyk9L
	TV+ZlbmzK0w6p9coGcP26DVlPjGebGbOotrBUcU7iw/u3pVpCSpIiGGg4GclfVJno7aXDwJl4OZ
	jn2xoWCHTlBwWqWBBHSmhg0F8Ca3aQut77Fqr66UwhclzjxRYxy8A36/C0OI6O30UYJHwq9/rYx
	BqxUVnAPBvNJbuPzBzLkNoO6hmKSUYa1bMh+keDUy7h6ETObFQ2ztDY9SydkTk+Vw=
X-Google-Smtp-Source: AGHT+IGOz9+9CDJ3QnsnAcx96wfbo8Uh+Kija8Qn/BBtDb3lYcNFsN3pjUBwX1/h1H29lxDD/6wJ8A==
X-Received: by 2002:a05:600c:4448:b0:46e:206a:78cc with SMTP id 5b1f17b1804b1-47773290517mr61287685e9.28.1762756821769;
        Sun, 09 Nov 2025 22:40:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61? ([2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763b5714dsm111549355e9.0.2025.11.09.22.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:40:21 -0800 (PST)
Message-ID: <b341a3b3-c215-4335-a962-799a64a3c1b7@linaro.org>
Date: Mon, 10 Nov 2025 07:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
To: Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
 <20251106-positive-attractive-tiger-ec9c1c@kuoka>
 <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
 <65hstqcfcca7xj3cdtq7iikcdojbltfu42zlfdelskakesu3cd@hl3kydp6dw2t>
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
In-Reply-To: <65hstqcfcca7xj3cdtq7iikcdojbltfu42zlfdelskakesu3cd@hl3kydp6dw2t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_224024_265466_F622672E 
X-CRM114-Status: GOOD (  12.87  )
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

On 11/8/25 11:40, Manivannan Sadhasivam wrote:
> On Thu, Nov 06, 2025 at 02:37:17PM +0530, Manivannan Sadhasivam wrote:
>> On Thu, Nov 06, 2025 at 09:30:15AM +0100, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 03, 2025 at 03:42:58PM +0530, Manivannan Sadhasivam wrote:
>>>> On Mon, Nov 03, 2025 at 10:47:36AM +0100, Neil Armstrong wrote:
>>>>> Hi Mani,
>>>>>
>>>>> On 11/1/25 05:29, Manivannan Sadhasivam wrote:
>>>>>> Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
>>>>>> have region for DWC controllers as it has the Root Port and controller
>>>>>> specific registers, while ELBI has optional registers.
>>>>>>
>>>>>> Hence, fix the binding. Though this is an ABI break, this change is needed
>>>>>> to accurately describe the PCI memory map.
>>>>>
>>>>> Not fan of this ABI break, the current bindings should be marked as deprecated instead.
>>>>>
>>>>
>>>> Fair enough. Will make it as deprecated.
>>>
>>> The true question is what value was being passed as that item (ELBI)?
>>> Because if this was always DBI - device has DBI there - then what
>>> deprecation would change?
>>
>> Nothing, except not breaking old DTs with the binding check. That's why I
>> decided to remove it in the first place.
>>
> 
> Neil, do you still insist on marking the 'elbi' region deprecated than removing
> it?

Not really. if the original definition was wrong, let's fix it.

Neil

> 
> - Mani
> 


