Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37628D2E9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=im6Jy38t0M9P8Ds0Fkv3ZVsul0UJjJFJRXt3zjTYHNw=; b=O/IReVTtHHMrwk0q+onJEwroKm
	1DBHFFqzUMaqvUEKFTDi0C36MhXn7Swf5tbGU+3XK3ttuh8zINpWd/0yaxwROBheIWq3S6Kc1+cr+
	d2q5K1OYoMeTKdc9MD+bCKsndiUb0py/OGilZErfMcNp0qS3Al1C82rHBHiV82r7ziDcdBD79CDoB
	7EgnhZIKzOygr82kh/w6OH8hmoNm1u5wfBIupCXZoE5nsXChzyYU44XupevELDw4aXH7ZHJzGBXCY
	KD3dI2qU3m0sCgTqTu4B3YSh5GgWhRKYqeHEBIBB3vl/0CtYwRWnyLXfR19OLdzSnWdfRH7Rs6jYd
	w1534ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUO8-00000000Ahp-2LDB;
	Mon, 11 Nov 2024 13:23:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUMI-00000000AOz-1q4B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:21:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2118dfe6042so14281835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 05:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731331293; x=1731936093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=im6Jy38t0M9P8Ds0Fkv3ZVsul0UJjJFJRXt3zjTYHNw=;
        b=THotoZyLtMOHdD7GuZeDDHutZOv28x/Xm9m01jpjyH85lc1wca92eZAvXvsiaDKMU7
         q3UF68yJJC8OSJORaJuZwpBdYQ3G76Bf4I/gI32ljGLh6qYJMCO4LiRAZrpCB+YDAH0T
         yKUGpLn2bTK9fbkbHFEtATQFGVwHs21NvsrD+QGAWri/QedG2HrNzFZdJ+/y4gWIxXA7
         h1K0Vr17yZxxIuRIdWIovDx28MSS5VIZG4JG5OZscU4UrDyCORuZrY2L2LhQR/UkZHxz
         iJeQ+MyHMbJaH8wfQV7YYH4dJYRKha+6whQUdwQRAiirNGV26KrRocEBK38MGcQH3AFT
         gASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331293; x=1731936093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=im6Jy38t0M9P8Ds0Fkv3ZVsul0UJjJFJRXt3zjTYHNw=;
        b=Bh4KxSOo1aZ+E0m8sdET7zFRnLabBdCJA5hzDqht37rsSCrBeokb5kH8V6aKESflZt
         Txw166I5wYXW+hga5MziyH4e2z47j+6llvy1sq02VWlXrwd+dzANAgw/Q818h4LVIBDd
         49xMw0oG2f4/AEEePAgKzKiWWc67RuHmGi81aYf3Jy4r/8vGhUFkX/XD60ogB3ZuLGsm
         mLlUTieC3XH9G+MXoSxDjCQzlvonrbTDzE7C1PiV4NU62r+ncZRpx1vDYjGP8VxaLE//
         NcZ1mL4MpdsHgJVMirfSd96v2KvY3uRQcYO/qrbzCV+1Zk3ofHLqfD9AOcKntlxlzN9q
         TLZA==
X-Forwarded-Encrypted: i=1; AJvYcCXbthQJvLyv77nFcQCoQ1ZqQ2W8fvXE1B0ppY4JzcmBTUpWVKmvdkcEDiEC96nBjLcl0op4DpM9dBXr2ZqSx/GH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbtda/b8Y5h41gXxFaP5XejgsRc3zFHNfAU5QTZsStzm7oWMx1
	OgG1h1KUj8A9PrMntzl5FiPZ9BEidSzhtv3+TyDaUqOgH1sOL9nE
X-Google-Smtp-Source: AGHT+IEwB+o+/qeuUZ9d+KrtWbQEvreMHXJGwJsXjC8Rzhc8kuxIoz8kE4yXWm4kMcXlus1xtS5EDA==
X-Received: by 2002:a17:902:d4cc:b0:211:6b21:5a87 with SMTP id d9443c01a7336-2118360bcccmr143105485ad.56.1731331292724;
        Mon, 11 Nov 2024 05:21:32 -0800 (PST)
Received: from [192.168.0.107] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17e9sm9591693a91.39.2024.11.11.05.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:21:32 -0800 (PST)
Message-ID: <005130df-fea4-462a-8efb-73d8445aca32@gmail.com>
Date: Mon, 11 Nov 2024 21:21:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH asahi-soc/dt v3 00/10] Add PMGR nodes for Apple A7-A11
 SoCs
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241103073319.30672-1-towinchenmi@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241103073319.30672-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_052134_501938_C47418AC 
X-CRM114-Status: GOOD (  14.56  )
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



Nick Chan 於 2024/11/3 下午3:31 寫道:
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11 SoCs, along with the associated dt-bindings.
> 
> Changes since v2:
> - Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
> t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
> is required to be on)
> - Add asahi-soc/dt back into the subject prefix, missing from v2.
> 
> Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com
> 
> Changes since v1:
> - Removed "framebuffer0" dt aliases. It is not standard and not needed.
This is in response to Rob's comment[1]. It would be nice to get the
series reviewed by the dt folks[2] in time so it does not slip a cycle.

[1]:
https://lore.kernel.org/asahi/CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com/
[2]:
https://lore.kernel.org/asahi/23074410-ffe2-4f68-a983-67cec430f68f@marcan.st/

> 
> Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com
> 
> Nick Chan
> ---
> 
> Nick Chan (10):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s8000: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
> 
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
>  .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
>  arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
>  arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 930 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  39 files changed, 6236 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
> 
> 
> base-commit: 5c9de6f45db36b8a74c12e448cf9db87c97bf1e5

Nick Chan


