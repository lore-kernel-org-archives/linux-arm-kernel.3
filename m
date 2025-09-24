Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFBECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmVW+Z/mziG0ZeCkjmpV+S/k8DcMMNx/U++MptcSCGo=; b=j7+8WjXHfzJbjUpULPD7UuYC5i
	s1xCSk/3MFWEUVdeLs83BGSCEOTDKERzsiMxgNXseHJKUiRMdwhDzlYSu0c6SPur3fglZh6agnzu9
	nkBwzgjadVoa9sDpYJbH7VP9JcAI1dF1R0sVRSbS5L9tW4s5nZwVjTiZ+/XHb8XejbO6+D2Ghdiog
	xb+HCOQkpifcM1/2PgbhdSV9r9/hDgD4YuY+44Xb5YT6q21NJ5plxxy65LtlIwuA6oILQaruMeBZf
	knSU9ILjOhbiBQlBYIVvPUc2TalRMUiWOMnCfarDf2jfH+WeEAszLHDhO4Y1/0cJ7I2d/+JXKdIkE
	5YYsT7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MIR-0000000GHVu-1cH4;
	Wed, 24 Sep 2025 10:00:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MIP-0000000GHUc-0BLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 10:00:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so3954358f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758708019; x=1759312819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmVW+Z/mziG0ZeCkjmpV+S/k8DcMMNx/U++MptcSCGo=;
        b=bqVLVTEUojfRKkU1okvhsBUsyUKdjvvWTa4+fd9543w4lJ/xfuq78sSd4SYCslVo/z
         HQB+jRkfvCjksFkcbkFgxK/cTyTH5y2VtZoopqUgrfovXc/LRe2GedlO9GG3f9j8yeP9
         0p6dr0t57X4t1YR6MV8uE+VBbKJmrn72MuDXWl7mPIsi0iZIlu6CZbBOT36c0xo9dppK
         x1FFbRqbDvxKRqeuVA1mR09N02NhsvGYQ+MsZX7ZeQpn1Z0tjR9OKvprPsGNEPRep8g3
         HTc/BnOUV0fKfD5d7dhR/T6FQYczVC1iWuZp5/p1dcZaXs8CQCTLev1ggPqZWrChljZe
         EEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758708019; x=1759312819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmVW+Z/mziG0ZeCkjmpV+S/k8DcMMNx/U++MptcSCGo=;
        b=X7w3ReU+176dh92UMqLWzA5rHgygAKB1gayuOETujCGf93aSULJnFSzdV0VttlRoQJ
         FnghFDCTFxfZRuZMYRzMHcqGoMaSIfdZlWU+Ykkhbvexb6brdjChhxAY1VhWFa5vJVqk
         zdOGwREXsZG5JFraV0nPmYictqM7zhP/t4yg2++gf5Sz0+3BK+g4oOR1qfd5652UkC6P
         pvj+QmEff/iV4F3JOKieRtTF79uwoI0vY3ygYrOXAcKcXSppnuUoT4mnM3MSEuJxla5q
         D1DOO/xOZIk7MOA4Va03P4HeBmUg1mi4TcCEjyKG2GA7O2B+2XUigUB0X/840/PUmTg6
         2geA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Bz4r22QF6zBzTarGiMO3NYLcjLbnW24w93YdEiCIXjrgPcJfB7NgXFFzxwX6phaVZU2rMlFf6nNVmcOCl+dj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc1niAILMjl1SETCbIOBN1nAIVITTmOZJyYSjFfwjD4rU7WV62
	B8Wf8qJgq5RBhj2vJ+wu10xB5VDohcD0xAltIfuAyeSfnPr2mKoWGw/n
X-Gm-Gg: ASbGncspIAEltYZQys9V8bMbf5LG6V/xv6oyC5QhRW5+Jqp2Udosj23xwvwJ5NvleEq
	wuAO9svVIENIFPA5lBidZBjEogZjVD9JWOpFO5aTJqMIJktiHwVZBmrBiMfArGO5YqjMmaHLr1T
	blHwXwLylWHFnhyquX7N+KFi0la2yqiwq4jucfoax0ziFOjWhR0mC2w/1biCs3pzQnxNmkOewUU
	I1ECt2/utGZfhGNjxwDQ14h+xQx3tUX0y96p3LBQOT1dL8+NC5W6PNBikIKSdb9WRx/OuVmpq4P
	rjVh8nKPTN5+pRddaT0ojolLXCtBfLBhSonhpGjHQUyWQK+aPrh357Z4ZjBh9sQEFXJvYw+MF8T
	xuU+EZNMbcEyZD6r4t15Yws4k4+hcCR2E5KVlShUWe+pghMsRc/XKQ7IOBOxX8ec5hfJUWKsHyl
	epXlAH0DhtPR6yZKcU90ImqN+ABNYF2VtwwrEakfHZm7atWPFUqOMVDwL+hB75
X-Google-Smtp-Source: AGHT+IG42+8OH08VTgLUl9F1YLwdDI/MKRqmfZxK/ji2sSckzPzSa7uie7TpTd+qAIdz3qyFVuJLPw==
X-Received: by 2002:a05:6000:2082:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-405c46c242amr5543802f8f.14.1758708019030;
        Wed, 24 Sep 2025 03:00:19 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7503:805b:76:f865:8f03:23d3? (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f4f3csm26375517f8f.2.2025.09.24.03.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:00:18 -0700 (PDT)
Message-ID: <430e9fad-a877-4328-848f-59b982a10706@gmail.com>
Date: Wed, 24 Sep 2025 12:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: memory: introduce DDR4
To: Julius Werner <jwerner@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
 <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
 <CAODwPW9Js2AjSzQrvRFMK3xHXjbb6qV2bGEj3GhYWpDELniyCQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <CAODwPW9Js2AjSzQrvRFMK3xHXjbb6qV2bGEj3GhYWpDELniyCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_030021_100089_209CE627 
X-CRM114-Status: GOOD (  11.15  )
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

On 23/09/2025 00:51, Julius Werner wrote:
>> +      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,10},[0-9a-f]{2}$"
> 
> I don't really understand why there can only be up to 10 characters in
> the module part number. I also don't understand why you wrote "20
> bytes (10 chars)" for this in the previous patch. Are you assuming
> that module part numbers are UTF16LE? According to my reading of the
> spec, it sounds like they're supposed to be plain ASCII, i.e. 20 bytes
> should be able to contain up to 20 chars.

Hi Julius,

Yes plain ASCII needs 8 bits for each char as the value range is 0-127
I was having hexadecimal in mind while writing this, I'm sorry.
I'll fix it here and in the previous patch.

Best regards,
Clément

