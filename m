Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC558D6D248
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TszDdA28UmJNkLbj5Ys3Y092KyTg4JPf0GnkI2Cya8=; b=oC5OLolocyna4gvJogaj2+JTqm
	jWmM0u1oJtNBFLMGqiBfaLokpRcqfjbFjBCnqhgkbRgSOLqyxqXss/X6DjG9JYFNycO5W53ZLVt7z
	mzXhvlXa/GETAYhDDXghaxbcl0v0jfBxQKrM0OIlEHD6i3eSBHxaqaPCtiIlhvVvBUL57uZE4sUTc
	f0TEti0QBVObGEUF0epzlveZ2YxBWAnHPR6YXObdWuNFv9hljgCz3N0Iea9eoEVHXWkyhjqv3bMlV
	xjmoZmdp2RPlVKdfKjmtZHX4NUcR18M2EM9mo316y41qnyrov5h4ONewMQlgJfTQBTVAdBxFqjKYg
	2kOJP1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGRWf-0000000EGzQ-0xrG;
	Wed, 27 Nov 2024 23:32:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGRVg-0000000EGuY-1YFT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 23:31:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a742481aso1759795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 15:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732750310; x=1733355110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TszDdA28UmJNkLbj5Ys3Y092KyTg4JPf0GnkI2Cya8=;
        b=i/wZJD1mLormEXR2rH2lsnJXylaBrZNHnDgv/FQBx7N2bp7I9gwkQze3yOk5ptq7kl
         9V64WxmT4CM0Ub6UGQ/SVdcmXsGio9ygcYJMZbKiAzi8M3HqG/A8vH+Pi9ZB4KKEa/8Q
         uMbpuenqR2Lcb11oi6xyw7A6+FzCCGfUag3AeKWdLdYa4Q6p5IyrbCNM0EgIhZ1DVWvO
         l0LtbL7Zf7XrJ6/sswxT9ykCsYV5b/MtxUYVtmYZK0xe65yHLSen+nmbGV9KyQltTq/a
         u7p6DRizaJi/irJF3Kz9s+RalNtAruag9t0q9+zoqCzMQgEKRuta2Wo7eZq3LIBDTISI
         lKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732750310; x=1733355110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TszDdA28UmJNkLbj5Ys3Y092KyTg4JPf0GnkI2Cya8=;
        b=pjHXUYl9YWJDMrppGg/57+zfRixoL3k4IK+NnZngnMt7yAQu5ph2xG94psro9A+kTq
         IdBtRMOWSBz+fL/dvTcbKD6sMlcTTXIWUCllipjYk1yGY9JCeSr8hpy4vBqgeeOkRruB
         tW9yuCHPgCXg5tmsnOHATa4tqjcAzFmtUuiunEk1kSw9SrTPClGuEOE1M6kAJR17TNjX
         Cx0BnTj/hEMUKzkFxTDTgUVl48qQT4XjiTSbMJLgDU/X10MFeYNyBy8+L/95enLC7ich
         oFKGl2Sj/28ZfSaDnjz07jN7kjhX1eoNqTvhX0pc9aMaNGKESGHvAINiPn60Wr/VGLMx
         DV3w==
X-Gm-Message-State: AOJu0YzCeUakcLL8yVTEPrsySRYfoz8w6F/BWWsUxWv7wZzuCjazvbeP
	3nOMiGt2xYitiuzr1EzCoPrvaio1y9V0pwrbuD+raOkDM+yYWLCfy3iO8MDSQ7M=
X-Gm-Gg: ASbGncvUSQZcqfWf5TEfsybgVbxENZ+thM8zpzmWzzjH3ORNz4SWV8weAeSAdSRkUN8
	IUmJiO3aqvh4VMCOSfUXkLL2fp/Nd4sBAEvXvGV8Szuyz9XMOsLGD1rKQRCoXc7283/QgL29HV8
	qE8Hpu5z/CHN/qBoDQCRzVWY4aoRLiGR6G2Ql9cTSedapYekzKC5RdfB+w1q8y714xzOZ4vBCb0
	WjgUGFUm8LcP10txnM3SQWhKHgB2xE3eLNb4dn8JtWjPmynirblXx5wgJ6Z50g=
