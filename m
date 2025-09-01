Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C2CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/aU0CbnFkMwpLJ4PSvNvpEZBk4OI5YLNQdJgy1dRfE=; b=EkNVvUzYUBdfuG14b79C4zZ1tV
	9Jy7hJ4456dnj0UGgIjKo36kW8UYj8/wxQEb12IeprxPHmjje6liabRNPAj+g/IBYQxinJ0PeO/dY
	0clDFMOmQwaot0qoghAGTDKFlL11W8NZ3gWyxUSRdBFuQGcBUTq6lF40urQtkwc9X+VtxgrGMbBli
	tz/RpCmjooUKqKsp891Ms/5MzQjfJI3jK0gS/oitLrN1P+1/8BlmYeaWysikUirJ11e6efK+Rh9S6
	qC4s7F8rXmi/PC5IAvlmSl3FqHGJFb087QC65bzobba/KwnNm+/rV9sIaTGz7CDlEl5166gMkOQ/W
	uWYjzOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyNC-0000000BMvU-0Dab;
	Mon, 01 Sep 2025 06:50:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usy6V-0000000BKyc-3GIP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:33:25 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb731ca55so69717666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756708402; x=1757313202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/aU0CbnFkMwpLJ4PSvNvpEZBk4OI5YLNQdJgy1dRfE=;
        b=n8R0menSrJn6Uswrkqn7guDBlbPPnEFAeFBywEPP18w8x3mgSffDYmXnI4j6p4LGEl
         iMafYwt1+Rw7FI+wdXJ6ko1Z6yUFLdHy917Shky0ZRVWb/O/xMEspU2aYO6hzLSQRRhI
         i/L4IC/qQiuqvt8GRVpmJMeKtB3dYDmNzQufZw8Wy6chDnSqZRkrc1Vyiup+m2HJd8uA
         ++34xR2h7+8Fk2v/DoDTxln5F27Jbjk4ZoitI9AA8mSISKr9dFiv4fVbGMqJHp4I1PLU
         0SBnczPXbU309IJOR/w0IO7I0hFudbEf8S/GbRU724yl7OpKMeHTTlhusfqRGFvyrffX
         Pmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756708402; x=1757313202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/aU0CbnFkMwpLJ4PSvNvpEZBk4OI5YLNQdJgy1dRfE=;
        b=SN4PRzAuFNDyxVNeJD+xVcUOzJIlXjQ6arr1eZlR9b7xc+TyCt9Hwms1yI43rADfTl
         gB/0CXOTQ9qJf+YmEfTiFy2ukV+o4zmXnZJmBvnmLNjmRIpqxHRNEiTy+JkI4bEiJgNc
         FGinfS5a4YzpiTwW0DV2lQNQaJvHwrBne1X0kr1VKJBZP8UIx/XskR78liKLYRV+rKQU
         XO1zZD7mouADXvLDyKD+Y5qpWD1Twm+6G0piiz9WtCei5WkWFNpujDhixECAHezj+nH8
         sNGsdMaKAzW0hfRp6srxQTg9E/a/sgBbl99EnrB6zUEwYmkqw25MaeuetNzYhxoZmpMa
         c2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCV9VZyLAbOucFDNpjEXQPv83IThknXBqSA5KN7oYrzdoCWNb1ddJoxB8mpqZES1q+Te7RYLfjVhEjvM/o2s+LER@lists.infradead.org
X-Gm-Message-State: AOJu0YxVVa1zh87M/M+lv1Uw3ckjTqKwNP3e4YXvB2l6amXHGcdrRzjA
	XE1U/dyUfuDNhdvmshxrHzRDfIH2tOi2GBr4RCRZmOy3RCbpJYQeTzgo08KhyzucUpk=
X-Gm-Gg: ASbGnctu+n9i9I1xJkIle/1JoPZcjOIHDrpIp+FO3Sn9CRtNK5fsY01BpRry31pI8mW
	OXfIl7QnbQHz3mrIYhsSupBPLnW2iLrhNMYol1qhmm7TpcpNieeN8JVaSNJSU/zbetYfrMlbMVt
	DzFdCLc5eyHZX0LcKGfRIl7bO22NTcF0Lr8nCdp0y5Z/fMfeRdKoEnyD0E+YH1ssYHhWHEJjZcu
	XYGY86Z2ThrGlEw9QgylxN4Ffqc0Rn+fhrSxq1HYISt88fHKZpak4JQJBE6YXNvuxocnM+mpRZz
	Yng4jngvjNACN49vMGgnIJ0EudqQ8zfvSeUID/74uB4KnAXDD3209PaVgY2BKtqkhkw2CIgx0ov
	9P/F3tvjhM7VsFvkmZqqEJQED8MbS3MoaqwuneoQ=
X-Google-Smtp-Source: AGHT+IH3Ge5EijHIz4q/oz0m1h7tqBKzwaZiLUKt08VUzyALygnT1OIjd4bZHZm5MjGV43BBeaD1fw==
X-Received: by 2002:a17:906:16da:b0:b04:1fc6:1347 with SMTP id a640c23a62f3a-b041fc67c80mr163666366b.0.1756708402124;
        Sun, 31 Aug 2025 23:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0420ec9787sm266471866b.72.2025.08.31.23.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:33:21 -0700 (PDT)
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
 linux-gpio@vger.kernel.org, Priyadarsini G <priya.ganesh@samsung.com>
In-Reply-To: <20250901051926.59970-3-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97@epcas5p4.samsung.com>
 <20250901051926.59970-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 2/6] pinctrl: samsung: Add ARTPEC-8 SoC
 specific configuration
Message-Id: <175670839978.114610.10121672934609894956.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 08:33:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_233323_817280_616C58C5 
X-CRM114-Status: UNSURE (   6.04  )
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


On Mon, 01 Sep 2025 10:49:22 +0530, Ravi Patel wrote:
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
> 
> 

Applied, thanks!

[2/6] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
      https://git.kernel.org/pinctrl/samsung/c/d4ac729964d8967261fe15fdc8f249729f923120

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


