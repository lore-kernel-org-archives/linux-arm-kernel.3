Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AE6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frArfcOpIQD2D9bW2N7xZXNPJ/+lIcxv0oBptC1BH5c=; b=DrqJT9JCNSfPgzsTwR9H7UNgvQ
	NvOwaRTiWJqJo6LkaRxzYVv0uM1kc82wcxrG+akWiqJBwAe019o+gEHtLSDh3VFsr8/hQLDYpMYYG
	HWTNQ3IM0Wf03VO49FeFNdNURFU2g9O/pmwl5F2dyvNAaOyYNZVqBd+oZf1SEkukbBTRhLDbgNZPx
	sW9w8IubSkOqWITYDTxitAzVR4pGnzeOixIh7E7cQMB/uY4zNQtWnxNOT88xXzpIXoqaK3oLjOirS
	MrUhZ0q9JpQnK/lIjGmxbHHQx9M2HAHaODKKhnn2zLST38bAbzXfSkbQxotLXTWMq+nt0XT06s6dV
	4SaeQpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4ZR-0000000HDpn-3Q4Y;
	Fri, 27 Dec 2024 07:15:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4Xz-0000000HDaw-2tIV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 07:14:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so11016065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 23:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735283649; x=1735888449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=frArfcOpIQD2D9bW2N7xZXNPJ/+lIcxv0oBptC1BH5c=;
        b=uKMYd3Jk5OR8jqVg4CF8f3WDCV243pf3yi2mhEKWetV10mE4AFbpFQK4rx6xUoZCUj
         MtIWwc6El5PTnJ2G2yi7A85OM0zSALAdyQYWIRZjmhMKS3PlP+GATkE2KZ05MJQ5cVWC
         MNNdROYU/Mj/eCeVCibZS306IWKezyyGFc61c02TAM76iTCLhNbFbJhv6oeI/+SmqMIz
         jwXLDnacXIGLnTrFWvwoKQI0FDC17TFMGRBZfxYa7ICPm8s+k5h7E/woTSFkvEN4/SEr
         AL235cNhXkPlCpsJFlq7ojSS14SS1Ym9MPzFsfEq/vxwoDiHqc72hygYpipUD+p7fCwW
         FfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735283649; x=1735888449;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frArfcOpIQD2D9bW2N7xZXNPJ/+lIcxv0oBptC1BH5c=;
        b=Q9T1Or6ph/knY2j+JrEiLEoTWny7AMyUWMLvmL/w6nGk0cSbRCO9aLI87UIHuedWZo
         2nRNMRGiF76WnJgAh101uxqnVpNKGeZxgE1/6y/b4vLgyaJHPcpUm0aVSZUDY1OiMGUq
         NVsi/MYvY2mIfPMEg79pUyJKnT9WW5dXTt3xAAd3Xo4v2D1n4aTUJ3eD+8oB5loZgrhZ
         iZFBQw+5m7rq/AWiaDjLqx4fSR7B3ERCSRzgJSVKLCtWrNfw6/w6gmufWrzKId+fAU3U
         yMJR8TAnSUNNo/N0SGJkM6Hy03Ckippnoypk1hyTFcyeOahTzaWXK/R1eL24iRt8izgI
         wHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUZ78Ea1/FZGyDT/exVThr6qUju6mzDFnt0nNOHHJ+F2azRY3CDdNuM0kDhVb52ZW+JTLxvzXnZdP96f5yHtg/@lists.infradead.org
X-Gm-Message-State: AOJu0YxWLC2NSPqiV7amyIsZUu3c6F3r49+jr5+bGl2txIKifRnac7ct
	yKfQFtwyfJuWwHt2ZkxesgLFQonqMXPTto8iuH5xOTb1yDSWZhxVvNtAId97Wxg=
X-Gm-Gg: ASbGncvp1jJI52lBZto1EQzgQKC1+VLl4kn9URbIxZGCFtCMpc3exoavytk0mQKjEqF
	VKNtU6lB/6b98zjt/NaGkvB/Vz1LwA8plIoXW85PTh32MiJ3AoGwbAdtZDigz9zH0x3Ja00byWe
	Qq0BVVGmaHxqZ7BBnXYnOuUcdjgSRTnSGWI8YDYrXrOb6/K1sWeqo4g5kfSb+0TL6LGlerIjlWg
	3c1TdJIkleoT0d4p2qEx0LXICrlpQTyrNRjOx4GEGvj6RBocPvlpM4raskSH3fnOU36vk/VAWOv
X-Google-Smtp-Source: AGHT+IHGMnT9N8ZGhTsEAeR6OgbzNDuNXlwmbApK6j1in2vEtqAFfCzp8m3GGvL0hwmYp3IwlXUEKA==
X-Received: by 2002:a05:600c:a0a:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-43668b93b4fmr87670215e9.8.1735283649122;
        Thu, 26 Dec 2024 23:14:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4d7sm255443905e9.34.2024.12.26.23.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 23:14:08 -0800 (PST)
Message-ID: <b1e6e480-750c-4abd-9e13-6138c5e18284@linaro.org>
Date: Fri, 27 Dec 2024 08:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
 <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_231411_758132_56277858 
X-CRM114-Status: GOOD (  12.23  )
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

On 25/12/2024 09:58, Yijie Yang wrote:
> 
> 
> On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
>> On 24/12/2024 04:07, Yijie Yang wrote:
>>> The core version of EMAC on qcs615 has minor differences compared to that
>>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>>> and the Power-On Reset (POR) status of the registers isn't entirely
>>> consistent with sm8150 either.
>>> Therefore, it should be treated as a separate entity rather than a
>>> fallback option.
>>
>> ... and explanation of ABI impact? You were asked about this last time,
>> so this is supposed to end up here.
> 
> I actually replied to this query last time, but maybe it wasn't clear. 
> Firstly, no one is using Ethernet on this platform yet. Secondly, the 
> previous fallback to sm8150 is incorrect and causes packet loss. 
> Instead, it should fall back to qcs404.
> 
And if you send v3 with same commit msg, I will ask the same. Your
commit msg must answer to this.

Best regards,
Krzysztof

