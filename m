Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9226EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27/J3L6We80CsZl1ks+TbevRRjmRGKYmJIc0WPKlez0=; b=dKqeS05rJjzvjG3dqVfAvcGU1j
	2RvtO8yd6//YMTTvqWGyDCB5vFEHDcd/w0WeSiIi/3j6klnynD2hVQjUSBP7CuqnCChRSs6o/8Ek6
	d1pAKWXxkJLmJ9lpb7P+U56CPQXLmvPE/rTDk5i6q4WsMiH9WuoXa3e9udB3lGs5QE5E/I28mb3y3
	+6x60sjHjjJYDePwdt4Hf1UKSjMRm4yFlwg8xEHwvH/gzTHxqYwM8QJUWfqxsf1t+bWWQvCqarKUh
	6Gh06p1uHgkZpVScRqyuT6oBN0ewLijKiFQxG4m3Q1vp14EAfXltOJ7uX+vcoz4XyL8sNCBACPwIK
	CWl+/Mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Fhv-0000000E9ag-2cix;
	Fri, 11 Apr 2025 14:50:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FQb-0000000E6OC-26jP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:32:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39ac9aea656so1954958f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381940; x=1744986740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27/J3L6We80CsZl1ks+TbevRRjmRGKYmJIc0WPKlez0=;
        b=V2Az0OOLbI4KtggszS/UNfoRkwK7P7FbEbMZr5gw5VJzJTR3Go83ihh3uDAGLBdE0t
         YPIKHZjO4U6Iut5MwRQFoKepBahQQ1sa6vpvTQDK7/o+7xgNghf1lsppxcnYWtgc5RW0
         1Q0OnGmppslCrq1ahY0ozuI+dZwNiLIcaxLOas3zbsYRJ+Dn+mYnDyIj42E7qhtEKaKG
         eFSIhXFAJzLdXy0hjwG1/haU8F3XaUjl8z+CV8V5Np7ALgIQSdPMXS8ad33SxLYJsfsP
         MbcMw0Zvack7fGHmC+mhQrqM8ATmkC8XnvYM9E67ToSO/4DAG9ZkwN2sOmwoln6rXF98
         OZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381940; x=1744986740;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27/J3L6We80CsZl1ks+TbevRRjmRGKYmJIc0WPKlez0=;
        b=dQoJw2cGaUOEfVi8tlIp5fyrZJOokH4L7HeShQyjBP26v560egK5Fd1QtBVqYaYNz9
         o/Sgw8u8rcogsyEuraTAbP3XUY9pHS/IMqYEQZWw4zoUnvq5Ce9p/iuyhfnkPfE6A8mk
         f2TFk/5xtOD9MlVZ3yModfPi5zpc8qzTRhmfz7XVfUrxD9VVYFh9g8+6keszytrgtV4a
         opGU5lSNXuLQeg+cgV0Ki2s2LaVE72C33h0h1ypK7kG2719AqGxnW+zk2TkIc5sed8Af
         t0sLOefCDLOX6KmejpoeR/ooYf11BHAx/N+U65sDhNNU3jKRrdpBC0uWntTNkhpzyo0w
         /fyw==
X-Forwarded-Encrypted: i=1; AJvYcCXKiI26OjzsyQ5P7KV11rRAQaRZZjJiiPSAckVNhZBt0AcTldM9jSv9EoVTKcz1tvMerhB+HBrguDkrV1zQj2BQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8mtH1GsRtP/KWRewJ4MUyiJwDsuw9LcJQ4edzopYyg6I6oGbu
	qmpUCAXUMWZUGEoVWnMk4MmREpeJbBAzYMwMjL3dz38V1zq5CJLM2tcsgKnLQ9w=
X-Gm-Gg: ASbGncuRt1oa6vxMZhdpYYAkZ19OULZsrTrFKt+02MuNIH4w4o1oV1PZq8Dj0aXtpnt
	/s1n5dJxkAcHuLqVASdQjSPvd2JLcUPdurwpP9BbfNeRNcw5FiS8tPgmp61WV6egcXn2WJLeyjI
	mGLiF6rCUv1XKFeJ7I5dONsGRlR0WbDu6AfygflKnauf6yMW5p8Q8z9HOPZvJfXqahHQx0zj3EX
	6uOPsGGi351b/b/W6bxSxc3vfJ2t3eHf6Baz70CIbgu3DyVfauIKha9nGGoWm6bM7/LoVULSpIn
	IbylzVCTDRYXyJWMKKM67We8Q7N0x9ryvFGgSeZVOO1nY23X
X-Google-Smtp-Source: AGHT+IFiPmSAQA1/l8+XG+twJ9qD+4efyKnzMGJ7ym/3w4dc8YRER5NaT5QIdLtlkZVox4HHWYFx1g==
X-Received: by 2002:a5d:5f87:0:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-39ea5201e7fmr2132511f8f.13.1744381940028;
        Fri, 11 Apr 2025 07:32:20 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9777absm2145481f8f.46.2025.04.11.07.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:32:19 -0700 (PDT)
Message-ID: <0525b51c-98db-4f74-834d-a7cfce927dcd@tuxon.dev>
Date: Fri, 11 Apr 2025 17:32:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: clean up and remove
 usb_a9g20_common.dtsi
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh@kernel.org>
References: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073221_546730_6660A97D 
X-CRM114-Status: UNSURE (   5.98  )
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



On 02.04.2025 23:48, Wolfram Sang wrote:
> Wolfram Sang (4):
>   ARM: dts: at91: calao_usb: simplify memory node
>   ARM: dts: at91: usb_a9260: use 'stdout-path'
>   ARM: dts: at91: calao_usb: simplify chosen node
>   ARM: dts: at91: usb_a9g20: move wrong RTC node

Applied to at91-dt, thanks!

