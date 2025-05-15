Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEBBC54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iefSatW6oFGrk0hCOerOc6+Pe+Fjn+g47KmLI+MHu+s=; b=GSCn1JrxQWfOjS1cNJi7E/ufPD
	3KaSPsP90i1TEy1kgPIk+F7F2JwPNQ6n0iVD+NeW9DL3H/jJxGsYUZL/Mypnzjcmcv1VyBzu3Q3xi
	Kyf+NjfyJxSCHqWdxM5THonF4uuYUkBQ/AgSm5tYN+lxBvYCH3LqLwM5tN54NRC2134B4Qy/nBTW9
	Kks3/Y3dzrVSotlsqQH//6RoF7Z/7cmci/JZ4n1HmJapgzmm3zZGp70SG5YxDvNWniPS0hEmTpV2X
	xfuckEKtl77HcIy+pVNNg4IwReHazfa4QsJHzZNmE4b1c8EH/ZshgEIavYyncKm25nAQJIydoJTdN
	z4OjmFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFapK-000000017JV-3k0R;
	Thu, 15 May 2025 15:48:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFanH-000000016vE-32Zl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:46:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso1392451e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747324005; x=1747928805; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iefSatW6oFGrk0hCOerOc6+Pe+Fjn+g47KmLI+MHu+s=;
        b=I9yaBhUngKTE6k8riPeY7Er9sp/31gDklCHkyK0xYDF3Gthhh2W1a8KCf+auF1HVDr
         NQOOc40hURcKN7stLlv+Hdhlqljc30jdsj1i5g02Vhsr5B8Bw0EX6MpMFvYWJWqT2Smy
         wQz7kqo4fllNhvMu8DvnZfK9oACdf8MhSgg4tLxnEkFKSGRMIypzwjKbGyeoPwgkMlTj
         uhqfUYBlxWk0tYidGX6VyD/BE/tmTcPkYFPreH8iCr7JY6Zw8g4Q0R6/3aTPecCbagOp
         dTTTJPFml7OYmbV4A+KcqTMfZuKAZkQeuaGVUBKzqUhmFflOkAUWw5YR/mubFtBESu/8
         rNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324005; x=1747928805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iefSatW6oFGrk0hCOerOc6+Pe+Fjn+g47KmLI+MHu+s=;
        b=okvbk1sJsEr1kATh/eMkAy2oCbmtT+qOL1Uxs9lTdiEzbjeWUMBuyRWz5tkdFB01QX
         3u2lzDgU2GZR/T1A8IjHvQf0hgBxmr8y0c6ZZ5JSL5bYTk/6ENl+l8ygBjsFrR4Q7ZXg
         T66GUirZ4oV0z2T408JWyPsxVusWTXIMcxcUy5vaKIl7HOCrxDLoUH9hUQ+1jk6fQ2Aq
         zorl5JqEF0eVqgwGDrq4mmTuSFtPtjr3/Exhi2OIMnSpJVM+RRzZ7XKDL2vwiQJV7mVE
         Fsl9+Wh/P0CKZeYv+zslS1PU4wWzItwuwh4llvA4IA8tRnj7iEKNcLQLnSGqcXCZE4qx
         AdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt7z6fii/a2AfqZb5lBsYbB2ndNUxP3d0ZN5uuG9Ho7RDLWNSS9dTFyRXYZuEJXv516btp6+IH56/1CJAjb2lU@lists.infradead.org
X-Gm-Message-State: AOJu0YxpdGsb8tMszF8TtVPoWlWcRODKbyY1EWx5veKAzc30CV44E27B
	7lI1Zi/oiNamg30q9RHUJtTGhNqk66bdljUMHve+J/Til93PkW2L
X-Gm-Gg: ASbGncv8xxGuELUrCBg/x7NfT+vQZVB2VADt4JpYfmMR43IazFIGg/LPeoiktW0JUwe
	qsfH84AU4y5HNDSJSUs0iX4ylSnR6kVqxHjbzPHsmdPD/7y7ijucuRV09572j7GVnGxlAN24SOQ
	fcvLFl8RyJ1UiLbY6PGZ0DOQ2GuzotENzL+4j5Lt4A5gbOfIKvXWSLto3UqbG7NyWySRJvnOD1f
	Q+BturpiIRF81OAWzhEoaFUF6PjLDKyE45lSRblKj+v0XPNEtT0g90tWUXMInxa76ilPHCdflH4
	5G9mOjXndM90/J1gcgTPruKhhrR56I9MSGi4oCWN01cLognJ2FBUWbhtW77sg5DmkZz/aqR03Ov
	xpWQMbSpRKid6Q8x092RD0/Y3mFY3EjKOFEZs
X-Google-Smtp-Source: AGHT+IEVKM7oG9wZtg8KET+lsroz9mMvLkh8FdUs5mQMfI0T7TH03Y4MtAKf9+PYXbfxDliE50H8dA==
X-Received: by 2002:a05:6512:6099:b0:545:6fa:bf5f with SMTP id 2adb3069b0e04-550d5f7a8aamr3118415e87.2.1747324005372;
        Thu, 15 May 2025 08:46:45 -0700 (PDT)
Received: from [192.168.50.244] (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e704041csm699e87.254.2025.05.15.08.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:46:45 -0700 (PDT)
Message-ID: <6fd5ad47-8f01-43a4-aa92-e067c25ff195@gmail.com>
Date: Thu, 15 May 2025 17:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
 <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
 <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
 <20250515131321.GG2936510@google.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250515131321.GG2936510@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_084647_765294_87A1EDCA 
X-CRM114-Status: GOOD (  14.01  )
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

On 5/15/25 15:13, Lee Jones wrote:
> On Thu, 15 May 2025, Mark Brown wrote:
> 
>> On Thu, May 15, 2025 at 01:28:15PM +0200, Artur Weber wrote:
>>> On 5/15/25 11:33, Mark Brown wrote:
>>>> On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
>>
>>>>> I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
>>>>> in would be sub-optimal and would likely end up in a mess.
>>
>>>> Well, then just going a head and applying them on a branch with a tag
>>>> seems easier than delaying then.
>>
>>> I can split the patchset into two parts (one for MFD, one for regulator)
>>> if it helps.
>>
>> There's still a dependency on the MFD bits whatever happens.
> 
> Right.  That won't help since you need to describe the deps.  Submitting
> them as a set was the correct thing to do.
> 

OK then. I submitted a new version, v9, with the style nitpick
addressed:

https://lore.kernel.org/lkml/20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com/

Best regards
Artur

