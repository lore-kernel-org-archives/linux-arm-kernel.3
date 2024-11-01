Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC0E674AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRkvXPZ8JHdMt1ObYm2diwWTjx5gL9WrGNqbEgY4R18=; b=n32b8ea8R0SkDhwUtKGDEnA4+2
	GjaBGBnrGA2FLtXdVFM7jwVF23URIVnX8UJoeua6FEHoj+hNZ6Igh2ZkIYxD+ylE0ae/08a68VxFF
	jCWXIVYFjOJkoEpCAtwO5VxIbii3LCq09lq81/Ql3G+/3YDPBfPaR/kaar88GVHz3GTOCORqGJRep
	wOhbyDX4RfEEHIaeFWT1dmcuDbZwBTjs+l9dOKVGxRrcQEedq4m0sNdYk6UB9Hx5If9gShPpq9E5W
	pjv5A9shJhtE5F22MErRaQimx5jYj28psjqZZqE0ANtLs2O+GiOe2kCvQ7k+4SuMAogZ9UbekpGoy
	RUPO5I2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mUU-00000006BCo-0zZi;
	Fri, 01 Nov 2024 07:54:42 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mRN-00000006AhX-47S6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:51:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539e690479cso1881945e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730447488; x=1731052288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRkvXPZ8JHdMt1ObYm2diwWTjx5gL9WrGNqbEgY4R18=;
        b=ZOSVbQWdoe1pBwyoaYS5ewsEJwz7nu1CKEeC2XKHS1Vld4+LzuG6/aBHGkPprKlcjp
         ZcsOO7f51KLfLPcmM3mmw2EuKxPa20DhLWHohxpOxpd6wYDFuWoendA9Hvovw/jzafqw
         6hB6alWfdnpOsKDRGcWmjEVbJbT+k0jqDxWYRXOyx61SH1AP3vqGkuLbi1Kdd94K4EZB
         5k99rKH/iKEh2Wa6HAy7snZ5FN3xz1Ebk4L8j4BDpnfD7q7t3VL1LEJ3aAHViChA36Sj
         DM8No2q6ZC3JRtKtUu8U3jM1XC+TTQXwYDzN46Qnooc6uCoxpLQsCL4pe9qMkfXKL/Dt
         RDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447488; x=1731052288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRkvXPZ8JHdMt1ObYm2diwWTjx5gL9WrGNqbEgY4R18=;
        b=hKQ1MfQnpbuM3UsCtXEOwcQjzFwXBKjeSHE819lENgHdzh1/oCMO+Y44Qe6oBQrN2p
         Te8PSQi8Jq/YNtmUjFJchXjkgbzZh0QZgWTMPjueWbqC0GQ/fqY2KnQmiZKLWbNz8sCD
         M/O8OJ/x7O5ZT8bZD/eMmn8uzfpZdZCDW8MkBxfHxMKj45q2LFc+bcnTohKA8ADiY6qN
         dTmqpQWBVsIe7xDoXNynZdWIHP5UsS+OZVKpUTJnmOwpI4VN9FyQDmpQI7xfRB1Pq9j7
         qr/y2sk4hy+f+6giWgIyQBSZEPnMOF2CuRth+tnfgR7z8cUk71JRz8ZJlplIeEdx+ieK
         52yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy9JXeSii0gz6+cAoF7JB6fn81AVMHeu27cLo+dX1NeDLnJdLtX3Bbk1U/Dv11Xt+eYiR1TFabRjv0MdENgCBM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1RVM7McBMX3ISM6bnWMOfymmzJQTGgqJ6W8gwmAZUy3NW2pGX
	9swFKQAJUB8daUgZ2sTGond3bKc/H0n9TXh3nWwzosN+O3fd52BKLoZeLIGiJik=
X-Google-Smtp-Source: AGHT+IGPOzW7P8Qpqr82hfO5aoQ+d4UH/SQ+8QfM1v/KG/8zonaRCFmqO4N3jsxZsE+G3OdLThdt6Q==
X-Received: by 2002:a05:6512:e9b:b0:539:88f7:d3c4 with SMTP id 2adb3069b0e04-53d65df26f6mr1346486e87.29.1730447487891;
        Fri, 01 Nov 2024 00:51:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde0c76sm468437e87.265.2024.11.01.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:51:26 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:51:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
Message-ID: <gc4w2n7zhycgxrv6w2waew7y5lmvxgownqw3vrwnxp7gzgxgez@bmr2s63qcpha>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7>
 <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
 <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
 <2ea32f2b-a765-420d-9cc7-f0d04d27ed6e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea32f2b-a765-420d-9cc7-f0d04d27ed6e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_005130_053472_00779DB4 
X-CRM114-Status: GOOD (  15.81  )
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

On Fri, Nov 01, 2024 at 12:45:07PM +0530, Taniya Das wrote:
> 
> 
> On 10/31/2024 8:44 PM, Dmitry Baryshkov wrote:
> > On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
> > > > > +static struct gdsc gx_gdsc = {
> > > > > +    .gdscr = 0x100c,
> > > > > +    .en_rest_wait_val = 0x2,
> > > > > +    .en_few_wait_val = 0x2,
> > > > > +    .clk_dis_wait_val = 0x2,
> > > > > +    .pd = {
> > > > > +            .name = "gx_gdsc",
> > > > .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
> > > > this platform?
> > > > 
> > > 
> > > On QCS615 the GPU clocks are directly controlled by high level OS.
> > 
> > Is it one of the gmu-wrapper platforms?
> > 
> 
> Not, sure of the gmu-wrapper, but this platform does not have GMU.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

