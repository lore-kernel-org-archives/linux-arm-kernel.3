Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC1BCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0Al/MgTi9UiIFNlCU2Rlyn7hcGn2O9uqtmtM9MWWL4=; b=Ag9NbUM4HbzGmEDRylpCitBz+u
	u6YkOpfIcY3HjAz6BG4wOOglmL/4Nk/SXuMq+p7Eq2UWowUrdoSpxGV2raQZD+Dyf5u2820g3k3Wr
	iESltcysuNDPBcBVwXuGBe+CCsnPvIpymmbD09GlG8cRd4yfsIU/MuWPBSgyqcTbNrrN/22427jL1
	Ha81L/sZMa384rEOGdDY+CUEWejiqj48od7PDhYxzwfT9OVdM2+pSLF+dQQGFpJRTdTxIQPPAWel+
	YXcCUU+WhsAjSuOEGDcX/sKa814dC0l1MYDMgdGqcSFToFYo1/eIspaAG/iZCM0WzH+nx+o7gv9zN
	GoHjUSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTd2-0000000ABro-3yxS;
	Thu, 13 Nov 2025 09:28:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTd0-0000000ABrB-0ty2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:28:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so295728f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763026108; x=1763630908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0Al/MgTi9UiIFNlCU2Rlyn7hcGn2O9uqtmtM9MWWL4=;
        b=hnmKFiACCFFy+Og2ReVm9e4e9+hwFEbRRJSbXAdLkdCqUqafm7ezJPmGD+kCOK40vn
         cC4czocfw7auZ9b/BaCYWg13nCrCUGGmdvJeAOFqYyF0+AHiwfDZioyJjORQ1rvyD/6t
         6PmVy/wYTmZgT3JBCWsP38nmSALwgsAXkj6vkU5HwT2IuP3WRc2aJSr+u8iR7lSb8PXC
         nBR/gxBLEsR0y8jsTDMChn0fd6yUpzAbcZkt4pE8RJ3giKkdU5ljSwDMTtb2POxl8hAg
         XblMUeQt42NsgpOYsBse4fG8TgOaJRcumnsc5HppMwfZYow+ULB+3HrYnbaPlKhlDQ0a
         B9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026108; x=1763630908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0Al/MgTi9UiIFNlCU2Rlyn7hcGn2O9uqtmtM9MWWL4=;
        b=XCWd8n7OpcncDAuYMRFzNkS8u/ITo8XCS3rtt1k5caRicUpp32BEfsfJdBQDMOBE9B
         PYu143ui8nKwfWR4xh/7ryv7BDFZFnSeiW9baePVHaQkwApYirnpTgkbTvZD3WgowrhX
         tcSvQIW+cc4hpFJoisz2t0IcL00d5hKucf1ZOgdhewYiyXkg72nGagMRscESC1aFl3Ei
         O9H43G4sJzYrms3VzokbILl/lEQ2lhvW9ClqeKHi6W1C36fpj/9Cqo9ycXcbWwLCgtbv
         Tfl/Jxie674LLADHN7jpDm5KHYAG0abpvgoGuNTuF2E647lkXTO2vH8I44c7L9Y6AgQj
         hC2w==
X-Forwarded-Encrypted: i=1; AJvYcCVmfk1XCTJ5+SpWuUzPryRND9uYm6i82+FWrZhLmJMGC2QAguMvFu+aDkCnOE6GO8B+TjqeQWxpFILJxqefHnhL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw31ZHCXT5izOrm6YSVbDAKd0hGvNuZ6h0+4bvZpwDqNVfYRYgA
	17Irt/awprtEb7ouA/TI0Dp5vpOl/XfgP2H9YJbcZsfuHS6c6OmtuJPi6+KD3r2moic=
