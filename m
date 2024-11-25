Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC76ED58D50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=; b=oPkZd8qXV+0fJ2IVSFvfqY/0fe
	I3puvBgKYzAxcBsWdAIwCm+ARDbBvlD/5G3b8bSZgow1CTKbGu0+R6KqOnkPNkhO949DCfauAeuS1
	fj6g7elFJUyS2njozdp5upnoJbwgW2SG8f5+Pn9L5uedcpZ7GubEWcaBGAtspZTvKWqMyTPE/rmpr
	lK58oqKr9qHrf+WuHBJgfP7qhuyYTK1ADvAf9L8KLlHBJuUb3eL7dJAmC9mBRvfxTbl60uETJWeVF
	xpuyvU86eSFYwD0gTjyz9nzJ5rhcImvEumkT1fufLswLdOgOVf7W+L5cP8PGMPPr4LDovZU5/7aBB
	Nzj6xsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaAv-00000008Jl5-1pMI;
	Mon, 25 Nov 2024 14:34:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa92-00000008JO9-2dar
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:32:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-432d86a3085so41696815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732545175; x=1733149975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=;
        b=lEUV6H3V0MkYVlQHptweXy28ASLm5O/DkxNKwEve9PxSXO9HORO17w7hbtaRH1tIHN
         GhGGVGagsYBVOnidQxw4ExyYuJyoD0yHBjDXjr4mpqdO0Ma5PbdjeuTDp3q3ssZ6Ucio
         oxhTs/4z7FEXJLdTcpYMhfCbNJkMrSgcaHDuUiIc9XMDtMSnZMjjHhxt0agQheOhtB/r
         KOsQ58KrdeXaRshdCDM/cUqgb27GqHo+BJbL/1a3g8wuOX+rQjZtejJtICXdr230nP7X
         tek4TbKRJOBy4+XnhBIDbFsr7+zm5gA6jZbBAOtXr19Vnw+OfJuh+nEMFCs/uk7hZhLI
         tZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545175; x=1733149975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=;
        b=dLNOd0th2C+P+FpA0Cu76Qvbb7jPqGkZrim4faBctrC/tlPWbLYhBpACZLuYHUOFVH
         VyFSX3MPIJu6NyO5xcdPQH6UQfh+Ud+VY91wGX9tudSKD3msnMF/uUOf87G2P8Wjx6Q3
         6KWwvtejqKeVSf1N8Zdw/UnBJrXgI2kuyxbnMT8XNnrv3PlWjbfOPDmarHQv+muX86f7
         gx+FkJ8Lyrr+dl+kY7ASrKwHFHNMc3MmUlXAn5feM33MhL/AICZI1RXxYdRPMgsB8eg8
         1GFER8hZdl0qjD0c7//u/qpmM7DufzXxMnTmQJrU8Zh26QvXMDuDq5af5lGWWjvCcoq2
         nSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj0Ixy/+cV4pvrMEemka8obNrdIOpxSJVcgkTvypbVNUw9GKcJ1pKXUtKs6MJyH9CNIgkYmd5TC/fnBM7hnxFc@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKw/hxvO9jIxy0KPJaAgEmLBt25bOzoQJvdD1v1HuZL+ads0U
	/6lydcJl4yPJUcnV0hcfQyprYV4bFS1xQ3AKyMXbK6VRCxU1qZfkuT879j5DlmE=
X-Gm-Gg: ASbGnctlia/Z2u3rydjUw9QoXjRlDbJ22hyjUFYVGQFfVeC9dp27AqqvCqkvDjzX92J
	VHkv4S9utCcgqtWyU0QVGofC24CLYMhxaBHLrdKe9uFPWYZ0kBplKUos52lYrd44V416ldWluPM
	aRwZsG0YAFIuwTdMVQ0u2CCrKjbwMfaE8TBU6B3E/APAQ3FBkblHq5Z8xVKtzPKW1w9uwiEHcpo
	YZvZOSvIT7XuofdI2zd5NsD0GJa3jXLz2lh11Cx5xTbyYcWdaSSOgGDHyAAbt0=
X-Google-Smtp-Source: AGHT+IHLpdEqvHkFDrmf7iYo+O6NcGKzmFklgROp89/Mv/+qWdOXbu1wuq8DK5pShhF7HXcnisT0Zg==
X-Received: by 2002:a5d:588f:0:b0:382:4851:46d2 with SMTP id ffacd0b85a97d-38260b45c95mr12173123f8f.1.1732545174756;
        Mon, 25 Nov 2024 06:32:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb36612sm10492934f8f.59.2024.11.25.06.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:32:54 -0800 (PST)
Message-ID: <7876986a-0164-4004-a8c7-43439e30fcbb@linaro.org>
Date: Mon, 25 Nov 2024 14:32:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-2-quic_vikramsa@quicinc.com>
 <20241115165031.GA3344225-robh@kernel.org>
 <0234971e-9029-4371-a0aa-7da835591351@linaro.org>
 <f1ff6df1-89f3-4e63-bea7-2404fefe81f8@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f1ff6df1-89f3-4e63-bea7-2404fefe81f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_063256_671912_354A6CFF 
X-CRM114-Status: GOOD (  11.23  )
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

On 25/11/2024 14:30, Krzysztof Kozlowski wrote:
> On 25/11/2024 15:18, Bryan O'Donoghue wrote:
>> On 15/11/2024 16:50, Rob Herring wrote:
>>>> +  reg:
>>>> +    maxItems: 15
>>>> +
>>>> +  reg-names:
>>> reg and reg-names go after 'compatible'. See the documented ordering.
>>
>> Rob, the documented ordering pertains to the dtsi and examples not to
>> the yaml right ?
> 
> 
> The coding style indeed is explicit that it applies to DTS, however same
> rules apply to the bindings as well.  I just did not cover bindings when
> writing DTS coding style.
> 
> Best regards,
> Krzysztof

ACK, thanks for the clarification.

---
bod

