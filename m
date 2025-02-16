Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F07C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1AyJU2SefZmjgW51aej4VtriM7oYS4pHdsrSQl/DNw=; b=HC+rVuKN95MQKl1XgrOoTf/8Hh
	m2616rinh2H4cEb2jvCcsdwVjpKd1GkX2ZdWLTV053ez107LBJr1mlqKB97uFBmawsEdVlZ2vQDRO
	RGtiGpkFceH2nHOVZswpBkhbRHNPRWqA9aTxRelSanyHZvJ0ot2JgqrjwU06aD4YsLzQpI+hGK8mv
	IOyUt1CyymPhrJUxoHXxSqVaZ0OfmAdfZCIMaI2skIb951Xl1r7sf28djlZqb6N8HSxUyHAdV4Kwp
	4Qz1WC0YtABHVA6KQ0ablUS/8jnQ0nHo33DniUe6CrsTmEXLKv2nffHzTX7DJSG83/hqRlhJxhMtz
	PySsnY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjcOk-00000001fvq-26ab;
	Sun, 16 Feb 2025 11:01:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjcNI-00000001fms-0COZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 10:59:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab7b5308a4dso65804866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 02:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739703586; x=1740308386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1AyJU2SefZmjgW51aej4VtriM7oYS4pHdsrSQl/DNw=;
        b=aRGckpEiwn/Los7SM0do8Fm94hoycKIAw5hG5T1wrofj/vjVIHmR0xKCVvRmx5cyNh
         Na9VVKt7UpI/oGu1GH3o1pyOt/PaH+j/akCCj4t+RqzsiLu3qU4GVUEaK8T1xSfoUoCY
         /miSs8prCsN9RaT/Jx4YkWWOpFCJDd2VmZ+HIMNi1EgGLP5RuRWOFiySLYB4Cpspv1Gb
         H0VRmomp72M6iW8bDOnkiUOh0hFxXNO0q8U1aMCmxFmINcWMDCBKwJays77vO4FkZW1a
         GbTaT905lAZy7qyKRWesLJOrC6pIw3kiCDX0G2pXy8rKKS+Tifr6jCrAyHP1hIzRibxi
         vupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739703586; x=1740308386;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1AyJU2SefZmjgW51aej4VtriM7oYS4pHdsrSQl/DNw=;
        b=ZkOW4mySIysqxHDUEeHKQhaqRNkchWqQhg5Z6b/rcp2eKMjYKMLTpQoRXQDHrssEKk
         g2s4k+6fL6ebRyVbg35wIMJvZCa3saOK1WDkfedE/NFGq5Nn9/N0RSe9zTDMm2Qnryuh
         mZyiI+q5O7HrU2Q5sG6JAlJTMkqI4FILNUam0upfvOxZkL0XlDkHl9vBb9ElB1Mb/9BF
         X9zgv11Y/vAGLKKpewojXq1wLGScOZV0oU4zkoOHbjWKofJGFVp3hD7+CeLcnw4r2hAS
         x512kmDjZdbK5Ux87aWJO87AVEh0pXhugXa/FUaHGNgtPKHiXDt7HG2frTaAgodYhoHq
         EFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR2+pPcOCRzYMPkvOy8QxaSgedsw809GTJz8leurrF4YoUQG4ckXF3ADCAAdy0KM3lqbDx+oIYNyLkQcMIF17g@lists.infradead.org
X-Gm-Message-State: AOJu0YyDXElC9cnrNHsC8iaBPHSfI4DLS+M03oVZGjfk6sEbLvDN9Yzm
	jNwvn6k5fr7OAHUcsNQ38LOpPAja4pKKNWoQKxjF1MN5gUxzKDhua5Sm6rEutWo=
X-Gm-Gg: ASbGncuiXSe0aHXtGyDKfgRa++X6ILX7TAqhqG40QpXUhPlR/8Xzmg/nnSzJpJ+YKiE
	Btw0EE4gv/HztTXKaM4CMWQU6vBFQHygnLyGFuibxRWW9ehofaiM/rP0B0yKG17CYjp0k3/0rab
	6+ax7gxYDm7FD/TGbomvPBUot+95FufheOw19qoxrIHmV03vKK2bNiap4qMxCe2RSEXNMxqp6eZ
	Y6o/hzx3eFEt1DYd1czaoBhXvPWWK5RULLfnWLkVL1gYLz5hDHn2tB+jzf1H9F8CHN1PxbpNj1p
	oi+456jr64QKU54gaG3Hapj7gCyhjPg=
X-Google-Smtp-Source: AGHT+IFefTV39A1neLhgECtLBQWnWdC3L7ZVJ1cd5nkHx/8W7pKyxsOQB1ZeilaYCi+pwtC4N7wgZg==
X-Received: by 2002:a17:907:d8b:b0:aa6:6792:8bce with SMTP id a640c23a62f3a-abb709319d6mr218337366b.3.1739703585852;
        Sun, 16 Feb 2025 02:59:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6f13b11esm310849266b.71.2025.02.16.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 02:59:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
In-Reply-To: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
References: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
Subject: Re: [PATCH v9 0/3] firmware: add Exynos ACPM protocol driver
Message-Id: <173970358411.40124.822612928338453939.b4-ty@linaro.org>
Date: Sun, 16 Feb 2025 11:59:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_025948_108407_1C33C15B 
X-CRM114-Status: GOOD (  10.25  )
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


On Thu, 13 Feb 2025 13:05:13 +0000, Tudor Ambarus wrote:
> Alive Clock and Power Manager (ACPM) Message Protocol is defined for
> the purpose of communication between the ACPM firmware and masters
> (AP, AOC, ...). ACPM firmware operates on the Active Power Management
> (APM) module that handles overall power activities.
> 
> This protocol driver provides the interface for all the client drivers
> making use of the features offered by the APM. Add ACPM protocol support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
      https://git.kernel.org/krzk/linux/c/97b9ee2972bc0060cfb4d456118699942a6847ff
[2/3] firmware: add Exynos ACPM protocol driver
      https://git.kernel.org/krzk/linux/c/a88927b534ba18019b0440cf3d7f068407b5250c
[3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM mailbox protocol
      https://git.kernel.org/krzk/linux/c/8e9faeb642511ac90b8b4f6a136ca1046958a1d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


