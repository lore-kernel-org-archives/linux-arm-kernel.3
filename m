Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF59C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1nvndDPSf3rno4NE/6pzQH+gNBaZnuR+dy35/KBfh8=; b=v7nvPt4ETLh6ZYiW1jdXWgmX8c
	KpuvEeLzRiqTtTQB1DmILW7mkHHxgO8yO2UIdVyxDlrhD42Y5A1W2IO37jchSdmqzJ7EdBpY1+W6C
	kvOM1YPga8a66B25MEYOXR/cg4z+wYeNTejlVRkMKv4mFepF17JM/3XfRtn3g5bDboWiaSDqYMP+o
	EA6guzugz7t7PE46f3yqaIhNrLOXSMj6ZCT7lAhC20UR0oqVijgdWGkAavkszZkTsRtXZaPI/G76x
	PdjdU+9NsGU//MUJmN3laRe1hk4+Ru8OReITB+qsxwsWfuE5cCtrgqSV0SO8XE15HUjyS/CXMSsXK
	8mNQ6rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn1-0000000EDpR-1e7H;
	Thu, 12 Jun 2025 19:40:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhlv-0000000DLdW-2Be3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso1034735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749734110; x=1750338910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+1nvndDPSf3rno4NE/6pzQH+gNBaZnuR+dy35/KBfh8=;
        b=a2I991NloCeB+8eEdZK6apEbmrN4zMrzO6dJJRkRZBDPLjumNvoFW+8YwSHO+8qDJC
         8Q9R/YSazkWzw3jZcE3bT/u4pKBpFk6b5xBDPDPkbjxOfKbyoeCyOCiHq0UD/+sBoCWs
         I12ZZxmExnjcIRGkrH/e4s/h754iHi0hVHbXOASuvrggKIwH+xFBW6d5QrQsqOsmDv3S
         qO2Z/gD9mQ8KWjuygKOJQ7Nyg/id0cc7JsIuDT02odkhZhiS6hV/zXv8aA+lo2VnLCy7
         L40yJDe7LVVuhSUD5i4SGgc6oflrR/Eog0br7yxMZKKQRaWr2vn5qwM41EgVA9BjmPsr
         Td6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734110; x=1750338910;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1nvndDPSf3rno4NE/6pzQH+gNBaZnuR+dy35/KBfh8=;
        b=rttvXzTiVlgVg9mfE+eiImOGW9pb7fjseY7Oni586f+yDYVB/yToschnzEM0Zadu6S
         ydT5FqRvMCl9J+eev4l3Bh9ENSMlBBdqMvQALbide/N+JNMVSZ0BFeaZVs55FKPSFgzI
         pvD9JPZl6McHMHxx1mmJ52OIXyJb0VjKFb0qknTOxTsPzCnQK5mHr3YOqYV+jMYtWO3H
         aQAXwWpSHS5fb+I9oyXXS88jt+WTnzpPQcrqXRWgmuzW9zZBFuauTHIXULm5LNPwzAm2
         f1bcVCJqKvK9Q2G3CAGwKxnj4sec7LKXc+kJVRMbQnNKHUpauX7Ah77dDiPx0rNp+TY/
         lrvg==
X-Forwarded-Encrypted: i=1; AJvYcCV+0oGZzvUDtiP3T26n6arRche1SIMw3DUDUxdTUJ+fqoRwiT5Jz1NSGOunGDLG3w6rtN1rHHUcfUMe7qfYEKns@lists.infradead.org
X-Gm-Message-State: AOJu0YxWfPaK8XVjGHsjK8Y7jNfn4JK+szQNejn+JgoZ1paldYwRuxaO
	HGzzzeT8MHeegXOKC7PMwt698245dKgRADHmfn1y/pTYaDXO3+noYVGIxzY9Lv4h230=
X-Gm-Gg: ASbGncsElqR2yLkppG+dM79wjFEK3qbcjTrmofGmrz5K+k7T5nBOQ++ugE5agRnDpO9
	EgYBU6u/dyGk5mOg9JU61FynzZr40I4oifaASACxP2RvLZp8TpT7VrLRWn35V7zyQW4JZwHKsKv
	gv7zkwVnZuTk/SminoMWsJuIo+rDQemntoB9bLGH75O9HMVcVhQNKpXe0vMe/5qfxQSIV0PvPxl
	w7UYkfGsbt83NukSQ4B84vkw6CiixD/1dYvcLXgRbCwnCkBUMM96Bil/hb5NnT3+fq/vHywJ0Nc
	FoNgoH0uChVMQD6fhz+jSqYezt4an8wbaOl3nRNDBqGVJYcuUV1qRfI+6/2QX+kNV/60w2BjOmY
	bpwfd0eE=
X-Google-Smtp-Source: AGHT+IGAWIc6/VwWOMDSaL48T8iFsXjC3G9y91FhqFZHh9tptedZxVKs0wh77LpvnkYN14yUxrCYQQ==
X-Received: by 2002:a05:600c:8206:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-4532487cb66mr25575385e9.3.1749734109809;
        Thu, 12 Jun 2025 06:15:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24155bsm20263935e9.17.2025.06.12.06.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:15:08 -0700 (PDT)
Message-ID: <ed10ad79-6cfa-42c1-b3f3-d8f54d58c2fb@linaro.org>
Date: Thu, 12 Jun 2025 15:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jon Hunter <jonathanh@nvidia.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
 <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
 <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061511_568160_159D2A35 
X-CRM114-Status: GOOD (  12.95  )
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

On 12/06/2025 14:34, Geert Uytterhoeven wrote:
>> I do agree that if we start to build every networking driver into the
>> kernel it is going to bloat. Yes I do see the kernel image growing
>> regardless of this, but nonetheless it seems better to just build as a
>> module IMO.
> 
> Not _every_ networking driver, of course.  AFAIK, making network
> drivers built-in for systems where development is done using nfsroot
> has always been acceptable for the arm64 defconfig before.  For things
> not critical for booting, modular is indeed the preferred way.
> 
> BTW, we have other low-hanging fruit to fix, though:
> 
> CONFIG_SOUND=y
> CONFIG_SND=y
> CONFIG_SND_SOC=y
> CONFIG_SND_SOC_SAMSUNG=y (Krzysztof? ;-)
You cannot boot without sound :). Uh, I am on it.

Best regards,
Krzysztof

