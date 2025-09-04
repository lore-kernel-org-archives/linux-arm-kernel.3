Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=; b=lU5cmXxT8hb9cmyWdtpcJ464Mc
	7RFzy/OTyfit953pkZ4pwVDRvF/qDL4pLm4CIY7Vs8OdtYEX9uKwJt6mYHPs0Rdq5UiAg8wlyFd8j
	hppzzH6pT0PnF3QzaVGhr1rSDCxGWfFd3H0EYGAgiXNKBeLIZY5IFPf7nKY1aJ+bwsvgSe0/1ohmQ
	15rngjNZwhj6BU2XO8oTm0FRjHOGXdfW6vTwRgZqHB44RvSdjzy08v/nq46ZbQ4AzIKgwp0CaVPcG
	PbvHtWMV/7jiENGzM6ghs8uG9UcSuhYgSG6AGjfhS01djBdCqMilLcScfEj+pIz4PaGzL0ysxGGFQ
	6F5LoQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkW-0000000Daha-00lT;
	Thu, 04 Sep 2025 18:31:56 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAI5-0000000Byjd-1L47
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:46:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b0419ea61caso14227166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993576; x=1757598376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=;
        b=YNDoO48tcZMEqbUC93mFLXQ8/9vpQTmQaYDl7lz/kYO1RLbhICybmqo5o9JpFIogNn
         gAvT3L6sREAH+RtKBfnS7tfKcd4E3Q27Fqcm8e+z2xM2jcOxSxVZrluwwaDPSZEaqBJX
         SbMCq700/81Ox7VsNxR+vaRXKdgEWaRBVUZjEiRA+ICr+GdTHydu2QRgiVVcK1MxlLhp
         lguQ4XDUVPleslM//i3J5Uw4M7IcIezN7EVX29zhj3xp89u7OrQHnh3xMflc6AOKfsLN
         vbeSBuP//WWaRqoXOITuHlANE1Cj3OK9C+zZaXdGBtJiZHAfaHPlA67LYAOGmBGI3vlm
         TDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993576; x=1757598376;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=;
        b=YfJMPVvu0XRrOWbENToMV1o8ow2F9PbuRUksqLAIBOTig9FaMAK0hUkAiAKOmlvqoZ
         SIbVPgWGczQxji7HynDBrfB5aaQHlC0x++p2IyNsQht0N1SgB8uJUV4za7SmBAltKpmc
         0fcrz8eBeMeuwtp/NPcvlAKfNZp0IKmbUAcSCU1L5hmdUAhMcc8irKtIb21MZedNauUt
         10askq96l8mQYU2GLOLKt+NSxK5yb7GNptjbf97D4WSdpkqy6ENO23lZurag/iQrFpYv
         ZY+Az3pJwIk8svPziPqojq8piVq6gGp6jUwnsALolqef/yjgsNScB/4qHRcRS4qgbDf0
         90Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWDZDHHevsuqwhGl5Y3tFc1CdentJDbw/ZY127pmqdg3/c3En+hoeXYhjvDUhr8/lvfjth0nQP3tTMuL48+OH3O@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv7Hn8MB8nygrMbIlrcsrEBIdg9xRFb566DMqGCHKDZJOEMfNJ
	Y12EPdz7nrzzj/L9PuroWOlJ/2WCJpiBdcAJIb85bDNMkP+4+psQMKQKK1ndge1tSaw=
X-Gm-Gg: ASbGncv7An6CHC9miqBLb12sW8++875aofqcw6LrwXq+AKwgxvWS14G5jaN4+BlSDku
	e42+nmgfUqFFZfQVKAP48wIR4xetBjJLepl6VClz06jQA3R95hBirKRlUGA7O03+Bfzm/JKiCFJ
	5rIF3jQkLlVM3kel1NPqKIBe0AalaHSK3NKbCleXjzcsj7nR2DOafsEoNO6sOeRlTaMt1Wv2iUY
	I1p3LE0zPBGQ6+GveW9/iQuq1+97etzJXAUgHGCzs7HD9r+ZxxfmQCmiwYtD6w7DW90h5iy16Ek
	EQgc3mNj9Vi+t+ZDNKA6M0XGhsBFFrqHSdKMeY7Rpu+1bvMXN+SEXl+DMxvTNhCYCXODWj+11+Z
	ss931Y4D+9Hmcd0Pyv8bxQjO85fUeCyWtDeU/D4aPwEDRAQ2Fqg==
X-Google-Smtp-Source: AGHT+IFRjqi0rL8OiC4NZXNOIG4FcZYbVhKsdzHVKskJZtLsw0JBOE11012YrpNCw1Y7RX8De6y4QA==
X-Received: by 2002:a17:906:4785:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-aff0e28e4e5mr1209123966b.0.1756993575559;
        Thu, 04 Sep 2025 06:46:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-7-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41@epcas5p3.samsung.com>
 <20250901051926.59970-7-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 6/6] arm64: defconfig: Enable Axis ARTPEC
 SoC
Message-Id: <175699357327.171312.14592323274121562181.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064617_360190_3550A1F7 
X-CRM114-Status: UNSURE (   6.25  )
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


On Mon, 01 Sep 2025 10:49:26 +0530, Ravi Patel wrote:
> Enable the Axis ARTPEC-8 SoC in arm64 defconfig.
> 
> 

Applied, thanks!

[6/6] arm64: defconfig: Enable Axis ARTPEC SoC
      https://git.kernel.org/krzk/linux/c/eca86a61aedaa40310135c8799b28187afbc677e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


