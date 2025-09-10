Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CE7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhI8c9fUpWOPpWCEzFMrs816kFgN9hDlCR19oA75+ZA=; b=prIkSsXwaLTz6hPhdjjuhWDNaA
	a7u20LumSE0KRTy+acPdNwkwbNoBv8GF65bOp3s+2LfAnmdcieSP+mXgz9/7+Wb+S55Cj8hyYxQ6v
	B9aTx6FvXOTd5tvqnO7N7QSe69fWlGwzHjxeP4lorn5UTsor8q1qzhhd4MiuKMXHyJnN6QhP8Ytzh
	OFUBKjz1RtG97zPUfgmVdETo8mSn424Nlr0rCVw2SeH1eyAKoBYxup9hIw5qPVHf99TALykCUwPJn
	DUxU3dGmRpydt5gvYKioxILOAMlIaJUcSChoavmQW9ko7B+jGG9GzybqYZwVJ0xmLXywtStHECr96
	cMfC9Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLVN-0000000EbUb-2mVr;
	Wed, 10 Sep 2025 14:09:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLVL-0000000EbTr-42WE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:09:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so4433691f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757513338; x=1758118138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhI8c9fUpWOPpWCEzFMrs816kFgN9hDlCR19oA75+ZA=;
        b=PgNm21qWrN0zz5nxckGBxrtY75fkJP1HaGQPyJAqJJ0eD2HUxslxIyoHpIs2uovKXs
         +9Subu0ZFKy78V3K1wRRjkYLHlfaaQcOpKYcA+ZITQXvU90AbXNyJlPQF8G/7oWO88im
         fo7LSfvtOriAXXEYQNjW77FK5PGiy8td9IyDnKBHnLSkmnzkl1J0ecA8MjrtzveK2X/0
         KOyJhBp9R2ivfYOBOmlfozrmupd85+hvgzMHapQQw6WYi957x/6zxzZ6pRHMkOZMs9M7
         QltZInkjMb1PVJOkWQYt6F63xsaFTBAi+AWd5enP9kijvPsolJ9jy/wOcwiMmsmF+k+Q
         R7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513338; x=1758118138;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhI8c9fUpWOPpWCEzFMrs816kFgN9hDlCR19oA75+ZA=;
        b=pZna4pNVjvkOZMfC8YRNZM3sgwQMFawWSH4oIr2+21Oce1tRmeHeMtGPyqXfbGGolh
         MN4jdDI8/bc/L9hJ6YymOlk0cADOAQh61lnzPpNZ20yO+E6yt3jBayAZewyUjVTZSaC1
         jUXcHiIVTaXo/ZxyQmDghvZ+G8cWtgtXE6MWJWWZt4/Ms/3ZRdRvCLAsTLIQ7SpD0r/U
         X36HL6ABNTN6G1Aj+vhZFPcyXZzYZn9pA340etzgzHV8lUxZ80Lr7E5iZKmXCUn06cPx
         wxXUPxLJ85UlXkiyHzFsYCa4BkkLJp9R81lupWD7YdzGLvvn7c6Q0tclsbqJV4E4Idbp
         NmgQ==
X-Gm-Message-State: AOJu0YyN16NRb4hzqIr6qc4vz+GjZtK5m2Nf6AvZ45l2JIca0Y7V9Lt3
	dA9dzO9TLb9rCKuK/yfHDN0IaTTUOD66Rl+4mU3TBQV/MeUMuzTbHSlIlwLeZG9cnf0=
X-Gm-Gg: ASbGncsy9dATFfr7sJBIxcU16HYg6wlN/WQnqeXJslIl2ESPnQXGT8A7y7puoEg9pLp
	l2Gl3UydNEUe1LWhK6BBAkZefsLQRharUtpb0JlXaoucyIH62wVsBo2h+j0Ob8PdjRN80dxUAKH
	T2x3SDpqQbayuiozBVpzGDmuXN4WVpCt3BwrqpKgLEwl1wDk17Ekgb57/U+sDkZLQICsy8cTPAk
	/cdFEOspPPjY6Iwx+1lJSd7MQfo+3xo9/O8CA7X3Kw4XQN07dnEAXCmlo9nVL1GPh42zldlibHN
	YPd5eiK6YCCdj8/F57ic/ytITynGvlUo5egCTbbPnD8DQQyOLsT1BxL/sZOyLxGFGFO7Ymr0UM+
	C6eE0vykSlMG+rtSrpMhqiV4xBYjwHUgzdT4qL7dPRDYt6jwFthOBPXlCJePkH1ItWSLYxtE4xA
	OFeUqTAJlQibzR0vGQTglUJKH6DU5bfV3mxYZYwTau
X-Google-Smtp-Source: AGHT+IEU0i5tKvI1IML6r1qb9OCYAjtEaa8WFITlkibEW1V8pMtdtSftNzuAhODsfk/YrIRjrT2cRw==
X-Received: by 2002:a05:6000:24c1:b0:3e2:ac0:8c55 with SMTP id ffacd0b85a97d-3e643c1a48cmr13509406f8f.55.1757513338089;
        Wed, 10 Sep 2025 07:08:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223ea04sm6916892f8f.45.2025.09.10.07.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 07:08:57 -0700 (PDT)
Message-ID: <e72800d4-cb65-443b-be7e-0966a60fa5a9@linaro.org>
Date: Wed, 10 Sep 2025 15:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <21ea1149-9b61-487d-9afb-d3b8b41fe71a@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <21ea1149-9b61-487d-9afb-d3b8b41fe71a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_070900_039457_A9C3D68B 
X-CRM114-Status: GOOD (  11.01  )
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

On 10/09/2025 15:07, Krzysztof Kozlowski wrote:
> On 10/09/2025 12:49, Vikram Sharma wrote:
>> Add the compatible string "qcom,qcs8300-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>
>> The QCS8300 platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 3 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> 
> Fast review only as courtesy to Bryan:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Next time patch which cannot be compared to previous version and has
> broken threading will end up at end of the queue.
> 
> Best regards,
> Krzysztof

Appreciated

---
bod

