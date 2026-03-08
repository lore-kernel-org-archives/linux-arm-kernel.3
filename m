Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA8EEA8533
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+oeMLB3/japs3sjO+LPad0LBSfq76o6HaAy/Tr8FiQ=; b=e3k1Pe7PiL+zQTMSlShgA34KZo
	TOdbgrtdy0w9zAE08x7k4ByovC1I4ET++5nLGNJBN1zOJrAr3cIOD1ELw0EXpZBq+NBIdyUWygEH+
	r+v6wKZ0OtqOtOUc7k5wYqf9DUDk7HJOyQRdZhjCesY5jPXLvrb/p3PW0EDceJjdWzfWsnON8/ot2
	EtwthP3SbOI+5WNLCpTZ2BYkKjWs7sQxNmyEUnvAwByM0yqbVPFETK0eTnQ8XIAWDD7wOLIx6zMsW
	KBIz5SVl/+RKNeKNb2cjZbNKbeRv+/31Kh+Xlt0TgSMJyJZ9YHjgn/4gI8IlG1ZKA18FyfcU/+Mxf
	grWWxrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzGeC-000000069ZA-2tK3;
	Sun, 08 Mar 2026 16:06:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzGe9-000000069Yo-28Nx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:06:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso15752575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772985983; x=1773590783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+oeMLB3/japs3sjO+LPad0LBSfq76o6HaAy/Tr8FiQ=;
        b=hOqEm1vTkWhgIq0Knfwm3UPLPU8pmbXtJ2SHkwmo1MYo12wrPW4P2RE39yO3x5hUXQ
         7JljAHUgPNcAbKxBbfSHzPvxxo64WwHcM0MAFYNb6Tu7jR6L2y3B3m7QTKs9ByFv1siO
         sE1iBqOe7pzQQJsvErc9hydaof8u/gRcXp9bGPwYdfWdlE7D4ntNJKDqfZHgfc1ZyQhY
         UoVFXFV5SWwGIZPH/0UsJUGgb34a8ABoBSszemhioN+0ExYGhQQ1w/u5k8PArGKsBVdZ
         VTNJN/YUovTKchjUB3pae5tcClADMtVelTXvSEDkpyEXDDozwa1nHDoRvS/8cCR5eN2I
         AYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772985983; x=1773590783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+oeMLB3/japs3sjO+LPad0LBSfq76o6HaAy/Tr8FiQ=;
        b=waOKkfWG3HgmVJwoBwPad+glUHHZ7ZKWkHTBsjXtw9GYT9z3YR/96AMlia4MYCTe54
         Z/TgpoYz5hzCR8N1bzQe/87rlOVj8CtxsL57HbZYclefdjAitzP0XNSKPiTKyUCMToXr
         CS4qG4ot8sFoytyvioK6vqAIVs6Nt/dZ2Nn/1nO6vxwjvQO0pk4RV57W8l/fdjBQjJbz
         1gsqyUqr2sQtLUmCvR4raWve/wicLqRZ0PHBfm3QN1gns1a01IumDcdGdGJ/QgtWP/wA
         8kt5mGsM/7LvZPNnSsbQFM85ULXpiofhmVR8pnchRE86pyx35CAQmw5VrQjZllKvFJ23
         PpDw==
X-Forwarded-Encrypted: i=1; AJvYcCVhH2bH0CzMyJ+0eaWLZnXCFiAkX0dfrt8iwDJ7j9fDDaopttTlCOHS6kxLtyQNojrtwmy1xcxSyXQx0sG70Ae9@lists.infradead.org
X-Gm-Message-State: AOJu0YzvKutjQPPhXOJXzdTYfSVfBYpuLNV4pzjV03/HIjReMhPH3Ed8
	O8iq7P5tbwYaI8KhXcEejbg9OduV9Yb/KC+qASjHaUhfpG4pM8sZsxW9YiZSAlSALpw=
X-Gm-Gg: ATEYQzyeBFN/yJ0MNBRrtPgzse/srLN8Fph3Pi2tZ7KhIVDKDzzy+olwjiTOO3POjHT
	EHj6MEO5y8oytNpu26szZCHNALlioJpP7tfL4Mbp2RRP4gdX2f3djW1fteaw6pL9RHNJgpB+doJ
	P0EM+vZTFVVW10StUJ21eXhNVbvT5UGJ3YAzXpsqiYFFEdB2+1qWfRT3D5etRnjd4g9DrKAuYZw
	8zj++MMvzj9SmPZZrQu+ciItYj8i0X3xm2ambPCJuvqwGIoheTq2RNPUZnwEheZklvkjHRBuUBk
	l0HbyxEaXfsIVQUdSALryEVPTtCHGu4ggFzKH8ikfUkh9r0eMKw5x8fw1wUrOgoRxxBLtsV2Fv5
	Sj4lYwxG33dnqMAWoLFYd7ebOKzqfD7ZxOi91p5QoBf+4zEQg/81mYEmkpk52RBpH8BcswujY7S
	TK42fsC7uML6EMf2jMaTtXVrErkff1lA==
X-Received: by 2002:a05:600c:1c0d:b0:485:38fc:7069 with SMTP id 5b1f17b1804b1-48538fc72d5mr34821405e9.23.1772985982454;
        Sun, 08 Mar 2026 09:06:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48536150e61sm70428805e9.1.2026.03.08.09.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:06:21 -0700 (PDT)
Message-ID: <0d324ec5-a13d-4fdd-818d-85eea60773b9@tuxon.dev>
Date: Sun, 8 Mar 2026 18:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] arm: dts: at91: remove unused
 #address-cells/#size-cells from sam9x60 udc node
To: Charan Pedumuru <charan.pedumuru@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-1-3dc48fe772be@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260307-atmel-usb-v3-1-3dc48fe772be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_090625_626540_61C0F790 
X-CRM114-Status: UNSURE (   8.27  )
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



On 3/7/26 11:16, Charan Pedumuru wrote:
> The UDC node does not define any child nodes, so the "#address-cells" and
> "#size-cells" properties are unnecessary. Remove these unused properties
> to simplify the devicetree node and keep it consistent with DT conventions.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Applied to at91-dt, thanks!

