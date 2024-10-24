Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08F7D0E3F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI3SXZp7iH9LDmA0MnQOo/8B2Evm9XupATLCcVNXC40=; b=eVqek1hECoQQs/gkgofPzFiVm8
	I9kMNjXjfg/dVvkXDkY9+M+XNXq/exGlK9vpNPJ4tYSjyq/QVaUQJH35Q3Di9nN6OCSvrVINlW3la
	qPI9la+t1dQzL5nnEGfkL7uWNhjhoOK0ph2HA7YSDF2yuGOlc9Evsuc8WIobsn/M8k9dF22wbvd8j
	1H8mmT9J9vy3xQifEHN8hK30Q7bZQrRBvphwEGOSiQ9cVqytALkUGptkhM/R2oPeTYJGId54kH2lw
	3AaZt5EhWdLVM3Yd88uaSL70GlnxIa3z8WaRSqy/1K/O7WPQhnT6wLbqQJoNqQ3yBrceTjV1k9WkU
	xywxioag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t444T-00000001ggz-0LvZ;
	Thu, 24 Oct 2024 20:04:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43nK-00000001ddL-0OFV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 19:46:55 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e13375d3so1579173e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799212; x=1730404012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PI3SXZp7iH9LDmA0MnQOo/8B2Evm9XupATLCcVNXC40=;
        b=Zgpr6G3MdQNBESR9FEhd1tW4paY5F+IYEOkWiunSiayMxSZYhNGwmslSnv21h6/Ssv
         yPa1ADfhWWj/qxu36jGcLTr1qbg55fn1qSuBMNFxsf0I+EeKA5FoAXAESBEQyUEWjRHb
         i6wjmnEBYDbAze/k+dkPEUHwkeqVKMPLTMPrL7UnPj9QFVfeK5OWFtyOL8aaUp0D4ThD
         wtPOPpObIDg7SZdoO9GpFrRIu7HgyFp91ssa8yiPKS4oYOt0QAs5lZl46RniE727KygU
         kAa1SXKZagn8IQNWn16wxQLQjfy2ORFc3wltFIhMbbRJ5uoYAa4KlUeNJjgyNPBnyZvA
         W5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799212; x=1730404012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PI3SXZp7iH9LDmA0MnQOo/8B2Evm9XupATLCcVNXC40=;
        b=MizoFFJzm5mJrumL4oByCjRu5c9xQ/mlGX+w65OOPtpsxKKD4vvEDil6ENqe+ejZO3
         LJE1fQsdoZqCXr660CPppSn9bXT75Vr6UtZ+8pn94lO5fXYRKA/xnQ+/gIrmUrwDczdK
         uxhBL2LMl6uoKBaA/Kw3C9doN2hT9aX8O7QyMNPBkiBwRqmgUAJRthMxzFFfTN1m4Qs2
         lWU7agtNt6qXGjByhgKPHYpTCbaZl4t1fmMF9jrTthgEKtb2prW/+4H264oc44p9LL9U
         8AcT7229h/YLMm8TDqv/pVLYRwne++VNc6j8Gw6VDQVh2mL6F/kGP/g7umvCHd02y9Nv
         FGjw==
X-Forwarded-Encrypted: i=1; AJvYcCVPaZA5v/doXsdSa0YWAwz8uzUwPiuSYBlkh9X5y4fO4Js97kFHH9SeAtTEilkhv24uQrpo7zv4qMXJaDoXUYzO@lists.infradead.org
X-Gm-Message-State: AOJu0YzyoJViQeD2ocTBTs27EVpDtjsfReA4G6JZSgDXvNvkB0WOaei5
	i40jgaeZtIE8Q6zo6tgDBbx4kfuXdgyPRtvseC7hCTwApVrhPCkTn/hVZoZEDjM=
X-Google-Smtp-Source: AGHT+IETETXmy3bVlftYj31VETRjI/RZSZyaUXBUvtgU+pcTALquMjFnjAZo0xxjEwQVBqO3LLhmzw==
X-Received: by 2002:a05:6512:b99:b0:539:f37f:bef2 with SMTP id 2adb3069b0e04-53b1a31f29dmr4081545e87.17.1729799212192;
        Thu, 24 Oct 2024 12:46:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224319b3sm1453550e87.210.2024.10.24.12.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:46:50 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:46:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <hc66u4jtl3ncjssmfmkzzxel4bkf74s5srml4ovrm3lrds2mvx@zsb4rfd637dp>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
 <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
 <3765cf3d-8477-45a7-af0e-b0c78f41eaad@kernel.org>
 <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>
 <170597c7-b8aa-4744-a44d-db5585545704@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170597c7-b8aa-4744-a44d-db5585545704@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_124654_160230_FF980476 
X-CRM114-Status: GOOD (  19.15  )
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

On Thu, Oct 24, 2024 at 03:29:05PM +0200, Krzysztof Kozlowski wrote:
> On 22/10/2024 09:25, Sibi Sankar wrote:
> > 
> > 
> > On 10/8/24 17:41, Krzysztof Kozlowski wrote:
> >> On 08/10/2024 14:10, Dmitry Baryshkov wrote:
> >>> On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
> >>>> On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> >>>>> +/*
> >>>>> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> >>>>> + *
> >>>>> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> >>>>> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> >>>>> + */
> >>>>> +#define QCOM_DDR_LEVEL_AUTO	0x0
> >>>>> +#define QCOM_DDR_LEVEL_PERF	0x1
> >>>>
> >>>> I could not find any driver using these. Can you point me to usage in
> >>>> the drivers?
> >>>
> >>> It's well hidden. These are the raw values used for DDR_QOS memory.
> >>
> >> So not a binding? Then these should be dropped.
> > 
> > I am not sure why the term "well hidden" was even considered :(
> > The driver just reads them from dt and passes them along. If you
> > want the dt to list magic numbers 0/1 instead I can do that as well.
> > 
> 
> If these are used by FW, then it's fine, although please document it
> clearly in comment.

If they are used by FW but they are common between all platforms, it
should go to the driver instead of being stuffed into DT.


-- 
With best wishes
Dmitry

