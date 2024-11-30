Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F42D735E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 01:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4PlVmw1LkahlUXOIX8n7OSEzoIK20J0gufnIIJtzoE=; b=SAJwJmTDfd1DBbleumqj8TkZRR
	NDTmNosVQsnSu9D0z9eygNTeM/qCz+Xg6X6aXFypSyio7J3KLi3WBqxJ9b4XwFLeZSacqFKkFBCoC
	6+w1dwjyCsICPIJQ03jO7zu/OWehQ71w883h9ea9erNhhzKF7ZBN6bgKxaPTT1wDgVtCwZpQ8dPSB
	c5+fKjUK2zfvhUTyN7fYQF0qWK1JKvXguxka+VU1r1mrO26bHBYmjBZyT16UGo6ksqb2o2zF1I8Ov
	p5cdD8oVO9MiWIXyofC1AAEVGKEKjTjffRQ5t0tBX06HF5VJaF0oXYTg8T4CcHRA7Pa7UzS2SjHmZ
	mc5aYjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCa0-00000001FHc-2cNA;
	Sat, 30 Nov 2024 01:47:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCZ0-00000001F20-3af8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:46:28 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53df6322ea7so4450756e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931185; x=1733535985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4PlVmw1LkahlUXOIX8n7OSEzoIK20J0gufnIIJtzoE=;
        b=GAvOx//XXc+R33CyxkKs4+T7iKH6y370pQM7iNNU3mnk/7gJd1RP5Riv0SuJAGH+UO
         4/hf5OMYm4Dn977TUdaffCJuYCHTubMUaRalY4FHZPidmAITlhrgZBbE5wTS+hqP1dL+
         HPCy2fAG+SjjmS10rM4RHcUoZQk9ZpkTQqh1NQLme0rsw+5KqXLg9pzqReGT8eC65VuQ
         Ry/2bAyq2lPl+hIdIPlarwos0InM7gmo03Iyuv3vqakkDRuUVRKiQG8r42pIGRoK6aXr
         KCBV8JFXYlcpoSJoXz4/BXhYMcO1sTIreyfiCPkuRL4yYVRuO1YFBEdrvj/MUMNGuid4
         EkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931185; x=1733535985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4PlVmw1LkahlUXOIX8n7OSEzoIK20J0gufnIIJtzoE=;
        b=NP4DRRNA0vyi8e87XRftlXcf8bboEX8dKxwQ2EGELtzOFhFzLc3a15rwURhlKiZGTT
         yl/geyUrna7czJwWM2YeECmi0yw9Zu2gfTZErKdBdqGgo1EbdKrG5uvRGGVUP/5iE1YS
         kipxanRBGursi9m0EUrjwrCyK58V4iPBwMljf2fCXsYY2jDCwwratAbagm/L/yZ0IV5W
         u4gP5AA3rCXWM5i3Z9dtZ3sQFzpm4CVE+Sm8dSoJ/CoOZGw1whg3qZ3HiAfHjFx8RlR3
         9/LgcGjWE+EANwIyVxr6tbMF+amyVJrRDt+tN5VbFyryWfW+STpO5OPlX4Yh738Nt3YU
         Plvw==
X-Forwarded-Encrypted: i=1; AJvYcCWn4q9HDSgB/rxBp6IJ0pr0mxaZIhncMtCpuq/slJ/WcD0egbOTW5PyhGk+AYY2Q9o1nwYV3T9ao2hIVa+431+2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tojKZJlUEto02q2EIDyCqg2LZ3XHIH/G9LscGjDhoeBeXxNW
	5BwBEoIfSpS3yDLfqiqDuz5jGWBq/6P5EtG4QGUgyrZSYgJz8r5Vn/iSKGA45wU=
