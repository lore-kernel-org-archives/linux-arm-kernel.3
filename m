Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF1E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 23:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oacZmWmcYUh3aS8DM+UCqcN8A1TL7Wl2Fm4tR+M814g=; b=iNdo25roRkJgWe3hFCxPSdsQr/
	q6YPyurm62PRmrxxNEKlxZTtSu6e54GudiKK5bj9nC9Qq+uGpNbOwimAuRyIYGRPDzlIagpcXs6zZ
	kdHwOdDQ63dJysH9BKKda5UbXztj6hQWpy00vvuYWidu8bHlEPYGerAxJFhNlDeWrrB14ohPJOan8
	nB5j2AS6Apwh8nDJhrZJ4NgDFNWQSqZ0uExo3ucY0IOIl8w3JdkVfcR4B+sYYOW6pewiJi1HdQVsn
	SLHo87kC3J2oRApnBPlEKaL7MhDRztM81ushnQ+Y8wP7+UK8yxArg77VxF4tHJblkYptko7AA3e1d
	XflvKdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLSy-0000000HagA-0ZWj;
	Thu, 05 Dec 2024 23:41:04 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLRw-0000000HaSA-45CA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 23:40:02 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-85b8da19535so300569241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733441999; x=1734046799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oacZmWmcYUh3aS8DM+UCqcN8A1TL7Wl2Fm4tR+M814g=;
        b=QqRHgp9xCFCIEda3hUcZ6HRoSnwXcQJTZqhgg0pqYcrwtwQJNNMa2/h2PGxEmDrn2s
         ds6tWdfkX321DlfzAlLUfrOpIY1r9FVXj5dd1+38LwXJXzxRkxAtjg3sfDV8ArRsNB6L
         ps2nJrNWNOclztHA6s5Cf5KNbffPTjqmlnl99UXPBMdlf0+BZ0mAqMS7wQNoh1ROA3yZ
         NQ+BIYu3Nr7Fh8T8Zyuvutw8Ho6MekGGFrtc7Zj3SuoM8HUM2l0tTN2OemuBhct1QK6J
         gptPleRi2BdyFIzXOX3xvB52lesI8mWTFRSBzBCRdCcr1/tSbW/tgaOxDUDIh3DAjP//
         uyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733441999; x=1734046799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oacZmWmcYUh3aS8DM+UCqcN8A1TL7Wl2Fm4tR+M814g=;
        b=TvciHDi6z/eKA71ZOL2JAtzZuuLKnAtK0EzMK17m+3ctnvJWqC1YNVt3Eq7l4Gd4pG
         ed++9LYMxIzJPb9vC4hhxYJjHf/nMOlRtSVJUPVqwpl0La6meg5BW7HsqqsQjNEoVCmT
         HWKA4OVhEwCbCFDh6BAw8U8tuw/l11VHGPfi/D1CDY5hQaVRiOzZIBIpLZHXS9sjYa5s
         JXXYgrDTlJ5pEebxR7LSEf6HVyslhWkJEo7Nkpi9hEfI0mpaRLNM6Bqn8CwUbAeFRj7n
         EdidRMsPwhsPKvR1WYSuAcpH0RyU3jOcMIvAZJbX54me0vxivllW+EeAJxngtTN1vtop
         xIsw==
X-Forwarded-Encrypted: i=1; AJvYcCVez0FrqBGz/GDlTrUT9oAzY7MoLyA0yyyYmVNy/rxRq1oK6anKuZ78bFsZVU8iswiNRAOF7JZxpfj6LEHlnoM8@lists.infradead.org
X-Gm-Message-State: AOJu0YxEI/rps/nCh6W34ort+GdQgoWk+McYoR+dgO7s8KCfZs3GFRcz
	q3KoiNpF3yr3Epp2HyJ19ND4HEUj0ngcX9GVo4MF782PwZIOOXA+xglN05251wE=
