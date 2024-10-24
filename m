Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C92D0E3F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGBoqND71236knReCQexeHrHy1YPglXydeKm7AcaSgw=; b=kn8810/ZNsI4/tL/vrkFIgzuyl
	L+QrR8b4gEVNMLATL49jE9sNHWUfnY9/lnevO3fQ+mgiKUFpWlNBDz9dme1eQkIcwp6fRHABXWkUV
	hftHbnDnUr9dpSjUjNSfJ4YV1ETJW12ZSBDmKpIy2bgBvkFQvfK8JyS4JKk6tQRlrNfFLMmLLGk3P
	W0Yd4lEkzeV9tsuI1YHjNN8dchHSvHY1l8Vy4a9oXF4rVn1JfGWMCmCU6AFZO46OACag9ii8acbFS
	ciRQwDEiCPc7sXIRHerhr+SXbaQCZL8gRBqowpqe53TLgV3S+25YDp6+3VV7r7bFk2NDznTdYd4Yn
	JmiCvENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44Gd-00000001hzP-3ms7;
	Thu, 24 Oct 2024 20:17:12 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43ot-00000001dw6-2NQm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 19:48:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1323978e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 12:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799310; x=1730404110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGBoqND71236knReCQexeHrHy1YPglXydeKm7AcaSgw=;
        b=WNICYRmsW7sBnKlH4q5yZW9dXnikH3lcVxA8UUtrTItz1QILXEk9wpW1Q+teOrnuuL
         Ur7hqqWvdQ12CH+g8Np3Z4YTrcgDUExqkEB+11s8lyaKjjIgzVt8RdBeXMmc26Xq/eEb
         DTP6naNEsS2Tc8Qz8CB6ioe5JPDsO5XU1dxv2HSQgpy7n2ibd4GjwR4MGhNov0AONAnz
         Te6kCcx/UMoXOMYyie2WYJ+liwTusC21uGKBKt9eDDUq+JYk5onwRxwulysE1z5pX1qQ
         A3voUxoSjPSA46cqcAYAMTta2KZWWIrySKekXWJOdoA3wbfYl99b8XmN1rWWEVuC5M4d
         M+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799310; x=1730404110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGBoqND71236knReCQexeHrHy1YPglXydeKm7AcaSgw=;
        b=w8DVTXqItmnsIQkL6bSNI8XWtokbTIDS9JbsAuS3dx4uY41OW2ALLV6O2XXnWCqvPi
         yOOirdFud+N4jcTiHinEXYPcLWzWywGQG8qMkGQQY63ZSpWzHHhcQkwlMSWptyVr987/
         MlSi8kBCU965mmiVekHTkZiU1Mqss9O5nwkP3r+2x8tw9FOoVM+kkgJvhQD9ObwQJw9K
         3fNE5rzdO7RBkmzhe0lnl06EBzQVHuTF/vOKnCrEHQwhy96sSX37PS6ZEzJzg6Pip5hJ
         S0yzsxk9/Si+t5rLv68LEa38aIOK4pAtJUh21xSpu7LxxflKMtul2Z3TREJnnoKRNPUo
         CBvA==
X-Forwarded-Encrypted: i=1; AJvYcCWCAYe/KaPW1LBpvPw0yBNurqLs3J3NMGAfrBS+2oYP8g0jeAjHxe5KXmssf6D1tbk9SpmuEF30Nl5rmtk7SUmr@lists.infradead.org
X-Gm-Message-State: AOJu0YwvyuZrxQSpnM3ytYxUHctJXQ8Wnt6ajzvnDLu5y49KthU5+aof
	ncnTHY67E7gC1ByUmT/0QH0G0L/VY7TspybZ4t/5glaeQVobKrN5dcPN85tWt3g=
X-Google-Smtp-Source: AGHT+IFxNfXsb6FF2TOOX13EEGKrWhQ/IAyagU629O/aokFyrD4j96vGZ/8XXEmR0CIVaotIUpg1zg==
X-Received: by 2002:a05:6512:230b:b0:52e:7542:f469 with SMTP id 2adb3069b0e04-53b23bc0b0fmr2106888e87.0.1729799309863;
        Thu, 24 Oct 2024 12:48:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2241ffc6sm1451111e87.179.2024.10.24.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:48:28 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <lewbl6nglqzvhe4ho7ayzqwj7xrgszqfrapqo46cwbfhsftptd@ap7l6zqpo275>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
 <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
 <3765cf3d-8477-45a7-af0e-b0c78f41eaad@kernel.org>
 <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_124831_633637_EA10B885 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, Oct 22, 2024 at 12:55:19PM +0530, Sibi Sankar wrote:
> 
> 
> On 10/8/24 17:41, Krzysztof Kozlowski wrote:
> > On 08/10/2024 14:10, Dmitry Baryshkov wrote:
> > > On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
> > > > On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> > > > > +/*
> > > > > + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> > > > > + *
> > > > > + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> > > > > + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> > > > > + */
> > > > > +#define QCOM_DDR_LEVEL_AUTO	0x0
> > > > > +#define QCOM_DDR_LEVEL_PERF	0x1
> > > > 
> > > > I could not find any driver using these. Can you point me to usage in
> > > > the drivers?
> > > 
> > > It's well hidden. These are the raw values used for DDR_QOS memory.
> > 
> > So not a binding? Then these should be dropped.
> 
> I am not sure why the term "well hidden" was even considered :(
> The driver just reads them from dt and passes them along. If you
> want the dt to list magic numbers 0/1 instead I can do that as well.

Well, it is well hidden, because e.g. Krzysztof could not find them
being used.

No, nobody asks for the magic numbers. Please drop them from DT and move
to the driver instead. And this is one additional bonus point for the
non-generic node names. ddr-qos is _different_ from all other "memory"
types. It doesn't have min/max values.

-- 
With best wishes
Dmitry

