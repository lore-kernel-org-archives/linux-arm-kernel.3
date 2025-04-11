Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650B1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uX8mZpRv3TaO0XMpHMymYqwqOh4McJjARgLCOSuvF+I=; b=JiPLj8mknGqD+HAVyI4qlKwlFu
	mTFtwpL0nnei/t3Xxc3tX4t2VHkQos9BKIBNmFQipSiABEGTYK/rB7Uz1YywKO4UQU4lD615VCjFn
	MB89tA5AKhXbWXZhAwfG5fGarsZKHSf/fC2/z4Zr4jwPDdVpfkOAwm6TZBwtfU7NE1ejJSSBDEJhO
	xIJxFnAeH6mpVzsOLJ3skKOfgwGXHVv4J5wKtwrREw1itdsvyqSCdQJDrmsIWe8ljdVKFRrE0cvJU
	B8QjeHcgBmw6HIYnUDcFCQoC4nw06oPhoM+XItFKWYcuk5L5BREocgqPkmq8BKmR+uTA51tiCJi27
	Iu48NyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FcX-0000000E8fX-3X9M;
	Fri, 11 Apr 2025 14:44:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FPt-0000000E6Dj-0NR4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:31:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1659464f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381895; x=1744986695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uX8mZpRv3TaO0XMpHMymYqwqOh4McJjARgLCOSuvF+I=;
        b=jhMCvTARTdjNTJrL+tdricSkpMj8HJJUKxnRt3t+7MompRRNArWSYisNqSg8ss7zw4
         A6q8aLf5KIrOruf1oSq+xULr42dHg8FI2rq5Mz65tjg2G20C5p3W7QAYqZtwYs3TRyPg
         uijn4FjevmIIv/OIJPLnBlNFuoIOZ/YlwjtF857YmavjEcVKcaecDqGN2Met1kMzdwx4
         TcpzE9ep3hwmDiA8wdQZ/FIhA7nTqtGM744gQhL7oRfmPxZbJy4ZHXEI+thT67r7CRW4
         mGLmbsdwOqGICTV7Nd5tvCo7+8Kl8LR9CJNOV9E31ECUMm3WtNTbgxu57E+mPhR0f/UT
         ZPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381895; x=1744986695;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uX8mZpRv3TaO0XMpHMymYqwqOh4McJjARgLCOSuvF+I=;
        b=gJofb1tBJLcCwlOR5rBQE0NsfpLbD2fVzYoJK11dhiYd54w5tEW5i4DKYFED/fumEh
         i6kmPPrdjYd4cKHQ3F5M0cwpRwbbYMbn9bax5VclM04K8cMBhRnD7CjkkxAqLLXO6oTU
         0h7QiT1inqlIJpaM8MtBlabl/rOdIEGOEP69QpDdHewExXo+wkvR7MdO69i+TJxTClnR
         ACwqIR0bYf4Lr/vSkxcJLP1ZLsLMcEPDt/aImngC+/L8leFlnwFJ5d5XKatpFjqB1f8f
         QvruF11zUC+GuNG0l4DOcoH5HYJy7AfBV/+E0QUOaiUEVyChZH/PHXREcuUJ1ZKN8cAC
         8XnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPETQPO9bnEVp3Jq4HNZIiembinjPowi+13t/Azv6T2ldBYks0VWMAmQ2tWkBA9O3u6rkm+FB7Mvjo5CYsXVbf@lists.infradead.org
X-Gm-Message-State: AOJu0YwetfSwyfogbxPliVRWWtvFpar4ull4i0xQC4MLhSIBqxbHd+o8
	DFnMqXS17Vh/ni62QIEuvbz3VYlO3fduVpzDEaLSL+tuDRod7x/0Xg7fxrEHCFY=
X-Gm-Gg: ASbGncuwXS6hvDDb0uqYjehus0Mi3gpYshhJdFbaNcTxO5TlR7teAmzU2mV59SjTIiG
	XeurrRhGM1x3UFVOe9KNdrqWJAaxTO1sz/VGcGXQwCYPHy6mPKdzuOP55YK6cQkxGfdAr0kZgb6
	WUTVFutUZODFvgHU4oHaqhPbr/aP5MJDAkauk7ShmjapRdJiA3E6grz/P+s3yQwPSAk82MbquaO
	PRUA0Y80MgXcv8VE8DcElzu5zNbQLB90jbm34VYwSHFhvxZodbtb+sJ6UtqK260IzA5/hVBmutN
	5VbSXV50hdF3d3txOBSy4h7DPKHU4O6FSemKdLS1M9sAxjm7
X-Google-Smtp-Source: AGHT+IF6fQXGohs0eaWkqaW21PZNfzTYkAsJGJdiE3exF19xC5xUoXmH8agbdcKpUbaOpr6LHpdP5w==
X-Received: by 2002:a05:6000:4205:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39ea5201388mr1958557f8f.19.1744381895364;
        Fri, 11 Apr 2025 07:31:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c123sm2239120f8f.36.2025.04.11.07.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:31:34 -0700 (PDT)
Message-ID: <302173fb-7a23-4ea5-a6f0-fa7318f8b6d6@tuxon.dev>
Date: Fri, 11 Apr 2025 17:31:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: at91: usb_a9g20: add SPI EEPROM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250403064336.4846-2-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250403064336.4846-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073137_131186_0CEC0089 
X-CRM114-Status: UNSURE (   7.85  )
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



On 03.04.2025 09:43, Wolfram Sang wrote:
> Schematics and board layout indicate that versions with a dataflash
> instead of an EEPROM might exist. Let's handle that once we have
> hardware to test.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to at91-dt, thanks!

