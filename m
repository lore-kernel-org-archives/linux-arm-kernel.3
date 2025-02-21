Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FD7C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjc5mojYE3t4OSrHJVJCVcArh6fCjBoE/KbptrPihx4=; b=YT+AN6kH7IShCNa9ogNDMdk8CR
	vZsdhv4K3W+v6QuZeFw0TFyexy7VZUgVld2berVvJdZFP3R+F/pfI57I+WtFAEVEUE4SdCNdBdlLn
	PshBfosQ7R6rFeZKbHOrkfhG6Fzlrc0cD/+Bmd3ju1gxJsJWeBDHp1D/JcfQmyRqplsRGVjeAOjrb
	B+cqGwGPWE7fYPrjobb9k9RMBe10o6UG2EJGqnv1+MMeGD2PV0AH2SIWJHKiRIYiTeAYGaBXx06R+
	goPjs1y4fHNvyw0ZrBDE72mntKgeNqOKlUNvKLftqRT8oYa5Megh/q4yknYUYjFP/HhT968FTVvIZ
	F2QDIs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlU5w-00000005ph3-0Pdh;
	Fri, 21 Feb 2025 14:33:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTnH-00000005mnp-1xQD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:14:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54626a71b40so2084416e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 06:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740147257; x=1740752057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjc5mojYE3t4OSrHJVJCVcArh6fCjBoE/KbptrPihx4=;
        b=TpDDz5fZrGMCSTUYh3GPvfm9AzOxdWDXsSmjs3QdIz0Zx5E30MwUHQbM0llW6xj9NB
         s+LQU3Ymuz4vkA0VWh/3vN6ggeChgqTJ8/+wa8nv3ijVXqktdCqBaRHkkJKmigAMuWnJ
         CeyBliJzqzT7qvUUyZJn5dEl95P08dx+g9asRrHlplm//qYhUM9lUhuhPqyebT2/at9b
         VASlZ2sm6bXNEa1pVjpOUJQaWw73nvj5R5eoew0oEfQRCToBxm/I2nNkqngzZ6EU86ol
         H7BMbtT6l7BBIsSfYDTrzMXxz+guB5p5Jd3duoGMVorWhtrtXqQzj2VJV5okMuBLNd/a
         KIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740147257; x=1740752057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjc5mojYE3t4OSrHJVJCVcArh6fCjBoE/KbptrPihx4=;
        b=KLP+mo8X9JLwmaVmpANWbWK5FVi7yVYwNcXB2FGPs08X7fGUIwk6EFUJxQxTahQslt
         DJYYwhNSEd8TsIUdqgz1AqGtzI+i7NhDU8nEcSM3cDUf7N0R+tgh2om0YoNlh5nw599o
         Fjiz9OvPZ/WP+y5RnVepqenJafmjC/qZGs6QCU0ai5r+DvI2u07+RMcwlN7/Cl/w0NCK
         sGLno2CNo+nXYp0iGQFfNk3ybJIVa5uJhaZmK/IlbcGC54Wa9IJJS2aJtp4jEa60Op19
         kcJO+RFG62O2Z8bophscQ7LOsXBt+yYN5j7jUQPF/ZBw2JP+SWlEWr/NVILRMoK5e6yF
         VnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSVFXJCeRpORtOI3Faqf+YAmpR/S51AzK23vBbRD1cY/z6t+Gpw67j+gc7qXXsn8GNtn5uGNhAlzIOvape6ykb@lists.infradead.org
X-Gm-Message-State: AOJu0YzAFRxW3zjSEjIIIX2mwW73Tn0+pQGPHalA6iClToB4WIrJa32j
	p6GRcYKWrARhBDKAnFwTu9giHbmUYBcN1387Ln7WCRoPBQa0gAqX6UBNtOO1+tg=
X-Gm-Gg: ASbGncszCUuFUq2BfzV/7aX17pskKpKIra9r15uDoYTk2rrUSvRb0FUjmjZighDLPdS
	uV4miValX7e1c+wCYZRbF2f1svKcdkogt26hjopVD2FRodNCq5dk5Q2dBu59AkPQxro88WOyiyu
	tAk921fQdUp1RluRS9i00AXG8tY3viMumiGpswTKUNAsdBgZ4mDPuGjBBvhaQASCxMGjxdzQbqB
	RS2hXrmFRTx1xu85G7t3jQKqnlEYx3unh5czK1ovyejeClopn+g9PnlFzaGnvIRwVNMXVkP1u6I
	VUmR/35Bc4ggm88LkFHmAJxBodVMcI5BcVjjWwpV0TMKplkMuYjeFgkV/Ba52g+d0lks9IgQQi9
	IX1agHA==
X-Google-Smtp-Source: AGHT+IGE3i7E5NeJLGZxn4+JQpuFC+AkpZ8fzRpeljlxc9T2QsR4EDahxkpiTqdExMPqOpBH1TyfSQ==
X-Received: by 2002:a05:6512:3a89:b0:545:2a96:34fc with SMTP id 2adb3069b0e04-5483914820dmr1344462e87.31.1740147257524;
        Fri, 21 Feb 2025 06:14:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545280ec98dsm2394749e87.42.2025.02.21.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:14:16 -0800 (PST)
Date: Fri, 21 Feb 2025 16:14:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <5f5nt4g3fy7446gxnjg53n4uir57hm62ewgusekls5sbmadwez@pfxmhrkck3zi>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-4-b6d9ddf2f28d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-qcs615-v5-mm-cc-v5-4-b6d9ddf2f28d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061419_507076_97AA79E0 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, Feb 21, 2025 at 02:50:15PM +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I don't remember responding with it, nor does lore find such an email.
I'm totally confused, what is going on?

> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>  2 files changed, 125 insertions(+)

-- 
With best wishes
Dmitry

