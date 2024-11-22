Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDBAE65D3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=; b=W4af9W2q/VZ2ygrMib1U7OyvfE
	VZd/5oYhJjyGQ93mLeFABDSWPwUGLy+Sq+WBDSgPO4lRrQIzPxu6WDMRw7CQ9CZGMhE6dreSrKDec
	+ILZ7e1mfC2a36mRMoBQj9AugQqk9cvytv6BjkS0fdv3ekbY3LpJojoIlAgTX/bR2KD6iKP8rT/FN
	T7RIlo5EeM6xlFDTrX6MkiMtJyHvo3MaIj41tpaPDy7RhJT2xMbhm99cielp/qWu+OQ/tspDzCLJY
	dEprr8icoZCPwXJCbSDfNXPgboXpyfa7vgZEhLF2abHLGt/23QswfrkeSAht6NPeO0YddN9R5q1YS
	aKA4joIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQq1-00000002FIQ-3lGM;
	Fri, 22 Nov 2024 10:24:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQoK-00000002F1v-2J0X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:22:50 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so2189794e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270967; x=1732875767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=;
        b=Horw5o6T6oDKwBOoB8NzfM1+g+P610LZ62suqVuX20AqDk+n5e74fN1iJVoCgu7ack
         6MmWicoq9697MY5s0Eyv3pUHnLCB40MdqMfRIz5dc5lrSfahaFFM3xjZn3ae1rcOKHNE
         b3+My3sQN1Xw3PTxZZOiGmWfhb6YWIRrvVcw6UTDggVXAS6AdHKqlijtHMwVotKDy+XQ
         CzjXS7a2sYJETXtRngaDedK/oqBSFft0kLs/F6RF3JPNKqNFN23AlMdY1PA616tFFkjO
         DyUX9fTssbMxyLNdW3XRjDVXtfJhstSlHxk5sxkk7R4nCi43wnjz7Wm2VMTqL/4MoLZR
         p+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270967; x=1732875767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=;
        b=iyZkYhYUNYZgIzX3PHSk7a8xveMYThypdVUPKZ6RtmZvH5UG1ygS8aCWImQMBAClT8
         lqGsy2DWnLqp2kwPeFJXKMbMr9tYCJKaTvIx/GULnQ+TOhhkMoI6ciIxN3bYDgBtr3p1
         3h8IZUWEC3KxyclXAibVmyNRdWRd0m5E4aC7jgILQo5FbW2jCCd/kOaFPPBo68GLP8FG
         4+klwlvCX/TwI8pYbenbrwQq2fYmj8oyCPdUBWbnNUEohaImY4lzza4Fn9xpq8cvr9mG
         ZivVeQ6ZoVCeXdDzgUGDh0OtPhGbqJe4dkj2qLyvYncS5a50OuZ+DieS6ceGwcLfFUat
         wLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2c9cev8cMjiDu68D/xTP506D56mc9DOIaUnXBwoKVfliiP28xKGgfH8dW3/04bbW8dsmbwM9JI6DjNaIwhwvt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu+9WImtYqaevoBiaN0nHJKB1FMGZakualNJ0LtR+PDIiruGMp
	CzcNbMwPudrZIheD7bSUvESwovN4KEFzZgwvbaMXxeo1hjwe5Ss2qwFKppvfvGw=
X-Gm-Gg: ASbGncvhPim5h/qCN1i8tUQhZfJ5k5IjQFWASyvJ901DY+GRoY6fiyH+i0YFhIsys1z
	Wr/Ivyc0YCFe7QrfXY/elpr4i+mPnTjY0zkNE5s/ImzNK8cXm5o+/ygzobEKqA0CR1ZBW0h1zy3
	Ih/NfOValu8Oi62zjytbOZprUE2Z6wJzJNbzxgtWR6sa2IhUTLbwK+g2tZZXIlPcJQhNiYTjoSy
	usoqtLOoSnWEOD9WUTzKpKxc+B7W6p4tnvjC4hXFxUxgy24El3SWM/M/n0jgTnBtX3U79Cjuk+N
	MWxWa4/X/UTTzEzy1xxXrLJxQ7XuWw==
X-Google-Smtp-Source: AGHT+IFS7C183Wt8hN7C/INKvkL1qt9YbaPn5aBu73dBkn87fnUOLWLXeKl+x6xSQFdRyLKoKS4qmA==
X-Received: by 2002:ac2:51b5:0:b0:53d:d3ff:77f6 with SMTP id 2adb3069b0e04-53dd3ff77fdmr829792e87.46.1732270966827;
        Fri, 22 Nov 2024 02:22:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd88b54cbsm62838e87.214.2024.11.22.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:22:45 -0800 (PST)
Date: Fri, 22 Nov 2024 12:22:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_022248_603699_49E0D962 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -202,6 +202,82 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	ioexp: gpio@3e {
> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <58 0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		semtech,probe-reset;
> +	};
> +
> +	i2c-mux@77 {
> +		compatible = "nxp,pca9542";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			anx7625@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupt-parent = <&ioexp>;
> +				interrupts = <0 0>;
> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +				wakeup-source;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						anx_7625_in: endpoint {
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						anx_7625_out: endpoint {
> +						};

Where is it connected? Is it DP port? USB-C? eDP?

> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&anx_7625_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

