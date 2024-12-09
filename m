Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuSpj/HsYjKUq+UsFvNv/TltZ5XFd6qk5tdowlJF1TM=; b=CuzYP/M4MZnutBRtRjB3de8xpF
	j5ZFySfTkJhIshI5Oc3oOh4AXI2MN2XmQxAblwONWsHksu20OkbOZRs5DAm94cJUDD+rKrkCm+PGG
	QvEoy/9GOpXswrsrvccRtq5gQgDy3d8DYazNuA/0EC+MWLXEO+nKuMq2w64vzNLht+Nt4KME2ZZ1q
	oeViHuFiszVq6P7+f+AqgKHTXBcowjiLOvnz697QmLmkYuY7d2aL6VfUOlW0EJqhdawC887sAJiHP
	Q5P5dE6C2M8zuGbXuEow4zy57YXrlBP0B9piqS9oxPAH1uUcFqifkYfwzefoub8RVkZ9lgiLHWdxT
	fd93uL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjTs-00000009401-3Jg4;
	Mon, 09 Dec 2024 19:31:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjR5-000000093HH-1Uk7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:28:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434f1e5e77dso1326865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 11:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733772529; x=1734377329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuSpj/HsYjKUq+UsFvNv/TltZ5XFd6qk5tdowlJF1TM=;
        b=LYgy6vqwEElQCiCmpuhxshivr5cwJFKeM+qeDIS0LfG9nQi43E0vZg0fJZpDCNKxPZ
         RP1QwjrDsuGNKepEAZH25fcKiFzfjpcpjlF3TKn6lzQ66vxtO32IWdIB8oNf2+JsijJn
         SnqaAYKB1m6EBNcv8Wk1+4kCiMuNe/+GwCnjko7wVFAhzhzg+2ADGEtoUMoQML51ssWI
         uiYq04n1fnEOVBR6dARuuQaItRnO4LRs10siRy9CWreIL29vewTQb8JFetAH0NSpMcME
         baHZx4iuUO2XyHIBdctXzkfui2B/tG5UhGNvQXTHtJmutbFdjUOtN8KEhIeDjx+4BXhU
         YpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772529; x=1734377329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuSpj/HsYjKUq+UsFvNv/TltZ5XFd6qk5tdowlJF1TM=;
        b=sGX0ms3wRMAcw2/bczgqxah4csdZmEzqFhapWaZhPzw5q5W7HJVaUeWDMFeP4zlQr2
         c2miLTq+tEv4habnGHOwnHyn/YxqHN6GHHXjSmZZcKFOfrus9OhW1DmaGYHf/T+8HFOr
         z9Tf1YZ3ezpe4dd5dHfH/4G6tFGdttIlNNMLVhYPMdckBL68KuxhWXkQEKDR6Qpeq9+G
         zjW6KXxiOunZF2LNh/TRKbbtZFR2HG0qOyPSj0HF0k7sXNK8LNwwGecePpfBG+e8SQZ6
         GkyCfBpScV4EQjkqC7Mn7Cg8xcHEnIDnYj195pwqaR7cWk4OCBdX4AU7hwQnqfdahFAl
         7Z9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPgNvjR/SP7yeppyqGdq2ycmZxqqgzUtK7TF5b6/DycLR71HHH+iUw+F7XP5CRFS4tAdPPAdurt3WZT1S75+Gg@lists.infradead.org
X-Gm-Message-State: AOJu0YxdxwKU1ltq8PeX23iSfpd/Sr5A8Q5K6H4orsLB79Wt2S5yJ4L6
	6B6cDGtV0N592sewl2iuxR/4SxswjgD9f6+V44RrUBWEYIaezbUYIwJzQQhoPNY=
X-Gm-Gg: ASbGncsK9NH5tl3ujwfknQ9hepjlI23QdT8D0SePySpcyZiYapz69DY26dEl03iKw3S
	fkyQ3Q09PF6CRSLl7JsucxMxm6Mvr7ZBYwjoWKXIfIIbyE8foOD9DV/APHoop2jOgTUaGj5RQQ+
	VoSaBWhVolUdhXFCk14/51gi3wQUkq5gsxn/XvKER6yxJTXJi8d0FJbt0b1SZzqgmUm8qGy2r+Y
	i+otKwsK4SegAceeaeaOi86JS/jevWVInGH2s8nSDAY7l3iGcJ21r+jSFBjpdvg
X-Google-Smtp-Source: AGHT+IHptp/TSN8ArgGPm9cywAb5bVkFu4G3aOR1tLTZhOcuZyzTX0x6rWRDIu6DPFmEx/1jW4oROQ==
X-Received: by 2002:a05:600c:3502:b0:432:dc5a:b301 with SMTP id 5b1f17b1804b1-435019c8db0mr3209025e9.8.1733772529211;
        Mon, 09 Dec 2024 11:28:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f13f735csm80686325e9.16.2024.12.09.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:28:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] Google Pixel 6 (oriole): TCPCI enablement & USB updates
Date: Mon,  9 Dec 2024 20:28:45 +0100
Message-ID: <173377246177.140612.3507892014297013464.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_112851_410732_DD91B966 
X-CRM114-Status: GOOD (  10.14  )
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


On Tue, 03 Dec 2024 12:40:23 +0000, André Draszik wrote:
> This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
> 6 (Oriole).
> 
> It relies on the bindings updates proposed as part of
> https://lore.kernel.org/all/20241203-dtbinding-max77759-v3-1-e1a1d86aca8e@linaro.org/
> and
> https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org/
> 
> [...]

Applied, thanks!

[1/5] applied (but b4 lost rack)
[2/5] arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      https://git.kernel.org/krzk/linux/c/527c9640e4f04044afa98f3ce18f8af89ac4a322
[3/5] arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      https://git.kernel.org/krzk/linux/c/95350c0ec27d906cd95375084ce343bc65421e70

!!! NOT applied - waiting for bindings to be picked up:

[4/5] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
[5/5] arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

