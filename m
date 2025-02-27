Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0E4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiVWALSTD//m/UIip3RqCj0OCMJzxffojcYsREWRIbE=; b=AQ4R9oKb7QRwcmJVWv9WO+PPD7
	tuk2MI5zs6p4Pz6SXuB2H6VDtAHKPMW2zFGgEYZvZsPznzkfe0aAjik98OypkQQXBuOS0hZXNfzoe
	wpmzD/iRIsoF15EWVJWL1hvIq9iY+kNhVdzRlZUkLcr2He7ubQnQR2kRUk+7EG9NvqqrEPK+kZxuj
	J7FlCmh8aHITHn40DAU5QUwro9UUKeP39wBk/mgyhFyhLc3tOouNMZz4j+OL8H3huGV1G0sKQeyWV
	mbmDh9e9BSKxYjsnD0Em9WOLtt8LXXLO+QWpuFQG60whSYACyoRI97dkOpbkBPdSbQikabUSYONSp
	v3zFUT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmO-00000008dIk-1qLP;
	Thu, 27 Feb 2025 19:42:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnie3-00000008KVA-23RR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:30:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5461cb12e39so1170678e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740681002; x=1741285802; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HiVWALSTD//m/UIip3RqCj0OCMJzxffojcYsREWRIbE=;
        b=K+VkK7wwcqi5ig6TkxoWDtsziyluwYjBmiKqdQERhXY7/mEu+4CdkLON1580D9HQLQ
         GWUQmy4zg0mPtDSf56U8B+bkD+fvTCpryVQJIzw9eptFVJt1BuqZpVIc6PHROKsKKIGA
         RQcRBU6jfDpZYEB0YiSOCiNXkt5ahNyrQWIRJKpAvOSumJj/lv0qWs0rMZpbFRO1ZL/N
         pAAcWI1EByB3LHR+MbR2uXW0q/8Wv0TeoG661T7LsmvTc5SOJQbJup9xLfhtc/ZEo0LW
         IOJwGAHG00yitjZsCEbunpX6tcBNzO/xh+I/gY7mEvjxgRD4lxCpNWnKKNloH3HUWQkg
         +oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740681002; x=1741285802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiVWALSTD//m/UIip3RqCj0OCMJzxffojcYsREWRIbE=;
        b=GJyXPVKeenblNOqU9Pz45j9+vqJFAuXF9M0YhCTsXeNJuvfyxLdvs+jxaw33zeWnqk
         0VRjtoKlDyf4NVMkwWAFLHWUF4OX+5q4MKWflLIC50s8CeHDqXZBGkdZiREHywVlEXfD
         dEcHuoEO1yXUZi2b1D2HRHQF7KT1xNh71cqj41B3LUVU8lvQ7ZetrJON82POs2uxafm1
         3Fi2lDVoc5MtAratXu/s33g2UfHI/VFloTCxmq+pxtI/PEf4V5s8RFH3Q/ZmiBgKGS+k
         X+hj7mz4MmZaYT66izQfWAZpI5LnqvWPKvJBwAlsisJt2TvCm1uQ6O3jIFlURI2tUK0w
         3drw==
X-Forwarded-Encrypted: i=1; AJvYcCVDvA/S0tLy3/N52KYqOH9QNl8qEkm28633acSqFplvtkSgzkGdINO9hIHFBcHUyWKZjqxt6uyhtSvoZMVZdbV0@lists.infradead.org
X-Gm-Message-State: AOJu0YzLzGxPPqzpHDvwGfItK1hw3bPN3z0w8P/Uv6VG8Q2EaO05F9ci
	7rRLsyXfYdY5PqdAuMxPSnnasLPLX0tXFru+NqYA7rkfKFqba4xIyMZenit7m/k=
X-Gm-Gg: ASbGncu903lBj1IOdOBEbjYmfTqvk8bnVQTUhoJeHt/aLfvXnH2cvzJyjU3zjb3Cpb3
	MoMIEb2x0qT8X3iRZyBE5RhasB2BS1pYdQ8Deqr8/W5cNQnZfxBuSaJMNpLBEysjK4zbb2DjYi9
	Q7lK3mrjzYO1yVbfYXYd357/3sI5kLe2k8R2EUpv6UjycGcIsmgcOZaHOTsCqrpmj1RA3a63tAv
	KkuopLO8hhjr1jvTVm0hL8JtWJe6cJdyZU3pp/6cm+mRgtj6zvsYoH9NpjDXIjqTreiHIyhwChZ
	DA3uSgXOyHmpi46IJahQx7nkNw7mFIOljMx5fpFzV0Fwd74dkmqa/nIdUbwv5415Waabf9ntzMr
	ORFzmEw==
X-Google-Smtp-Source: AGHT+IHBikfdMSK2JkSKuT0fc4cM+qKPdJZs+aMwAQcHRUzz0Xs5ze16P/SepqSYoZv2Lgzl1OHSNg==
X-Received: by 2002:a05:6512:1103:b0:545:225d:6463 with SMTP id 2adb3069b0e04-5494c36bcc8mr200018e87.42.1740681001614;
        Thu, 27 Feb 2025 10:30:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417b66fsm224376e87.93.2025.02.27.10.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:30:01 -0800 (PST)
Date: Thu, 27 Feb 2025 20:29:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add USB support to SM8750
 platforms
Message-ID: <g47ac6bzxqyqbkuqsvuwm5vdc7x5wjfppv6fj4mftwyjlyuz7t@jzmw2kfa2jnp>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_103003_545579_6D29FC4A 
X-CRM114-Status: GOOD (  14.76  )
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

On Mon, Jan 13, 2025 at 01:52:13PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  24 ++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  24 ++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 134 ++++++++++++++++++++++++++++++++
>  3 files changed, 182 insertions(+)
> 

> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x3000>;

If I understand anything correctly, this should be 0x4000, not 0x3000.
You have missed the DP part of it.

> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			status = "disabled";
> +		};
> +

-- 
With best wishes
Dmitry

