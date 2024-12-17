Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C157AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo1L5JuECv1Uk0Zo3Q9bH/rFDrzzlC7TTsvCSw2yzfo=; b=FWDetjJSBLFbaDI1S5SI4PWfXP
	bYBmBG71ao4yhAgYBYs60BoGihlX88efqmDagDTxHVOPJKaq+M5lq61/ORBlsOqf8RnCUco4OP7ki
	HOQo37B0dYT2fb9+oKcRMRKXyuzggd7is+sGwSFhkURzuA5Top4rLZEmr5yyvnylHp7iCxiW/4xmC
	2oh4mjfvy8daac9zz3eb32K46gONmLPB33s08kA3WJUWruQ0RuVD1cf8FFFCbrWsSIbeIDkfvkZ3M
	ocV869R1oQLmVI7/FgAv1SoyhmVBe3nEkRUP96lIfLnNCU1GU0/S8z+uP3Ad1WtmvHgz9V9QpJ3VC
	Klqh9axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNacY-0000000EE8t-35s7;
	Tue, 17 Dec 2024 16:40:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaT2-0000000EBZl-12ot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 16:30:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361f796586so61685725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 08:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734453039; x=1735057839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vo1L5JuECv1Uk0Zo3Q9bH/rFDrzzlC7TTsvCSw2yzfo=;
        b=oy8rNAIfekIPlvizwUCDuXKu9ggL+9kvTmR8hKDT7qCaPfswu/ZLXBjjMInRshhUxc
         NakasBHAlG+or350cIHBSOtE1Y0MEqnXg67ZW6Ri+RHdsFGsL6Zo7GklrkzkpkWm/oqx
         a82tZ90KgBR2IAxty1S+9KJkJF/+mm1xPMH/f65CGIHF7/CpWth2C0GWoueZNBgEM44q
         t8mF7RKgSc4XfelbrE7FdUjnfNUVyQbY1eAUaD7GAWHQY61AyIaNBtFxyKTD01UzmLg9
         9mZNA5AnyrzikYvtyK0tPn3Qq5hkZdMdtOVsVtQlgE18FECQ2tQj+ZO2zubtcEzBtmCy
         mK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453039; x=1735057839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo1L5JuECv1Uk0Zo3Q9bH/rFDrzzlC7TTsvCSw2yzfo=;
        b=tqX575L6V1+nI9t3kZ1QxYoYJe+1fxrPR+eKRZT1pM24vyQRLL0Dt3e0XgfK4I6QND
         l6KQQBAepHda5Uz/AuQ/d9ye6ICpFF3znN0/z2eFbDZYb4y1/iTGTY8w/9zQaYHUwZPC
         7yP/mQiZMo0Z8ttSd7q6bg9emectDwoZeEr8xq0V4vZMDxNXU1yq2zMk4mvtKeFkuEVL
         jiGWkbvqqi2dcuok2+D+NtVGa8L8Q6fBXzA3JxvLx6U6vCzca7FBW3lPcAnvW/NGS6Yy
         E+KhxPu6yvBxBmiXTe/iZkg9BkRcQUptRWrjD11WiuQNXMO5rokH4BSM8xqYSxGI1WCV
         4bdA==
X-Gm-Message-State: AOJu0YxJ5dMM76w3STp32iH1EWQ2XU/INC5NxuSayaegGfo/jxlcE+F+
	PRrznyAusSac5HAeziqseksKt4KWLR8Rp9kvltdjksCOtooIU3dw7Bjmqfiutyo=
X-Gm-Gg: ASbGnctjEP3oUOt7knwy/oUmH7c4Od9NrIsg24ZhRYKRvIvm7ZB/zYliQFzgWWMdK8V
	E8/XyAhpLTVLGCnwDJMXdXpFeHRp7+EdS3vZGMcoNyK0DqPATdvA+grkS5Oi1syWWsyE1y3DEdZ
	C+X9esR0IrNJv/Z4oUAuB6R6Lpndd36vm6qVozw15q//kQEBiN9+jVxatkYmzOL7j1de+hYwooV
	QXW+hdrhKHcN4iLsv5Mr15u45NQpskstNpMG/Hb1nK+zvRpTQnELLDGmCjKyvQAcLnyOA==
X-Google-Smtp-Source: AGHT+IHre5NvSx2IdV/8gwVovs+16AluV6QFXnZjAFtO+QYQtO+O8LnhPh+fayg3f36vlzOpV5Blfg==
X-Received: by 2002:a05:600c:468b:b0:434:a706:c0fb with SMTP id 5b1f17b1804b1-4362aa369ffmr207567515e9.10.1734453038713;
        Tue, 17 Dec 2024 08:30:38 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362527ecc3sm182435335e9.0.2024.12.17.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 08:30:38 -0800 (PST)
Message-ID: <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
Date: Tue, 17 Dec 2024 16:30:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_083040_312358_8A97F37E 
X-CRM114-Status: GOOD (  13.17  )
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

On 17/12/2024 16:23, Krzysztof Kozlowski wrote:
> On 17/12/2024 17:12, Bryan O'Donoghue wrote:
>> On 17/12/2024 14:10, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 15:06, Vikram Sharma wrote:
>>>> This patch change clock names to make it consistent with
>>>> existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
>>>> This also adds gcc_axi_sf and remove gcc_camera_ahb.
>>>
>>> Don't combine ABI changes with some less important things.
>>>
>>> You miss here explanation why doing the ABI change in the first place.
>>> Without that explanation I find it rather churn. But anyway, reason for
>>> ABI break and impact should be documented in commit msg.
>>>
>>>>
>>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>>> ---
>>>
>>> Best regards,
>>> Krzysztof
>>
>> This change should be fine since we haven't committed and upstream dtsi,
>> so there's no ABI to break yet.
>>
>> Agree the cover letter should have been explicit in explaining.
> 
> So these are recently added bindings (sc7280 is not particularly new)?
> If so mention in the commit msg that no users are affected because of this.
> 
> Best regards,
> Krzysztof

Agreed.

The commit log should make clear that the ABI hasn't been cemented yet.

20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending

---
bod

