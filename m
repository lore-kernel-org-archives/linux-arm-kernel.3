Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL/khryOY618fuPYLIWJhXwZCcvoPJMIqjkg4oXBPz8=; b=U6o787Om7dIi3/p9CQ/RwQ3umW
	l+QrCAOm+NsV9l9puQYHcFMN49r6vft8leJ8pWU3FBwpR4x2oQCjHB5pqZaPpCDi6hPviVMBtchnw
	cG0wUsGVK5bsKr+pJzqVoVL71iNVRr1ih743O71N867GHQIuYFWQiyGFNA9PqQXgjE6PH80iwSkcZ
	0fDmu83amo3/iGTi8lJcDiimAP38+ANfKIZqk5zTthpFtOwcxyB+/urhYx2v6Y/KDMRvk4YKOk7qK
	9dMbO0+jJ3gdV1kOGjYFoRm9c0M9gqGf5b+uhtduhUXcQFgSzkSq8oz9hfkHvPI2uoRUBKWWGojSB
	1inchxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqGF-00000003Eca-2tMI;
	Sun, 29 Dec 2024 10:11:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqF3-00000003EMf-0VHO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 10:09:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43616bf3358so12774225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 02:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735466987; x=1736071787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL/khryOY618fuPYLIWJhXwZCcvoPJMIqjkg4oXBPz8=;
        b=c+5U5nnH/8JWH+t5OhMuMJg3jeFGcyonfmAKBydOm/76nP/jGf2lmAn+Yf/bfaJ4EO
         aASCtZCAZTi4NI9JdyF3U2vG250fO8wS/nWah8uXkKnUMDeTj+peS8DEEjB8qVxxzj8J
         scQUUwnosxMRA8bvMa9lJmOktiC45xmBnUMoWGxZ4I18T19aI4gGAwO6lcejZ4fJ/bYQ
         C7K95ksdRfBolsRg2nnTkpziXwaJsRCdSALTzxo0ugTLTbO2uRd5TS9mfVY5ar7HWWZO
         AQEBe/GrHgIxFKNXys6TlcEllxywdF1UR3F6uhIpJ8TPOVutfW9nyoRzvC6jemcTBicP
         fhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735466987; x=1736071787;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IL/khryOY618fuPYLIWJhXwZCcvoPJMIqjkg4oXBPz8=;
        b=mV5DFHa4Bpa2YINALQHfzkT0nJxQPiyEMjV6ljJLjL9iSqfQ/LZxcixGc2YBFbImCj
         gg6GSv+yGCL9Q+wjr2izkDfvtaN78i4MkUAMh5pH8pvBSlb1hROgFhMZW1zbL2LxpCO6
         kulN3250roieGtP72xNcpsm3mplBTnDavLo4/s8/X99ih9EFjT2rFhlpkEE7om7rj75B
         pTy2lqm5D+GZsfHX6pG2Ttmw0TxHa2jtE9P3QC9ixsVlgUUy4kXI5SojUyTD/stH8NSw
         lPoyNoVaGKGnV/vR/zAO/wsGShYPc7zDhuJ65n0+oTL3im9iBVDvridiWbcaf3kJEtUR
         b2gg==
X-Forwarded-Encrypted: i=1; AJvYcCW7b8WrXxoOnPQgK5JddiqvfpBckvTomHBp7zwOWNxfpNO9qZbXg11tHWJx60cpL9rIGMaXAV77HThCod1vgqCC@lists.infradead.org
X-Gm-Message-State: AOJu0YyP6Bv9uX0zcSWff59lyZpjZJDEy2wtm8iR1pDON/aTELEReRIu
	aKr3Qyc79Rbg3OaoIWPtYDazK+aV+uVOW3cxOTnMUy+0/HLzQPDeuL56GF4Phrc=
X-Gm-Gg: ASbGncvXBX0WsGzGjMaSkejRyPDqIa3DaV4cgKv2fXw4N69/aV5618MaJy70sLQDm2G
	h3IyqQb9sjHlASWCyaD1SGMCuxgWvN+g7eBsqG5gmx4oNUtXCHOf2Z0XFMumOLsCRW/7jLSxUDY
	GiTQZ4nRV7uOGLMIXUeaGA1U5auNZO/qc5fLfgB4vXNfPEQK2Fc3gvv9wVUTRIa8zonA4GeMbjz
	L4O6JlmeNtWOu/TjjHKrZPkSXjQuGtgJiFamWaAxdFdP8X4ev/+40KB004nYlBa3K8Mm+NR
X-Google-Smtp-Source: AGHT+IG4cLGqiI6g6J7zatXOGtwFy+9Y2s3YmPVDRuKkDTEQDgLgnySobqp+r3yXYCUk+Z9YqGqDAQ==
X-Received: by 2002:a05:6000:1f8c:b0:385:e10a:4d9f with SMTP id ffacd0b85a97d-38a2213e1f5mr10814535f8f.0.1735466986988;
        Sun, 29 Dec 2024 02:09:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm318174575e9.28.2024.12.29.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:09:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
Subject: Re: (subset) [PATCH v2 0/5] Google Pixel 6 (oriole): TCPCI
 enablement & USB updates
Message-Id: <173546698425.10457.12735336354134436171.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:09:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_020949_226789_9390271F 
X-CRM114-Status: UNSURE (   8.59  )
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

[4/5] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      https://git.kernel.org/krzk/linux/c/ddbf40d8ce4a6b35821d0a0453370ec1422d915b
[5/5] arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode
      https://git.kernel.org/krzk/linux/c/817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


