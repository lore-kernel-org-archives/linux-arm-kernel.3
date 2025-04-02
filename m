Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D657C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axaar2VlAPDiKK+PKSGROMc+IrZ+2WgRihymKGXra8Y=; b=4/DSAw2AaTe81wJaemP2U4Lnt7
	8mYQ0+SqNFXunK6Y6YpqRmJC0lVpYJyoipx6vABFmuBXiRz9pxc6t3LdvLMsJeu2kKdhQNWLP92jX
	HbnYz95JsJsL8r/3ARPWtyoGBvFttqvx+QgloCVAs0oEjnpu2dQsmCM+vjKSGfSB7OlVHJG+SFrGH
	l3od4JBCzUcSzLuVDLSu4ZtWus/ApW1Cp4YvXAlHJpTbULOLQ1qfwWl6y1DN/da0pgwRp98TBDZQ8
	TgEr1EwwxW0WeJnamO1x/samsKEO87Gcsb6nH6NAFYvKHVoKwl43JjuNF8YMGilnJVE66FeZGKSiz
	ngunf2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u05Bf-00000007C0B-1dly;
	Wed, 02 Apr 2025 20:59:51 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u056Z-00000007BMW-2uE2;
	Wed, 02 Apr 2025 20:54:36 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3f556b90790so76370b6e.0;
        Wed, 02 Apr 2025 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627274; x=1744232074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=axaar2VlAPDiKK+PKSGROMc+IrZ+2WgRihymKGXra8Y=;
        b=U4I2ii6JqOnSQRnMp+diQX0ILE7pdWP3S6+pUv2Bf5QkGGrMJUbfYvBY+KGE/QAUpU
         h8Q7AaulUWQQ2xDfk9AhnMCYoQPcX7EzY0d//VWQO1d58034UxDn0aY6Mz0HsvZs8Rt7
         72L/pyFSDDPWvJa6J5dkdukJJVNrg3OH+3bf3Ql1QjdhyKaWUiFpH0EevwvTR4QsnnH1
         AwuMrl4V75d3vKgmoNpmYRpyEBc/Ba0f1Jm/L+wk4Nj3OxVVQgrBRBw5m2vsFmTGtyqI
         i6o4Zpd7UkIKUc12vLeLH3IGnmjQqIi1+w4So0sjZCMVlhGTrNgtmXwoBGJxI3gE46gm
         1blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627274; x=1744232074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axaar2VlAPDiKK+PKSGROMc+IrZ+2WgRihymKGXra8Y=;
        b=Is6etMFQ0FkUJ5u443GdyxFM3KgOdqGWRZZQJGoEZBk4anjKJ2ZgajLRo1OwnPbVoC
         UpLM0p94ajEPUTjv8ibizVy2RwQpinfGf3XG2clhiwr9afQ8VxWCO5pyeNbEFD+OLnp9
         Hx+kI12MIukDcBgvdRHTdSNvfTZAnjiIJJqtBYT9cDQCD6VHx6/dkuOAQJWECPjWo8Q+
         wXl85E1N61MbrszXxBo+dPFjzPbqUNupavKms8sWnPfJQw6Ki8OR+ZcPWv/TW+ycfrVW
         kkSZMTj08Jt6z+SIDDtJ2yq7qszxQ0YpahV89Ln2dI42H4Q5vk5wQFF/rwi0uwe1hjrd
         NmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpQx7FclJVTW9bZXkk32NSiMY1CjiWqxW/IbYgnciHomwMwyq+Qjfu2BDTn6NjEhxaQU9LfzVCBQJ@lists.infradead.org, AJvYcCXapykgUPeIgUtl6lIExqcGUbDL6WMv2fCgdVc9wEBRFfW6asYRgO/dlBPQCR+tpNUJUr9gQDrLL8J0ww8Vs62E@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWd6MHlhQ/rb/Cxk5sLqFFGW3Nc7FdEDzO377uyNUn0quP6n9
	HQZZE2imtPqpMxmViwUF1Yf0Sc2qX9E1D4Ru+IivTUp4isHpmLop
X-Gm-Gg: ASbGncuye13la89NH7+Oo9K0SvPEdh3f7NhFc++ZPZLU0Iov/R4zZayIlcQK7EU13BW
	udW/ny7RWlJhR+NA8ZfIalU6sx2rAIpv0LJoZEsD48ysI6l59qOKlpPtfwqPzrkXmjhsjadk1SU
	J20YYwZyorTf7Cs9hf/a47LRkve3Wq4csE8BFLTtDrShPfmqyDa8CEjNtdOKX2CELExvO/Bi3T4
	XXxFseOJiNdtPF+Cgc7CvwdkY1Zj2RmWNGggrZt/pEJbyHWvM0y9sR6ObRW6bUaTfwIXI7JxwE5
	WDWrDwfUMnpe14hTa6bTKO+WHrLeRW8YCWvTvaZsMAhKkbSAL/oVybUfH6JUB1QoNbbS4CoV
X-Google-Smtp-Source: AGHT+IH2b+JHdE/FBb9nWD74IxzVIWkU7YyKDyxMB0+FTs+MT6TBpL3trGIfLfIBnxkIqC+eExplRA==
X-Received: by 2002:a05:6808:2f0f:b0:3f6:8c64:8bc8 with SMTP id 5614622812f47-4003ea3185emr151555b6e.38.1743627274471;
        Wed, 02 Apr 2025 13:54:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff052799d2sm2550146b6e.34.2025.04.02.13.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 13:54:33 -0700 (PDT)
Message-ID: <4bdbb732-fd58-4ac3-a33b-5c89df03e510@gmail.com>
Date: Wed, 2 Apr 2025 13:54:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] phy: usb: add support for bcm74110
To: justin.chen@broadcom.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Cc: rafal@milecki.pl, alcooperx@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kishon@kernel.org,
 vkoul@kernel.org
References: <20250402185159.2976920-1-justin.chen@broadcom.com>
 <20250402185159.2976920-3-justin.chen@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250402185159.2976920-3-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_135435_737268_0E8681EB 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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

On 4/2/25 11:51, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> bcm74110 adds a freerun utmi/ref clock that saves further power during
> suspend states. A tune is also necessary to pass USB compliance test.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

