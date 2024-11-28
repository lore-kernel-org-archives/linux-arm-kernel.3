Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC3ED690EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/W+eYtBA0K7MiFNuTWTEaMbtArpeNHfybJbxvLhrBp4=; b=gyj3RoxodPYIpgMb+GrbzXULID
	lO9T+YwaseJ+H8E3EhoGLIZXAVSPKhoHS2UV25kam8t5guCdy6cDN/dqTMYYDJmRaMY2g9DNRzJxU
	+7TsgRZEKxKy9LkuzSYWpZ42PZ2uJvd5lu4ei7U+wvJhAlK4iRUiUSBOKpwRJWCcoPKjjG21mHJhP
	86CPLUnQDuCnuyPqegCFLZWpdidEuZrw9YcjJbkRPE5UrgoBlzFcX0SHcfgsoHoQz2xOQiKFErfB7
	I9XUCt1P2+RgfqfhNsEbxL3T0iu0VqSvwzjLT3lQtb1x9uQ/pfGjTpHZQB7TOrXV0vUBTA77mqVdc
	vD1gMR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaLc-0000000F5ad-0wQR;
	Thu, 28 Nov 2024 08:58:04 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaHr-0000000F4lR-378x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:54:13 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ffcd3c2b46so238361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 00:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732784050; x=1733388850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W+eYtBA0K7MiFNuTWTEaMbtArpeNHfybJbxvLhrBp4=;
        b=FZtcBfh/IfV4RSR0E09BpCNaLdycB6LjVB+Tt4aufS7LMwcBpHXWc018q1BjGSGGa7
         y8wnqqBe4DlnuCtSA6trWEgkYTVt9yMNO9cOBbu+z49B3uucdaXzqnz/WhQq3W4IDJDa
         TgoJHqgZL6Eu918qsO6GNeUjjGB2hRjau9cDokYW6Js8c6PglDplo45LIzJwD3MWmoiW
         K8nH3PZQIeKYBgCFJzCnfWD9ompAqn538MX9dEnSh0OcJr1jWSgrUlbUlQEm58xCZJ+q
         4a2zhi1ipiCIhb2OwgtmsqNq+ur9/biodwZTQ3+i4A44K6X+46teAbgkojFWYBgOzUsd
         yzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784050; x=1733388850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/W+eYtBA0K7MiFNuTWTEaMbtArpeNHfybJbxvLhrBp4=;
        b=fOj09MDTtZdUVvL9hWDR8UgcSKYRn+EAYQDj6G79T/TaOXMm4HAYtqVsbLtW5vQk6E
         vQB7SDmFBpSjNnGwtuaLO68eGRmA178/W7ncBg6rNL+os8HGwEqrDTA2wuXyqEcgQnmB
         W3nz/crxf5xXElVAEy/m7O1L1+8hklWFjSlwdWxpEtY4MltEVISEgzuH5SlXgCiQ5qa0
         tEau8HVRqlLOEx9fz/d+x/ZGqKcRyhOv0XNAFW0YOOAVvsvArKaBGBDIZjhs7DoTr2Mm
         lkXbQulOzEb6XswAsFioItEHcSJn1uzC23tbIICwqIH7vErP4LEU4WjecGh1mazUv4bF
         4ZNg==
X-Gm-Message-State: AOJu0YyzwLtXOuOtDFrU6jBQBzd9RRtJn2h/2jV0jfXvFx2ZJaI/3Sk/
	4yVVH3krirYwe0HuwK+tLMClHRAqjAx+xCwlITCnL1I2hQdfF3ooftQruopT4oM=
X-Gm-Gg: ASbGncvswLpZR5KfDaqvE3sSzFRDFJ61Hb5XIiJP9b20mZPe2RXhi0+N5y5A/1zjUFY
	rT8s6EzGabd5j/47a7f6RI9m157r8f9AAy+qwnnYd39fUOyCdYYk+YtKrTMg5HwR4XVwEzCmmhn
	/0RwZ1ZvTA6gd/3K9OjSSWq5tdvsSUeXu1y1F2miHbXhlVEjBgM5j/3p0kRrrx8FD3nc/vIJzB8
	+Cf28JJ+7CeEKO8z97AITBVfmpzxrB7qtMU0KhBg757b34h0MKfG+SpklBsV10IYr/fABVR8dMO
	3qWNoPuDUG0XcFMe+RTGJdlyiWjC
