Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3BDFD374E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=; b=w4cka8zlxb47WXXyh2UP7gdJ+M
	qduRb6RafMnHhE5KCFMrEWmxDa891+56Q+X4f0wZ7ccgagqaUIsa2EdrX+agCJHgM91YQnXaKc2kK
	QVBqIIKUyw562FSIE0Xfre01OovGFiZCHd01/AHRAVjN5L3dNv9Xg1n/UIbJhCuNM9o/BkNcl5HrO
	61vd0DtKgn1temXArfl1m/t/sd7ljDQnXiIAobo650F2njeeLsnhyNMe5WGgBonZ+R8RILKg04Cx8
	3vZjbHQ/yDFNTzLu+7tmN6XxnFsWxRFSGSe3AgL6QxB81UiD+HtBmDcC+psGeR6Hd5dlMYzQKl+Wx
	8fMogObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFRa-000000049h6-3aAy;
	Wed, 25 Feb 2026 14:00:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFRY-000000049gl-1mnP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:00:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-480706554beso79690105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772028046; x=1772632846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=;
        b=Q9XoK+34OtbDIP+cjBRFZlEf515PR9cLUUargknzDsf/J1xgn0192hCUruLVkR8kAp
         TLav7Vg35nLM4C9KMdcfzkRdYMl5whjASbQc38nSeIY1OQWXLMMMVJsuVhxUUQADyJ3o
         4zP4FzCsKdAb0qQhXc8aQdS96DWAwQ8Q6YVd3OoievEDwOBAYttX966ACjYeARUtAGz4
         Ui5vggCYAaEY1vnqovI2Udvr1TuPhWeDlEWeEnAXUdQ2MMzsnXR4DYC/9x/vUAZIMOV+
         5OO9PLe2L2B+1LZA84dnRdEUtmlFkBzQwJknHwPCaVQWYIWIXXWoqMcvpz+Bd66s+kN1
         A7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028046; x=1772632846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v83nX06CFNonzs3aaey88JZD1iHRYlh5Rsz4acoeN6I=;
        b=DhBmgGLW9HkHxNvLuCkwF4ELBxbb4LNlH1aoZ89m3kRNmtkbWn0eLW/MIHMkZ3E8jd
         O9ZpRTEN/PFp8GqF+Q1DkTwqyCJ6OCXGyVGQQq1q4aK+liwCIAWBLVTPC0whN6zB/7xZ
         oeKk/8kfEmwKp+Q5v/wTt6ReuGn/FCB6jWyVEUX32bOk7Y1GcHoj6m3FY7R9CXDuu32W
         UTuSNoS9gbsz8QkpPBqSJQDwZeR8xmuln2310RH1nNaLpYmURHO3VZn9p4DEJLVuO1F9
         m92Pb8I6AgiY1eOLwOu6cDqLiwsY7oE1lENxVvSgwtion4NFxlgXcxdEfxO8M4kIQi9u
         x9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUC1qlcZTcxL1QRPNnwsr/Z7HJOw87fLSgJ2cdAeAhNGJoYlPdOLcziO9UOus8lkJQ0sOa60u49jytkXpQfLiw6@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZccnCxV1DBXtuP2ijMrOO91a6Qm0MnvVWwZ6Zt3CZlAwmOLH
	Hay8/TEy9fD6c0+4BiTv5MDgRLEBXAn3gc5s3iElwknhZsvOF3OsF3zXc9qGF/vI5aQ=
X-Gm-Gg: ATEYQzxc6ta3hEIKGOy793q/JkmYpGlYPnimnKafKcc0L9Qzax/mpKtYpNgDe1LYC2K
	nvCmyvc1hg5e0YVOKCWZbRHd5ODg6dFAXVffOI5pmzkYavpFPIw2os75tJHBESNCXvTV5DIlVP/
	hQHDe76QbF/J76ntUGxt5SuyAjc31w2MUVmZ/7FpgwnsFyFH2sjlCZDEFqH9Q2b9dymEBIBUwno
	Rsg4MUN+077R1Lo7vVK7XyCzM7i3R1hmEr8fgINlNSlzId64exB0UHB4YlMW53pmdJvOelyo+Js
	yRrhchXxhyUiVBZaCUUBrH8/D/upg58qbsISbtzu+0+CvvXSe4qm5J3KSGJ8wXy0c2E4Cg+cNDJ
	9cJ+ju5tI7I/G3I7jBtJsIt1BvxMzT8yLxrkPtolgoXoUBupuC+l3IGjf93l99TjRCp8/iohrfS
	MFi4j3pbIBmAWDKhexW2SU3H6jTF8ipFT3
X-Received: by 2002:a05:600c:3e1b:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-483c219b659mr8852985e9.19.1772028045947;
        Wed, 25 Feb 2026 06:00:45 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm35367670f8f.17.2026.02.25.06.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:00:45 -0800 (PST)
Message-ID: <279baf9e-ef05-4217-9357-94d21bd93978@linaro.org>
Date: Wed, 25 Feb 2026 16:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: exynos-acpm: Drop fake 'const' on handle
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
 <b083e950-f54a-44aa-b587-eec2cc10460b@linaro.org>
 <3e5001a6-ea3c-4304-8db3-bbe616eb4015@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3e5001a6-ea3c-4304-8db3-bbe616eb4015@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_060048_500197_382059A2 
X-CRM114-Status: GOOD (  16.30  )
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



On 2/25/26 12:48 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 13:57, Tudor Ambarus wrote:
>> Hi Krzysztof,
>>
>> On 2/24/26 12:42 PM, Krzysztof Kozlowski wrote:
>>> All the functions operating on the 'handle' pointer are claiming it is a
>>> pointer to const thus they should not modify the handle.  In fact that's
>>> a false statement, because first thing these functions do is drop the
>>> cast to const with container_of:
>>>
>>>   struct acpm_info *acpm = handle_to_acpm_info(handle);
>>>
>>> And with such cast the handle is easily writable with simple:
>>>
>>>   acpm->handle.ops.pmic_ops.read_reg = NULL;
>>>> The code is not correct logically, either, because functions like
>>> acpm_get_by_node() and acpm_handle_put() are meant to modify the handle
>>> reference counting, thus they must modify the handle.  Modification here
>>
>> You are right that casting away const via container_of to modify the
>> parent's reference count is incorrect, so dropping the const from the
>> handle argument makes sense.
>>
>> However, to address the underlying issue of the operations being
>> writable (e.g., acpm->handle.ops.pmic_ops.read_reg = NULL), I think we
>> should also decouple the ops from the handle struct and keep them strictly
>> constant in .rodata.
>>
>> How about we apply your fix for the signatures, and I follow up with
>> (or we include) a patch to do the following:
>>
>> struct acpm_handle {
>>         const struct acpm_ops *ops; // Changed from embedded struct to pointer
>> };
>>
>> static const struct acpm_ops exynos_acpm_driver_ops = {
>>         .dvfs_ops = {
>>                 .set_rate = acpm_dvfs_set_rate,
>>                 .get_rate = acpm_dvfs_get_rate,
>>         },
>>         .pmic_ops = {
>>                 .read_reg = acpm_pmic_read_reg,
>>                 .write_reg = acpm_pmic_write_reg,
>>                 // ... other ops
>>         },
>> };
>>
>> and in probe:
>> acpm->handle.ops = &exynos_acpm_driver_ops;
>>
>> This way, the handle safely reflects the mutability of its container,
>> but our function pointers remain fully protected.
> 
> Yes, this makes sense.
> 

Will you come with a follow up patch or do you want me to ACK this and do
the follow up patch myself? Both options are fine by mine.

Thanks!
ta

