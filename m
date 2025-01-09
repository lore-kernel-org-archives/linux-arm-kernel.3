Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBBE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifd3ai3biKTaNdzvBUxlg/E6YILRTZjA+4tT653tYFI=; b=b8a5xzpxW8Zg0CBGQ8Gv5IT9VF
	bM7yv/yExlwl84xOeN42kLXrGvI5l9ZvmEOPXXjhIH8Gd2fZHCbQz2tpLeuiEa4sv9VeuXZ7a8/xk
	ofMqjbMjeFWTwUZXLDfWW08W6Z3+P/qnHk/BA8954AoYPVo2tqjp1rfXE6K+qquv+Uc7FtjQNDOht
	ZVPBCt0oD8rLLQYffUeOEwOZvlRerBxnAQLsxLVzxozazopdljDAcLJMOxQmoCgn0JR6zVJ8Be20C
	snZbyZ4bOtQuFXGwukh+0iWyP5YTItB7gHx5W+E4Vp7cwQA8gls5gVF2Pu9+pUGh7pqlX/RfplEYn
	vgKycDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW2F2-0000000DaWM-20lr;
	Thu, 09 Jan 2025 23:47:08 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW2Dp-0000000DaPf-0J3M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 23:45:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1417558e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 15:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736466351; x=1737071151; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifd3ai3biKTaNdzvBUxlg/E6YILRTZjA+4tT653tYFI=;
        b=nJV2cFn+2NKrU8a6Km0TvRzu4gv4c4RVTVstOeuNkl9Sy3RjQ5gkmlegekqcg9DwqL
         7WNJFl1UeZb8CINa//dcLNF864RjkM8vaJ1/bZD+P/UQm9kM48y+pvuda8ncb1ZyaYX4
         R8WLzyWebrYKdcEjY2VNlogCfFN366HE82iYgBsmqTzDOQvXBIURcj43HROUf9h5dwvk
         p3i2N5gJO9jPA7begFhjNbl2Z5XwsokCDeJW9eLBz0d3VA+u2TAAkzcKmOHccv+e0Rel
         rLooZp54zQsNNr8XEdresMNNTF8HKJJybFFJIYhsi4ycGaFnQ3Euu8oFXtsAEheX5OCm
         rGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736466351; x=1737071151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifd3ai3biKTaNdzvBUxlg/E6YILRTZjA+4tT653tYFI=;
        b=UzwWGiFZxkyCW42q97PS31FtdDAS8cUWC6z3Tb8spgOSm/qF48AraUc+QKko6Kkrgv
         6ayo/F3FCGQxRwakRb8+oxcYLysmBB9uqNWAfS99UM+Cf1l5rgrTwWomC1alM6jNpoio
         IukYGknrum3SoNy3yzblx5GB00HoZKalkUjg7ijCD0txhHi8PVTYePCtQ8kn5Sq59Fma
         R2o0tL1b+jSZs3K2SFAhkVh5jfgFjMraCmtFjtdK7kpYa4kL2TLj8chdijLY22kCodJJ
         +beyeJLyS8jytMPX56t2hWLYXq+Ds5irDq7B2gTuxO0m+bDgnp7wNDvFt3gHkEFbXdBq
         1VpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU84hJWYn0ewPjRzem985UYpw1YQ1ET0q7x6VndkBhuTe4gT8aS+9aVXee9SLzEW7FyOZ3/nnCtz1brjtwKUaMc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw710mFRSw3VsrtSEJy3QKO6sbOJ4e/9MfRfK5tKH1wcqyrRpSZ
	7Jvysbp33/2yAAqQ74COVkgedMIXXV2e7/O841D38DYJWajQ8IRMxIvDmjGTKkM=
X-Gm-Gg: ASbGncvLmOgeGFPrU6JO0jCmjZdaf+X4fBreD4qIHavYTLz41Q80fr26Gk1DYdjf5vW
	o+Jsd09RvHjX1yh6Mbp6avUsgPzEu/kYlSdH8WaYzCIrjelmVnMyxs3d9XapgCI9/HyZbZZc5xA
	+FtDxz4rhg+3ZHUsYSIpIaAe8PaKRlvDkDkGOj9f0TQRmf+NP/GEQlDC2sT7wsOye/kOeLK0e2g
	PbIyw4B6skAd0I05eJPd52WIrzUrM1CukmCHRSxH3/ZNVTmrdPRoCeEcF748lTntegDERQnUwmK
	OdU4phu1p+m3AT+0QeDntea1X13L1jADj9qW
X-Google-Smtp-Source: AGHT+IFE0TD0xLOUiVIfjJiuGh9UVHHNy8CtrSGHCWyGYMHymyrvfqIdJCqZCoyf+hgFwIwzU5DqeQ==
X-Received: by 2002:a05:6512:2205:b0:540:2542:cba6 with SMTP id 2adb3069b0e04-54284527758mr2364630e87.21.1736466350748;
        Thu, 09 Jan 2025 15:45:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becaac3sm333191e87.229.2025.01.09.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:45:49 -0800 (PST)
Date: Fri, 10 Jan 2025 01:45:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephen Boyd <swboyd@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific
 compatible to soc node
Message-ID: <x6smfgtq2ojzl774jd6d6fsilxj5dte4jbfypbvxvdmaqd7pem@nnpcnyzz4l4i>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-7-swboyd@chromium.org>
 <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
 <0ab00013-0265-4336-bc30-f49492e96424@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab00013-0265-4336-bc30-f49492e96424@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_154553_114567_CB9F0212 
X-CRM114-Status: GOOD (  26.22  )
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

On Thu, Jan 09, 2025 at 03:10:33PM +0100, Konrad Dybcio wrote:
> On 8.01.2025 2:02 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 07, 2025 at 05:28:43PM -0800, Stephen Boyd wrote:
> >> Allow an SoC driver to probe for these devices. Add the SoC specific
> >> compatible to the soc node. Leave the original simple-bus compatible in
> >> place so that everything keeps working.
> >>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Bjorn Andersson <andersson@kernel.org>
> >> Cc: Konrad Dybcio <konradybcio@kernel.org>
> >> Cc: <linux-arm-msm@vger.kernel.org>
> >> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> index 76fe314d2ad5..257890a193e6 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> @@ -782,7 +782,7 @@ soc: soc@0 {
> >>  		#size-cells = <2>;
> >>  		ranges = <0 0 0 0 0x10 0>;
> >>  		dma-ranges = <0 0 0 0 0x10 0>;
> >> -		compatible = "simple-bus";
> >> +		compatible = "qcom,soc-sc7180", "simple-bus";
> > 
> > If the new driver requires this compatible, it will break compatibility
> > with older DT files (and it should be avoided).
> 
> IIUC the intent here is to provide backwards compatibility through checking
> for sth like IS_SOCPM_MANAGED(), sorta like HAS_ACPI_COMPANION(). In that
> case, power sequencing would be done by the socpm driver, whereas if it
> doesn't hold, the resources would be toggled by the device driver

I think that this way we end up having PM code both in the device driver
and in the socpm. Ideally in my opinion we should be able to migrate all
pm code to socpm, keeping compat with old DT files. In the end, if this
is the only change to the SoC.dtsi, then we should be able to live
without this compat change.

-- 
With best wishes
Dmitry