X-Gm-Gg: ASbGnctB/urJ88sGixZ15zeNqUvaycjF8a/DIjW0yFcO51UFIF4tYlARbXHG1WdjSmO
	DEpeMbqfWAVDDMyNMe7e9DYs4AW5lin2F8NmsmiZ+BmUkKrpoIiDwuMcOW4mSNoHjrP+ho4jVf9
	P1AVCzrNQLOpLr0mtc2Ffm+3546MVhx08QJ7Z0zbC2JQcPm4erIWwnAFUl/CWKKkNDcUtLOJMRr
	QXtaQIvfXHr7oRnoDkjT3tb8MXx9NGQtzgU/J10iDG6kib87BERAQMmp1YvXJGbpjZcHi+j8ZVi
	6UDmJxgG
X-Google-Smtp-Source: AGHT+IHGLFK0NpREIiG2QUT311n7NIrWXQMbIVONL3n7iGYRppYRkj7evZc5Sutsvv1h+Rf5qB58KQ==
X-Received: by 2002:a05:6102:370f:b0:4af:4d2:488a with SMTP id ada2fe7eead31-4afcab63efemr1980371137.24.1733441999270;
        Thu, 05 Dec 2024 15:39:59 -0800 (PST)
Received: from [192.168.1.124] (49.93.157.89.rev.sfr.net. [89.157.93.49])
        by smtp.googlemail.com with ESMTPSA id a1e0cc1a2514c-85c2b9fd799sm316484241.11.2024.12.05.15.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 15:39:58 -0800 (PST)
Message-ID: <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
Date: Fri, 6 Dec 2024 00:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, javierm@redhat.com, tzimmermann@suse.de,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241205175345.201595-3-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_154001_012077_07C0418C 
X-CRM114-Status: GOOD (  18.08  )
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

On 12/5/24 18:53, Tudor Ambarus wrote:
> Alive Clock and Power Manager (ACPM) Message Protocol is defined for
> the purpose of communication between the ACPM firmware and masters
> (AP, AOC, ...). ACPM firmware operates on the Active Power Management
> (APM) module that handles overall power activities.
> 
> ACPM and masters regard each other as independent hardware component and
> communicate with each other using mailbox messages and shared memory.
> 
> This protocol library provides the interface for all the client drivers
> making use of the features offered by the APM. Add ACPM protocol support.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>   drivers/firmware/Kconfig                      |   1 +
>   drivers/firmware/Makefile                     |   1 +
>   drivers/firmware/samsung/Kconfig              |  14 +
>   drivers/firmware/samsung/Makefile             |   4 +
>   drivers/firmware/samsung/exynos-acpm-pmic.c   | 226 +++++
>   drivers/firmware/samsung/exynos-acpm-pmic.h   |  24 +
>   drivers/firmware/samsung/exynos-acpm.c        | 772 ++++++++++++++++++
>   drivers/firmware/samsung/exynos-acpm.h        |  15 +
>   .../linux/soc/samsung/exynos-acpm-protocol.h  |  57 ++
>   9 files changed, 1114 insertions(+)
>   create mode 100644 drivers/firmware/samsung/Kconfig
>   create mode 100644 drivers/firmware/samsung/Makefile
>   create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.c
>   create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.h
>   create mode 100644 drivers/firmware/samsung/exynos-acpm.c
>   create mode 100644 drivers/firmware/samsung/exynos-acpm.h
>   create mode 100644 include/linux/soc/samsung/exynos-acpm-protocol.h
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 71d8b26c4103..24edb956831b 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
>   source "drivers/firmware/microchip/Kconfig"
>   source "drivers/firmware/psci/Kconfig"
>   source "drivers/firmware/qcom/Kconfig"
> +source "drivers/firmware/samsung/Kconfig"
>   source "drivers/firmware/smccc/Kconfig"
>   source "drivers/firmware/tegra/Kconfig"
>   source "drivers/firmware/xilinx/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 7a8d486e718f..91efcc868a05 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -33,6 +33,7 @@ obj-y				+= efi/
>   obj-y				+= imx/
>   obj-y				+= psci/
>   obj-y				+= qcom/
> +obj-y				+= samsung/
>   obj-y				+= smccc/
>   obj-y				+= tegra/
>   obj-y				+= xilinx/
> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
> new file mode 100644
> index 000000000000..eed8cd8a677b
> --- /dev/null
> +++ b/drivers/firmware/samsung/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config EXYNOS_ACPM_PROTOCOL
> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"

Given the importance of this driver where a lot of PM services rely on, 
does it really make sense to allow it as a module ?

Some PM services may be needed very early in the boot process

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