X-Gm-Gg: ASbGnctXWa0Zwf59BrusVP277MhmAdDRxDB1UYtx/Y7ESlxOGrawBJSK1K7zngETqRT
	kTJmiEbRdkfrscXe4QP5YCKq4AGK/6Jr1hBbN/L2/9gLF92uqIdQOx6cCzqKLQLtFOTlw/luQ+Y
	uUf2UOm+9fTF1wkZFwAvTUbDjNGcjO3kQRssWHyPBmKkphCgVkEKcrTfENLiV3b+TtUFCRZWwMQ
	HzTeCM+I6DzeMV+97VfSEKKdEb/nB1tNVG9QKMFbE4IZvFLZDHCk9BDe3+pMtCHlJLLn7qInuFU
	lY7BdHU0OY3yeqJUyat28K9zSJPUhCK9D0ji2cFUY1KUW/1KmH2hrh5AT7MFE2HMWhofbqL31HM
	ec+6fVGjD85+OYkToknglPOMzWV31mUzV43na5A5rk740aKbqtt+Cj6OsHB+ZD1lC4f6pgA1wjr
	ZGMHH7MA==
X-Google-Smtp-Source: AGHT+IGA8zptVGd6p2fpQ3iMFNNP5Z9WNKG2CHeOguw2sJYdTOHLeD4IEEwaHIyLI4eZtg1rS/iU3w==
X-Received: by 2002:a05:6000:2509:b0:42b:3e20:f1b2 with SMTP id ffacd0b85a97d-42b4bb8b8fcmr4530969f8f.4.1763026107981;
        Thu, 13 Nov 2025 01:28:27 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm3038492f8f.17.2025.11.13.01.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:28:27 -0800 (PST)
Message-ID: <9d77461c-4487-4719-98db-1c5c5025c87e@linaro.org>
Date: Thu, 13 Nov 2025 11:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
 <20251113-benign-macaw-of-development-dbd1f8@kuoka>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251113-benign-macaw-of-development-dbd1f8@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_012830_281301_98ED1851 
X-CRM114-Status: GOOD (  24.71  )
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



On 11/13/25 10:30 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
>> Add initial support for the Samsung Exynos OTP controller. Read the
>> product and chip IDs from the OTP controller registers space and
>> register the SoC info to the SoC interface.
>>
>> The driver can be extended to empower the controller become nvmem
>> provider. This is not in the scope of this patch because it seems the
>> OTP memory space is not yet used by any consumer, even downstream.
> 
> Quick look tells me you just duplicated existing Samsung ChipID driver.
> Even actual product ID registers and masks are the same, with one
> difference - you read CHIPID3... which is the same as in newer Exynos,
> e.g. Exynos8895.

Yes, that's correct. It's very similar with the Samsung ChipID driver.

> 
> What is exactly the point of having this as separate driver? I think

The difference is that for gs101 the chipid info is part of the OTP
registers. GS101 OTP has a clock, an interrupt line, a register space 
(that contains product and chip ID, TMU data, ASV, etc) and a 32Kbit
memory space that can be read/program/locked with specific commands.

The ChipID driver handles older exynos platforms that have a dedicated
chipid device that references a SFR register space to get the product
and chip ID. On GS101 (but also for e850 and autov9 I assume) the
"ChipID block" is just an abstraction, it's not a physical device. The
ChipID info is from OTP. When the power-on sequence progresses, the OTP
chipid values are loaded to the OTP registers. We need the OTP clock to
be on in order to read them. So GS101 has an OTP device that also happens
to have chip ID info.

For now I just got the chipid info and registered it to the SoC interface
(which is very similar to that the exynos-chipid driver does), but this
driver can be extended to export both its memory space and register space
as nvmem devices, if any consumer needs them. Downstream GS101 drivers
seem to use just the chip id info and a dvfs version from the OTP
registers. DVFS version is not going to be used upstream as we're defining
the OPPs in DT. So I was not interested in extending the driver with nvmem
provider support, because it seems we don't need it for GS101.

Do the above justify the point of having a dedicated driver?

> this can easily be just customized chipid driver - with different
> implementation of exynos_chipid_get_chipid_info().

If the answer is no to my question above, how shall I model the device
that binds to the existing exynos-chipid driver?

Thanks!
ta

