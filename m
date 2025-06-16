Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB14EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcv2XIvWxU5pxWuDwkwh8yx+DE1a8VaXwVfVG4mZA8E=; b=UH+Rqd0DqDAG0oOMfiFU7Nkrjp
	61OIkDro+DoVmFDGqTcKsFukfnI3wwKimHsvKdpqXJosV0SuqXQElpZY6H9KxQqavdOLmH91R3bSd
	BJZZqamX5UqA0Q9clyA9u3XoI76MLKgnHpJXh9dbn/xYBUanrjaKa8e1NaLFQLwUKhptNx8Pyia0Y
	Kumfr9ABEzJOxqyYK+RDPPKiHVcHOy1MSyttRb87ZeWty/iJXX4jJyfyZPYqQQvJI1Ihxvfn+/K+e
	/+K0NoX5nCaHUJCrXdYfLRyFV6ggTGdTuVwllMvKYF5gzAjqi8vlv9HQ5mbQScoBomrpTcQvIspJP
	6/A9lg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8lL-00000004Kva-0aTu;
	Mon, 16 Jun 2025 12:16:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7sn-00000004BBH-1jao
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:20:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4533fbbd21bso1753755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 04:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072808; x=1750677608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vcv2XIvWxU5pxWuDwkwh8yx+DE1a8VaXwVfVG4mZA8E=;
        b=tTpP7ptNGgt2LMU9pdzePdlj6Qn1zj03GjStgzoCd7lY0BRj+vnKStE+wtjZHn3F1Z
         5i7s5DDqASg+9p3Fp2Ky+3nstgIhE80SvkcUYtwgOae9Brh4eDM9KgJov1cV/fr9A5+v
         myEOIToCEV0kCiCqtbXgfH0eeD/ZWLm2MFGx3BDnkgLdoqFghNl992HzKq7w5kb3vABv
         8sK7hWo2wSLQAbSCbTyqvYSP2ODpGNQ33D1qBsV8Bx+1KFQQtzGUBt9S//LE8r7yb8Uz
         WsUg+WyUSVzm2L+dK2CBSZc7QEuhEAKFazOcBKS2kMTdq4h2Hg7lvw/FXFqUJGheRo/a
         Cg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072808; x=1750677608;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcv2XIvWxU5pxWuDwkwh8yx+DE1a8VaXwVfVG4mZA8E=;
        b=L/j0BxVZ8s8wLItgJeNMQqC0fCFviRrck3pGTrsSw2dmNShxeSJ+20NzJlREWxXTRY
         3ZVOB3EHm/86F98rC1dUAWvNRxdL/n6sxsxnPBaAxpIMOzxVhLjsF0OrbDwUbhmU73KI
         5d6vTCpdb9Hso/t4i3Q1OErz0rjnt4jfcEG3z+OVrKjbfty1fCjlA93SMDt+KOC83lJ3
         UKLhMEKYw52hWoXW0goG8Z488xhSdnitHgonsX6pHqrPPZ68SknFPsSeuqJdSzjm/O4s
         i6h2W0c0t4igfbQEnCjcUqOV6PzuyXHujnJhCt39q49eq+9MlmFiyirXFvi3TSvAxgHS
         A17A==
X-Forwarded-Encrypted: i=1; AJvYcCXnlEK21hv77pB0b1UJX1s4E+wP07Lp3VEatk0mwUjJAh9fDkUgw+BS/8F9q5oYd7lbpyb6+e/QpHubdMr5eohK@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHmtEoMJMeo1KAFM6t1y1roisQImbOpISoM42RUW7oPTvIi3z
	N1hyWJzlRXzqB3oiet/qWKXKox56LKZLeicN6iWahwxvZs2XBvxKVgzgAIOQLpSUH0U=
X-Gm-Gg: ASbGnctZwWVc6VV2K1+VO8w/bvKcTR82E4q/HD0TN4Qf4jWvDJ+5UMqDogOk5pPOaKb
	8V/OBUe+6/F3shrP2mhz+5X1pbGU1DXeskYAg95pxOgkikfdfdf/A3o6MC3gIMJx9e788xLviFH
	NfV8p/7eDrZfqpa5IxTSd3Pjc1qvhUOqsY2ezyf1YY7BpzMIicYHHug1ZbjBE7zcUxtfr9I2ZKZ
	QLbPqDAiAKYjG70akM+hlvlUWwxeDgMNjuSJWj5qKcdtME9tKlQ5x1WkmTwpU18HNL9mVr6uths
	cE2liy2xRvLcjXNP+HN9KdI/57chpmM8y5ESPRsoodhgGNnAf+04dwaMWy00UvboSVbRn43NpYQ
	U0xKKm8k=
X-Google-Smtp-Source: AGHT+IGflBlKKmsnkRHLRdVRAo7ixBlU3WskSkZZIOAfUixdXhdYxc0rTq/As2rL22r0UuNx5xw8ww==
X-Received: by 2002:a05:600c:695:b0:453:4376:8f48 with SMTP id 5b1f17b1804b1-453437690a2mr13432485e9.6.1750072807907;
        Mon, 16 Jun 2025 04:20:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm139952475e9.25.2025.06.16.04.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:20:07 -0700 (PDT)
Message-ID: <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
Date: Mon, 16 Jun 2025 13:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Vinod Koul <vkoul@kernel.org>
References: <20250616103252.32642-1-johan+linaro@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250616103252.32642-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042009_466343_4CE9AFB4 
X-CRM114-Status: UNSURE (   7.82  )
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

On 16/06/2025 12:32, Johan Hovold wrote:
> The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
> its Kconfig symbol but the defconfig was never updated (which breaks USB
> on a number of Qualcomm platforms).
> 
> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Thanks. This was sent on the lists some time ago and since a week is
already in pending-fixes. Should be in coming RC as well.

Best regards,
Krzysztof

