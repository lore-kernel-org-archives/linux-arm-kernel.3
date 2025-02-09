Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF7DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiYTsuTuzgzPQyFWR4jKg3oel1E5dq+3B8E5LOdMdt8=; b=J97bxQu2R9n2fMUsNHcl4R6bnu
	9P+kDItctY7Yon02HC1KBnriOnT1XRH/kuTYV4SDzcWa81NpmVK4NoyTzXKNzvDG/8+KITx8uzN6p
	xzGKFlOvKmc1jWv5CRIcUdrUgLmLVPrA6Tw8r1QMdT5KsY9z5mYO4W01oQDEWRFLAzaTf+XqV3aV3
	c4pxKDWQ+aELYsqrB49YCeqZjirHMLRiTrEfRGJFinoyne7Hj6AoVIPB7mKNsLkUzZl9cwoHY94LH
	8JpiezFo977ljge3EzLjPfiR044QGQ665TszDXW2/+WosWO81xe86SPrfZCgxCpvRps0EstocvnJK
	KQSMwZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thDhi-0000000FTk1-3KxJ;
	Sun, 09 Feb 2025 20:14:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thDgK-0000000FTWS-2irG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 20:13:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab7bc75e0a1so11858066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 12:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739132011; x=1739736811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiYTsuTuzgzPQyFWR4jKg3oel1E5dq+3B8E5LOdMdt8=;
        b=l0XPhLSXWu9Lzs2U0n0R7QsOzOD+V9r6uAFwzzaxbbVeiwO26MNMZyvwod6z6FIsEF
         faRjsABDbD6QOwbCYTzaCztg/FIl5cvrp7AiPQ8MibO7CK+OFJvBZvl8ItGlInPb/L1r
         c1mYMcq3AddclNkJxg3EgUdBYIONy/po7fI1l4cR2zJwCn7bJtnM8bLdbOf/1q1A7yoZ
         8D2VxHfDmtYx8Hr4p/rct2fTBkLTT9ute7OKzihBUdxasfN3lzrBQKKSxtAZjX2bQp+1
         SyeuS3NotkPmuIogvAdRzfvuZaVwrYljl6SfN70h8xNGrKDvJAJk2cwmH2hNcaxsrFRJ
         uy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739132011; x=1739736811;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiYTsuTuzgzPQyFWR4jKg3oel1E5dq+3B8E5LOdMdt8=;
        b=PiusUgNrQ/yvUiY5PJYBWjb5wbUcvKUYywDAyf2sI09QYNqjckmGxTC+DBOW5ss7xX
         GJ8NnDmWy44oWagigSI9i7k+uxsRJ2jWI8pREdz/HFpf7uuSKgMstMes4yhs0tx7HCqh
         2ge0HM5Q5zh/pX6lHaoWXa/phEkep5zFCS++SZvtpppMHGdh0AU3QbC+iffqBT1+wz24
         JU08l+b9x46bXlnpNACAfk8nis7gCBlH8VBBnI35ihn2OoeCq6AzKIFvlJWyuBRIe3iD
         YM9z0MB+qFeCP/gWmyzbr3xJRVA0P4CIG75DE7234Ob+3jMD/bDvGF9y7VzSU3zw8k4k
         UPkg==
X-Forwarded-Encrypted: i=1; AJvYcCWzsYNkXu/Gi7Pf78tq5Q26ZyqDHn+oZMhhm+M3eS2j6zow3BKcziGrZ3gaeCscvZbWam2Mp+0RcWGR9rCv4OtZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy11brBH5/EB38EYHqcBa95HbkQRKVpqn93+Salm6Pq//1+rCvn
	stB2nUxlobXeKkZ3n57hfgymvPQAmpO6IAGSMyO8HqRTKFYnhpJpGXMydYInHCRoVkyF9Lse3s7
	3
X-Gm-Gg: ASbGncsnzwiDU/RR2hYJSROFfnniQhYIPA381SaGSdmQIeYW59CcCCHBn+7ahusM7Kp
	aq2vwqLr9E606muRoG7e0ZzYu2gqc0BTwrezqopngei0Veox13LoWFU3cWnOokn+U6ZLsMbHUFi
	3/MiaUv99rmke2VTRP7IvuKyDdcnZTZR3z6oBAvCglVJr/3YrXxjVU8tjnJeF0SC0Q6ACuwVE60
	wLOkygYQJy5otOW+gIIUIqfWGcUl3vIotHPTHp3hU89ieO9n4ZcO3Qbuk4veBGRjDBuaCYX71me
	jSwZO9CEVvvqyq/mYZTW8j6qlEMRScm2ll0=
X-Google-Smtp-Source: AGHT+IH6LtV6zI+A8y6zJKDx9SBfmOVuWXB20wFH30OGC9aYkEMnkPpyjSJ6uBw2QamPaMtQP9zP3g==
X-Received: by 2002:a17:907:9484:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-ab789bfaef4mr423937766b.8.1739132010736;
        Sun, 09 Feb 2025 12:13:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7736464c8sm725842966b.166.2025.02.09.12.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 12:13:30 -0800 (PST)
Message-ID: <dfd05a5c-60ab-4fb1-bde1-d04e3a108496@linaro.org>
Date: Sun, 9 Feb 2025 21:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: media: i2c: align filenames format
 with standard
To: David Heidelberg <david@ixit.cz>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250209195517.148700-1-david@ixit.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250209195517.148700-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_121332_712032_67DD2888 
X-CRM114-Status: UNSURE (   7.26  )
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

On 09/02/2025 20:53, David Heidelberg wrote:
> Append missing vendor and align with other sony definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

