Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A732CC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKL8Ay+wgKZPnwjJZqrrXxULzTRfOvNphhjWatjKPCg=; b=xmgjFZ63tXyb5PvbctYH9qGm5a
	yZZbzciM5j247NMh4sbQHRKuUy/lnxh6bOtOm1/G8sypw85uOSAx/kIOHVEhHLafJ3sUxcTg/Fp+q
	QLUve1CdG3tf/Pl+d5WR658Gkd60zv+HO0EJHVf3pW1un6eDSsJn9OmkxP3ESlpf0GNhubXDcUvo1
	kiserjE7K006b6HvQoCyD75RQw4QxLqC6ZeVDKYYECthTxuHZUEAtcJUx8wzFoSjJh+8k76EeGZfp
	zy/Q28nXIVCPGfMPOtbQO5yUHMQEjhc5QqtKTGH8Pp3jPOXpDuL5ZoajkykYIGfzdsgImzc4Nl62D
	2adZ0Tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOXc-00000004jmw-1wm6;
	Fri, 21 Feb 2025 08:37:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOW9-00000004jNr-2Pec
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:36:18 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5decbcd16d2so347734a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 00:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740126975; x=1740731775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKL8Ay+wgKZPnwjJZqrrXxULzTRfOvNphhjWatjKPCg=;
        b=rkZM6oJkRjmsgFHjk76Qxj1SEK0ALID/t2ZfXoDu9ouYAr5pHlekgXjxCzeimRp/cn
         XC41TnhZWTMycuSZufyltKOud/ZKmncmTA1HPzqrP47avqmCgPhlxTDVVZgDcF1pWzGF
         a4do157C6zoktMEadQtCbqa5NSHK3EG0X0u7jKBy8m+N6ZeeC2J05CzvSg8OE3R2IYGJ
         MOEpVUIBOrzV8buhJ8yr2KXNeNtQRHl4a+Rki4il6OAlceyfDKRc5FyBecEqkVuzdlZ6
         cr/KegsZEu5RKhS0C3iQM97pf3AZdzAFrofDH7nMxopelzxRcT2GLpLGTMcpSfBvkxZz
         huew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740126975; x=1740731775;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKL8Ay+wgKZPnwjJZqrrXxULzTRfOvNphhjWatjKPCg=;
        b=MrF3DK4OEPVYTCEm+X2qh8ZfVIjhIqK4Tu7vSyBLGNrtDoegsHamxDyRrbiiIZEOIu
         v51Jlwgp8Xi7FmRT30QXqqzZNv9pM+3Q8BI+qxzUGg+zlnnIn+6yjllmDir3GTK02U25
         GQ2AYnFVS7G/Q0ZmzeugFM+Q1KfLzXuGmzk74mbBzh0mJmoyAtEjpASzq2da+Dowza/s
         dUdc6+5J9TD0opVReLAZxvpuggKL1IEmImhtjBorbHEmW+z8olYjf/lt84V3wBTXXWbt
         FRGVd6leyH8mGhHw6le9wCjW4rlZJXD56u4cofg0pbN6ouSlEm2XleYUkYfzaU0lBg5v
         w9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW4xF4YZd6edVCpqQ7fFJznNr9mJqpdI3B/cCJGnIQSe/0jmzldgRYxjG4DZ5y7Koja5jFY3c4og/fsRo+1aWfV@lists.infradead.org
X-Gm-Message-State: AOJu0YxeRzezFyARkiSSC0BFDRcqQNhuKA7Wt/jrDfr35oLIwH4mvRf8
	t42xu1wNMbFrbhf+ciCmVzcNO2diBcRGF/l9kcLEc2z+ue8HIv34soQBe11TwLY=
X-Gm-Gg: ASbGncv05hfvvhltnSFOpUL3fAQzLc4CDvxf0R06iBcfJuKPWcFo6Bu8zjWYrnSDXi7
	Ogy4MI5jUFMZkUx4oKrqKwhXyeUd3mb12KCo5pNGdxC85w0/olsFxw9w3YEfpXk2s8LGjOJmHpp
	a64d0cSnqgpXBmeW2iwrPr0Fua7jX063hAQ+hNvqxLEzA6CPcYL+nomp/UQx6yXuuil8lpRHaa4
	rsm6M9+g+tT/yuHpArD+DvHuoXkjB8N0Jf+DFLTBGCbOTYFC/0+ISUdH9rBFdoGbIUbMEc9VQtv
	uR4id7ktWcGoyJp8ZK/IEkae7AyBR65D+fdOeH6qUpAWj5ZO49Ff6b4D5py/dGGecur8ULW37Lp
	2wn60
X-Google-Smtp-Source: AGHT+IHhMeTPzc9o8Mc3A4pZdz/U1wryY1ec8xOhVWr4LxFvamT5fLAo0iBOuCyeUhsvP1eG63wRew==
X-Received: by 2002:a17:907:7f9e:b0:abb:e7b0:5437 with SMTP id a640c23a62f3a-abc096c807fmr90322566b.0.1740126975506;
        Fri, 21 Feb 2025 00:36:15 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6e4df5basm1236889766b.152.2025.02.21.00.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 00:36:14 -0800 (PST)
Message-ID: <938c66cf-5be4-4b14-bc1b-8b9f7afaf290@linaro.org>
Date: Fri, 21 Feb 2025 09:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
 <20241007035235.2254138-2-ryan_chen@aspeedtech.com>
 <SI6PR06MB7535BFD3377505F5191AED7FF2C72@SI6PR06MB7535.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SI6PR06MB7535BFD3377505F5191AED7FF2C72@SI6PR06MB7535.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_003617_630873_305B6749 
X-CRM114-Status: UNSURE (   9.99  )
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

On 21/02/2025 09:25, Ryan Chen wrote:
> Hello Krzysztof,
> 	I am going to submit v16, and will update the yaml file, in my this version will add aspeed,enable-byte.
> 	So, we should I do about this patch about " Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>" 
> 	Should I remove it ? or I should keep this Reviewed-by?

If you add a new property, then please drop the review tag.


Best regards,
Krzysztof

