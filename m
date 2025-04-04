Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91708C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQGNgVHxDhs7mBk3RqbeX6683p63yLHOISx5dQxLR50=; b=BJMMidLmAm5yvo51CxqIW6Es4o
	KbElZIWQC06qsgvnd3Y3Aij8eWOBRJwAbQKmNiiZPoUjlECbsnUPTh7iOOqZta41k3sWqmS+2B4rV
	h9W1Zm+I5Ty+3vLLjtWOQSAxiCl/PBQJbN76Pod+Y3EIKRXxyW52KdinQv68Kb4qJfpPqHeH3qNtV
	A4xPndamZRX5+TXcnhH724+rLAM5Wj9ZvgOIpgY1Z5n2oXHp5M+m0o8mn+XmQpk7VFytzwWzzR0Wd
	fDo5wX3ha6U6DU2qEPuZmKt2Fav1T3xHQljB4ObRSnThv3QPB9dTWZSFSLMWUPHvtAv1Hw1KEc6Ga
	YRg2/yUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0muX-0000000Cf27-2xf7;
	Fri, 04 Apr 2025 19:41:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0msd-0000000CeNu-3sOF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 19:39:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22438c356c8so25592115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743795546; x=1744400346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQGNgVHxDhs7mBk3RqbeX6683p63yLHOISx5dQxLR50=;
        b=Z8WG5kMtNPtaefA8S61/cpQa2pwt8QzpqGbLXqFwXIZB3+JUQTw2s6jn52ggVhaWqh
         dk5UoebLt9yp3i5Pjw4QEocybzphwJwsNne4nycCEgRxTWwevUSOvSRgpE5nQ4Na/IXp
         +KthPyyGedbYfPG9igWRfpnbzO/c+wsXmg1RxZxkHf8aNen4CGON0znz6mJLfMe5T2kN
         72tFC42rrFLiusYfU+m5fijc3ksIHFYrZC0PwE2gG222jYiUM3ckLUti9dCi0TDM+XSA
         YQxqppKAOBFUZMr+wLdX8SRdKx75mQM7kqv4QJ/fzAd5uf5LZP6OnTilFXnWghjT3FMF
         qAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795546; x=1744400346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQGNgVHxDhs7mBk3RqbeX6683p63yLHOISx5dQxLR50=;
        b=G17DSScBHky8/Bh4pzZE7qVGiGJ5BP1CY1GgYpUIzrs3v/Pth7el4ixdJL0MySy1T/
         uVunoH6zIw6L2kRfgrrxYK0HZobHHOFBSlfK07FV+jEavvKvIe6vzonjYTbhpIAKtRyA
         T/E+ajSZ2nlPtcPixeSXuDv/zRH7Hx4XECikayDD6y7K3VTBtTd3imCZ0RhdfKSjED36
         giU1LNJMlKPUkFurGpyDC31U+SYtPUCRrvdd2/fQK+EkUJY1jo14noHlQRs1O+ukd0E4
         +k5jf0+cxKWUziqHcoTOit94sAvBe+8cOKzShPId/KhZ/XjnHHN4LPvXvXUap3dUKj6l
         0nsA==
X-Forwarded-Encrypted: i=1; AJvYcCWBrMfklRXtnyIuEzTWnPLbt35s6Ft7rAm4cTVhxD5ABIv0GIYg6ISTMr6MOE1EiWpMEkbmmtsH5w10yt9aDz2B@lists.infradead.org
X-Gm-Message-State: AOJu0YzBmyFSSvqIVLK6dLIbvyoYc521pdTstT76nl7zDQHBLbe7UHys
	u5nhIQI+91zUJXbIC1dmpgLOlRSkAgz/8SJkqP98J50nuv0bcjKMHJi3+kjH
X-Gm-Gg: ASbGnculiU+SVpIwuM9m/WfE6MgLKy3/nw/WW6h+Ys1oyVuVMKJhUVFcwcNMoliwycA
	p7rcL7M4ZvTwXR+gw+yQRZOsA/xpslDAgTbTWOJePPapofdE0sh63Tid0C33Gu5yP0zsRuyKR0s
	goicblHoQE/H4hsJSDJ8179210Q+YDqF/KWxKjweP16ZzTYn/WnsGIHFUxZIu0aQyUOoJex03BS
	9my2aYOFg+ImIuUuGDD7oRc8L+gOSfsxD6cENtTrMJjeCjYMIBoniqH9OPezrxTXCRj0GsV32C+
	l7UY8PJDs+48LxNOJPgDuXTNBJc/zJvph9e2PlzOW2zzPBEVDHgLNmkFVik/Xb8E4EyQ81zsIG7
	iXpqFmXYu3uqVs34KzBnVxOta
X-Google-Smtp-Source: AGHT+IFe4mjpRg7zowmOKrRZGt9tbXvtfVX38ovvOh6lKYhx4xIePXLNWeuaoRutkTmWr1rWPnCrtw==
X-Received: by 2002:a17:902:d4c7:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-22a8a85a18dmr57542845ad.2.1743795546267;
        Fri, 04 Apr 2025 12:39:06 -0700 (PDT)
Received: from ?IPV6:2409:4080:1197:5c59:9640:d38a:951e:d202? ([2409:4080:1197:5c59:9640:d38a:951e:d202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm36279755ad.164.2025.04.04.12.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 12:39:05 -0700 (PDT)
Message-ID: <b493166b-5d1b-4228-82a0-ee7efcdd03e6@gmail.com>
Date: Sat, 5 Apr 2025 01:08:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com,
 piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <b2f6a357-a468-4526-a1b6-69ab2c643b2c@kernel.org>
 <61b1e302-98ad-4dda-8c03-18315d432512@gmail.com>
 <023b7e98-58ef-4752-9ef4-6fe699188b2f@kernel.org>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <023b7e98-58ef-4752-9ef4-6fe699188b2f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_123907_961679_0A7C85A0 
X-CRM114-Status: GOOD (  17.75  )
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

On 02/04/25 12:03, Krzysztof Kozlowski wrote:
> On 01/04/2025 19:32, Purva Yeshi wrote:
>> On 13/03/25 16:34, Krzysztof Kozlowski wrote:
>>> On 12/03/2025 13:27, Purva Yeshi wrote:
>>>> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
>>>> YAML schema (`nxp,lpc3220-pwm.yaml`).
>>>>
>>>> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
>>>>
>>>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>>>> ---
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>>
>>> ---
>>>
>>> <form letter>
>>> This is an automated instruction, just in case, because many review tags
>>> are being ignored. If you know the process, you can skip it (please do
>>> not feel offended by me posting it here - no bad intentions intended).
>>> If you do not know the process, here is a short explanation:
>>>
>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>>> of patchset, under or above your Signed-off-by tag, unless patch changed
>>> significantly (e.g. new properties added to the DT bindings). Tag is
>>> "received", when provided in a message replied to you on the mailing
>>> list. Tools like b4 can help here. However, there's no need to repost
>>> patches *only* to add the tags. The upstream maintainer will do that for
>>> tags received on the version they apply.
>>>
>>> Full context and explanation:
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>> </form letter>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hello!
>>
>> I wanted to follow up on the patch I submitted. I was wondering if you
>> had a chance to review it and if there are any comments or feedback.
> 
> And what did you quote? What's there? Did you read it before replying?
> 
> Please avoid pinging during the merge window.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Apologies for the unnecessary follow-up. I’ll avoid pinging during the 
merge window.

