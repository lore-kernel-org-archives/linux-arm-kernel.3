Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70557C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 19:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIzFU3oveHSb3b2sYKrjUAfhi3Wxf+qS7iSQYpFodfw=; b=J4pvKPdPgen9Rm8riVfV7Xfd35
	8HY9nRmOR2S66vjoojA299qal2ibBOI2ATXo0DZaLfvQfa5Kk/7bJr5X1z6jidEg1fQgftk8Mhnr2
	3AMEN0qRvidfm0Da5io/eO/NXMPcDhiQFzcjy2AJJwOoXZyyxxJpI0F9jy67WkKTSdVu4rTXLYa+s
	WJIuBcNfEWrhYCndAOGLj+uxO3HlvDFMnH7a5V5YEut4oKl+mV429NODqB8PZous45AgGEqKUfNge
	sHBXzAIRFUfqymyY6MAeqICKNkEsgzONE1NUBGSb9eIYM6qRCsDNNjJmIQTW674jcUrYKfkZoVgUj
	oZfgbXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnwN-00000005rOk-2MgW;
	Sun, 01 Jun 2025 19:01:51 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnuE-00000005rDb-42e1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 18:59:40 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-604e745b6fbso7217511a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Jun 2025 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748804377; x=1749409177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIzFU3oveHSb3b2sYKrjUAfhi3Wxf+qS7iSQYpFodfw=;
        b=dAX5UqUa0zjvusBPOQl39NskwWgoUvOWW2fFScEx2orh2I0xqltL7rXhxG113dxWFt
         7WdPSSJ5i7zUydZG834KbWaGJNs7J3u7Mk9z2RCde34mG4IBIdw04f3v/a8G4r6zd+Zw
         2y0prbhXNA6Nzts/43m7vvJspSdJHOGziaVDBWOF1xF4sXvVbfevL3vVxLFuAU3wKBVB
         2df3VnzOk/CshP0WQN1Jb83lrhdVqoXY0VNsbwjR4tlpVmb89Oq1B6EKZVr7chzIO5xc
         +hAwIrsrdBQQAG8CuogVCDI0G64UPoZHc5LY+fSb4VZzczdZKmFJ/uSjEYHfvCmXs1J5
         +9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804377; x=1749409177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIzFU3oveHSb3b2sYKrjUAfhi3Wxf+qS7iSQYpFodfw=;
        b=gSpSbHBDs2310v2aQOGr0czbAWEnmIq34dJoMX+V+UOt4B1+YH5OvrMm0BdkUC6mzq
         kQ7skfOD3q6gEts+8MmISqzVz4xrV5ULqP8xz4sJKfJVwfI/OMCgXGW/OzvGJ/45BPAS
         NVYU/lrfRw0KpEvLWiNpWpSQxoSRrnsaDkhBUhSGehfXvFLYILl4Z1/4cXI6pkk+OUq0
         BtkBXJwGYKGSiBmpzCw3m4oaguP0ruKmBtzgVpewibldESoVqBG32K83pLi9YuRlCUfz
         IywIXe8/wpciBM1LtZmc3ruy8dm2hHsYMBSFeQgxaBCK9IWvg5P/rDa3YARtQ4LjDjQU
         mPXA==
X-Forwarded-Encrypted: i=1; AJvYcCWuWnt5bwUAa1iUU361QwPXKxyC7oSLaPcWoBWxZKKZ9niQRjBP5sfxh1cSjxQ/WNXDTziRkUO0pw3I5Ca+NLW9@lists.infradead.org
X-Gm-Message-State: AOJu0YwhiqzRuMGL5sH/4M4w+FvhjHSYR5Gckz2+4gWYTgafBFKE3ufH
	D9Si8iY+fSwNhwDQD7PzlYtlGPpDrD/joGfZ4pMkFIMABNx90eJCGVcP
X-Gm-Gg: ASbGnctd3TJFCR+JiCFELTt0pmoG7AI9WGkERqBzpK5qyxQpJAI0TaJwxpQboRBeCK0
	3yqBwzpqvvQ2EB4+PHbbrRS0kRKDNTWb7X+WnyjcuRrMQx0pZWi5DOaTgAVajG2sw6nBLIeXXVJ
	N6LqB2WV5EvPJ6WBfXNchiFDtj9QS2d8nXxXqkkd//srvXXg73irHHBwGIygnLEv55v4TM2dB/f
	bfLNC4WBZbX33sBOjqAokCQ3b6YlBfjMUE9K8V5RmKj4pA6isiRhZTJufrQYi0k27ixdXaV3QwP
	pfYjqLxitzYvxazEKOgr+Lgy16HPw82h8KIMaKcBu3SuaBxbzG72Nrnwri2AdI2dEFHF440qlEe
	ot5pG7UoEL9Q6mg68vHS5KmoeMxgJAA==
X-Google-Smtp-Source: AGHT+IEP2x5ZAxqIc1gsA4YFDwl3131Qs5D19FYWLp46cTsFeKuOi08zZGcuKt6dA7kp1G6jlmOOpw==
X-Received: by 2002:a05:6402:90e:b0:601:a35e:6dd1 with SMTP id 4fb4d7f45d1cf-6056ef00a9amr8866615a12.21.1748804377131;
        Sun, 01 Jun 2025 11:59:37 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-605ae6eb0e2sm3059856a12.3.2025.06.01.11.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 11:59:36 -0700 (PDT)
Message-ID: <8d14bc8d-6a29-4317-9ee6-143a2919d17b@gmail.com>
Date: Sun, 1 Jun 2025 21:59:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/21] drivers/perf: apple_m1: Add Apple A10/A10X/T2
 Support
Content-Language: en-US
To: Nick Chan <towinchenmi@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
 <20250510-apple-cpmu-v7-11-bd505cb6c520@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-11-bd505cb6c520@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_115939_009756_D781596A 
X-CRM114-Status: GOOD (  11.18  )
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

On 5/10/25 18:10, Nick Chan wrote:
> Add support for the CPU PMU found in the Apple A10, A10X, T2 SoCs.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Tested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> ---
>  drivers/perf/apple_m1_cpu_pmu.c | 127 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
...
>  static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
>  {
>  	cpu_pmu->name = "apple_icestorm_pmu";
> @@ -1155,6 +1281,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
>  	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
>  	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
>  	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
> +	{ .compatible = "apple,fusion-pmu",	.data = a10_pmu_fusion_init, },
>  	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
>  	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
>  	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
>