X-Gm-Gg: ASbGnct5If0JMyn2kZ9t1h12Fp91ay8v0QwGz4STXLW5Vc7r7S+rP55QSsWA+KqwWLp
	FMNLMvQ4XleG9oCQ5HznEFxl+7UlVUnHvjA4IflyzsFmzqoLwBVD2Ma+UTbkMN7Gv9MUOUz8vNS
	PP4YE0Z2wAYoEV2i/HQVijYYoClyS5WgpB028Xb5aKN1btRMRlXIRP1VgZk3+YeEIeRO6lEEzoQ
	3pIHPe/CJDwrwwzQaLIbYHVJrof8l0StvIsvHe0td7cNqTqjM7s4ZsGzJr0ofURJuoARepMbiie
	wARa4SH9EZJqPw0EXDWInPJq0/13Sw==
X-Google-Smtp-Source: AGHT+IFy7zoXZyEEJLmZhuv+3OHzOtIXv6pmGJpjBzPnl2Yo4ctu2uv+6diQz+Q9t538nZ+tQkXOZQ==
X-Received: by 2002:a05:6512:3ba2:b0:53d:e602:c0ec with SMTP id 2adb3069b0e04-53df01171d5mr11709184e87.49.1732931184641;
        Fri, 29 Nov 2024 17:46:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df644341bsm628900e87.99.2024.11.29.17.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:46:23 -0800 (PST)
Date: Sat, 30 Nov 2024 03:46:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingwei Zhang <quic_tingweiz@quicinc.com>
Cc: Jingyi Wang <quic_jingyw@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add base QCS8300 RIDE board
Message-ID: <jho443tdtovkc77fmmco3liftultswemsgrqdjq5p4fvt6c5j7@hb4sgokel47j>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
 <hswfcxj6vlutl7covrbqqzueljv6nkm3q4qrgccii3zh72qrig@spfbtrvrar5f>
 <3bdca75a-39aa-4ad8-a3f0-8124a0977c06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bdca75a-39aa-4ad8-a3f0-8124a0977c06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_174626_893576_7556FB61 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, Nov 29, 2024 at 11:13:28AM +0800, Tingwei Zhang wrote:
> On 11/28/2024 9:29 PM, Dmitry Baryshkov wrote:
> > > +#include "qcs8300.dtsi"
> > > +/ {
> > > +	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
> > > +	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
> > > +	chassis-type = "embedded";
> > > +
> > > +	aliases {
> > > +		serial0 = &uart7;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = "serial0:115200n8";
> > > +	};
> > > +
> > > +	clocks {
> > > +		xo_board_clk: xo-board-clk {
> > > +			compatible = "fixed-clock";
> > > +			#clock-cells = <0>;
> > > +			clock-frequency = <38400000>;
> > > +		};
> > > +
> > > +		sleep_clk: sleep-clk {
> > > +			compatible = "fixed-clock";
> > > +			#clock-cells = <0>;
> > > +			clock-frequency = <32000>;
> > > +		};
> > Move both clocks to the qcs8300.dtsi. If you wish, you can keep
> > frequencies in the board DT file.
> > 
> Dmirty,
> 
> Move xo clock and sleep clock to board DT from SoC DT are due to review
> comments in [1] and [2].
> 
> As you and Krzysztof discussed in [3], there're pros and cons for different
> solutions. There are three possible ways.
> 
> Put these two clocks in board DT is aligned with hardware. These two clocks
> are provided by PMIC instead of SoC.
> 
> Put these two clocks in SoC DT can reduce duplication since they are not
> supposed to be changed on different board.
> 
> Put these two clocks in SoC DT and set frequency in board DT.
> 
> We need a unify way to deal with this kind of nodes and keep it consistent
> across Qualcomm SoC.
> 
> Who shall make this decision?

After an offline discussion I've send [4].

[4] https://lore.kernel.org/linux-arm-msm/20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org/

> 
> [1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
> [2]https://lore.kernel.org/all/be8b573c-db4e-4eec-a9a6-3cd83d04156d@kernel.org/
> [3]https://lore.kernel.org/all/4kopdkvbkrpcpzwteezm427ml5putqvzsnfkpmg76spsple7l5@mg7v3ihwxnit/
> 
> > > +	};
> > > +};
> > > +
> 
> 
> -- 
> Thanks,
> Tingwei

-- 
With best wishes
Dmitry

