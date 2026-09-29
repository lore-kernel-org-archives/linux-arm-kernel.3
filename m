Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A5CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=; b=VzcQx040slSPyq0dktROrkdiI9
	bvxGc7LjLLuSH7rDWf/ABWEk4prGKAwIrjcMOdlXJyF38WEFqlZaimgX1c8gV8uyA0mjU6DBIBFpo
	esej4e3YPf7UUw8eIz7Ve0jagNqMHh6Os6somjDtX73efUGAnZqpBg1GCcq0TirSL4LuqcwgqMAAN
	c9RmD3YByTTm3I97YGp0yT+QIQW/gaDyCm6bjBfAwuK034QJJcSw6NnY7ieKEVqLPRJ+10WSQ1chK
	yh2fsJ9rEepSU/xeFgoQVsqbHGvHSq1CiUI1EVDUg0drzfImH+oXYaivLueL/oO6VsZcLmWEgohPN
	rvOc+sqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTjH-00000002v20-1Rk6;
	Tue, 29 Sep 2026 09:02:27 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTjE-00000002v0l-3A78
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:02:25 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so205290f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672542; x=1791277342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=Vp/OL+LdANTAi2F8LiuLQS4VoTUM9EEu/fOv4I/RpvJNPSyYINsIE3HTcBhf2OCoi2
         w7I5t8ir6thxvp5BswPFSAXr3rsDY+6SmDPN3wpt7O8z1m51YP+yQsRCkrTbyB3YvXkb
         xTzZJBFIXZSXUAjkRRKvd+veD0sGOVj/HNjp0lF+EBE7Pz1IrMGYXwTUE1ZQSiLLPpnr
         OPETSZ74fBwGEZkgFtQxk7gfwqMF6e/ENMFizvPvoQ/wY7uIPmjmAH8tr8HE9MLrjBRE
         tfTOV6hdAt650zlur8db6wIopc7qPgmRwXeYuR5Sx0zEeJsCbsq2KJ89LV568VGZkXJt
         TYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672542; x=1791277342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=MrLiHVLi+CJvLWYTTXh/5NiSlcfqLYKFsRJntzKw5PYC4OVf0REEEZCD9ZXJyR9sQB
         XvALqwsGr6S1QOgAR1x+49Bpf5vAZ8tXPU+tNFZQLDbWO84f1Ohe5hhqb3PmZQr/wqw0
         LvgTmqHb9K/7yOJu7rsMPakEX2phjZ7+UJ80z6dHIZXUFKFifLoW7MZX5teDtBU5b0Ev
         xJW0daLIMmstzvXpTAu25guMlUruPlBzHZ4rFF2b95KUwslqCzuljXXDmU0vTNIZHnze
         gylLHUiAsquz4WvV4ABqGvOsTV94HjZAtmWfNGYDsGS7wqkTprje2GZjC8Cfq27FXk2d
         8aHw==
X-Forwarded-Encrypted: i=1; AKwUvBxOa1P7cOlCK5Lmhbp0cmMi3FJ80GLmycxXPDzKEsBuojrDwXOYE82nhra1127dOB5rdP21WMD8qDNxHK7tBG/K@lists.infradead.org
X-Gm-Message-State: AFq9FYIMWcTZO6ZH6GxDo0XeRQCpxN9zrB3OhflAxL34uIFTh6oR7/0v
	uT81rP8keZq5DvVG4ssUXvRgnmTfHx8G7sHwlJ3LtFg3GgaO64ao4TPVin9/Z0VBc1bIo/uVO0x
	0ijRU
X-Gm-Gg: AYBFou034mszAKMgAGkTHRXJEeC1mTlu71UVqc60UAXnp9E8DCDitX2S6urGe1GMmiH
	/ZjosRtEF98ZPgxkbnlFymJu5rNfqINj9d4t7fLf87GOfk9yjOgK/G9c8Yc0H0xotD2ZvX47BtN
	2V6eYpEJEVdvwpu0dKaiQT68bIIV10pTTfzJM6gsf6YkEw1jOHHNnnQC62C3AK/le2AQN3pZ7t9
	3FbqT3uoCayZAfPc60XtQLyM8ywe60N+Yzs05QmGSyJ5GewMeN7++uU9PGCE8hE0tdVf5foVlUv
	uL1Do8EBtlqPZs/Zydg/BY8+GVWqbvPKFKK0U1UfGUCNpTE38D6sWURk5zZXti2IcR/8Al32D3n
	fHoFbEy1qWayxIRIbLcbI0gR0EG++fAvZEqMuSGwVkTZ24vfe/TijPo9hS+IvKeENKU6AFzroGJ
	otFbaqHmRdrdhsi+TI/YMKVZvwG3kwbL9hsm+DzZLTTmEEXnm5SgfmFGl8D3PUx8fMtw4JHxyhq
	rm26VVk
X-Received: by 2002:a05:6000:4009:b0:487:92e:c608 with SMTP id ffacd0b85a97d-48af1b1cc9amr3124751f8f.1.1790672542160;
        Tue, 29 Sep 2026 02:02:22 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm2748227f8f.19.2026.09.29.02.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:02:21 -0700 (PDT)
Message-ID: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
Date: Tue, 29 Sep 2026 12:02:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020224_822918_99250CB5 
X-CRM114-Status: GOOD (  15.28  )
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

Hi, Alexey,

On 9/29/26 6:10 AM, Alexey Klimov wrote:
> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
> protocol provides interface for all client drivers to actually use
> features exposed by the APM co-processor.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..91c6cee8f483 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <dt-bindings/clock/exynos850.h>
> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> @@ -170,6 +171,18 @@ timer: timer {
>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible = "samsung,exynos850-acpm-ipc";
> +			mboxes = <&ap2apm_mailbox>;
> +			shmem = <&apm_sram>;
> +			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;

Why do you describe these clocks?

Thanks,
ta

> +			clock-names = "cpucl0", "cpucl1";
> +			#clock-cells = <1>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> 


