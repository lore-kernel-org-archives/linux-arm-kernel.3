Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F2CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 22:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y758qolide2lClu/KzTF1R1Skq7/E6pKo00NOQS2OEQ=; b=OairHyFOThlD09svGtPAy+VUrw
	+WTudDPRIz6Hhx7piLwU16BPxysfAYQTl5YymmtE3Vfwbty35mx/ILKV3chSjnzTTFl81dxlPD5bY
	DIRZgBBek1oVivbTdsvCLkSwDqwo29LDwOZLWnmjKEM1ZkCAHcunR2wG3rlwrXHoOyp9w5bvsFmrR
	VRyBzE/QxRCwQbqg5hKNcaioYRuQcPA3ko1PLFicy5llQSdM7pZhrOolRUQd7fReqbA5t8JzCdnyr
	yIWeMXu8wN5grU9O7jiLi6sacDSl8+T4hKh+xY8/EgG5zuskVV2AUzExUETOWa/2bm8Nq0UPCqVkh
	6lbE+e/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgt9D-0000000DdgG-26Qa;
	Sat, 08 Feb 2025 22:17:59 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgt7o-0000000DdY5-2yl8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 22:16:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54412a7d75cso2842686e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 14:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739052991; x=1739657791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y758qolide2lClu/KzTF1R1Skq7/E6pKo00NOQS2OEQ=;
        b=ToguMYmrt2+3EavOwZ3HbsVamqKrfKpR5gAwYDZ9A5IipRYNENOIzZd4LiWjBjMgmP
         brv2Q7pzjZZTOoLa6yL4TKWAN09ZU2qUQLsQFKWfP2X4Zewx161dDKlhgjqXTfsZ9R62
         3kopPn2dO/F9VJ19k3mq+XF7HUI8xR50eSPuqnLsMb+CypMxDlxHD2sCCnkjlTAawZ2o
         vauvPBdiRp++W46jXKJooErnei1q+a9Xw+HIVaTvUybg6SmiM5agvoNXiPCocfcN0a5k
         mmaPAFDHLzLoI9pDKnGg/zB9U2Pb9+pqonVY7Jji3EoKlnbDqsqS5+yPEsRfqnKqa1Ig
         MA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739052991; x=1739657791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y758qolide2lClu/KzTF1R1Skq7/E6pKo00NOQS2OEQ=;
        b=VSYu0RBa2+rl+w3VuFHfIvP6wgfHhxEqjxucRFeSRozZvdA0z7oLBWa7P7sJeNvrLB
         jxgDgKXc65cMcq031l4v34n45ScSKlmIM0Ro8kzOPfGomcWyfEQ7KclCcbswbBZ8LKtK
         z2/kEoqgN3XZh6z87JMMIsQ5/hRJEJ6+3rwOpQOy+UAo+16gE0rf8NYNlyjcP9P/7YyQ
         Gk9JrCKUY659LlVhTo++KJd0oi9GJ76ioRaq7y996h41FHS5048swxKhKKz829EQ99CH
         61t0Tb/yMz/cOi/5D2jXw7STmVjyz8IYrhLN6M1UvIFOz6aYmOK46fxVaoB5HhVjOGAy
         V93w==
X-Forwarded-Encrypted: i=1; AJvYcCWub0Cya2uzTyiPv8IUKTp60nLyT20MqH+nbfxpSn5aeS2AIwoZeN1D5pfVBisDNph72niRjEV4od3EK/DZFBQr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8tVomv4KXZh/nvfopafgCbg81+39Et7hjHA+nEyOW+orbrEo0
	oABGGLLd8wH6EyVgrkwXwLWfa9DGqQ1kA02Kxc0N9zt0w5SOfeg7csikOJOUoHw=
X-Gm-Gg: ASbGncvepgB+0L1M13qCF3pSdGY6Ptecxcct4ICMaMDD5MvxpXBJTwCvdzAR67nXssZ
	92zJApciLBRTRQ2+5B8eKSGoDeL4GmS4vHyTwudwIz7mdMppNaU5Hi8eG2K8/O/5BlkxL6MaWc0
	rY1NPRJz+YCyu7FXh7AcCj5avXrguDObqffhywmijDBz0JCvTuRsDpWxx97bwDPys24PudymRP5
	8nago/MeEYPI8hgxNpBx4xhnO/ux0SvI9LtOODk8VcgbtU/dNLhToYvZyCQhV5Fj3kArmBSOryA
	oHklJZVOFJI+rm9VAVtOlQua+7YGV07bnPhrw1vLCna3dDgRAeXHg5Xg7xEWChNYXmfMx3c=
X-Google-Smtp-Source: AGHT+IGS/3Gpk50OVCNMUL7zf9y31rF1kOuu6KzsJaL8XToP36wzYhmmlK+erLwhB/gqSa6n86EVCg==
X-Received: by 2002:a05:6512:108d:b0:53e:362e:ed0 with SMTP id 2adb3069b0e04-54414ae6284mr2410130e87.44.1739052990560;
        Sat, 08 Feb 2025 14:16:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544106041afsm830599e87.239.2025.02.08.14.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:16:29 -0800 (PST)
Date: Sun, 9 Feb 2025 00:16:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v13 1/2] arm64: dts: qcom: sc7280: Add support for camss
Message-ID: <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_141632_756428_4E30CCEA 
X-CRM114-Status: GOOD (  11.63  )
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

On Sat, Feb 08, 2025 at 10:22:31PM +0530, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

It was impossible to get these tags in this way. I'm not sure what
happened, but please review them and drop incorrect tags.

> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 178 +++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)

-- 
With best wishes
Dmitry

