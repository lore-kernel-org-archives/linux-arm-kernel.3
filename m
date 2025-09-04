Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19891CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=; b=u8y4jMkmesUYhvsozLYLo6c/a4
	uZaqhLqAWo7qvSy6vDnEY2uVP2CMkU8jOcgz4FkLwBPW7e2/lpJz/zmVuKyJwa5NwKOmRf1lk9Hv/
	0WPnzIw25DgMeg/MCwRTD8Qlt7Du4JTwxd2m8pWkCbXOmfO/jmI7dqui4xvx5JyJSD/7RKWGIpt3+
	DGjEIgs83/PuiLpRrsejktwmPwp2A7E11ut29E1Ee/8qbB6w/f51kpg2+8zae/tgzjymb/WpjNtBs
	NAD8PbiszJBVZK0/JlHiibfN4CmAAuSPfdcR5m0FDNrD8ET6GZg40WBKn2bR4jiWaiuEMiw8ePBNa
	4CoMY+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkV-0000000DagE-12E8;
	Thu, 04 Sep 2025 18:31:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAI2-0000000ByiQ-3MiW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:46:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aff17215facso12393866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993573; x=1757598373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=;
        b=lTXSgnMH96zwvIENlxGofzZmKqepazZP43/645Y4N8Ly6YgKz3QarZ4yNRh9GLOqTg
         9N3NvTntjlKbG1SYE7uyAz/ttD8XFXkiwhNdSNQKUzGvKu1SAWGArpudUC9o3PVHy93j
         i3YVF+zp1nToqqfvZGBruy0Su/9LYqQY5X3cAUB0IX6F9DvSpXz86g1GJASCMz9P73YZ
         S2IGxU22oXntzSrmAEQtPVgpU+D2fOWQUlkwQ/VdA6U8tDJ4c1FfPsd/hckLLFR/ZWro
         e6R9g8tvUEyQgubFcSSXqc7H3ScdXdjRd7y3RbraZLaJRxuJhNEpXEotmR05DVOsRbgu
         16Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993573; x=1757598373;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=;
        b=qkgPr9aQ/yAgXe8KkiUr3PowWpB2etd6ENEBLdb/NZ+p+9uaHRhE1ePWvi4crqjAUs
         JaXw/Za4As9sSMDJOd7zcTWFoD9rb3NTTuFQS6epo/BYgjnAyJS4X2r0MZcagyHAEQTx
         E73P8KQTnUl7wVW8Wk38eOPsox9MeTlmE+C0ABjZiHnQ75Q6/x2utaLOyTQLVq5Mn/C9
         lw2hLWw4jXrdUyhcHofru6MzUVT6nTW16Mz1ECY7wBXrDtzFK7G22+KsFEuiORvu80V5
         GvrYODQ4OC/11ezWA65Na0Ea0D4uj50vAw8+5sbaVcdZkZWbGANkNieTfkcjZWPTLLgG
         1SHg==
X-Forwarded-Encrypted: i=1; AJvYcCUUCZoO4UBet4KPbnptOpheJwuNFYeVwmZlsekUm0cvjrc+ZdMFY4+u2iEvkmEc1Rlr5saT6XxyFi5KX5jn3qSc@lists.infradead.org
X-Gm-Message-State: AOJu0YzUceq9jrjkZZqyv5WwtU8W12bJf2/elXvKzmzr5lBp9pFYQtNh
	kYkx6+plKSB8lONLZUaB/vzeSTqgcAa19ntvBBe9a1lj6PgzjbcdsEP9YH9rcaqHOLI=
X-Gm-Gg: ASbGnctFJT/XEzJHk8CVCbFtqVIF+EkQlhASX7l02p00sSJttUyObc6IX+PLxg4mO3Q
	xIbXsVErRxFXcmfIoMr36dKrnHmTKmDTQ+2gCjUvaM0cOyw9wsJ70bj91Jx3MXLuobuTWcpgaRA
	aoIJXzqngK9Z5G+9SJFFOb4ypSTNaoSRJe1Wsm9RCMbVKHl0nBhfDqip4yRRSteiT0OUhCPBfGI
	7ztDCSdmq/4Ix9IKcRsKgOkpE3S4o6X35OIGz94fGA/e4y1RWgIZCXt0w7BSXSnnK7+ZdKi7ahe
	iIFh02g5gKarzcJZ1wAXGuPFjZi/xj+eL9vUDq4gE38vyu6+kkh6Ye1/Muyaozya/2AM9B7rIUy
	4Aw2md3t5FXv+PezDyNRK8XnwuhlFc6JbDdwfsPBPRJMkfj84uQ==
X-Google-Smtp-Source: AGHT+IEQoqOwB2yGHXtT3U5ow0C3hw1fUocrSdNOZukUnko/TRqHkgL5aBTtZ+Kkhn/YxvPmHZWsUg==
X-Received: by 2002:a17:907:7e99:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-aff0f15c2c2mr1210879366b.9.1756993573122;
        Thu, 04 Sep 2025 06:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:12 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-6-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4@epcas5p1.samsung.com>
 <20250901051926.59970-6-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly
 dts support
Message-Id: <175699357104.171312.5414348160649999670.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064614_843579_ED3661D3 
X-CRM114-Status: UNSURE (   6.54  )
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


On Mon, 01 Sep 2025 10:49:25 +0530, Ravi Patel wrote:
> Add initial devcie tree for the ARTPEC-8 Grizzly board.
> The ARTPEC-8 Grizzly is a small board developed by Axis,
> based on the Axis ARTPEC-8 SoC.
> 
> 

Applied, thanks!

[5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly dts support
      https://git.kernel.org/krzk/linux/c/9e74b88c0a57f78dfd3017de435ae400d9b659d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


