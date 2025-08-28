Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D2CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dukyz/wwn5n6nYfGASrhAq9EDpRCS5QgtuNGs9mvY3o=; b=KnS/z/sB1qDeHc7yyc2q6BniVw
	6tLk7p9SQmLrSxggFr1Wer102/0P6oI1Rs29JPIpfJ8U/n4YpGnyizPn66imjj2dKDvDlMuwcdWtp
	gGtUnOjNHRxBkQRMeStUMSrbcvGH6f4VHbAG80saqJhUcfu3fK4LqzkRD+i4TMPs8pzx/9HxCPHM4
	wyGeimbYQVtsFHo5OjSbjEoiamW1fChzp9MNgVDNL2Q0GxMQREyAVj1Wfft6i55dFOS87MBL7bh24
	CpG4Vi0AIqwxMxUazhgoydUce8LwZ3RXgk+H0Ra4C1yZqj27ijg2A+OAfHVYJuoIjAADOq/zMI8hW
	BA6BXjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVGh-00000000KZR-3lgB;
	Thu, 28 Aug 2025 05:33:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVDy-00000000KKz-0KH1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 05:31:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3c7ba0f6983so365705f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 22:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756359060; x=1756963860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dukyz/wwn5n6nYfGASrhAq9EDpRCS5QgtuNGs9mvY3o=;
        b=UJmLQQYSemunD5qfCIXduhPxgR1ovHdbbn0hqOkef7YSKWNjmnmCMpTEB4UkFPmoC8
         IBfSMGapqXjwW8wmRHTIkc3ujAo70I4/TwOjqlyxwqv8bvEjc1Vn65+lc5FEQ3AGATKU
         iNFyB90vgku08Awgfha+VPxW/x5lN57rhQREH/QQt2S2YuiC8RCYihO/7kCbolx2jqER
         Uj1M6HY0HgbSFkmk9j6IbWfg2KNEbntA8aYJedDazDMH6j43SKVAedP/Mi34RgQ9SWja
         sPqlWcO2uyEN24r4NCpRORPRW/d+8JB4HIIi69oXUIN2kj7UnFemVYbYwU07LX8pJGud
         31Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359060; x=1756963860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dukyz/wwn5n6nYfGASrhAq9EDpRCS5QgtuNGs9mvY3o=;
        b=LYJl2fGvAT9ka+HdCc0aubQOHgRl/Bl9wdvoyC8kb2egML3XLWu89obI2/TgyihErk
         CFjL6bt1WSrhvUmcDnfMrlFGAbk9AhQVxzp/YT2s27ChMoE28KmPwgV1vV/SY8J1NRv2
         GRbz6cBPYvdvD1ci5hu4uDHGXbk05h+BFSV9Um1NSSlTRhhu2p7gU88fHLWtLJgjx4fw
         RfFaORj2OzQWIklLcNrM+nxYE/Nj7WwPpFmrZZFfTyyYfnCpu6xRC9qgtFNU1ZuNPjPI
         7jVKDVKEa6WbswTT/X0n6BKdFNxcftC1Jj+ndigUPvWJIL2hfoVQ6ZtmTW82lEcArG5m
         oZRg==
X-Forwarded-Encrypted: i=1; AJvYcCUpp15+BMUAARRWuD2pkUCD6ixktRE1/lS0Yqu/suVV1TyAHkwqLBPey26OmDu+wBYg475a2K4OGbT8A1nAZdEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzScewwqevopowH2dQ6qmToTTvGX0W1vqZPVfjgjJdEMTp+VsBG
	mN/3Auxzueeu6Z25O+8NuLH1yhjYzeG4hR5QYf62kGwCXxMwjylbzcFiKTaOu1IWN2c=
X-Gm-Gg: ASbGncti/CpTTZyDtHXRnpMekU549ebOe6heZ2/KR56Z2/CjhWOwQ1YmNt2UVdaREPJ
	FQFWM5/SHmRyDhlbebXVzzT63ywlGrhhtq+28JAtzJXoDOKXoNMz0sj68JXvZUOnrIROA9SuRYh
	f/ct5xvVC3DR+0U8n1RSHrECFjc22Qr1oBAs/rXDarGe9+ilFFG2KNP04UaRXisNa/0WnBu2Cyk
	5a1CK6/x705PAmu2s1BiayUjgxjlkX/ot2dJr0bDdo9fs7I7zWfxW9sDaKKz5xiXgOx2Y1+RfdX
	VNEbanDwJuIWhiTBn2RA5LMqR5ebAc+ESxA485Umzju/B0sz7NByamzeFW6WM3iNIF4nPkgNS1t
	DIORj6yQXRZT7evtANnVGuG9O9C+C
X-Google-Smtp-Source: AGHT+IH4nwfNWHmZGlR8S50a3ZT7D5vEGnIKIVmskD+uwNW3XeQDTxi4IgzGD08mK38khPTU4HbCsQ==
X-Received: by 2002:a05:6000:2f86:b0:3c6:97ae:a59d with SMTP id ffacd0b85a97d-3cbb15ca063mr6020844f8f.8.1756359060216;
        Wed, 27 Aug 2025 22:31:00 -0700 (PDT)
Received: from [192.168.0.251] ([5.12.38.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc4b102889sm6638839f8f.51.2025.08.27.22.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:30:58 -0700 (PDT)
Message-ID: <05e9dfa9-d628-4a4d-8cc3-f6854cc186d9@linaro.org>
Date: Thu, 28 Aug 2025 06:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 willmcvicker@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
 devicetree@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
 <175633665113.3746832.15304875656374701987.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175633665113.3746832.15304875656374701987.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_223102_133566_24500B17 
X-CRM114-Status: UNSURE (   7.98  )
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



On 8/28/25 12:18 AM, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org:
> 
> Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.24-25 syntax error
> FATAL ERROR: Unable to parse input tree

That's alright. There's a dependency on a bindings patch that's described in
the cover letter.

