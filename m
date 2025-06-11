Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1972AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLYo9g0XZU6Jy7Q+OYukaklPi9cQZWEMlGfi3iuIv10=; b=nXuyPHbwqCFAODYYp5udwA6kL+
	K8FW4pzWjtpkBruI86xN/MLse0Ee/o38PqkZISLyYn3fpMtEhWEUmSI4LcXqzOoI43r4GHNkNvMj+
	bEQW1qmrQs2bxIa4fGqdmQGn1es5QSJfGhhfFEbBn8WmkTwTtw6abdTFwAk45lGGQFR4F9trVczhm
	uBOcsqV2FL3L48xum/tigFjrbasF2O4af4CZaYGgP8p0YdNRwga2u2WTa/p12qAJJ5DeAcpDL6XdU
	TcRqFiUbdlJlY687XXvmuXSlKyALwc0i773oj3/DoRMbWXXisd++Djln38yCw/RYyncj3vRA2ctUf
	vdJ84nHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTv0-0000000BTSW-0xDI;
	Wed, 11 Jun 2025 22:27:38 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSIw-0000000BC7J-2LHW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:44:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso438249a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749674652; x=1750279452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLYo9g0XZU6Jy7Q+OYukaklPi9cQZWEMlGfi3iuIv10=;
        b=iqtNpEIE+jGa5wmS2yXc07STExbwl7y4ZBUaFkI6JwL/sE5co7Sb0VQpXVroOXlGnw
         JDe9I113+mDJHq5AqCwHTZbCr0MjcH0Fc0G1rttAy7W5uHjGKo8zLLSNdOKAb4s1FhPw
         RHN4OvzboZ9ll8wtSvGZJJUkADM/GSI3yYXp+1H0o/EKEOuvpEWA9VZU1bNjkU1cBtgC
         BhWSDlHOSlFQFXVMB/foboh4d+hwNujOtxYeumi+YGGcUtjOiuI+08m7YSdJAI8hMAhD
         FgnGwRWa+KpTLII1WgRM/xfz1EXNIa7uIF//qF2OpxZa4CfGQgkoIIC+g0UWb0ahKRcW
         +x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674652; x=1750279452;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLYo9g0XZU6Jy7Q+OYukaklPi9cQZWEMlGfi3iuIv10=;
        b=ncWVM0xEHQKeKxSjKu4xss7faoprZMzl9jdr025M/PErdOqE44G6BOL2WddO1p+y8x
         Wj5ImF2UYfgn4dZvCcUf6O9/fk9NzekUawbEfW3/zK/gvAnG1UdpiwNqvXeHZv7vpboi
         5eDvaITYTgwzlCvkfWTXH80WysWbAK9aEc1fPrva30Up870DVk8JKh2j0mKhJJL/qRgr
         BvYZUFhgncgxnaeZ6AReBxphI6UCLDbsluYX85cHLZrvj+lyKD0cBpr4vvOH2Aov/kfd
         iCexdtLQi6j0kPZbxRhZ39ikjiQQnO7HrM2oPmsxWnXzWavKYkrjBMO/98vF6UMPKaNn
         KZng==
X-Forwarded-Encrypted: i=1; AJvYcCUzKry5EyQbgQfqrOdcw5KN27Sl201R2iBRWxzCvQmuny4hGGl4rsnu8OSso4ZhuhQIJzOfS37yxHNEEmVk80Pv@lists.infradead.org
X-Gm-Message-State: AOJu0YwSgl5vf58N81596szEVfVsYaXJDYFgNyNKAZbWtVDvh1VTS7aD
	qxnYJDL4u5BG6kdqnVUSrVRepKNwKWLchixPKVW4P3lljofUEnfn43eZdk1YLHqD
X-Gm-Gg: ASbGnctmC8evbehbKlwpmv0C7AgEZORETiS7zGOSPKn8u3NslhIwQkDTAA0/sqlKx1i
	WFdVHRd0PXo9uGvBgQj+1QFfkUAcn6YFGy9JWoawb1xfPD8Mj6fkeTfgT7XKOynua/9bF0BQIQJ
	qy2htFWdiSl8aOryzJyMkCYK8NSgPEDdIfiyPD8eVWz79rt50viEgvdKtoATQBNgS3jVRHec+bR
	DNtIQtW2HgUPn4AC+JrveUrMnr/rJXrvamYd9dJ2fh7CjtRZZR0Itw7qTGhpt/Xp1yNz/z/ipmi
	B/iLu3BenLYY49Lb1Qg4mJBqNX81FdebaeY7BYpq0Vsji9FZWUWKnUkATaPXA6XKTKAJ77nEzZX
	rHLj3uDF0vu0A80B7fbeZ1EsSG+k+69tZioef9Edu
X-Google-Smtp-Source: AGHT+IEbZO25GP0zLYvCQFUPinkwrl0QrXpMwqbq98Zv89FfgEO2JiAN4GPbac0XHqn5u+0zERsKZQ==
X-Received: by 2002:a05:6402:50cc:b0:607:d354:d87 with SMTP id 4fb4d7f45d1cf-6086661d00cmr840874a12.6.1749674652377;
        Wed, 11 Jun 2025 13:44:12 -0700 (PDT)
Received: from [192.168.1.102] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b2223bcsm109668a12.53.2025.06.11.13.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:44:11 -0700 (PDT)
Message-ID: <b41446ab-12a0-4ae5-be2c-7a60315062fb@gmail.com>
Date: Wed, 11 Jun 2025 23:44:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_134414_602730_810D544F 
X-CRM114-Status: GOOD (  26.54  )
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

On 5/4/25 17:59, Ivaylo Ivanov wrote:
> Hey folks,
>
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
>
> [1] is a dependancy on the aforementioned series for the usb phy drivers
> and bindings.
>
> Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
> (r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
> including psci, pmu, chipid, architecture timer and mct, pinctrl,
> clocks and usb.
>
> The devices using this SoC suffer from an issue caused by the stock
> Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
> needed to hardcode the adequate frequency in the timer node,
> otherwise the kernel panics.
>
> Another issue is that cpu2 and cpu3 fail to come up consistently, which
> leads to a hang later in the boot process. As A510 cores are clustered
> by two, it makes sense for both of these cpus to fail if there is a
> power issue. Disable them until the problem is figured out.
>
> Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
> 2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
> 1080x2340 Dynamic AMOLED display.
>
> Further platform support will be added over time.
>
> Best regards,
> Ivaylo
>
> Changes in v4:
> - account for compatible changes in usb phy patches
> - use status fail instead of deleting cpu nodes
> - add a-b tag in the 1/4 patch
>
> Changes in v3:
> - account for the usbdrd changes in the exynos2200 soc dtsi
> - drop usbcon driver from the MAINTAINERS patch
>
> Changes in v2:
> - mention the board codename in the first patch's commit message
> - make all reg values hex in device trees
> - reorder usb_con above usb_dwc3
> - drop regulators for usb_con
> - remodel usb_con_phy to take usb_hsphy phandle
> - include MAINTAINERS patch in this patchset
>
> [1] https://lore.kernel.org/all/20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com/

@Krzysztof - all dependencies should be merged now (correct me if I'm wrong).

Best regards,
Ivo

>
> Ivaylo Ivanov (4):
>   dt-bindings: arm: samsung: document g0s board binding
>   arm64: dts: exynos: add initial support for exynos2200 SoC
>   arm64: dts: exynos: add initial support for Samsung Galaxy S22+
>   MAINTAINERS: add entry for Samsung Exynos2200 SoC
>
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  MAINTAINERS                                   |   10 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  169 ++
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
>  6 files changed, 2512 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
>


