Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D2EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBBCHmjJ8BfQE5A/y32+aeYDRhAmzBYfai/tB2V6O2c=; b=Y8eTMSnyp2GYMIt4fWxQkMP8m0
	+6Rp6Kf8WH9Wsz2gjZaidGayKKRXtaL3gmyMlWosULcQEbIIlFDWxLbG4llV0tD/DmKOqvF2qo5iB
	BOH0+42uRBKCf+j6LIjWlYUtcTYm99mTitNBthRRCNU8IzPLNBDKH2AyMkAenfsYaGCAQlSpI3/Uq
	1t5qm5IZzx6cT3+q871xAjlUWpwlmTx6ooV5IJo55/X2MvPI1mbZrS9o4UyrWy5WZmtx3Cfn2Yi7o
	lfNsiihnh4kQDBeFX8b0h16sUUGHUOMNviXTDzgB4cg12jMRIRM8q9NKWTNbNBTXLjNASUNTCb5lj
	F65Vij0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbSE-0000000EME7-2Uwj;
	Tue, 17 Dec 2024 17:33:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbPZ-0000000ELXd-2yrE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:31:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa67333f7d2so831911066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734456668; x=1735061468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBBCHmjJ8BfQE5A/y32+aeYDRhAmzBYfai/tB2V6O2c=;
        b=hBu62GvaC+JvxmnVbnxlrwQyhdO6g13MK45LcdaTgn8cOH4+JJAyJrvNecYsI4iY0D
         F66IHOxpxQZps6YM3qQvDujCHqrWGrrNNqTRw85l2Ic/Hu7A59Qt/WplS/hStaRkNcny
         net6arGZz7LlImsVlmG/kyHKe6hIPJW5sq+AWCuhoebrFkUOl+pQwwnKae0sAImMjeSX
         /odeUcQ3ZcXO7FsckKAbcWkFiAGYFoRXvVlGNi2bb5hQwycGrCG7wpziZsKkfk2yRcLB
         VnawDkIh+IM/qPwaBXeiN14suTdoypVzo07AhT1RrrswrczVwsTcRk4skSJejhJsGnXg
         KKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456668; x=1735061468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBBCHmjJ8BfQE5A/y32+aeYDRhAmzBYfai/tB2V6O2c=;
        b=iV+gAdtTlYJcmVfVXxILIQh6IyV1LFFr+FS1x5HMp3JqKC83V0FtyH+lRn9FThQp83
         N5O42M8uUTYueNQTFUq++LBDBKGtyO9O1DCHGPIzrNRLTN6vNFA+0W8dFvChr8jZ9Krr
         vlv6THf8JppwL6DpyGYYsmKEExRtODENlr56mEQGBBYEGue53LhYHD5ZSSt4Ldxv5AZV
         ydsoKx+kG2nsCQmKPMoDBQF0WVizdZFjfcIunF6GCT3lV+VWUPxix1UUzqtkggGdxlkT
         PL5oJ6WOv7ylHW1G9C44/pa6RW3aRT3som2VoKFKiCwVIpvE2/70OGAOsZofRk2Bi/L+
         i1xg==
X-Forwarded-Encrypted: i=1; AJvYcCVZdkrF6QEOtvHwkheFyqkI08crrEXoSw2ReAGPqxmct+B8EVFuPzlxlJuxhaYEGaVKct/TpyOZjDgvuWq3DVvW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4i/7H9okxRp4LrCbRaju4Hy5fOxYCKUEGjE4NEuZ9gmxCM3bO
	EkQqPTrXWVe6wOjXa3m0vsP9fsh4yzk/IiSdApFhHwVGKSjVltnw
X-Gm-Gg: ASbGncsmCKGitHvPwZtWWvSVCCDOvDz30kRHnGqyrJ41qDvxDl6FBY/TXsfLi8FyA5h
	0Cfany5EOR9xJf5CRz4y4JYcQK7Oq3j3ol9XkC9vMfSEwa+E3aLXQDML5qxixNYw0LpQ5CVHivM
	xXCid1pd2Coty5KIjSuVgwRV/3Weljs6H7hQXkQCMMJ+TlP3kVWfjUD72yGCaW9PbQ/kBlgbtlm
	hLHganfQDXnPBEy/Ypy8+kuBcJiFzuWyoF+7R/CZdNVjaCQiaLdJ90chsaCWySGdFpO
X-Google-Smtp-Source: AGHT+IET9mrZEHGyCN84q2P3UbSuc+Z8xHdme19p+Tq4s9g/cPQ1ee4Z1KgRDlQkyuj9FtD2I63F3g==
X-Received: by 2002:a17:907:7811:b0:aa6:8b4a:46a4 with SMTP id a640c23a62f3a-aabf1c85370mr15686266b.44.1734456667314;
        Tue, 17 Dec 2024 09:31:07 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96067ef1sm461047266b.48.2024.12.17.09.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:31:07 -0800 (PST)
Message-ID: <6b257549-b166-4772-a824-894b4b84e322@gmail.com>
Date: Tue, 17 Dec 2024 19:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
To: Markus Elfring <Markus.Elfring@web.de>,
 Maksym Holovach <nergzd@nergzd723.xyz>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
 <44419be4-65b3-41eb-a696-cfefae84a423@web.de>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <44419be4-65b3-41eb-a696-cfefae84a423@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_093109_745528_DF452613 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Markus,

On 12/14/24 4:43 PM, Markus Elfring wrote:
> …
>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>> in various devices …
> You may occasionally put more than 57 characters into text lines
> of such a change description.

But does it really matter where I break the line? For me, it just seems 
ugly no matter where I do it...

>
>
> …
>> +++ b/drivers/soc/samsung/exynos-speedy.c
>> @@ -0,0 +1,457 @@
> …
>> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 addr, u32 *val)
>> +{
>> +	int ret;
>> +	u32 cmd, int_ctl, int_status;
>> +
>> +	mutex_lock(&speedy->io_lock);
> …
>> +	ret = speedy_int_clear(speedy);
>> +
>> +	mutex_unlock(&speedy->io_lock);
>> +
>> +	return ret;
>> +}
> …
>
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&speedy->io_lock);”?
> https://elixir.bootlin.com/linux/v6.13-rc2/source/include/linux/mutex.h#L201


I did not know such statement existed, thanks for the tip, it definitely 
helps and makes it simpler!


>
> Regards,
> Markus


- Markuss


