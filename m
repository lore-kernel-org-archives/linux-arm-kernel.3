Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DFFCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3zy+4FxM6e/ZYJU6tdKRgGniGSW0dORiZkBYaBYdq4=; b=FlGGpaVIlcqAODi7yY1A3XJk0X
	DNGmH7l283Ns6H3jsBqcm8IMFA41BR2cFg5dvtxOJQ7Y6/AuYA8aGqMS1gFQL+jFDdAZfmuPM6ZOf
	GDXr02Y6z34m1qrZQJabkwiD1JwYjFy7n/eK7B/nAcJEZ+LuaLjf9rQI9G0ZVI+iauHCLum5TlC6x
	0w7DcYDuiNDIQJXyaPXgQPLb7/Iqa5LjOFe+69zPeGE+W2EXP1tm+zJEF1dPoEDKUORV91LaZgCDf
	QoIdo4XA4IcOJgcQz9BaclEVwGsSJK6miWkHS5N2NqRNLMqptZg+icXjt+D8+Aar6AhLQ/Ck/kR70
	UisUAkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgBB-0000000A6RH-10pF;
	Sun, 31 Aug 2025 11:25:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfls-0000000A4p8-1mzh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 10:58:53 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so62850266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756637931; x=1757242731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3zy+4FxM6e/ZYJU6tdKRgGniGSW0dORiZkBYaBYdq4=;
        b=gT1FfXfOnD+zsc76ELMFiM4HSzTMqQDaVpruFSAut9RSiuoRCM7NM9f5Mkvj+3OkPN
         tUFX9Fo6YPUaGxAnfDUU58Q4xsQzzsoyV11aI2AG3ymJ/mb3OrTOyji3KCVBNlGJS0my
         hg5a/Q3AD1OG2RCL4chzDon0Vwu2u4yPp0fw8X6EQDytvgAZ+6MhnLhu/EAFoAdhhWqk
         oKGJcL8UjmzQoSfBhyXcxbesS2AVlXi0qOXx2NmEeOdY56Mc8vspCTEs5cEQJHe4Sx+I
         UJ9gXTdB2gGqiMRN16Ba2Pc8jTUE7mkobeKpg/EEEQHwoXfkb0mg28dJAYDNAG2HbpVI
         gZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637931; x=1757242731;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3zy+4FxM6e/ZYJU6tdKRgGniGSW0dORiZkBYaBYdq4=;
        b=R/jv0hwE61BO+7DprK1Bv8UF2ePSaeRINnRQaTIfTYQ81i7Ph76/6RmvSlIgokD2DE
         nutMQjR7kVOWVbqKjZTieWYBrRyabKsHRCjxXw92pl0GHVlHCbAMq3dO6LV/oVkh6BvJ
         +m6sZs4uGBO5snglZQLF/aFOPhQy48H7CLM5QhbsFCNjVGDelhxwQYu2LBclqj/xBqul
         A0HlrtTOUS+oqMrsHjE1aYKJykyEvvIs97NNa3mVI4HXokcJ0A/3mMWgz47huhtG5M7K
         LF9a/oeXzm5za/YA0i0MrQL5xkqaU9pRM4nAUoJ+XSjo87j8d4jdWsVkVv/j58F+8syq
         ycKA==
X-Forwarded-Encrypted: i=1; AJvYcCUIWdR45a66OyQ9hFEm0F+4/uWQWvYWSxb5+ADvf3SfcqjuAfLaWR4Y7/4fj/kY/u9KR73F6I1hvwIHE/q9wPIo@lists.infradead.org
X-Gm-Message-State: AOJu0YxaRR3fngNxJnO+nE8T6Nkuf1k6CbpUUajUFLh7gDxTVkE/8fBL
	XVciy0b3NbV8Hw0pPvu/zgXBoicjKTY7I2EphU3y0q4he15LbJoTTl1748VCXFfE5SA=
X-Gm-Gg: ASbGncuRcgDYPZKHoJRhHgqa5z4SSz3fVj5RkrmYVYmAfnmN3ESgU4MA5ZEbVZlh1GM
	kWyebOiJhwts6XzX7829ZbCU59chnFfzTTsXNdcK9pOgLH3M9q+EeVM6N/k8EVfGaZljW5s6lzi
	1iYaqrtPEfZnh/XEa1xKN9yZ/26ejVK88RXClID+dDlYxL/53DMH9ghYG8wdGmdEGsyFxMncsL+
	+banTHbO/nOnP02pPHPlmDjOri1f0c5Qlc48UZH4Txdb9oPk89FQKMGuDWQvOATPyGPcR20pIfO
	AwpxMhorTqwDnWIr58sEgeFxYEzrShca6CfK3T4+eienTCKRvzbCFxXISzEdgIQCh11OvqNokLz
	D7bOWvYhL+0HYJzA/tdVbLPUztsG/gHoXwVuNT7rezkJQAFjk1Q==
X-Google-Smtp-Source: AGHT+IHTBJiyshvnvgCsLBk30RyM3YNR2Y8KXQJ7s2S5taB2fYhC2gtwsyGjCqiwFtwHqMDToZZ4hw==
X-Received: by 2002:a17:906:c152:b0:afe:c2e7:3707 with SMTP id a640c23a62f3a-aff0ee1afcemr349633566b.4.1756637930739;
        Sun, 31 Aug 2025 03:58:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b017e4b9ed7sm349176466b.90.2025.08.31.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:58:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250830093918.24619-2-krzysztof.kozlowski@linaro.org>
References: <20250830093918.24619-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos2200: Add default GIC address
 cells
Message-Id: <175663792937.36292.10292837875011385286.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 12:58:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035852_473393_725FA4CF 
X-CRM114-Status: UNSURE (   7.05  )
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


On Sat, 30 Aug 2025 11:39:19 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
> because GIC interrupt controller does not have children.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos2200: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/59abe5c87267f1f3bd627af20355b490b59f9901

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


