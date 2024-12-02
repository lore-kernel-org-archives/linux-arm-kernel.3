Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6E9D10DC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czYJoJVZrGDrcGrSH7xTDrifbpWsag5ZixMFLdzGQBA=; b=QQwFGDJr4ex07hOMMBrmnicLmq
	ai8Q3Q0Y5oOOJcoR4pVJZXOMj2WoXszL087W/Q/AA6/urLO6SvlkLgSsvKB5xAXnpxkcxLrEhU56o
	9ku+H2wNS8XFFpxDFAoWexoYXDRf8npMvYvb5WqE0Iu5E60ug8H0H4vg7nNAABrlJIFHV/NJDcqGs
	pMccAEJinfESBrA2/5cnt8GQAY00p9UMAw4zopMWYcPXH5d8ienOxYmXMDItYpXFhIrLI4/9pOB+j
	2hdmBmorPkNy1EBKf8Zqc+bM8+7oNnN527CiuJ9nCDBUfv1zV0/3vZMOU+mqJHnPcYwuJXXjishCA
	FTEWtUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Cz-00000005Tek-2MCU;
	Mon, 02 Dec 2024 08:55:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Bh-00000005TLJ-1wVe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:53:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4349fe119a8so4731985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733129627; x=1733734427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czYJoJVZrGDrcGrSH7xTDrifbpWsag5ZixMFLdzGQBA=;
        b=eg/ejnt33DRATCxvaWPAC/IMCzpmxSTolQrmcdnacLl7Xj6XN6dEc3VCeTufCHs12o
         8DBNEy8RMHTx0PhqASJDwnyjycwUZ+bI7MAhKxyNdGqOSqQBZ2pYxOPbEzBrAW3a1NWW
         vxdis1N5YPZPvm6OaYhmphllWg8qRp5zKGD+KpE8Nyd29JJhJlmHmkc9/3RlYYJcfuCS
         TypeXIg6hTn5IWYt4Yt4HdM1/QcHdfonFDVTzg5Jd5se3FivyMDMDxosdlmOdv8YKfNA
         49TbX3zGuf5ONSTzHGNrd496luGHuNEepqQcds87vggXCes4VC5eVFrH2ynZRyNv8X5C
         8fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733129627; x=1733734427;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czYJoJVZrGDrcGrSH7xTDrifbpWsag5ZixMFLdzGQBA=;
        b=DR/Fe2SEbDWpix09Lkf/M5gCYr4eQLVJT+EyFRxXrSHWnbpr2mSYZ5kgGr+/q5nPTc
         v3grGD5fMo63rwqlgWTZjkf3ncNJ6Y224pibHo4KGGNXdM7b3lhl5s30oezCqHbIo4Gv
         JXRLpfK/vB0UurwJeDMvy+KllWA45YjAxD4hbt3Y5Cybb6sHPVoveRbE65QwtmhADjbN
         +vUlm2qQSa5pia3oMfDcNIoz0pm8NX1bEUObVHckO88QdxnXOnZgY3EJd2lEM3QTEPn7
         GXPC+tmByxKLjLEzcg7ZVRpu53KjXgjLuFKyLobhb4EXQAy1aEK7nvdcw/XxRcVpzRwd
         R3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUsGGcroY+78fV2UKq+MzxMXzXBa4nUDAeK0qlli9rMkdAC8LVMovzz2W4UZI7nr+y/YKSkd410ag5t3dp/vhYw@lists.infradead.org
X-Gm-Message-State: AOJu0YwyN/+2TQnAUAlpgPFuWQumrlzE+kHHHvEDetB4uG0MMYx9toZC
	tFkW/STih+/1de5sZ7fPD+GYLcZzhB5D/fFg9QyLui5Vsb68F9D3Z4IaWBm90Es=
X-Gm-Gg: ASbGncuRC+TFVNRR35fZYEc9y6RzUtZQ0rxY6ZxM5vY3uifL0ENCy2Z0GDUal5FceWJ
	o3t1ww73T7WeCxw5LwCtdgkHPVEbUfzu7LW5uuiQFhNb95VAJFlV9zy/IC37qpx75yZm61Gthn5
	h4hheXoUv59+tDhqO7+qGaPDf5NkwAAdfyuDRzOTTBcrYaHOVDr7/ZiGASAMv2s7w88k1m8qW3j
	QAZYkOI4xgfoP8WeFokSvYfc2jBfzkEZsW8s3R8VUFoLRSVfgfEjQu8Jx8bLqdQ
X-Google-Smtp-Source: AGHT+IEt2Iy6Cb3ngoq5i5atsn6oO0wODGDw8HmWj/LmUre8JQUIZCkcZBPIKWQx3wB5DyufHzMuJQ==
X-Received: by 2002:a05:600c:35c6:b0:431:4e33:98ae with SMTP id 5b1f17b1804b1-434a9de6738mr75550165e9.5.1733129627445;
        Mon, 02 Dec 2024 00:53:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a972c33csm140920385e9.1.2024.12.02.00.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 00:53:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241023091734.538682-5-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <20241023091734.538682-5-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 4/5] arm64: dts: exynos8895: Add serial_0/1
 nodes
Message-Id: <173312962604.23906.10353059101648062689.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 09:53:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_005349_516243_82CE9932 
X-CRM114-Status: UNSURE (   7.96  )
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


On Wed, 23 Oct 2024 12:17:33 +0300, Ivaylo Ivanov wrote:
> Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
> allows using them.
> 
> 

Applied, thanks!

[4/5] arm64: dts: exynos8895: Add serial_0/1 nodes
      https://git.kernel.org/krzk/linux/c/aa33006c53c9c56ecbcbbb9b5415e27000eb86d4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


