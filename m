Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB6BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaiYIHovh3hj7JhREmKYSulniFNMpmE5/FQxCD5M2gA=; b=G+qt7cDaz5p+CzeUyOkc/5A2jr
	l79oQgG30yLIBZR0NxMhjmIAOeXn62ffEHGrwEvb2nELDz/wG2/seosEiDzx9rONAPfUokELptC4D
	mHBqw9kI9o22SW55S2t6tPMCjpY1okyovpDZD7kRkQ0SPAY87vYM3BvjTa/JdyGsob3XAMQbDXva2
	JknXbNR6BXnuUs0pxdZDg25nWvy4HDAUMb5N2CSO3uhVPTjyFmfOF1EB73nLRr+bHtMjCWLJ7sdNY
	LdofEaZQsCygiYHAHzM3RHeo9yzfM78lE7JVJokotQZEg+O8vzV+KoFCO1MiQFx9Tc5nb2s0ldkwO
	3qJTIgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7m7n-0000000CbD3-4A5X;
	Thu, 24 Apr 2025 02:15:40 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7m5p-0000000Caz0-27gN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 02:13:39 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso1086341a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 19:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745460814; x=1746065614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaiYIHovh3hj7JhREmKYSulniFNMpmE5/FQxCD5M2gA=;
        b=VcY98Fovdr1ZVz8KAnbMzn5V7lGHLD9DsCnyevtSadyx4Gtv57rVSHPNaLpjOzmXEg
         ZMlOC+7VyonU+i0KNS2NjfqLhBMuQVt6fA+lF5MXiQTZCcIzeziRvsZeW1fmeXbA9J0E
         dh+Nsm/+FWfpfCFsNyZadOg5abCqTSkz5GvQSWNnOwZGJ4zeOM3tH2Se/GvCAPhqeusJ
         DHX9RL8e3WF12PiYqQf2kzC4ES4tgZ2hOwoQ+osOkFVqqQyKz4Q9bjsMsW7tFiLwphqI
         JbJjNaMz/6GkvApftS53FCtv418yH+NePDNU985308Q3u56X4HZ34Cp/Ph0OT8ffq9DI
         KV0w==
X-Forwarded-Encrypted: i=1; AJvYcCXhNVp6VHkrB3wKzK/iThaE7PbWGVRf1ByxtmRkkGkihy6CBlxuxQhN756GTN0w+CG+abJPVcG/6uNNWQTRboPw@lists.infradead.org
X-Gm-Message-State: AOJu0YwLwguwiWS6w+WN4TkbUTGz+BEuDkLwLdTt12r8+iz3z3gyn4ai
	wL/BMqqcDc8dcXeLCcXsremAT0CgmzaL94t9MM9qREO+yx+hD8v4BfZxU5hl/tU=
X-Gm-Gg: ASbGncsRHA9QN8n73FALLc6wpR2LytXcq5qQeB9aHC0pc1zA7K7aIWDRbKEpQUdPFny
	u5S8zfPYjTrWbFy9NnvIJhhrkpxxVg9MPCu9mwLOVhG7pPeaAVDZOSID90pN8sHKpZNFdnqRRZa
	TdWcNEZ0lYD7/aH83+NikRWovbskpJIGtw4rnwy4Ei3wyByZrzn8YpqZAuBs/HCFn+OvjHrYEFp
	dfuQl6rGsCFUZqYHACaeE8a703EyTH3uvt5JWNDhkWqifz/HJ3Ontstvkut6cG2k/X6QYA4WLif
	P9dJ3mJlHP/AYE+Y1TMrwgPMJEqNIPdGORcpXfXZcq1LqK7JcHUCyZ+sV7JMP2+DSJZWMew=
X-Google-Smtp-Source: AGHT+IECNpkK/NMbnV+1c9b4C/1/4cljQaHtxYUbBB68zmQOfIHRblkdjfCoa8yatqGlTUhNvyU5Og==
X-Received: by 2002:a05:6402:524c:b0:5f6:3beb:48ca with SMTP id 4fb4d7f45d1cf-5f6ef1a35c9mr510815a12.3.1745460813158;
        Wed, 23 Apr 2025 19:13:33 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6eb43eda5sm429919a12.24.2025.04.23.19.13.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:13:32 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2967463a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 19:13:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkqTKEe48SNMVMW2Z5TeUFYw4y1YxDuXNPZJjWcNXOSC60yjcZnA7umcrbtINZiz4+gaWXcL8yz5EDpFA6IUk+@lists.infradead.org
X-Received: by 2002:a17:907:2d8d:b0:ac7:3441:79aa with SMTP id
 a640c23a62f3a-ace5a2a9b58mr54104966b.13.1745460811360; Wed, 23 Apr 2025
 19:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 23 Apr 2025 22:12:54 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-n+=dHzt3b5oDCk3uYm6vBpsFzy-47sDeJB_=rs7OR3A@mail.gmail.com>
X-Gm-Features: ATxdqUHYt94bW4xL2oNxmmXaCgYQX3z4Kme1wD4CvmsQsfVBIo41Uk4tiX7FjQM
Message-ID: <CAEg-Je-n+=dHzt3b5oDCk3uYm6vBpsFzy-47sDeJB_=rs7OR3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Apple PMIC NVMEM cell driver (Formerly: Generic
 SPMI NVMEM cell driver)
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_191337_546651_8A76A29A 
X-CRM114-Status: GOOD (  18.39  )
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

On Wed, Apr 23, 2025 at 1:55=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds a driver for exposing a set of registers
> as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
> Those are used to store the RTC offset and to communicate platform
> power state between the OS and boot firmware.
>
> The NVMEM cell consumer drivers will be sent in a further series.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v3:
> - No longer try to make it generic, use for the 3 relevant PMICs only
> - Link to v2: https://lore.kernel.org/r/20250417-spmi-nvmem-v2-0-b88851e3=
4afb@gmail.com
>
> Changes in v2:
> - s/pmu/pmic/
> - Sort dts in unit-order, instead of t600x-unit-order
> - Link to v1: https://lore.kernel.org/r/20250415-spmi-nvmem-v1-0-22067be2=
53cf@gmail.com
>
> ---
> Hector Martin (2):
>       nvmem: Add apple-spmi-nvmem driver
>       arm64: dts: apple: Add PMIC NVMEM
>
> Sasha Finkelstein (1):
>       dt-bindings: spmi: Add Apple SPMI NVMEM
>
>  .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 ++++++++++++++++=
+++
>  MAINTAINERS                                        |  2 +
>  arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 ++++++++++++++++=
+
>  arch/arm64/boot/dts/apple/t8103.dtsi               | 50 ++++++++++++++++=
+
>  arch/arm64/boot/dts/apple/t8112.dtsi               | 50 ++++++++++++++++=
+
>  drivers/nvmem/Kconfig                              | 13 +++++
>  drivers/nvmem/Makefile                             |  2 +
>  drivers/nvmem/apple-spmi-nvmem.c                   | 62 ++++++++++++++++=
++++++
>  10 files changed, 285 insertions(+)
> ---
> base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
> change-id: 20250415-spmi-nvmem-e08635316175
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