X-Google-Smtp-Source: AGHT+IHV3a56IUZQzYTe6GHWJjVxI2dvKif7m/fkToU2b9Jrm3M3uttjabmeH44i0IqdBu6iIkTEIQ==
X-Received: by 2002:a05:6512:ba8:b0:53d:ddcc:5143 with SMTP id 2adb3069b0e04-53df00ffeccmr750775e87.10.1732784049654;
        Thu, 28 Nov 2024 00:54:09 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649671asm113813e87.191.2024.11.28.00.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:54:08 -0800 (PST)
Message-ID: <e7f5f84d-d7cd-4052-bc8c-1b1e5f2a0073@linaro.org>
Date: Thu, 28 Nov 2024 10:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add qcom,sc7280-camss
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <25f89e78-faec-4eba-887b-019eed752064@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <25f89e78-faec-4eba-887b-019eed752064@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_005411_807908_1028698B 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Bryan,

On 11/28/24 01:31, Bryan O'Donoghue wrote:
> On 27/11/2024 12:57, Vladimir Zapolskiy wrote:
>>>
>>> +        camss: camss@acaf000 {
>>> +            compatible = "qcom,sc7280-camss";
>>> +
>>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>>> +                  <0x0 0x0acc8000 0x0 0x1000>,
>>
>> Unsurprisingly above is the error, which has been already reported for
>> enumerous amount of times, I wish to stop poking it eventually, please
>> reference to the previously given review comments and fix all of them
>> before sending a new version of the changes.
> 
> So just to be clear what is wrong here because it may not be clear.
> 
> 1. Sort by IP name
> 2. The first address @ reg should be equal to the address @ camss
> 
> -> Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> 
>       camss: camss@1b00020 {
>           compatible = "qcom,msm8953-camss";
> 
>           reg = <0x1b00020 0x10>,
>                 <0x1b30000 0x100>,
>                 <0x1b30400 0x100>,
>                 <0x1b30800 0x100>,
>                 <0x1b34000 0x1000>,
>                 <0x1b00030 0x4>,
>                 <0x1b35000 0x1000>,
>                 <0x1b00038 0x4>,
>                 <0x1b36000 0x1000>,
>                 <0x1b00040 0x4>,
>                 <0x1b31000 0x500>,
>                 <0x1b10000 0x1000>,
>                 <0x1b14000 0x1000>;
>           reg-names = "csi_clk_mux",
>                       "csid0",
>                       "csid1",
>                       "csid2",
>                       "csiphy0",
>                       "csiphy0_clk_mux",
>                       "csiphy1",
>                       "csiphy1_clk_mux",
>                       "csiphy2",
>                       "csiphy2_clk_mux",
>                       "ispif",
>                       "vfe0",
>                       "vfe1";
> So:
> 
>           camss: camss@acaf000 {
>               compatible = "qcom,sc7280-camss";
> 
>               reg = <0x0 0x0acaf000 0x0 0x4000>,
>                     <0x0 0x0acb3000 0x0 0x1000>,
>                     <0x0 0x0acc8000 0x0 0x1000>,
>                     <0x0 0x0acba000 0x0 0x1000>,
>                     <0x0 0x0accf000 0x0 0x1000>,
>                     <0x0 0x0acc1000 0x0 0x1000>,
>                     <0x0 0x0ace0000 0x0 0x2000>,
>                     <0x0 0x0ace2000 0x0 0x2000>,
>                     <0x0 0x0ace4000 0x0 0x2000>,
>                     <0x0 0x0ace6000 0x0 0x2000>,
>                     <0x0 0x0ace8000 0x0 0x2000>,
>                     <0x0 0x0acc4000 0x0 0x4000>,
>                     <0x0 0x0acb6000 0x0 0x4000>,
>                     <0x0 0x0accb000 0x0 0x4000>,
>                     <0x0 0x0acbd000 0x0 0x4000>;
>               reg-names = "vfe0",
>                           "csid0",
>                           "csid0_lite",
>                           "csid1",
>                           "csid1_lite",
>                           "csid2",
>                           "csiphy0",
>                           "csiphy1",
>                           "csiphy2",
>                           "csiphy3",
>                           "csiphy4",
>                           "vfe0_lite",
>                           "vfe1",
>                           "vfe1_lite",
>                           "vfe2";

So, apparently it is the third and the new proposed order of sorting. Any
following scheme is worse than the previous one in my opinion, but why not.

--
Best wishes,
Vladimir

