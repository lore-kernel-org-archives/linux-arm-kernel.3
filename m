Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B53BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khsQQuQ61UqfLoQjYcyUre/fUsjYTl1Aj9lrnLjhkeI=; b=pGcFXa5ynjnYTiuPrWIoCEFxw7
	pJKTtqPMDoIdd6NpztBfLwuTdxkR5rDjG0MREXKkorNHCW0Gcl5P12HNKQBUXnYp7ho98psU03suV
	oTZmaaecFb7pCU6LJP7aBcrXXe8jIogBcLS6c1ZZpt2hBwkFjoX+f1BcHcwD7xR7JEXQ+Mvr1XIL7
	sFQV81p4uVUvhVXFlVEjhSaMcwnB+INsxzqzjoy49Uva5yKW62DEUPKLWs8oDDQk3s2j3nOokmpOA
	Sgw44A4BmzRt4tgIDtXGP1zoSdJ6sqY7NIW5n2gi7bNBeIie7ToZzpTJOP8Y7CZaxjZsqy6FnpkwT
	HCzjDWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqIZ-00000003F0x-2Klr;
	Sun, 29 Dec 2024 10:13:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqFH-00000003EPK-1hhq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 10:10:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436203f1203so12032655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735467001; x=1736071801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khsQQuQ61UqfLoQjYcyUre/fUsjYTl1Aj9lrnLjhkeI=;
        b=wY8/jCTMW4jHKFgELcdwZcDcLK3/X5Am3wUEH01MulEoQrnAGBSA36vDoNCh72N2fu
         1X8UiKpGeyF5awiXov/AfPyaNPQOgS1TbnrhPUpetgsAp0mguxZA3eJ1C+kP/WiTXCGf
         39tksjZ+r/LqelOnIzIjGXGWI61VyXTHMWMZi5MJS2vfvzbH+pfKmzjdDAHB6D4eT9uY
         BiyEnrv/uls+oJ9n6LAfRYnAbSbvPsiSieJLcgtVuC8bA5p1VXF6f9J+wIU1igCcVb0F
         pebSuC+tcVTuSGl6oYtzqGFhnq6gRpC93XC5oCuMi7VpbFrxfNQ6bDiLLHPxI0kh4Cct
         qTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735467001; x=1736071801;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khsQQuQ61UqfLoQjYcyUre/fUsjYTl1Aj9lrnLjhkeI=;
        b=KVn1+H0f7GYRctVqwzYlU6DScco0wm1M5YMJCKu+wo7uxqLRY/ds53gYfM3Bwu6mqh
         B5cXeAtQ6s+1gIqI9+k7EuSrxYx2Gxsh4N/VZRE8Qzpyq0LbOwHaiC3I39SF8UDEyj4I
         /r72VLWWEjMctfz2iYGFxfuPqLDWZrgaGhB9FbLTQvx9rHHybHCw3QNlrD8aUF0tXybZ
         hi8+1gMfUrVepZTIsbNxuq/HotbKSQ5NlIMYaRFrh9SNs1phckcfBtdg4fjl5ww489Ck
         hcOILoPRKbrUkTTOzH72hF6Yk6PDjElZCdfJ5P9oO4kxXnDwZF7gSxQXAQPdtQ8mKvAy
         aqng==
X-Forwarded-Encrypted: i=1; AJvYcCWlktpiojw1oV5TEpj9E5jQGQJqCnWsGZ615D2XEWhV4NDOByCsfFSyhIsRkr977B/AppCR3MSHU6wbVRuPgxg5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt+Z6kvdMQZwgy0OIUA1GbwRHtlf7g+4axUmflRE4LJELZzl8R
	0LkPUfAK8LlnqGMy8VNih/xSB0v4RXoOVCEfyukWEdZP6/5CFPHd1EmpCNzsDmFw6HtCTwXCvuS
	G
X-Gm-Gg: ASbGncuedpp6js3JyxapBIvBP1aKqA89L++1E50IIWfgjvKRI/hsjueEyg8Q/D+AVVP
	pZA/Zi521Ltx0N/nUnTwLpRLmznqPtLSPxbjRbI4Iu87csiaHj5/pSXH8hTkSP6HgfQN/VMInVW
	QXyA52drDA67jrpShYMvNjqPS2jBFIPBZtjQOygM3kkLf3Mt8BahEKW73P5u5/xRCS2bur50J0+
	h2nTvKf70mfVIkbOiO4D6WHvEQ+2pWtymbaRx95SLkZFAY+7V5L7lIc6Wzt6T42xonxVY2/
X-Google-Smtp-Source: AGHT+IHe3HeMgdBYJg120JuyBz3xv5V39AfkqdmPSMsMsnaeeM2fsQk5UW2Kgj9EB8ub9FEeeqqGaw==
X-Received: by 2002:a05:600c:4ec7:b0:436:6460:e688 with SMTP id 5b1f17b1804b1-43668bab39amr110519775e9.9.1735467001515;
        Sun, 29 Dec 2024 02:10:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea423sm325608385e9.2.2024.12.29.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:10:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 imx@lists.linux.dev, loongarch@lists.linux.dev
In-Reply-To: <20240717-partake-antivirus-3347e415fb7d@spud>
References: <20240717-anvil-ashy-544e80a1317c@spud>
 <20240717-partake-antivirus-3347e415fb7d@spud>
Subject: Re: (subset) [PATCH v1 4/4] ARM: dts: socfpga: remove non-existent
 DAC from CycloneV devkit
Message-Id: <173546699896.10551.718059378827423411.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:09:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021003_455490_049CB10C 
X-CRM114-Status: GOOD (  11.87  )
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


On Wed, 17 Jul 2024 10:37:56 +0100, Conor Dooley wrote:
> There is no Rohm DAC on the CycloneV devkit according to the online
> documentation for it that I could find, and it definitely does not have
> a dh2228fv as this device does not actually exist! Remove the DAC node
> from the devicetree as it is not acceptable to pretend to have a device
> on a board in order to bind the spidev driver in Linux.
> 
> 
> [...]

Applied, thanks!

[4/4] ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit
      https://git.kernel.org/krzk/linux-dt/c/ba9dfa76ebb030df6b605e16239a8052c3c02171

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


