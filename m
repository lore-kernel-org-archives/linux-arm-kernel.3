Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=; b=Kw3nUQYZWW5pXmci71XOsytCcU
	z5p2RPG+eVBsIsB7nCli6fqc+z1Auk+oPt8lx2n9ZH++XJf6zoNoRMQVSta85W1zJTNmS91P2oKpL
	VNJPUAEYn6RSciRZ8Gh2ljc0u83pvc+rQZDL5mf65QS21ODqEluv4T97k2UsVZOTw8tkEMzkKu6PU
	87eKh6UeLhNmD4TOqiQG/g8pbd/xiDiTiO2JykfYGLIob+WSu5mIO/ipCRs/DXhG11GzleqRLgPbN
	crjVJXZGJEWZ6SaujQYccPx0JqGMAjv5EYxklPF47OMQl0mn+hrFrhhSY46xVtTYA4Te+BzDfZ301
	UF7CcslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ON9-00000004vxE-0FrF;
	Thu, 16 Oct 2025 13:50:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ON7-00000004vwz-4Axu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Oct 2025 13:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=; b=jQoICJMWB6dbud3MfsvIOQjzX9
	xTUsProqwdcCrr5lpp+FXDHDC3CpLDm/M7X3wifOK4TeYq4cmus3SYv18KQ775ZWyU1AjoVgRQT7t
	ApZ59Kb0Utco3ie6ytzBCpYLBEq5LP4cn85Zi0EBbfcoR+oD9pSSbJ0KGmfbJIZF9NLxWxoXt4WKF
	LL6YZ7I1J4yXsDl1SWR/zjK7PBCnC47qTbQNGeDwhTt+l6YbjXnJLrbc4CC6p29R4J9o1MuMJMTj4
	UwwB/mcUHTORk6yYfTK575gvVCPDnMn+V+fQZFpYfALcbMMeehmVMBzX/S6rCKCKwIdJES5IAEDkZ
	yVD2uECQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OMw-00000006mCm-1AKX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 13:50:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46b303f7469so6240885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622611; x=1761227411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=;
        b=B1vCYfZlMZNlQSrcw5klQQVcgadXEigELKwkw/yJphxcYLJyLGGZV/ETBPA9C3DnRR
         M3ZTZhbVFz3QPYQJyrvJ3X+qEPEVJA7qjmiKZMviDlN5g/mD0fYGNCCU5DmzTjOYT9QB
         zNeDle9ePG/6NQ/pu80YFOKsFhI4/7qFTV4r2k1g3Qn17c76h2URCTEsp98LZtjJkauM
         Hh/9OMtKPfFM57eBEsP9NRiB01Ui5H/6hGFCJlPrc6p9eBinigyF3RtbLuDRvl3Io6z+
         XT7nF2K5KPiDt+4kwi1+VQ916GoofYC930Yh2W6XfbvruphLpS4EROaziymskTfoVTcW
         SFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622611; x=1761227411;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=;
        b=H5lT6UlpICUj7AGNoYS8RXO5O6bxEd5mAiK7V9pgf18XU+zqEytLQstyEiukawDd4t
         zE5uy1M8YCqrDVcKL8kiyGQZl0XkVqtRr4wlTTAo8DKyFCvr86vRkxbDb8fveGijT2xv
         SERzP6VoZ7l0aqZ6kQLQfrgQkWC7uTMCoTe/4GVy90G33d16nFN/oxuhXNgGk4BEAEa/
         QISkmQI4a8JZod4xmvfHREKcyqsMh/SOFNj9M6LAwPOXECmxL2BTCKC5W3u1149yEQTq
         X81+mfY0ki7UosO1MzJP85FCso4+dJWU0R5gO2Xuyr/Bev8TI7bNN1C3xYwTm3mDGw8x
         Fdzg==
X-Gm-Message-State: AOJu0Yypxpn4cpLmwEZgqd6eVj4n5bTWopEoW+sARg8ToeLVDZeQA3V5
	4Ar8meCg+1UxvhvaHRc6rxVrC0YyJFTsgBETV3b506ZsIStu5/4wenqFpXRMI2VQypc=
X-Gm-Gg: ASbGncvMhgVejFZYIt193+q9QiAXmXxm7tCtishPxM8uhT72cBJy2nclRqa9pM0poRi
	7s5B+25zEKO/ljfCl1o2XzM53gUACxpYPRLUX4V2KyNlofN/m4POgh5MB9jWKbueaiiVHMXBqRG
	04nWcNbz3AwczXC9X56vj2ietQrEJjZcCDZzkp2Ay2n7bCRbCIH/8AItqUzE4ZZSw82oCZjXX8z
	9B+C7jXQK/6cyiFRB//Gx9za5HWr8S92A4ZkKFyj3u7X+Pd7Rgghl2qHfbMFozHRJXgPEOnSrC9
	Zn3eXOqMD3Upf23zrf34B0seVbMIkQB1aYC1qu9pXZh8obJp+M90sTkh5in06pHGExUc7BZjipt
	xBR/LDOJPAjGVkWMmrfW/kUlox3wYBQkqAku/nFnRgtfCQ1EdmFG/JKRTzQbDcyykUJiiYnRtQu
	0d8cwX6c+AEQbIdsD95Xjj2pNHUOSl3SAzkk4K0SrmFvzMyg==
X-Google-Smtp-Source: AGHT+IF9O9+CY3yIGfpHSEcpC2cDiM18bV3XDDECDyPk3t/QicECJpvFVoKsQOEP0AiZOjlLD65hPA==
X-Received: by 2002:a05:600c:37c7:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-4711790c31emr154255e9.23.1760622610858;
        Thu, 16 Oct 2025 06:50:10 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42704141cdfsm1629287f8f.4.2025.10.16.06.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:50:10 -0700 (PDT)
Message-ID: <f1cc3212-f1b0-497a-9990-8d523a0f9c61@linaro.org>
Date: Thu, 16 Oct 2025 14:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
 <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
 <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_145019_217922_5E53DBA2 
X-CRM114-Status: GOOD (  13.40  )
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

On 16/10/2025 13:53, Nihal Kumar Gupta wrote:
>> I'd suggest to add a description of pins with MCLK function in a separate
>> change to the SoC specific .dtsi file. It will cover gpio67, gpio68, gpio74
>> and gpio69, so here it's a MCLK1 pin for instance.
> We are currently enabling sensor only on CCI1.  Pins gpio67–gpio69 are used by mclk for cam0–cam2, and gpio74 enables the regulator.
> Since mclk is sensor-specific, it's added in the sensor dtso.
> 
> Would it be appropriate to extend mclk support to all CCI instances, even if some are not actively used?
> 
> @Konrad, @Bryan, Could you please share your thoughts on the above?
> 
> If valid, then cam0_default, cam1_default, cam2_default should be added in SoC dtsi, with references used in sensor dtso.

Anything not muxed should go into the SoC description anything board 
specific - mezzanine specific in this case - should go into your dtso.

A few of the camera pins are non-muxed as I recall.

As regards splitting it up.

There's no use-case for non-muxed pins without the dependent change.

It's almost never the wrong thing to do, to have small, individually 
independent patches though.

---
bod