X-Google-Smtp-Source: AGHT+IHgjc2cPrbC0aZV2S7sqJrkCbPea2u3Owx10Tid0gPuuY71KlejV3dkLQN2GcvQx8LRjYj36g==
X-Received: by 2002:a05:600c:5101:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-434a9df71c6mr39451865e9.23.1732750309839;
        Wed, 27 Nov 2024 15:31:49 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc6831sm3374985e9.20.2024.11.27.15.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 15:31:48 -0800 (PST)
Message-ID: <25f89e78-faec-4eba-887b-019eed752064@linaro.org>
Date: Wed, 27 Nov 2024 23:31:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-2-quic_vikramsa@quicinc.com>
 <1a87e9d9-da7e-4b8b-807e-f56aa15acfc2@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1a87e9d9-da7e-4b8b-807e-f56aa15acfc2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_153152_467776_F15FD0D5 
X-CRM114-Status: GOOD (  10.21  )
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

On 27/11/2024 12:57, Vladimir Zapolskiy wrote:
>>
>> +        camss: camss@acaf000 {
>> +            compatible = "qcom,sc7280-camss";
>> +
>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>> +                  <0x0 0x0acc8000 0x0 0x1000>,
> 
> Unsurprisingly above is the error, which has been already reported for
> enumerous amount of times, I wish to stop poking it eventually, please
> reference to the previously given review comments and fix all of them
> before sending a new version of the changes.

So just to be clear what is wrong here because it may not be clear.

1. Sort by IP name
2. The first address @ reg should be equal to the address @ camss

-> Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml

     camss: camss@1b00020 {
         compatible = "qcom,msm8953-camss";

         reg = <0x1b00020 0x10>,
               <0x1b30000 0x100>,
               <0x1b30400 0x100>,
               <0x1b30800 0x100>,
               <0x1b34000 0x1000>,
               <0x1b00030 0x4>,
               <0x1b35000 0x1000>,
               <0x1b00038 0x4>,
               <0x1b36000 0x1000>,
               <0x1b00040 0x4>,
               <0x1b31000 0x500>,
               <0x1b10000 0x1000>,
               <0x1b14000 0x1000>;
         reg-names = "csi_clk_mux",
                     "csid0",
                     "csid1",
                     "csid2",
                     "csiphy0",
                     "csiphy0_clk_mux",
                     "csiphy1",
                     "csiphy1_clk_mux",
                     "csiphy2",
                     "csiphy2_clk_mux",
                     "ispif",
                     "vfe0",
                     "vfe1";
So:

         camss: camss@acaf000 {
             compatible = "qcom,sc7280-camss";

             reg = <0x0 0x0acaf000 0x0 0x4000>,
                   <0x0 0x0acb3000 0x0 0x1000>,
                   <0x0 0x0acc8000 0x0 0x1000>,
                   <0x0 0x0acba000 0x0 0x1000>,
                   <0x0 0x0accf000 0x0 0x1000>,
                   <0x0 0x0acc1000 0x0 0x1000>,
                   <0x0 0x0ace0000 0x0 0x2000>,
                   <0x0 0x0ace2000 0x0 0x2000>,
                   <0x0 0x0ace4000 0x0 0x2000>,
                   <0x0 0x0ace6000 0x0 0x2000>,
                   <0x0 0x0ace8000 0x0 0x2000>,
                   <0x0 0x0acc4000 0x0 0x4000>,
                   <0x0 0x0acb6000 0x0 0x4000>,
                   <0x0 0x0accb000 0x0 0x4000>,
                   <0x0 0x0acbd000 0x0 0x4000>;
             reg-names = "vfe0",
                         "csid0",
                         "csid0_lite",
                         "csid1",
                         "csid1_lite",
                         "csid2",
                         "csiphy0",
                         "csiphy1",
                         "csiphy2",
                         "csiphy3",
                         "csiphy4",
                         "vfe0_lite",
                         "vfe1",
                         "vfe1_lite",
                         "vfe2";
:(
---
bod

