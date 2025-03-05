Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54488C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 03:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=; b=U5p38AP0JiknzYkPiqRGWnOJnQ
	iJjqpBqFIPm2OiOIawjhp+tYXxy2dkJ0DY3O3Go0dbfzbJDd8Be0rzl5Orb0pxD3sX7Gv/B1oA53b
	T3/CDF2TJ5V+JWgj00e2mi6BEShjegrHQRFpKU4QYMoPobBYtvW6Pa+uaGbpSNH9yfEt6sUvldd5x
	7Q2J3QYs7cHx7B+Um3vI59NnVZLU1dMVuRWSyN9Dj0Zn/14OWJ65Ahr+ujBlJS690SBrJfupuEyfk
	bCcgWojQddVZrv3E4BY5IMXXgP6163gLsGcu6fPHpWUPlQbcAGXl5543SOO2DHMpQonoX05L7fFB/
	TsgjNX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpf23-00000006qsE-1HCA;
	Wed, 05 Mar 2025 03:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpezN-00000006qdj-15oO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=; b=iE09+HkOKXTdEzHLJ3OB9r5fbX
	XbaFHxdlfeAONVOSZ3ROEPNQwO2qlA03WAGMnAgD36JitidiKj0V69wXzHHXRa3qxqfHZQLLE+2y/
	N/X+rKNm/nTP+rCWyj03jHlV1ZVysksHCdSXGeplDQ8UB5VAAHNMiyk4NaHNiYSW+U5hNQ2Z1oM7K
	N3ZCwEQE1GObjdpnfKHlHuogHQd0nlQsufEgu7p7ZBAOZvwOFKTN2iRnzzdg359HHI6dvkKJfCOQE
	iWYEr5wPpZM9aghSAkr99vPh1CkBdIg2PN/3rMPjGCkefnUnvSb+nJ+62QsHIBXVY3Qwb0uQFJr3E
	D5i3q8sQ==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpezF-00000000KXy-3URA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 03:00:01 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30613802a6bso66823291fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 18:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143593; x=1741748393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=;
        b=BkhD94VJlBpQvFxwW0c3SDKoIsgcZ6zWN1EHypdqnw41Cl5SFYVboiESbXQesYURTO
         5Aoc+9gfDXwfoN90P4zNQrOmsbGX1bcovJon9ls3ixnm2zDJzqe3EZYTMzqhscNGx9A5
         fomnfZWRu6O5JPMV5kmgKQ7tBvOH5EwzTyIK3Ny34A0l7jWCZE3ApC1VhFKhxq801GVa
         Wj5NlCc/3LDDgx2wF5MNjVRVWXXZ+UAPRCtwrNZKXku6CjppU8EUcrLSMItnUKhHsdRE
         /eSzgoubCqE8RR6YhxFvA0SpeLasppyYArf9+c22NHXXN7D/jX14sF4Kp2YBJCQCEMp7
         bVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143593; x=1741748393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=;
        b=VTXv3TdgX2JZ5LmE3JmSamLVDe0pRH68zkyBvQuxKIYNzGrGADuFCItybBJyCPoswF
         R2XrqW/MDR2hbU/nWJSso5UFtWKhqi+5GVnjb1P6kcbGSwsEQgBPREVgPPj7C9e9NMDZ
         7Vxafn+UCOE4SMaJckQb3lUz4RUHcRC3FVOEHgTGoueLwMXKvk8APTJv4ck/Dpg6YjSh
         ob7cpK+KfFo8C5X/bR+rhZwPmLyP06Ur5c/FE76coOkl/JLQKHWTLHBFwKuLU4ZUT+uR
         XZoqDy2vo2u6Oc3Li3QCIxB4dEhvp+FgD47ZZaoGVN5cUo8pGLHuPNyg8sQOpR3kOpyE
         Q1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL8DhZLcs01dLhzai4uKM1nHP6h1RXBSJ2TMAOk0ckzBLYt2v2fUae4A+ZtG8I9g/MT37MMGVDCLEAh6+tOhbc@lists.infradead.org
X-Gm-Message-State: AOJu0YxInKIZn/qmN7uUZzLiH0vDXUCqOLwPW8L4/iF6me9xTN7HjJW8
	mkAq6fJ22gj307pdMSeDHqHi5s/qbz6LgYWLX2+sqOF2jHAX1SHdxo2Aex6kzjo=
X-Gm-Gg: ASbGnct6b9EbpUQfMpN0OvcFlWCLjgWQQlnNtE8XQaE0GWtpEtAM4mH5JvqiQf3nepF
	8rnUtNBORn3cEOZ752zMnh+ruryltIRgiDX4OmwDsCv0hYQhwI1kVScXmJ7uj2qrm2TWgNom/MS
	SCwMZ2yEAdxW9GILGB6lmLUMCksCcCK7wzkFgq7KsXYXAswU2RzxizFW3BAAskacNMjBUn4k97L
	twQlBWHugSyQ7HyZWPL1c0Hz2W8kArdM85jitStxWmh5b7LuTC66r/wcqCzf7qR4zPa6AmlksU5
	WXOvreKu6yuy6YnSUMvrF0dccWzRFzBH8JaYbN7CLqYDigiR3ZiiEuC6wozkUQXx2ctunBV4AnU
	lKb12s207fLrVV3dBaLCG+y+x
X-Google-Smtp-Source: AGHT+IGkLyEj88NKFgMk5Dc/qcrMMu5c5mz/edvqKr7cxRFirThc+Fkx33VXvY/6F71lJ9O4B98xLQ==
X-Received: by 2002:a05:6512:ac7:b0:549:39ca:13fc with SMTP id 2adb3069b0e04-5497d382f6bmr469921e87.49.1741143592852;
        Tue, 04 Mar 2025 18:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54962415d13sm925305e87.257.2025.03.04.18.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:59:51 -0800 (PST)
Date: Wed, 5 Mar 2025 04:59:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <xgryihmtcbvhimm4fr2pcrhjcwdp6djfrgtwj4a5kl4tukeavb@de5irgx54w5p>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_025958_570783_2C8AD202 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Mar 04, 2025 at 01:56:42PM -0800, Melody Olvera wrote:
> Add configs for the M31 eUSB2 PHY for SM8750 USB.

Please use git log on the defconfig to check what is usually required
from the commit messages. The defconfig is not Qcom-specific so you can
not expect somebody to know what is SM8750 or why does it require a PHY.

> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 3a3706db29822036d25a7228f8936e2ad613b208..7a7187475a11206e708a5a2c6dd51736e16932e9 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1587,6 +1587,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

