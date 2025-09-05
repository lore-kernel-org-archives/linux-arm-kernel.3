Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8446CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3MoENRKP6mYeZPRW/pxLj4qhNh7qVu+dXlOTgSs04Y=; b=XyOz8aXKadHVh9yZcxUl/qr7d3
	XpD1HXP3Rfaif5zvXNzeNfoFDDUAEYDjB3fqXmQna+mW/X7OGV0UD5Ru8Jo8u6yzyr16NtK4la20P
	ZR8C/0dEsrfbj2v3RZ39QxFkkz5EfbPoTBb5GlAddxuUrfidAm2C9QJxIHd+6IBnP5mH8mPvkjibn
	q0/o/nLZlUN0Vv4BZi81KX4fs50JeIRFFzz8YvkW6CH2y9u5luCWVbwIA7IOB2hXs7upcRQZGAoUy
	nIxKg5dPErBWWrSj++drvUArFtOPlPJYHZU8+wr80Sqv+IGVk4jNoC2dlHTNZrfal1AGExThANlln
	3B+tUaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZ9-00000005Y3S-2JUa;
	Sat, 06 Sep 2025 00:14:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uueox-00000004yxo-3DCk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 22:22:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2445806df50so23317025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110935; x=1757715735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3MoENRKP6mYeZPRW/pxLj4qhNh7qVu+dXlOTgSs04Y=;
        b=ZO1S47oUKQZzqDMfMdTq6R/wQpQv6qMqVRajMWB1cPEPog18OySuQnV226Zbf8anhW
         9VVAGVpKPyQratCdsJBfh0IJEmoLstzs/Gnktp37/OziPSq8URHtOvzeg9c6xRPv3rXt
         qWTByv28in3Cj0sBok0ThK02cCQu4LKgobm96iEpUSS98dySKDA+vlb2vKGTdU+L/EnC
         Ael3G5X1IGsnzFZz3e4ZycdkUa1BSU5A0XpM6YqqQKqPRT3bOE04Hz8wZCE4+zuZZuhv
         FCubZ+cUMpEHxLG4jBEgJmGfU1wSnHetHW4Y4qf2NyL36M96KHYL1RLkXku18uKS85Cl
         p05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110935; x=1757715735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3MoENRKP6mYeZPRW/pxLj4qhNh7qVu+dXlOTgSs04Y=;
        b=vFVZhcR3ZJXX/hmk1nT2R+7JNn8codbfOggHMj1jGPmDZHY6zjJI9mU+6hFBjf0iQr
         mprOMelcqOWNJiursAzxeBJpLalsDMVx4ZBeiJpvMqjKd14Q5K43PDwyqdJcpgy08/kq
         gx2eZT8kU6kIQLxeMjWe7yTtMX+TEloa1VbMgAAkC811UB6QEacV0aTrr/IHDdHha5l5
         766xDM/12juK+Q6rXcXk8CW4s+Rsw6uPNlRhBnZrgc8bId0NqrkNIlXPcgEwNcciwoHQ
         1ydSbghWhR7R3gj1Y2/+A6LoH3ayCsgyElU1P8ruFMnghRZcggjXy3a1KuGFq/bQW3mC
         VktA==
X-Forwarded-Encrypted: i=1; AJvYcCUBVsWEgmlceb3iUIP7aA/YlRPtASyjfR0rswPb/FxugFwaJmMBnVJA1cPmzKcSciwerh9bSdQHsU2QVimbZoyP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3gSr45s7n82Uy9rXL+HE7VKtcVWXb81OFQjtjenhsQakD28mB
	rrQ+ktpnj5SsOC2YyeoqwRw6rr8g/9d4cynJhv1BKv/Ld3lBorB09KQRM04WxZjZwHg=
X-Gm-Gg: ASbGnctKnb6qt5QFBtJ1TZnwy1K+pVgykZ9Abh0lrBIEwJ+j4dOoGMvRr/8xJxe2bEv
	P/n99CfWiwiNnUgX2gWDOw9I4S3JPOJPyUzWEf+s9yzIK/+OgzyJMmljbZbdLAwZPG1UtqSI95f
	a8IRHuL/Lqg4PgFb045LcpNZfdw5mjXFZX4EjaQKrfF3hMG79AzfiILzz5SXrHlEySzcTYQHF8p
	R2faq8u2X6NPEsTq75kewmPZSl8dhsq37/F03Nvhljts/t60hfeAMpOhNXSIWiaTf/B3SP6KaXI
	PnnfM9/d/mwaka85aTcYKkHtVYseqdZp7Aw4QJz1ToXhtgcfrMRrPgFugak4njw67TZbwxvEaW8
	IoFt2Jm0sM3NLeZTzPBB7
X-Google-Smtp-Source: AGHT+IGFh7XSvm1jmSq5I6nF/CZdeopZIBB37Nq6xs75hcHOkaln3WatQDx6FOTZQCdDBErB40YFkw==
X-Received: by 2002:a17:902:dac6:b0:250:de70:cf9c with SMTP id d9443c01a7336-25174ff62d3mr2891525ad.47.1757110935003;
        Fri, 05 Sep 2025 15:22:15 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea628sm33047585ad.6.2025.09.05.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/4] ARM: dts: omap: dm814x: Split 'reg' per
 entry
Message-Id: <175711093408.666031.690873725302943205.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_152215_808945_B17802BD 
X-CRM114-Status: UNSURE (   7.52  )
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


On Tue, 19 Aug 2025 15:16:52 +0200, Krzysztof Kozlowski wrote:
> Multiple entries in 'reg' should be encoded in separate <>.
> 
> 

Applied, thanks!

[1/4] ARM: dts: omap: dm814x: Split 'reg' per entry
      commit: 46179394d4e45d561a2c0185774c2f7b88fa7c14
[2/4] ARM: dts: omap: dm816x: Split 'reg' per entry
      commit: 7d7df1bc644a29e880181579994bd2da9fb1a6ce
[3/4] ARM: dts: omap: Minor whitespace cleanup
      commit: 9df7366a29192f860e9e35a258f0b000b6e4a754

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


