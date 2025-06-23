Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F29C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=; b=1XxSp+RiYLYvOJbQ7juZ0uEtEw
	BPtFe59ag4/0ngS/nwua0q01lGwJiosDQkrhoyyH+AdWundD9oNqsgnAYk6iinnHY8WwH4DZMMqhf
	fd/0lzUMHjP2N4TLv9DzG8EaxyWkmV7d3BauthOI0hedgwVZdVaVDUFJj/RcVq8qZmmPpTU+9mpjD
	YPs1MgBJAmvzHnN4PF+ZgI6hnp4dnzjB2L5nnEaEff+qj51cp/P6E/Jz/yeNBXV4w5Fm3TodMxsiN
	2KX92VWN6b8oNomu+cyuztrYC8bmoDD8QccmdichP6kDiZrSuNett0XpnXSpMMBQlQf7tGGdaMrV4
	ofcIW8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbJj-00000001pyo-0gYP;
	Mon, 23 Jun 2025 07:10:11 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbAb-00000001pI3-2WTS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:00:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74924255af4so1323554b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750662045; x=1751266845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=;
        b=RbSdIIKAc6+cP1U3WTSHEoqzsZfCMbLQQpjQsPydntnA8Uzq3y0j0RBxkcB/jPc8t4
         nGBvjjZD+S/0dxRRJCYnKW4VZd2teb6u1ArOA9UpJL2ot0CtC7zc56A7FBY4geeinKvV
         pQKZofUxc3+FiNcI2+cxsGOslxxuDpShtN+4G5qcQw8nkTQ0HCtoy77+pbbm9DyvMzo1
         QfESYIEhEl7zL7BkP12rjqcKKEyYl+K2ZaUoEIQ8wLQZlESOtkcvW/oh0+gFQL5Po9Hp
         W49XrUuOB7gRpHxiqg9tjfypsrBZNozKlQxERcp1vL6xlQ2OJMVm4ChhWpQeJrmPm104
         rQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662045; x=1751266845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=;
        b=BvFstYtuHJUTqeVW/mDqJJPEnkFMP+2YvFeNlt1lB8bC3PDuQRF0ey8BEd4XsxIBMt
         +zoJMUTUnVbRY30W52VjVZyv/z7jZmuEkLt5RmkzsYS8oNUiUUfi+RDdVb6vCZMBB62T
         pS0E+22E/ik0IyT/c6cdm6TXoc5yIpzPhBA13TDMetZUp+y7hriKl+7xpqhroOgFdJly
         ynh/A0Z1R2fY4Xx1PiCAXlwf/6Eg/ur3Hr6nV/KYjJOVavjFi3AapZjJs2qu3RBJZ0nA
         sNeir3kcEBWPeuIVwbho9eWYm2SSnZaitAsqTPCf0uyEkAyefE+ddI49kyNNlu5EGVTe
         uh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTjsHh976qB9OCPOqPXqGqv2UX4J/NIgluTt7B4dYB4SFU/ZJ1Fs3oo0VOpH3TunLEVhZoKsUId83qJEkKnzk9@lists.infradead.org
X-Gm-Message-State: AOJu0YwmO54eILLqpNMYCnmGzfn4n6nin72w6nFWqxKPZHYcMqPFw69L
	9HvspeYJtCmEPzIpKAKGU6FI4PnjYQ3KOkGVWz1w/6m/N0XhgrZCXwNxmrvBusSbo9M=
X-Gm-Gg: ASbGncv3ILILR81i0kosk7/8Su/KT9b8kUbN/RzgadyoMGX7mdcMGnYZfcY+wFiBRcC
	OG1UrAnrUgnmc67zXrCFgmShO1awiK4ADjrHbN5FZ60c2cuLSWUlUpUU7KDT2pGZ6X88SmaIwBP
	upgyLWHkNmD/3ZOPXu2JNoOLUY+B90HtvrtBUHt8AsNURVOjRU8ErBOsvBoNX8gq8vearM5rp9x
	tFsNtcfXy82ypSkzt+MaZT2P0l3f5IK/jKLhaIV+f7WeIbGBv0XjMFEcTxELtvYqJB4L1+J1Vb8
	upalt7KE3Ym3rptrGelJ8qGJcXngUTB0+gDD8pUlGQYTPxQUOqryjAgaK4eSBUE=
X-Google-Smtp-Source: AGHT+IEXarhTj8XelbP6w978NQxFdzm3KYgRpu9wOKj/2FZyhLsamJaeZ3ORI0nsqTL5pXTi/4utUw==
X-Received: by 2002:a05:6a00:4fc2:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7490d52ca7cmr17381283b3a.6.1750662044834;
        Mon, 23 Jun 2025 00:00:44 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm7310911b3a.163.2025.06.23.00.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:00:44 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:30:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v3 1/4] dt-bindings: opp: adreno: Update regex of OPP
 entry
Message-ID: <20250623070042.d7ibrjc24gbtfyci@vireshk-i7>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_000045_664780_41FB0D9F 
X-CRM114-Status: GOOD (  18.04  )
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

On 20-06-25, 12:24, Akhil P Oommen wrote:
> In some cases, an OPP may have multiple varients to describe the
> differences in the resources between SKUs. As an example, we may
> want to vote different peak bandwidths in different SKUs for the
> same frequency and the OPP node names can have an additional
> integer suffix to denote this difference like below:
> 
>  opp-666000000-0 {
>          opp-hz = /bits/ 64 <666000000>;
>          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>          opp-peak-kBps = <8171875>;
>          qcom,opp-acd-level = <0xa82d5ffd>;
>          opp-supported-hw = <0xf>;
>  };
> 
>  /* Only applicable for SKUs which has 666Mhz as Fmax */
>  opp-666000000-1 {
>          opp-hz = /bits/ 64 <666000000>;
>          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>          opp-peak-kBps = <16500000>;
>          qcom,opp-acd-level = <0xa82d5ffd>;
>          opp-supported-hw = <0x10>;
>  };
> 
> Update the regex to allow this usecase.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -23,7 +23,7 @@ properties:
>        const: operating-points-v2-adreno
>  
>  patternProperties:
> -  '^opp-[0-9]+$':
> +  '^opp(-[0-9]+){1,2}$':
>      type: object
>      additionalProperties: false

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

