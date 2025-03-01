Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=; b=Cwk4L9c+OiDkWT1/6hXr9sIQUL
	8kAvMHNuy9pRwBRN0FnhMGqkAkFteIEpTF8lMFJm5SrrkOgygCm4620AggMHTVmq5Irxe6Mzi3QIg
	7/LO5HdW/8BcGQecEOzHZ2Qp+W4s/fBrpGOj+kiKKn3PPV7OoITPT1c8rRPATJDu2qFLKk1dExkaj
	YOcUc0xWrwRfzQCPrhVe1kqjctMxFgy/XPFvOy3Fm0pkWMiqeBJiijWyC6SMd4Pxq7SiAdpx4NyQo
	ior94ljVYtkG51MStUYqAIK6JG9zQEGNEaTTikgsjFmi0ppm/5VKVZW8VZ2W19/4vh09RswDzRsuH
	8xeMZHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNgy-0000000ER7h-2vTG;
	Sat, 01 Mar 2025 14:19:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNaw-0000000EQL7-14tr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 14:13:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abf5f2e4482so5464866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838412; x=1741443212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=;
        b=GpPOMp34ijnEL1BPIhlZGazmRt3avcni3tbgAyt1X52eo5mx04LfMxRMv7HruO+Vg/
         fZx/bfTWWV8dQiT1G4b6JKU8vyy3ox7Kp0pCgMcdJ7V2KkUh/CJ6Ek/N5vO7qlgFnyX6
         WsY7vcKDO1U/D4KBbQdbC92W5Zrxaln5v3FnPgzEEYlrY4zq3qW6Mh7SkvEz8jT32dwz
         9j81wqjRVJrsJ2MR5lzqhqIvpytr1hQe1IFN1ewFB45DZOQA14ZlHByZmUwp6e+cKBYM
         cFEbY8NPyqcEMY0RXTXr1/8Vdpuw/TdWl7Vb9iIWGw6m+AqQ21gZP8un1RC0bRe877yD
         EH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838412; x=1741443212;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=;
        b=DsTs4DyubrqvXe13NInFXjS7l2VR23J0tHaQM6DwNsfnVDb2PLOwBReaB7e3fbmKAJ
         E9Iv74uD14MpmOfE0PKg0vMkT6GAG8vw0pYmqdS7wDRjfFFASf2ik1NiUtjYj4ZVIhDD
         ZEf5Buv0InOOX0uk96ACvpYPyKCJg2TYbPe2M7ueqc4wzc7zajBkmyZssJt10PoszDlw
         SOv5JMrPIdtE/3VmDiiMYBaCD231eJ2ce0UPXi8rpiMiPiJWVjbb6r6nmvVv+AV3Wybz
         LBBS1Jx3b0Gidxx1blA2GQsSb4K36h59C9yr2xUuy4xDDQbcK0iZP9WC+nV4RY1TKyU2
         01Rw==
X-Gm-Message-State: AOJu0YxAsQlTkYnRBCZNetvn8gNZS7dKbvR0C518ecMmEJv+yNV5iWNa
	rWCHl7NqVwyNJDI1ZuwQkMuttjCCDu4/XNfPQGvH4qPmhIz3qqEAyylaZS/hqW8=
X-Gm-Gg: ASbGnctPVw2r77xmsHpwLqxnB+p8v/7WveZLHgLx4Vg9NtSHxV5s1sk6IITiVp+4/kX
	xo7CuG84IfsUKrtE2GCXcVk+2OjFpEUe6nD1rRuebh1V/RT/LrEHtX7JNSjW3FrMCd2G0ZlGIV3
	VLOygQnHv32EBko9DESvrrn5AllwS7Dy/Dr502mk60OUQxU1ZaOHg49xu59m1L64qNfidwxA2QU
	6mCGMb6/UbmPIqROGJrX74Hgd1/3W9ZMSo1K3oC6OFx9EfrLtBVFRc3l04lR3BE+jdkVKJCCF/Q
	CDM8C9/uS9D2eS8k3H1KHVRBBTT89ol5A6Qymm5wKZUCJPtzGCr/iST1IoFz
X-Google-Smtp-Source: AGHT+IFpPIcRFdEEfoNRMXs9IiWLSrC8PzKuk8Eq3BxzR7HGMfJRXaPfAjNFS/RvB4XMH80jRhalrg==
X-Received: by 2002:a17:907:7285:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abf25fc79abmr339769466b.5.1740838412580;
        Sat, 01 Mar 2025 06:13:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 3/3] clk: samsung: introduce Exynos2200
 clock driver
Message-Id: <174083840951.17657.11144069313199701338.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_061334_298986_16C76D7F 
X-CRM114-Status: GOOD (  10.73  )
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


On Sun, 23 Feb 2025 13:56:00 +0200, Ivaylo Ivanov wrote:
> CMU_TOP is the top level clock management unit which contains PLLs,
> muxes, dividers and gates that feed the other clock management units.
> 
> CMU_ALIVE provides clocks for SPMI, the new MCT and other clock
> management units
> 
> CMU_CMGP provides clocks for USI blocks
> CMU_HSI0 provides clocks for USB
> CMU_PERIC0 provides clocks for USI4 and I3C blocks
> CMU_PERIC1 provides clocks for USI blocks
> CMU_PERIC2 provides clocks for USI and I3C blocks
> CMU_PERIS provides clocks for GIC and the legacy MCT
> CMU_UFS provides clocks for UFS
> CMU_VTS provides clocks for other clock management units
> like CMU_AUD, which will be added in the future.
> 
> [...]

Applied, thanks!

[3/3] clk: samsung: introduce Exynos2200 clock driver
      https://git.kernel.org/krzk/linux/c/11fd259b7a9c386179f4bb9657c7597c8e8de067

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


