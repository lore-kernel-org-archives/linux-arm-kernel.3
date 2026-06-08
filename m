Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14E8CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1wz0gmvL+00jwYzggF0MlmA1dhQA7/85d2swuD/6js=; b=hcNIsjYIWJScgr069PhQCIv2I1
	nn4aShdZwiVHImI+ONejEDsnRgvUavOWMRRKf80k5A2t8FQzluGCkgITyHbX86byTlKRUa9Q3yb6n
	8esnUYmF0vpfDh3R9IS82L3jI0u6LjXq1orLPuaKkY3p8+MToGT+9wQ9R49uVXO23xIEKiO5D3zaZ
	n4EJP2OPOjKC0t0ShfCmaWoms9zHnwgcd6P6Du2TQMLZJDQO7jIYt73mCGGrzjn6PpiVk850Oyw5e
	X6SmJL3oia9/IdbyIzKNzpdwPwbdZRf3xJF0mSCqHBY4btdyu7IOyswRLLQQ3/xLHjOj9/ts427q9
	pW5Y0zAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWX2-00000003DEc-3AgD;
	Mon, 08 Jun 2026 09:44:32 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWX1-00000003DEA-1NVG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:44:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c85822059d8so2576155a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911870; x=1781516670; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1wz0gmvL+00jwYzggF0MlmA1dhQA7/85d2swuD/6js=;
        b=TsskDLJb0sHFVUs9lG37Y81x8Z74o2TRiY1KvIhoks/O7BHWQty32U4+TUFVvuiIrK
         uMZVKc/F4PGsWy3LBiTSocwoZ02DpFp5Tw1ennMbSjaeqBL5ug0x42wFSAdi7O8L/9Fs
         93a8hJO1KoyfNgtlud6Kqz5IM3MtVEBH+9CnuIlrvogl4HlOdmxdUZwBX8lxNBJwJvij
         DBgwp21J1psBUsdHdljL3vf2tVIWQcVC+tDflC96AnwMjSmT7x70oAVAUOiu2YKoU2Dh
         Nlp4CfFsUGymUNuPTP3PQPt2hSiDWzkG9i5zVkknkIAn1Eu0vs0vSxfEerXYHUOnNoCg
         M4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911870; x=1781516670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1wz0gmvL+00jwYzggF0MlmA1dhQA7/85d2swuD/6js=;
        b=rHIn09+AE8veHH4d55u7h/HzUP9PhxP/Ag33h6yaSN3MvPzmgzhYtW75FDoVmXPJl5
         Pex02JMG9glY+uNuoeodWe6ZUSZ9spJuPcytNT6x3IDnEOqJRtLufcHvFkAJAOQNghEH
         ejMMvqGF0UiCoNvrf6Kf4XPlFALvmuUekncotb072IIN2LAxNcY8n54mKtMsJX15H3qz
         M+N8s5fCjCRC80A1st4wfSghOneUrj3yQaS+P3VBKg/b8Vx82bS9hT7h/b9+5iKx5rkJ
         Sn0IQGp09nEhwPGafepkd8v5LR/3kpYuZuDxOhUJpXNWk4PdITFEw/0z8e4uEM3Pc8zQ
         mM/g==
X-Forwarded-Encrypted: i=1; AFNElJ8E+oXCEhLk5aWixtYwZb8oy/og9EzX8daG8sdFb4Co1Qnwbw1xMAqORQfALfclMEoiYzrntp1Tj0u+R1p2QBGJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy90lOUR/tMHyK5dr3KYV6HPtw6wKTGktRG5B+DF+B+Yrx8JHsH
	QnZaq1IVvAtEQEM+1E/slKkLIdImxyZF1LfPTNkcwUuUfDNiK91kTOQ6
X-Gm-Gg: Acq92OGC/GoPM6d4ZuHFN29l9yO+TA2/2EKdBoceVdUqJNjedTlDdNPrLbR5eDSbHuG
	Y87rpUBrWozVZYaud3aUG6nLgv5O0xnXvCo35t8U36yluECNx/p7Lq81T5fQI07Ykcn+PhxnWM4
	fpRg2JjO1b569rU7eOBR3of33346kH65QeIz09zCindDjUGbbaMpkkjCi8C1jWUcCLwJAliVGDE
	uJ256uspgRjl4WBhB+A+ReOwpypNz9uMB7eALX9hR9yRJ/XyLDuMEAWi5MpegNt6IhRI81cplXZ
	Zd/OvZDNNhoKyeu7KwjLjQ9PXXAPce7Vxs+OPtWN18d1Flod21LgevTaRP9IQpsPi9g/6m12cKA
	5NyYvC76o4hG68Iin2uyKwwd9mgyFUPILgJsiFzUxtG+mPX1lLWa8eFfYGH6ETSHf9ScTsJ/Fx2
	hyLS4pOmAs/u6HMbwfZKM6jeyHRMIPbCxCUhbKx9aFhvlZYfYVPqsIeQq7bEDpgqVV+/Mkd1p/Z
	QwZE3AgDk07d3c=
X-Received: by 2002:a05:6a20:d48f:b0:3aa:f9cb:d43a with SMTP id adf61e73a8af0-3b4cccf7d06mr15690657637.5.1780911870286;
        Mon, 08 Jun 2026 02:44:30 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df034ab9sm14584651a12.5.2026.06.08.02.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:44:29 -0700 (PDT)
Message-ID: <28292e35-f41c-4719-a5e0-cac4ab3884f2@gmail.com>
Date: Mon, 8 Jun 2026 17:44:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-2-a0987203069@gmail.com>
 <20260608-baboon-of-theoretical-stamina-6db63f@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260608-baboon-of-theoretical-stamina-6db63f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024431_381516_FC7B6655 
X-CRM114-Status: GOOD (  12.47  )
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


On 6/8/2026 4:02 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:32:33AM +0800, Joey Lu wrote:
>> The existing schema hard-codes the five-clock/three-reset/dual-port
>> topology of the DC8200 IP block, preventing reuse for single-output
>> variants such as the Verisilicon DCUltraLite used in the Nuvoton MA35D1
>> SoC.
>>
>> Rework the schema so that variant-specific constraints are expressed via
>> allOf/if blocks:
>>
>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
>>    generic verisilicon,dc fallback remains the driver-binding string.
>> - Relax the top-level clocks/resets definitions to minItems ranges so
>>    the base schema accepts both variants.
>> - Keep ports in the global required list and keep additionalProperties
>>    tightened to unevaluatedProperties.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb).
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
>>    one-reset (core).
>> - Fix a stray space in the port@0 description.
>> - Add a DT example for the Nuvoton MA35D1 DCU Lite using ports/port@0.
> Difference in clocks and resets does not need a new new example.
>
> Best regards,
> Krzysztof
Understood. I will remove the second example for nuvoton,ma35d1-dcu from 
the binding.

