Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2BEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=690bYW6+JhWBO5SGjqvjGmOT9zUI0kV2wWETtbgOT54=; b=vqXSf7ViVxj16S43OMTAeuOpsZ
	cJ5p+CEJ/SKsfEO97qKJs9GO5RhUUExH8EEnmeWvV0V7Kzxe4LF9Xk/Ouw86mMxjl5T40eIuWMDxz
	3XniMvk+kTLLFulx80MW0S2dAe5WCXOH2s44Nd1mszN+GtJ8FsUr7F3EePlIySlZF4kJU4TbJcxGp
	kL2zsFPU2bTP6dRGOCaTQ7BGwqjh+j3HuHmiPmfJ1/aiXnx1zCcL2GWJKyyObNt5/xAdXyAmc6kap
	yRP/YlkaXdvpWTCknooP/OZUEvrCLu+DGdkE9s4d3ix2PyYCK0jPmVBExLptBS1QzReYu4jWMiT2e
	2G4n+39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGGJ-0000000B1OK-3mFo;
	Mon, 16 Dec 2024 18:56:11 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGEW-0000000B18L-1wCL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 18:54:21 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-728f1525565so5264519b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 10:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734375259; x=1734980059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=690bYW6+JhWBO5SGjqvjGmOT9zUI0kV2wWETtbgOT54=;
        b=eQXjgxtE7WO/I159qj/hkRh74tJKTvoHT1B0GX885icFoJZ5zokINhCH4brOc9lWFI
         tM7W4JGnow+YBh4XonWzAkVP79wVTaNeQ6exfzRUGfPlpY3X1pQUcNjH4mxvVBWuSPDj
         m0ByF1JkWdUYahwWAuoCom1fF3hBZ5rm/0l7/+1J4u4iFJL4ooZmvS7Mii09AMlVdR4s
         CGAjvLMc6NUdYYGuGwTjmEFRYkGE+wwsVjGjn6O0o5IZF1hMPYi6Qi5XuZjiz7FdgsRA
         NHrcQVL3m+q0SSE/3CaESy4JZLttLhYkZeEtJoZXG9qMChV2zjakkNXdVJ1lNvGGvzxJ
         2Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734375259; x=1734980059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=690bYW6+JhWBO5SGjqvjGmOT9zUI0kV2wWETtbgOT54=;
        b=JnJDQ5QIBF4BW2KmXOJRT6EKHZuB5zqyML0x1kCUI06i74jqBWZ6qRX/Lush3/hngI
         WisqRjw7X9crhIYA5/l7/eVMh+rwIvvjjJzScHohKdmrrsxWD++9c3nUnLvruR7aI/UW
         LJHfbYsP5G08MRNlMqm28oBKNqiwuosT7muhsKpXUu8GW2aRujA1zrkcFNJm4xYFcUyc
         /q7B99Vy1WQ5MEgsrpybukgjLugjX8qFX4T+g3GI2Ln5TUS26L2c/JIyLqSohm32JBww
         wGJJlBurTazuyH4IGdZlo0Fxv5RLFZESgGiFk6tv0lUP/asnnZhTZteBPANEK6mcJpSd
         H6xw==
X-Forwarded-Encrypted: i=1; AJvYcCXegew70RXKTuF+aC5Bd6Wrz2lACE8eyFxVB7Lj6wYvJ0NfxdJE7T+F6ZpZnh1XSk6NvzM2PpKGnmW8fCeXJDb7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1bI19kZyELLxwRFW4XB9nr2J0LcUWX3UZh8MOVmW4VXlgnnlW
	IK7IfjC6c4BDm28w9cc+ituaMsZeb/uQk5oDvSBBwYrbAePfALAms/7CGmWT8w==
X-Gm-Gg: ASbGncsWzfJYmvtJDfFxC+UqsJT0/6swjceenmnP6n5VB6u7VSpDhRQkTM2UxysorZ8
	rKcMPzKMjikrsXxYSy+InB/rcU7ajbIXg6olcFvVGWb5XlTkqLPJu7wk01DpkAJYzjlNHiZmYba
	GexyhwwTJZP/M6iUWuF5YatC5W6ynBPD/HiceP2eCxr8uahs6hmlUQ2Q4q61iMf6WL/jGTXTxgn
	IWPXNZfYDlaVijlJyFkpO4GUG5EqURdG1qOAthqlsUWzPeDJ2OpT98lCeRGYBVtMHuKpUJ1hgCd
	zP6bew3A27NruUpRTN20ouqS
X-Google-Smtp-Source: AGHT+IFLkxN//qOcEYYuBjw4V9elaQ3W3HVovjotDyIMx9yQiA5AcZ4RTDQhTqISuW2kKbScrkRKeA==
X-Received: by 2002:a05:6a21:1796:b0:1e1:9fef:e960 with SMTP id adf61e73a8af0-1e1dfc0970cmr19290101637.6.1734375258877;
        Mon, 16 Dec 2024 10:54:18 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90832sm4476417a12.11.2024.12.16.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:54:18 -0800 (PST)
Date: Mon, 16 Dec 2024 10:54:15 -0800
From: William McVicker <willmcvicker@google.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org,
	kernel-team@android.com, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
Message-ID: <Z2B3V78k2ibIdLYh@google.com>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
 <20241212-b4-acpm-v4-upstream-dts-v2-3-91b7a6f6d0b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-3-91b7a6f6d0b0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_105420_506091_30CE578E 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Tudor,

On 12/12/2024, Tudor Ambarus wrote:
> Add the ACPM protocol node. ACPM protocol provides interface for all
> the client drivers making use of the features offered by the
> Active Power Management (APM) module.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 04561e15b96c..8c3f07371912 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -277,6 +277,28 @@ apm_sram: sram@2039000 {
>  		ranges = <0x0 0x0 0x2039000 0x40000>;
>  	};
>  
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible = "google,gs101-acpm-ipc";
> +			mboxes = <&ap2apm_mailbox 0 0
> +				  &ap2apm_mailbox 0 1
> +				  &ap2apm_mailbox 0 2
> +				  &ap2apm_mailbox 0 3
> +				  &ap2apm_mailbox 0 4
> +				  &ap2apm_mailbox 0 5
> +				  &ap2apm_mailbox 0 6
> +				  &ap2apm_mailbox 0 7
> +				  &ap2apm_mailbox 0 8
> +				  &ap2apm_mailbox 0 9
> +				  &ap2apm_mailbox 0 10
> +				  &ap2apm_mailbox 0 11
> +				  &ap2apm_mailbox 0 12
> +				  &ap2apm_mailbox 0 13
> +				  &ap2apm_mailbox 0 14>;
> +			shmem = <&apm_sram>;
> +		};
> +	};

You mentioned in the previous patch that "GS101 has 14 mailbox controllers",
but here you have 15 mailboxes. I looked at the downstream driver and see the
number of mailboxes is defined by the ACPM framework (firmware) which is read
from SRAM initdata. Dumping that, I see there are 15 ACPM channels. Have you
looked into into extracting the data from the initdata SRAM address?

Thanks,
Will

