Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBBBCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=; b=k33c4c/XSyJXiFoLHmXH95Y5xy
	TJ2O0zOraqsXXbA0l9xzt9I59zUFpbnBL6+xCncy3J6qLplgDiHPljcppwUqjrVtqxjvfW8pC/mdu
	oOVKk/R0OKn6UhxrU/imVIEId2WJ+2HUlXShf7g0zaKxh3FXba5o4RqjsEhIgad6sB5lwoxV/a7bz
	ViIOwxjOGSDyOWsrqqdb3qXmEmXb3On6kF7NRAxElf5dWm4TM+edr2I1de8aqjKge0UnBkJOWMwl3
	U5B3gmehusqyaLPrBHHE5roZFTvXTXu2KbUVPu2Lp1gzyEgH229nqtmoUOqg1D+t6dRoR3+w14tuA
	k7YP1DwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyKW-0000000BMhJ-17Za;
	Mon, 01 Sep 2025 06:47:52 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usy6T-0000000BKy3-1M3r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:33:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-61d1f60aac7so472966a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756708400; x=1757313200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=;
        b=bav59rByVEehyD4wGPQ8rPsvx9ghmvWhFGgzpJD2mE8Hnd5976+dep1PTzK6afrxx4
         WtWZ5v66szUn0zxG1vxVpNuBDpC+IQc7ktKRrJ3fXKU4Fr+q1zWYHPz/RiM6vAVNzSuY
         UkILf539orXqZ/MJ8qSDL+coZdXfAhAC0BAO6NOuzZDxz+24L2vFTk2ywjY2PEym4uBs
         HkkOSPe1VSgLje6DBG0EnLQXA1YFDWLyblMNAgiFHpyoaJSraH2kUsO6zlWZFM/E/Szz
         RIdjvfpqWOiW+hmZyhlz1GEwb7JRh6DrCTqwNuXvF5QSrO8wbJXowwVYuneZQyZO8KEt
         zwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756708400; x=1757313200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=;
        b=Kg+/OaBF/SfYAoUyd6f8SBXCOUL7SFi64vRgGdBPajr6zqZp8NYFSJhaAYDSHGULKg
         V/322hvDk2X1drtuM7cCeNB15tTW5aiESviF0u0T+3ipFbv6Yqf0EFjoW/0I7YShm/Jc
         qkuR2APjgBeAojadED897RWquPUNeJ24h6tU4/j5fS3iBZrg0qRXcX3r9c121OEKpdgn
         J1D6rZ1HvLseopUJOAvw7/cUK4qbVN6/lIpu/4um2Y88bz7gzV4kuAX+aZw9NAPd2xNV
         gu+m35iKa3ZdSYnOxoqhAdNK7K++OiPzRurGQflfOcpTxZBRbAB13YJyJW4nsJEEl93W
         vUPw==
X-Forwarded-Encrypted: i=1; AJvYcCWNoq3mFXQlW8z92mM4VJivTrtBvSIxfSRVUuUtOv7Kp1UGQtpPU7/Y8eSKlTMm8IrP7ewAvI1g1DoPPIeIsoK4@lists.infradead.org
X-Gm-Message-State: AOJu0YyndHvk6IO5wNUZNLPkxCj+AwAMOgMeqrdS+33wv2t/LhfDXBW6
	f1cABs18MQIA2H+jojzV8Km5KA9sxkMH6U1hELGBbQ+HIA3/z+SjdZ12dtzeliMcEQM=
X-Gm-Gg: ASbGnctnR/YXSnsbMzudW+E4ZymwDDEMwfK+DkrAthpUzevt/XEfE0xwbFYrr0efCV+
	qfNStSg2KaiZiPqjrA7wQ9TgLAckRIwRCdYQ93JpC3sdvXbOdQoBFdIVhZ2Zoj3JmG4fRk+Sa7L
	ZqjJqL0qXGZn5hwgYrzd5EaLDANgf2/lhVQ3LAwlnyfYXDNvUbCVUPDvYHrG6yoxJabgen4Qjxv
	B4k4gt89ZAT4CGxruBzlQ6VytPhu31rf2vSaU/905ZV98KFDW3HNmx7TGNKKK2zE03n63MhIBs/
	V2hAZxzfxr21kxrQZYhUXK+v/eduOdvtyGosSNtYlZs9aIPo4c8EfAIatBBWg//u13wIdTixdsP
	QVxdWU/6hbwkcqdGjNdSqtLIGua1y/I8mAAmoLj0=
X-Google-Smtp-Source: AGHT+IH2EH71GqZysZaHULgZnawZA/ilqSzMTKNSHRHdyGYISzSRl8kS8S+lxJ5IgYxfEUW2K8qFqA==
X-Received: by 2002:a17:907:3cc3:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-aff0edc4d6cmr519702266b.1.1756708399621;
        Sun, 31 Aug 2025 23:33:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0420ec9787sm266471866b.72.2025.08.31.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:33:18 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-2-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9@epcas5p2.samsung.com>
 <20250901051926.59970-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 1/6] dt-bindings: pinctrl: samsung: Add
 compatible for ARTPEC-8 SoC
Message-Id: <175670839704.114610.3984450537189054873.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 08:33:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_233321_378655_48A5E887 
X-CRM114-Status: UNSURE (   6.42  )
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


On Mon, 01 Sep 2025 10:49:21 +0530, Ravi Patel wrote:
> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> which is similar to other Samsung SoC pinctrl blocks.
> 
> 

Applied, thanks!

[1/6] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
      https://git.kernel.org/pinctrl/samsung/c/03724b3496cb0272a5050a989ebf2494b1ff5a55

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


