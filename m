Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTpWMAEaMG9QvbcSNXP0KlGFWbtNf6yy+VBl+0ZfPnU=; b=xeuBoaRF0R2i1Mf5NUUHf8VIgn
	OrtWgLaagIynrcpXPOsMyElmRP8NkYvlP/CydWZUIIwuJFqqGQYeCWipj8UtyeLb5N7q01JHCFA/v
	DbvWNeRgCbTjZobaeThb7VK4o3WS1UUMJVogQHZkHikZOXp1+R2VgpkWnc5B+fknPNrmH6riBa7yu
	HIPjxNGqwkGoLg5nS5tHy67lkpW5wd84zXx0IaKH1HSWjuubmd+TK9ofDf+GN2cY+7Odducn26mv0
	GBiT3flPhsP78mi4C+Nd+Oq1C68VXQ3fsM+T/lLhrw/+5HEiohc0QEsqSdDraZPaHN35DRqzIUFKB
	ElqAVtuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnXD-000000053qM-04GR;
	Mon, 20 Jan 2025 08:53:27 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnVu-000000053jG-1Zjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 08:52:07 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e384e3481so4186207e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737363124; x=1737967924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTpWMAEaMG9QvbcSNXP0KlGFWbtNf6yy+VBl+0ZfPnU=;
        b=NjEI97kO9KPGU8iS+Rg+rlH4zd/wMXsdGK6gaHzVEMtdR3vo+rey6QRLJvfHxxNPBF
         cJc2eVm5Vp2sE5wlIlnVAg+ZWShVn5osYA1A5NmVjkz0BYoNyIdqRNg0eX+TLq3NE/9I
         YycKvOTXpGLxXuCrlEG+rkZhf72W8D5d1pc3wS8kTsT7kgvfoiuhfKYWajfgeRsHY0MY
         fiq7qgFEnxLGoMzHSvOdJEMK1Q6SfjivBELU4HcRQnFxxUIAxtvy19iqHxms86ajDXti
         cF/D4kZ/YNn1id5SQBhlRr2U/2V5U4DR7AxbnjNQ2qT4+xveBngIu4X+Gg8koKx0buQ9
         TFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363124; x=1737967924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTpWMAEaMG9QvbcSNXP0KlGFWbtNf6yy+VBl+0ZfPnU=;
        b=Ff61yBj394+MCri0l5brie7KazSmNGpSQb3N2yYfqTjOlQ7RAxHDlynhf4rnzgIckM
         yEg876FTsYCE/iwLnsCDjC1LOrcqOuxi86pksJS8RHfU7zaYD2FLTLw9fJat0JMkwOPo
         LdIT4d7e+vm/o4LlSh0AZUWt5K5UZrFg4uMCNv3F79WyOHypYne1/SZZ57qn9fPDFEWx
         w23FuteOFiVuGsUgRKzK8Qi5D1xIUoYYHywQmsTsMdK7J1TKMus6+Qr2GR3maozwVdDx
         XIolMffNbSflxaX3bA3HmzgsG5qkWBLeOFc59vvpO1V8eD8aJ1MnLJIT4u4h2lGPd1PN
         jkMw==
X-Forwarded-Encrypted: i=1; AJvYcCVg3G+7aYqjkuFg+RvtK6gibHOiRFd/rNwyoeL5ykhtZxKUsw6CoHtk0PRL6Bc7/J8dHnuBqr/l9JHaj3vBrE1W@lists.infradead.org
X-Gm-Message-State: AOJu0YxKDBqM0IPqHhtUEYQ99UGRBtrYMyqx+970GVsUquA9seK1moBm
	It6XLYehjbkyRxZTYSmYa9LlQuYtXRizlhQoOpD1y0tBMlJzGkQ0QxVxWzwi2b8=
X-Gm-Gg: ASbGnctJtURC/9ELp24HWcdvXdLFbH8fwVffw/W1HMZqEZ/wk8gacmnrZAhtjbxdiIE
	9VmBuJ9pQis/a3N6qFI94qbZbrhFRztRMPjrkNNa9mzmoT3fHWaXhdE29bWJ6g8kDAYm4hpcp7K
	i/Thwwbwbvvuo6WLCxFWFMpWuz6N8Qp24Pzr/uCW0Xu3cpX/gDqcUHNvsQYj0pbgyHE6GSFnfgy
	pF7PnoSrmbDPfKjr1J8PinRVS4D+wL+e++OJRwIZ5To1xHI37XRBzm/Rl780rumH2wevxxQVy5z
	YvvpybQ04YivdcoNrRcxq6sJSOdIpzeBx4fnNHxXCW9tJ31KSA==
X-Google-Smtp-Source: AGHT+IHyZ25gS5p5OdMxHhdDuUjFvCRRQRGi9F7ATGGW1jG6/T087u04d/e0A95xRpBXs5gJz2cjEw==
X-Received: by 2002:ac2:4c4f:0:b0:542:6d01:f55c with SMTP id 2adb3069b0e04-5439c216ba7mr4011525e87.3.1737363124175;
        Mon, 20 Jan 2025 00:52:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07cffsm1216241e87.38.2025.01.20.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 00:52:02 -0800 (PST)
Date: Mon, 20 Jan 2025 10:52:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v4 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <czxiikfvffnfljngec6gdwoapx2khtvltauzhezexkxxitclfn@7pfnj7jtyfil>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com>
 <173728731976.808036.168078560019330137.robh@kernel.org>
 <a646b3af-9957-4720-893e-9013b2dca43a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a646b3af-9957-4720-893e-9013b2dca43a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_005206_577968_D3670DAF 
X-CRM114-Status: GOOD (  12.73  )
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

On Mon, Jan 20, 2025 at 10:10:11AM +0530, Taniya Das wrote:
> 
> 
> On 1/19/2025 5:23 PM, Rob Herring (Arm) wrote:
> > y bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
> >     19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> >        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> 
> The code https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/clock/qcom,qcs615-gcc.h
> 
> The cover letter also has the series mentioned.

Please. Stop using bindings for clock controllers in DT bindings for
other devices. It provides no benefits and complicates merging.

-- 
With best wishes
Dmitry

