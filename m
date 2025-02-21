Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D664DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hY7q6HQ4FQaZazAg7YSbphco7l3aJQzJCtoIpLMsi3M=; b=V4m2j58HfCFM4zicpmL+IuPeZu
	ZxtLWXX7TR1KyVDZBFCY6BbiWnMPTxT4+R128rvoBPOqBquc2hw1iSlcYV44XrysXSF/GSNyynXYr
	HrM8Qp5SiC/VTIu0+b47Ry9RNK6OmO+wMZ97I1Wqo4MiYNrBG7Kt5vf+PXDFfjtIzgN8KB+l/A0R3
	v/Bt4uDqWwZN2LRMahZoqeRqgCJp9yPkpZeg6H3WR+x2CQrnsq4nzlGZXeBLZhPE2aAe7NPMD/56Q
	rOeaASJTIQbPZQA4j0fvet47o2xOECtaHkWBuDzmhMlzpqb/LUnHEqJpWc741DeTXHZGTZR5e/QZ7
	5kPSaDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV9d-000000060xy-3xur;
	Fri, 21 Feb 2025 15:41:29 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTkK-00000005laD-0ZII
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:11:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so17961681fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 06:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740147074; x=1740751874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hY7q6HQ4FQaZazAg7YSbphco7l3aJQzJCtoIpLMsi3M=;
        b=Zj0hhlY6ZlJZRqVQ5ILMg9+EBB6om4srvua7S2FHECKzrXc4zjxU0u2jeZB/Xmegca
         KW+6rcrLOCelPRQPjrqhzSDqWPP+Ra8TeMkGvfshcMcMGG7dPxcqU8X7AIYLJZQHNE8B
         tHlDT9UoaKA4pGEluXAcGrKNTaV+1nLJo68pQ/wYM4iAMHh9u70UbJ8J2a9VJ11+Indc
         6CA6ivJ6us3L2oM6VCONdls3R0Cq+CRKNPRXOqXHfIo9+9swzZ/MAKxSM0bQ3fLnyZpg
         OaFw8bD0EbtCFsKc6OK/+R89dfXJNhphzlcrulQIfFYvEkG+3svVHxJ26bzbf9LTfJOS
         Gm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740147074; x=1740751874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY7q6HQ4FQaZazAg7YSbphco7l3aJQzJCtoIpLMsi3M=;
        b=rJFnw3pE4YqjvXEHXvjGiDObnIDugjSCtApHK3LYgA+e/yK2VC2CSsJd8D05+fpRw1
         6whP3muqlTQcMB/eSLdoL7mxcO84RMe0Bl4A6H1FwQ5WBYFgeIvqFGRQqmf94bXNgIEh
         C/wzQ2m8Mhwmachuj/1Fm+AhrqpsfaXvQEWYTAplcu4HNbyzlgkXyHaGIjBQIxBG3HbJ
         zGGHAHHtwKChkx/VDbJZR8PIWi98E+2RuSqNuK9NkQtlrm4DFQx2rfyCWDY+f9MeTDz8
         xOy26fXakUeKKRbfHET8l+KRrJNPmzwqT4kssmzi3y8SmgWfCC5N5LkVeZnMt2FEHZk/
         jHTg==
X-Forwarded-Encrypted: i=1; AJvYcCWmXVdgoK3OI0hkQeTfugytN0njA2FCUmJael188yoNL4ZNsB4EQtP/w7mTf0saU0PQsb/24odGqnw4oBkGCBNB@lists.infradead.org
X-Gm-Message-State: AOJu0YxbUOEdSus6UzGlltop5KKm2g7CThkI7Yf/3iWrO4upog3KfuTM
	L9HbehVqnJqV2SMch6VrB3xLQBHex03g9+6GzDGbX5Cm+QP7MLEJ0dNiLaPLm5k=
X-Gm-Gg: ASbGncvdWWU48uPIhTZhC3GEgLRk7SSqatdOjLjiOmP7q7DXJej9c7y9XHLQpIiQoZZ
	QkyuXZ/9ygIfhBGdUeQD6dm3rVs8AvKnEaOZn0sYHC7Zs4rNh4zhWQmV7O4mHA2UeOmiabtYBdx
	/6f1eyfTwnYnrLkCyrta4iL/RObc+splMzyM4JGD6hzyVQtEQw8fn3ZHZ3XFJSaCFXn9iidnitq
	SLZt8WhQNdWh/hVm5TtYEBJbIFGCgEtjrkykPug5xQWbksORBXfJLJ6rYUdBqcTNGldudhZjzPj
	pOsfC5UXcSHk7hYtmH0e90ZIxRwzhuUq3tOjocgJXggOCeoafRg1xRh1US6ZuNZXNN3utcgVWPK
	kcjJoKw==
X-Google-Smtp-Source: AGHT+IF4YOFfa5Kt8R2qRuDLGtHoO3z4a0J1rMxXFbaWLFLtIOV4Chzyik4Qt1FBw4hvpqQhKIqgvA==
X-Received: by 2002:a2e:8202:0:b0:30a:44ca:7e72 with SMTP id 38308e7fff4ca-30a5b20dc6dmr10079311fa.24.1740147074062;
        Fri, 21 Feb 2025 06:11:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a3a6d3dcesm13384331fa.67.2025.02.21.06.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:11:13 -0800 (PST)
Date: Fri, 21 Feb 2025 16:11:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061116_178463_E599DD41 
X-CRM114-Status: GOOD (  11.87  )
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

On Fri, Feb 21, 2025 at 02:50:13PM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just noticed. I've never replied with this tag. I've provided a comment
to the v3 of the series, then in v4 this somehow appeared. Could you
please comment, what has happened?

> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  54 ++++++++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>  2 files changed, 164 insertions(+)

-- 
With best wishes
Dmitry

